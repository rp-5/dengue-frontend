import 'package:dengue/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class OverTheYears extends StatefulWidget {
  const OverTheYears({Key? key}) : super(key: key);

  @override
  OverTheYearsState createState() => OverTheYearsState();
}

class OverTheYearsState extends State<OverTheYears> {
  late List<charts.Series<DengueHuman, String>> _seriesData;
  late List<charts.Series<NumInfeccoes, int>> _seriesLineData;

  _generateData() {
    var data1 = [
      new DengueHuman('Sem suspeita', 64, Color(0xff109618)),
      new DengueHuman('Suspeitos', 77, Color.fromARGB(255, 50, 145, 223)),
      new DengueHuman('Confirmados', 23, Color.fromARGB(255, 186, 34, 39)),
      new DengueHuman('Descartados', 56, Color(0xffff9900)),
    ];

    var linesalesdata = [
      new NumInfeccoes(15, 22),
      new NumInfeccoes(16, 23),
      new NumInfeccoes(17, 45),
      new NumInfeccoes(18, 56),
      new NumInfeccoes(19, 55),
      new NumInfeccoes(20, 60),
      new NumInfeccoes(21, 61),
      new NumInfeccoes(22, 70),
    ];

    

    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff990099)),
        id: 'Número de Infecções',
        data: linesalesdata,
        domainFn: (NumInfeccoes numInfeccoes, _) => numInfeccoes.yearval,
        measureFn: (NumInfeccoes numInfeccoes, _) => numInfeccoes.infecval,
      ),
    );

    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff990099)),
        id: 'Número de Infecções',
        data: linesalesdata,
        domainFn: (NumInfeccoes numInfeccoes, _) => numInfeccoes.yearval,
        measureFn: (NumInfeccoes numInfeccoes, _) => numInfeccoes.infecval,
      ),
    );

    _seriesData.add(
      charts.Series(
        domainFn: (DengueHuman dengueHuman, _) => dengueHuman.status,
        measureFn: (DengueHuman dengueHuman, _) => dengueHuman.quantity,
        id: 'Humano',
        data: data1,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (DengueHuman dengueHuman, _) =>
            charts.ColorUtil.fromDartColor(dengueHuman.colorvalue),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // ignore: deprecated_member_use
    _seriesData = <charts.Series<DengueHuman, String>>[];
    // ignore: deprecated_member_use
    _seriesLineData = <charts.Series<NumInfeccoes, int>>[];
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.secondary,
            //backgroundColor: Color(0xff308e1c),
            bottom: TabBar(
              indicatorColor: Color(0xff9962D0),
              tabs: [
                Tab(
                  text: 'Dengue em humanos',
                  icon: const Icon(FeatherIcons.users),
                ),
                Tab(
                  text: 'Dengue em anos',
                  icon: const Icon(FeatherIcons.clock)),

                // Tab(
                //   text:'Dados do mosquito',
                //   icon: const Icon(FeatherIcons.barChart)),
              ],
            ),
            title: Text('Dados da Dengue'),
          ),
          body: TabBarView(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Registros de Dengue em Humanos',
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: charts.BarChart(
                            _seriesData,
                            animate: true,
                            barGroupingType: charts.BarGroupingType.grouped,
                            //behaviors: [new charts.SeriesLegend()],
                            animationDuration: Duration(seconds: 5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Casos confirmados ao longo dos anos',
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: charts.LineChart(_seriesLineData,
                              defaultRenderer: new charts.LineRendererConfig(
                                  includeArea: true, stacked: true),
                              animate: true,
                              animationDuration: Duration(seconds: 2),
                              behaviors: [
                                new charts.ChartTitle('Ano',
                                    behaviorPosition:
                                        charts.BehaviorPosition.bottom,
                                    titleOutsideJustification: charts
                                        .OutsideJustification.middleDrawArea),
                                new charts.ChartTitle('Número de casos',
                                    behaviorPosition:
                                        charts.BehaviorPosition.start,
                                    titleOutsideJustification: charts
                                        .OutsideJustification.middleDrawArea),
                                new charts.ChartTitle(
                                  'Casos confirmados',
                                  behaviorPosition: charts.BehaviorPosition.end,
                                  titleOutsideJustification: charts
                                      .OutsideJustification.middleDrawArea,
                                )
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DengueHuman {
  String status;
  int quantity;
  Color colorvalue;
  DengueHuman(this.status, this.quantity, this.colorvalue);
}

class NumInfeccoes {
  int yearval;
  int infecval;
  NumInfeccoes(this.yearval, this.infecval);
}
