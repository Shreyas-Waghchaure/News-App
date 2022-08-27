class NewsApiModel {
  String title;
  String? imageUrl;
  String? content;
  String? Description;
  String? url;

  NewsApiModel({required this.title, required this.imageUrl, required this.content, required this.Description,required this.url});

  factory NewsApiModel.fromJson(Map<String, dynamic> jsonData) {
    return NewsApiModel(title: jsonData['title'], imageUrl: jsonData['urlToImage'], content: jsonData['content'], Description: jsonData['description'],url: jsonData['url']);
  }
}
