import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:naruto_flutter/model/naruto_model.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class NarutoDetailScreen extends StatelessWidget {
  final NarutoModel character;

  const NarutoDetailScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: const Color(0xFF0F111A),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                   child: ClipOval(
                     child: CachedNetworkImage(
                       imageUrl: character.image,
                       width: 100,
                       height: 100,
                       fit: BoxFit.cover,
                       placeholder: (context, url) => const CircularProgressIndicator(
                         color: Colors.white,
                         strokeWidth: 2,
                       ),
                       errorWidget: (context, url, error) => const Icon(Icons.error),
                     ),
                   ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          (character.name?.toUpperCase() ?? "Unknown")
                              .replaceAll(" ", "\n"),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                        ),
                        Text(
                          "ID ${character.id ?? "Unknown"}",
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const TabBar(
              labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              indicatorWeight: 4,
              indicatorColor: Colors.orange,
              labelColor: Colors.orange,
              unselectedLabelColor: Colors.grey,
              unselectedLabelStyle: TextStyle(fontSize: 14),
              tabs: [
                Tab(text: "BIO"),
                Tab(text: "ABILITIES"),
                Tab(text: "FAMILY"),
                Tab(text: "RANK"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [

                  _buildTabContent([
                    _buildInfoCard("Personal Info", {
                      if (character.clan != "Unknown") "Clan": character.clan,
                      if (character.anyHeight != "Unknown") "Height": character.anyHeight,
                      if (character.personal?["status"] != null) "Status": character.personal?["status"],
                      if (character.personal?["birthdate"] != null) "Birthdate": character.personal?["birthdate"],
                    }),
                    _buildInfoCard("Other Info", character.personal),
                  ]),


                  _buildTabContent([
                    _buildJutsuCard("Key Jutsu",character.jutsu),
                  ]),
                  _buildTabContent([
                    _buildInfoCard("Relatives", character.family)
                  ]),
                  _buildTabContent([
                    _buildInfoCard("Rank", character.rank)
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent(List<Widget> children) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(children: children),
    );
  }



  Widget _buildInfoCard(String title, Map<String, dynamic>? data) {
    if (data == null || data.isEmpty) return const SizedBox();


    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1F2E),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toUpperCase(),
            style: const TextStyle(
              color: Colors.orange,
              fontWeight: FontWeight.bold,
              fontSize: 14,
              letterSpacing: 1.1,
            ),
          ),
          const Divider(color: Colors.white10, height: 25),
          ...data.entries.map((entry) {
            final formattedValue = _formatValue(entry.value);
            if (formattedValue.isEmpty) return const SizedBox();

            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${entry.key}:",
                    style: const TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    formattedValue,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  String _formatValue(dynamic value) {
    if (value == null) return "";
    if (value is List) {
      return value.join(", ");
    }
    if (value is Map) {
      return value.entries
          .map((e) => "${e.key}: ${e.value}")
          .join("\n");
    }
    return value.toString();
  }


  Widget _buildJutsuCard(String title, List<String>? jutsus) {
    if (jutsus == null || jutsus.isEmpty) return const SizedBox();
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1F2E),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toUpperCase(),
            style: const TextStyle(
              color: Colors.orange,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const Divider(color: Colors.white10, height: 25),
          ...jutsus.map((jutsu) => ListTile(
            leading: const Icon(Icons.bolt, color: Colors.orange, size: 18,),
            title: Text(
              jutsu,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            contentPadding: EdgeInsets.zero,
            dense: true,
          )).toList(),
        ],

      ),

    );
  }
}
