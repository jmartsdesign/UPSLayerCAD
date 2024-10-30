					// UPSLayerCAD v2 - 2006
					// Programa de apoio à implantação da Norma NP ISO 13567
					// Uso só para o AutoCAD - Uso interno da ADA - UP'SETA
					// Associação Diogo dde Azambuja - www.ada-net.org
					// @2005 - antunes@ada-net.org

UPSLayer : dialog {				//dialog name
          label = "UP'SLayerCAD v2" ;		//give it a label
        : image {				//define image tile
          key = "im3" ;				//give it a name
          height = 9 ;			//add a height
          width = 150 ;			//and now a width
          fixed_width = true;			//fix the width
          fixed_height = true;			//fix the height
          color = graphics_background;		//set background color
          alignment = centered;
        }					//end image
//-------inicio da ---1---------------
:row{
  : boxed_column {
      key = "br0" ;
      label = "Campos a preencher em conformidade com a Norma NP ISO 13567" ;
      alignment = left;
///-----------------(É colocado automaticamnete na Layer)
      	: text {				//text
	  key = "txt1" ;				//give it a name
	  label = "  Layer Corrente : " ;
	  alignment = centered;
	}					//end text
	: text {				//text
	  key = "txt2" ;				//give it a name
	  label = "  Nova Layer Selecionada : " ;
	  alignment = centered;
	}					//end text
//	spacer_1;				//add spacer_1
//--------------------------
   :column{
      : boxed_column {
      key = "br1" ;
      label = "CAMPOS OBRIGATÓRIOS" ;
     	: popup_list {				//define popup list
        label = "Cláusula 6.1 -> ESPECIALIDADE :";			//give it a label
        key = "pl1";			//give it a name
        value = "1" ;				//initial value
        edit_width = 40;			//fix the width
        }					//end list
     	: popup_list {				//define popup list
        label = "Cláusula 6.2 -> ELEMENTOS :";			//give it a label
        key = "pl2";			//give it a name
        value = "0" ;				//initial value
        edit_width = 40;			//fix the width
        }
        : edit_box {				//define popup list
        label = "                    -> CODIGO ";			//give it a label
        key = "V_ELEMENTOS";			//give it a name
        value = "------" ;				//initial value
        edit_width = 10;			//fix the width
          fixed_height = true;			//fix the height
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
        value = "10" ;				//initial value
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
        value = "0" ;				//initial value
        edit_width = 30;			//fix the width
	}
     	: popup_list {				//define popup list
        label = "Cláusula 7.5 -> ESCALA :";			//give it a label
        key = "pl8";			//give it a name
        value = "0" ;				//initial value
        edit_width = 30;			//fix the width
	}
	: popup_list {				//define popup list
        label = "Cláusula 7.6 -> MATERIAIS :";			//give it a label
        key = "pl9";			//give it a name
        value = "0" ;				//initial value
        edit_width = 30;			//fix the width
	}
///-----------------(É colocado automaticamnete na Layer)
//spacer_1;				//add spacer_1
  : boxed_row {
      key = "br10" ;
      label = "Cláusula 7.7 -> Descrição" ;
	:column{
	:radio_button {
	label = " -> Quero modificar a Layer ";
	key = "pl10";
	}
	:column{
	: edit_box {				//define popup list
        label = " -> Descrição";			//give it a label
        key = "pl11";			//give it a name
//        value = "------------------------------" ;				//initial value
        edit_width = 40;			//fix the width
        fixed_height = true;			//fix the height
	}
}
}
}
}
}
}
:row{
  : boxed_column {
      key = "br00" ;
      label = "Resumo das Cláusulas para melhor construção das layers" ;
      : boxed_column {
      key = "br001" ;
      label = "Cláusula 6.2" ;
      : text {
      key = "t000" ;
      label = " 1-- <- Elementos estruturais - Subestruturas" ;
      alignment = left;
      }
      : text {
      key = "t001" ;
      label = " 2-- <- Elementos Primários" ;
      alignment = left;
      }
      : text {
      key = "t013" ;
      label = " -> 200 <- PAREDES" ;
      alignment = left;
      }
      : text {
      key = "t002" ;
      label = " 3-- <- Elementos Secundários" ;
      alignment = left;
      }
            : text {
      key = "t003" ;
      label = " -> 36- <- Portas e Janelas" ;
      alignment = left;
      }
            : text {
      key = "t004" ;
      label = " -> 364 <- Portas" ;
      alignment = left;
      }
                  : text {
      key = "t005" ;
      label = " -> 365 <- Janelas" ;
      alignment = left;
      }
                  : text {
      key = "t006" ;
      label = " 4-- <- Acabamentos, Revestimentos e Isolamentos" ;
      alignment = left;
      }
                  : text {
      key = "t007" ;
      label = " 5-- <- VIAS DE COMUNICAÇÂO" ;
      alignment = left;
      }
                   : text {
      key = "t008" ;
      label = " 6-- <- ESPECIALIDADES" ;
      alignment = left;
      }
                  : text {
      key = "t009" ;
      label = " 7-- <- Acessóroios, Equipamentos e Mobiliário" ;
      alignment = left;
      }
                 : text {
      key = "t010" ;
      label = " 8-- <- Trabalhos  nos Terrenos" ;
      alignment = left;
      }
                 : text {
      key = "t011" ;
      label = " -> 81- <- TOPOGRAFIA" ;
      alignment = left;
      }
                    : text {
      key = "t012" ;
      label = " 9-- <- CARTOGRAFIA" ;
      alignment = left;
      }
      : text {
      key = "t0014" ;
      label = "Não dispensa a consulta do ANEXO I do" ;
      alignment = left;}
      : text {
      key = "t0015" ;
      label = "MANUAL DE PROCEDIMENTOS UP’SCAD" ;
      alignment = left;}
}
      : boxed_column {
      key = "br0001" ;
      label = "Cláusula 7.6" ;
      : text {
      key = "t0000" ;
      label = "Consultar ANEXO II do" ;
      alignment = left;
}
      : text {
      key = "t0001" ;
      label = "MANUAL DE PROCEDIMENTOS UP’SCAD" ;
      alignment = left;
}
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
        ok_cancel_help_info ;				//predefined OK/Cancel button

        }					//end dialog
//----------------------
UPSNabout : dialog {
	label = "Sobre o UP'SLayerCAD v2" ;
	:text {label=" ";}
	:text {label="UPSLayerCAD v2 - 2005";alignment = centered;}
	:text {label="Programa de apoio à implantação da Norma NP ISO 13567";alignment = centered;}
	:text {label="Uso só para o AutoCAD - Uso interno da ADA - UP'SETA";alignment = centered;}
	:text {label="Associação Diogo dde Azambuja - www.ada-net.org";alignment = centered;}
	:text {label="@2005 - upseta@ada-net.org - www.upseta.pt.vu";alignment = centered;}
	:text {label="--------------------";alignment = centered;}
	:text {label="Escrito por Jorge Antunes";alignment = centered;}
	:text {label="netcad2001@hotmail.com";alignment = centered;}
	:text {label="www.netcad.pt.vu";alignment = centered;}
	:text {label=" ";alignment = centered;}
	ok_only;
}
UNTITLED : dialog {
    ok_only;
}
