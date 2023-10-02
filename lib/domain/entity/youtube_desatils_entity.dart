import '../../presentation/model/check_item.dart';

abstract class YoutubeDetailsEntity {
  final String title;
  final String description;
  final List<String> tags;

  const YoutubeDetailsEntity(this.title, this.description, this.tags);

  ({String title, List<CheckedItem> tags}) data() {
    final checkedTags = tags.map((e) => CheckedItem(false, e)).toList();
    return (title:title,tags: checkedTags);
  }
}
