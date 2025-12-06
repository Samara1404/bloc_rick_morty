import 'package:bloc_rick_morty/core/theme/app_colors.dart';
import 'package:bloc_rick_morty/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/character.dart';

class CharacterDetailsPage extends StatelessWidget {
  final Character character;

  const CharacterDetailsPage({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: Text(character.name, style: AppTextStyles.h1,), backgroundColor: AppColors.appColorsBg, ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                character.image,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              character.name,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: _statusColor(character.status),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  "${character.status} - ${character.species}",
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),

            const SizedBox(height: 20),

            _infoCard("Gender", character.gender),
            _infoCard("Origin", character.origin),
            _infoCard("Location", character.location),

            const SizedBox(height: 20),

            _infoCard("Episodes appeared", character.episodeCount.toString()),
          ],
        ),
      ),
    );
  }

  Widget _infoCard(String title, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            spreadRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Text(value, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  Color _statusColor(String status) {
    switch (status.toLowerCase()) {
      case "alive":
        return Colors.green;
      case "dead":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
