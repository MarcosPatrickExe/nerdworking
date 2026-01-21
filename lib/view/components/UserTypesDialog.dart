import 'package:flutter/material.dart';
import 'package:nerdworking/view/pages/CreateUserAccount.dart';


class UserTypesDialog extends StatefulWidget{

  BuildContext _parentContext;
  CreateUserAccountState _parentWidget;

  UserTypesDialog({
      super.key, 
      required BuildContext parentContext, 
      required CreateUserAccountState parentWidget 
  }): this._parentContext = parentContext,
      this._parentWidget = parentWidget;


  @override
  State<UserTypesDialog> createState() => UserTypesDialogState();
}
 


class UserTypesDialogState extends State<UserTypesDialog>{

  @override
  Widget build( BuildContext userTypesContext ){

      return AlertDialog(
        /*
          actionsAlignment:  MainAxisAlignment.center,
          title: const Row( 
              mainAxisAlignment: MainAxisAlignment.center,
              children: [  Text("Sobre nós"), ], 
          ), 
        */
          content: Container(
            height: 470.0,
            width: 250.0,
            // Padding(
        //    padding: const EdgeInsets.symmetric( horizontal: 3.0 ),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: super.widget._parentWidget.optionsSelected.length,
                itemBuilder: (BuildContext bc, int index ){

                  return CheckboxListTile(
                    title: Text( super.widget._parentWidget.optionsSelected[index]["name"], ),
                    value: super.widget._parentWidget.optionsSelected[index]["isChecked"],
                    onChanged: ( bool? value){

                      if( value != null ){
                        super.setState(() {
                            super.widget._parentWidget.optionsSelected[index]["isChecked"] = value;
                            print('valor alterado:  ${ super.widget._parentWidget.optionsSelected[index]["name"]}  /  ${ super.widget._parentWidget.optionsSelected[index]["isChecked"]} ');
                        });
                      }
                    },
                  );
                }
            ),
          ),
          
          actions: <Widget>[
            TextButton(
              onPressed: () { Navigator.pop( userTypesContext );  },
              child: const Text("Ok", style: TextStyle( fontSize: 15.0 )),
            ),
          ],
      );
  }

}





