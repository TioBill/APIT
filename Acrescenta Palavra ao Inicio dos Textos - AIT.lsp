(defun c:ait ( / *ERROR*)
  
  (defun *ERROR* (msg)
    (alert msg)
  )
  
  (vl-load-com)
  (setvar 'cmdecho 0)
  (princ "\nAcrescenta palavra ao inicio dos textos. AIT")
  
  (if (setq inicio (getstring t "\nDigite o texto a acrescentar ao inicio das palavras: "))
    (if (setq selecao_textos (ssget '((0 . "*TEXT"))))
      (repeat (setq quantidade_textos (sslength selecao_textos))
        (setq entidade (ssname selecao_textos (setq quantidade_textos (1- quantidade_textos))))
        (setq vlaobj (vlax-ename->vla-object entidade))
        
        (vla-put-textstring vlaobj (strcat inicio (vla-get-textstring vlaobj)))
      )
    )
  )
  (princ)
)

(PRINC "\nDigite \"AIT\" para iniciar.")
