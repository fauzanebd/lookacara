import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:look_acara/controllers/home_controller.dart';
import 'package:look_acara/models/event.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomePage extends StatelessWidget {
  HomeController homeController = Get.put(HomeController());

  Future<void> autoRefresh() async {
    await homeController.fetchEvents();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.height,
      ),
      designSize: Size(376, 726),
    );

    return ScreenTypeLayout(
      breakpoints: ScreenBreakpoints(
        tablet: 600,
        desktop: 950,
        watch: 300,
      ),
      mobile: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                child: RefreshIndicator(
                  onRefresh: autoRefresh,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(height: 110.w),
                        Row(
                          children: [
                            Padding(padding: EdgeInsets.only(left: 16.w)),
                            Container(
                              width: 344.w,
                              height: 156.w,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/images/HomePageImage.jpg',
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(right: 16.w)),
                          ],
                        ),
                        Container(height: 22.w),
                        EventList(
                          listName: "Events Near Jakarta",
                          events: homeController.eventList,
                        ),
                        Container(height: 22.w),
                        EventList(
                          listName: "Recommended For You",
                          events: homeController.eventList,
                        ),
                        Container(height: 22.w),
                      ],
                    ),
                  ),
                ),
              ),
              HomePageHeader(),
            ],
          ),
        ),
      ),
    );
  }
}

class EventList extends StatelessWidget {
  final String listName;
  final List<Event> events;
  EventList({required this.listName, required this.events});

  HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(padding: EdgeInsets.only(left: 16.w)),
            Text(
              listName,
              style: TextStyle(
                fontFamily: "Inter",
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: Color(0xFF0A0A0A),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(padding: EdgeInsets.only(right: 10.w)),
            ),
            Text(
              "Show All",
              style: TextStyle(
                fontFamily: "Inter",
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xFF419EE5),
              ),
            ),
            Padding(padding: EdgeInsets.only(right: 16.w)),
          ],
        ),
        Container(height: 18.w),
        Container(
          padding: EdgeInsets.only(left: 16.w),
          height: 200.w,
          child: FutureBuilder<List<Event>>(
            future: homeController.fetchEvents(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print(snapshot.data);
                List<Event> data = snapshot.data!;
                return _eventListViewBuilder(data);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ],
    );
  }

  ListView _eventListViewBuilder(List<Event> data) {
    return ListView.builder(
      // shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: data.length - 1,
      itemBuilder: (context, index) {
        return EventListCard(event: data[index]);
      },
    );
  }
}

class EventListCard extends StatelessWidget {
  EventListCard({required this.event});
  Event event;

  bool isDiffDate(DateTime date1, DateTime date2) {
    if (date1.difference(date2).inDays > 0) {
      return true;
    } else {
      return false;
    }
  }

  List<String> monthList = <String>[
    "Januari",
    "Februari",
    "Maret",
    "April",
    "Mei",
    "Juni",
    "Juli",
    "Agustus",
    "September",
    "Oktober",
    "November",
    "Desember"
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 210.w,
          height: 200.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 104,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      event.eventImage ??
                          'https://i.pinimg.com/originals/68/a9/d7/68a9d7ff43241336410315b1517fdcb6.jpg',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                  ),
                ),
              ),
              Container(
                height: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            event.eventName!,
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF0A0A0A),
                            ),
                          ),
                          Container(height: 4.w),
                          Text(
                            isDiffDate(event.eventStart!, event.eventEnd!)
                                ? "${event.eventStart!.day} ${monthList[event.eventStart!.month - 1]} - ${event.eventStart!.day} ${monthList[event.eventStart!.month - 1]}"
                                : "${event.eventStart!.day} ${monthList[event.eventStart!.month - 1]}",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF5D5F61),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.only(left: 16.w),
                        ),
                      ),
                      Icon(Icons.favorite_border_outlined, size: 20.w),
                    ],
                  ),
                  Container(height: 6.w),
                  Text(
                    event.location!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF5D5F61),
                    ),
                  ),
                ],
              ),
              Container(height: 8.w),
              Row(
                children: [
                  Text(
                    event.eventStatus!,
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF0A0A0A),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(padding: EdgeInsets.only(right: 16.w)),
                  ),
                  Row(
                    children: [
                      Text(
                        "start from  ",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 7.sp,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF0F84DE),
                        ),
                      ),
                      Text(
                        "${event.ticketing![0]!.price!}",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF0F84DE),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          width: 22.w,
        ),
      ],
    );
  }
}

class HomePageHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 1000.w,
          height: 94.w,
          decoration: BoxDecoration(
            color: Color(0xFFFDFDFC),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(height: 40.w),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.only(left: 16.w)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Event Destination",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF5D5F61),
                        ),
                      ),
                      Container(height: 4.w),
                      Text(
                        "Jakarta",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF0F84DE),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(padding: EdgeInsets.only(right: 10.w)),
                  ),
                  Icon(Icons.notifications_outlined),
                  Padding(padding: EdgeInsets.only(right: 16.w)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
