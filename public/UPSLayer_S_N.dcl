//Copyright 2005 - netCAD
UPSLayer_S_N : dialog {
    label = "P�r outra layer corrente?" ;
    spacer_1 ;
    initial_focus = _N�o ;
  : row {
spacer ;
    : button {
      key = "accept" ;
      label = "Sim" ;
      mnemonic = "S" ;
      width = 8 ;
      fixed_width = true ;
      is_cancel = true ;
    }
spacer ;
    : button {
      key = "_N�o" ;
      label = "N�o" ;
      mnemonic = "N" ;
      width = 8 ;
      fixed_width = true ;
      is_cancel = true ;
    }
spacer ;
  }
spacer ;
  : row {
spacer ;
    : button {
      key = "cancel" ;
      label = "CANCEL" ;
      mnemonic = "C" ;
      width = 8 ;
      fixed_width = true ;
      is_cancel = true ;
    }
spacer ;
  }
}
