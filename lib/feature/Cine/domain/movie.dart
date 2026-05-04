//arreglar, una clase debe tener min 3 atributos, sino no tiene sentido crear una clase, se puede usar un string directamente

class Movie {
  final String title;
  final String description;
  final double rating;

  const Movie({
    required this.title,
    required this.description,
    required this.rating,
  });
}