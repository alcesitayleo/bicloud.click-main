import 'package:flutter/material.dart';

import '../widgets/bottom_bar.dart';
import '../widgets/carousel.dart';
import '../widgets/destination_heading.dart';
import '../widgets/explore_drawer.dart';
import '../widgets/featured_heading.dart';
import '../widgets/featured_tiles.dart';
//import '../widgets/floating_quick_access_bar.dart';
import '../widgets/responsive.dart';
import '../widgets/top_bar_contents.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              backgroundColor: Colors.blueGrey.shade900.withOpacity(_opacity),
              elevation: 0,
              title: Text(
                'Bicloud.click',
                style: TextStyle(
                  color: Colors.blueGrey.shade100,
                  fontSize: 20,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 3,
                ),
              ),
            )
          : PreferredSize(
              preferredSize: Size(screenSize.width, 1000),
              child: TopBarContents(_opacity),
            ),
      drawer: ExploreDrawer(),
      body: SingleChildScrollView(
        controller: _scrollController,
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  child: SizedBox(
                    height: screenSize.height * 0.45,
                    width: screenSize.width,
                    child: Image.asset(
                      'assets/images/cover.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: screenSize.height * 0.50),
                    //FloatingQuickAccessBar(screenSize: screenSize),
                    Container(
                      child: Column(
                        children: [
                          FeaturedTiles(screenSize: screenSize),
                          FeaturedHeading(screenSize: screenSize),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
            DestinationHeading(screenSize: screenSize),
            DestinationCarousel(),
            SizedBox(height: screenSize.height / 10),
            BottomBar(),
          ],
        ),
      ),
    );
  }
}
