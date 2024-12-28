import 'package:url_launcher/url_launcher.dart';

launchURL(myURL) async {
  final Uri url = Uri.parse(myURL);
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}