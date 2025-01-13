import 'package:flutter/material.dart';
import '../models/character.dart';

class CharacterDetailScreen extends StatelessWidget {
  final Character character;

  const CharacterDetailScreen({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar karakter dengan border radius dan shadow
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  character.photoUrl,
                  height: 250,
                  width: 250,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),

            // Nama karakter
            Text(
              character.name,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.blueAccent),
            ),
            SizedBox(height: 8),

            // Nama sekolah dan gambar sekolah
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    character.imageSchool,
                    height: 30,
                    width: 30,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  character.school,
                  style: TextStyle(fontSize: 18, color: Colors.blueGrey[800]),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Informasi tentang birthday
            Row(
              children: [
                Icon(Icons.cake, color: Colors.orange, size: 20),
                SizedBox(width: 8),
                Text(
                  'Birthday: ${character.birthday}',
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Informasi damage type
            Row(
              children: [
                Icon(Icons.local_fire_department, color: Colors.red, size: 20),
                SizedBox(width: 8),
                Text(
                  'Damage Type: ${character.damageType}',
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
              ],
            ),
            SizedBox(height: 24),

            // Tambahkan beberapa padding dan teks deskriptif
            Text(
              'Character Overview:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueGrey[800]),
            ),
            SizedBox(height: 8),
            Text(
              'This character is from the ${character.school} school. They are known for their unique damage type: ${character.damageType}. The character celebrates their birthday on ${character.birthday}.',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}
