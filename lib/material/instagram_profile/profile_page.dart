import 'package:flutter/material.dart';
import 'package:bootcamp_material/material/instagram_profile/profile_body.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "instagram profile",
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(55),
          child: AppBar(
            backgroundColor: Colors.black,
            title: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                "rafisolichin",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add_box_outlined,
                      size: 30,
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(right: 12.0),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.list_rounded,
                      size: 30,
                    )),
              )
            ],
          ),
        ),
        body: ProfileBody(),
      ),
    );
  }
}
