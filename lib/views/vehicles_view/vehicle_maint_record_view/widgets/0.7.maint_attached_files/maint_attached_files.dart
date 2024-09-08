import 'package:flutter/material.dart';
import 'package:moto_maintanix/conf/flutter_conf.dart';
import 'package:moto_maintanix/models/repo/files_table_mode/files_table_mode.dart';
import 'package:moto_maintanix/modals/files_modal_view/files_modal_view.dart';

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
                  builder: (context) =>
                      FilesModalView(bloc: bloc, state: state),
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
