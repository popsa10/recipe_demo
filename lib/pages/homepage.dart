import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_demo/pages/detailsrecipe.dart';
import 'package:recipe_demo/utilities/toolsutilites.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_headerCover(), _featuredSection(),
          _newSection()],
      ),
    );
  }

  Widget _headerCover() {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.3,
          decoration: BoxDecoration(
              color: ToolsUtilities.mainColor,
              image: DecorationImage(
                  image: NetworkImage(ToolsUtilities.imageRecipes[9]),
                  fit: BoxFit.cover)),
        ),
        Positioned(
          bottom: 50,
          left: 22,
          child: Column(children: [
            Text(
              'Daily New Recipes',
              style: TextStyle(
                color: ToolsUtilities.whiteColor,
                fontSize: 18,
              ),
            ),
            Text('Discovery Now',
                style: TextStyle(
                    color: ToolsUtilities.whiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 22))
          ]),
        )
      ],
    );
  }
  Widget _featuredSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 10,),
          child: Text(
            'Featured Recipe',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: ToolsUtilities.secondColor,
                fontSize: 25),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: ToolsUtilities.imageRecipes.length,
              itemBuilder: (context, index) {
                return _featuredCard(index);
              }),
        )
      ],
    );
  }
  Widget _featuredCard(int index) {
    return InkWell(
      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailsRecipe()));},
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(8),
            width: MediaQuery.of(context).size.width * 0.4,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ToolsUtilities.mainColor,
                image: DecorationImage(
                    image: NetworkImage(ToolsUtilities.imageRecipes[index]),
                    fit: BoxFit.cover)),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Title Recipe',
                    style: TextStyle(
                      color: ToolsUtilities.whiteColor,
                      fontSize: 17,
                    ),
                  ),
                  Row(children: [
                    Icon(
                      Icons.restaurant,
                      size: 15,
                      color: ToolsUtilities.whiteColor,
                    ),
                    SizedBox(width: 5),
                    Text('Category',
                        style: TextStyle(
                            color: ToolsUtilities.whiteColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 17)),
                  ])
                ]),
          )
        ],
      ),
    );
  }
  Widget _newSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 10,),
          child: Text(
            'New ',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: ToolsUtilities.secondColor,
                fontSize: 25),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.24,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: ToolsUtilities.imageRecipes.length,
              itemBuilder: (context, index) {
                return _newCard(index);
              }),
        )
      ],
    );
  }
  Widget _newCard(int index){
    return InkWell(
      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailsRecipe()));},
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(8),
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ToolsUtilities.mainColor,
                image: DecorationImage(
                    image: NetworkImage(ToolsUtilities.imageRecipes[index]),
                    fit: BoxFit.cover)),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Title Recipe',
                    style: TextStyle(
                      color: ToolsUtilities.whiteColor,
                      fontSize: 18,
                    ),
                  ),
                  Row(children: [
                    Icon(
                      Icons.timer,
                      size: 17,
                      color: ToolsUtilities.whiteColor,
                    ),
                    SizedBox(width: 5),
                    Text('60 minutes',
                        style: TextStyle(
                            color: ToolsUtilities.whiteColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 17)),
                  ])
                ]),
          )
        ],
      ),
    );
  }
}
