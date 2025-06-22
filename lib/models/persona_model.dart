class PersonaModel {
  String nombre;
  String profesion;
  int likes;
  int followers;
  double rating;

  PersonaModel({
    required this.nombre,
    required this.profesion,
    required this.likes,
    required this.followers,
    required this.rating,
  });
}

PersonaModel jhonny = PersonaModel(
  nombre: "Jhonny Gallegos",
  profesion: "Ing. Software",
  likes: 20,
  followers: 15,
  rating: 9.8,
);
