import 'dart:io';

class Todo {
  Todo({
    this.title,
    this.steps = const [],
    this.deadline,
    this.files,
    this.remark,
  });

  /// 标题
  String title;

  /// 步骤
  List<String> steps;

  /// 截止日期
  DateTime deadline;

  /// 文件
  List<File> files;

  /// 备注
  String remark;
}
