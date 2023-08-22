import 'package:flutter/material.dart';

import 'package:game/screens/first_page.dart';
import 'package:game/screens/fourth_screen.dart';
import 'package:game/screens/second_page.dart';
import 'package:game/screens/third_page.dart';
import 'package:get/get.dart';

import '../../resources.dart';

import 'bottom_nac_controler.dart';


class BottomNavbar extends StatefulWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  final bottomController = Get.put(BottomNavBarController());
  final pages = [
    const FourthPage(),
    const SecondPage(),
    const ThirdPage(),


  ];



  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(


        body: pages.elementAt(bottomController.pageIndex.value),
        extendBody: true,
        // extendBodyBehindAppBar: true,
        backgroundColor: Color(0xFFf6ca03),
        bottomNavigationBar: buildMyNavBar(context),
      );
    });
  }

  buildMyNavBar(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.maxFinite,
          decoration: const BoxDecoration(
            color:Color(0xFFee8a01),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 6.0,
              ),
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Column(
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: MaterialButton(
                      padding: const EdgeInsets.only(bottom: 10),
                      onPressed: () {
                        bottomController.updateIndexValue(0);

                      },

                      child: Column(
                        children: [
                          const SizedBox(height: 5,),
                          bottomController. pageIndex.value == 0
                              ? Icon(Icons.home,
                            color:Color(0xFF944300),
                          )
                              : Icon(Icons.home,

                          ),

                          bottomController. pageIndex.value == 0?
                          const Text('Home',style: TextStyle( color: Color(0xFF944300),fontWeight: FontWeight.w500,fontSize: 15),):
                          const Text('Home',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 15),)

                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: MaterialButton(
                      padding: const EdgeInsets.only(bottom: 10),
                      onPressed: () {
                        bottomController.updateIndexValue(1);


                      },
                      child: Column(
                        children: [
                          const SizedBox(height: 5,),
                          bottomController. pageIndex.value == 1
                              ?  Icon(Icons.wallet,
                            color: Color(0xFF944300),
                          )
                              :   Icon(Icons.wallet,

                          ),
                          bottomController. pageIndex.value == 1?
                          const Text('Wallet',style: TextStyle( color:Color(0xFF944300),fontWeight: FontWeight.w500,fontSize: 15),):
                          const Text('Wallet',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 15),)

                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: MaterialButton(
                        padding: const EdgeInsets.only(bottom: 10),
                        onPressed: () {

                          bottomController.updateIndexValue(2);



                        },
                        child: Column(
                          children: [
                            const SizedBox(height: 5,),
                            bottomController.pageIndex.value == 2
                                ?  Icon(Icons.person,
                              color:Color(0xFF944300),
                            )
                                :  Icon(Icons.person,
                            ),
                            bottomController. pageIndex.value == 2?
                            const Text('Profile',style: TextStyle( color: Color(0xFF944300),fontWeight: FontWeight.w500,fontSize: 15),):
                            const Text('Profile',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 15),)
                          ],
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
