import 'package:flutter/material.dart';
import 'package:name_to_age/name_to_age_app.dart';

import 'services/api.service.dart';

void main() {
  _initializeApi();
  runApp(const NameToAgeApp());
}

Future<void> _initializeApi() async {
  await ApiService().initialize();
}
