import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:house_rent/views/screens/home_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          _buildLocationDropDown(),
        ],
      ),
      drawer: _buildDrawer(),
      body: const HomePage(),
    );
  }

  Widget _buildDrawer() {
    return SafeArea(
        child: Drawer(
      width: 200,
      backgroundColor: Colors.blue.withOpacity(.9),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            tileColor: Colors.white,
            title: Text('Home'),
            leading: Icon(Icons.home),
          ),
          ListTile(title: Text('Profile'), leading: Icon(Icons.person)),
          ListTile(title: Text('Saved'), leading: Icon(Icons.bookmark)),
          ListTile(title: Text('Booked'), leading: Icon(Icons.contacts)),
          ListTile(
              title: Text('Notification'),
              leading: Icon(Icons.notification_add)),
          ListTile(title: Text('Settings'), leading: Icon(Icons.settings)),
          ListTile(title: Text('Help'), leading: Icon(Icons.help)),
          ListTile(title: Text('Logout'), leading: Icon(Icons.logout)),
        ],
      ),
    ));
  }

  Widget _buildLocationDropDown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownMenu(
            initialSelection: 2,
            width: 130.w,
            label: const Text('Location'),
            inputDecorationTheme: InputDecorationTheme(
                labelStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 12.sp,
                  //fontWeight: FontWeight.w400,
                ),
                border: InputBorder.none),
            trailingIcon: Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Image.asset('lib/assets/IC_Arrow down.png'),
            ),
            textStyle: TextStyle(fontSize: 10.sp),
            dropdownMenuEntries: const [
              DropdownMenuEntry(value: 1, label: 'Noakhali'),
              DropdownMenuEntry(value: 2, label: 'Dhaka'),
              DropdownMenuEntry(value: 1, label: 'Comilla'),
              DropdownMenuEntry(value: 1, label: 'Sylet'),
              DropdownMenuEntry(value: 1, label: 'Chottogram'),
            ])
      ],
    );
  }
}
