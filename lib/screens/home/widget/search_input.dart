import 'package:flutter/material.dart';
import 'package:sante_app/screens/search/search.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () { print("olala"); },
      child: Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xfff4f6fa),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    )
                  ),
                  child: TextField(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: 
                        (context) => Search())
                      );
                    },
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: 'Recherche, ex: Dr Koné',
                      border: InputBorder.none
                    )
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xfff4f6fa),
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    )
                ),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    color: Color(0xff137fff),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    )
                  ),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              )
            ],
          )),
    );
  }
}
