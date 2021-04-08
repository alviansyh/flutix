import 'dart:ui';

import 'package:another_flushbar/flushbar.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutix/bloc/blocs.dart';
import 'package:flutix/models/models.dart';
import 'package:flutix/services/services.dart';
import 'package:flutix/shared/shared.dart';
import 'package:flutix/ui/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

part 'splash_page.dart';
part 'main_page.dart';
part 'signin_page.dart';
part 'wrapper.dart';