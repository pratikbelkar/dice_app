import 'package:dice_app/dice_provider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final diceNotifier = ref.watch(diceProvider);
    return Scaffold(
      body: GestureDetector(
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 92, 18, 10),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'Dice',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'images/dice${diceNotifier.diceNumber1} (1).png',
                      width: 150,
                    ),
                    Image.asset(
                      'images/dice${diceNotifier.diceNumber2} (1).png',
                      width: 150,
                    ),
                  ],
                ),
                const Text(
                  'let`s roll',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        onTap: () async =>
            ref.read(diceProvider.notifier).generateRandomDiceNumber(),
      ),
    );
  }
}
