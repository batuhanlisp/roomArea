(defun c:ikiSatirM3 ( / pt satir1 satir2 yazi height)
  ;; Nokta al
  (setq pt (getpoint "\nYazı yeri seçin: "))

  ;; İlk satır yazısı
  (setq satir1 (getstring T "\nİlk satırı girin (örnek: Salon): "))

  ;; İkinci satır sadece sayı (örn: 25)
  (setq satir2 (getstring T "\nİkinci satırı girin (örnek: 25): "))
  ;; Otomatik olarak m² ekle
  (setq satir2 (strcat satir2 " m²"))

  ;; Satırları birleştir
  (setq yazi (strcat satir1 "\\P" satir2))

  ;; Yazı yüksekliği
  (setq height (getreal "\nYükseklik girin (örnek 2.5): "))

  ;; MTEXT oluştur
  (entmakex
    (list
      '(0 . "MTEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbMText")
      (cons 10 pt)
      (cons 40 height)
      (cons 1 yazi)
      (cons 7 "Standard")
      (cons 71 1)
      (cons 72 5)
      (cons 50 0.0)
      (cons 210 (list 0.0 0.0 1.0))
    )
  )
  (princ "\nSalon + m² yazısı oluşturuldu.")
  (princ)
)


