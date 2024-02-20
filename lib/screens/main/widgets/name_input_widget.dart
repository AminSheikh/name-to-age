import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:name_to_age/screens/main/bloc/main_screen_bloc.dart';

import '../bloc/main_screen_event.dart';
import '../bloc/main_screen_state.dart';

class NameInputWidget extends StatelessWidget {
  const NameInputWidget({
    super.key,
    required this.nameController,
  });
  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Please enter a name\nto get an age estimation",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          TextField(
            controller: nameController,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 60,
            child: TextButton(
              onPressed: () {
                if (nameController.text.isEmpty == true) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        contentPadding:
                            const EdgeInsets.all(30).copyWith(bottom: 10),
                        content: const Text(
                          "Please enter a name",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.maybePop(context),
                            child: const Text("ok"),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  BlocProvider.of<MainScreenBloc>(context).add(
                    GetAgeEstimationEvent(name: nameController.text),
                  );
                }
              },
              child: BlocProvider.of<MainScreenBloc>(context).state ==
                      AgeLoadingMainScreenState()
                  ? const CircularProgressIndicator()
                  : const Text(
                      "Estimate",
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
