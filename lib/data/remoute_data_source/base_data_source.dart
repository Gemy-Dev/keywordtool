

import 'dart:io';

abstract class DataSource {
  Future<List<String>> googleKeywordSearch(
      String keyword, BrowserType browserType);
  Future<List<String>> youtubeKeywordSearch(
      String keyword, BrowserType browserType);
  Future<List<String>> amazonKeywordSerach(String keyword);
  Future<List<String>> bingKeywordSerach(String keyword);
  Future<List<String>> yahooKeywordSerach(String keyword);
  Future<List<String>> ebayKeywordSerach(String keyword);
  //Future<List<String>> youtubeKeywordSearch(String keyword);
  // amazonKeywordSearch(String keyword);
//  youtubeVideoDetails(String url);
}

enum BrowserType {
  chrome('chrome'),
  firefox('firefox');

  final String browserName;

  const BrowserType(this.browserName);
}

// class MyHttpOverrides extends HttpOverrides {
//   HttpClient createhttpclient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//   }
// }
