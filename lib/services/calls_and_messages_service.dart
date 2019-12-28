
import 'package:url_launcher/url_launcher.dart';

class CallsAndMessagesService {
  void call(String number) => launch("tel://$number");

  void sendSms(String number) => launch("sms:$number");

  void sendEmail(String email) => launch("mailto:$email");


  void launchEmail(String email, String subject, String text) async {
    // ios specification
    final String subject = "Request Info:";
    final String stringText = "Same Message:";
    String uri = 'mailto:'+ email + '?subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(text)}';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      print("No email client found");
    }
  }


  void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }



}