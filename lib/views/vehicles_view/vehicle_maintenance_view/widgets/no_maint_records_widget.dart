import 'package:flutter/material.dart';

class NoMaintRecordsWidget extends StatelessWidget {
  const NoMaintRecordsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.7,
        child: Stack(
          children: [
            GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, crossAxisSpacing: 0, mainAxisSpacing: 0),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const Opacity(
                    opacity: 0.15,
                    child: Card(
                      elevation: 15,
                      margin: EdgeInsets.all(4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ListTile(
                            dense: true,
                            title: Text(
                              'Maintenance Item',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Column(
                              children: [
                                Text('Maintenance Date: XXXX-XX-XX'),
                                Text('Next Maintenance Date: XXXX-XX-XX'),
                              ],
                            ),
                            isThreeLine: true,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
            const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.warning,
                    size: 50,
                    color: Colors.red,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'No Maintenance Records Found',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
