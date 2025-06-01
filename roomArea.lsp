(defun c:roomArea ( / ent area)
  (setq ent (car (entsel "\nOda sınırını seçin: ")))
  (if ent
    (progn
      (setq area (vla-get-Area (vlax-ename->vla-object ent)))
      (princ (strcat "\nAlan: " (rtos (/ area 1000000.0) 2 2) " m²"))
    )
    (princ "\nNesne seçilmedi.")
  )
  (princ)
)

