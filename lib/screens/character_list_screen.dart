import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/character.dart';
import 'character_detail_screen.dart';

class CharacterListScreen extends StatefulWidget {
  @override
  _CharacterListScreenState createState() => _CharacterListScreenState();
}

class _CharacterListScreenState extends State<CharacterListScreen> {
  final ApiService apiService = ApiService();
  late Future<List<Character>> characters;

  @override
  void initState() {
    super.initState();
    characters = apiService.getCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blue Archive Characters'),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: FutureBuilder<List<Character>>(
        future: characters,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No characters found.'));
          } else {
            final characterList = snapshot.data!;
            return LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 600) {
                  return GridView.builder(
                    padding: EdgeInsets.all(16.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0,
                    ),
                    itemCount: characterList.length,
                    itemBuilder: (context, index) {
                      return CharacterCard(character: characterList[index]);
                    },
                  );
                } else {
                  return ListView.builder(
                    padding: EdgeInsets.all(16.0),
                    itemCount: characterList.length,
                    itemBuilder: (context, index) {
                      return CharacterCard(character: characterList[index]);
                    },
                  );
                }
              },
            );
          }
        },
      ),
    );
  }
}

class CharacterCard extends StatelessWidget {
  final Character character;

  const CharacterCard({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CharacterDetailScreen(character: character),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Gambar karakter dengan border-radius dan shadow
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  character.photoUrl,
                  height: 120,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 12),
              
              // Nama karakter
              Text(
                character.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.blueAccent,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              
              // Informasi tentang sekolah dan damage type
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.school, color: Colors.blue, size: 18),
                  SizedBox(width: 6),
                  Text(
                    character.school,
                    style: TextStyle(fontSize: 14, color: Colors.blueGrey[700]),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.local_fire_department, color: Colors.red, size: 18),
                  SizedBox(width: 6),
                  Text(
                    'Damage: ${character.damageType}',
                    style: TextStyle(fontSize: 14, color: Colors.blueGrey[700]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
