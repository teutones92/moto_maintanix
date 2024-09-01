import 'package:flutter/material.dart';
import 'package:moto_maintanix/conf/flutter_conf.dart';
import 'package:moto_maintanix/global/custom/custom_text.dart';
import 'package:moto_maintanix/models/repo/files_table_mode/files_table_mode.dart';

class MainAttachedFilesWidget extends StatelessWidget {
  const MainAttachedFilesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        const CustomText(data: 'Attache Files'),
        const SizedBox(height: 10),
        Card(
          margin: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 2,
                  child: ElevatedButton(
                      onPressed: () {
                        context.read<CarMaintFilesBloc>().pickAFile();
                      },
                      child: const Text(
                        'Browse...',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      )),
                ),
                Flexible(
                  flex: 3,
                  child: BlocBuilder<CarMaintFilesBloc, List<FilesTableModel>>(
                    builder: (context, state) {
                      return Text(
                        state.isEmpty
                            ? 'No files attached'
                            : '${state.length} files attached',
                        overflow: TextOverflow.ellipsis,
                      );
                    },
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: IconButton(
                    onPressed: context.read<CarMaintFilesBloc>().clearAll,
                    icon: const Icon(Icons.delete_forever_sharp),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
