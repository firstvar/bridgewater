import 'package:bridge_water/common/utils.dart';
import 'package:bridge_water/components/vacancy_detail.dart';
import 'package:bridge_water/model/vacancy.dart';
import 'package:flutter/material.dart';

class VacancyList extends StatefulWidget {
  final String title;
  final List<Vacancy> vacancies;
  final List<Color> colors;
  VacancyList({this.title, this.vacancies, this.colors = const[Colors.deepPurpleAccent, Colors.deepOrange]});
  @override
  _VacancyListState createState() => _VacancyListState();
}

class _VacancyListState extends State<VacancyList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              left: setWidth(24.0),
              right: setWidth(24.0),
              bottom: setWidth(20.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  widget.title,
                  style: Theme.of(context).textTheme.title,
                ),
                InkWell(
                  child: Text("ALL VACATION",
                    style: Theme.of(context).textTheme.button),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.vacancies.length,
              itemBuilder: (context, index) {
                Vacancy vacancy = widget.vacancies[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => VacancyDetail(vacancy, colors: widget.colors)
                    ));
                  },
                  child: Hero(
                    flightShuttleBuilder: flightShuttleBuilder,
                    tag: vacancy.id,
                    child: Container(
                      padding:
                      EdgeInsets.only(left: 15, top: 15, bottom: 15),
                      margin: EdgeInsets.only(right: 10),
                      height: 160,
                      width: 160,
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.all(Radius.circular(15)),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: widget.colors,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(Icons.location_on,
                                color: Color(0x55FFFFFF), size: 14),
                              Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text(vacancy.city,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.white)),
                              ),
                            ],
                          ),
                          Text(vacancy.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 17)),
                          Text(formatDate(vacancy.updatedAt),
                            style: TextStyle(
                              color: Color(0x99FFFFFF), fontSize: 13))
                        ],
                      )),
                  ),
                );
              }))
        ],
      ),
    );
  }
}
