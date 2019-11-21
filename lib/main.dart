import 'dart:core';
import 'package:bridge_water/common/data.dart';
import 'package:bridge_water/common/utils.dart';
import 'package:bridge_water/components/header.dart';
import 'package:bridge_water/components/vacancy_list.dart';
import 'package:bridge_water/model/vacancy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            textTheme: TextTheme(
                headline: TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
                title: TextStyle(fontWeight: FontWeight.w800, fontSize: 24),
                button: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: Colors.blueAccent))),
        debugShowCheckedModeBanner: false,
        home: RootPage());
  }
}

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  List<Vacancy> _allVacancies;

  @override
  void initState() {
    _allVacancies = vacancies.map((json) => Vacancy.fromJson(json)).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =
        ScreenUtil(width: 480, height: 640, allowFontScaling: true)
          ..init(context);
    return Scaffold(
        body: Stack(
      children: [
        Header(
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("Search vacancies", style: Theme.of(context).textTheme.headline),
          Icon(Icons.filter_list, size: setWidth(34))
        ])),
        Padding(
          padding: EdgeInsets.only(top: setHeight(120)),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                VacancyList(
                    title: "Fulltime",
                    vacancies: _allVacancies
                        .where(
                            (vacancy) => vacancy.type == VACANCY_TYPE.FULL_TIME)
                        .toList(),
                    colors: [Color(0xFF93D8CE), Color(0xFF296E8B)]),
                VacancyList(
                    title: "Parttime",
                    vacancies: _allVacancies
                        .where(
                            (vacancy) => vacancy.type == VACANCY_TYPE.PART_TIME)
                        .toList(),
                    colors: [Color(0xFF49ACD6), Color(0xFFFF3F5E70)]),
                VacancyList(
                    title: "ICO",
                    vacancies: _allVacancies
                        .where(
                            (vacancy) => vacancy.type == VACANCY_TYPE.ICO)
                        .toList()),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
