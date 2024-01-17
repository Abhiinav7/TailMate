import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tailmate/Utils/constants/screen_utils.dart';
import 'package:tailmate/controller/location.dart';
import 'package:tailmate/controller/mainController.dart';
import 'package:tailmate/view/MainPage/components/containers/primary_header.dart';
import 'package:tailmate/view/MainPage/widgets/customAppbar.dart';
import 'package:tailmate/view/MainPage/widgets/drawerCustom.dart';

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
    Provider.of<MainController>(context, listen: false).getName();
    super.initState();
  }

  Widget build(BuildContext context) {
    final location = Provider.of<LocationController>(context);
    final controller = Provider.of<MainController>(context);
    double screenWidth = ScreenUtil.Width(context);
    double screenHeight = ScreenUtil.Height(context);
    return Scaffold(
      drawer: MyDrawer(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              PrimaryHeaderContainer(
                screenWidth: screenWidth,
                child: Column(
                  children: [
                    MyAppbar(
                      actions: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.notifications,
                              size: 29,
                              color: Colors.white,
                            ))
                      ],
                      backgroundColor: Colors.transparent,
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(controller.name,style: TextStyle(fontSize: 20,color: Colors.white.withOpacity(0.7)),),
                          Text(location.city.toString(),style: TextStyle(fontSize: 16,color: Colors.white.withOpacity(0.5)),),
                        ],
                      ),
                      leading: Builder(
                        builder: (context) => IconButton(
                          icon: Image.asset(
                            "assets/icons/sort.png",
                            height: 30,
                            width: 30,
                            color: Colors.white,
                          ),
                          onPressed: () => Scaffold.of(context).openDrawer(),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
