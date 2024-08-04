
import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';


class loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: SpinKitFadingCube(
              color: Colors.white,
              size: 80.0,
            ),
          )
      );
  }
}


//

