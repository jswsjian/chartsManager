//
//  HJChartsManager.m
//  hj
//
//  Created by jian huang on 2017/6/1.
//  Copyright © 2017年 hj. All rights reserved.
//

#import "HJChartsManager.h"
#import "HJSystemHelpper.h"

@implementation HJChartsManager
//绘制多条折现图
+(LineChartView *)drawLineChartWithFrame:(CGRect)frame delegate:(id<ChartViewDelegate>)delegate charts:(NSArray <HJChartsGraphModel *>*)charts chartsLabel:(NSString *)chartsLabel{
    LineChartView *view = [[LineChartView alloc]initWithFrame:frame];
    view.delegate = delegate;
    NSMutableArray *graphs = [NSMutableArray array];
    for (int i = 0; i<charts.count; i++) {
        NSArray *values = [self getLineDataEntriesWithChart:charts[i]];
        LineChartDataSet *dataSet = [[LineChartDataSet alloc] initWithValues:values label:charts[i].label];
        dataSet.colors = charts[i].colors;
        //设置相关属性
        [graphs addObject:dataSet];
    }
    LineChartData *chartData = [[LineChartData alloc] initWithDataSets:graphs];
//    ChartLimitLine *chartLimit = [[ChartLimitLine alloc] initWithLimit:60];
//    [view.rightAxis addLimitLine:chartLimit];
    view.data = chartData;
    view.chartDescription.text = chartsLabel;
    [view animateWithYAxisDuration:0.5 easingOption:ChartEasingOptionEaseInBounce];
    [self setLineChartsUI:view];
    return view;
}

+(void)setLineChartsUI:(LineChartView *)view{
    if ([[HJSystemHelpper sharedInstance] getSystemConfigWithPath:@"lineChart.scaleEnabled"]) {
        view.scaleXEnabled = [[HJSystemHelpper sharedInstance] getSystemConfigWithPath:@"lineChart.scaleEnabled"].boolValue;
        view.scaleYEnabled = [[HJSystemHelpper sharedInstance] getSystemConfigWithPath:@"lineChart.scaleEnabled"].boolValue;
    }
    if ([[HJSystemHelpper sharedInstance] getSystemConfigWithPath:@"lineChart.dragEnabled"]) {
        view.dragEnabled = [[HJSystemHelpper sharedInstance] getSystemConfigWithPath:@"lineChart.dragEnabled"].boolValue;
    }
    if ([[HJSystemHelpper sharedInstance] getSystemConfigWithPath:@"lineChart.doubleTapToZoomEnabled"]) {
        view.doubleTapToZoomEnabled = [[HJSystemHelpper sharedInstance] getSystemConfigWithPath:@"lineChart.doubleTapToZoomEnabled"].boolValue;
    }
    if ([[HJSystemHelpper sharedInstance] getSystemConfigWithPath:@"lineChart.dragDecelerationEnabled"]) {
        view.dragDecelerationEnabled = [[HJSystemHelpper sharedInstance] getSystemConfigWithPath:@"lineChart.dragDecelerationEnabled"].boolValue;
    }
    if ([[HJSystemHelpper sharedInstance] getSystemConfigWithPath:@"lineChart.AxisLineWidth"]) {
        view.xAxis.axisLineWidth = [[HJSystemHelpper sharedInstance] getSystemConfigWithPath:@"lineChart.AxisLineWidth"].doubleValue;
        view.leftAxis.axisLineWidth = [[HJSystemHelpper sharedInstance] getSystemConfigWithPath:@"lineChart.AxisLineWidth"].doubleValue;
    }
    if ([[HJSystemHelpper sharedInstance] getSystemConfigWithPath:@"lineChart.labelPosition"]) {
        NSString *configStr = [[HJSystemHelpper sharedInstance] getSystemConfigWithPath:@"lineChart.labelPosition"];
        if ([configStr isEqualToString:@"top"]) {
            view.xAxis.labelPosition = XAxisLabelPositionTop;
        }else if([configStr isEqualToString:@"bottom"]){
            view.xAxis.labelPosition = XAxisLabelPositionBottom;
        }
    }
    if ([[HJSystemHelpper sharedInstance] getSystemConfigWithPath:@"lineChart.drawGridLinesEnabled"]) {
        view.leftAxis.drawGridLinesEnabled = [[HJSystemHelpper sharedInstance] getSystemConfigWithPath:@"lineChart.drawGridLinesEnabled"].boolValue;
        view.xAxis.drawGridLinesEnabled = [[HJSystemHelpper sharedInstance] getSystemConfigWithPath:@"lineChart.drawGridLinesEnabled"].boolValue;
    }
    if ([[HJSystemHelpper sharedInstance] getSystemConfigWithPath:@"lineChart.rightAxisEnabled"]) {
        view.rightAxis.enabled = [[HJSystemHelpper sharedInstance] getSystemConfigWithPath:@"lineChart.rightAxisEnabled"].boolValue;
    }
    if ([[HJSystemHelpper sharedInstance] getSystemConfigWithPath:@"lineChart.inverted"]) {
        view.leftAxis.inverted = [[HJSystemHelpper sharedInstance] getSystemConfigWithPath:@"lineChart.inverted"].boolValue;
    }
}


//绘制折现图
+(LineChartView *)drawLineChartWithFrame:(CGRect)frame delegate:(id<ChartViewDelegate>)delegate chart:(HJChartsGraphModel *)chart chartsLabel:(NSString *)chartsLabel{
    LineChartView *view = [[LineChartView alloc]initWithFrame:frame];
    view.delegate = delegate;
    LineChartDataSet *dataSet = [[LineChartDataSet alloc] initWithValues:[self getLineDataEntriesWithChart:chart] label:chart.label];
    dataSet.colors = chart.colors;
    LineChartData *chartData = [[LineChartData alloc] initWithDataSet:dataSet];
    view.data = chartData;
    view.chartDescription.text = chartsLabel;
    [view animateWithYAxisDuration:0.5 easingOption:ChartEasingOptionEaseInBounce];
    return view;
}

+(NSMutableArray *)getLineDataEntriesWithChart:(HJChartsGraphModel *)chart{
    NSMutableArray *dataEntries = [NSMutableArray array];
    for (int i = 0; i<chart.entries.count; i++) {
        HJChartsEntryModle *modle = chart.entries[i];
        UIImage *image = modle?[UIImage imageNamed:modle.iconName]:nil;
        ChartDataEntry *entry = [[ChartDataEntry alloc] initWithX:modle.x y:modle.y icon:image data:modle.data];
        [dataEntries addObject:entry];
    }
    return dataEntries;
}


//绘制柱状图

+(BarChartView *)drawBarChartWithFram:(CGRect)frame delegate:(id<ChartViewDelegate>)delegate chart:(HJChartsGraphModel *)chart chartsLabel:(NSString *)chartsLabel{
    BarChartView *barView = [[BarChartView alloc] initWithFrame:frame];
    barView.delegate = delegate;
    NSMutableArray *entries = [self getBarDataEntriesWithChart:chart];
    BarChartDataSet *dataSet = [[BarChartDataSet alloc] initWithValues:entries label:chart.label];
    dataSet.colors = chart.colors;
    BarChartData *chartData = [[BarChartData alloc] initWithDataSet:dataSet];
    chartData.barWidth = 0.25;
    [chartData groupBarsFromX:0.85 groupSpace:0.25 barSpace:0];
    barView.data = chartData;
    barView.chartDescription.text = chartsLabel;
    [barView animateWithYAxisDuration:0.5 easingOption:ChartEasingOptionEaseInBounce];
    return barView;
}
+(BarChartView *)drawBarChartWithFram:(CGRect)frame delegate:(id<ChartViewDelegate>)delegate charts:(NSArray <HJChartsGraphModel *>*)charts chartsLabel:(NSString *)chartsLabel{
    BarChartView *barView = [[BarChartView alloc] initWithFrame:frame];
    barView.delegate = delegate;
    NSMutableArray *dataSets = [NSMutableArray array];
    for (int i = 0; i<charts.count; i++) {
        NSArray *values = [self getBarDataEntriesWithChart:charts[i]];
        BarChartDataSet *dataSet = [[BarChartDataSet alloc] initWithValues:values label:charts[i].label];
        dataSet.colors = charts[i].colors;
        //设置相关属性
        [dataSets addObject:dataSet];
    }
    BarChartData *chartData = [[BarChartData alloc] initWithDataSets:dataSets];
    chartData.barWidth = 0.25;
    [chartData groupBarsFromX:0.85 groupSpace:0.25 barSpace:0];
    
    barView.data = chartData;
    barView.chartDescription.text = chartsLabel;
    [barView animateWithYAxisDuration:0.5 easingOption:ChartEasingOptionEaseInBounce];
    return barView;
}

+(NSMutableArray *)getBarDataEntriesWithChart:(HJChartsGraphModel *)chart{
    NSMutableArray *dataEntries = [NSMutableArray array];
    for (int i = 0; i<chart.entries.count; i++) {
        HJChartsEntryModle *modle = chart.entries[i];
        UIImage *image = modle?[UIImage imageNamed:modle.iconName]:nil;
        BarChartDataEntry *entry;
        if (modle.values) {
            entry = [[BarChartDataEntry alloc] initWithX:modle.x yValues:modle.values icon:image data:modle.data];
        }else{
           entry = [[BarChartDataEntry alloc] initWithX:modle.x y:modle.y icon:image data:modle.data];
        }
        [dataEntries addObject:entry];
    }
    return dataEntries;
}



//绘制K线
+(CandleStickChartView *)drawCandleStickChartWithFrame:(CGRect)frame delegate:(id<ChartViewDelegate>)delegate chart:(HJChartsGraphModel *)chart chartsLabel:(NSString *)chartsLabel{
    CandleStickChartView *candleStick = [[CandleStickChartView alloc] initWithFrame:frame];
    candleStick.delegate = delegate;
    NSMutableArray *entries = [self getCandleDataEntriesWithChart:chart];
    CandleChartDataSet *dataSet = [[CandleChartDataSet alloc] initWithValues:entries label:chart.label];
    dataSet.colors = chart.colors;
    CandleChartData *chartData = [[CandleChartData alloc] initWithDataSet:dataSet];
    candleStick.data = chartData;
    candleStick.chartDescription.text = chartsLabel;
    [candleStick animateWithYAxisDuration:0.5 easingOption:ChartEasingOptionEaseInBounce];
    return candleStick;
}
+(CandleStickChartView *)drawCandleStickChartWithFrame:(CGRect)frame delegate:(id<ChartViewDelegate>)delegate charts:(NSArray <HJChartsGraphModel *>*)charts chartsLabel:(NSString *)chartsLabel{
    CandleStickChartView *candleStick = [[CandleStickChartView alloc] initWithFrame:frame];
    candleStick.delegate = delegate;
    NSMutableArray *dataSets = [NSMutableArray array];
    for (int i = 0; i<charts.count; i++) {
        NSArray *values = [self getCandleDataEntriesWithChart:charts[i]];
        CandleChartDataSet *dataSet = [[CandleChartDataSet alloc] initWithValues:values label:charts[i].label];
        dataSet.colors = charts[i].colors;
        //设置相关属性
        [dataSets addObject:dataSet];
    }
    CandleChartData *chartData = [[CandleChartData alloc] initWithDataSets:dataSets];
    candleStick.data = chartData;
    candleStick.chartDescription.text = chartsLabel;
    [candleStick animateWithYAxisDuration:0.5 easingOption:ChartEasingOptionEaseInBounce];
    return candleStick;
}


+(NSMutableArray *)getCandleDataEntriesWithChart:(HJChartsGraphModel *)chart{
    NSMutableArray *dataEntries = [NSMutableArray array];
    for (int i = 0; i<chart.entries.count; i++) {
        HJChartsEntryModle *modle = chart.entries[i];
        UIImage *image = modle?[UIImage imageNamed:modle.iconName]:nil;
        CandleChartDataEntry *entry = [[CandleChartDataEntry alloc]initWithX:modle.x shadowH:modle.shadowH shadowL:modle.shadowL open:modle.open close:modle.close icon:image data:modle.data];
        [dataEntries addObject:entry];
    }
    return dataEntries;
}

//绘制饼状图
+(PieChartView *)drawPieChartWithFrame:(CGRect)frame delegate:(id<ChartViewDelegate>)delegate chart:(HJChartsGraphModel *)chart chartsLabel:(NSString *)chartsLabel{
    PieChartView *pieView = [[PieChartView alloc] initWithFrame:frame];
    pieView.delegate = delegate;
    NSMutableArray *entries = [self getPieDataEntriesWithChart:chart];
    PieChartDataSet *dataSet = [[PieChartDataSet alloc] initWithValues:entries label:chart.label];
    dataSet.colors = chart.colors;
    PieChartData *chartData = [[PieChartData alloc] initWithDataSet:dataSet];
    pieView.data = chartData;
    pieView.chartDescription.text = chartsLabel;
    [pieView animateWithYAxisDuration:0.5 easingOption:ChartEasingOptionEaseInBounce];
    return pieView;
}
+(PieChartView *)drawPieChartWithFrame:(CGRect)frame delegate:(id<ChartViewDelegate>)delegate charts:(NSArray <HJChartsGraphModel *>*)charts chartsLabel:(NSString *)chartsLabel{
    PieChartView *pieView = [[PieChartView alloc] initWithFrame:frame];
    pieView.delegate = delegate;
    NSMutableArray *dataSets = [NSMutableArray array];
    for (int i = 0; i<charts.count; i++) {
        NSArray *values = [self getPieDataEntriesWithChart:charts[i]];
        PieChartDataSet *dataSet = [[PieChartDataSet alloc] initWithValues:values label:charts[i].label];
        dataSet.colors = charts[i].colors;
        //设置相关属性
        [dataSets addObject:dataSet];
    }
    PieChartData *chartData = [[PieChartData alloc] initWithDataSets:dataSets];
    pieView.data = chartData;
    pieView.chartDescription.text = chartsLabel;
    [pieView animateWithYAxisDuration:0.5 easingOption:ChartEasingOptionEaseInBounce];
    return pieView;
}


+(NSMutableArray *)getPieDataEntriesWithChart:(HJChartsGraphModel *)chart{
    NSMutableArray *dataEntries = [NSMutableArray array];
    for (int i = 0; i<chart.entries.count; i++) {
        HJChartsEntryModle *modle = chart.entries[i];
        UIImage *image = modle?[UIImage imageNamed:modle.iconName]:nil;
        PieChartDataEntry *entry = [[PieChartDataEntry alloc]initWithValue:modle.value label:modle.label icon:image data:modle.data];
        [dataEntries addObject:entry];
    }
    return dataEntries;
}


//绘制雷达图
+(RadarChartView *)drawRadarChartWithFrame:(CGRect)frame delegate:(id<ChartViewDelegate>)delegate chart:(HJChartsGraphModel *)chart chartsLabel:(NSString *)chartsLabel{
    RadarChartView *radar = [[RadarChartView alloc] initWithFrame:frame];
    radar.delegate = delegate;
    NSMutableArray *entries = [self getRadarDataEntriesWithChart:chart];
    RadarChartDataSet *dataSet = [[RadarChartDataSet alloc] initWithValues:entries label:chart.label];
    dataSet.colors = chart.colors;
    RadarChartData *chartData = [[RadarChartData alloc] initWithDataSet:dataSet];
    radar.data = chartData;
    radar.chartDescription.text = chartsLabel;
    [radar animateWithYAxisDuration:0.5 easingOption:ChartEasingOptionEaseInBounce];
    return radar;
}
+(RadarChartView *)drawRadarChartWithFrame:(CGRect)frame delegate:(id<ChartViewDelegate>)delegate charts:(NSArray <HJChartsGraphModel *>*)charts chartsLabel:(NSString *)chartsLabel{
    RadarChartView *radar = [[RadarChartView alloc] initWithFrame:frame];
    radar.delegate = delegate;
    NSMutableArray *dataSets = [NSMutableArray array];
    for (int i = 0; i<charts.count; i++) {
        NSArray *values = [self getRadarDataEntriesWithChart:charts[i]];
        RadarChartDataSet *dataSet = [[RadarChartDataSet alloc] initWithValues:values label:charts[i].label];
        dataSet.colors = charts[i].colors;
        //设置相关属性
        [dataSets addObject:dataSet];
    }
    RadarChartData *chartData = [[RadarChartData alloc] initWithDataSets:dataSets];
    radar.data = chartData;
    radar.chartDescription.text = chartsLabel;
    [radar animateWithYAxisDuration:0.5 easingOption:ChartEasingOptionEaseInBounce];
    return radar;
}


+(NSMutableArray *)getRadarDataEntriesWithChart:(HJChartsGraphModel *)chart{
    NSMutableArray *dataEntries = [NSMutableArray array];
    for (int i = 0; i<chart.entries.count; i++) {
        HJChartsEntryModle *modle = chart.entries[i];
        RadarChartDataEntry *entry = [[RadarChartDataEntry alloc]initWithValue:modle.value data:modle.data];
        [dataEntries addObject:entry];
    }
    return dataEntries;
}


@end
