import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:look_acara/controllers/navigation_bar_controller.dart';
import 'package:look_acara/views/explore_page.dart';
import 'package:look_acara/views/home_page.dart';
import 'package:look_acara/views/login_page.dart';
import 'package:look_acara/views/ticket_page.dart';
import 'package:look_acara/views/wishlist_page.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:get/get.dart';

class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.height,
      ),
      designSize: Size(376, 726),
    );

    final TextStyle unselectedLabelStyle = TextStyle(
      fontFamily: "Inter",
      fontSize: 12.sp,
      fontWeight: FontWeight.w700,
      color: Color(0xFF717375),
    );

    final TextStyle selectedLabelStyle = TextStyle(
      fontFamily: "Inter",
      fontSize: 12.sp,
      fontWeight: FontWeight.w700,
      color: Color(0xFF0F84DE),
    );

    NavigationBarController navigationBarController =
        Get.put(NavigationBarController(), permanent: false);

    return ScreenTypeLayout(
      breakpoints: ScreenBreakpoints(
        tablet: 600,
        desktop: 950,
        watch: 300,
      ),
      mobile: SafeArea(
        child: Scaffold(
          bottomNavigationBar: Obx(
            () => MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: SizedBox(
                height: 56.w,
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  showUnselectedLabels: true,
                  showSelectedLabels: true,
                  onTap: navigationBarController.changeTabIndex,
                  currentIndex: navigationBarController.tabIndex.value,
                  backgroundColor: Color(0xFFFDFDFC),
                  unselectedItemColor: Color(0xFF717375),
                  selectedItemColor: Color(0xFF0F84DE),
                  unselectedLabelStyle: unselectedLabelStyle,
                  selectedLabelStyle: selectedLabelStyle,
                  items: [
                    BottomNavigationBarItem(
                      icon: Container(
                        margin: EdgeInsets.only(bottom: 4.w),
                        child: Icon(Icons.home, size: 22.w),
                      ),
                      label: "Home",
                      backgroundColor: Color(0xFFFDFDFC),
                    ),
                    BottomNavigationBarItem(
                      icon: Container(
                        margin: EdgeInsets.only(bottom: 4.w),
                        child: Icon(Icons.search, size: 22.w),
                      ),
                      label: "Search",
                      backgroundColor: Color(0xFFFDFDFC),
                    ),
                    BottomNavigationBarItem(
                      icon: Container(
                        margin: EdgeInsets.only(bottom: 4.w),
                        child: Icon(Icons.favorite_border, size: 22.w),
                      ),
                      label: "Wishlist",
                      backgroundColor: Color(0xFFFDFDFC),
                    ),
                    BottomNavigationBarItem(
                      icon: Container(
                        margin: EdgeInsets.only(bottom: 4.w),
                        child:
                            Icon(Icons.confirmation_num_outlined, size: 22.w),
                      ),
                      label: "Ticket",
                      backgroundColor: Color(0xFFFDFDFC),
                    ),
                    BottomNavigationBarItem(
                      icon: Container(
                        margin: EdgeInsets.only(bottom: 4.w),
                        child: Icon(Icons.login, size: 22.w),
                      ),
                      label: "Login",
                      backgroundColor: Color(0xFFFDFDFC),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: Obx(
            () => IndexedStack(
              index: navigationBarController.tabIndex.value,
              children: [
                HomePage(),
                ExplorePage(),
                WishListPage(),
                TicketPage(),
                LoginPage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
