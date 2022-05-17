import 'package:get/get_navigation/src/root/internacionalization.dart';

class MessageTranslations extends Translations {
  
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US' : {
      'title-app' : 'Test title ingles',
      // LOGIN PAGE
      'title-banner' : 'MOBIN',
      'subtitle-banner' : 'Chat App & Message',
      'login-email' : 'Email',
      'login-password' : 'Password',
      'login-no-account' : 'Don\'t have an account?',
      'login-register-button' : 'Register',
      'login-button' : 'Login',
    },
    'es_ES' : {
      'title-app' : 'Test title spanish',
      // LOGIN PAGE
      'title-banner' : 'MOBIN',
      'subtitle-banner' : 'Chat App & Message',
      'login-email' : 'Correo electrónico',
      'login-password' : 'Contraseña',
      'login-no-account' : '¿No tenés cuenta?',
      'login-register-button' : 'Registrate',
      'login-button' : 'INGRESAR',
    },
  };

}