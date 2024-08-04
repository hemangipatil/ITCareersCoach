import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class ThirdMentor extends StatefulWidget {
  // const ThirdMentor({Key? key}) : super(key: key);

  @override
  _ThirdMentorState createState() => _ThirdMentorState();
}

class _ThirdMentorState extends State<ThirdMentor> {
  launchWhatsApp() async {
    final link = WhatsAppUnilink(
      phoneNumber: '+91-9359644407',
      text: "Hey! I'm inquiring about the Testing & Java Courses.",
    );
    await launch('$link');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Mentors')),
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
                height: 1800, // THis is the fixed length of the screen
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                decoration: BoxDecoration(
                    gradient:
                        LinearGradient(begin: Alignment.topCenter, colors: [
                  Colors.black,
                  Colors.black,
                  Colors.black,
                ])),
                child: Column(
                  children: [
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
                                        Center(
                                          child: CircleAvatar(
                                            radius: 80,
                                            backgroundImage: AssetImage(
                                                'assets/mentors/vedant sir.jpg'),
                                            //child: Image.asset('assets/prajakt.jpg'),
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        ListTile(
                                          tileColor: Colors.grey[300],
                                          title: Text(
                                            'Mr. Vedant Khadkekar Sir.(Automation Testing,Java Developer)',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        ),
                                        //SizedBox(height: 5,),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        ListTile(
                                          tileColor: Colors.grey[300],
                                          title: Text(
                                            '                     Worked At:-                                             '
                                            'Cognizant Technology Solutions.',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        ListTile(
                                          tileColor: Colors.grey[300],
                                          title: Text(
                                            'Technologies:- Testing ,Java,Python',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black),
                                          ),
                                        ),

                                        SizedBox(
                                          height: 5,
                                        ),
                                        ListTile(
                                          tileColor: Colors.grey[300],
                                          title: Text(
                                            'Tools:- Perfecto, Selenium, JIRA, HP_ALM',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black),
                                          ),
                                        ),

                                        SizedBox(
                                          height: 5,
                                        ),
                                        ListTile(
                                          tileColor: Colors.grey[300],
                                          title: Text(
                                            'Experience:- 7+ Years of Experience.                ',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black),
                                          ),
                                        ),

                                        SizedBox(height: 30),
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


                                        )
                                      ],
                                    ))
                              ]))),
                    )
                  ],
                )

                // body: Container(
                //   color: Colors.black,
                //   child: Column(
                //     children: [
                //       SizedBox(height: 20,),
                //       Center(
                //         child: CircleAvatar(
                //           radius: 50,
                //           backgroundImage: AssetImage('assets/prajakt.jpg'),
                //           //child: Image.asset('assets/prajakt.jpg'),
                //         ),
                //       ),
                //       SizedBox(height: 20,),
                //       Container(
                //         child: Text(
                //           'Mr. Prajakt Patil.',
                //           style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),
                //         ),
                //       ),
                //       SizedBox(height: 5,),
                //       Container(
                //         child: Center(
                //           child: Text(
                //             'I am completed my engineering in E&Tc in Government College of Engineering. I am worked at J.P.Morgan As Senior Quality Assurance Analyst And Capgemini As a Senior. I am Instructor of Testing and Android',
                //             style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white70),
                //           ),
                //         ),
                //       ),
                //       // ListTile(
                //       //   tileColor: Colors.grey[900],
                //       //   title: Text(
                //       //     'Education:- ',
                //       //     style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),
                //       //   ),
                //       // ),
                //       // //SizedBox(height: 10,),
                //       // ListTile(
                //       //   tileColor: Colors.grey[900],
                //       //   title: Text(
                //       //     '         BE(E & TC) In Government College of Engineering.',
                //       //     style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white70),
                //       //   ),
                //       // ),
                //       // SizedBox(height: 5,),
                //       // ListTile(
                //       //   tileColor: Colors.grey[900],
                //       //   title: Text(
                //       //     'Worked Experience:- ',
                //       //     style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),
                //       //   ),
                //       // ),
                //       // //SizedBox(height: 10,),
                //       // ListTile(
                //       //   tileColor: Colors.grey[900],
                //       //   title: Text(
                //       //     'Capgemini                                           '
                //       //     'J.P.Morgan.',
                //       //     style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white70),
                //       //   ),
                //       // ),
                //       // SizedBox(height: 5,),
                //       // ListTile(
                //       //   tileColor: Colors.grey[900],
                //       //   title: Text(
                //       //     'Instructor Of:- ',
                //       //     style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),
                //       //   ),
                //       // ),
                //       // //SizedBox(height: 10,),
                //       // ListTile(
                //       //   tileColor: Colors.grey[900],
                //       //   title: Text(
                //       //     'Testing                                                        '
                //       //     'Android',
                //       //     style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white70),
                //       //   ),
                //       // ),
                //       SizedBox(height: 30),
                //       Container(
                //         height: 50,
                //         width: 300,
                //         margin: EdgeInsets.symmetric(horizontal: 10),
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(50),
                //           color: Colors.orange[900],
                //         ),
                //         // child: IconButton(
                //         //   onPressed: () {
                //         //      launchWhatsApp();
                //         //   },
                //         //   icon: Image.asset("assets/wa2.png",fit:BoxFit.fill,),
                //         // ),
                //         child: new FlatButton(
                //             onPressed: () {
                //               launchWhatsApp();
                //             },
                //             child: new RichText(
                //                 text: TextSpan(
                //                     style: Theme.of(context).textTheme.body1,
                //                     children: [
                //                       TextSpan(text: 'Connect With Mentor',style: TextStyle(fontSize: 20,color: Colors.white)),
                //                       WidgetSpan(
                //                           child: Padding(
                //                             padding: const EdgeInsets.symmetric(horizontal: 2.0),
                //                             child: Icon(Icons.share,color: Colors.white,),
                //                           )
                //                       )
                //                     ]
                //                 )
                //             )
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                )));
  }
}
