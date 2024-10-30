// Tippit CADD Services AIA Layer Creation Dialog
//
// This dialog box is quite large.
// The recommended Desktop size is 1024x768 or higher
//         minimum Desktop size is 800x600
//
// In order to make this dialog smaller, you can remark [//]
// seldom used radio_buttons within the Prefix column.
// 
// example - 6 lines for each radio button
//
//      : radio_button {
//        key = "rbg" ;
//        label = "<G>eneral" ;
//        value = "0" ;
//        mnemonic = "G" ;
//      }
//
// The Suffix and Modifier List Boxes will get shorter accordingly.
//
TCSLAY : dialog {
  label = "TCS AIA Layer Creation Dialog";
: row {
   : boxed_radio_column {
      label = "Prefix (Agent):" ;
      key = "brc" ;
      fixed_width = true ;
      width = 29 ;
      : radio_button {
        key = "rbg" ;
        label = "<G>eneral" ;
        value = "0" ;
        mnemonic = "G" ;
      }
      : radio_button {
        key = "rbh" ;
        label = "<H>TRW/Environmental" ;
        value = "0" ;
        mnemonic = "H" ;
      }
      : radio_button {
        key = "rbc" ;
        label = "<C>ivil/Site" ;
        value = "0" ;
        mnemonic = "C" ;
      }
      : radio_button {
        key = "rbw" ;
        label = "Civil <W>orks" ;
        value = "0" ;
        mnemonic = "W" ;
      }
      : radio_button {
        key = "rbb" ;
        label = "<B> Geotechnical" ;
        value = "0" ;
        mnemonic = "B" ;
      }
      : radio_button {
        key = "rbu" ;
        label = "<U>tilities" ;
        value = "0" ;
        mnemonic = "U" ;
      }
      : radio_button {
        key = "rbl" ;
        label = "<L>andscape" ;
        value = "0" ;
        mnemonic = "L" ;
      }
      : radio_button {
        key = "rbs" ;
        label = "<S>tructural" ;
        value = "0" ;
        mnemonic = "S" ;
      }
      : radio_button {
        key = "rba" ;
        label = "<A>rchitectural" ;
        value = "0" ;
        mnemonic = "A" ;
      }
      : radio_button {
        key = "rbi" ;
        label = "<I>nterior Design" ;
        value = "0" ;
        mnemonic = "I" ;
      }
      : radio_button {
        key = "rbq" ;
        label = "E<Q>uipment-Security Sys." ;
        value = "0" ;
        mnemonic = "Q" ;
      }
      : radio_button {
        key = "rbf" ;
        label = "<F>ire Protection" ;
        value = "0" ;
        mnemonic = "F" ;
      }
      : radio_button {
        key = "rbp" ;
        label = "<P>lumbing" ;
        value = "0" ;
        mnemonic = "P" ;
      }
      : radio_button {
        key = "rbm" ;
        label = "<M>echanical" ;
        value = "0" ;
        mnemonic = "M" ;
      }
      : radio_button {
        key = "rbe" ;
        label = "<E>lectrical" ;
        value = "0" ;
        mnemonic = "E" ;
      }
      : radio_button {
        key = "rbt" ;
        label = "<T>elecommunications" ;
        value = "0" ;
        mnemonic = "T" ;
      }
   }
   : column {
      : row {
         fixed_width = true ;
         width = 46 ;
         : boxed_column {
            label = "Suffix (Major):" ;
            key = "bc1" ;
            : list_box {
               key = "suf" ;
            }
         }
         spacer;
         : boxed_column {
            label = "Modifier (Minor):" ;
            key = "bc2" ;
            : list_box {
               key = "mod" ;
               allow_accept = true ;
            }
         }
      }
      : boxed_column {
         label = "Information:" ;
         fixed_height = true ;
         height = 10 ;
         : text {
            key = "ctxt" ;
            label = "Previous Layer Name:" ;
         }
         : text {
            key = "txt" ;
            label = "Selected Layer Name:" ;
         }
         : text {
            key = "des1" ;
            label = "Suffix Info:" ;
         }
         : text {
            key = "des2" ;
            label = "Modifier Info:" ;
         }
         : row {
            : text {
               key = "col" ;
               label = "Color:" ;
            }
            :button {
               label="Color..." ;
               key="edcol" ;
               is_enabled = false ;
               fixed_width = true ;
               width = 12 ;
               alignment = right ;
            }
         }
         : row {
            : text {
               key = "ltp" ;
               label = "Linetype:" ;
               }
            :button {
               label="Ltype..." ;
               key="edltp" ;
               is_enabled = false ;
               fixed_width = true ;
               width = 12 ;
               alignment = right ;
               }
            }
         }
      }
   }
   spacer;
   : row {
      alignment = centered ;
      : boxed_row {
         label = "Custom Prefix" ;
            fixed_width = true ;
            width = 29 ;
         : toggle {
            key = "custog" ;
            label = "ON" ;
         }
         : edit_box {
            label = "Enter:" ;
            key = "cuspre" ;
            fixed_width = true ;
            width = 4 ;
            is_enabled = false ;
            allow_accept = true ;
         }
      }
      ok_cancel ;
      :button {
         label="Chart..." ;
         key="colchart" ;
      }
      :button {
         label = "About..." ;
         key = "tipl" ;
      }
   }
   : text {
       key = "note" ;
   }
}

tcsimage : dialog {
   label = "Tippit Logo" ;
   children_alignment = centered ;
   : text {
      label = "Custom application developed by:" ;
   }
   : image {
      key = "image" ;
      aspect_ratio = 2.0 ;
      color = -15 ;
      width = 10 ;
   }
   : boxed_column {
      label = "Company Information:" ;
      : text {
         label = "Tippit CADD Services" ;
      }
      : text {
         label = "P.O. Box 915" ;
      }
      : text {
         label = "Idalou, TX 79329" ;
      }
      : text {
         label = "E-mail: jtippit@valornet.com" ;
      }
   spacer ;
   }
   : text {
      key = "ver" ;
   }
   spacer ;
   ok_only ;
}

editcol : dialog {
   label = "Edit Color" ;
   children_alignment = centered ;
   : boxed_row {
      label = "Type or Pick:" ;
      : edit_box {
         label = "Current:" ;
         key = "chgcol" ;
         fixed_width = true ;
         width = 4 ;
         allow_accept = true ;
      }
      : button {
         label = "Pick..." ;
         key = "pickcol" ;
         mnemonic = "P" ;
      }
      spacer ;
   }
   spacer ;
   : text {
      key = "coltxt" ;
   }
   spacer ;
   : row {
      :button {
         label = "Change NOW..." ;
         key = "chgnow-c" ;
         is_default = true ;
         mnemonic = "N" ;
      }
      spacer ;
      cancel_button ;
   }
}

editltp : dialog {
   label = "Edit Linetype" ;
   children_alignment = centered ;
   : boxed_column {
      label = "Type or Select:" ;
      : edit_box {
         label = "Custom:" ;
         key = "chgltp" ;
         allow_accept = true ;
      }
      spacer ;
      : list_box {
         key = "listltp" ;
         list = "CONTINUOUS\nBORDER\nBORDER2\nBORDERX2\nCENTER\nCENTER2\nCENTERX2\nDASHDOT\nDASHDOT2\nDASHDOTX2\nDASHED\nDASHED2\nDASHEDX2\nDIVIDE\nDIVIDE2\nDIVIDEX2\nDOT\nDOT2\nDOTX2\nHIDDEN\nHIDDEN2\nHIDDENX2\nPHANTOM\nPHANTOM2\nPHANTOMX2" ;
         allow_accept = true ;
      }
      spacer ;
   }
   spacer ;
   : text {
      key = "ltptxt" ;
   }
   spacer ;
   : row {
      :button {
         label = "Change NOW..." ;
         key = "chgnow-l" ;
         is_default = true ;
         mnemonic = "N" ;
      }
      spacer ;
      cancel_button ;
   }
}

colchart : dialog {
   label = "Color/Linewidth Chart" ;
   children_alignment = centered ;
   : text {
      label = "Color       Name       Weight       Width" ;
   }
   : boxed_column {
      : row {
         : column {
            : text {
               label = "     1  " ;
            }
            : text {
               label = "     2  " ;
            }
            : text {
               label = "     3  " ;
            }
            : text {
               label = "     4  " ;
            }
            : text {
               label = "     5  " ;
            }
            : text {
               label = "     6  " ;
            }
            : text {
               label = "     7  " ;
            }
            : text {
               label = "     8  " ;
            }
            : text {
               label = "     9  " ;
            }
         }
         : column {
            : text {
               label = "Red" ;
            }
            : text {
               label = "Yellow" ;
            }
            : text {
               label = "Green" ;
            }
            : text {
               label = "Cyan" ;
            }
            : text {
               label = "Blue" ;
            }
            : text {
               label = "Magenta" ;
            }
            : text {
               label = "White" ;
            }
            : text {
               label = "Grey" ;
            }
            : text {
               label = "Lt.Grey" ;
            }
         }
         : column {
            : text {
               label = "1  " ;
            }
            : text {
               label = "2  " ;
            }
            : text {
               label = "1  " ;
            }
            : text {
               label = "3  " ;
            }
            : text {
               label = "0  " ;
            }
            : text {
               label = "2  " ;
            }
            : text {
               label = "5  " ;
            }
            : text {
               label = "0  " ;
            }
            : text {
               label = "7  " ;
            }
         }
         : column {
            : text {
               label = "0.25" ;
            }
            : text {
               label = "0.35" ;
            }
            : text {
               label = "0.25" ;
            }
            : text {
               label = "0.50" ;
            }
            : text {
               label = "0.10" ;
            }
            : text {
               label = "0.35" ;
            }
            : text {
               label = "0.70" ;
            }
            : text {
               label = "0.10" ;
            }
            : text {
               label = "1.00" ;
            }
            spacer ;
         }
      }
   }
   spacer ;
   : text {
      label = "Information based on the" ;
   }
   :text {
      label = "Tri-Service CADD/GIS Technology Center." ;
   }
   spacer ;
   ok_only ;
}
phase : dialog {
   label = "Phase Selection" ;
   children_alignment = centered ;
   : text {
      key = "phstxt" ;
   }
   spacer ;
   : boxed_column {
      label = "Select:" ;
      : list_box {
         key = "listphase" ;
         list = "1\n2\n3\n4\n5\n6\n7\n8\n9" ;
         allow_accept = true ;
      }
      spacer ;
   }
   spacer ;
   ok_only ;
}

UNTITLED : dialog {
    ok_only;
}
