import 'package:html/dom.dart';
import 'package:keyword_planner/core/errors/error.dart';
import 'package:keyword_planner/data/models/youtube_details_model.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parse;

abstract class YoutubeDataSource {
  Future<YoutubeDetailsModel> getYoutubeVideoDetails(String url);
}

class YoutubeDataSourceImpl extends YoutubeDataSource {
  @override
  Future<YoutubeDetailsModel> getYoutubeVideoDetails(String url) async {
    RegExp regExp = RegExp(
        r'((?:https?:)?\/\/)?((?:www|m)\.)?((?:youtube\.com|youtu.be))(\/(?:[\w\-]+\?v=|embed\/|v\/)?)([\w\-]+)(\S+)?');
    final isMatches = regExp.stringMatch(url);
    if (isMatches == null) {
      throw YoutubeUrlError();
    }
    final response = await http.get(Uri.parse(url));

    final document = parse.parse(response.body);

    final title = _getVideoTitle(document);
    final tags = _getVideoTags(document);
   

    return YoutubeDetailsModel(
        title: title, description: 'description', tags: tags);
  }

  String _getVideoTitle(Document doc) {
    final result = doc.querySelector('title')!;

    return result.text.split('-').first;
  }

  List<String> _getVideoTags(Document doc) {
    final result = doc.querySelectorAll('meta[property="og:video:tag"]');
    List<String> tags = result.map((tag) {
      return tag.attributes['content'].toString();
    }).toList();

    print(tags.join(', '));
    return tags;
  }

  String _getVideoDescription(Document doc) {
    final result =
        doc.querySelector('meta[name="description"]')!.attributes['content'];
    print(result);
    return result!;
  }
}
