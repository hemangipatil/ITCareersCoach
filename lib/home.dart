import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:itcareerscoach/CareerPages/DataBase.dart';
import 'package:itcareerscoach/CareerPages/Java.dart';
import 'package:itcareerscoach/CareerPages/MobileApplicationsDeveloper.dart';
import 'package:itcareerscoach/CareerPages/QA.dart';
import 'package:itcareerscoach/InkWellDrawer.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String uid;
  int _currentIndex = 0;
  CarouselSlider carouselSlider;
  int _current = 0;
  String  PageName ='Database';

  List imgList = [
    'assets/testing2.png',
    'assets/android1.png',
    'assets/database3.png',
    'assets/java1.png'
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  // Future<void> share(dynamic link,String title) async {
  //   await FlutterShare.share(
  //     title: 'Welcome to IT Careers Coach' ,
  //     text: title,
  //     linkUrl: 'https://play.google.com/store/apps/details?id=com.itcareerscoach.itcareerscoach',
  //     chooserTitle: 'please download this link of this app'
  //   );
  // }

  launchWhatsApp() async {
    final link = WhatsAppUnilink(
      phoneNumber: '+91-9359644407',
      text: "Hey! I'm  want  consultation for my career .",
    );
    await launch('$link');
  }



  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async {
        Fluttertoast.showToast(
          msg: 'Do you want to logout',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,

        );

        return false;
      },


      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          backgroundColor: Colors.black,
          actions: [
            new FlatButton(
                onPressed: () {
                  Share.share("please download this link of this app:- https://play.google.com/store/apps/details?id=com.itcareerscoach.itcareerscoach");
                  //Navigator.of(context).pushNamed("/forgotPassword")
                },
                // child: new Text('Share',style: TextStyle(fontSize: 20,color: Colors.white), )
                child: new RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.body1,
                    children: [
                      TextSpan(text: 'SHARE ',style: TextStyle(fontSize: 20,color: Colors.white)),
                      WidgetSpan(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: Icon(Icons.share,color: Colors.white,),
                        ),
                      ),
                    ],
                  ),
                )
            ),

            // IconButton(
            //   icon: Icon(Icons.logout),
            //   onPressed: () async {
            //     await FirebaseAuth.instance.signOut();
            //     Navigator.pushAndRemoveUntil(
            //         context,
            //         MaterialPageRoute(builder: (context) => LoginScreen()),
            //         (route) => false);
            //   },
            // )
          ],
        ),
        drawer: InkWellDrawer(),
        body:  SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: 1500,// THis is the fixed length of the screen
            //          width: double.infinity,
            // padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    colors: [
                      Colors.black,
                      Colors.black,
                      Colors.black
                    ]
                )
            ),
            child: Column(
              children: [


                SizedBox(height: 20,),// FOr changing the height of white Column /
                Text('IT Careers Coach',style: TextStyle(fontSize:40,color: Colors.white)),
                SizedBox(height: 10,),





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
                          SizedBox(height: 20,),
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.grey[50],
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(225, 97, 27, .3),
                                      blurRadius: 20,
                                      offset: Offset(0,10)
                                  )
                                ]

                            ),
                            child: Column(
                              children: [

                              ],
                            ),
                          ),


                          SizedBox(height:20 ),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                carouselSlider = CarouselSlider(

                                  options: CarouselOptions(
                                    height: 300.0,
                                    initialPage: 0,
                                    enlargeCenterPage: true,
                                    autoPlay: true,
                                    reverse: false,
                                    enableInfiniteScroll: true,
                                    autoPlayInterval: Duration(seconds: 5),
                                    autoPlayAnimationDuration: Duration(milliseconds: 2000),
                                    //  pauseAutoPlayOnTouch: Duration(seconds: 10),
                                    scrollDirection: Axis.horizontal,
                                    onPageChanged: (index,reason) {
                                      setState(() {
                                        _current = index;
                                      });
                                    },
                                  ),
                                  items: imgList.map((imgUrl) {
                                    return Builder(
                                      builder: (BuildContext context) {
                                        return Container(
                                          width: MediaQuery.of(context).size.width,
                                          margin: EdgeInsets.symmetric(horizontal: 10.0),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child : new GestureDetector(
                                            // child: Image.network(
                                            //   imgUrl,
                                            //   fit: BoxFit.fill,
                                            child:
                                            Stack(
                                                children:<Widget>[
                                                  Container(
                                                    child: Image.asset(imgUrl, fit: BoxFit.fill,),
                                                  ),
                                                  Container(
                                                      alignment: Alignment.bottomRight,
                                                      child: Image.asset('assets/click me.png',height: 150,width: 150,)
                                                  )
                                                  // IconButton(
                                                  //   icon: const Icon(Icons.touch_app),
                                                  //   tooltip: 'Select image',
                                                  // )
                                                ]
                                            ),


                                            onTap: (){

                                              print('current page selected -$_current');
                                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                                switch (_current) {
                                                  case 0:
                                                    return QA();
                                                    break;
                                                  case 1:
                                                    return MobilApplicationsDeveloper();
                                                    break;
                                                  case 2:
                                                    return Database();
                                                    break;
                                                  case 3:
                                                    return Java();
                                                    break;

                                                  default:
                                                    return Database();
                                                }
                                              }));






                                            },
                                          ),

                                        );
                                      },
                                    );
                                  }).toList(),
                                ),
                                SizedBox(
                                  height: 20,
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: map<Widget>(imgList, (index, url) {
                                    return Container(
                                      width: 10.0,
                                      height: 10.0,
                                      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: _current == index ? Colors.redAccent : Colors.green,
                                      ),
                                    );
                                  }),
                                ),
                                SizedBox(
                                  height: 1.0,
                                ),
                                //Text('Select IT Job Career ',style: TextStyle(fontSize:19,color: Colors.black),),

                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   children: <Widget>[
                                //     OutlineButton(
                                //       onPressed: goToPrevious,
                                //       child: Text("<"),
                                //     ),
                                //     OutlineButton(
                                //       onPressed: goToNext,
                                //       child: Text(">"),
                                //     ),
                                //   ],
                                //
                                // ),
                              ],
                            ),
                          ),
                          SizedBox(height:1 ),
                          // Container(
                          //     color: Colors.white,
                          //     margin: EdgeInsets.symmetric(vertical: 1.0),
                          //     height:305.0,
                          //     width: 1000.0,
                          //
                          //     child: ListView(
                          //       padding: const EdgeInsets.fromLTRB(20, 35, 0, 35),
                          //       scrollDirection: Axis.horizontal,
                          //       children: <Widget>[
                          //         Container(
                          //           decoration: BoxDecoration(
                          //
                          //           ),
                          //           child: Column(
                          //             children: [
                          //               Container(
                          //
                          //                 // decoration: BoxDecoration(
                          //                 //     color: Colors.black,
                          //                 //     borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20),bottomLeft:Radius.circular(20),bottomRight: Radius.circular(20) )
                          //                 // ),
                          //                 child: GestureDetector(
                          //                     child: Image.asset('assets/testing3.png',
                          //                       fit: BoxFit.contain,height: 200,width: 200,),
                          //                     onTap: () {
                          //                       Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
                          //                         return new QA();
                          //                       }));
                          //
                          //                     }
                          //                 ),
                          //               ),
                          //
                          //               SizedBox(width: 5),
                          //             ],
                          //           ),
                          //         ),
                          //         SizedBox(width: 20,),
                          //         Container(
                          //           child: Column(
                          //             children: [
                          //               Container(
                          //
                          //                 child: GestureDetector(
                          //                     child: Image.asset('assets/android3.png',fit: BoxFit.contain,height: 200,width: 200,),
                          //                   onTap: () {
                          //                     Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
                          //                       return new MobilApplicationsDeveloper();
                          //                     }));
                          //                   },
                          //                 ),
                          //               ),
                          //               SizedBox(height: 5),
                          //             ],
                          //           ),
                          //         ),
                          //         SizedBox(width: 20,),
                          //         Container(
                          //           child: Column(
                          //             children: [
                          //               Container(
                          //                 child: GestureDetector(
                          //                   child: Image.asset('assets/database4.png',fit: BoxFit.contain,height: 200,width: 200,),
                          //                   onTap: () {
                          //                     Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
                          //                       return new Database();
                          //                     }));
                          //                   },
                          //                 ),
                          //               ),
                          //               SizedBox(height: 5),
                          //
                          //
                          //             ],
                          //           ),
                          //         ),
                          //         SizedBox(width: 20,),
                          //         Container(
                          //           child: Column(
                          //             children: [
                          //               Container(
                          //                 child: GestureDetector(
                          //                   child: Image.asset('assets/java3.png',fit: BoxFit.contain,height: 200,width: 200,),
                          //                   onTap: () {
                          //                     Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
                          //                       return new Java();
                          //                     }));
                          //                   },
                          //                 ),
                          //               ),
                          //               SizedBox(height: 5,width: 20,),
                          //
                          //
                          //             ],
                          //           ),
                          //         ),
                          //       ],
                          //     )
                          // ),

                          // Container(
                          //   height: 50,
                          //   margin: EdgeInsets.symmetric(horizontal: 50),
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(50),
                          //     color: Colors.orange[900],
                          //   ),
                          //   child:FlatButton(
                          //       onPressed: ()  {
                          //         Navigator.pushAndRemoveUntil(
                          //             context,
                          //             MaterialPageRoute(builder: (context) => CarouselDemo()),
                          //                 (route) => false);
                          //       //  Navigator.of(context).popUntil(ModalRoute.withName("/home")); // Use popUntill if you want to reset all routes untill now and completely logout user
                          //         //Navigator.of(context).pushReplacementNamed("/");
                          //         // Just to show login page and resume back after login
                          //         // Navigator.of(context).pushNamed('/Login');
                          //         // On login page after successful login Navigator.of(context).pop();
                          //         // the app will resume with its last route.
                          //       },
                          //       // onPressed: () =>
                          //       //    Navigator.of(context).pushReplacementNamed("/Login"),
                          //       child: new Text("Great Careers to explore",style: TextStyle(fontSize: 20,color: Colors.white),)),
                          //   //Center(child: Text('Login',style: TextStyle(fontSize: 20,color: Colors.white),)),
                          // ),
                          SizedBox(height: 20,),
                          Text('CLICK Above  IT  Careers ',style: TextStyle(fontSize:19,color: Colors.black),),
                          SizedBox(height: 30,),

                          //

                          SizedBox(height: 30,),
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
                                      Share.share("please download this link of this app:- https://play.google.com/store/apps/details?id=com.itcareerscoach.itcareerscoach");
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
                                    Center(child: Text('Chat With Us',style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.w900,fontSize: 20),)),

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


                          Row(
                            children: [
                              // Expanded(
                              //   child: Container(
                              //     height: 50,
                              //     margin: EdgeInsets.symmetric(horizontal: 10),
                              //     decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(50),
                              //       color: Colors.orange[900],
                              //     ),
                              //     child: //
                              //     // Takes user to forgot password page
                              //     new FlatButton(
                              //         onPressed: () {
                              //           Navigator.pushAndRemoveUntil(
                              //               context,
                              //               MaterialPageRoute(builder: (context) => FormScreen()),
                              //                   (route) => false);
                              //
                              //         },
                              //         child: new Text('JoinUs',style: TextStyle(fontSize: 20,color: Colors.white),)),
                              //     // Center(child: Text('Facebook',style: TextStyle(fontSize: 20,color: Colors.white),)),
                              //   ),
                              // ),
                              SizedBox(width: 20,),


                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 20,),

                                    // Container(
                                    //   height: 50,
                                    //   margin: EdgeInsets.symmetric(horizontal: 10),
                                    //   decoration: BoxDecoration(
                                    //     borderRadius: BorderRadius.circular(50),
                                    //     color: Colors.orange[900],
                                    //   ),
                                    //   child: //
                                    //   new FlatButton(
                                    //       onPressed: () {
                                    //         Share.share("please download this link of this app");
                                    //           //Navigator.of(context).pushNamed("/forgotPassword")
                                    //       },
                                    //       // child: new Text('Share',style: TextStyle(fontSize: 20,color: Colors.white), )
                                    //       child: new RichText(
                                    //         text: TextSpan(
                                    //           style: Theme.of(context).textTheme.body1,
                                    //           children: [
                                    //             TextSpan(text: 'SHARE ',style: TextStyle(fontSize: 20,color: Colors.white)),
                                    //             WidgetSpan(
                                    //               child: Padding(
                                    //                 padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                    //                 child: Icon(Icons.share,color: Colors.white,),
                                    //               ),
                                    //             ),
                                    //           ],
                                    //         ),
                                    //       )
                                    //   ),
                                    //
                                    //   // Center(child: Text('Google',style: TextStyle(fontSize: 20,color: Colors.white),)),
                                    // ),
                                    // SizedBox(height: 20),
                                    // // Container(
                                    // //     height: 100,
                                    // //     //width: 300,
                                    // //     margin: EdgeInsets.symmetric(horizontal: 1),
                                    // //     decoration: BoxDecoration(
                                    // //       borderRadius: BorderRadius.circular(20),
                                    // //       //color: Colors.orange[900],
                                    // //         gradient: LinearGradient(
                                    // //             begin: Alignment.topCenter,
                                    // //             colors: [
                                    // //               Colors.grey,
                                    // //               Colors.grey,
                                    // //               Colors.grey
                                    // //             ]
                                    // //         )
                                    // //     ),
                                    // //
                                    // //
                                    // //
                                    // // //     child: //
                                    // // //     new FlatButton(
                                    // // //         onPressed: () {
                                    // // //           launchWhatsApp();
                                    // // //         },
                                    // // //         child: new RichText(
                                    // // //             text: TextSpan(
                                    // // //                 style: Theme.of(context).textTheme.body1,
                                    // // //                 children: [
                                    // // //                   TextSpan(text: 'If you are not sure which career is beter for you  consult  With Mentors',style: TextStyle(fontSize: 20,color: Colors.black)),
                                    // // //                   WidgetSpan(
                                    // // //                       child: Padding(
                                    // // //                         padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                    // // //                         child: Icon(Icons.touch_app_outlined,color: Colors.black,),
                                    // // //                       )
                                    // // //                   )
                                    // // //                 ]
                                    // // //             )
                                    // // //         )
                                    // // //     )
                                    // // ),
                                    // SizedBox(height: 5),
                                    // Container(
                                    //   child: Column(
                                    //     children: [
                                    //       Container(
                                    //         child: ElevatedButton.icon(
                                    //             onPressed: (){
                                    //               Share.share("please download this link of this app");
                                    //             },
                                    //             label: Text('Share'),
                                    //             icon: Icon(Icons.share),
                                    //             style: ElevatedButton.styleFrom(
                                    //               primary: Colors.greenAccent,
                                    //             )
                                    //         ),
                                    //       ),
                                    //       SizedBox(height: 20,),
                                    //       Container(
                                    //         child: ElevatedButton.icon(
                                    //             onPressed: (){
                                    //               launchWhatsApp();
                                    //             },
                                    //             label: Text('Connect With Mentors'),
                                    //             icon: Icon(Icons.share),
                                    //             style: ElevatedButton.styleFrom(
                                    //                 primary: Colors.greenAccent,
                                    //             )
                                    //         ),
                                    //       )
                                    //
                                    //     ],
                                    //   ),
                                    // ),

                                    //ClipRRect(
                                    // borderRadius: BorderRadius.circular(50),
                                    // Center(
                                    //   child: Container(
                                    //       height: 150,
                                    //       width: 600,
                                    //      // margin: EdgeInsets.all(10),
                                    //       padding: EdgeInsets.fromLTRB(10,0,20, 0),
                                    //       alignment: Alignment.center,
                                    //     decoration: BoxDecoration(
                                    //       color: Colors.grey[300],
                                    //       border: Border.all(
                                    //           color: Colors.grey[300], // Set border color
                                    //           width: 3.0),
                                    //       borderRadius: BorderRadius.all(
                                    //           Radius.circular(20.0)),
                                    //         boxShadow: [BoxShadow(blurRadius: 10,color: Colors.black,offset: Offset(1,3))]
                                    //     ),
                                    //
                                    //       child: Column(
                                    //         children: [
                                    //           Container(
                                    //                 color: Colors.grey[300],
                                    //                 child: Text('If you are not sure which career is better for you, consult With Mentors',style: TextStyle(fontSize: 20,color: Colors.black)),
                                    //           ),
                                    //           Row(
                                    //             children: [
                                    //               Container(
                                    //                 color: Colors.grey[300],
                                    //                 child: GestureDetector(
                                    //                     child: Text('WhatsApp',style: TextStyle(fontSize: 20,color: Colors.blue[500],decoration: TextDecoration.underline)),
                                    //                   onTap: () {
                                    //                     launchWhatsApp();
                                    //                   },
                                    //                 ),
                                    //               ),
                                    //               Container(
                                    //                 color: Colors.grey[300],
                                    //                 child: Card(
                                    //                   elevation: 5,
                                    //                   child: GestureDetector(
                                    //                       child: Image.asset('assets/wa1.jpeg',
                                    //                         fit: BoxFit.contain,height: 50,width: 50,),
                                    //                       onTap: () {
                                    //                         launchWhatsApp();
                                    //                       }
                                    //
                                    //                   ),
                                    //                 ),
                                    //               ),
                                    //             ],
                                    //           ),
                                    //
                                    //
                                    //
                                    //
                                    //
                                    //         ],
                                    //       ),
                                    //     ),
                                    // ),
                                    // ),
                                  ],
                                ),
                              ),

                            ],
                          )
                        ],
                      ),

                    ),
                  ),
                )
              ],
            ),

          ),
        ) ,

      ),
    );

  }

  void initState() {
    // TODO: implement initState
    super.initState();
    //uid = FirebaseAuth.instance.currentUser.uid;
  }


}

