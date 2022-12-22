class MovieModel {
  final int id;
  final String title;
  final String overview;
  final String thumbnailUrl;

  MovieModel(this.id, this.title, this.overview, this.thumbnailUrl);

  static MovieModel fromMap(e) {
    return MovieModel(
      e['id'] ?? 0,
      e['original_title'] ?? '',
      e['overview'] ?? '',
      'https://image.tmdb.org/t/p/w500/${e['poster_path']}',
    );
  }
}
