import 'package:assignment/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(onPressed: (){
          Provider.of<ThemeProvider>(context , listen: false ).toggleTheme();
        }, child: Icon(Icons.brightness_medium)),
      ) ,
    );
  }
}
