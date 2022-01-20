import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_version/new_version.dart';
import 'package:package_info/package_info.dart';

class NewVersionPage extends StatefulWidget {
  const NewVersionPage({Key? key}) : super(key: key);
  static const String id = 'new_version_page';

  @override
  _NewVersionPageState createState() => _NewVersionPageState();
}

class _NewVersionPageState extends State<NewVersionPage> {
  bool check = false;
  bool isCheck = false;
  String version = "";
  String code = "";
  String newVersionApp = "";
  final newVersion = NewVersion(
    androidId: 'net.giosis.shopping.sg',
  );

  Future<void> _version() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    version = packageInfo.version;
    code = packageInfo.buildNumber;
    print(version);
    print(code);
  }

  Future<void> newVer() async {
    final status = await newVersion.getVersionStatus();
    newVersionApp = status!.storeVersion;
    print(newVersionApp);
    setState(() {
      check = true;
    });
  }

  Future _check()async{
    List _list1 = await version.split(".");
    List _list2 = await newVersionApp.split(".");
    print(_list1);
    if(_list1[1]==_list2[1] && _list1[0]==_list2[0]){
      setState(() {
        isCheck = true;
      });
    }else{
      setState(() {
        isCheck = false;
      });
    }
  }

  @override
  void initState(){
    // TODO: implement initState
    _check();
    _version();
    newVer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
      ),
      body: check&&isCheck?Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: Text("My Phone version: $version",style: TextStyle(fontSize: 20),),
            height: 50,
          ),
          Container(
            alignment: Alignment.center,
            child: Text("Play Store version: $newVersionApp",style: TextStyle(fontSize: 20),),
            height: 50,
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: MaterialButton(
              color: Colors.blue,
              onPressed: () {
                _version();
                newVer();
              },
              child: check? const Text('Open'):const Text('Update'),
            ),
          ),
        ],
      ):Center(
        child: GestureDetector(
          onTap: (){

          },
          child: Container(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
