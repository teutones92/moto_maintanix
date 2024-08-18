import 'package:flutter/material.dart';

class SoonestMaintWidget extends StatelessWidget {
  const SoonestMaintWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13),
      child: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Soonest Maintenance',
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(width: 8),
            Flexible(
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                        color: Theme.of(context).secondaryHeaderColor,
                        shape: BoxShape.circle,
                      ),
                      height: 4,
                      width: 4,
                    );
                  }),
            ),
            const SizedBox(width: 8),
            Text('08/13/2024',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.red.shade900, fontWeight: FontWeight.bold)),
            const SizedBox(width: 8),
            const Tooltip(
              waitDuration: Duration.zero,
              message: 'Show the selected car maintenance date',
              child: Icon(Icons.info),
            ),
          ],
        ),
      ),
    );
  }
}
