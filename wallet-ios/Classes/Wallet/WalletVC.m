//
//  WalletVC.m
//  wallet-ios
//
//  Created by mac on 2019/1/7.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "WalletVC.h"

#import "TransferVC.h"
#import "AssetsDetailVC.h"
#import "AFNetworking.h"

@interface WalletVC ()
@property (weak, nonatomic) IBOutlet UIView *topContainer;
@property (weak, nonatomic) IBOutlet UILabel *totalCNY;
@property (weak, nonatomic) IBOutlet UIView *verticalDivider;
@property (weak, nonatomic) IBOutlet UIView *eosItem;
@property (weak, nonatomic) IBOutlet UIView *bhkdItem;

@property (weak, nonatomic) IBOutlet UILabel *eosPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *eosBalanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *eosCNYLabel;
@property (weak, nonatomic) IBOutlet UILabel *bhkdPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *bhkdBalanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *bhkdCNYLabel;

@property (copy, nonatomic) NSString *account;
@property (assign, nonatomic) double eosPrice;
@property (assign, nonatomic) double eosBalance;
@property (assign, nonatomic) double bhkdPrice;
@property (assign, nonatomic) double bhkdBalance;
@end

@implementation WalletVC

- (instancetype)init {
    if (self = [super init]) {
        //TODO
        self.account = @"nqohkpxqjtiu";
        self.eosBalance = -1;
        self.bhkdBalance = -1;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.account;
    self.tabBarItem.title = @"钱包";
    [self setupViews];
    [self loadData];
}

- (void)setupViews {
    self.topContainer.backgroundColor = BaseColor;
    self.verticalDivider.backgroundColor = [UIColor colorWithHex:0xd8d8d8];
    
    UITapGestureRecognizer *tapEOSItemGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(eosItemTapped:)];
    [self.eosItem addGestureRecognizer:tapEOSItemGesture];
    
    UITapGestureRecognizer *tapBHKDItemGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bhkdItemTapped:)];
    [self.bhkdItem addGestureRecognizer:tapBHKDItemGesture];
}

- (void)loadData {
    [self getEOSPrice];
    [self getBHKDPrice];
    [self getEOSBalance];
    [self getBHKDBalance];
}

- (void)updateTotalCNY {
    if (self.eosPrice > 0 && self.eosBalance > -1 && self.bhkdPrice > 0 && self.bhkdBalance > -1) {
        double totalCNY = self.eosPrice * self.eosBalance + self.bhkdPrice * self.bhkdBalance;
        [self.totalCNY setText:[NSString stringWithFormat:@"≈%.2f CNY", totalCNY]];
    }
}

- (void)updateEOSPrice {
    [self updateTotalCNY];
    if (self.eosPrice > 0) {
        [self.eosPriceLabel setText:[NSString stringWithFormat:@"¥%.2f", self.eosPrice]];
        if (self.eosBalance > -1) {
            [self.eosCNYLabel setText:[NSString stringWithFormat:@"≈ ¥%.2f", self.eosPrice * self.eosBalance]];
        }
    }
}

- (void)updateEOSBalance {
    [self updateTotalCNY];
    if (self.eosBalance > -1) {
        [self.eosBalanceLabel setText:[NSString stringWithFormat:@"%.4f", self.eosBalance]];
        if (self.eosPrice > 0) {
            [self.eosCNYLabel setText:[NSString stringWithFormat:@"≈ ¥%.2f", self.eosPrice * self.eosBalance]];
        }
    }
}

- (void)updateBHKDPrice {
    [self updateTotalCNY];
    if (self.bhkdPrice > 0) {
        [self.bhkdPriceLabel setText:[NSString stringWithFormat:@"¥%.2f", self.bhkdPrice]];
        if (self.bhkdBalance > -1) {
            [self.bhkdCNYLabel setText:[NSString stringWithFormat:@"≈ ¥%.2f", self.bhkdPrice * self.bhkdBalance]];
        }
    }
}

- (void)updateBHKDBalance {
    [self updateTotalCNY];
    if (self.bhkdBalance > -1) {
        [self.bhkdBalanceLabel setText:[NSString stringWithFormat:@"%.4f", self.bhkdBalance]];
        if (self.bhkdPrice > 0) {
            [self.bhkdCNYLabel setText:[NSString stringWithFormat:@"≈ ¥%.2f", self.bhkdPrice * self.bhkdBalance]];
        }
    }
}

- (void)getEOSPrice {
    ILog(@"getEOSPrice. url = %@", HTTP_GET_EOS_PRICE);
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    [manager GET:HTTP_GET_EOS_PRICE parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSString *res = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        self.eosPrice = [res doubleValue];
        [self updateEOSPrice];
        ILog(@"getEOSPrice. res = %f", self.eosPrice);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        ILog(@"getEOSPrice. error = %@", error);
    }];
}

- (void)getEOSBalance {
    ILog(@"getEOSBalance. url = %@", HTTP_GET_BALANCE);

    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:self.account, @"account", EOSIO_TOKEN_CONTRACT, @"code", @(YES), @"json", @"EOS", @"symbol", nil];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager setRequestSerializer:[AFJSONRequestSerializer serializer]];
    [manager POST:HTTP_GET_BALANCE parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        self.eosBalance = 0;
        NSArray *array = responseObject;
        if (array != nil && [array count] > 0) {
            NSString *res = [array objectAtIndex:0];
            NSArray *strArray = [res componentsSeparatedByString:@" "];
            if (strArray != nil && [strArray count] > 0) {
                self.eosBalance = [[strArray objectAtIndex:0] doubleValue];
            }
        }
        [self updateEOSBalance];
        ILog(@"getEOSBalance. res = %f", self.eosBalance);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        ILog(@"getEOSBalance. error = %@", error);
    }];
}

- (void)getBHKDPrice {
    ILog(@"getBHKDPrice. url = %@", HTTP_GET_EOS_PRICE);
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    [manager GET:HTTP_GET_BHKD_PRICE parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSString *res = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        self.bhkdPrice = [res doubleValue];
        [self updateBHKDPrice];
        ILog(@"getBHKDPrice. res = %f", self.bhkdPrice);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        ILog(@"getBHKDPrice. error = %@", error);
    }];
}

- (void)getBHKDBalance {
    ILog(@"getBHKDBalance. url = %@", HTTP_GET_BALANCE);
    
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:self.account, @"account", BHKD_TOKEN_CONTRACT, @"code", @(YES), @"json", @"BHKD", @"symbol", nil];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager setRequestSerializer:[AFJSONRequestSerializer serializer]];
    [manager POST:HTTP_GET_BALANCE parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        self.bhkdBalance = 0;
        NSArray *array = responseObject;
        if (array != nil && [array count] > 0) {
            NSString *res = [array objectAtIndex:0];
            NSArray *strArray = [res componentsSeparatedByString:@" "];
            if (strArray != nil && [strArray count] > 0) {
                self.bhkdBalance = [[strArray objectAtIndex:0] doubleValue];
            }
        }
        [self updateBHKDBalance];
        ILog(@"getBHKDBalance. res = %f", self.bhkdBalance);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        ILog(@"getBHKDBalance. error = %@", error);
    }];
}

- (IBAction)receiptButtonClicked:(id)sender {
    ILog(@"receiptButtonClicked");
}

- (IBAction)transferButtonClicked:(id)sender {
    TransferVC *transferVC = [[TransferVC alloc] initWithDict:@{@"EOS_BALANCE": [NSNumber numberWithDouble:self.eosBalance],
                                                                @"BHKD_BALANCE": [NSNumber numberWithDouble:self.bhkdBalance],
                                                                @"ACCOUNT": self.account}];
    [self.navigationController pushViewController:transferVC animated:YES];
}

- (void)eosItemTapped:(UITapGestureRecognizer *)gesture {
    [self pushAssetsDetailVC:@"EOS" assetsPrice:self.eosPrice];
}

- (void)bhkdItemTapped:(UITapGestureRecognizer *)gesture {
    [self pushAssetsDetailVC:@"BHKD" assetsPrice:self.bhkdPrice];
}

- (void)pushAssetsDetailVC:(NSString *)assetsType assetsPrice:(double)price {
    AssetsDetailVC *vc = [[AssetsDetailVC alloc] initWithDict:@{@"EOS_BALANCE": [NSNumber numberWithDouble:self.eosBalance],
                                                                @"BHKD_BALANCE": [NSNumber numberWithDouble:self.bhkdBalance],
                                                                @"ACCOUNT": self.account,
                                                                @"ASSETS_TYPE": assetsType,
                                                                @"ASSETS_PRICE": [NSNumber numberWithDouble:price]}];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
