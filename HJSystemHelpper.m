//
//  HJSystemHelpper.m
//  hj
//
//  Created by jian huang on 2017/4/13.
//  Copyright © 2017年 hj. All rights reserved.
//

#import "HJSystemHelpper.h"
#import "AFNetworking.h"
#import "GDataXMLNode.h"

@interface HJSystemHelpper()
@property (nonatomic,strong) GDataXMLDocument *xmlDocument;
@end

@implementation HJSystemHelpper

+(instancetype)sharedInstance{
    static dispatch_once_t once;
    static HJSystemHelpper *instance = nil;
    dispatch_once(&once, ^{
        instance = [[self alloc] init];
    });
    return instance;
}


-(GDataXMLDocument *)xmlDocument{
    if (!_xmlDocument) {
        NSString *xmlPath = [[NSBundle mainBundle] pathForResource:@"systemConfig"ofType:@"xml"];
        NSString *xmlString = [NSString stringWithContentsOfFile:xmlPath encoding:NSUTF8StringEncoding error:nil];
        _xmlDocument = [[GDataXMLDocument alloc] initWithXMLString:xmlString options:0 error:nil];
    }
    return _xmlDocument;
}



-(NSString *)getSystemConfigWithPath:(NSString *)path{
    if (path) {
        GDataXMLElement *xmlEle = [self.xmlDocument rootElement];
        NSArray *array = [xmlEle children];
        for (int i = 0; i<array.count; i++) {
            GDataXMLElement *ele = array[i];
            if ([path containsString:@"."]) {
                NSRange range = [path rangeOfString:@"."];
                NSString *path1 = [path substringToIndex:range.location];
                NSString *path2 = [path substringFromIndex:NSMaxRange(range)];
                if ([ele.name isEqualToString:@"catalog"]) {
                    if ([[[ele attributeForName:@"name"] stringValue] isEqualToString:path1]) {
                        NSArray *subArray = [ele children];
                        for (int j = 0; j<subArray.count; j++) {
                            GDataXMLElement *subEle = subArray[j];
                            if ([[[subEle attributeForName:@"name"] stringValue] isEqualToString:path2]) {
                                return [subEle attributeForName:@"value"].stringValue;
                            }
                        }
                    }
                }
            }else{
                if ([ele.name isEqualToString:@"item"]) {
                    if ([[[ele attributeForName:@"name"] stringValue] isEqualToString:path]) {
                        return [[ele attributeForName:@"value"] stringValue];
                    }
                }
            }
        }
        
    }
    return nil;
}

-(void)clickNetworkReachabilityStatus{
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager manager];
    [manager startMonitoring];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTI_NET_DID_CHANGE object:[NSNumber numberWithInt:status]];
    }];
}


@end

