enum CodeStatusEnum {
  pending,
  approved,
  rejected,
  cancelled,
  completed,
  expired,
  deleted,
  unknown
}

class Code {
  static const int pending = 301;
  static const int approved = 200;
  static const int rejected = 303;
  static const int cancelled = 304;
  static const int completed = 201;
  static const int expired = 305;
  static const int deleted = 306;
  static const int unknown = 307;
}

class CodeStatus {
  final int code;
  final CodeStatusEnum name;

  CodeStatus({required this.code, required this.name});
}
