import 'package:blended_learning_system/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({Key? key}) : super(key: key);
  static String routeName = 'MyProfileScreen';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Scaffold(
        //app bar theme for tablet
        appBar: AppBar(
          title: Text('My Profile'),
          actions: [
            InkWell(
              onTap: () {
                //send report to school management, in case if you want some changes to your profile
              },
              child: Container(
                padding: EdgeInsets.only(right: kDefaultPadding / 2),
                child: Row(
                  children: [
                    Icon(Icons.report_gmailerrorred_outlined),
                    kHalfWidthSizedBox,
                    Text(
                      'Report',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        body: Container(
          color: kOtherColor,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(kDefaultPadding * 2),
                    bottomLeft: Radius.circular(kDefaultPadding * 2),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      maxRadius: 50.0,
                      minRadius: 50.0,
                      backgroundColor: kSecondaryColor,
                      backgroundImage:
                          AssetImage('images/learner.jpeg'),
                    ),
                    kWidthSizedBox,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Mpho Letshwenyo',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Text('Grade 12 A',
                            style: Theme.of(context).textTheme.subtitle2!.copyWith(
                              fontSize: 14.0,
                            )),
                      ],
                    )
                  ],
                ),
              ),
              sizedBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ProfileDetailRow(title: 'Registration Number', value: '2020-ADSDF-2022'),
                  ProfileDetailRow(title: 'Academic Year', value: '2022'),
                ],
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ProfileDetailRow(title: 'Admission Class', value: '12 A'),
                  ProfileDetailRow(title: 'Admission Number', value: '000126'),
                ],
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ProfileDetailRow(title: 'Date of Admission', value: '8 Jan, 2020'),
                  ProfileDetailRow(title: 'Date of Birth', value: '3 May 2005'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("A Class", style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: kTextLightColor,
                        fontSize: 15.0,
                      ),
                      ),
                      kHalfSizedBox,
                       Text("AHSHS", style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: kTextBlackColor,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                      ),
                      ),
                      kHalfSizedBox,
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.1,
                        child: Divider(
                          thickness: 1.0,
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.lock_outline, size: 20.0,)
                ],
              ),
              ProfileDetailColumn(title: 'Email', value: 'mpholetswenyo@gmail.com',),
              ProfileDetailColumn(title: 'Phone Number', value: '0670326449',),
    
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileDetailRow extends StatelessWidget {
  const ProfileDetailRow({Key? key, required this.title, required this.value})
      : super(key: key);
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          right: kDefaultPadding / 4, 
          left: kDefaultPadding / 4,
          top: kDefaultPadding / 2),
      width: MediaQuery.of(context).size.width /2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title
              ),
              kHalfSizedBox,
              Text(value, style: Theme.of(context).textTheme.caption),
              kHalfSizedBox,
              SizedBox(
                width: MediaQuery.of(context).size.width /3,
                child: Divider(
                  thickness: 1.0,
                ),
              ),
            ],
          ),
          Icon(
            Icons.lock_outline,
            size: 10.sp,
          ),
        ],
      ),
    );
  }
}

class ProfileDetailColumn extends StatelessWidget {
  const ProfileDetailColumn(
      {Key? key, required this.title, required this.value})
      : super(key: key);
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                     color: kTextBlackColor,
                     fontSize: 15.0,
                     fontWeight: FontWeight.w600
                    ),
              ),
              kHalfSizedBox,
              Text(value, style: Theme.of(context).textTheme.caption),
              kHalfSizedBox,
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                child: Divider(
                  thickness: 1.0,
                ),
              ),
            ],
          ),
          Icon(
            Icons.lock_outline,
            size: 20.0,
          ),
        ],
      ),
    );
  }
}

