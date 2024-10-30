					; UPSLayerCAD v2 - 2006
					; Programa de apoio à implantação da Norma NP ISO 13567
					; Uso só para o AutoCAD
					; Associação Diogo dde Azambuja - www.ada-net.org
					; @2005 - antunes@ada-net.org

(defun C:UPsETALayerCAD ()
;(load "c:\\UPsCAD\\Mod-Paths15.LSP")
;(C:MOD-PATHS "c:\\UPsCAD\\Mod-Paths.dat" (getvar "loginname"))
;(prompt "\Menu UPsCAD carregado...")   
(LOAD     "UPSLayer.LSP")
;(LOAD     "UPSLayers.LSP")
(LOAD     "UPSLayer_Paredes.LSP")
(LOAD     "UPSLayer_Pavimento.LSP")
(LSN)
;
;(AUTOLOAD "F-MNUDCL" '("MNUDCL"      ))
;
;(COMMAND "_TOOLBAR" "PONTOS" "_SHOW" "_TOOLBAR" "APLICATIVOS" "_SHOW")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(prompt "\nCopyright \251 UP'SLayerCAD v2 Version 2006 - Utilitario UPsLayerCAD carregado.")
(PRINC)
)
;about box
(defun C:UPSLABOUT ()
  (setq dcl_id (load_dialog "c:/UPSETALayerCAD/UPSLabout.dcl"))	;o ficheiro é carregado
  (if(not(new_dialog"UPSLabout"dcl_id))	;verifica-se se existe o ficheiro
    (exit)
    )
  (start_dialog)
  (unload_dialog dcl_id)
)
;-------------------------------------------------------------------------------------
;	Commands:
;		SN - sets object snap to: endpoint, midpoint, intersection and perpendicular
;-------------------------------------------------------------------------------------
(defun LSN ()
	(command "-osnap")
	(command "end,mid,int,nod,per")
	(princ "\nSnaps set to: Endpoint, Midpoint, Intersection, Node and Perpendicular.")
	(princ)
)

;********************************************************************************************
;| UPSLayers.lsp é uma copilação de 32 rotinas

	v 2006 - by UP'SLayerCAD
------------------------------------------------------------------------
 Adaptado por Jorge Antunes
    E-mail:                  netcad2001@hotmail.com
    Web Site:                http://www.netcad.pt.vu
------------------------------------------------------------------------

Comando		Descrição
--------	-----------
NML		- Seleccionar as entidades a mudar a layer
NLC		- Passar a layer corrente
NMLC		- Mudar as entidaes seleccionadas para a layer corrente
CTL		- Copy typed layer
CPL		- Copy pick layer
CPC		- Copy to current layer
MNL		- Make new layer
OSC		- Offset change to current layer
OSL		- Offset change to typed layer
PFL		- Pick freeze layer
PFA		- Pick freeze *
MPF		- Multiple pick freeze layer
PFX		- Pick freeze xref/block layer
Macro		- Layer on *
POL		- Pick off layer
POF		- Pick off and freeze layer
Macro		- Thaw and turn on all layers
NTL		- Trancar layer
NDL		- Destrancar layer
Macro		- Layer thaw *
PBL		- Pick block entity layer change
NIL		- Identificar a layer da entidade seleccionada
MLF		- Enhanced multiple layer freeze
NXL		- Explode entidades para a layer
PFM		- Viewport Pick Freeze
PFXM		- Pick Freeeze Xref in an MVIEW
PRO 		- sets current layer, linetype and colour to selected object's properties
PRR 		- resets linetype and colour to "ByLayer"
LTP 		- sets current layer and linetype to selected object's linetype
COL 		- sets current layer and colour to selected object's colour

|;
; Passar a layer corrente
(defun c:NLC (/ a2 b2 L1 L2)
   (graphscr)
   (setvar "cmdecho" 0)
   (prompt "\nSeleccionar a entidade com a layer que quer tornar corrente...")
   (setq a2 (entsel))
   (setq b2 (entget (car a2)))
   (setq L1 (assoc 8 b2))
   (setq LNAME (cdr L1))
   (command "layer" "s" LNAME "")
   (alert (strcat "\nA layer corrente é agora " LNAME "."))
   (if TCSVER (LMATCH))
   (setvar "cmdecho" 1)
   (princ)
)
;
; Seleccionar as entidades a mudar a layer.
(defun c:NML (/ a1 a2 n index b1 b2 d1 d2 d3)
   (graphscr)
   (prompt "\nSeleccionar as entidades a mudar... ")
   (setq a1 (ssget))
   (prompt "\nIndicar a entidade com a layer a copiar... ")
   (setq a2 (entsel))
   (setq n (sslength a1))
   (setq index 0)
   (setq b2 (entget (car a2)))
   (setq d2 (assoc 8 b2))
   (repeat n
      (setq b1 (entget (ssname a1 index)))
      (setq d1 (assoc 8 b1))
      (setq b3 (subst d2 d1 b1))
      (entmod b3)
      (setq index (+ index 1)))
   (alert (strcat "\nA entidade foi mudada para a layer" (cdr d2) "."))
   (princ)
)
;
; Copy to layer by typing in layer name.
(defun C:CTL ()
   (prompt "\nSelect the entities you want to copy...  ")
   (setq ss (ssget))
   (setq LNAME (getstring "\nEnter destination layer name...  "))
   (if (= nil (tblsearch "LAYER" LNAME));layer will be created if not exist
     (command "layer" "n" LNAME "")
   )
   (command "copy" ss "" "@" "@")
   (command "chprop" ss "" "la" LNAME "")
   (princ)
)
;
; Copy to layer by picking.
(defun C:CPL ()
   (prompt "\nSelect the entities you want to copy...  ")
   (setq ss (ssget))
   (prompt "\nSelect entity on desired layer: ")
   (setq LNAME (cdr (assoc 8 (entget (car (entsel))))))
   (command "copy" ss "" "@" "@")
   (command "chprop" ss "" "la" LNAME "")
   (prompt (strcat "\nEntities copied to layer  " LNAME ))
   (princ)
)
;
; Pick freeze layer.
(defun C:PFL ()
   (prompt "\nPick entity on the layer you want to freeze...  ")
   (setq LNAME (cdr (assoc 8 (entget (car (entsel))))))
   (command "layer" "f" LNAME "")
   (if (/= LNAME (getvar "clayer"))
      (princ (strcat "\nLayer  " LNAME "  was FROZEN."))
   )
   (princ)
)
;
;
; Pick freeze "*".
(defun c:PFA (/ a2 b2 L1 L2)
   (graphscr)
   (prompt "\nSelect entity on layer you want to isolate...")
   (setq a2 (entsel))
   (setq b2 (entget (car a2)))
   (setq L1 (assoc 8 b2))
   (setq LNAME (cdr L1))
   (command "layer" "s" LNAME "")
   (command "layer" "f" "*" "")
   (prompt (strcat "\nCurrent Layer is set to " LNAME "."))
   (princ)
)
;
; Pick off layer.
(defun C:POL ()
   (prompt "\nPick entity on the layer you want to turn off...  ")
   (setq LNAME (cdr (assoc 8 (entget (car (entsel))))))
   (command "layer" "off" LNAME "")
   (if (= LNAME (getvar "clayer"))
      (prompt "\nWARNING: The Current Layer was turned OFF!")
      (prompt (strcat "\nLayer  " LNAME "  was turned OFF."))
   )
   (princ)
)
;
; Pick off and freeze layer.
(defun C:POF ()
   (prompt "\nPick entity on the layer you want to turn off and freeze...  ")
   (setq LNAME (cdr (assoc 8 (entget (car (entsel))))))
   (command "layer" "off" LNAME "f" LNAME "")
   (if (= LNAME (getvar "clayer"))
      (prompt "\nWARNING: The Current Layer was FROZEN and turned OFF!")
      (prompt (strcat "\nLayer  " LNAME "  was FROZEN and turned OFF."))
   )
   (princ)
)
;
; Trancar layer.
(defun C:NTL ()
  (while (setq LNAME (entsel "\nSeleccionar entidade com a layer a trancar..."))
    (setq LNAME (entget (car LNAME)))
    (setq LNAME (cdr (assoc 8 LNAME)))
    (command "layer" "lock" LNAME "")
    (if (= LNAME (getvar "clayer"))
      (prompt "\nWARNING: A layer corrente está TRANCADA!")
      (prompt (strcat "\nLayer  " LNAME "  está TRANCADA."))
    )
  )
  (princ)
)
;
; Destrancar layer.
(defun C:NDL ()
  (while (setq LNAME (entsel "\nSeleccionar entidade com a layer a destrancar..."))
    (setq LNAME (entget (car LNAME)))
    (setq LNAME (cdr (assoc 8 LNAME)))
    (command "layer" "unlock" LNAME "")
    (prompt (strcat "\nLayer  " LNAME "  está DESTRANCADA."))
  )
  (princ)
)
;
; Make new layer, set color and linetype, and set it to current.
(defun C:MNL ()
   (setq LNAME (getstring "\nEnter the new layer name...  "))
   (setq col (getstring "\nEnter the color for the new layer <7>...  "))
   (setq lyt (getstring "\nEnter the linetype for the new layer <CONTINUOUS>...  "))
         (if (= col "")
            (command "layer" "m" LNAME "c" col "lt" lyt "" "")
            (command "layer" "m" LNAME "c" col "" "lt" lyt "" "")
         )
   (princ)
)
;
; Identificar a layer da entidade seleccionada.
(defun C:NIL ()
   (prompt "\nSeleccionar a entidade com a layer a identificar...  ")
   (setq LNAME (cdr (assoc 8 (entget (car (entsel))))))
   (alert (strcat "\nEsta entidade está na layer " LNAME))
   (princ)
)
;
; Multiple pick freeze layer.
(defun C:MPF (/ SS EN ED LA)
   (Setvar "CMDECHO" 0)
   (command "._undo" "be")
   (Princ "Pick multiple layers to freeze...")
   (Setq SS (SsGet))
   (While (> (SsLength SS) 0)
         (Setq
            EN (SsName SS 0)
            ED (EntGet EN)
            LA (CDR (Assoc 8 ED))
         )
         (If (/= LA (GetVar "CLAYER"))
               (Command ".LAYER" "FREEZE" LA "")
               (Prompt "\nCan not freeze current layer!")
         )
         (SsDel EN SS)
   )
   (command "._undo" "e")
   (setvar "CMDECHO" 1)
   (princ)
)
;
; Pick block entity layer change.
; This program changes any entity, even one within a block insert, to new layer.
; Caution: redefines block and all its inserts. Do not use on xrefs.
; Won't work on polylines unless inside blocks.
; Quick and dirty, no error control. Will create new layer if nonexistent.
(defun C:PBL ( / nent edata)
  (setq nent (nentsel "\nPick entity within block to change layer of... ")
                                                    ;Get nentsel list
        edata (entget (car nent))                   ;Get entity data
  )
  (entmod                                           ;Modify block definition
    (subst (cons 8 (getstring "\nNew layer name for entity... "))
           (assoc 8 edata) edata)
  )
  (if (setq nent (car (reverse (cadddr nent)))) (entupd nent)) ;Regenerate block
  (princ)
)
;
; Change to current layer.
;
(defun c:NMLC (/ cmd ss nlay count tnum entlst modent)
 (setq cmd (getvar "cmdecho"))
 (setvar "cmdecho" 0)
 (prompt "Seleccionar todas as entidades a mudar para a layer corrente: ")
 (setq ss (ssget))
 (if ss
  (progn
   (setq nlay (getvar "clayer")
         count 0
         tnum (sslength ss))
   (while (< count tnum)
    (setq entlst (entget (ssname ss count))
          modent (subst (cons 8 nlay) (assoc 8 entlst) entlst))
    (entmod modent)
    (setq count (1+ count))
   )
   (alert (strcat "\n" (itoa tnum) (if (= tnum 1) " entity" " entidades") 
                   " mudadas para a layer " nlay "."))
  )
  (alert "\nNo entities selected to change!")
 )
 (setvar "cmdecho" cmd)
 (princ)
)
;
; Copy to current layer.
(defun C:CPC (/ LNAME)
   (prompt "\nSelect the entities you want to copy...  ")
   (setq ss (ssget))
   (setq LNAME (getvar "CLAYER"))
   (command "copy" ss "" "@" "@")
   (command "chprop" ss "" "la" LNAME "")
   (prompt (strcat "\nEntities copied to layer  " LNAME ))
   (princ)
)
;
;Offset change layer
;
(defun C:OSL (/ default dist obj pt)
   (setvar "cmdecho" 0)
   (prompt "\nOffset then change layer..." )
   (setq current (getvar "CLAYER"))
      (if (< (getvar "offsetdist") 0)
      (setvar "offsetdist" 1.0)
   )
   (setq default (getvar "offsetdist"))
   (prompt "\nOffset distance: <")
   (princ default) (prompt "> ")
   (setq dist (getdist))
      (if (= dist nil)
         (setq dist default)
      )
      (while (= obj nil)
         (setq obj (entsel "\nSelect object to offset: "))
      )
      (setq pt (getpoint "\nSide to offset? "))
         (if (/= new2 nil)
            (progn
               (prompt "\nLayer to change to: <")
               (princ new2)
               (setq new3 new2)
               (prompt "> ")
               (setq new2 (getstring))
            )
         )
         (if (= new2 "")
            (setq new2 new3)
         )
            (if (= new2 nil)
            (progn
               (setq new1 current)
               (prompt "\nLayer to change to: <")
               (princ new1)
               (prompt "> ")
               (setq new2 (getstring))
            )
         )
         (if (= new2 "")
            (setq new2 new1)
         )
      (setq high (getvar "highlight"))
   (setvar "highlight" 1)
   (command "offset" dist obj pt "")
   (command "change" "last" "" "P" "la" new2 "")
   (setvar "highlight" high)
   (princ)
)
;
;Pick freeze XREF layer
;
(defun c:PFX (/ LAY PIK STR )
   (while (setq pik (nentsel "\nSelect an item on XREF or BLOCK Layer to Freeze: "))
   (setq lay (assoc 8 (entget (car pik))))
   (setq str (cdr lay))
    (if (/= STR "0")
      (command "layer" "F" STR "" "")
      (princ "\nLayer ZERO picked, not Frozen")
    )
   (prompt (strcat "\nLayer  " str "  was FROZEN."))
)
(princ)
)

;
;Pick freeze XREF layer in an MVIEW
;
(defun c:PFXM (/ LAY PIK STR )
   (while (setq pik (nentsel "\nSelect an item on XREF or BLOCK Layer to Freeze: "))
   (setq lay (assoc 8 (entget (car pik))))
   (setq str (cdr lay))
    (if (/= STR "0")
      (command "vplayer" "F" STR "" "")
      (princ "\nLayer ZERO picked, not Frozen")
    )
   (prompt (strcat "\nLayer  " str "  was FROZEN."))
)
(princ)
)

;|
  (c) 1999
  Bob Abernethy, dba/CADesigner - http://www.cadesigner.com
                and
  Jeff Tippit, Tippit CADD Services - http://www.spaug.org
|;

(defun ERR (S)
  (if (/= S "Function cancelled")
    (if (= S "quit / exit abort")
      (princ)
      (alert (strcat "           >> Error << \n"))
    )
  )
  (setq ANS# nil)
  (setvar "cmdecho" 1)
  (setq *ERROR* OLDERR
        OLDERR  NIL
  )
  (princ)
)

(defun MPF (/ SS EN ED LA)
  (princ "\nPick multiple layers to freeze...")
  (setq SS (ssget))
  (while (> (sslength SS) 0)
    (setq
      EN (ssname SS 0)
      ED (entget EN)
      LA (cdr (assoc 8 ED))
    )
    (command ".LAYER" "FREEZE" LA "")
    (ssdel EN SS)
  )
  (princ)
)

(defun PSL (/ A2 B2 L1 L2)
  (graphscr)
  (prompt
    "\nSelect entity on layer you want to set current..."
  )
  (setq A2 (entsel))
  (setq B2 (entget (car A2)))
  (setq L1 (assoc 8 B2))
  (setq LNAME# (cdr L1))
  (setvar "clayer" LNAME#)
  (prompt (strcat "\nCurrent layer is now set to " LNAME# "."))
  (princ)
  (MPF)
)

(defun C:MLF (/ ANS#)
  (setq OLDERR  *ERROR*
        *ERROR* ERR
  )
  (setvar "cmdecho" 0)
  (command "._undo" "be")
  (setq DCL_ID (load_dialog "UPSLayer_S_N.dcl"))
  (if (not (new_dialog "UPSLayer_S_N" DCL_ID))
    (exit)
  )
  (action_tile "_Não" "(setq ans# 2)")
  (action_tile "accept" "(setq ans# 1)")
  (action_tile "cancel" "(exit)")
  (start_dialog)
  (unload_dialog DCL_ID)
  (cond
    ((= ANS# 1) (PSL))
    ((= ANS# 2) (MPF))
  )
  (setq *ERROR* OLDERR
        OLDERR  NIL
  )
  (setq ANS# nil)
  (command "._undo" "e")
  (setvar "cmdecho" 1)
  (princ)
)
;-------------------------- INTERNAL ERROR HANDLER ---------------------------|
; Explode entidades para a layer
(defun lexerr (s)                     ; If an error (such as CTRL-C) occurs
                                      ; while this command is active...
  (if (/= s "Função cancelada")
    (princ (strcat "\nErro: " s))
  )
  (setvar "highlight" ohl)            ; restore old highlight value
  (setvar "cmdecho" oce)              ; restore old cmdecho value
  (setq *error* olderr)               ; restore old *error* handler
  (princ)
)
;------------------------------ COMMON FUNCTION ------------------------------|

(defun getval (n e) (cdr (assoc n e)))

;--------------------------- GET ENTITY TO EXPLODE ---------------------------|

(defun getent (t1 / no_ent e0)
(setq no_ent T)
(while no_ent
  (if (setq e0 (entsel "\nSeleccionar bloco de referencia, polyline, dimension, ou mesh: "))
    (if (member (getval 0 (setq e1 (entget (car e0)))) t1)
      (if (equal (getval 0 e1) "INSERT")
        (if (and (equal (getval 41 e1) (getval 42 e1))
                 (equal (getval 42 e1) (getval 43 e1)))
          (setq no_ent nil)
          (princ "\nOs factores de escala X, Y, e Z têm de ser iguais."))
        (setq no_ent nil))
      (princ "\nNão é bloco de referencia, polyline, ou dimension."))
    (princ " Nenhum objecto encontrado."))
))

;-------------------------------- MAIN PROGRAM -------------------------------|

(defun c:NXL (/ oce ohl e0 en e1 s0)
(setq olderr *error* *error* lexerr)
(setq oce (getvar "cmdecho"))         ; save value of cmdecho
(setq ohl (getvar "highlight"))       ; save value of highlight
(setvar "cmdecho" 0)                  ; turn cmdecho off
(setvar "highlight" 0)                ; turn highlight off
(setq e0 (entlast))
(setq en (entnext e0))
(while (not (null en))                ; find the last entity              
  (setq e0 en)
  (setq en (entnext e0))
)
(getent '("INSERT" "DIMENSION" "POLYLINE" "HATCH"))
(command "explode" (getval -1 e1))    ; explode the entity
(setq s0 (ssadd))
(while (entnext e0) (ssadd (setq e0 (entnext e0)) s0))
(command "chprop" s0 ""               ; change entities to the proper layer
         "c"   "bylayer"              ; regardless of their extrusion direction
         "lt"  "bylayer"
         "la"  (getval 8 e1) "")
(princ (strcat "\nEntities exploded onto layer " (getval 8 e1) "."))
(setvar "highlight" ohl)              ; restore old highlight value
(setvar "cmdecho" oce)                ; restore old cmdecho value
(setq *error* olderr)                 ; restore old *error* handler
(princ)
)
;---------------------------------------------------------------------------
;Offset change to current layer
;
(defun C:OSC (/ default dist obj pt)
   (setvar "cmdecho" 0)
   (prompt "\nOffset then change layer..." )
   (setq current (getvar "CLAYER"))
      (if (< (getvar "offsetdist") 0)
      (setvar "offsetdist" 1.0)
   )
   (setq default (getvar "offsetdist"))
   (prompt "\nOffset distance: <")
   (princ default) (prompt "> ")
   (setq dist (getdist))
   (if (= dist nil)
      (setq dist default)
   )
   (while (= done nil)
      (while (= obj nil)
         (setq obj (entsel "\nSelect object to offset: "))
      )
      (setq pt (getpoint "\nSide to offset? "))
      (setq high (getvar "highlight"))
      (setvar "highlight" 1)
      (command "offset" dist obj pt "")
      (command "change" "last" "" "P" "la" current "")
      (setvar "highlight" high)
      (setq obj nil)
   )
   (princ)
)

;| VF.Lsp Sent in to SPAUG by Mike Gilroy 10/22/99

Modified by Jeff Tippit 11/15/99 - Added tilemode check

This routine lets you viewport-freeze layers by popping into any
viewport in paperspace and then selecting an object whose layer you want
frozen in that viewport.

I use it by creating a viewport with all layers thawed and then picking
the stuff I want frozen.

|;
(defun C:PFM (/ e n)
   (if (= 1 (getvar "tilemode"))
      (prompt "\nYou must be within an MVIEW in PAPERSPACE for this command to work!")
      (progn
         (if (or (equal 1 (getvar "cvport")))
            (prompt "\nYou must be within an MVIEW in PAPERSPACE for this command to work!")
            (progn
               (setq e (car (entsel "\nPick an object on the desired layer: ")))
               (if e
                  (progn
                     (setq e (entget e))          ;Get entity data groups
                     (setq n (cdr (assoc 8 e)))   ;Group 8 is layer name
                     (if (= n (getvar "CLAYER"))
                        (prompt "Cannot freeze the current layer!")
                        (command ".VPLAYER" "FREEZE" n "" "")
                     )
                  )
               )
            )
         )
      )
   )
   (princ)
)
(prompt "\nCopyright \251 UP'SLayerCAD v2 Version 2006 - Todas as rotinas carregadas.")
(princ)

;-------------------------------------------------------------------------------------
(defun C:PRO()
	(setq ent(entsel))								
	(setq en(car ent))
	(setq enlist(entget en))				;list entity attributes
	(setq layer_name(assoc '8 enlist))		;access layer name attribute
	(setq linetype_name(assoc '6 enlist))	;access linetype attribute
	(setq colour_name(assoc '62 enlist))	;access colour attribute

 ;----- start of undo group -----
	(command "undo")
	(command "BE")
	
 ;----- set layer -----
	(setq layer1(cdr layer_name))
	(command "-layer")
	(command "S")
	(command layer1)
	(command "")
	(princ "\nLayer set to: ")
	(princ layer1)
	
 ;----- set linetype -----
	(if(= linetype_name nil)
		(progn
			(command "-linetype")
			(command "S")
			(command "ByLayer")
			(command "")
			(princ "\nLinetype set to: ByLayer")
		)
		(progn
			(setq linetype1(cdr linetype_name))
			(command "-linetype")
			(command "S")
			(command linetype1)
			(command "")
			(princ "\nLinetype set to: ")
			(princ linetype1)
		)
	)
	
 ;----- set colour -----
	(if(= colour_name nil)
		(progn
			(command "-color")
			(command "ByLayer")
			(princ "\nColour set to: ByLayer")
		)
		(progn
			(setq colour1(cdr colour_name))
			(command "-color")
			(command colour1)
			(princ "\nColour set to: ")
			(princ colour1)
		)
	)

 ;----- end of undo group -----	
	(command "undo")
	(command "E")
	
 ;----- exit quietly -----
	(princ)
)



;-------------------------------------------------------------------------------------
(defun C:LTP()
	(setq ent(entsel))								
	(setq en(car ent))
	(setq enlist(entget en))				;list entity attributes
	(setq layer_name(assoc '8 enlist))		;access layer name attribute
	(setq linetype_name(assoc '6 enlist))	;access linetype attribute
	
 ;----- start of undo group -----
	(command "undo")
	(command "BE")

 ;----- set layer -----
	(setq layer1(cdr layer_name))
	(command "-layer")
	(command "S")
	(command layer1)
	(command "")
	(princ "\nLayer set to: ")
	(princ layer1)

 ;----- set linetype -----
	(if(= linetype_name nil)
		(progn
			(command "-linetype")
			(command "S")
			(command "ByLayer")
			(command "")
			(princ "\nLinetype set to: ByLayer")
		)
		(progn
			(setq linetype1(cdr linetype_name))
			(command "-linetype")
			(command "S")
			(command linetype1)
			(command "")
			(princ "\nLinetype set to: ")
			(princ linetype1)
		)
	)
	
 ;----- end of undo group -----	
	(command "undo")
	(command "E")
	
 ;----- exit quietly -----
	(princ)
)



;-------------------------------------------------------------------------------------
(defun C:COL()
	(setq ent(entsel))								
	(setq en(car ent))
	(setq enlist(entget en))				;list entity attributes
	(setq layer_name(assoc '8 enlist))		;access layer name attribute
	(setq colour_name(assoc '62 enlist))	;access colour attribute
	
 ;----- start of undo group -----
	(command "undo")
	(command "BE")

 ;----- set layer -----
	(setq layer1(cdr layer_name))
	(command "-layer")
	(command "S")
	(command layer1)
	(command "")
	(princ "\nLayer set to: ")
	(princ layer1)

 ;----- set colour -----
	(if(= colour_name nil)
		(progn
			(command "-color")
			(command "ByLayer")
			(princ "\nColour set to: ByLayer")
		)
		(progn
			(setq colour1(cdr colour_name))
			(command "-color")
			(command colour1)
			(princ "\nColour set to: ")
			(princ colour1)
		)
	)
 ;----- end of undo group -----	
	(command "undo")
	(command "E")
	
 ;----- exit quietly -----
	(princ)
)



;-------------------------------------------------------------------------------------
(defun C:PRR()
 ;----- start of undo group -----
	(command "undo")
	(command "BE")

 ;----- reset linetype -----
	(command "-linetype")
	(command "S")
	(command "ByLayer")
	(command "")
	(princ "\nLinetype set to: ByLayer")

 ;----- reset colour -----
	(command "-color")
	(command "ByLayer")
	(princ "\nColour set to: ByLayer")
	
 ;----- end of undo group -----	
	(command "undo")
	(command "E")
	
 ;----- exit quietly -----
	(princ)
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
;;;;;;;;; Set Current Layer to TEXTSTYLE name 
(defun txstla ()(SETVAR "CMDECHO" 0) 
(setq txst (strcat "txt" (rtos (getvar "dimscale") 2 0))) ;;;;;Create the name 
;;;;;;;Make the style 
(if (/= (tblsearch "style" txst) nil) 
(command "textstyle" txst) 
(command ".style" txst "romans" (* (getvar "dimscale") 0.1) "0.7" "" "" "" "") 
) 
;;;;;;;Make the layer 
(if (= (tblsearch "layer" txst) nil) 
(command "_layer" "m" txst "") 
(command "_layer" "t" txst "s" txst "") 
) 
) 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
;;;;;;;;; Set Current Layer to DIMSTYLE name 
(defun dmstla ()(SETVAR "CMDECHO" 0) 
(setq dmst (strcat "dim" (rtos (getvar "dimscale") 2 0))) ;;;;;Create the name 
;;;;;;;Make the layer 
(if (= (tblsearch "layer" dmst) nil) 
(command "_layer" "m" dmst "") 
(command "_layer" "t" dmst "s" dmst "") 
) 
) 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
;;;;;;;;; Set Current DIMSCALE and DIMSTYLE name 
(defun C:DSC () 
(command ".undo" "begin") 
(setq dscale (getvar "dimscale")) 
(if (setq ndscale (getdist (strcat "Enter New DIMSCALE <" (rtos dscale) ">: "))) 
(setq dscale ndscale)) 
(command ".dim1" "dimscale" dscale) 
(txstla)(dmstla) ;;;;;Make the layers and style names 
(command "dimtxsty" txst) ;;;;;Set DIM text to text style 
(command "dim1" "save" dmst "y") ;;;;;Save the DIMSTYLE 
(command ".undo" "end") 
(princ) 
)
