import 'dart:convert';

import 'package:keyword_planner/core/errors/error.dart';
import 'package:keyword_planner/core/helper_fn.dart';
import 'package:keyword_planner/core/url.dart';
import 'package:keyword_planner/data/remoute_data_source/base_data_source.dart';

class DataSourceImpl implements DataSource {
  // final Map<String, String> _gHeaders = {
  //   'User-agent': 'Mozilla/5.0',
  //   "x-requested-with": "XMLHttpRequest",
  //   "Access-Control-Allow-Origin": "*", // Required for CORS support to work
  //   "Access-Control-Allow-Credentials":
  //       "true", // Required for cookies, authorization headers with HTTPS
  //   "Access-Control-Allow-Headers":
  //       "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
  //   "Access-Control-Allow-Methods": "GET, POST, OPTIONS",
  // };
  @override
  Future<List<String>> googleKeywordSearch(
      String keyword, BrowserType browserType,
      [String langCode = 'en', List<String> letter = const []]) async {
    final Map<String, dynamic> query = {
      "client": browserType.browserName,
      'q': keyword
    };
    List<String> keywords = [];
    try {
      final jsonData = await helperFn(googleSuggestionUrl,
          unencodedPath: '/complete/search',
          query: query,
          headers: globalHeader);

      for (String keyword in jsonData[1]) {
        keywords.add(keyword);
      }

      return keywords;
    } on StatusCodeException catch (e) {
      throw StatusCodeException(e.toString());
    } catch (e) {
      throw ClientErrorException(e.toString());
    }
  }

  // @override
  // Future<List<String>> googleKeywordRelated(String keyword) async {
  //   const userAgent =
  //       "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:65.0) Gecko/20100101 Firefox/65.0";

  //   const mobileUserAgent =
  //       "Mozilla/5.0 (Linux; Android 7.0; SM-G930V Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36";
  //   keyword = keyword.replaceAll(' ', '+');

  //   const headers = {"user-agent": userAgent};

  //   final queryParams = {"client": "firefox-b-d", 'q': keyword};
  //   List<String> keywords = [];
  //   final response = await http.get(Uri.parse(google), headers: headers);
  //   if (response.statusCode == 200) {
  //     print(response.body);
  //     final document = pars.parse(response.body);
  //     return keywords;
  //   } else {
  //     return keywords;
  //   }
  // }
//////////////////////////////////////   Youtube keyword search  ///////////////////
  @override
  Future<List<String>> youtubeKeywordSearch(
      String keyword, BrowserType browserType) async {
    Map<String, dynamic> query = {
      "client": browserType.browserName,
      'ds': 'yt',
      'q': keyword
    };

    List<String> keywords = [];
    try {
      final jsonData = await helperFn(googleSuggestionUrl,
          unencodedPath: '/complete/search',
          query: query,
          headers: globalHeader);

      for (String keyword in jsonData[1]) {
        keywords.add(keyword);
      }

      return keywords;
      // } on StatusCodeException {
      //   throw StatusCodeException();
    } on StatusCodeException catch (e) {
      throw StatusCodeException(e.toString());
    } catch (e) {
      throw ClientErrorException(e.toString());
    }
  }

/////////////////  amazon keyword search  /////////////////////
  @override
  Future<List<String>> amazonKeywordSerach(String keyword) async {
    List<String> keywords = [];
    try {
      Map<String, dynamic> query = {
        "mid": "ATVPDKIKX0DER",
        "alias": "aps",
        "fresh": "0",
        "ks": "88",
        "prefix": keyword,
        "event": "onKeyPress",
        "limit": "11",
      };
      final jsonData = await helperFn(amazonUrl,
          unencodedPath: "/api/2017/suggestions",
          query: query,
          headers: globalHeader);
      for (var keyword in jsonData['suggestions']) {
        keywords.add(keyword["value"]);
      }

      return keywords;

// 	req.URL.RawQuery = q.Encode()
    } catch (e) {
      throw ClientErrorException(e.toString());
    }
  }

////////////////  bing keyword search  ///////////////
  @override
  Future<List<String>> bingKeywordSerach(String keyword) async {
    List<String> keywords = [];
    try {
      final jsonData = await helperFn(bingUrl,
          unencodedPath: '/osjson.aspx',
          query: {"query": keyword},
          headers: globalHeader);

      for (var keyword in jsonData[1]) {
        keywords.add(keyword);
      }

      return keywords;
    } on StatusCodeException catch (e) {
      throw StatusCodeException(e.toString());
    } catch (e) {
      throw ClientErrorException(e.toString());
    }
  }

/////////////////  Yahoo keyword search  /////////////////////
  @override
  Future<List<String>> yahooKeywordSerach(String keyword) async {
    List<String> keywords = [];
    try {
      final jsonData = await helperFn(yahooUrl,
          unencodedPath: '/sugg/ff',
          query: {"command": keyword, "output": "fxjson"},
          headers: globalHeader);

      for (var keyword in jsonData[1]) {
        keywords.add(keyword);
      }

      return keywords;
    } on StatusCodeException catch (e) {
      throw StatusCodeException(e.toString());
    } catch (e) {
      print(e.toString());
      throw ClientErrorException(e.toString());
    }
  }

////////////////////////// ebay keyword search  ////////////////////
  @override
  Future<List<String>> ebayKeywordSerach(String keyword) async {
    List<String> keywords = [];
    try {
      final jsonData = await helperFn(ebayUrl,
          unencodedPath: '/autosug',
          query: {"_dg": "1", "sId": "0v=1", "kwd": keyword},
          headers: globalHeader);
      print(jsonData);
      var res = jsonData.toString().replaceAll(
          "/**/vjo.darwin.domain.finding.autofill.AutoFill._do(", "");
      res = res.replaceAll(')', '');
      final result = jsonDecode(res);
      print(res);
      for (var keyword in result['res']["sug"]) {
        keywords.add(keyword);
      }

      return keywords;
    } on StatusCodeException catch (e) {
      throw StatusCodeException(e.toString());
    } catch (e) {
      print(e.toString());
      throw ClientErrorException(e.toString());
    }
  }

  final Map<String, String> globalHeader = {
    "Access-Control-Allow-Origin": "*",
    "x-requested-with": "XMLHttpRequest", // Required for CORS support to work
    "Access-Control-Allow-Credentials":
        "true", // Required for cookies, authorization headers with HTTPS
    "Access-Control-Allow-Headers":
        "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
    "Access-Control-Allow-Methods": "GET, POST, OPTIONS",
    "user-agent":
        '"User-Agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_"+strconv.Itoa(rand.Intn(15-9)+9)+"_1) AppleWebKit/531.36 (KHTML, like Gecko) Chrome/"+strconv.Itoa(rand.Intn(79-70)+70)+".0.3945.130 Safari/531.36"'
  };
}
