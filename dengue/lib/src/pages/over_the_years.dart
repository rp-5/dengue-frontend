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
      DengueHuman('Sem suspeita', 64, const Color(0xff109618)),
      DengueHuman('Suspeitos', 77, const Color.fromARGB(255, 50, 145, 223)),
      DengueHuman('Confirmados', 23, const Color.fromARGB(255, 186, 34, 39)),
      DengueHuman('Descartados', 56, const Color(0xffff9900)),
    ];

    var linesalesdata = [
      NumInfeccoes(15, 22),
      NumInfeccoes(16, 23),
      NumInfeccoes(17, 45),
      NumInfeccoes(18, 56),
      NumInfeccoes(19, 55),
      NumInfeccoes(20, 60),
      NumInfeccoes(21, 61),
      NumInfeccoes(22, 70),
    ];

    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) =>
            charts.ColorUtil.fromDartColor(const Color(0xff990099)),
        id: 'Número de Infecções',
        data: linesalesdata,
        domainFn: (NumInfeccoes numInfeccoes, _) => numInfeccoes.yearval,
        measureFn: (NumInfeccoes numInfeccoes, _) => numInfeccoes.infecval,
      ),
    );

    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) =>
            charts.ColorUtil.fromDartColor(const Color(0xff990099)),
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
    super.initState();
    _seriesData = <charts.Series<DengueHuman, String>>[];
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
            bottom: const TabBar(
              indicatorColor: Color(0xff9962D0),
              tabs: [
                Tab(
                  text: 'Dengue em humanos',
                  icon: Icon(FeatherIcons.users),
                ),
                Tab(text: 'Dengue em anos', icon: Icon(FeatherIcons.clock)),
              ],
            ),
            title: const Text('Dados da Dengue'),
          ),
          body: TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      const Text(
                        'Registros de Dengue em Humanos',
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: charts.BarChart(
                          _seriesData,
                          animate: true,
                          barGroupingType: charts.BarGroupingType.grouped,
                          animationDuration: const Duration(seconds: 5),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      const Text(
                        'Casos confirmados ao longo dos anos',
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: charts.LineChart(_seriesLineData,
                            defaultRenderer: charts.LineRendererConfig(
                                includeArea: true, stacked: true),
                            animate: true,
                            animationDuration: const Duration(seconds: 2),
                            behaviors: [
                              charts.ChartTitle('Ano',
                                  behaviorPosition:
                                      charts.BehaviorPosition.bottom,
                                  titleOutsideJustification: charts
                                      .OutsideJustification.middleDrawArea),
                              charts.ChartTitle('Número de casos',
                                  behaviorPosition:
                                      charts.BehaviorPosition.start,
                                  titleOutsideJustification: charts
                                      .OutsideJustification.middleDrawArea),
                              charts.ChartTitle(
                                'Casos confirmados',
                                behaviorPosition: charts.BehaviorPosition.end,
                                titleOutsideJustification:
                                    charts.OutsideJustification.middleDrawArea,
                              )
                            ]),
                      ),
                    ],
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
