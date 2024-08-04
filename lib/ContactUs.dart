import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:itcareerscoach/InkWellDrawer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class ContactUs extends StatelessWidget {
  TextEditingController _numberCtrl = new TextEditingController();

  launchWhatsApp() async {
    final link = WhatsAppUnilink(
      phoneNumber: '+91-9359644407',
      text: "Hey! I'm  want  consultation for my career .",
    );
    await launch('$link');
  }

  _callNumber() async{
    const number = '9766602779'; //set the number here
    await FlutterPhoneDirectCaller.callNumber(number);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: InkWellDrawer(),
      appBar: new AppBar(title: new Text("Contact US "),backgroundColor: Colors.black,),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: ClipPath(
                  clipper: ClippingClass(),
                  child: Container(
                    height: 130.0,
                    decoration: BoxDecoration(color: Colors.black),
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 90.0,
                    width: 90.0,
                    // decoration: BoxDecoration(
                    //   image: new DecorationImage(
                    //     image: new AssetImage("assets/pimg.png"),
                    //   ) ,
                    //   shape: BoxShape.circle,
                    //   border: Border.all(
                    //     color: Colors.white,
                    //     width: 5.0,
                    //   ),
                    // ),
                  ),
                ),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.only(top: 32.0),
            child: Column(
              children: <Widget>[
                Container(
                    child: Text('Hello Friends!!!',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)
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
                          SizedBox(width: 10,),
                          Icon(Icons.arrow_forward_ios,color: Colors.deepPurple,size: 30,),
                        ],
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
                        _callNumber();
                      },
                      // tileColor: Colors.grey[300],
                      minVerticalPadding: 20,
                      contentPadding: EdgeInsets.zero,
                      leading: IconButton(
                        icon: Icon(Icons.call, color: Colors.deepPurple ,size: 40,),
                        onPressed: () {
                          _callNumber();
                        },
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Center(child: Text('Call Us',style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.w900,fontSize: 20),)),

                        ],
                      ),
                      subtitle: Row(
                        children: [
                          Center(child: Text('Our sales team is happy to help you', style: TextStyle(color: Colors.black,fontSize: 16),)),
                          //SizedBox(width: 30,),
                          Icon(Icons.arrow_forward_ios,color: Colors.deepPurple,size: 30,),
                        ],
                      ),

                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: InkWellDrawer(),
      appBar: new AppBar(title: new Text("Profile"),),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: ClipPath(
                  clipper: ClippingClass(),
                  child: Container(
                    height: 130.0,
                    decoration: BoxDecoration(color: Colors.blue),
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 90.0,
                    width: 90.0,
                    decoration: BoxDecoration(
                      image: new DecorationImage(
                        image: new AssetImage("assets/images/bhupesh.jpg"),
                      ) ,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 5.0,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.only(top: 32.0),
            child: Column(
              children: <Widget>[
                Text('Hello Prajakt!!!'),
                Padding(
                  padding:
                  const EdgeInsets.only(top: 22.0, left: 42.0, right: 42.0),
                  child: Center(child: Text('Welcome to your Profile, Although, you do not have much to say in your profile apart from your cool image!!!')),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class ClippingClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 80);
    path.quadraticBezierTo(
      size.width / 4,
      size.height,
      size.width / 2,
      size.height,
    );
    path.quadraticBezierTo(
      size.width - (size.width / 4),
      size.height,
      size.width,
      size.height - 80,
    );
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
