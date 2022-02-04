import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sante_app/controllers/categories_controller.dart';
import 'package:sante_app/screens/home/widget/doctor.dart';


class Search extends StatefulWidget {
  const Search({ Key? key }) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final CategoriesController cc = Get.put(CategoriesController());

  List searchResult = [];
  updateSearchResult(value){
    setState(() {
      searchResult = cc.allDoctorsList.where(
        (e) => e["name"].toLowerCase().contains(value.toLowerCase())
      ).toList();
    });
  }

  @override
  void initState(){
    super.initState();
    searchResult = cc.allDoctorsList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 50),
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.arrow_back_rounded)
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 10, right: 20),
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    decoration: const BoxDecoration(
                      color: Color(0xfff4f6fa),
                      borderRadius: BorderRadius.all(Radius.circular(50))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        
                        Expanded(child: TextField(
                          onChanged: (value) {
                            if(value.isNotEmpty){
                              updateSearchResult(value);
                            }else {
                              setState(() {
                                searchResult = cc.allDoctorsList;
                              });
                            }
                          },
                          autofocus: true,
                          decoration: const InputDecoration(
                            hintText: 'Recherche, ex: Koffi',
                            icon: Icon(Icons.search),
                            border: InputBorder.none
                          ),
                        )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 15, bottom: 15),
        padding: const EdgeInsets.only(left: 15, right: 15),
        alignment: Alignment.center,
        child: ListView.builder(
          itemCount: searchResult.length,
          itemBuilder: (context, i) {
            return Doctor(
              id: searchResult[i]["id"],
              image: searchResult[i]["id_photo"], 
              specialiste: searchResult[i]["specialist"], 
              nom: searchResult[i]["name"],
              searching: true,
            );
          }
        ),
      ),
    );
  }
}