import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; 
import 'package:unitrack/model/Model.dart';
import '../widgets/CfuWidget.dart'; 
import '../widgets/buttons/ChangeTheme.dart';
import '../widgets/buttons/AddExamBt.dart'; 
import '../widgets/buttons/GoSimulate.dart'; 
import 'package:unitrack/UI/DialogBox/NameBox.dart'; 

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(modelProvider);

    return Scaffold( 
      backgroundColor: Colors.transparent, 
      body: Stack(
        children: [
          SafeArea(
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
                            'Bentornato, ${model.nomestudente ?? "Studente"}',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 40),
                    
                    const Center(
                      child: Column(
                        children: [
                          CfuCard(), 
                          SizedBox(height: 50),
                          AddExamBt(),
                          SizedBox(height: 30),
                          GoSimulate(),
                          SizedBox(height: 30),
                          Changetheme(),
                          
                          SizedBox(height: 100), 
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          if (model.isNameEmpty) 
            const Namebox(),
        ],
      ),
    );
  }
}