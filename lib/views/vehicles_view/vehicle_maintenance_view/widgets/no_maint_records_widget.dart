import 'package:flutter/material.dart';

class NoMaintRecordsWidget extends StatelessWidget {
  const NoMaintRecordsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 1.45,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const Opacity(
                      opacity: 0.15,
                      child: Card(
                        elevation: 15,
                        margin: EdgeInsets.all(8),
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              title: Text(
                                'Maintenance Item',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text('Last Maintenance Date'),
                            ),
                            Divider(),
                            ListTile(
                              title: Text('Next Maintenance Date'),
                              subtitle: Text('Next Maintenance Item'),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
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
