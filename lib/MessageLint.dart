

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MessageList extends StatefulWidget {
  final String title;

  const MessageList({Key key, this.title}) : super(key: key);


  @override
  State<StatefulWidget> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList>{

var messages = const [];

Future loadMessageList() async{
  //await parce que le chargement d'un fichier prend un peu de temps(entre la requete et la reception): latency
  //await signifie que flutter va s'arreter et faire autre chose le temps que notre requete suis satisfaite. 
   var content = await rootBundle.loadString('data/message.json');
  //Avec print la console affiche le contenu du fichier avec les {}, les ' et ,
  //pour recuperer seulement les données on convertir le string en une structure json.
  var collection = json.decode(content);
  
  setState(() {
    messages = collection;
  });

  // print(content); pour afficher le contenu du ficher sur la console 
}

@override
  void initState() {
    loadMessageList();
    super.initState();
  }

@override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        //widget.title au lieu de this.title parce que title est dans la classe MessageList qui est un widget(stateful) 
        title: Text(widget.title),
      ),
      body: ListView.separated(
        itemCount: messages.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (BuildContext context, int index) {
          var message = messages[index];
          return ListTile(
            title: Text(message['subject']),
            trailing: Text('Z'),
            isThreeLine: true,
            leading: CircleAvatar(
              child: Text('PJ'),
            ),
            subtitle: Text(
              message['body'],
              //maxLines permet de limité le nombre de lignes max pour l'affichage d'un text
              maxLines: 2,
              //Textoverflow.ellipsis permet de mettre des pointillé lorsque le nombre de ligne max est depassé
              overflow: TextOverflow.ellipsis,
            ),
          );
        },
      ),
    );
  }

}