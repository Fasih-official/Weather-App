import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/blocs/weather_bloc.dart';
import 'package:flutterapp/blocs/weather_event.dart';
import 'package:flutterapp/blocs/weather_state.dart';
import 'package:flutterapp/search_city.dart';
import 'package:flutterapp/simple_bloc_delegate.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => BlocProvider(
              create: (BuildContext context) => WeatherBloc(),
              child: MyHomePage(title: 'Weather App'),
            ),
        '/search/city': (BuildContext context) => SearchCity()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  final RefreshController refreshController = RefreshController();

  // ignore: close_sink

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String searchedCity = 'chicago';

  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.pushNamed(context, '/search/city').then((value) {
                if (value != null) {
                  if (value.toString().isNotEmpty) {
                    searchedCity = value;
                    weatherBloc.add(WeatherFetchingEvent(value));
                  }
                }
              });
            },
          ),
        ],
      ),
      backgroundColor: Colors.lightBlue,
      body: BlocConsumer(
        listener: (BuildContext context, WeatherState state) {
          if (state is WeatherFetchedState) {
            widget.refreshController.refreshCompleted();
          }
          if (state is WeatherErrorState) {
            widget.refreshController.refreshCompleted();
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text('Something went wrong'),
            ));
          }
        },
        bloc: BlocProvider.of<WeatherBloc>(context),
        builder: (BuildContext context, WeatherState state) {
          if (state is WeatherFetchingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherErrorState) {
            return Container();
          } else if (state is WeatherInitialState) {
            return Center(
              child: Text(
                  'Please chose your location by tapping on Search button'),
            );
          } else {
            return SmartRefresher(
              enablePullDown: true,
              enablePullUp: false,
              controller: widget.refreshController,
              child: ListView(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 80,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                (state as WeatherFetchedState)
                                    .weatherDataModel
                                    .title,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 32,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                'Updated at: ${(state as WeatherFetchedState).weatherDataModel.consolidated_weather[0].created.split('T')[1].split(':')[0] + ":" + (state as WeatherFetchedState).weatherDataModel.consolidated_weather[0].created.split('T')[1].split(':')[1]}',
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CachedNetworkImage(
                              width: 96, height: 96,

                              placeholder: (context, url) => Image.asset(
                                'assets/images/ic_clouds.png',
                                width: 96,
                                height: 96,
                              ),

                              imageUrl: '', //https://picsum.photos/250?image=9
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Text(
                                '${(state as WeatherFetchedState).weatherDataModel.consolidated_weather[0].the_temp.toInt()}\u00B0',
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 32,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10.0),
                                    child: Text(
                                      'max: ${(state as WeatherFetchedState).weatherDataModel.consolidated_weather[0].max_temp.toInt()}\u00B0',
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                  ),
                                  SizedBox(height: 5.0),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10.0),
                                    child: Text(
                                      'min: ${(state as WeatherFetchedState).weatherDataModel.consolidated_weather[0].min_temp.toInt()}\u00B0',
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 10.0),
                        child: Text(
                          'Showers',
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(fontSize: 32, color: Colors.white),
                        ),
                      )
                    ],
                  )
                ],
              ),
              onRefresh: () {
                weatherBloc.add(WeatherFetchingEvent(searchedCity));
              },
            );
          }
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
//              weatherBloc.add(WeatherFetchingEvent("chicago"));
            },
            heroTag: 'fab1',
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {
//              weatherBloc.add(WeatherFetchingEvent("chicago"));
            },
            heroTag: 'fab2',
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}

//BlocBuilder<WeatherBloc, WeatherState>(
//builder: (BuildContext context, WeatherState state) {
//return Center(
//child: Column(
//mainAxisAlignment: MainAxisAlignment.center,
//children: <Widget>[
//Text(
//'You have pushed the button this many times:',
//),
//Text(
//'jj',
//style: Theme.of(context).textTheme.headline4,
//),
//],
//),
//);
//},
//)
