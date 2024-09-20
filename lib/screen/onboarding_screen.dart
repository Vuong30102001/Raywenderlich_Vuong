import 'package:flutter/material.dart';
import 'package:one_project/models/app_state_manager.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';

class OnboardingScreen extends StatelessWidget{
  const OnboardingScreen({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Onboarding'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: (){
              Provider.of<AppStateManager>(context, listen: false).onboarded();
            },
            child: const Text('Start Using App'),
        ),
      ),
    );
  }
}