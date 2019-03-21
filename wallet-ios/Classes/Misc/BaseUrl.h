//
//  wallet-ios
//
//  Created by fresh on 2019/1/10.
//  Copyright © 2019年 mac. All rights reserved.
//

#ifndef BaseUrl_h
#define BaseUrl_h

//url
#define HTTP_ADDRESS @"http://122.152.214.84:8080"
#define HTTP_GET_EOS_PRICE [HTTP_ADDRESS stringByAppendingString:@"/eos/getprice"]
#define HTTP_GET_BHKD_PRICE [HTTP_ADDRESS stringByAppendingString:@"/rate/hkdcny"]

#define HTTP_CHAIN_ADDRESS @"http://39.108.231.157:30065/v1"
#define HTTP_GET_BALANCE [HTTP_CHAIN_ADDRESS stringByAppendingString:@"/chain/get_currency_balance"]

#endif /* BaseUrl_h */
