import 'package:flutter/material.dart';
import 'package:flutter_demo/model/account.dart';
import 'package:flutter_demo/page/checklist/index.dart';
import 'package:provider/provider.dart';

/// 登录
class SigninPage extends StatefulWidget {
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  // 背景图是否可见，默认可见。当点击输入框时弹出键盘，部分底部元素会被遮住，这时设置输入框有焦点隐藏图片，失去焦点显示图片
  bool imgVisible = true;
  FocusNode _usernameNode = FocusNode();
  FocusNode _passwordNode = FocusNode();

  //手机号的控制器
  TextEditingController _usernameController = TextEditingController();
  //密码的控制器
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    this._usernameNode.addListener(() => _inputListener());
    this._passwordNode.addListener(() => _inputListener());
  }

  _signin(BuildContext context) {
    print(this._usernameController.text);
    print(this._passwordController.text);

    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: new Text('这是一个SnackBar!'),
        duration: Duration(milliseconds: 2000),
      ),
    );

    Provider.of<Account>(context, listen: false).name = this._usernameController.text;

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => ChecklistPage(),
      ),
      (route) => route == null,
    );
  }

  @override
  Widget build(BuildContext context) {
    print('build: SigninPage');
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(48.0),
          child: Column(
            children: <Widget>[
              Offstage(
                offstage: !imgVisible,
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.3,
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("asset/image/signin_bg.png"),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              Offstage(
                offstage: imgVisible,
                child: SizedBox(
                  height: 40,
                ),
              ),
              // 账号
              TextField(
                maxLength: 20,
                focusNode: _usernameNode,
                controller: _usernameController,
                decoration: InputDecoration(
                  counterText: '', // 最大字数显示
                  border: InputBorder.none,
                  fillColor: Colors.black12,
                  filled: true,
                  hintText: "电子邮件或电话号码",
                  contentPadding:
                      const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                ),
              ),
              SizedBox(height: 16),
              // 密码
              TextField(
                maxLength: 12,
                focusNode: _passwordNode,
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  counterText: '', // 最大字数显示
                  border: InputBorder.none,
                  fillColor: Colors.black12,
                  filled: true,
                  hintText: "密码",
                  contentPadding:
                      const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                ),
              ),
              SizedBox(height: 16),
              Row(children: <Widget>[
                Expanded(
                  child: Builder(
                    builder: (BuildContext context) {
                      return RaisedButton(
                        onPressed: () => {this._signin(context)},
                        color: Theme.of(context).primaryColor,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text('登录'),
                      );
                    },
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  /// private method
  _inputListener() {
    if (this._usernameNode.hasFocus || this._passwordNode.hasFocus) {
      this.imgVisible = false;
    } else {
      this.imgVisible = true;
    }
  }
}
