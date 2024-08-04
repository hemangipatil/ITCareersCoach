import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:itcareerscoach/mentors/databsementors/dbfirst_mentor.dart';
import 'package:itcareerscoach/mentors/qamentors/third_mentor.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class Java extends StatefulWidget {
  //const Java({Key? key}) : super(key: key);

  @override
  _JavaState createState() => _JavaState();
}

class _JavaState extends State<Java> {
  String uid;
  int _currentIndex = 0;
  CarouselSlider carouselSlider;
  int _current = 0;
  String  PageName ='Database';

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
      text: "Hey! I'm inquiring about the Java Mentors",
    );
    await launch('$link');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Java Development')),
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
            height: 1800,// THis is the fixed length of the screen
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    colors: [
                      Colors.black,
                      Colors.black,
                      Colors.black,
                    ]
                )
            ),


            child: Column(
                children: [

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
                  /*Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(width: 20.0, height: 20.0),
                  //const SizedBox(width: 20.0, height: 20.0),
                  DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 30.0,
                        fontFamily: 'Horizon',
                        color: Colors.white,
                      ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText(' BE AWESOME'),
                        TyperAnimatedText('BE OPTIMISTIC'),
                        TyperAnimatedText('BE DIFFERENT'),
                      ],
                      onTap: () {
                        print("Tap Event");
                      },


                    ),
                  ),
                ]
            ),*/

                  Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(60),topRight: Radius.circular(60),)
                          ),
                          child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Column(
                                  children: [
                                    SizedBox(height: 40,),
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
                                          SizedBox(height: 30,),
                                          Container(
                                            //color: Colors.black12,
                                            width: 1500.0,
                                            height: 300.0,
                                            // decoration: BoxDecoration(
                                            //   borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                            //   color: Colors.redAccent,
                                            // ),
                                            child: Image.asset('assets/java1.png', fit: BoxFit.contain,height: 300,width: 1500, ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 20,),
                                    // Text('Select IT Job Career ',style: TextStyle(fontSize:30,color: Colors.black),),
                                    // SizedBox(height:20 ),
                                    Container(
                                      child: Center(
                                        child: Column(
                                          children: [
                                            ListTile(
                                              //child: Container(
                                              tileColor: Colors.grey[300],
                                              title: Text('Java:-                                    ',
                                                style: TextStyle(fontSize:20,color: Colors.black, fontWeight: FontWeight.bold),),
                                              //child: Text('Quality Assurance:'),
                                            ),
                                            //  ),
                                            //    Container(
                                            //      child: Center(
                                            ListTile(
                                                tileColor: Colors.grey[300],
                                                title: Text('        Java is an object-oriented programming language that produces software for multiple platforms. When a programmer writes a Java application, the compiled code (known as bytecode) runs on most operating systems (OS), including Windows, Linux and Mac OS. ',
                                                  style: TextStyle(fontSize:16,color: Colors.black87, ),
                                                )),
                                            //      //child: Text('Quality Assurance:'),
                                            //      )
                                            //    ),
                                            SizedBox(height: 10,),
                                            // Container(
                                            //     child: Center(
                                            ListTile(
                                              tileColor: Colors.grey[300],
                                              title: Text('Tools Used:                                                  ',
                                                style: TextStyle(fontSize:20,color: Colors.black, fontWeight: FontWeight.bold),),
                                            ),
                                            //       //child: Text('Quality Assurance:'),
                                            //     )
                                            // ),
                                            // Container(
                                            //     child: Center(
                                            ListTile(
                                              tileColor: Colors.grey[300],
                                              title: Text('JDK ( Java Development Kit)                                              '
                                                  'Eclipse IDE                                                                      '
                                                  'NetBeans                                                                         '
                                                  'Oracle JDeveloper                                                       ',
                                                style: TextStyle(fontSize:16,color: Colors.black87,),),
                                            ),

                                            SizedBox(height: 10,),
                                            // Container(
                                            //     child: Center(
                                            ListTile(
                                              tileColor: Colors.grey[300],
                                              title: Text('Mentors For Software Testing :-                                                           ',
                                                style: TextStyle(fontSize:20,color: Colors.black, fontWeight: FontWeight.bold),),
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
                                        height:350.0,
                                        width: 500.0,

                                        child: ListView(
                                          padding: const EdgeInsets.fromLTRB(20, 35, 0, 35),
                                          scrollDirection: Axis.horizontal,
                                          children: <Widget>[
                                            GestureDetector(
                                              child: Container(
                                                decoration: BoxDecoration(

                                                ),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height: 180,
                                                      width: 190,
                                                      decoration: BoxDecoration(
                                                         // color: Colors.black,
                                                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20),bottomLeft:Radius.circular(20),bottomRight: Radius.circular(20) )
                                                      ),
                                                          child: ClipRRect(
                                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(10),bottomLeft:Radius.circular(10),bottomRight: Radius.circular(10) ),
                                                            child: Image.asset('assets/mentors/puja mam.jpg',
                                                              fit: BoxFit.contain,height: 150,width: 150,),
                                                          ),

                                                      ),


                                                    SizedBox(height: 5),
                                                    Container(
                                                      child: Text(
                                                        'Puja Misal Mam.',
                                                        style: TextStyle(color: Color(0xff2200cc),fontSize: 20, ),
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Text(
                                                        '(Database Developer,',
                                                        style: TextStyle( color: Color(0xff2200cc),fontSize: 20, ),
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Text(
                                                        'Java Developer)',
                                                        style: TextStyle( color: Color(0xff2200cc),fontSize: 20, ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                                onTap: () {
                                                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
                                                    return new DbfirstMentor();
                                                  }));

                                                }
                                            ),
                                            SizedBox(width: 20,),
                                            GestureDetector(
                                              child: Container(
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height: 180,
                                                      width: 190,
                                                      decoration: BoxDecoration(
                                                          //color: Colors.black,
                                                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20),bottomLeft:Radius.circular(20),bottomRight: Radius.circular(20) )
                                                      ),
                                                          child: Image.asset('assets/mentors/vedant sir.jpg',
                                                            fit: BoxFit.contain,height: 150,width: 150,),

                                                      ),

                                                    SizedBox(height: 5),
                                                    Container(
                                                      child: Text(
                                                        'Vedant Khadkekar Sir.',
                                                        style: TextStyle( color: Color(0xff2200cc),fontSize: 20, ),
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Text(
                                                        '(Automation Testing,',
                                                        style: TextStyle( color: Color(0xff2200cc),fontSize: 20, ),
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Text(
                                                        'Java Developer)',
                                                        style: TextStyle( color: Color(0xff2200cc),fontSize: 20, ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                                onTap: () {
                                                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
                                                    return new ThirdMentor();
                                                  }));

                                                }
                                            ),

                                          ],
                                        )
                                    ),

                                    SizedBox(height: 30,),

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



                                  ]
                              )
                          )
                      )




                  ),
                ]
            ),

          ),
        )
    );
  }
}
