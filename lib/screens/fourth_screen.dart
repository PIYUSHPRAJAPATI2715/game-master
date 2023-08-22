import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:game/screens/tie_popup.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/bit_time_controller.dart';
import 'blue_popup.dart';
import 'red_add_money_popup.dart';

class FourthPage extends StatefulWidget {
  const FourthPage({Key? key}) : super(key: key);

  @override
  State<FourthPage> createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  final controller = Get.put(BitTimeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder(
            init: BitTimeController(),
            builder: (_) {
              return controller.currentTime == 0 && controller.winnerType != ""
                  ? Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      // color: Colors.black,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/winner.gif"),
                            fit: BoxFit.cover),
                      ),
                      child: Stack(children: [
                        Positioned(
                            top: 30,
                            right: 10,
                            child: InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: const CircleAvatar(
                                backgroundColor: Colors.black,
                                child: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                ),
                              ),
                            )),
                        if (controller.winnerType == "B")
                          Center(
                            child: RotatedBox(
                              quarterTurns: 1,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height / 3.5,
                                width: 200,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF215177),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: const Color(0xFF1a4363), width: 3),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0xFF1a4363),
                                      offset: Offset(1, 1), //(x,y)
                                      blurRadius: 1.0,
                                    ),
                                  ],
                                ),
                                child: Column(children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF1a4363),
                                    ),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.star_sharp,
                                          color: Color(0xFFff3fef),
                                        ),
                                        SizedBox(
                                          width: 50,
                                        ),
                                        Text(
                                          '95493',
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Dragon",
                                    style: GoogleFonts.poppins(
                                        color: const Color(0xFF3a6587),
                                        fontSize: 50,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Text(
                                    "2X",
                                    style: GoogleFonts.poppins(
                                        color: const Color(0xFF3a6587),
                                        fontSize: 50,
                                        fontWeight: FontWeight.bold),
                                  )
                                ]),
                              ),
                            ),
                          ),
                        if (controller.winnerType == "T")
                          Center(
                            child: RotatedBox(
                              quarterTurns: 1,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height / 3.5,
                                width: 200,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF1e9146),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: const Color(0xFF036822), width: 1),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0xFF036822),
                                      offset: Offset(1, 1), //(x,y)
                                      blurRadius: 1.0,
                                    ),
                                  ],
                                ),
                                child: Column(children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(7),
                                          topRight: Radius.circular(7)),
                                      color: Color(0xFF01621f),
                                    ),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.star_sharp,
                                          color: Color(0xFFd41f21),
                                        ),
                                        SizedBox(
                                          width: 50,
                                        ),
                                        Center(
                                          child: Text(
                                            '2210',
                                            style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Tie",
                                    style: GoogleFonts.poppins(
                                        color: const Color(0xFF4da86b),
                                        fontSize: 50,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    "9X",
                                    style: GoogleFonts.poppins(
                                        color: const Color(0xFF4da86b),
                                        fontSize: 50,
                                        fontWeight: FontWeight.bold),
                                  )
                                ]),
                              ),
                            ),
                          ),
                        if (controller.winnerType == "R")
                          Center(
                            child: RotatedBox(
                              quarterTurns: 1,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height / 3.5,
                                width: 200,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF9b3b3c),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: const Color(0xFF8e1f20), width: 1),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0xFF8e1f20),
                                      offset: Offset(1, 1), //(x,y)
                                      blurRadius: 1.0,
                                    ),
                                  ],
                                ),
                                child: Column(children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(7),
                                          topRight: Radius.circular(7)),
                                      color: Color(0xFF8f1e20),
                                    ),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.star_sharp,
                                          color: Color(0xFFffd659),
                                        ),
                                        SizedBox(
                                          width: 50,
                                        ),
                                        Text(
                                          '95493',
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text("Tiger",
                                      style: GoogleFonts.poppins(
                                          color: const Color(0xFFa74f4e),
                                          fontSize: 50,
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    "2X",
                                    style: GoogleFonts.poppins(
                                        color: const Color(0xFFa74f4e),
                                        fontSize: 50,
                                        fontWeight: FontWeight.bold),
                                  )
                                ]),
                              ),
                            ),
                          ),
                      ]),
                    )
                  : Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                'assets/images/background.jpg',
                              ))),
                      child: SingleChildScrollView(
                          physics: const NeverScrollableScrollPhysics(),
                          child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SafeArea(
                                  child: Stack(children: [
                                Column(children: [
                                  const SizedBox(
                                    height: 30,
                                  ),

                                  /*  Container(
                                height: 25,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                    color:  Colors.transparent,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Swiper(
                                  autoplay: true,
                                  outer: false,
                                  autoplayDisableOnInteraction: false,
                                  itemBuilder: (BuildContext context, int index) {
                                    return
                                      //   CachedNetworkImage(
                                      //   imageUrl: controller
                                      //       .model.value.data!.slider.slides[0].url,
                                      //   imageBuilder: (context, imageProvider) =>
                                      //       Container(
                                      //     decoration: BoxDecoration(
                                      //       image: DecorationImage(
                                      //         image: imageProvider,
                                      //         fit: BoxFit.fill,
                                      //         // colorFilter: ColorFilter.mode(
                                      //         //     Colors.red,
                                      //         //     BlendMode.colorBurn
                                      //         // )
                                      //       ),
                                      //     ),
                                      //   ),
                                      //   placeholder: (context, url) => const SizedBox(
                                      //       height: 4,
                                      //       width: 4,
                                      //       child: CircularProgressIndicator(
                                      //         color: AppTheme.primaryColor,
                                      //       )),
                                      //   errorWidget: (context, url, error) =>
                                      //       const Icon(Icons.error),
                                      // );

                                      Center(
                                        child: Text('Piyush win 20000',
                                          style: TextStyle(
                                              color: Color(0xFFFFFFFF),
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),),
                                      );
                                  },
                                  itemCount:5,
                                  pagination: const SwiperPagination(),
                                  control:
                                  const SwiperControl(size: 0), // remove arrows
                                ),
                              ),*/

                                  Row(
                                    children: [
                                      Stack(children: [
                                        Center(
                                          child: Container(
                                            width: 300,
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color: const Color(0xFF0a6e3a),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color:
                                                      const Color(0xFFb99b49),
                                                  width: 10),
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: Color(0xFFb99b49),
                                                  offset: Offset(0, 0), //(x,y)
                                                  blurRadius: 6.0,
                                                ),
                                              ],
                                            ),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Column(
                                                      children: [
                                                        RotatedBox(
                                                          quarterTurns: 1,
                                                          child: InkWell(
                                                            onTap: () {
                                                              showDialogueBlue(
                                                                  context);
                                                            },
                                                            child: Container(
                                                              height: 210,
                                                              width: 190,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: const Color(
                                                                    0xFF215177),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                border: Border.all(
                                                                    color: const Color(
                                                                        0xFF1a4363),
                                                                    width: 3),
                                                                boxShadow: const [
                                                                  BoxShadow(
                                                                    color: Color(
                                                                        0xFF1a4363),
                                                                    offset: Offset(
                                                                        1,
                                                                        1), //(x,y)
                                                                    blurRadius:
                                                                        1.0,
                                                                  ),
                                                                ],
                                                              ),
                                                              child: Column(
                                                                  children: [
                                                                    Container(
                                                                      decoration:
                                                                          const BoxDecoration(
                                                                        color: Color(
                                                                            0xFF1a4363),
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          const Icon(
                                                                            Icons.star_sharp,
                                                                            color:
                                                                                Color(0xFFff3fef),
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                50,
                                                                          ),
                                                                          Text(
                                                                            '95493',
                                                                            style: GoogleFonts.poppins(
                                                                                color: Colors.white,
                                                                                fontSize: 15,
                                                                                fontWeight: FontWeight.w600),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                      height:
                                                                          20,
                                                                    ),
                                                                    Text(
                                                                      "Dragon",
                                                                      style: GoogleFonts.poppins(
                                                                          color: const Color(
                                                                              0xFF3a6587),
                                                                          fontSize:
                                                                              50,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    const SizedBox(
                                                                      height:
                                                                          25,
                                                                    ),
                                                                    Text(
                                                                      "2X",
                                                                      style: GoogleFonts.poppins(
                                                                          color: const Color(
                                                                              0xFF3a6587),
                                                                          fontSize:
                                                                              50,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    )
                                                                  ]),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        RotatedBox(
                                                          quarterTurns: 1,
                                                          child: InkWell(
                                                            onTap: () {
                                                              showDialogueTie(
                                                                  context);
                                                            },
                                                            child: Container(
                                                              height: 210,
                                                              width: 170,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: const Color(
                                                                    0xFF1e9146),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                border: Border.all(
                                                                    color: const Color(
                                                                        0xFF036822),
                                                                    width: 1),
                                                                boxShadow: const [
                                                                  BoxShadow(
                                                                    color: Color(
                                                                        0xFF036822),
                                                                    offset: Offset(
                                                                        1,
                                                                        1), //(x,y)
                                                                    blurRadius:
                                                                        1.0,
                                                                  ),
                                                                ],
                                                              ),
                                                              child: Column(
                                                                  children: [
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius: BorderRadius.only(
                                                                            topLeft:
                                                                                Radius.circular(7),
                                                                            topRight: Radius.circular(7)),
                                                                        color: Color(
                                                                            0xFF01621f),
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          const Icon(
                                                                            Icons.star_sharp,
                                                                            color:
                                                                                Color(0xFFd41f21),
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                50,
                                                                          ),
                                                                          Center(
                                                                            child:
                                                                                Text(
                                                                              '2210',
                                                                              style: GoogleFonts.poppins(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600),
                                                                            ),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                      height:
                                                                          20,
                                                                    ),
                                                                    Text(
                                                                      "Tie",
                                                                      style: GoogleFonts.poppins(
                                                                          color: const Color(
                                                                              0xFF4da86b),
                                                                          fontSize:
                                                                              50,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    const SizedBox(
                                                                      height:
                                                                          30,
                                                                    ),
                                                                    Text(
                                                                      "9X",
                                                                      style: GoogleFonts.poppins(
                                                                          color: const Color(
                                                                              0xFF4da86b),
                                                                          fontSize:
                                                                              50,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    )
                                                                  ]),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        RotatedBox(
                                                          quarterTurns: 1,
                                                          child: InkWell(
                                                            onTap: () {
                                                              showDialogueRed(
                                                                  context);
                                                            },
                                                            child: Container(
                                                              height: 210,
                                                              width: 190,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: const Color(
                                                                    0xFF9b3b3c),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                border: Border.all(
                                                                    color: const Color(
                                                                        0xFF8e1f20),
                                                                    width: 1),
                                                                boxShadow: const [
                                                                  BoxShadow(
                                                                    color: Color(
                                                                        0xFF8e1f20),
                                                                    offset: Offset(
                                                                        1,
                                                                        1), //(x,y)
                                                                    blurRadius:
                                                                        1.0,
                                                                  ),
                                                                ],
                                                              ),
                                                              child: Column(
                                                                  children: [
                                                                    Container(
                                                                      decoration:
                                                                          const BoxDecoration(
                                                                        borderRadius: BorderRadius.only(
                                                                            topLeft:
                                                                                Radius.circular(7),
                                                                            topRight: Radius.circular(7)),
                                                                        color: Color(
                                                                            0xFF8f1e20),
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          const Icon(
                                                                            Icons.star_sharp,
                                                                            color:
                                                                                Color(0xFFffd659),
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                50,
                                                                          ),
                                                                          Text(
                                                                            '95493',
                                                                            style: GoogleFonts.poppins(
                                                                                color: Colors.white,
                                                                                fontSize: 15,
                                                                                fontWeight: FontWeight.w600),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                      height:
                                                                          20,
                                                                    ),
                                                                    Text(
                                                                        "Tiger",
                                                                        style: GoogleFonts.poppins(
                                                                            color: const Color(
                                                                                0xFFa74f4e),
                                                                            fontSize:
                                                                                50,
                                                                            fontWeight:
                                                                                FontWeight.bold)),
                                                                    const SizedBox(
                                                                      height:
                                                                          30,
                                                                    ),
                                                                    Text(
                                                                      "2X",
                                                                      style: GoogleFonts.poppins(
                                                                          color: const Color(
                                                                              0xFFa74f4e),
                                                                          fontSize:
                                                                              50,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    )
                                                                  ]),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    RotatedBox(
                                                        quarterTurns: 1,
                                                        child: Container(
                                                            height: 40,
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(5),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: const Color(
                                                                  0xFF2b471d),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              border: Border.all(
                                                                  color: const Color(
                                                                      0xFF38855a),
                                                                  width: 1),
                                                            ),
                                                            child: Row(
                                                              children: [
                                                                const SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Container(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(5),
                                                                  decoration: BoxDecoration(
                                                                      color: const Color(
                                                                          0xFFd41f21),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5)),
                                                                  child: Text(
                                                                    "P",
                                                                    style: GoogleFonts.poppins(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Container(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(5),
                                                                  decoration: BoxDecoration(
                                                                      color: const Color(
                                                                          0xFF0e7bc5),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5)),
                                                                  child: Text(
                                                                    " I ",
                                                                    style: GoogleFonts.poppins(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Container(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(5),
                                                                  decoration: BoxDecoration(
                                                                      color: const Color(
                                                                          0xFFd41f21),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5)),
                                                                  child: Text(
                                                                    "Y",
                                                                    style: GoogleFonts.poppins(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Container(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(5),
                                                                  decoration: BoxDecoration(
                                                                      color: const Color(
                                                                          0xFF0e7bc5),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5)),
                                                                  child: Text(
                                                                    "U",
                                                                    style: GoogleFonts.poppins(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Container(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(5),
                                                                  decoration: BoxDecoration(
                                                                      color: const Color(
                                                                          0xFFd41f21),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5)),
                                                                  child: Text(
                                                                    "S",
                                                                    style: GoogleFonts.poppins(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Container(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(5),
                                                                  decoration: BoxDecoration(
                                                                      color: const Color(
                                                                          0xFF0e7bc5),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5)),
                                                                  child: Text(
                                                                    "H",
                                                                    style: GoogleFonts.poppins(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Container(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(5),
                                                                  decoration: BoxDecoration(
                                                                      color: const Color(
                                                                          0xFFd41f21),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5)),
                                                                  child: Text(
                                                                    "K",
                                                                    style: GoogleFonts.poppins(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Container(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(5),
                                                                  decoration: BoxDecoration(
                                                                      color: const Color(
                                                                          0xFF0e7bc5),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5)),
                                                                  child: Text(
                                                                    "U",
                                                                    style: GoogleFonts.poppins(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Container(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(5),
                                                                  decoration: BoxDecoration(
                                                                      color: const Color(
                                                                          0xFFd41f21),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5)),
                                                                  child: Text(
                                                                    "M",
                                                                    style: GoogleFonts.poppins(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Container(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(5),
                                                                  decoration: BoxDecoration(
                                                                      color: const Color(
                                                                          0xFF0e7bc5),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5)),
                                                                  child: Text(
                                                                    "A",
                                                                    style: GoogleFonts.poppins(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Container(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(5),
                                                                  decoration: BoxDecoration(
                                                                      color: const Color(
                                                                          0xFFd41f21),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5)),
                                                                  child: Text(
                                                                    "R",
                                                                    style: GoogleFonts.poppins(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Container(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(5),
                                                                  decoration: BoxDecoration(
                                                                      color: const Color(
                                                                          0xFFd41f21),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5)),
                                                                  child: Text(
                                                                    "P",
                                                                    style: GoogleFonts.poppins(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Container(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(5),
                                                                  decoration: BoxDecoration(
                                                                      color: const Color(
                                                                          0xFF0e7bc5),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5)),
                                                                  child: Text(
                                                                    "R",
                                                                    style: GoogleFonts.poppins(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Container(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(5),
                                                                  decoration: BoxDecoration(
                                                                      color: const Color(
                                                                          0xFFd41f21),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5)),
                                                                  child: Text(
                                                                    "A",
                                                                    style: GoogleFonts.poppins(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Container(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(5),
                                                                  decoration: BoxDecoration(
                                                                      color: const Color(
                                                                          0xFF0e7bc5),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5)),
                                                                  child: Text(
                                                                    "A",
                                                                    style: GoogleFonts.poppins(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Container(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(5),
                                                                  decoration: BoxDecoration(
                                                                      color: const Color(
                                                                          0xFFd41f21),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5)),
                                                                  child: Text(
                                                                    "J",
                                                                    style: GoogleFonts.poppins(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Container(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(5),
                                                                  decoration: BoxDecoration(
                                                                      color: const Color(
                                                                          0xFF0e7bc5),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5)),
                                                                  child: Text(
                                                                    "A",
                                                                    style: GoogleFonts.poppins(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Container(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(5),
                                                                  decoration: BoxDecoration(
                                                                      color: const Color(
                                                                          0xFFd41f21),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5)),
                                                                  child: Text(
                                                                    "P",
                                                                    style: GoogleFonts.poppins(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Container(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(5),
                                                                  decoration: BoxDecoration(
                                                                      color: const Color(
                                                                          0xFF0e7bc5),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5)),
                                                                  child: Text(
                                                                    "A",
                                                                    style: GoogleFonts.poppins(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Container(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(5),
                                                                  decoration: BoxDecoration(
                                                                      color: const Color(
                                                                          0xFFd41f21),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5)),
                                                                  child: Text(
                                                                    "T",
                                                                    style: GoogleFonts.poppins(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Container(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(5),
                                                                  decoration: BoxDecoration(
                                                                      color: const Color(
                                                                          0xFFd41f21),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5)),
                                                                  child: Text(
                                                                    "I",
                                                                    style: GoogleFonts.poppins(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                              ],
                                                            )))
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ]),
                                      RotatedBox(
                                          quarterTurns: 1,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              // Image.asset("assets/images/dragon.png",width: 30,),

                                              Text(
                                                controller.currentTime > 9
                                                    ? "  00:${controller.currentTime}   "
                                                    : "  00:0${controller.currentTime}   ",
                                                style: GoogleFonts.poppins(
                                                    color: Colors.white,
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              // Image.asset("assets/images/tiger.png",width: 20,),
                                              // Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTF8L5NCNqAtqwSbGbHzPNWyLOZW3eWGREL1KopdO7b&s',width: 20,height: 20,),
                                            ],
                                          )),
                                    ],
                                  ),

                                  const SizedBox(
                                    height: 20,
                                  ),
// RotatedBox(
//   quarterTurns: 1,
//   child:   Column(
//
//     children: [
// const SizedBox(height: 20,),
//       ClipRRect(
//           borderRadius: BorderRadius.circular(30),
//           child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRL_lJhz0fnPvaF6Fh2IdXo5OzV8NhTJRV-3HL5hfBMqXFb_i9b",width: 50,)),
//       const SizedBox(height: 10,),
//       ClipRRect(
//           borderRadius: BorderRadius.circular(30),
//           child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRL_lJhz0fnPvaF6Fh2IdXo5OzV8NhTJRV-3HL5hfBMqXFb_i9b",width: 50,)),
//       const SizedBox(height: 10,),
//       ClipRRect(
//           borderRadius: BorderRadius.circular(30),
//           child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRL_lJhz0fnPvaF6Fh2IdXo5OzV8NhTJRV-3HL5hfBMqXFb_i9b",width: 50,)),
//       const SizedBox(height: 10,),
//       ClipRRect(
//           borderRadius: BorderRadius.circular(30),
//           child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRL_lJhz0fnPvaF6Fh2IdXo5OzV8NhTJRV-3HL5hfBMqXFb_i9b",width: 50,)),
//       const SizedBox(height: 10,),
//       ClipRRect(
//           borderRadius: BorderRadius.circular(30),
//           child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRL_lJhz0fnPvaF6Fh2IdXo5OzV8NhTJRV-3HL5hfBMqXFb_i9b",width: 50,)),
//
//
//     ],
//
//   ),
// ),

                                  const SizedBox(
                                    height: 300,
                                  ),

                                  /*    Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                children: const [
                                  Text("ID",
                                    style: TextStyle(
                                        color: Color(0xFFFFFFFF),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),),
                                  Text("       Winner",
                                    style: TextStyle(
                                        color: Color(0xFFFFFFFF),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),),
                                  Text("Price",
                                    style: TextStyle(
                                        color: Color(0xFFFFFFFF),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),),
                                ],
                              ),

                            ],
                        ),*/

                                  /*     ListView.builder(
                        itemCount: 15,
    shrinkWrap: true,
    padding: EdgeInsets.zero,
    physics: const NeverScrollableScrollPhysics(),
    scrollDirection: Axis.vertical,
    itemBuilder: (context, index) {
      return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("01",
                      style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),),
                    Text("10000",
                      style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),),
                    Text("1",
                      style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),),
                  ],
                ),
                SizedBox(height: 10,),
              ],
      );
    }),*/

                                  const SizedBox(
                                    height: 30,
                                  ),
                                ]),
                                //
                                // Positioned(
                                //     left:190,
                                //     bottom: 40,
                                //     right: 0,
                                //     top: 250,
                                //
                                //     child: RotatedBox(
                                //         quarterTurns: 1,
                                //         child: Image.asset("assets/images/tiger.png",width: 40,height: 40,))),
                                // Positioned(
                                //     right:40,
                                //     top: 0,
                                //
                                //     child: RotatedBox(
                                //         quarterTurns: 1,
                                //         child: Image.asset("assets/images/dragon.png",width: 100,)))
                              ])))),
                    );
            }));
  }
}

showDialogueRed(context) {
  showDialog(
      context: context,
      builder: (context) {
        return const AddMoneyPopup();
      });
}

showDialogueBlue(context) {
  showDialog(
      context: context,
      builder: (context) {
        return const BlueAddMoneyPopup();
      });
}

showDialogueTie(context) {
  showDialog(
      context: context,
      builder: (context) {
        return const TieAddMoneyPopup();
      });
}
