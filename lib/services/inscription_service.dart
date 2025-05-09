import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/inscription.dart';

class InscriptionService {
  final String baseUrl;

  InscriptionService({this.baseUrl = "http://localhost:3000"});

  
  Future<List<Inscription>> getAllInscriptions() async {
    var url = Uri.parse("$baseUrl/inscription");
    var response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => Inscription.fromMap(item)).toList();
    } else {
      throw Exception("Erreur lors du chargement des inscriptions");
    }
  }

  
  Future<List<Inscription>> getInscriptionsByClasse(String classe) async {
    var url = Uri.parse("$baseUrl/inscription?classe=$classe");
    var response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => Inscription.fromMap(item)).toList();
    } else {
      throw Exception("Erreur lors du filtrage par classe");
    }
  }

  
  Future<Inscription> addInscription(Inscription inscription) async {
    var url = Uri.parse("$baseUrl/inscription");
    var response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode(inscription.toMap()),
    );

    if (response.statusCode == 201) {
      return Inscription.fromMap(json.decode(response.body));
    } else {
      throw Exception("Erreur lors de l'ajout");
    }
  }

  
  Future<Inscription> updateInscription(Inscription inscription) async {
    var url = Uri.parse("$baseUrl/inscription/${inscription.id}");
    var response = await http.put(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode(inscription.toMap()),
    );

    if (response.statusCode == 200) {
      return Inscription.fromMap(json.decode(response.body));
    } else {
      throw Exception("Erreur lors de la mise à jour");
    }
  }

  
  Future<void> deleteInscription(int id) async {
    var url = Uri.parse("$baseUrl/inscription/$id");
    var response = await http.delete(url);

    if (response.statusCode != 200) {
      throw Exception("Erreur lors de la suppression");
    }
  }
}
