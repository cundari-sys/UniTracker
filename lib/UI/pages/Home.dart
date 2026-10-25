import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/CfuWidget.dart'; 
import '../widgets/buttons/ChangeTheme.dart'; 
import '../widgets/buttons/AddExamBt.dart'; 
import '../widgets/buttons/GoSimulate.dart'; 

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor: Colors.transparent, 
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(), 
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                      const Icon(CupertinoIcons.house_fill, color: Color.fromARGB(255, 17, 231, 231), size: 28),
                      const SizedBox(width: 10),
                      Text(
                        'Home',
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 40),
                
                Center(
                  child: Column(
                    children: [
                      const CfuCard(), 
                      const SizedBox(height: 50),
                      const AddExamBt(),
                      const SizedBox(height: 30),
                      const GoSimulate(),
                      const SizedBox(height: 30),
                      const Changetheme(),
                      
                      const SizedBox(height: 100), 
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}