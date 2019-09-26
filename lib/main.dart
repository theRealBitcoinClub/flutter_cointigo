import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:auto_size_text/auto_size_text.dart';

const _kFontFam = 'MyFlutterApp';

const IconData facebook = const IconData(0xf300, fontFamily: _kFontFam);
const IconData facebook_rect = const IconData(0xf301, fontFamily: _kFontFam);
const IconData twitter = const IconData(0xf302, fontFamily: _kFontFam);
const IconData twitter_bird = const IconData(0xf303, fontFamily: _kFontFam);
const IconData instagram = const IconData(0xf31e, fontFamily: _kFontFam);
const IconData instagram_filled = const IconData(0xf31f, fontFamily: _kFontFam);

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TEXT_COLOR = Colors.white;
    return MaterialApp(
      title: 'CoinTigo',
      theme: ThemeData(
        primarySwatch:
            Colors.deepPurple, // Define the default brightness and colors.
        brightness: Brightness.dark,
        primaryColor: Colors.deepPurple[800],
        accentColor: Colors.deepPurpleAccent[600],
        fontFamily: 'Montserrat',
        textTheme: TextTheme(
          caption: TextStyle(
              fontSize: 42.0, fontWeight: FontWeight.w300, color: TEXT_COLOR),
          headline: TextStyle(
              fontSize: 34.0, fontWeight: FontWeight.w300, color: TEXT_COLOR),
          button: TextStyle(
              fontSize: 32.0, fontWeight: FontWeight.w300, color: TEXT_COLOR),
          title: TextStyle(
              fontSize: 24.0, fontWeight: FontWeight.w300, color: TEXT_COLOR),
          display1: TextStyle(
              fontSize: 32.0, fontWeight: FontWeight.w200, color: TEXT_COLOR),
          display2: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w200),
        ),
      ),
      home: MyHomePage(title: 'CoinTigo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _homeState = "HOME";
  void _navigate(String id) {
    updateHomeState(id);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.title,
        ),
        leading: Builder(
          builder: (context) => IconButton(
            tooltip: "MENU",
            padding: EdgeInsets.all(6.0),
            alignment: Alignment.centerRight,
            icon: Image.asset("images/home.png"),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      bottomSheet: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(twitter_bird),
            title: Text('Twitter'),
          ),
          BottomNavigationBarItem(
            icon: Icon(facebook),
            title: Text('Facebook'),
          ),
          BottomNavigationBarItem(
            icon: Icon(instagram),
            title: Text('Instagram'),
          ),
        ],
        fixedColor: Colors.grey[100],
        iconSize: 28,
        selectedLabelStyle: Theme.of(context).textTheme.display2,
        unselectedLabelStyle: Theme.of(context).textTheme.display2,
        onTap: (index) {
          switch (index) {
            case 0:
              _launchURL("https://twitter.com/cointigo");
              break;
            case 1:
              _launchURL("https://www.facebook.com/cointigo/");
              break;
            case 2:
              _launchURL("https://www.instagram.com/cointigo/");
              break;
          }
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Image.asset("images/drawer.png"),
            ),
            _buildListTileMenu(context, 'Chile', "CHI"),
            _buildListTileMenu(context, 'Colombia', "COP"),
            _buildListTileMenu(context, 'France', "FRA"),
            _buildListTileMenu(context, 'Georgia', "GEO"),
            _buildListTileMenu(context, 'Guatemala', "GUA"),
            _buildListTileMenu(context, 'Serbia', "SER"),
            _buildListTileMenu(context, 'South Africa', "ZAF"),
            _buildListTileMenu(context, 'Spain', "SPA"),
            _buildListTileMenu(context, 'Switzerland', "CH"),
            _buildListTileMenu(context, 'UK', "UK"),
            _buildListTileMenu(context, 'USA', "USA"),
            _buildListTileMenu(context, 'Venezuela', "VEN")
          ],
        ),
      ),
      body: Scrollbar(
        child: ListView(children: _buildContent()),
      ),
    );
  }

  ListTile _buildListTileHomeContent(
      BuildContext context, String text, String id, String countryCode) {
    return ListTile(
      contentPadding: EdgeInsets.all(32.0),
      trailing: Text(
        countryCode,
        style: Theme.of(context).textTheme.display1,
      ),
      title: _buildHomeItemText(context, text),
      onTap: () {
        updateHomeState(id);
      },
    );
  }

  void updateHomeState(String id) {
    setState(() {
      _homeState = id;
    });
  }

  Image _drawImage(String img) => Image.asset("images/" + img + ".png");

  ListTile _buildListTileMenu(BuildContext context, String text, String id) {
    return ListTile(
      contentPadding: EdgeInsets.all(16.0),
      trailing: Icon(Icons.arrow_forward_ios),
      title: _buildDrawerItemText(context, text),
      onTap: () {
        _navigate(id);
      },
    );
  }

  List<Widget> _buildContent() {
    List<Widget> rtv = [];

    switch (_homeState) {
      case "HOME":
        rtv.add(Padding(padding: EdgeInsets.all(10.0)));
        rtv.add(_buildListTileHomeContent(context, 'Colombia', "COP", "+57"));
        rtv.add(_buildListTileHomeContent(context, 'Chile', "CHI", "+56"));
        rtv.add(_buildListTileHomeContent(context, 'France', "FRA", "+33"));
        rtv.add(_buildListTileHomeContent(context, 'Georgia', "GEO", "+995"));
        rtv.add(_buildListTileHomeContent(context, 'Guatemala', "GUA", "+502"));
        rtv.add(_buildListTileHomeContent(context, 'Serbia', "SER", "+381"));
        rtv.add(
            _buildListTileHomeContent(context, 'South Africa', "ZAF", "+27"));
        rtv.add(_buildListTileHomeContent(context, 'Spain', "SPA", "+34"));
        rtv.add(_buildListTileHomeContent(context, 'Switzerland', "CH", "+41"));
        rtv.add(_buildListTileHomeContent(context, 'UK', "UK", "+44"));
        rtv.add(_buildListTileHomeContent(context, 'USA', "USA", "+1"));
        rtv.add(_buildListTileHomeContent(context, 'Venezuela', "VEN", "+58"));
        break;
      case "COP":
        rtv.add(_buildListTileHomeContent(context, 'Colombia', "HOME", "+57"));
        rtv.add(buildListTileCaption("¡Toque el número!"));
        rtv.add(_buildListTileNumber("drawer", "310-461-06-06", "+57"));
        break;
      case "CHI":
        rtv.add(_buildListTileHomeContent(context, 'Chile', "HOME", "+56"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "992-182-477", "+56"));
        break;
      case "FRA":
        rtv.add(_buildListTileHomeContent(context, 'France', "HOME", "+33"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "757-935-837 ", "+33"));
        break;
      case "GEO":
        rtv.add(_buildListTileHomeContent(context, 'Georgia', "HOME", "+995"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "597-150-110", "+995"));
        break;
      case "GUA":
        rtv.add(
            _buildListTileHomeContent(context, 'Guatemala', "HOME", "+502"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "501-842-22", "+502"));
        break;
      case "SER":
        rtv.add(_buildListTileHomeContent(context, 'Serbia', "HOME", "+381"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "611-476-149", "+381"));
        break;
      case "ZAF":
        rtv.add(
            _buildListTileHomeContent(context, 'South Africa', "HOME", "+27"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "872-406-581", "+27"));
        break;
      case "SPA":
        rtv.add(_buildListTileHomeContent(context, 'Spain', "HOME", "+34"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "622-446-931", "+34"));
        break;
      case "CH":
        rtv.add(
            _buildListTileHomeContent(context, 'Switzerland', "HOME", "+41"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "798-071-464", "+41"));
        break;
      case "UK":
        rtv.add(_buildListTileHomeContent(context, 'UK', "HOME", "+44"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "741-212-55-22", "+44"));
        break;
      case "USA":
        rtv.add(_buildListTileHomeContent(context, 'USA', "HOME", "+1"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "360-224-57-86", "+1"));
        break;
      case "VEN":
        rtv.add(_buildListTileHomeContent(context, 'Venezuela', "HOME", "+58"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "11-23-58", "+58"));
        break;
    }

    rtv.add(ListTile(contentPadding: EdgeInsets.all(32.0)));
    return rtv;
  }

  ListTile buildListTileCaption(String msg) {
    return ListTile(
      contentPadding: EdgeInsets.fromLTRB(32.0, 0.0, 0.0, 16.0),
      title: Text(
        msg,
        style: Theme.of(context)
            .textTheme
            .caption
            .copyWith(color: Colors.yellow[700]),
      ),
    );
  }

  ListTile _buildListTileNumber(
      String img, String phoneNumber, String countryCode) {
    return ListTile(
      contentPadding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
      leading: Image.asset(
        "images/" + img + ".png",
        width: 100.0,
      ),
      title: Text(
        phoneNumber,
        style: Theme.of(context).textTheme.title,
      ),
      trailing: Icon(
        Icons.sms,
        size: 36.0,
      ),
      onTap: () {
        _launchURL("sms:" + countryCode + phoneNumber);
      },
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      _showSnackBar(context, 'Could not launch $url');
      throw 'Could not launch $url';
    }
  }

  Text _buildDrawerItemText(BuildContext context, String txt) => Text(
        txt,
        style: Theme.of(context).textTheme.button,
      );

  Text _buildHomeItemText(BuildContext context, String txt) => Text(
        txt,
        style: Theme.of(context).textTheme.headline,
      );

  void _showSnackBar(ctx, String msg, {String additionalText = ""}) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      duration: Duration(milliseconds: 3000),
      content: Text(
        /*FlutterI18n.translate(ctx, msgId)*/ msg + additionalText,
        style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w400,
            color: Colors.grey[900]),
      ),
      backgroundColor: Colors.yellow[700],
    ));
  }
}
