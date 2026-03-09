import 'package:flutter/material.dart';
import 'package:security_awareness_app/model/info_mpdule-items.dart';

class InformationSecScreen extends StatelessWidget {
  const InformationSecScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final modules = InfoModuleItems.items;

    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFF),
      appBar: AppBar(
        title: const Text('Information Security'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: modules.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.2,
        ),
        itemBuilder: (context, index) {
          final item = modules[index];

          return InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                item.route,
                arguments: item.id,
              );
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: const Color(0xFFE6ECFF)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: item.color,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(item.icon, color: Colors.white),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    item.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.subtitle,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}