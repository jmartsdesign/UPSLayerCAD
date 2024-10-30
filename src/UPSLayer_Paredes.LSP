					// UPSLayerCAD v2 - 2006
					// Programa de apoio à implantação da Norma NP ISO 13567
					// Uso só para o AutoCAD - Uso interno da ADA - UP'SETA
					// Associação Diogo dde Azambuja - www.ada-net.org
					// @2005 - antunes@ada-net.org

(defun C:UPSLPAR ()			;define function - Desenha Layer paredes
  
     ;save system settings
     (setq oldblip (getvar "BLIPMODE")
             oldecho (getvar "CMDECHO")
             oldsnap (getvar "OSMODE")
     );setq

     ;set system variables
     (setvar "BLIPMODE" 0)
     (setvar "CMDECHO" 0)
     (setvar "OSMODE" 0)
;;
  (setq loc1 "C:\\UPSETALayerCAD\\")
  (setq dcl_id (load_dialog "UPSLayer_CX.dcl")) ;load dialog
  (if (not (new_dialog "UPSLPar" dcl_id) ;test for dialog
      )					;not
    (exit)				;exit if no dialog
  )
  (setq ESP1 "A-")
  (setq la (getvar "clayer"))
					;store default hole type
					;-------- 2
  (setq lst2 (list ""))			;lê os elementos
  (setq of2 (open (strcat loc1 "Elementos_Parde.txt") "r"))
  (while
    (setq lin2 (read-line of2))
     (setq line2 (list lin2))
     (setq lst2 (append lst2 line2))
     (setq lstt2 (cdr lst2))
  )
  (close of2)
  (start_list "pl2")
  (mapcar 'add_list lstt2)
  (end_list)				;fim dos elementos  
					;-------- 3
  (setq lst3 (list ""))			;lê apresentação
  (setq of3 (open (strcat loc1 "Apresentacao.txt") "r"))
  (while
    (setq lin3 (read-line of3))
     (setq line3 (list lin3))
     (setq lst3 (append lst3 line3))
     (setq lstt3 (cdr lst3))
  )
  (close of3)
  (start_list "pl3")
  (mapcar 'add_list lstt3)
  (end_list)				;fim apresentação  
					;-------- 4
  (setq lst4 (list ""))			;lê Estado
  (setq of4 (open (strcat loc1 "Estado.txt") "r"))
  (while
    (setq lin4 (read-line of4))
     (setq line4 (list lin4))
     (setq lst4 (append lst4 line4))
     (setq lstt4 (cdr lst4))
  )
  (close of4)
  (start_list "pl4")
  (mapcar 'add_list lstt4)
  (end_list)				;fim estado
					;-------- 6
  (setq lst6 (list ""))			;lê Fase
  (setq of6 (open (strcat loc1 "Fase.txt") "r"))
  (while
    (setq lin6 (read-line of6))
     (setq line6 (list lin6))
     (setq lst6 (append lst6 line6))
     (setq lstt6 (cdr lst6))
  )
  (close of6)
  (start_list "pl6")
  (mapcar 'add_list lstt6)
  (end_list)				;fim Fase  
					;-------- 7
  (setq lst7 (list ""))			;lê Projecção
  (setq of7 (open (strcat loc1 "Projeccao.txt") "r"))
  (while
    (setq lin7 (read-line of7))
     (setq line7 (list lin7))
     (setq lst7 (append lst7 line7))
     (setq lstt7 (cdr lst7))
  )
  (close of7)
  (start_list "pl7")
  (mapcar 'add_list lstt7)
  (end_list)				;fim projecção 
					;-------- 8
  (setq lst8 (list ""))			;lê Escala
  (setq of8 (open (strcat loc1 "Escala.txt") "r"))
  (while
    (setq lin8 (read-line of8))
     (setq line8 (list lin8))
     (setq lst8 (append lst8 line8))
     (setq lstt8 (cdr lst8))
  )
  (close of8)
  (start_list "pl8")
  (mapcar 'add_list lstt8)
  (end_list)				;fim escala  
					;-------- 9
  (setq lst9 (list ""))			;lê Materiais
  (setq of9 (open (strcat loc1 "Materiais.txt") "r"))
  (while
    (setq lin9 (read-line of9))
     (setq line9 (list lin9))
     (setq lst9 (append lst9 line9))
     (setq lstt9 (cdr lst9))
  )
  (close of9)
  (start_list "pl9")
  (mapcar 'add_list lstt9)
  (end_list)				;fim materias
				;---------------------------------------------------------------
(set_tile "txt1" la)  
				;---------------------------------------------------------------
  (action_tile
    "accept"				;if O.K. pressed
    (strcat				;string 'em together
      "(setq SIZ2 (atof (get_tile \"pl2\")))" ;get list selection
      "(setq SIZ3 (atof (get_tile \"pl3\")))" ;get list selection
      "(setq SIZ4 (atof (get_tile \"pl4\")))" ;get list selection
      "(setq SIZ5 (get_tile \"pl5\"))"	;get list selection
      "(setq SIZ6 (atof (get_tile \"pl6\")))" ;get list selection
      "(setq SIZ7 (atof (get_tile \"pl7\")))" ;get list selection
      "(setq SIZ8 (atof (get_tile \"pl8\")))" ;get list selection
      "(setq SIZ9 (atof (get_tile \"pl9\")))" ;get list selection
      "(setq SIZ10 (get_tile \"pl11\"))" ;apanha a descrição
      "(done_dialog) (setq userclick T))" ;close dialog      
     )					;strcat
  )					;action tile
  (action_tile
    "cancel"				;if cancel button pressed
    "(done_dialog) (setq userclick nil)" ;close dialog
  )					;action_tile
					;----------------
  (start_dialog)			;start dialog
  (unload_dialog dcl_id)		;unload	
  (if userclick				;check O.K. was selected
    (progn				;if it was do the following
;      (setq SIZ1 (nth SIZ1 lstt1))	;get the Day
      (setq SIZ2 (fix SIZ2))		;convert to integer
      (setq SIZ2 (nth SIZ2 lstt2))	;get the Day
      (setq SIZ3 (fix SIZ3))		;convert to integer
      (setq SIZ3 (nth SIZ3 lstt3))	;get the Day
      (setq SIZ4 (fix SIZ4))		;convert to integer
      (setq SIZ4 (nth SIZ4 lstt4))	;get the Day
      (setq SIZ6 (fix SIZ6))		;convert to integer
      (setq SIZ6 (nth SIZ6 lstt6))	;get the Day
      (setq SIZ7 (fix SIZ7))		;convert to integer
      (setq SIZ7 (nth SIZ7 lstt7))	;get the Day
      (setq SIZ8 (fix SIZ8))		;convert to integer
      (setq SIZ8 (nth SIZ8 lstt8))	;get the Day
      (setq SIZ9 (fix SIZ9))		;convert to integer
      (setq SIZ9 (nth SIZ9 lstt9))	;get the Day
					;------------------------------------------------------------------
;      (setq ESP1 (substr SIZ1 1 2))	;divide a grupo ex. A-Arquitectura fica A-
      (setq ESP2 (substr SIZ2 1 6))
      (setq ESP3 (substr SIZ3 1 2))
      (setq ESP4 (substr SIZ4 1 1))
      (setq ESP5 (substr SIZ5 1 4))
      (setq ESP6 (substr SIZ6 1 1))
      (setq ESP7 (substr SIZ7 1 1))
      (setq ESP8 (substr SIZ8 1 1))
      (setq ESP9 (substr SIZ9 1 2))
      (setq ESP10 (substr SIZ2 8))
					;------------------------------------------------------------------
     	  (setq	layESPpar (strcat ESP1   ESP2   ESP3   ESP4   ESP5
			       ESP6   ESP7   ESP8   ESP9   ESP10
			      )
	  )
	  (command "-layer" "m" layESPpar "") ;Junta as layers
    )					;-------------
  )					;progn
  ;reset system variables
  (setvar "BLIPMODE" oldblip)
  (setvar "CMDECHO" oldecho)
  (setvar "OSMODE" oldsnap)
  (princ)
)
;---------------------------------------------------------------
;;1----------------Linha Parede
(defun c:layerPAR  (/ a2 b2 L1 L2)
   (graphscr)
   (setvar "cmdecho" 0)
   (prompt "\nSelecione um Objeto do Layer desejado:")
   (setq a2 (entsel))
   (setq b2 (entget (car a2)))
   (setq L1 (assoc 8 b2))
   (setq layESPpar (cdr L1))
   (command "layer" "s" layESPpar "")
   (if TCSVER (LMATCH))
   (setvar "cmdecho" 1)
   (princ)
)
;;------------------------------------------------
;;2----------------Linha Parede
(defun C:linePAR ()
  (command "-layer" "s" layESPpar "") ;Junta as layers
)
;;------------------------------------------------
;;3---------------Isolar o Layer Parede
(defun C:layisoPAR ()		  
   (command "layer" "s" layESPpar "")
   (command "layer" "off" "*" "" "")
)
;;------------------------------------------------
;;4---------------Trocar para o Layer Parede
(defun C:matchpropPAR ()		      
   (command "matchprop" layESPpar "")
)
;;------------------------------------------------
;;5---------------Ligar layer Parede
(defun C:layonPAR ()		  
   (command "layer" "s" layESPpar "")
   (command "layer" "on" "*" "" "")
)
;;------------------------------------------------