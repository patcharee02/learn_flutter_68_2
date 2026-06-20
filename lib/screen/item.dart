// ...existing code...
import 'package:flutter/material.dart';

import 'package:learn_flutter_68_2/model/person.dart';

import 'package:google_fonts/google_fonts.dart';

class Item extends StatefulWidget {
  const Item({super.key});

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: people.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: people[index].job.color,
          ),
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          // ลด padding จาก 40 -> 12 เพื่อไม่ให้เกิดปัญหาพื้นที่ไม่พอ
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // ให้คอลัมน์ยืดเพื่อกัน overflow
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ชื่อ: ${people[index].name}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.kanit(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "อายุ: ${people[index].age}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.kanit(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "อาชีพ: ${people[index].job.title}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.kanit(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              // รูปขนาดคงที่ พร้อม fallback เมื่อหา asset ไม่เจอ
              Image.asset(
                people[index].job.image,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ],
          ),
        );
      },
    );
  }
}
// ...existing code...