class ReviewModel {
  final String id;
  final String author;
  final String content;

  ReviewModel(this.id, this.author, this.content);

  static ReviewModel fromMap(e) {
    return ReviewModel(e['id'] ?? '', e['author'] ?? '', e['content'] ?? '');
  }
}
