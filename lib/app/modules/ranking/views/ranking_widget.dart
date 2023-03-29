
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:quizzes/app/components/page/app_page.dart';
import 'package:quizzes/app/utils/resources/color_manager.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../../utils/resources/styles_manager.dart';

class RankingWidget extends StatelessWidget {
   final String ?tournamentName;
   final String ? numOfUsers;
  const RankingWidget({super.key, @required this.tournamentName, @required this.numOfUsers});


  @override
  Widget build(BuildContext context) {
    return Center(
      child: LayoutBuilder(builder: (context, constraints) {
        return ResponsiveGridList(
            desiredItemWidth: 600,
            minSpacing: 20,
            children: [
              tournamentName,
              "user 1",
              "user 2",
              "user 3",
              "user 4",
              "user 5",
              "user 6",
              "user 7",
              "user 8",
              "user 9",
              "user 10",

            ].map((i) {
              return i== tournamentName? 
              Card(
                 elevation: 20,
                child: Container(
                  padding:const EdgeInsets.all(20),
                  margin:const EdgeInsets.all(10),
                  height: 100,
                  
                  child:  Column(
                    
                    children: [
                      Text(tournamentName!,style: TextStyle(color: Colors.black  )),
                      Text("#"+ numOfUsers!,style: TextStyle(color: Colors.black  )),
                    ],
                  ),
                  decoration: BoxDecoration(
                   // color: Colors.redAccent,
                    border: Border.all(color:Colors.cyan,width: 1),
                    borderRadius: BorderRadius.circular(5)
                  ),
                ),
              )
              
              : Card(
                elevation: 10,
                child: Container(
                  decoration: BoxDecoration(
                   border: Border.all(color:Colors.cyan,width: 1),
                  ),
                  height: 70,
                  // alignment:const Alignment(0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                  
                    children: [
                     
                    const SizedBox(width: 20,),
                      Container(
                        
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        border: Border.all(color:Colors.cyan,width: 1),
                   ),
                        child:const CircleAvatar(
                          
                          backgroundImage:  NetworkImage("https://images.unsplash.com/photo-1569949380643-6e746ecaa3bd?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fHRvdXJ8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60")
                          )
                        ),
                    const     SizedBox(width:15),
                      Text(
                        i.toString(),
                        style: getLightStyle(
                            color: ColorManager.darkGrey, fontSize: 16),
                      ),
                      const SizedBox(width:50),
                       Text(
                        "score",
                        style: getLightStyle(
                            color: ColorManager.darkGrey, fontSize: 16),
                      ),
                       SizedBox(width:50),
                      Text(
                        "Rank",
                        style: getLightStyle(
                            color: ColorManager.darkGrey, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              );
            }).toList());
            
      }),
    );
  }
}