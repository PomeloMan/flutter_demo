import 'package:flutter/material.dart';
import 'package:flutter_demo/model/todo.dart';
import 'package:flutter_demo/model/account.dart';

/// 清单模型
class Checklist {
  Checklist({
    this.name,
    this.backgroundColor,
    this.icon = Icons.format_list_bulleted,
    this.iconColor,
    this.todos = const [],
  });

  /// 清单名称
  String name;

  /// 分组名称
  String group;

  /// 清单背景颜色
  Color backgroundColor;

  /// 清单图标
  IconData icon;

  /// 清单图标颜色
  Color iconColor;

  /// 待完成集合
  List<Todo> todos;

  /// 所属账号
  Account account;
}
