import 'package:flutter/material.dart';

class LearnAbsorbPointer extends StatelessWidget {
  const LearnAbsorbPointer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Absorb Pointer will not allow any widget to be pressed",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 40,
          ),
          AbsorbPointer(
            ignoringSemantics: true,
            child: ElevatedButton(
              onPressed: () => {debugPrint("absorb pointer")},
              child: const Text("Absorb Pointer"),
            ),
          ),
          ElevatedButton(
            onPressed: () => {debugPrint("absorb pointer")},
            child: const Text("No Absorb Pointer"),
          ),
        ],
      ),
    );
  }
}
