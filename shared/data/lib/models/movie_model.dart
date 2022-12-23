class MovieModel {
  final int id;
  final String title;
  final String overview;
  final DateTime releaseDate;
  final String thumbnailUrl;

  MovieModel(
      this.id, this.title, this.overview, this.releaseDate, this.thumbnailUrl);

  static MovieModel fromMap(e) {
    return MovieModel(
      e['id'] ?? 0,
      e['original_title'] ?? '',
      e['overview'] ?? '',
      DateTime.parse(e['release_date']),
      'https://image.tmdb.org/t/p/w500/${e['poster_path']}',
    );
  }
}
