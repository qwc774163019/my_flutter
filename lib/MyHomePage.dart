import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'EventChannelPage.dart';

class MyHomePage extends StatefulWidget{
  
  final String title;


  MyHomePage({Key key, this.title}) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _MyHomePageState();
  }
  
}

class _MyHomePageState extends State<MyHomePage> {

  static const methodChannel=const MethodChannel('to_native');
  String _result='';
  void _incrementCounter() {
    setState(() {
      _getInvokeResult();
    });
  }

  Future<Null> _getInvokeResult() async{
    try{
      _result=await methodChannel.invokeMethod('activity_to_second',"我是Flutter调用native");
    }on PlatformException catch(e){
      _result="Failed:'${e.message}'.";
    }
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'MyHomePage',
      home: new Scaffold(
        appBar: AppBar(title: Text(widget.title),),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('ToEventChannelPage'),
                onPressed: (){Navigator.push(context, new MaterialPageRoute(builder: (context)=>EventChannelPage(title: 'EventChannelPage',)));},
              ),
              Text('${_result}',style: Theme.of(context).textTheme.display1,)
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Forward',
          child: Icon(Icons.forward),
        ),
      ),
    );
  }

}