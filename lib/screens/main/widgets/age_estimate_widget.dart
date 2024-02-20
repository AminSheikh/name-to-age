import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:name_to_age/screens/main/bloc/main_screen_event.dart';

import '../bloc/main_screen_bloc.dart';

class AgeEstimateWidget extends StatelessWidget {
  const AgeEstimateWidget({
    super.key,
    required this.name,
    required this.age,
  });
  final String name;
  final int age;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           Text(
            "Age Estimation for\n$name is $age",
            textAlign: TextAlign.center,
            style:const  TextStyle(
              fontSize: 29,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          SizedBox(
            height: 60,
            child: TextButton(
              onPressed: () {
                BlocProvider.of<MainScreenBloc>(context).add(
                  ResetMainScreenEvent(),
                );
              },
              child: const Text(
                "Try again",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
