import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myproject/constants.dart';
import 'package:myproject/pages/service_page.dart';
import 'package:myproject/widget/bottom_nav_bar.dart';
import 'package:myproject/widget/category_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Cairo",
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
      ),
      routes: {
        '/service': (context) => ServicePage(),
      },
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //This is going to give us total height and width our device
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff885566),
        // leading: IconButton(
        //     onPressed: () {}, icon: Image.asset("assets/icons/logo.jpeg")),
        title: IconButton(
            onPressed: () {}, icon: Image.asset("assets/icons/logo.jpeg")),
        centerTitle: true,

        // actions: [
        //   IconButton(
        //       onPressed: () {}, icon: Image.asset("assets/icons/logo.jpeg"))
        // ],
      ),
      drawer: Drawer(),
      bottomNavigationBar: BottomNavBar(),
      body: Stack(
        children: <Widget>[
          Container(
            //Here the height of the container is 45% of our total height
            height: size.height * .35,
            decoration: BoxDecoration(
                color: Color(0xff885566),
                image: DecorationImage(
                  alignment: Alignment.centerLeft,
                  image: AssetImage("assets/images/undraw_pilates_gpdb.png"),
                )),
          ),
          SafeArea(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  //padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      // Align(
                      //   alignment: Alignment.topRight,
                      //   child: Container(
                      //     alignment: Alignment.center,
                      //     height: 52,
                      //     width: 52,
                      //     decoration: BoxDecoration(
                      //       color: Color.fromARGB(255, 52, 140, 175),
                      //       shape: BoxShape.circle,
                      //     ),
                      //     child: SvgPicture.asset("assets/icons/menu.svg"),
                      //   ),
                      // ),
                      Text(
                        "Just in Time !",
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            ?.copyWith(fontWeight: FontWeight.w300),
                      ),
                      /*Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(29.5),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search",
                            icon: SvgPicture.asset("assets/icons/search.svg"),
                            border: InputBorder.none,
                          ),
                        ),
                        // color: Colors.white,
                        // child: TextField(),
                      ),*/
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 8.0, right: 8.0),
                        //height: 50.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              CupertinoIcons.search_circle,
                              size: 30.0,
                            ),
                            suffixIcon: Icon(
                              Icons.tune,
                              size: 22.0,
                            ),
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              fontSize: 15.0,
                            ),
                            hintText: "Search",
                          ),
                        ),
                      ),
                      Expanded(
                        child: GridView.count(
                          crossAxisCount: 2,
                          //childAspectRatio: .85,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                          children: <Widget>[
                            CategoryCard(
                              svgSrc: "assets/icons/guitarll.png",
                              title: "Learn to play guitar",
                              press: () {},
                            ),
                            CategoryCard(
                                svgSrc: "assets/icons/english.png",
                                title: "Hello, would you like to practice?",
                                press: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      return ServicePage();
                                    }),
                                  );
                                }),
                            CategoryCard(
                                svgSrc: "assets/icons/basketball.png",
                                title: "Let's play bro",
                                press: () {}),
                            CategoryCard(
                                svgSrc: "assets/icons/programming.png",
                                title: "Hello World",
                                press: () {}),
                            CategoryCard(
                                svgSrc: "assets/icons/blackboard.png",
                                title: "Maths",
                                press: () {}),
                            // CategoryCard(
                            //     svgSrc: "assets/icons/Excrecises.svg",
                            //     title: "Kergel Exercises",
                            //     press: () {}),
                            // CategoryCard(
                            //   svgSrc: "assets/icons/Meditation.svg",
                            //   title: "Meditation",
                            //   press: () {},
                            // ),
                            // CategoryCard(
                            //     svgSrc: "assets/icons/yoga.svg",
                            //     title: "Yoga",
                            //     press: () {}),
                          ],
                        ),
                      ),
                    ],
                  )))
        ],
      ),
    );
  }
}
