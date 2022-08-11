import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../viewmodels/auth_view_model.dart';

const Color appBlack = Color(0xff0f0627);
const Color appWhite = Color(0xffffffff);
const Color appBlue = Color(0xff0047ff);
const Color appGrey = Color(0xff9a96a4);
const Color offWhite = Color(0xfff8f8f9);
const Color textGrey = Color(0xff757886);

final allProviders = <SingleChildWidget>[
  ChangeNotifierProvider(create: (_) => AuthViewModel()),
];
