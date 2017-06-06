//
//  HJChartsEntryModle.m
//  hj
//
//  Created by jian huang on 2017/6/2.
//  Copyright © 2017年 hj. All rights reserved.
//

#import "HJChartsEntryModle.h"

@implementation HJChartsEntryModle

-(instancetype)initWithX:(double)X Y:(double)Y iconName:(NSString *)iconName data:(id)data label:(NSString *)label values:(NSArray <NSNumber *>*)values shadowH:(double)shadowH shadowL:(double)shadowL open:(double)open close:(double)close value:(double)value{
    if (self = [super init]) {
        _x = X;
        _y = Y;
        _iconName = iconName;
        _data = data;
        _values = values;
        _shadowH = shadowH;
        _shadowL = shadowL;
        _open = open;
        _close = close;
        _value = value;
    }
    return self;
}

-(instancetype)initWithLineX:(double)X Y:(double)Y iconName:(NSString *)iconName data:(id)data{
    return [self initWithX:X Y:Y iconName:iconName data:data label:nil values:nil shadowH:0 shadowL:0 open:0 close:0 value:0];
}

-(instancetype)initWithLineX:(double)X Y:(double)Y{
    return [self initWithLineX:X Y:Y iconName:nil data:nil];
}


-(instancetype)initWithBarX:(double)X values:(NSArray <NSNumber *>*)values label:(NSString *)label iconName:(NSString *)iconName data:(id)data{
    return [self initWithX:X Y:0 iconName:iconName data:data label:label values:values shadowH:0 shadowL:0 open:0 close:0 value:0];
}
-(instancetype)initWithBarX:(double)X Y:(double)Y label:(NSString *)label iconName:(NSString *)iconName data:(id)data{
    return [self initWithX:X Y:Y iconName:iconName data:data label:label values:nil shadowH:0 shadowL:0 open:0 close:0 value:0];
}
-(instancetype)initWithBarX:(double)X Y:(double)Y{
    return [self initWithBarX:X Y:Y label:nil iconName:nil data:nil];
}
-(instancetype)initWithBarX:(double)X values:(NSArray <NSNumber *>*)values{
    return [self initWithBarX:X values:values label:nil iconName:nil data:nil];
}

-(instancetype)initWithCandleX:(double)X iconName:(NSString *)iconName data:(id)data shadowH:(double)shadowH shadowL:(double)shadowL open:(double)open close:(double)close{
    return [self initWithX:X Y:0 iconName:iconName data:data label:nil values:nil shadowH:shadowH shadowL:shadowL open:open close:close value:0];
}
-(instancetype)initWithCandleX:(double)X shadowH:(double)shadowH shadowL:(double)shadowL open:(double)open close:(double)close;{
    return [self initWithCandleX:X iconName:nil data:nil shadowH:shadowH shadowL:shadowL open:open close:close];
}
-(instancetype)initWithPieIconName:(NSString *)iconName data:(id)data label:(NSString *)label value:(double)value{
    return [self initWithX:0 Y:0 iconName:iconName data:data label:label values:nil shadowH:0 shadowL:0 open:0 close:0 value:value];
}

-(instancetype)initWithPieValue:(double)value{
    return [self initWithPieIconName:nil data:nil label:nil value:value];
}
-(instancetype)initWithRadarData:(id)data label:(NSString *)label value:(double)value{
    return [self initWithX:0 Y:0 iconName:nil data:data label:label values:nil shadowH:0 shadowL:0 open:0 close:0 value:value];
}
-(instancetype)initWithRadarValue:(double)value{
    return [self initWithRadarData:nil label:nil value:value];
}

@end
