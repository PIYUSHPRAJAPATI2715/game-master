import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/profile_controler.dart';
import '../routers/my_routers.dart';
import '../widgets/circular_progressindicator.dart';
import '../widgets/common_error_widget.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  bool isSecondDrawerOpen = false;
  final profileController = Get.put(ProfileController());
  void openSecondDrawer() {
    setState(() {
      isSecondDrawerOpen = true;
    });
  }

  void closeSecondDrawer() {
    setState(() {
      isSecondDrawerOpen = false;
    });
  }
  int currentDrawer = 0;
  final drawerKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor: const Color(0xFF4c0b09),

      drawer:
      RotatedBox(
        quarterTurns: 1,
        child: Padding(
          padding: const EdgeInsets.only(right: 500.0),
          child: Container(

            alignment: Alignment.topLeft,
            color: const Color(0xFF5f0101),
            child: Drawer(
              backgroundColor:const Color(0xFF5f0101),
              key: drawerKey,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const SizedBox(height: 10,),
                const Center(
                  child: Text(
                  'MORE',
                  style:
                  TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
                ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Row(
                        children: [
                          currentDrawer == 0
                              ? const Icon(Icons.person,color: Colors.white,)

                              : const Icon(Icons.person,color: Colors.white,),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'My Profile',
                            style: currentDrawer == 0
                                ? const TextStyle(
                            color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15)
                                : const TextStyle(
                            color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ],
                      ),

    onTap: () {
                        Get.toNamed(MyRouters.profileScreen);
    }
 



                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Row(
                        children: [
                          currentDrawer == 2
                              ? const Icon(Icons.wallet,color: Colors.white,)
                              :  const Icon(Icons.wallet,color: Colors.white,),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Transistion History',
                            style: currentDrawer == 2
                                ? const TextStyle(
                            color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15)
                                : const TextStyle(
                            color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ],
                      ),
                      onTap: () {
                        setState(() {
                          currentDrawer = 2;

                            Get.toNamed(MyRouters.transistonPage);



                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Row(
                        children: [
                          currentDrawer == 3
                              ? const Icon(Icons.settings,color: Colors.white,)
                              :  const Icon(Icons.settings,color: Colors.white,),

                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Admin Setting',
                            style: currentDrawer == 3
                                ? const TextStyle(
                            color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15)
                                : const TextStyle(
                            color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ],
                      ),
                      onTap: () {
                        setState(() {
                          currentDrawer = 3;
                          Get.toNamed(MyRouters.adminSetting);
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Row(
                        children: [
                          currentDrawer == 4
                              ?  const Icon(Icons.settings,color: Colors.white,)
                              :  const Icon(Icons.settings,color: Colors.white,),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'WithDrawl Request',
                            style: currentDrawer == 4
                                ? const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15)
                                : const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ],
                      ),
                      onTap: () {
                        setState(() {
                          currentDrawer = 4;
                          Get.toNamed(MyRouters.withdrawlPage);
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Row(
                        children: [
                          currentDrawer == 5
                              ?  const Icon(Icons.settings,color: Colors.white,)
                              :  const Icon(Icons.settings,color: Colors.white,),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Betting Setting ',
                            style: currentDrawer == 5
                                ? const TextStyle(
                            color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15)
                                : const TextStyle(
                            color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ],
                      ),
                      onTap: () {
                        setState(() {
                          currentDrawer = 5;
                          Get.toNamed(MyRouters.bettingSetting);
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Row(
                        children: [
                          currentDrawer == 6
                              ?  const Icon(Icons.settings,color: Colors.white,)
                              :  const Icon(Icons.settings,color: Colors.white,),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'WithDrawl Request',
                            style: currentDrawer == 6
                                ? const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15)
                                : const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ],
                      ),
                      onTap: () {
                        setState(() {
                          currentDrawer = 6;
                          Get.toNamed(MyRouters.addWithDraw);
                        });
                      },
                    ),
                  ),
                  /* Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Row(
                          children: [
                            currentDrawer == 7
                                ?   SvgPicture.asset('assets/images/chat1.svg',
                          width: 20,
                          color: const Color(0xFF193B68),
                        )
                                : SvgPicture.asset('assets/images/chat1.svg',
                              width: 20,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Chat',
                              style: currentDrawer == 7
                                  ? const TextStyle(
                                      color: Color(0xFF193B68),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)
                                  : const TextStyle(
                                      color: Color(0xFF193B68),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                            ),
                          ],
                        ),
                        onTap: () {
                          setState(() {
                            currentDrawer = 7;
                            Get.toNamed(MyRouters.patientChat);
                          });
                        },
                      ),
                    ),*/
                  const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0,right: 40),
                    child: InkWell(
                      onTap: (){
                        Get.toNamed(MyRouters.signInPage);
                      },
                      child: Container(
                        width: 40,
                        height: 40,

                        decoration: BoxDecoration(
                            color: const Color(0xFFf6ca03),
                            borderRadius: BorderRadius.circular(6)
                        ),
                        child: const Center(child: Text('Logout',style: TextStyle(
                            color: Color(0xFF944300),fontSize: 15,fontWeight: FontWeight.w600
                        ),)),
                      ),
                    ),
                  ),

                ],
              ),

          ),

          ),
        ),
      ),
      body:Builder(builder: (context) {
        return
    RotatedBox(quarterTurns: 1,
    child: Container(

    height: MediaQuery.of(context).size.height,
    decoration: const BoxDecoration(
    image: DecorationImage(
    fit: BoxFit.fill,

    image: AssetImage('assets/images/background.jpg',)
    )
    ),
    child: Obx(() {
        return  profileController.statusOfProfile.value.isSuccess?
        SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Padding(
        padding: const EdgeInsets.only(left: 12.0,right: 10),
        child: Row(

        children: [
        ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.network('https://www.imagesplatform.com/imgs/three-color-circle-png.jpg',width: 50,)),
        const SizedBox(width: 20,),
        Column(
        children: [
        Row(
        children: [
        Container(
        width: 50,
        height: 20,
        decoration: BoxDecoration(
        color: const Color(0xFFf6ca03),
        borderRadius: BorderRadius.circular(2)
        ),
        child: const Center(
        child: Text('Bonus',style: TextStyle(
        color: Color(0xFF944300),fontSize: 13,fontWeight: FontWeight.bold
        ),),
        ),
        ),
        Container(
        width: 80,
        height: 20,
        decoration: BoxDecoration(
        color: const Color(0xFF2f0301),
        borderRadius: BorderRadius.circular(2)
        ),
        child: Center(
        child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        const Icon(Icons.currency_rupee, color: Color(0xFF753d0d),size: 10,),
        Text( profileController.modelprofile.value.data!.depositAmount.toString(),style: const TextStyle(
        color: Color(0xFF753d0d),fontSize: 10,fontWeight: FontWeight.w600
        ),),
        ],
        ),
        ),
        ),


        ],
        ),
        const SizedBox(height: 5,),
        Row(
        children: [
        Container(
        width: 50,
        height: 20,
        decoration: BoxDecoration(
        color: const Color(0xFFf6ca03),
        borderRadius: BorderRadius.circular(2)
        ),
        child: const Center(
        child: Text( "Cash",style: TextStyle(
        color: Color(0xFF944300),fontSize: 13,fontWeight: FontWeight.bold
        ),),
        ),
        ),
        Container(
        width: 80,
        height: 20,
        decoration: BoxDecoration(
        color: const Color(0xFF2f0301),
        borderRadius: BorderRadius.circular(2)
        ),
        child: Center(
        child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        const Icon(Icons.currency_rupee, color: Color(0xFF753d0d),size: 10,),
        Text( profileController.modelprofile.value.data!.balance.toString(),style: const TextStyle(
        color: Color(0xFF753d0d),fontSize: 10,fontWeight: FontWeight.w600
        ),),
        ],
        ),
        ),
        ),
        ],
        ),
        ],
        ),

          Column(
            children: [
              InkWell(
                onTap: () =>
                    Scaffold.of(context).openDrawer(),
                child: const Padding(

                  padding: EdgeInsets.only(left: 25.0),

                  child: Icon(Icons.settings, color: Colors.white,),

                ),
              ),

              GestureDetector(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(left: 25.0),
                    child: Text("Setting",style: TextStyle(
                        color: Colors.white,fontSize: 15,fontWeight: FontWeight.w600
                    ),),
                  )
              ),  ],
          ),
          const SizedBox(height: 5,),

        const Spacer(),
        InkWell(
        onTap: (){
        Get.toNamed(MyRouters.addCash);
        },
        child: Container(
        width: 100,
        height: 30,

        decoration: BoxDecoration(
        color: const Color(0xFFf6ca03),
        borderRadius: BorderRadius.circular(6)
        ),
        child: const Center(child: Text('ADD CASH',style: TextStyle(
        color: Color(0xFF944300),fontSize: 15,fontWeight: FontWeight.w600
        ),)),
        ),
        ),
        const SizedBox(width: 10,),
        InkWell(
        onTap: (){
        Get.toNamed(MyRouters.addWithDraw);
        },
        child: Container(
        width: 100,
        height: 30,
        decoration: BoxDecoration(
        color: const Color(0xFFf6ca03),
        borderRadius: BorderRadius.circular(6)
        ),
        child: const Center(
        child: Text('WITHDRAW',style: TextStyle(
        color: Color(0xFF944300),fontSize: 15,fontWeight: FontWeight.w600
        ),),
        ),
        ),
        ),

        ],


        ),
        ),

        SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
        children: [

          const SizedBox(width: 20,),
        Column(
        children: [
          const SizedBox(height: 70,),
        Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 20,),
        InkWell(
        onTap: (){
        Get.toNamed(MyRouters.fourthPage);
        },
        child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset('assets/images/game3.PNG',height: 150,width: 150,)),
        ),
        const SizedBox(width: 20,),
        ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset('assets/images/game2.PNG',height: 150,width: 150,)),
        const SizedBox(width: 20,),
        ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset('assets/images/game7.PNG',height: 150,width: 150,)),
        const SizedBox(width: 20,),
        ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset('assets/images/game8.PNG',height
            : 150,width: 150,)),

        ],
        ),
        ),
        const SizedBox(height: 10,),

        ],
        )
        ],
        ),
        ),

        ]),
        ),
        ):  profileController.statusOfProfile.value.isError
            ? CommonErrorWidget(
          errorText: profileController.modelprofile.value.message
              .toString(),
          onTap: () {
            profileController.getDataProfile();
          },
        )
            : const CommonProgressIndicator();
        } ),
    ));
    } ));
  }
}
