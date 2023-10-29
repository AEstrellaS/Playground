import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:playground/pages/home_page_in_boarding.dart';
import 'package:playground/pages/home_page_in_grooming.dart';
import 'package:playground/pages/home_page_in_petpals.dart';
import 'package:playground/pages/home_page_in_petu.dart';
import 'package:playground/pages/home_page_in_supplies.dart';
import 'package:playground/pages/home_page_in_walking.dart';
import 'package:playground/pages/home_page_rabbit.dart';

class HomePage extends StatelessWidget {
  static const PINK_SOFT = 0xFFFFEAEA;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // TODO: Add functionality to open menu
          },
        ),
        title: Image.asset(
          'assets/images/top_icon.png',
          height: 40,
        ),
        centerTitle: true,
        actions: [],
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/images/dog_shower.png',
            fit: BoxFit.fitWidth,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_left),
                onPressed: () {
                  // Make it go to the rabbit page, using an animation that makes it come from the right

                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      child: RabbitFocusedPage(),
                    ),
                  );
                },
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/images/protected_badge.png',
                    width: 35,
                    height: 35,
                  ),
                  SizedBox(
                    width: 0,
                  ),
                  Text(
                    'Bailey',
                    style: GoogleFonts.comfortaa(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              IconButton(
                icon: Icon(Icons.arrow_right),
                onPressed: () {
                  // TODO: Add functionality to go to next pet
                },
              ),
            ],
          ),
          SizedBox(height: 15),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    ServiceButton(
                      color: Color(PINK_SOFT),
                      text: 'Grooming',
                      image: 'assets/images/services/grooming.png',
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: HomeInGroomingPage(),
                          ),
                        );
                      },
                    ),
                    ServiceButton(
                      color: Color(PINK_SOFT),
                      text: 'Walking',
                      image: 'assets/images/services/walking.png',
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: HomeInWalkingPage(),
                          ),
                        );
                      },
                    ),
                    ServiceButton(
                      color: Color(PINK_SOFT),
                      text: 'Supplies',
                      image: 'assets/images/services/supplies.png',
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: HomeInSuppliesPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Column(
                  children: [
                    ServiceButton(
                        color: Color(PINK_SOFT),
                        text: 'Boarding',
                        image: 'assets/images/services/boarding.png',
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              child: HomeInBoardingPage(),
                            ),
                          );
                        }),
                    ServiceButton(
                      color: Color(PINK_SOFT),
                      text: 'PetU',
                      image: 'assets/images/services/petu.png',
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: HomeInPetUPage(),
                          ),
                        );
                      },
                    ),
                    ServiceButton(
                      color: Color(PINK_SOFT),
                      text: 'PetPals',
                      image: 'assets/images/services/petpals.png',
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: HomeInPetPalsPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.brown,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
/*           BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ), */
          BottomNavigationBarItem(
            icon: Icon(Icons.add_a_photo_outlined),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class ServiceButton extends StatelessWidget {
  final Color color;
  final String text;
  final String image;
  final Function? onPressed;

  const ServiceButton({
    Key? key,
    required this.color,
    required this.text,
    required this.image,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onPressed != null) {
          onPressed!();
        }
      },
      child: Container(
        width: 180,
        height: 140,
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Image.asset(
              image,
              width: 80,
              height: 80,
            ),
            Text(
              text,
              style: GoogleFonts.comfortaa(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
