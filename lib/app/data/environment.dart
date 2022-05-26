import 'package:flutter/material.dart';

class Environment {

  static const COLOR_PRIMARY   = Color(0xFF06c8a1);
  static const COLOR_SECONDARY = Color(0xFFd0fff6);
  static const COLOR_TERCIARY  = Color(0xFF09F8c8);
  static const COLOR_BLACK1    = Color(0xFF161b2f);
  static const COLOR_BLACK2    = Color(0xFF272f51);
  static const COLOR_GREY      = Color(0xFF384373);

  // Routes
  static const PATH_LOGIN_PAGE    = '/login';
  static const PATH_SIGN_UP_PAGE  = '/sign-up';
  static const PATH_HOME          = '/app/home';

  // Api - Backend
  static const HOST_DEV  = 'http://192.168.1.23:3000';
  static const HOST_PROD = 'http://192.168.1.23:3000';

  static const HOST = HOST_DEV;

  static const ENDPOINT_LOGIN   = '/api/auth/login/';
  static const ENDPOINT_SIGN_UP = '/api/auth/register/';
  

  static const ENDPOINT_USERS   = '/api/user/';

}