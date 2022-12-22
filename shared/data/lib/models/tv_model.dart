class TvModel {
  final int id;
  final String title;
  final String overview;
  final String thumbnailUrl;

  TvModel(this.id, this.title, this.overview, this.thumbnailUrl);

  static TvModel fromMap(e) {
    return TvModel(
      e['id'] ?? 0,
      e['original_name'] ?? '',
      e['overview'] ?? '',
      'https://image.tmdb.org/t/p/w500/${e['poster_path']}',
    );
  }
}
