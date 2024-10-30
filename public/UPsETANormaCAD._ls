					; UPSNormaCAD v1.1 - 2005
					; Programa de apoio à implantação da Norma NP ISO 13567
					; Uso só para o AutoCAD
					; Associação Diogo dde Azambuja - www.ada-net.org
					; @2005 - antunes@ada-net.org

(defun C:UPsETANormaCAD ()
;(load "c:\\UPsCAD\\Mod-Paths15.LSP")
;(C:MOD-PATHS "c:\\UPsCAD\\Mod-Paths.dat" (getvar "loginname"))
;(prompt "\Menu UPsCAD carregado...")   
(LOAD     "UPSNorma.LSP")
(LOAD     "UPSLayers.LSP")
(LOAD     "UPSNorma_Paredes.LSP")
(LOAD     "UPSNorma_Pavimento.LSP")
;
;(AUTOLOAD "F-MNUDCL" '("MNUDCL"      ))
;
;(COMMAND "_TOOLBAR" "PONTOS" "_SHOW" "_TOOLBAR" "APLICATIVOS" "_SHOW")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(prompt "\nCopyright \251 UP'SNormaCAD v1.1 Version 2005 - Utilitario UPsNormaCAD carregado.")
(PRINC)
)
;about box
(defun C:UPSNABOUT ()
  (setq dcl_id (load_dialog "c:/UPSETANormaCAD/UPSNabout.dcl"))	;o ficheiro é carregado
  (if(not(new_dialog"UPSNabout"dcl_id))	;verifica-se se existe o ficheiro
    (exit)
    )
  (start_dialog)
  (unload_dialog dcl_id)
)