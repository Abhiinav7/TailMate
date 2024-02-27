import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tailmate/Utils/constants/screen_utils.dart';
import 'package:tailmate/controller/petController.dart';
import 'package:tailmate/controller/userController.dart';
import 'package:tailmate/controller/location.dart';
import 'package:tailmate/view/MainPage/components/containers/primary_header.dart';
import 'package:tailmate/view/MainPage/components/pet_card/petcard.dart';
import 'package:tailmate/view/MainPage/widgets/customAppbar.dart';
import 'package:tailmate/view/MainPage/widgets/drawerCustom.dart';
import 'package:tailmate/view/MainPage/widgets/vertical-categoryList.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<LocationController>(context, listen: false)
        .getCurrentPosition();
    Provider.of<UserController>(context, listen: false).fetchData();
    super.initState();
    // WidgetsBinding.instance?.addPostFrameCallback((_) {
    //   print("build completed");
    //   Provider.of<PetController>(context,listen: false).dataClear();
    // });

  }

  Widget build(BuildContext context) {
    final location = Provider.of<LocationController>(context);
    final userController = Provider.of<UserController>(context);
    double screenWidth = ScreenUtil.Width(context);
    double screenHight = ScreenUtil.Height(context);
    var uid=FirebaseAuth.instance.currentUser!.uid;
    return Scaffold(
      drawer: MyDrawer(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              PrimaryHeaderContainer(
                height: screenHight * 0.4,
                screenWidth: screenWidth,
                child: Column(
                  children: [
                    MyAppbar(
                      actions: [
                        IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "/notification");
                            },
                            icon: Icon(
                              Icons.notifications,
                              size: screenWidth / 13.5,
                              color: Colors.white,
                            ))
                      ],
                      backgroundColor: Colors.transparent,
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userController.name,
                            style: TextStyle(
                                fontSize: screenWidth / 20,
                                color: Colors.white.withOpacity(0.7)),
                          ),
                          Text(
                            location.city.toString(),
                            style: TextStyle(
                                fontSize: screenWidth / 24.5,
                                color: Colors.white.withOpacity(0.5)),
                          ),
                        ],
                      ),
                      leading: Builder(
                        builder: (context) => IconButton(
                          icon: Image.asset(
                            "assets/icons/sort.png",
                            height: 32,
                            width: screenWidth / 13.06,
                            color: Colors.white,
                            fit: BoxFit.cover,
                          ),
                          onPressed: () => Scaffold.of(context).openDrawer(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenWidth / 19.6,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              "Discover and adopt your new friend today!",
                              style: GoogleFonts.aleo(
                                  fontSize: screenWidth / 24.5,
                                  color: Colors.white.withOpacity(0.9),
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              left: screenWidth / 26.13,
                              top: screenWidth / 26.13),
                          child: Text(
                            "Categories",
                            style: GoogleFonts.acme(
                                shadows: [
                                  BoxShadow(
                                      color: Color(0xff265073),
                                      offset: Offset(4, 4))
                                ],
                                fontSize: screenWidth / 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    VerticalCategory()
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth / 19.6),
                    child: Text(
                      "Adopt Me!",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: screenWidth / 20.63,
                          color: Colors.black.withOpacity(0.9)),
                    ),
                  ),
                ],
              ),
              StreamBuilder(
                  stream:
                  FirebaseFirestore.instance.collection("pets").where("userId",isNotEqualTo: uid).snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData){
                      return GridView.builder(
                          padding: EdgeInsets.all(screenWidth / 26.13),
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.docs.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: screenHight * 0.285,
                            crossAxisSpacing: screenWidth / 32.66,
                            mainAxisSpacing: screenWidth / 32.66,
                          ),
                          itemBuilder: (context, index) {
                            final data = snapshot.data!.docs[index];

                            return PetCard(
                              data: data.data(),
                              imageUrl: data["imageUrl"],
                              breed: data["breed"],
                              petName: data["petName"],

                            );
                          });
                    } else {
                      return Container();
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
