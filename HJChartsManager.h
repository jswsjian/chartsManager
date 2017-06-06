//
//  HJChartsManager.h
//  hj
//
//  Created by jian huang on 2017/6/1.
//  Copyright © 2017年 hj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Charts/Charts-Swift.h>
#import "HJChartsGraphModel.h"

@interface HJChartsManager : NSObject

/**
 *
 *  绘制折现图
 *  @param frame 大小
 *  @param delegate 代理
 *  @param chart 折线对象
 *  @param chartsLabel 表格名称
 *
 *  @return LineChartView对象
 */
+(LineChartView *)drawLineChartWithFrame:(CGRect)frame delegate:(id<ChartViewDelegate>)delegate chart:(HJChartsGraphModel *)chart chartsLabel:(NSString *)chartsLabel;

/**
 *
 *  绘制多条折现图
 *
 *  @param frame 大小
 *  @param delegate 代理
 *  @param charts 折线对象数组
 *  @param chartsLabel 表格名称
 *
 *
 *  @return LineChartView对象
 */
+(LineChartView *)drawLineChartWithFrame:(CGRect)frame delegate:(id<ChartViewDelegate>)delegate charts:(NSArray <HJChartsGraphModel *>*)charts chartsLabel:(NSString *)chartsLabel;



/**
 *  @Author 黄坚, 2017-3-17 9:00:00
 *  绘制柱状图
 *  @param frame 大小
 *  @param delegate 代理
 *  @param chart 柱状对象
 *  @param chartsLabel 表格名称
 *
 *  @return BarChartView
 */
+(BarChartView *)drawBarChartWithFram:(CGRect)frame delegate:(id<ChartViewDelegate>)delegate chart:(HJChartsGraphModel *)chart chartsLabel:(NSString *)chartsLabel;

/**
 *  @Author 黄坚, 2017-3-17 9:00:00
 *  绘制多柱状图
 *  @param frame 大小
 *  @param delegate 代理
 *  @param charts 柱状数组对象
 *  @param chartsLabel 表格名称
 *
 *  @return BarChartView
 */
+(BarChartView *)drawBarChartWithFram:(CGRect)frame delegate:(id<ChartViewDelegate>)delegate charts:(NSArray <HJChartsGraphModel *>*)charts chartsLabel:(NSString *)chartsLabel;


/**
 *  @Author 黄坚, 2017-3-17 9:00:00
 *
 *  K线图绘制
 *  @param frame 大小
 *  @param delegate 代理
 *  @param chart K线对象
 *  @param chartsLabel 表格名称
 *
 *  @return CandleStickChartView
 */
+(CandleStickChartView *)drawCandleStickChartWithFrame:(CGRect)frame delegate:(id<ChartViewDelegate>)delegate chart:(HJChartsGraphModel *)chart chartsLabel:(NSString *)chartsLabel;

/**
 *  @Author 黄坚, 2017-3-17 9:00:00
 *
 *  多条K线图绘制
 *  @param frame 大小
 *  @param delegate 代理
 *  @param charts k线数组对象
 *  @param chartsLabel 表格名称
 *
 *  @return CandleStickChartView
 */
+(CandleStickChartView *)drawCandleStickChartWithFrame:(CGRect)frame delegate:(id<ChartViewDelegate>)delegate charts:(NSArray <HJChartsGraphModel *>*)charts chartsLabel:(NSString *)chartsLabel;


/**
 *  @Author 黄坚, 2017-3-17 9:00:00
 *
 *  饼状图绘制
 *  @param frame 大小
 *  @param delegate 代理
 *  @param chart 饼状图对象
 *  @param chartsLabel 表格名称
 *
 *  @return PieChartView
 */
+(PieChartView *)drawPieChartWithFrame:(CGRect)frame delegate:(id<ChartViewDelegate>)delegate chart:(HJChartsGraphModel *)chart chartsLabel:(NSString *)chartsLabel;

/**
 *  @Author 黄坚, 2017-3-17 9:00:00
 *
 *  多饼状图绘制
 *  @param frame 大小
 *  @param delegate 代理
 *  @param charts 饼状图数组对象
 *  @param chartsLabel 表格名称
 *
 *  @return PieChartView
 */
+(PieChartView *)drawPieChartWithFrame:(CGRect)frame delegate:(id<ChartViewDelegate>)delegate charts:(NSArray <HJChartsGraphModel *>*)charts chartsLabel:(NSString *)chartsLabel;

/**
 *  @Author 黄坚, 2017-3-17 9:00:00
 *
 *  雷达图绘制
 *  @param frame 大小
 *  @param delegate 代理
 *  @param chart 雷达图对象
 *  @param chartsLabel 表格名称
 *
 *  @return RadarChartView
 */
+(RadarChartView *)drawRadarChartWithFrame:(CGRect)frame delegate:(id<ChartViewDelegate>)delegate chart:(HJChartsGraphModel *)chart chartsLabel:(NSString *)chartsLabel;

/**
 *  @Author 黄坚, 2017-3-17 9:00:00
 *
 *  多雷达图绘制
 *  @param frame 大小
 *  @param delegate 代理
 *  @param charts 雷达图数组对象
 *  @param chartsLabel 表格名称
 *
 *  @return RadarChartView
 */
+(RadarChartView *)drawRadarChartWithFrame:(CGRect)frame delegate:(id<ChartViewDelegate>)delegate charts:(NSArray <HJChartsGraphModel *>*)charts chartsLabel:(NSString *)chartsLabel;


@end
