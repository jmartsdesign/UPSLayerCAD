					// UPSNormaCAD v1.1 - 2005
					// Programa de apoio à implantação da Norma NP ISO 13567
					// Uso só para o AutoCAD - Uso interno da ADA - UP'SETA
					// Associação Diogo dde Azambuja - www.ada-net.org
					// @2005 - antunes@ada-net.org

UPSNPar : dialog {				//dialog name
          label = "UP'SNormaCAD v1.1 - Paredes" ;//give it a label
//-------inicio da ---1---------------
:row{
  : boxed_column {
      key = "br0" ;
      label = "Campos a preencher em conformidade com a Norma ISO 13567" ;
      alignment = left;
//--------------------------
   :column{
      : boxed_column {
      key = "br1" ;
      label = "CAMPOS OBRIGATÓRIOS" ;
     	: text {				//define popup list
        label = "Cláusula 6.1 -> ESPECIALIDADE :                                            A-  Arquitectura ";			//give it a label
        }					//end list
     	: popup_list {				//define popup list
        label = "Cláusula 6.2 -> ELEMENTOS :";			//give it a label
        key = "pl2";			//give it a name
        value = "2" ;				//initial value
        edit_width = 40;			//fix the width
        }
     	: popup_list {				//define popup list
        label = "Cláusula 6.3 -> APRESENTAÇÃO :";			//give it a label
        key = "pl3";			//give it a name
        value = "5" ;				//initial value
        edit_width = 40;			//fix the width
	}
	}
//------------------------------
: boxed_column {
      key = "br2" ;
      label = "CAMPOS OPCIONAIS" ;
	: popup_list {				//define popup list
        label = "Cláusula 7.1 -> ESTADO :";			//give it a label
        key = "pl4";			//give it a name
        value = "4" ;				//initial value
        edit_width = 30;			//fix the width
	}
     	: edit_box {				//define popup list
        label = "Cláusula 7.2 -> SECTOR (somente 4 carateres) :";			//give it a label
        key = "pl5";			//give it a name
        value = "----" ;				//initial value
        edit_width = 10;			//fix the width
          fixed_height = true;			//fix the height
	}
     	: popup_list {				//define popup list
        label = "Cláusula 7.3 -> FASE :";			//give it a label
        key = "pl6";			//give it a name
        value = "0" ;				//initial value
        edit_width = 30;			//fix the width
	}
     	: popup_list {				//define popup list
        label = "Cláusula 7.4 -> PROJECÇÃO :";			//give it a label
        key = "pl7";			//give it a name
        value = "1" ;				//initial value
        edit_width = 30;			//fix the width
	}
     	: popup_list {				//define popup list
        label = "Cláusula 7.5 -> ESCALA :";			//give it a label
        key = "pl8";			//give it a name
        value = "6" ;				//initial value
        edit_width = 30;			//fix the width
	}
	: popup_list {				//define popup list
        label = "Cláusula 7.6 -> MATERIAIS :";			//give it a label
        key = "pl9";			//give it a name
        value = "0" ;				//initial value
        edit_width = 30;			//fix the width
	}
///-----------------(É colocado automaticamnete na Layer)
spacer_1;				//add spacer_1
  : boxed_row {
      key = "br10" ;
      label = "Layer Corrente" ;
      	: text_part {				//text
	  key = "txt1";				//give it a name
	  alignment = centered;
	}					//end text
}
	spacer_1;				//add spacer_1
	}
}
}
}//fim da ---1--
//-----------------------
   : text {
      key = "t2" ;
      label = "Programa de apoio à implantação da Norma NP ISO 13567 - Uso interno da ADA - UP'SETA" ;
      alignment = centered;
  }
   : text {
      key = "t3" ;
      label = "@2005 - antunes@ada-net.org" ;
      alignment = centered;
  }
        ok_cancel ;				//predefined OK/Cancel button

        }					//end dialog 
//-------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------
UPSNPav : dialog {				//dialog name
          label = "UP'SNormaCAD v1.1 - Pavimento" ;//give it a label
//-------inicio da ---1---------------
:row{
  : boxed_column {
      key = "br0" ;
      label = "Campos a preencher em conformidade com a Norma ISO 13567" ;
      alignment = left;
//--------------------------
   :column{
      : boxed_column {
      key = "br1" ;
      label = "CAMPOS OBRIGATÓRIOS" ;
     	: text {				//define popup list
        label = "Cláusula 6.1 -> ESPECIALIDADE :                                            A-  Arquitectura ";			//give it a label
        }					//end list
     	: popup_list {				//define popup list
        label = "Cláusula 6.2 -> ELEMENTOS :";			//give it a label
        key = "pl2";			//give it a name
        value = "2" ;				//initial value
        edit_width = 40;			//fix the width
        }
     	: popup_list {				//define popup list
        label = "Cláusula 6.3 -> APRESENTAÇÃO :";			//give it a label
        key = "pl3";			//give it a name
        value = "5" ;				//initial value
        edit_width = 40;			//fix the width
	}
	}
//------------------------------
: boxed_column {
      key = "br2" ;
      label = "CAMPOS OPCIONAIS" ;
	: popup_list {				//define popup list
        label = "Cláusula 7.1 -> ESTADO :";			//give it a label
        key = "pl4";			//give it a name
        value = "4" ;				//initial value
        edit_width = 30;			//fix the width
	}
     	: edit_box {				//define popup list
        label = "Cláusula 7.2 -> SECTOR (somente 4 carateres) :";			//give it a label
        key = "pl5";			//give it a name
        value = "----" ;				//initial value
        edit_width = 10;			//fix the width
          fixed_height = true;			//fix the height
	}
     	: popup_list {				//define popup list
        label = "Cláusula 7.3 -> FASE :";			//give it a label
        key = "pl6";			//give it a name
        value = "0" ;				//initial value
        edit_width = 30;			//fix the width
	}
     	: popup_list {				//define popup list
        label = "Cláusula 7.4 -> PROJECÇÃO :";			//give it a label
        key = "pl7";			//give it a name
        value = "1" ;				//initial value
        edit_width = 30;			//fix the width
	}
     	: popup_list {				//define popup list
        label = "Cláusula 7.5 -> ESCALA :";			//give it a label
        key = "pl8";			//give it a name
        value = "6" ;				//initial value
        edit_width = 30;			//fix the width
	}
	: popup_list {				//define popup list
        label = "Cláusula 7.6 -> MATERIAIS :";			//give it a label
        key = "pl9";			//give it a name
        value = "0" ;				//initial value
        edit_width = 30;			//fix the width
	}
///-----------------(É colocado automaticamnete na Layer)
spacer_1;				//add spacer_1
  : boxed_row {
      key = "br10" ;
      label = "Layer Corrente" ;
      	: text_part {				//text
	  key = "txt1";				//give it a name
	  alignment = centered;
	}					//end text
}
	spacer_1;				//add spacer_1
	}
}
}
}//fim da ---1--
//-----------------------
   : text {
      key = "t2" ;
      label = "Programa de apoio à implantação da Norma NP ISO 13567 - Uso interno da ADA - UP'SETA" ;
      alignment = centered;
  }
   : text {
      key = "t3" ;
      label = "@2005 - antunes@ada-net.org" ;
      alignment = centered;
  }
        ok_cancel ;				//predefined OK/Cancel button

        }					//end dialog 
//-------------------------------------------------------------------------------------