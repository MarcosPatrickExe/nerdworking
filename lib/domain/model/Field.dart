import 'package:flutter/material.dart';

class Test {  
   final int integer = 23;
}

class Field {  
    final String? labelText;
    final String? hintText;
    final Icon? iconnn; 
    final TextInputType? inputType; 

    const Field( this.labelText, this.hintText, this.iconnn, this.inputType ); 
}
