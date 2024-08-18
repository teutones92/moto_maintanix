// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again
// with `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'
    as obx_int; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart' as obx;
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'models/repo/car_table/car_item_model.dart';
import 'models/repo/maint_cost_table/maint_cost_table.dart';
import 'models/repo/maint_reminder_table/maint_reminder_model.dart';
import 'models/repo/maint_table/maint_table.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <obx_int.ModelEntity>[
  obx_int.ModelEntity(
      id: const obx_int.IdUid(1, 2143468729157234447),
      name: 'CarItemModel',
      lastPropertyId: const obx_int.IdUid(9, 5520691666649990511),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 7532295429165787806),
            name: 'id',
            type: 6,
            flags: 129),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 6132867069811065524),
            name: 'name',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 6797039972357593740),
            name: 'carType',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 1333033025322800989),
            name: 'brand',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(5, 3529025154377980601),
            name: 'model',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(6, 2157097316402982759),
            name: 'year',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(7, 3332987510127743735),
            name: 'color',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(8, 544326401253182694),
            name: 'plate',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(9, 5520691666649990511),
            name: 'image',
            type: 9,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(2, 6951699321459603610),
      name: 'MaintCostTable',
      lastPropertyId: const obx_int.IdUid(5, 8277605962992648352),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 701251062771022127),
            name: 'id',
            type: 6,
            flags: 129),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 9080227805548565066),
            name: 'vehicleId',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 5378238735152157589),
            name: 'maintId',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 4767307005193527021),
            name: 'cost',
            type: 8,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(5, 8277605962992648352),
            name: 'part',
            type: 9,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(3, 4975077510805709139),
      name: 'MaintReminderModel',
      lastPropertyId: const obx_int.IdUid(7, 3049124428808124155),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 8935045673645063422),
            name: 'id',
            type: 6,
            flags: 129),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 7461977776641264340),
            name: 'title',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 6489550675616243176),
            name: 'description',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 187793988736406032),
            name: 'date',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(5, 1568610055736704113),
            name: 'completed',
            type: 1,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(6, 6832108749091402075),
            name: 'reminderStatus',
            type: 1,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(7, 3049124428808124155),
            name: 'vehicleId',
            type: 6,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(4, 922210411738223884),
      name: 'MaintTable',
      lastPropertyId: const obx_int.IdUid(8, 3922239550191900808),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 8587613124885100277),
            name: 'id',
            type: 6,
            flags: 129),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 7686673212471648229),
            name: 'maintDate',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 1704277275887225551),
            name: 'vehicleId',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 3825558881634252810),
            name: 'maintType',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(5, 7228783798925391487),
            name: 'maintDescription',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(6, 5538557568110005203),
            name: 'otherNotes',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(7, 6523546566896593485),
            name: 'maintStatus',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(8, 3922239550191900808),
            name: 'attachedFiles',
            type: 9,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[])
];

/// Shortcut for [obx.Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [obx.Store.new] for an explanation of all parameters.
///
/// For Flutter apps, also calls `loadObjectBoxLibraryAndroidCompat()` from
/// the ObjectBox Flutter library to fix loading the native ObjectBox library
/// on Android 6 and older.
Future<obx.Store> openStore(
    {String? directory,
    int? maxDBSizeInKB,
    int? maxDataSizeInKB,
    int? fileMode,
    int? maxReaders,
    bool queriesCaseSensitiveDefault = true,
    String? macosApplicationGroup}) async {
  await loadObjectBoxLibraryAndroidCompat();
  return obx.Store(getObjectBoxModel(),
      directory: directory ?? (await defaultStoreDirectory()).path,
      maxDBSizeInKB: maxDBSizeInKB,
      maxDataSizeInKB: maxDataSizeInKB,
      fileMode: fileMode,
      maxReaders: maxReaders,
      queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
      macosApplicationGroup: macosApplicationGroup);
}

/// Returns the ObjectBox model definition for this project for use with
/// [obx.Store.new].
obx_int.ModelDefinition getObjectBoxModel() {
  final model = obx_int.ModelInfo(
      entities: _entities,
      lastEntityId: const obx_int.IdUid(4, 922210411738223884),
      lastIndexId: const obx_int.IdUid(0, 0),
      lastRelationId: const obx_int.IdUid(0, 0),
      lastSequenceId: const obx_int.IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, obx_int.EntityDefinition>{
    CarItemModel: obx_int.EntityDefinition<CarItemModel>(
        model: _entities[0],
        toOneRelations: (CarItemModel object) => [],
        toManyRelations: (CarItemModel object) => {},
        getId: (CarItemModel object) => object.id,
        setId: (CarItemModel object, int id) {
          object.id = id;
        },
        objectToFB: (CarItemModel object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          final brandOffset =
              object.brand == null ? null : fbb.writeString(object.brand!);
          final modelOffset =
              object.model == null ? null : fbb.writeString(object.model!);
          final yearOffset =
              object.year == null ? null : fbb.writeString(object.year!);
          final colorOffset =
              object.color == null ? null : fbb.writeString(object.color!);
          final plateOffset =
              object.plate == null ? null : fbb.writeString(object.plate!);
          final imageOffset =
              object.image == null ? null : fbb.writeString(object.image!);
          fbb.startTable(10);
          fbb.addInt64(0, object.id ?? 0);
          fbb.addOffset(1, nameOffset);
          fbb.addInt64(2, object.carType);
          fbb.addOffset(3, brandOffset);
          fbb.addOffset(4, modelOffset);
          fbb.addOffset(5, yearOffset);
          fbb.addOffset(6, colorOffset);
          fbb.addOffset(7, plateOffset);
          fbb.addOffset(8, imageOffset);
          fbb.finish(fbb.endTable());
          return object.id ?? 0;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 4);
          final nameParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final carTypeParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0);
          final brandParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 10);
          final modelParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 12);
          final yearParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 14);
          final colorParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 16);
          final plateParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 18);
          final imageParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 20);
          final object = CarItemModel(
              id: idParam,
              name: nameParam,
              carType: carTypeParam,
              brand: brandParam,
              model: modelParam,
              year: yearParam,
              color: colorParam,
              plate: plateParam,
              image: imageParam);

          return object;
        }),
    MaintCostTable: obx_int.EntityDefinition<MaintCostTable>(
        model: _entities[1],
        toOneRelations: (MaintCostTable object) => [],
        toManyRelations: (MaintCostTable object) => {},
        getId: (MaintCostTable object) => object.id,
        setId: (MaintCostTable object, int id) {
          object.id = id;
        },
        objectToFB: (MaintCostTable object, fb.Builder fbb) {
          final partOffset = fbb.writeString(object.part);
          fbb.startTable(6);
          fbb.addInt64(0, object.id ?? 0);
          fbb.addInt64(1, object.vehicleId);
          fbb.addInt64(2, object.maintId);
          fbb.addFloat64(3, object.cost);
          fbb.addOffset(4, partOffset);
          fbb.finish(fbb.endTable());
          return object.id ?? 0;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 4);
          final maintIdParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0);
          final vehicleIdParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 6, 0);
          final costParam =
              const fb.Float64Reader().vTableGet(buffer, rootOffset, 10, 0);
          final partParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 12, '');
          final object = MaintCostTable(
              id: idParam,
              maintId: maintIdParam,
              vehicleId: vehicleIdParam,
              cost: costParam,
              part: partParam);

          return object;
        }),
    MaintReminderModel: obx_int.EntityDefinition<MaintReminderModel>(
        model: _entities[2],
        toOneRelations: (MaintReminderModel object) => [],
        toManyRelations: (MaintReminderModel object) => {},
        getId: (MaintReminderModel object) => object.id,
        setId: (MaintReminderModel object, int id) {
          object.id = id;
        },
        objectToFB: (MaintReminderModel object, fb.Builder fbb) {
          final titleOffset = fbb.writeString(object.title);
          final descriptionOffset = object.description == null
              ? null
              : fbb.writeString(object.description!);
          final dateOffset = fbb.writeString(object.date);
          fbb.startTable(8);
          fbb.addInt64(0, object.id ?? 0);
          fbb.addOffset(1, titleOffset);
          fbb.addOffset(2, descriptionOffset);
          fbb.addOffset(3, dateOffset);
          fbb.addBool(4, object.completed);
          fbb.addBool(5, object.reminderStatus);
          fbb.addInt64(6, object.vehicleId);
          fbb.finish(fbb.endTable());
          return object.id ?? 0;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 4);
          final titleParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final descriptionParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 8);
          final dateParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 10, '');
          final completedParam =
              const fb.BoolReader().vTableGet(buffer, rootOffset, 12, false);
          final reminderStatusParam =
              const fb.BoolReader().vTableGet(buffer, rootOffset, 14, false);
          final vehicleIdParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 16, 0);
          final object = MaintReminderModel(
              id: idParam,
              title: titleParam,
              description: descriptionParam,
              date: dateParam,
              completed: completedParam,
              reminderStatus: reminderStatusParam,
              vehicleId: vehicleIdParam);

          return object;
        }),
    MaintTable: obx_int.EntityDefinition<MaintTable>(
        model: _entities[3],
        toOneRelations: (MaintTable object) => [],
        toManyRelations: (MaintTable object) => {},
        getId: (MaintTable object) => object.id,
        setId: (MaintTable object, int id) {
          object.id = id;
        },
        objectToFB: (MaintTable object, fb.Builder fbb) {
          final maintDateOffset = fbb.writeString(object.maintDate);
          final maintTypeOffset = object.maintType == null
              ? null
              : fbb.writeString(object.maintType!);
          final maintDescriptionOffset = object.maintDescription == null
              ? null
              : fbb.writeString(object.maintDescription!);
          final otherNotesOffset = object.otherNotes == null
              ? null
              : fbb.writeString(object.otherNotes!);
          final maintStatusOffset = object.maintStatus == null
              ? null
              : fbb.writeString(object.maintStatus!);
          final attachedFilesOffset = object.attachedFiles == null
              ? null
              : fbb.writeString(object.attachedFiles!);
          fbb.startTable(9);
          fbb.addInt64(0, object.id ?? 0);
          fbb.addOffset(1, maintDateOffset);
          fbb.addInt64(2, object.vehicleId);
          fbb.addOffset(3, maintTypeOffset);
          fbb.addOffset(4, maintDescriptionOffset);
          fbb.addOffset(5, otherNotesOffset);
          fbb.addOffset(6, maintStatusOffset);
          fbb.addOffset(7, attachedFilesOffset);
          fbb.finish(fbb.endTable());
          return object.id ?? 0;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 4);
          final maintDateParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final vehicleIdParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0);
          final maintTypeParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 10);
          final maintDescriptionParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 12);
          final otherNotesParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 14);
          final maintStatusParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 16);
          final attachedFilesParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 18);
          final object = MaintTable(
              id: idParam,
              maintDate: maintDateParam,
              vehicleId: vehicleIdParam,
              maintType: maintTypeParam,
              maintDescription: maintDescriptionParam,
              otherNotes: otherNotesParam,
              maintStatus: maintStatusParam,
              attachedFiles: attachedFilesParam);

          return object;
        })
  };

  return obx_int.ModelDefinition(model, bindings);
}

/// [CarItemModel] entity fields to define ObjectBox queries.
class CarItemModel_ {
  /// See [CarItemModel.id].
  static final id =
      obx.QueryIntegerProperty<CarItemModel>(_entities[0].properties[0]);

  /// See [CarItemModel.name].
  static final name =
      obx.QueryStringProperty<CarItemModel>(_entities[0].properties[1]);

  /// See [CarItemModel.carType].
  static final carType =
      obx.QueryIntegerProperty<CarItemModel>(_entities[0].properties[2]);

  /// See [CarItemModel.brand].
  static final brand =
      obx.QueryStringProperty<CarItemModel>(_entities[0].properties[3]);

  /// See [CarItemModel.model].
  static final model =
      obx.QueryStringProperty<CarItemModel>(_entities[0].properties[4]);

  /// See [CarItemModel.year].
  static final year =
      obx.QueryStringProperty<CarItemModel>(_entities[0].properties[5]);

  /// See [CarItemModel.color].
  static final color =
      obx.QueryStringProperty<CarItemModel>(_entities[0].properties[6]);

  /// See [CarItemModel.plate].
  static final plate =
      obx.QueryStringProperty<CarItemModel>(_entities[0].properties[7]);

  /// See [CarItemModel.image].
  static final image =
      obx.QueryStringProperty<CarItemModel>(_entities[0].properties[8]);
}

/// [MaintCostTable] entity fields to define ObjectBox queries.
class MaintCostTable_ {
  /// See [MaintCostTable.id].
  static final id =
      obx.QueryIntegerProperty<MaintCostTable>(_entities[1].properties[0]);

  /// See [MaintCostTable.vehicleId].
  static final vehicleId =
      obx.QueryIntegerProperty<MaintCostTable>(_entities[1].properties[1]);

  /// See [MaintCostTable.maintId].
  static final maintId =
      obx.QueryIntegerProperty<MaintCostTable>(_entities[1].properties[2]);

  /// See [MaintCostTable.cost].
  static final cost =
      obx.QueryDoubleProperty<MaintCostTable>(_entities[1].properties[3]);

  /// See [MaintCostTable.part].
  static final part =
      obx.QueryStringProperty<MaintCostTable>(_entities[1].properties[4]);
}

/// [MaintReminderModel] entity fields to define ObjectBox queries.
class MaintReminderModel_ {
  /// See [MaintReminderModel.id].
  static final id =
      obx.QueryIntegerProperty<MaintReminderModel>(_entities[2].properties[0]);

  /// See [MaintReminderModel.title].
  static final title =
      obx.QueryStringProperty<MaintReminderModel>(_entities[2].properties[1]);

  /// See [MaintReminderModel.description].
  static final description =
      obx.QueryStringProperty<MaintReminderModel>(_entities[2].properties[2]);

  /// See [MaintReminderModel.date].
  static final date =
      obx.QueryStringProperty<MaintReminderModel>(_entities[2].properties[3]);

  /// See [MaintReminderModel.completed].
  static final completed =
      obx.QueryBooleanProperty<MaintReminderModel>(_entities[2].properties[4]);

  /// See [MaintReminderModel.reminderStatus].
  static final reminderStatus =
      obx.QueryBooleanProperty<MaintReminderModel>(_entities[2].properties[5]);

  /// See [MaintReminderModel.vehicleId].
  static final vehicleId =
      obx.QueryIntegerProperty<MaintReminderModel>(_entities[2].properties[6]);
}

/// [MaintTable] entity fields to define ObjectBox queries.
class MaintTable_ {
  /// See [MaintTable.id].
  static final id =
      obx.QueryIntegerProperty<MaintTable>(_entities[3].properties[0]);

  /// See [MaintTable.maintDate].
  static final maintDate =
      obx.QueryStringProperty<MaintTable>(_entities[3].properties[1]);

  /// See [MaintTable.vehicleId].
  static final vehicleId =
      obx.QueryIntegerProperty<MaintTable>(_entities[3].properties[2]);

  /// See [MaintTable.maintType].
  static final maintType =
      obx.QueryStringProperty<MaintTable>(_entities[3].properties[3]);

  /// See [MaintTable.maintDescription].
  static final maintDescription =
      obx.QueryStringProperty<MaintTable>(_entities[3].properties[4]);

  /// See [MaintTable.otherNotes].
  static final otherNotes =
      obx.QueryStringProperty<MaintTable>(_entities[3].properties[5]);

  /// See [MaintTable.maintStatus].
  static final maintStatus =
      obx.QueryStringProperty<MaintTable>(_entities[3].properties[6]);

  /// See [MaintTable.attachedFiles].
  static final attachedFiles =
      obx.QueryStringProperty<MaintTable>(_entities[3].properties[7]);
}
