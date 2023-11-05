#Island
RBase = rectangle(250, 180, "solid", "red")
Wsqu = square(80, "solid", "white")
Wrec = rectangle(150, 80, "solid", "white")
Bsqu = square(70, "solid", "blue")
Brec = rectangle(140, 70, "solid", "blue")

Island = overlay-align("left", "top", (Bsqu), overlay-align("left", "bottom", (Bsqu), overlay-align("right", "top", (Brec), overlay-align("right", "bottom", (Brec), overlay-align("left", "top", (Wsqu), overlay-align("left", "bottom", (Wsqu), overlay-align("right", "top", (Wrec), overlay-align("right", "bottom", (Wrec), (RBase)))))))))

#Danmark
Wbase = rectangle(370, 280, "solid", "white")
Rrec = rectangle(210, 120, "solid", "red")
Rsqu = square(120, "solid", "red")

Danmark = overlay-align("left", "top", (Rsqu), overlay-align("left", "bottom", (Rsqu), overlay-align("right", "top", (Rrec), overlay-align("right", "bottom", (Rrec), (Wbase)))))

#Norge
Bbase = rectangle(220, 160, "solid", "blue")
White-squ = square(70, "solid", "white")
White-rec = rectangle(130, 70, "solid", "white")
Red-squ = square(60, "solid", "red")
Red-rec = rectangle(120, 60, "solid", "red")

Norge = overlay-align("left", "top", (Red-squ), overlay-align("left", "bottom", (Red-squ), overlay-align("right", "top", (Red-rec), overlay-align("right", "bottom", (Red-rec), overlay-align("left", "top", (White-squ), overlay-align("left", "bottom", (White-squ), overlay-align("right", "top", (White-rec), overlay-align("right", "bottom", (White-rec), (Bbase)))))))))

#Færøyene
Red-base = rectangle(220, 160, "solid", "red")
Blue-squ = square(70, "solid", "blue")
Blue-rec = rectangle(130, 70, "solid", "blue")
White-square = square(60, "solid", "white")
White-rectangle = rectangle(120, 60, "solid", "white")

Faroe = overlay-align("left", "top", (White-square), overlay-align("left", "bottom", (White-square), overlay-align("right", "top", (White-rectangle), overlay-align("right", "bottom", (White-rectangle), overlay-align("left", "top", (Blue-squ), overlay-align("left", "bottom", (Blue-squ), overlay-align("right", "top", (Blue-rec), overlay-align("right", "bottom", (Blue-rec), (Red-base)))))))))

#Finland
F-Bbase = rectangle(360, 220, "solid", "blue")
F-Wrec1 = rectangle(100, 80, "solid", "white")
F-Wrec2 = rectangle(200, 80, "solid", "white")

Finland = overlay-align("left", "top", (F-Wrec1), overlay-align("left", "bottom", (F-Wrec1), overlay-align("right", "top", (F-Wrec2), overlay-align("right", "bottom", (F-Wrec2), (F-Bbase)))))

#Sverige
Ybase = rectangle(220, 160, "solid", "yellow")
S-Brec1 = rectangle(68.75, 64, "solid", "blue")
S-Brec2 = rectangle(123.75, 64, "solid", "blue")

Sverige = overlay-align("left", "top", (S-Brec1), overlay-align("left", "bottom", (S-Brec1), overlay-align("right", "top", (S-Brec2), overlay-align("right", "bottom", (S-Brec2), (Ybase)))))


fun flagg(land):
  if land == "Island":
    Island
  else if land == "Danmark":
    Danmark
  else if land == "Norge":
    Norge
  else if land == "Faroe":
    Faroe
  else if land == "Sverige":
    Sverige
  else if land == "Finland":
    Finland
  end
end

flagg("Sverige")



flagg("Norge")
flagg("Faroe")
flagg("Island")
flagg("Finland")
flagg("Danmark")
