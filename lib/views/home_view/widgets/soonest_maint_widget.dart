import 'package:flutter/material.dart';

import '../../../conf/flutter_conf.dart';

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
            BlocBuilder<SoonestMaintCubit, String>(
              builder: (context, state) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: Text(
                      key: ValueKey(state),
                      state.isEmpty ? 'N/A' : state,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          // color: Colors.red.shade900,
                          fontWeight: FontWeight.bold)),
                );
              },
            ),
            const SizedBox(width: 8),
            const Tooltip(
              message: 'Show the selected car next maintenance date',
              showDuration: Duration(seconds: 2),
              child: Icon(Icons.info),
            ),
          ],
        ),
      ),
    );
  }
}
