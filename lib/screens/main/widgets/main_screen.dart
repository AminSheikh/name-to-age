import 'package:flutter/material.dart';
import 'package:name_to_age/screens/main/bloc/main_screen_bloc.dart';
import 'package:name_to_age/screens/main/bloc/main_screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'age_estimate_widget.dart';
import 'name_input_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late TextEditingController nameController;
  late MainScreenBloc mainScreenBloc;
  @override
  void initState() {
    nameController = TextEditingController();
    mainScreenBloc = MainScreenBloc(InitMainScreenState());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => mainScreenBloc,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 84, 84, 84),
          title: const Text(
            "Name To Age",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: BlocConsumer<MainScreenBloc, MainScreenState>(
          listenWhen: (previous, current) {
            return current.toString() == "InitMainScreenState";
          },
          listener: (context, state) {
            nameController.clear();
          },
          builder: (context, state) {
            if (state.toString() == "AgeLoadedMainScreenState") {
              return  AgeEstimateWidget(
                name: (state as AgeLoadedMainScreenState).name,
                age: (state).age,
              );
            } else {
              return NameInputWidget(nameController: nameController);
            }
          },
        ),
      ),
    );
  }
}
