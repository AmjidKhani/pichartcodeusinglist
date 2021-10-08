import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class pichart extends StatefulWidget{

  @override
  _pichartState createState()=>_pichartState();
}
  class _pichartState extends State<pichart> {
  @override
  late List<GDPData> _chartData;
  late TooltipBehavior _tooltipBehavior;
l
  void initState(){
    _tooltipBehavior=TooltipBehavior(enable: true);
    _chartData=getChartData();
    super.initState();
  }
  Widget build(BuildContext context) {
   return SafeArea(
        child: SfCircularChart(
          title: ChartTitle(text:"Sallary Calculatore Output In Pi Chart",),
               legend:
          Legend(isVisible: true,overflowMode: LegendItemOverflowMode.wrap),
             tooltipBehavior: _tooltipBehavior,
               series: [
                 PieSeries<GDPData,String>(
                   dataSource: _chartData,
                   xValueMapper: (GDPData data,_)=>data.continent,
                   yValueMapper: (GDPData data,_)=>data.gdp,
dataLabelSettings: DataLabelSettings(isVisible:true,),
                   enableTooltip: true)

               ],
             ),


         );


  }
List<GDPData> getChartData(){
    final List<GDPData>charData=[
      GDPData("Haripur", 1600),
      GDPData("Abbotabad", 2200),
      GDPData("Haripur", 100),
    ];
    return charData;
}
}
class GDPData{
  GDPData(this.continent,this.gdp);
  final String continent;
  final int gdp;
}