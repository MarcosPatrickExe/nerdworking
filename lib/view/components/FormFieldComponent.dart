import "package:flutter/material.dart";
import "../../domain/model/Field.dart";
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../utils/styles.dart';


abstract class FormFieldComponent{

  static const List<Field> defaultFields = [
        Field( "email", "seu email", Icon( Icons.email ), TextInputType.emailAddress ),
        Field( "senha", "sua senha", Icon( Icons.password ), TextInputType.visiblePassword ),
  ];



  static TextFormField buildField ({ 
        required Field fieldView,
        required void Function(String) textChagedCallback,
        bool? fieldTemplate,
        int? maxLength,
     //   bool? fieldEnabled,
        bool? isMac,
        bool? isPhoneNumber
      }){ 



        dynamic? inputFormat;

        if( isMac != null && isMac == true ){
          inputFormat = [ 
            MaskTextInputFormatter( 
                mask:"##:##:##:##:##:##",
                filter: { "#":  RegExp(r'^[a-zA-Z0-9]+$') },  // RegExp(r'[0-9]')
                type: MaskAutoCompletionType.lazy
            )
          ]; 
        }else if( isPhoneNumber != null && isPhoneNumber == true ){
          inputFormat = [ 
            MaskTextInputFormatter( 
                mask:"(##) #####-####",
                filter: { "#":  RegExp(r'^[0-9]+$') },  
                type: MaskAutoCompletionType.lazy
            )
          ]; 
        }
        


        return TextFormField (
            maxLines: 1,
            maxLength: maxLength,
            initialValue: "",
        //   keyboardType: fieldView.inputType,
            onChanged: textChagedCallback,
            inputFormatters: inputFormat,
            decoration:  InputDecoration(
                counterText: "", // retirando o contador
                icon:   fieldView.iconnn,
                enabled: true,
                iconColor: AppColors.GRAY.color,
                hintText:  fieldView.hintText,
                hintStyle: TextStyle( color: AppColors.GRAY_TRANSPARENT.color,  fontSize: 20.0 ),
                labelText:  fieldView.labelText, // titulo do campo
                labelStyle: TextStyle(  color: AppColors.GRAY.color, ), // titulo do campo
                border: const OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: AppColors.GRAY.color,
                  )
                ),
                /*
                focusedBorder: OutlineInputBorder(
                  borderSide:  BorderSide(
                      color:  AppColors.RED.color,
                      width: 3.1,
                  ),
                )
                */
            ),
            style:  TextStyle(
                color: AppColors.TEXT_BLACK.color ,
                fontWeight: FontWeight.normal,
                fontSize: 20.0,
            ),
        );
  }
}
