import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:recipe_demo/pages/allrecipespage.dart';
import 'package:recipe_demo/utilities/toolsutilites.dart';

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ToolsUtilities.whiteColor,
      body: Column(
        children: [
          _headerCover(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Transform.translate(
              offset: Offset(0,-20),
              child: Container(
                decoration: BoxDecoration(
                    color: ToolsUtilities.whiteColor,
                  borderRadius: BorderRadius.circular(10)
                ),
                height: MediaQuery.of(context).size.height * 0.55,
                child: GridView.count(crossAxisCount: 3,
                shrinkWrap: true,
                children: [
                  _categoryCard(ToolsUtilities.imageRecipes[0],"Pizza"),
                  _categoryCard(ToolsUtilities.imageRecipes[1],"Chinese"),
                  _categoryCard(ToolsUtilities.imageRecipes[2],"Italian"),
                  _categoryCard(ToolsUtilities.imageRecipes[3],"Fast foods"),
                  _categoryCard(ToolsUtilities.imageRecipes[4],"Sweets"),
                  _categoryCard(ToolsUtilities.imageRecipes[5],"Burger"),
                  _categoryCard(ToolsUtilities.imageRecipes[6],"Lunch"),
                  _categoryCard(ToolsUtilities.imageRecipes[7],"Breakfast"),
                  _categoryCard(ToolsUtilities.imageRecipes[8],"Juise"),
                ],),
              ),
            ),
          )
        ],
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
                  image: NetworkImage(ToolsUtilities.imageRecipes[4]),
                  fit: BoxFit.cover)),
        ),
        Positioned(
          left: 100,
          bottom: 25,
          child: Text(
            ' Our Categories',
            style: TextStyle(
              color: ToolsUtilities.whiteColor,
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),
          ),
        )
      ],
    );
  }
  Widget _categoryCard(String imageName ,String categoryName){
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => AllRecipesPage(categoryName)));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: ToolsUtilities.mainColor,
            borderRadius: BorderRadius.circular(13)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network(imageName,fit: BoxFit.cover,width: 50,height: 50,),
              Text(categoryName,style: TextStyle(
                color: ToolsUtilities.whiteColor,fontWeight: FontWeight.bold
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
