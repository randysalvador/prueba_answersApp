import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/widgets.dart';

import 'answers_controller.dart';
import 'answers_model.dart';

//import 'package:get/get.dart';
class Answers extends StatelessWidget {
  final AnswersController answersController =
      Get.put<AnswersController>(AnswersController());
  final int id_answer;

  Answers({Key key, this.id_answer});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AnswersController>(
      init: answersController,
      builder: (_) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: titulo(context),
          backgroundColor: Color(0xFF1F2430),
          elevation: 0,
        ),
        body: FutureBuilder(
          future: _.getPr(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Answers> answers = snapshot.data ?? [];
              return ListView.builder(
                itemCount: answers.length,
                itemBuilder: (context, index) => Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: Align(
                          //alignment: Alignment.centerLeft,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            snapshot.data[index].answer,
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: Color(0XFFFFFFFF),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 13.0,
                    ),
                  ],
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
        backgroundColor: Color(0xFF1F2430),
      ),
    );
  }
}

Widget titulo(BuildContext context) {
  return Column(
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Text('Ans',
                style: GoogleFonts.bangers(
                    fontSize: 40, color: Color(0XFFFF6B3D))),
          ),
          Container(
            child: Text(
              ' wers',
              style: GoogleFonts.bangers(
                fontSize: 40,
                color: Color(0xFFFFFFFF),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
