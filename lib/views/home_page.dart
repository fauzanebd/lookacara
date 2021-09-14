import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
              SingleChildScrollView(
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
                    EventList(listName: "Events Near Jakarta"),
                    Container(height: 22.w),
                    EventList(listName: "Recommended For You"),
                    Container(height: 22.w),
                  ],
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
  const EventList({required this.listName});

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
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 15,
            itemBuilder: (BuildContext context, int index) {
              return NearestEventCard();
            },
          ),
        ),
      ],
    );
  }
}

class NearestEventCard extends StatelessWidget {
  const NearestEventCard({
    Key? key,
  }) : super(key: key);

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
                    image: AssetImage('assets/images/HomePageImage.jpg'),
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
                            "Kidscares Charity Night",
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
                            "11 Sep 2021, 19:00 WIB",
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
                    "Kuningan City - Setia Budi Jakarta Utara",
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
                    "Available",
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
                  Text(
                    "Rp20.000",
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

class ChatItem extends StatelessWidget {
  final String? contactName;
  final String? chatDetails;
  final String? time;
  final String? imageUrl;
  const ChatItem({
    Key? key,
    this.contactName,
    this.chatDetails,
    this.time,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          contentPadding: EdgeInsets.all(10),
          title: Text(contactName!),
          subtitle: Text(
            chatDetails!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
              imageUrl!,
            ),
          ),
          trailing: Text("10.02 PM"),
          tileColor: Colors.cyan,
          // dense: true,
        ),
        Container(
          height: 2,
        ),
      ],
    );
  }
}
