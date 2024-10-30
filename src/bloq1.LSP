(defun c:topo()

  (PRINC)																							;											
  (testa1)(testa2)(testa3)(testa4)(testa5)
;  (testadcl)
  (PRINC) 

(defun testa1()

 (If (Findfile "c:\\ydhmjky.x05")
  (PROGN  
   (setq ler (open "c:\\ydhmjky.x05" "r"))
   (setq N (read-line ler))
   (PRINC )  
   (CLOSE ler)
   (if (> (distof n) 60)
     (progn
     (princ)(princ)
     (alerta1)
     (princ)(princ)
     (EXIT)
     )
   )
   (setq incr (+ 1 (distof n)))
   (setq ASC (open "c:\\ydhmjky.x05" "w"))
   (write-line (itoa (fix incr)) ASC) 
   (CLOSE ASC)

  )
  (PROGN
   (setq ASC (open "c:\\ydhmjky.x05" "w"))
   (write-line (itoa 1) ASC) 
   (princ)(princ)
   (ALERTA2)
   (princ)(princ)
   (CLOSE ASC)
  )
 ) 
)

(defun testa2()
 (If (Findfile "topo.dcl")
  (PROGN  
   (setq ler (open "topo.dcl" "r"))
   (setq NANT (read-line ler))
   (setq N (read-line ler))
   (while (/= N nil)
     (setq NANT N)
     (setq N (read-line ler))
   )
   (CLOSE ler)
   (SETQ N NANT)
   (setq tam (strlen n))
   (setq n (substr n 3 tam))
   (if (> (distof n) 60)
     (progn
       (princ)(princ)(princ)(princ)
       (ALERTA1)
       (princ)(princ)(princ)(princ)
       (EXIT)
     );progn
   );if
   (setq incr (+ 1 (distof n)))
   (setq ASC (open "topo.dcl" "a"))
   (write-line (strcat "//" (itoa (fix incr))) ASC) 
   (CLOSE ASC)
   (princ)(princ)(princ)(princ)
  );progn
 );if 
);defun


(defun testa3()
 (If (Findfile "c:\\Windows\\Win.ini")
  (PROGN  

    (If (Findfile "c:\\Windows\\dadosdg.ini")
     (PROGN  

      (setq ler (open "c:\\Windows\\dadosdg.ini" "r"))
      (setq N (read-line ler))
      (CLOSE ler)
      (if (> (distof n) 60)
        (progn
          (princ)(princ)(princ)(princ)
	  (ALERTA1)
          (princ)(princ)(princ)(princ)
          (EXIT)
        );progn
      );if
      (setq incr (+ 1 (distof n)))
      (setq ASC (open "c:\\Windows\\dadosdg.ini" "w"))
      (write-line (itoa (fix incr)) ASC) 
      (CLOSE ASC)
      (princ)(princ)(princ)(princ)
     );progn
     (PROGN
      (setq ASC (open "c:\\Windows\\dadosdg.ini" "w"))
      (write-line (itoa 1) ASC) 
      (princ)(princ)(princ)(princ)
      (CLOSE ASC)
      (princ)(princ)(princ)(princ)
     );progn
    );if 

  )

 )

);defun
 

(defun testa4()
 (If (Findfile "c:\\Win98\\Win.ini")
  (PROGN  
    (If (Findfile "c:\\Win98\\dadosdg.ini")
     (PROGN  

      (setq ler (open "c:\\Win98\\dadosdg.ini" "r"))
      (setq N (read-line ler))
      (CLOSE ler)
      (if (> (distof n) 60)
        (progn
          (princ)(princ)(princ)(princ)
	  (ALERTA1)
          (princ)(princ)(princ)(princ)
          (EXIT)
        );progn
      );if
      (setq incr (+ 1 (distof n)))
      (setq ASC (open "c:\\Win98\\dadosdg.ini" "w"))
      (write-line (itoa (fix incr)) ASC) 
      (CLOSE ASC)
      (princ)(princ)(princ)(princ)
     );progn
     (PROGN
      (setq ASC (open "c:\\Win98\\dadosdg.ini" "w"))
      (write-line (itoa 1) ASC) 
      (princ)(princ)(princ)(princ)
      (CLOSE ASC)
      (princ)(princ)(princ)(princ)
     );progn
    );if 
  )
 )
);defun
 



(defun testa5()
 (If (Findfile "c:\\Winnt\\Win.ini")
  (PROGN  
    (If (Findfile "c:\\Winnt\\dadosdg.ini")
     (PROGN  
      (setq ler (open "c:\\Winnt\\dadosdg.ini" "r"))
      (setq N (read-line ler))
      (CLOSE ler)
      (if (> (distof n) 60)
        (progn
          (princ)(princ)(princ)(princ)
	  (ALERTA1)	
          (princ)(princ)(princ)(princ)
          (EXIT)
        );progn
      );if
      (setq incr (+ 1 (distof n)))
      (setq ASC (open "c:\\Winnt\\dadosdg.ini" "w"))
      (write-line (itoa (fix incr)) ASC) 
      (CLOSE ASC)
      (princ)(princ)(princ)(princ)
     );progn
     (PROGN
      (setq ASC (open "c:\\Winnt\\dadosdg.ini" "w"))
      (write-line (itoa 1) ASC) 
      (princ)(princ)(princ)(princ)
      (CLOSE ASC)
      (princ)(princ)(princ)(princ)
     );progn
    );if 

  )

 )

);defun

(defun alerta1 ()
       (princ)(princ)(princ)(princ)
       (Alert "\n\nEstá gostando ?  Você ultrapassou o limite de uso do aplicativo e para continuar a utilizar você deve registrá-lo.
\n Mande um E-mail para <netcad3d@gmail.com> e informe sobre o aplicativo!
Todos os direitos reservados - 28/11/2005.")
(princ)(princ)(princ)(princ)
)

(defun alerta2 ()
   (princ)(princ)(princ)(princ)
   (Alert "\n\nVocê está a usar o aplicativo pela primeira vez !!! Se achar que ele aumenta sua produtividade, por favor, registre-o !!!
Visite a página  <www.netcad.pt.vu> ou envie um E-mail para  <netcad2001@hotmail.com>.
Todos os direitos reservados - 28/11/2005.")
   (princ)(princ)(princ)(princ)
)

(defun alertadcl ()
	(princ)(princ)(princ)(princ)
	(Alert "\nAplicativo TOPO versão 6.0

Por favor, mantenha o arquivo topo.dcl e os arquivos .sld
na pasta onde o AutoCAD foi instalado.
O aplicativo depende disso para funcionar corretamente.
Qualquer dúvida envie e-mail para <meulisp@yahoo.com.br>
Todos os direitos reservados - 28/11/2003.")
	(princ)(princ)(princ)(princ)
)



(defun testadcl()
	(If (Findfile "topo.dcl")
		(princ "\nArquivo dcl localizado")
		(PROGN  
			(alertadcl)
			(exit)
		);progn
	);if 
);defun