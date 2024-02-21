import 'package:assignment/model/model.dart';
import 'package:assignment/view/screen/profile_screen.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    this.items = const [
      'assets/image/css.png',
      'assets/image/css.png',
      'assets/image/css.png',
      'assets/image/css.png',
    ],
  });

  final List<String> items;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<product> Product = [
    product(
      name: 'House Cleaning',
      image: 'assets/image/first.JPG',
      price: '\$25',
      salername: 'Kylee Danford',
      rating: '4.8',
      review: '8,289 reviews',
    ),
    product(
      name: 'Floor Cleaning',
      image: 'assets/image/second.png',
      price: '\$20',
      salername: 'Alfonzo Schuessler',
      rating: '4.9',
      review: '6,182 reviews',
    ),
    product(
      name: 'Washing Clothes',
      image: 'assets/image/third.png',
      price: '\$22',
      salername: 'Sanjuanita Ordonez',
      rating: '4.7',
      review: '7,983 reviews',
    ),
    product(
      name: 'Bathroom Cleaning',
      image: 'assets/image/four.png',
      price: '\$24',
      salername: 'Freida Varnes',
      rating: '4.9',
      review: '6,834 reviews',
    ),
  ];

  static late TabController tabController;
  static CarouselController buttonCarouselController = CarouselController();
  static int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                /// header
                const Row(
                  children: [
                    CircleAvatar(
                        radius: 28, child: Icon(Icons.person)),
                    SizedBox(
                      width: 14,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Good Morning 👋', style: TextStyle(fontSize: 15)),
                        Text(
                          'Andrew Ainsley',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    Icon(Icons.notifications_none),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.favorite_border),
                  ],
                ),

                const SizedBox(
                  height: 20,
                ),

                ///search bar
                Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search",
                      hintStyle: TextStyle(color: Colors.grey.shade600),
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      suffixIcon: const Icon(
                        Icons.category_outlined,
                        color: Color(0xff6F3ABB),
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 18,
                ),

                ///special offers
                const Row(
                  children: [
                    Text(
                      'Special Offers',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      width: 180,
                    ),
                    Text(
                      'See All',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color(0xff6F3ABB)),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 18,
                ),

                ///carousel slider
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CarouselSlider(
                      carouselController: buttonCarouselController,
                      options: CarouselOptions(
                          autoPlay: true,
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 1000),
                          autoPlayCurve: Curves.easeInOut,
                          autoPlayInterval: const Duration(seconds: 4),
                          scrollPhysics: const BouncingScrollPhysics(),
                          viewportFraction: 1,
                          enlargeCenterPage: true,
                          onPageChanged: (index, reason) {
                            currentIndex = index;
                          }),
                      items: widget.items
                          .map(
                            (item) => Image.asset(
                              item,
                              fit: BoxFit.fill,
                              // width: double.infinity,
                            ),
                          )
                          .toList(),
                    ),
                    Positioned(
                      bottom: 1,
                      child: DotsIndicator(
                        dotsCount: widget.items.length,
                        position: currentIndex,
                        onTap: (index) {
                          buttonCarouselController.animateToPage(index);
                        },
                        decorator: DotsDecorator(
                          color: Colors.white,
                          activeColor: Colors.white,
                          size: const Size.square(8),
                          activeSize: const Size(20, 8),
                          activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 18,
                ),

                ///services
                const Row(
                  children: [
                    Text(
                      'Services',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      width: 230,
                    ),
                    Text(
                      'See All',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color(0xff6F3ABB)),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 18,
                ),

                Row(
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor:
                              const Color(0xff7210FF).withOpacity(0.2),
                          child: SvgPicture.asset(
                            'assets/icons/icon1.svg',
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          'Cleaning',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor:
                              const Color(0xffFF981F).withOpacity(0.2),
                          child: SvgPicture.asset(
                            'assets/icons/icon2.svg',
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          'Repairing',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 28,
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor:
                              const Color(0xff1A96F0).withOpacity(0.2),
                          child: SvgPicture.asset(
                            'assets/icons/icon7.svg',
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          'Painting',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor:
                              const Color(0xffFFC02D).withOpacity(0.2),
                          child: SvgPicture.asset(
                            'assets/icons/icon6.svg',
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          'Laundry',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(
                  height: 20,
                ),

                Row(
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor:
                              const Color(0xffF54336).withOpacity(0.2),
                          child: SvgPicture.asset(
                            'assets/icons/icon3.svg',
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          'Appliance',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor:
                              const Color(0xff4AAF57).withOpacity(0.2),
                          child: SvgPicture.asset(
                            'assets/icons/icon5.svg',
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          'Plumbing',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 28,
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor:
                              const Color(0xff00BCD3).withOpacity(0.2),
                          child: SvgPicture.asset(
                            'assets/icons/icon4.svg',
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          'Shifting',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 29,
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor:
                              const Color(0xff7210FF).withOpacity(0.2),
                          child: SvgPicture.asset(
                            'assets/icons/More Circle.svg',
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          'More',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(
                  height: 20,
                ),

                const Divider(),

                const SizedBox(
                  height: 24,
                ),

                ///most popular services
                const Row(
                  children: [
                    Text(
                      'Most Popular Services',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      width: 104,
                    ),
                    Text(
                      'See All',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color(0xff6F3ABB)),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 18,
                ),

                DefaultTabController(
                  length: 8,
                  child: Column(
                    children: [
                      ButtonsTabBar(
                        contentPadding: EdgeInsets.symmetric(horizontal: 30),
                        elevation: 0,
                        backgroundColor: Color(0xff6F3ABB),
                        unselectedBackgroundColor: Colors.white,
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        unselectedLabelStyle: TextStyle(
                          color: Color(0xff6F3ABB),
                          fontWeight: FontWeight.bold,
                        ),
                        borderWidth: 2,
                        borderColor: Color(0xff6F3ABB),
                        unselectedBorderColor: Color(0xff6F3ABB),
                        radius: 100,
                        tabs: [
                          Tab(text: "All"),
                          Tab(text: "Cleaning"),
                          Tab(text: "Repairing"),
                          Tab(text: "Painting"),
                          Tab(text: "Laundry"),
                          Tab(text: "Appliance"),
                          Tab(text: "Plumbing"),
                          Tab(text: "Shifting"),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 16,
                ),

                Column(
                  children: Product.map(
                    (e) => Container(
                      margin: EdgeInsets.all(8),
                      height: 160,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              blurStyle: BlurStyle.normal,
                              color: Colors.grey.withOpacity(0.1)),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 18,
                          bottom: 18,
                          left: 18,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image(image: AssetImage("${e.image}")),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 18,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    '${e.salername}',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    '${e.name}',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '${e.price}',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff7210FF)),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('⭐ ${e.rating}'),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text('|'),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text('${e.review}'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
