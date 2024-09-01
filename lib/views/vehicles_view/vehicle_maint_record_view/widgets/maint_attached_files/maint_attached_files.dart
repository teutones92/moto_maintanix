import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:moto_maintanix/conf/flutter_conf.dart';
import 'package:moto_maintanix/models/repo/files_table_mode/files_table_mode.dart';

class MaintAttachedFiles extends StatelessWidget {
  const MaintAttachedFiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final bloc = context.read<CarMaintFilesBloc>();
      return BlocBuilder<CarMaintFilesBloc, List<FilesTableModel>>(
        builder: (context, state) {
          if (state.isEmpty) {
            return const SizedBox.shrink();
          }
          return Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(153, 255, 68, 0),
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  builder: (context) => GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemCount: state.length,
                    itemBuilder: (context, index) {
                      final file = state[index];
                      return Container(
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              flex: 2,
                              child: InkWell(
                                onTap: () => context
                                    .read<CarMaintFilesBloc>()
                                    .openFile(file),
                                child: Card(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: bloc.imgFileExt
                                            .contains(file.fileExtension)
                                        ? Image.memory(base64Decode(file.file),
                                            fit: BoxFit.cover)
                                        : const Center(
                                            child: Icon(
                                              Icons.file_present_rounded,
                                              size: 50,
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Flexible(
                              flex: 1,
                              child: Text(
                                file.title,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.attach_file),
                  SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      'View Files',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}
