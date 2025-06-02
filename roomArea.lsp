(defun my_area ( / pt obj area room_name text_height text_string)
  ;; Metin yüksekliği istenir
  (setq text_height (getreal "\nEnter text height: "))
  (if (not text_height) (setq text_height 20.0))

  ;; Kullanıcı bir nokta seçene kadar döngüde kalır
  (while (setq pt (getpoint "\nSelect a point inside the room boundary: "))
    ;; boundary oluşturulur
    (command ".boundary" pt "")
    (setq obj (vlax-ename->vla-object (entlast)))

    ;; Alan hesaplanır ve cm² → m² çevrilir
    (setq area (/ (vla-get-area obj) 10000.0))
    (vla-delete obj) ; geçici boundary nesnesi silinir

    ;; Mahal adı istenir
    (setq room_name (getstring T "\nEnter room name (e.g. SALON): "))

    ;; Yazı metni iki satırlı oluşturulur
    (setq text_string (strcat room_name "\n" (rtos area 2 2) " m²"))

    ;; Metin nesnesi oluşturulur (ortalanmış)
    (entmakex
      (list
        (cons 0 "TEXT")
        (cons 10 pt)             ; konum
        (cons 40 text_height)    ; yükseklik
        (cons 1 text_string)     ; metin içeriği
        (cons 7 "Standard")      ; stil
        (cons 72 1)              ; yatay hizalama = merkez
        (cons 73 1)              ; dikey hizalama = merkez
        (cons 11 pt)             ; hizalama noktası
      )
    )
  )
  (princ)
)

(defun c:room_area ()
  (my_area)
  (princ)
)


