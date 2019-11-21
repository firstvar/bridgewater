import 'package:bridge_water/common/utils.dart';
import 'package:bridge_water/components/header.dart';
import 'package:bridge_water/model/vacancy.dart';
import 'package:flutter/material.dart';

class VacancyDetail extends StatelessWidget {
  List<Color> colors;
  Vacancy vacancy;

  VacancyDetail(this.vacancy,
      {this.colors = const [Colors.deepPurpleAccent, Colors.deepOrange]});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Header(Align(
            alignment: Alignment.centerLeft,
            child:
                Text(vacancy.name, style: Theme.of(context).textTheme.title))),
        Hero(
          tag: vacancy.id,
          flightShuttleBuilder: flightShuttleBuilder,
          child: Container(
            width: 360,
            height: 420,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: colors,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 15.0, left: 15, bottom: 15),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(children: <Widget>[
                      Icon(Icons.location_on,
                          color: Color(0x55FFFFFF), size: 14),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(vacancy.city,
                            style:
                                TextStyle(fontSize: 13, color: Colors.white)),
                      ),
                    ]),
                    Padding(
                      padding: EdgeInsets.only(top: 35.0),
                      child: Text(vacancy.name,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 17)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text(formatDate(vacancy.updatedAt),
                          style: TextStyle(
                              color: Color(0x99FFFFFF), fontSize: 13)),
                    ),
                    Divider(color: Color(0x66FFFFFF)),
                    Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 10),
                      child: Text("Zakladní info:",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600)),
                    ),
                    Text(this.vacancy.description["info"],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w200,
                            wordSpacing: 1.5)),
                    Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 10),
                      child: Text("Technologie:",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600)),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount:
                          (this.vacancy.description["tech"] as List).length,
                      itemBuilder: (context, index) {
                        String oneTech =
                            this.vacancy.description["tech"][index];
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              oneTech,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w200,
                                  wordSpacing: 1.5),
                            ),
                            Divider(color: Color(0x66FFFFFF))
                          ],
                        );
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 10),
                      child: Text("Finance:",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600)),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount:
                      (this.vacancy.description["finance"] as List).length,
                      itemBuilder: (context, index) {
                        String oneFinance =
                        this.vacancy.description["finance"][index];
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              oneFinance,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w200,
                                wordSpacing: 1.5),
                            ),
                            Divider(color: Color(0x66FFFFFF))
                          ],
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
