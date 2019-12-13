import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/app/colors.dart';
import 'package:flutter_demo/main.dart';
import 'package:flutter_demo/model/account.dart';
import 'package:flutter_demo/model/checklist.dart';
import 'package:flutter_demo/page/signin/index.dart';
import 'package:provider/provider.dart';

/// 清单列表
class ChecklistPage extends StatefulWidget {
  ChecklistPage({Key key}) : super(key: key);

  @override
  _ChecklistPageState createState() => _ChecklistPageState();
}

class _ChecklistPageState extends State<ChecklistPage> {
  Account _account;
  List<Checklist> _checklists = [
    Checklist(
      name: '我的一天',
      icon: Icons.wb_sunny,
      iconColor: AppColors.mapOfColors['indigo'],
    ),
    Checklist(
      name: '重要',
      icon: Icons.star_border,
      iconColor: AppColors.mapOfColors['red'],
    ),
    Checklist(
      name: '已计划日程',
      icon: Icons.date_range,
      iconColor: AppColors.mapOfColors['orange'],
    ),
    Checklist(
      name: '分配给我',
      icon: Icons.assignment_ind,
      iconColor: AppColors.mapOfColors['green'],
    ),
    Checklist(
      name: '任务',
      icon: Icons.assignment_turned_in,
      iconColor: AppColors.mapOfColors['blueGrey'],
    ),
  ];

  @override
  void initState() {
    super.initState();
    this._account = Provider.of<Account>(context, listen: false);

    this.loadChecklist();
  }

  /// 根据用户获取清单列表
  loadChecklist() {
    this._checklists.add(Checklist(name: '我的'));
    this._checklists.add(Checklist(name: '我的'));
    this._checklists.add(Checklist(name: '我的'));
    this._checklists.add(Checklist(name: '我的'));
    this._checklists.add(Checklist(name: '我的'));
    this._checklists.add(Checklist(name: '我的'));
    this._checklists.add(Checklist(name: '我的'));
    this._checklists.add(Checklist(name: '我的'));
  }

  /// 构建列表
  Widget _buildListView() {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: ListView.separated(
        itemCount: _checklists.length,
        itemBuilder: (BuildContext context, int index) {
          return ChecklistItem(checklist: _checklists[index]);
        },
        separatorBuilder: (BuildContext context, int index) {
          if (index == 4) {
            return Divider();
          } else {
            return Divider(
                color: Colors.white, height: 0, indent: 0, endIndent: 0);
          }
        },
      ),
    );
  }

  Widget _buildActions() {
    return SizedBox(
      height: 48,
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              onPressed: () {},
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.add,
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      '新建清单',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.content_copy,
              color: Theme.of(context).primaryColor,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('build: ChecklistPage');
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 0,
        title: PopupMenuButton(
          itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
            PopupMenuItem(
              value: 'signout',
              child: Text(
                '注销',
              ),
            ),
          ],
          onSelected: (String value) {
            if (value == 'signout') {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => SigninPage(),
                ),
                (route) => route == null,
              );
            }
          },
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start, // 横轴
            children: <Widget>[
              Text(
                _account.name,
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              Text('fengchao.z@outlook.com',
                  style: TextStyle(fontSize: 14, color: Colors.black38)),
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search,
                size: 32, color: Theme.of(context).primaryColor),
            onPressed: () {},
          )
        ],
      ),
      body: Center(
        child: _buildListView(),
      ),
      bottomNavigationBar: _buildActions(),
    );
  }
}

/// 清单
class ChecklistItem extends StatefulWidget {
  ChecklistItem({Key key, this.checklist, this.height = 48.0})
      : super(key: key);

  /// Todo 对象 @link Todo.class
  final Checklist checklist;

  /// 行高
  final double height;

  @override
  _ChecklistItemState createState() => _ChecklistItemState();
}

/// 清单状态
class _ChecklistItemState extends State<ChecklistItem> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Colors.white,
      onPressed: () {
        Navigator.of(context).push(CustomRouteSlide(SigninPage()));
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => TodoPage()));
      },
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(widget.checklist.icon, color: widget.checklist.iconColor),
            SizedBox(width: 8.0, height: widget.height),
            Expanded(
              child: Text(
                '${widget.checklist.name}',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
