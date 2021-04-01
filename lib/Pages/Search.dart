//#region Description
/*

  Author: Duncan McBryan
  Date of Creation: 2021-03-06
  Updated: 2021-03-08
  Description:

 */
//#endregion

import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  List<Widget> searchData = [];

  //#region Get Repository
  /*
    This method is the main function of the search page, it dynamically creates
    containers from a list of objects in the constants (lib/constants).
   */
  void getRepo() {
    List<dynamic> responseList = REPOSITORY;
    List<Widget> listRepo = [];
    responseList.forEach((element) {
      listRepo.add(Container(
          height: 100,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: Color.fromRGBO(222, 240, 245, 1),
              boxShadow: [
                BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: FlatButton(
                        onPressed: () {
                        Navigator.pushNamed(context, '/Search-context', arguments: {
                          'name': element['name'],
                          'image': element['image'],
                          'tips': element['tips']
                        });
                        },
                        child: Text('More'),
                        color: Color.fromRGBO(222, 240, 245, 1),
                      ),
                    ),
                    Text(
                      element["name"],
                      style: const TextStyle(
                          fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Image.asset(
                  "assets/${element["image"]}",
                  height: double.infinity,
                )
              ],
            ),
          )));
    });
    setState(() {
      searchData = listRepo;
    });
  }

  //#endregion

  //When the page is opened the getRepo() method is ran
  @override
  void initState() {
    super.initState();
    getRepo();
    controller.addListener(() {
      double value = controller.offset / 119;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(

        appBar: AppBar(
          centerTitle: true,
          title: Text('Search'),
          elevation: 0,
          backgroundColor: Color.fromRGBO(27, 44, 53, 1),
          leading: IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/Home');
              }),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search, color: Color.fromRGBO(222, 240, 245, 1)),
              onPressed: () {
                showSearch(context: context, delegate: RepositorySearch());
              },
            ),
            IconButton(
              icon: Icon(Icons.help, color: Color.fromRGBO(222, 240, 245, 1)),
              onPressed: () {},
            )
          ],
        ),
        body: Container(
          height: size.height,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: closeTopContainer ? 0 : 1,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: size.width,
                  alignment: Alignment.topCenter,
                ),
              ),
              Expanded(
                  child: ListView.builder(
                      controller: controller,
                      itemCount: searchData.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        double scale = 1.0;
                        if (topContainer > 0.5) {
                          scale = index + 0.5 - topContainer;
                          if (scale < 0) {
                            scale = 0;
                          } else if (scale > 1) {
                            scale = 1;
                          }
                        }
                        return Opacity(
                          opacity: scale,
                          child: Transform(
                            transform: Matrix4.identity()..scale(scale, scale),
                            alignment: Alignment.bottomCenter,
                            child: Align(
                                heightFactor: 0.8,
                                alignment: Alignment.topCenter,
                                child: searchData[index]),
                          ),
                        );
                      })),
            ],
          ),
        ),
      ),
    );
  }
}

class RepositorySearch extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    //actions for the app bar
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //leading icon on the left
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    //show some result based on search
    List<dynamic> repoList = REPOSITORY;
    final List<String> signs = [];
    repoList.forEach((element) {
      signs.add(element["name"]);
    });
    final List<String> signsImg = [];
    repoList.forEach((element) {
      signsImg.add(element["image"]);
    });
    final List<String> signsTips = [];
    repoList.forEach((element) {
      signsTips.add(element["tips"]);
    });
    var index = (signs.indexWhere((element) => element.startsWith(query)));
    return Card(
      color: Color.fromRGBO(222, 240, 245, 1),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(query),
            Image.asset("assets/${signsImg[index].toString()}"),
            Text(signsTips[index].toString()),
          ],
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //show when searching for something
    List<dynamic> repoList = REPOSITORY;
    final List<String> signs = [];
    repoList.forEach((element) {
      signs.add(element["name"]);
    });

    final signList = query.isEmpty
        ? signs
        : signs.where((s) => s.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, signsIndex) => ListTile(
        title: Text(signList[signsIndex]),
        onTap: () {
          if (query.isEmpty) {
            query = (signs[signsIndex]);
            showResults(context);
          } else
            showResults(context);
        },
      ),
      itemCount: signList.length,
    );
  }
}
