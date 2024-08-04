import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:itcareerscoach/mentors/databsementors/dbfirst_mentor.dart';
import 'package:itcareerscoach/mentors/databsementors/dbsecond_mentor.dart';
import 'package:itcareerscoach/mentors/qamentors/second_mentor.dart';

import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class Database extends StatefulWidget {
  @override
  _DatabaseState createState() => _DatabaseState();
}

class _DatabaseState extends State<Database> {
  String uid;
  int _currentIndex = 0;
  CarouselSlider carouselSlider;
  int _current = 0;
  String PageName = 'Database';

  List imgList = [
    'assets/prajakt.jpg',
    'assets/image5.jpeg',
    'assets/images4.jpg',
    'assets/androiddeveloper.png',
    'assets/javadeveloper.png'
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  launchWhatsApp() async {
    final link = WhatsAppUnilink(
      phoneNumber: '+91-9359644407',
      text: "Hey! I'm inquiring about the Database Mentors",
    );
    await launch('$link');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Database Admin')),
          backgroundColor: Colors.black,
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
            )
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: 1500, // THis is the fixed length of the screen
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
            decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topCenter, colors: [
              Colors.black,
              Colors.black,
              Colors.black,
            ])),

            child: Column(children: [
              // SizedBox(height: 20,),// FOr changing the height of white Column /
              // Text('Career Coach',style: TextStyle(fontSize:30,color: Colors.white)),
              //Image.asset('assets/images4.jpg', fit: BoxFit.contain, ),
              //SizedBox(height: 10,),

              Column(
                children: [
                  Container(
                      //child: ,
                      )
                ],
              ),

              Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60),
                          )),
                      child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Column(children: [
                            SizedBox(
                              height: 40,
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                // boxShadow: [
                                //   BoxShadow(
                                //       color: Color.fromRGBO(225, 97, 27, .3),
                                //       blurRadius: 20,
                                //       offset: Offset(0,10)
                                //   )
                                // ]
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    //color: Colors.black12,
                                    width: 500.0,
                                    height: 300.0,
                                    // decoration: BoxDecoration(
                                    //   borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                    //   color: Colors.redAccent,
                                    // ),
                                    child: Image.asset(
                                      'assets/database3.png',
                                      fit: BoxFit.contain,
                                      height: 300,
                                      width: 500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            // Text('Select IT Job Career ',style: TextStyle(fontSize:30,color: Colors.black),),
                            // SizedBox(height:20 ),
                            Container(
                              child: Center(
                                child: Column(
                                  children: [
                                    ListTile(
                                      //child: Container(
                                      tileColor: Colors.grey[300],
                                      title: Text(
                                        'DataBase :                                    ',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      //child: Text('Quality Assurance:'),
                                    ),
                                    //  ),
                                    //    Container(
                                    //      child: Center(
                                    ListTile(
                                        tileColor: Colors.grey[300],
                                        title: Text(
                                          '        A database is an organized collection of structured information, or data, typically stored electronically in a computer system. A database is usually controlled by a database management system (DBMS). ... The data can then be easily accessed, managed, modified, updated, controlled, and organized. ',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black87,
                                          ),
                                        )),
                                    //      //child: Text('Quality Assurance:'),
                                    //      )
                                    //    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    // Container(
                                    //     child: Center(
                                    ListTile(
                                      tileColor: Colors.grey[300],
                                      title: Text(
                                        'Tools Used:                                                  ',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    //       //child: Text('Quality Assurance:'),
                                    //     )
                                    // ),
                                    // Container(
                                    //     child: Center(
                                    ListTile(
                                      tileColor: Colors.grey[300],
                                      title: Text(
                                        'SQL                                                                                                '
                                        'PL-SQL                                                                                      '
                                        'MySQL                                                              '
                                        'Database                                                                              ',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),

                                    SizedBox(
                                      height: 10,
                                    ),
                                    // Container(
                                    //     child: Center(
                                    ListTile(
                                      tileColor: Colors.grey[300],
                                      title: Text(
                                        'Mentors For Software Testing :-                                                           ',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    //       //child: Text('Quality Assurance:'),
                                    //     )
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                            //SizedBox(height: 20,),
                            // Container(
                            //     child: Column(
                            //         mainAxisAlignment: MainAxisAlignment.center,
                            //         crossAxisAlignment: CrossAxisAlignment.center,
                            //         children: <Widget>[
                            //         carouselSlider = CarouselSlider(
                            //          options: CarouselOptions(
                            //            height: 300.0,
                            //            initialPage: 0,
                            //            enlargeCenterPage: true,
                            //            autoPlay: false,
                            //            reverse: false,
                            //            enableInfiniteScroll: true,
                            //            autoPlayInterval: Duration(seconds: 5),
                            //            autoPlayAnimationDuration: Duration(milliseconds: 2000),
                            //            //  pauseAutoPlayOnTouch: Duration(seconds: 10),
                            //            scrollDirection: Axis.horizontal,
                            //             onPageChanged: (index,reason) {
                            //               setState(() {
                            //                 _current = index;
                            //               });
                            //             }
                            //          ),
                            //           items: imgList.map((imgUrl) {
                            //             return Builder(
                            //             builder: (BuildContext context) {
                            //               return Container(
                            //                 width: MediaQuery.of(context).size.width,
                            //                 margin: EdgeInsets.symmetric(horizontal: 10.0),
                            //                 decoration: BoxDecoration(
                            //                   color: Colors.white,
                            //                 ),
                            //               child : new GestureDetector(
                            //                 child: ClipRRect(
                            //                   borderRadius: BorderRadius.circular(20),
                            //                   child: Image.asset(imgUrl,
                            //                     fit: BoxFit.fill,
                            //                   ),
                            //                 ),
                            //
                            //                 onTap: (){
                            //                   print('current page selected -$_current');
                            //                   Navigator.push(context, MaterialPageRoute(builder: (context) {
                            //                     switch (_current) {
                            //                       case 0:
                            //                         return FirstMentor();
                            //                         break;
                            //                       case 1:
                            //                         return Database();
                            //                         break;
                            //                       case 2:
                            //                         return QA();
                            //                         break;
                            //                       case 3:
                            //                         return MobilApplicationsDeveloper();
                            //                         break;
                            //                       case 4:
                            //                         return Database();
                            //                         break;
                            //
                            //                       default:
                            //                         return Database();
                            //                     }
                            //                   }));
                            //
                            //                 }
                            //
                            //               )
                            //               );
                            //
                            //             }
                            //
                            //              );
                            //
                            //           }).toList(),
                            //
                            //         ),
                            //           SizedBox(
                            //             height: 20,
                            //           ),
                            //
                            //           Row(
                            //             mainAxisAlignment: MainAxisAlignment.center,
                            //             children: map<Widget>(imgList, (index, url) {
                            //               return Container(
                            //                 width: 10.0,
                            //                 height: 10.0,
                            //                 margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                            //                 decoration: BoxDecoration(
                            //                   shape: BoxShape.circle,
                            //                   color: _current == index ? Colors.redAccent : Colors.green,
                            //                 ),
                            //               );
                            //             }),
                            //           ),
                            //       SizedBox(
                            //             height: 0.005,
                            //           ),

                            Container(
                                color: Colors.grey[300],
                                margin: EdgeInsets.symmetric(vertical: 1.0),
                                height: 350.0,
                                width: 500.0,
                                child: ListView(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 35, 0, 35),
                                  scrollDirection: Axis.horizontal,
                                  children: <Widget>[
                                    GestureDetector(
                                      child: Container(
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 180,
                                              width: 190,
                                              decoration: BoxDecoration(
                                                  //color: Colors.black,
                                                  borderRadius: BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(20),
                                                      topRight:
                                                          Radius.circular(20),
                                                      bottomLeft:
                                                          Radius.circular(20),
                                                      bottomRight:
                                                          Radius.circular(20))),
                                                  child: ClipRRect(
                                                    child: Image.asset(
                                                      'assets/mentors/puja mam.jpg',
                                                      fit: BoxFit.contain,
                                                      height: 300,
                                                      width: 300,
                                                    ),
                                                  ),
                                                ),

                                            SizedBox(height: 5),
                                            Container(
                                              child: Text(
                                                'Puja Misal Mam.',
                                                style: TextStyle(
                                                  color: Color(0xff2200cc),
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              child: Text(
                                                '(Database Developer,',
                                                style: TextStyle(
                                                  color: Color(0xff2200cc),
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              child: Text(
                                                'Java Developer)',
                                                style: TextStyle(
                                                  color: Color(0xff2200cc),
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                        onTap: () {
                                          Navigator.of(context).push(
                                              new MaterialPageRoute(
                                                  builder: (BuildContext
                                                  context) {
                                                    return new DbfirstMentor();
                                                  }));
                                        }
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    GestureDetector(
                                      child: Container(
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 180,
                                              width: 190,
                                              decoration: BoxDecoration(
                                                  //color: Colors.black,
                                                  borderRadius: BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(20),
                                                      topRight:
                                                          Radius.circular(20),
                                                      bottomLeft:
                                                          Radius.circular(20),
                                                      bottomRight:
                                                          Radius.circular(20))),
                                                  child: Image.asset(
                                                    'assets/mentors/priyanka mam.jpg',
                                                    fit: BoxFit.contain,
                                                    height: 150,
                                                    width: 150,
                                                  ),
                                                 ),
                                            SizedBox(height: 5),
                                            Container(
                                              child: Text(
                                                'Priyanka Chaudhari Mam.',
                                                style: TextStyle(
                                                  color: Color(0xff2200cc),
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              child: Text(
                                                '(Database Developer)',
                                                style: TextStyle(
                                                  color: Color(0xff2200cc),
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                        onTap: () {
                                          Navigator.of(context).push(
                                              new MaterialPageRoute(
                                                  builder: (BuildContext
                                                  context) {
                                                    return new DbsecondMentor();
                                                  }));
                                        }
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    GestureDetector(
                                      child: Container(
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 180,
                                              width: 190,
                                              decoration: BoxDecoration(
                                                 // color: Colors.grey[400],
                                                  borderRadius: BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(20),
                                                      topRight:
                                                          Radius.circular(20),
                                                      bottomLeft:
                                                          Radius.circular(20),
                                                      bottomRight:
                                                          Radius.circular(20))),
                                                  child: Stack(
                                                    children: [
                                                      Container(
                                                        child: Center(
                                                          child: Image.asset(
                                                            'assets/mentors/prashant sir.jpg',
                                                            fit: BoxFit.contain,
                                                            height: 250,
                                                            width: 150,
                                                          ),
                                                        ),
                                                      ),
                                                      // Container(
                                                      //   alignment: Alignment.topLeft,
                                                      //   child: Image.asset(
                                                      //     'assets/click me.png',
                                                      //     fit: BoxFit.contain,
                                                      //     height: 100,
                                                      //     width: 100,
                                                      //   ),
                                                      // ),
                                                    ],
                                                  ),
                                                 ),

                                            SizedBox(height: 5),
                                            Container(
                                              child: Text(
                                                'Prashant Bari Sir.',
                                                style: TextStyle(
                                                  color: Color(0xff2200cc),
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              child: Text(
                                                '(Business Analyst)',
                                                style: TextStyle(
                                                  color: Color(0xff2200cc),
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              child: Text(
                                                ' Database Developer)',
                                                style: TextStyle(
                                                  color: Color(0xff2200cc),
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                        onTap: () {
                                          Navigator.of(context).push(
                                              new MaterialPageRoute(
                                                  builder: (BuildContext
                                                  context) {
                                                    return new SecondMentor();
                                                  }));
                                        }
                                    ),
                                  ],
                                )),

                            SizedBox(
                              width: 20,
                              height: 20,
                            ),

                            //Expanded(
                            Container(
                              child: Card(
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,  //I assumed you want to occupy the entire space of the card
                                      image: AssetImage(
                                        'assets/bgabc.jpg',
                                      ),
                                    ),
                                  ),
                                  child: ListTile(
                                    onTap: () {
                                      Share.share("please download this link of this app:- https://play.google.com/store/apps/details?id=com.itcareerscoach.itcareerscoach");
                                    },
                                    // tileColor: Colors.grey[300],
                                    minVerticalPadding: 20,
                                    contentPadding: EdgeInsets.zero,
                                    leading: IconButton(
                                      icon: Icon(Icons.share, color: Colors.deepPurple ,size: 40,),
                                      onPressed: () {
                                        Share.share("please download this link of this app");
                                      },
                                    ),
                                    title: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Center(child: Text('Share with friends',style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.w900,fontSize: 20),)),

                                      ],
                                    ),
                                    subtitle: Row(
                                      children: [
                                        Column(
                                          children: [
                                            Text('Help your friends to ', style: TextStyle(color: Colors.black,fontSize: 16),),
                                            Text('choose the correct career.', style: TextStyle(color: Colors.black,fontSize: 16),),
                                          ],
                                        ),

                                        // Center(child: Text('Help your                      '
                                        //   'Friend '
                                        //     , style: TextStyle(color: Colors.black,fontSize: 16),)),
                                        SizedBox(width: 40,),
                                        Icon(Icons.arrow_forward_ios,color: Colors.deepPurple,size: 30,),
                                      ],
                                    ),

                                  ),
                                ),
                              ),
                            ),
                        SizedBox(height: 20,),
                        Card(

                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,  //I assumed you want to occupy the entire space of the card
                                image: AssetImage(
                                  'assets/bgabc.jpg',
                                ),
                              ),
                            ),
                            child: ListTile(
                              onTap: () {
                                launchWhatsApp();
                              },
                              // tileColor: Colors.grey[300],
                              minVerticalPadding: 20,
                              contentPadding: EdgeInsets.zero,
                              leading: IconButton(
                                icon: Icon(Icons.messenger, color: Colors.deepPurple ,size: 40,),
                                onPressed: () {
                                  launchWhatsApp();
                                },
                              ),
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Center(child: Column(
                                    children: [
                                      Container(child: Text('Chat With Us',style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.w900,fontSize: 20),)),
                                      Container(child: Text('for free consultation',style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.w900,fontSize: 20),)),
                                    ],
                                  )),

                                ],
                              ),
                              subtitle: Row(
                                children: [
                                  Center(child: Text('Enquire more about our courses.', style: TextStyle(color: Colors.black,fontSize: 16),)),
                                  //SizedBox(width: 20,),
                                  Icon(Icons.arrow_forward_ios,color: Colors.deepPurple,size: 30,),
                                ],
                              ),

                            ),
                          ),
                        ),



                            //  ]

                            //  )

                            //),

                            // Container(
                            //   height: 500,
                            //   width: 500,
                            //   child: GridView.count(
                            //
                            //       crossAxisCount: 2,
                            //       children: trainer,
                            //   ),
                            // )
                          ])))),
            ]),
          ),
        ));
  }
}
