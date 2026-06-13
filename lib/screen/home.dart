import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 160, 17, 17),
            ),
            onPressed: () {
              print("กดปุ่มแล้ว TextButton");
            },
            child: const Text(
              "กดปุ่มนี้" , 
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 30, 166, 15),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            onPressed: () {
              print("กดปุ่มแล้ว FilledButton");
            },
            child: const Text(
              "กดปุ่มนี้" , 
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 15, 93, 166),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            onPressed: () {
              print("กดปุ่มแล้ว OutlinedButton");
            },
            child: const Text(
              "กดปุ่มนี้" , 
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 138, 15, 166),
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              print("กดปุ่มแล้ว ElevatedButton");
            },
            child: const Text(
              "กดปุ่มนี้" , 
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      )
    );
  }
}