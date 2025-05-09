class Inscription {
  late int id;
  late String nom;
  late String prenom;
  late String classe;
  late String matricule;
  late String email;

  
  Inscription({
    required this.id,
    required this.nom,
    required this.prenom,
    required this.classe,
    required this.matricule,
    required this.email,
  });

  
  factory Inscription.fromMap(Map<String, dynamic> map) {
    return Inscription(
      id: map['id'] is int ? map['id'] : int.parse(map['id']),
      nom: map['nom'],
      prenom: map['prenom'],
      classe: map['classe'],
      matricule: map['matricule'],
      email: map['email'],
    );
  }

  
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nom': nom,
      'prenom': prenom,
      'classe': classe,
      'matricule': matricule,
      'email': email,
    };
  }

  @override
  String toString() {
    return 'Inscription(id: $id, nom: $nom, prenom: $prenom, classe: $classe, matricule: $matricule, email: $email)';
  }
}
