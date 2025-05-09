
import '../models/inscription.dart';
import '../services/inscription_service.dart';

class InscriptionView extends StatefulWidget {
  const InscriptionView({Key? key}) : super(key: key);

  @override
  State<InscriptionView> createState() => _InscriptionViewState();
}

class _InscriptionViewState extends State<InscriptionView> {
  final InscriptionService service = InscriptionService();
  List<Inscription> inscriptions = [];
  String? selectedClasse;
  final List<String> classes = ['L1 MAE', 'L2 MAE', 'L1 GLRS', 'L2 GLRS'];

  @override
  void initState() {
    super.initState();
    loadInscriptions();
  }

  Future<void> loadInscriptions() async {
    try {
      final data = selectedClasse == null
          ? await service.getAllInscriptions()
          : await service.getInscriptionsByClasse(selectedClasse!);
      setState(() {
        inscriptions = data;
      });
    } catch (e) {
      print("Erreur : $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des étudiants inscrits'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: "Filtrer par classe",
                border: OutlineInputBorder(),
              ),
              value: selectedClasse,
              items: classes
                  .map((classe) => DropdownMenuItem(
                        value: classe,
                        child: Text(classe),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedClasse = value;
                });
                loadInscriptions();
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: inscriptions.length,
              itemBuilder: (context, index) {
                final inscrit = inscriptions[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    title: Text('${inscrit.nom} ${inscrit.prenom}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Classe : ${inscrit.classe}'),
                        Text('Matricule : ${inscrit.matricule}'),
                        Text('Email : ${inscrit.email}'),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
