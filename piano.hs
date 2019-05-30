import Graphics.UI.Gtk
import Euterpea
import Algebra.FloatingPoint

main :: IO ()
main = do
  initGUI
  window  <- windowNew
  set window [windowTitle := "Piano", windowResizable := False, containerBorderWidth := 10, windowDefaultWidth := 1200]
  
  main <- vBoxNew False 2
  containerAdd window main
  
  --caja de controles
  cntrbox <- vBoxNew False 0
  boxPackStart main cntrbox PackGrow 0
  
  f1box <- hBoxNew False 0
  boxPackStart cntrbox f1box PackGrow 0
  --volumen
  volbox <- hBoxNew False 10
  boxPackStart f1box volbox PackGrow 0
  labelvol <- labelNew (Just "Volumen:")
  boxPackStart volbox labelvol PackNatural 0
  adjvol <- adjustmentNew 100.0 0.0 101.0 0.1 1.0 1.0
  vol <- hScaleNew adjvol
  boxPackStart volbox vol PackGrow 0
  scaleSetDigits vol 0
  onValueChanged adjvol $ do
                            volume 
  
  --reproducir melodia
  bttnplay <- buttonNewWithLabel "Play"
  boxPackStart f1box bttnplay PackNatural 0
  --onClicked bttnplay ()
  
  --duracion
  durbox <- hBoxNew False 10
  boxPackStart f1box durbox PackGrow 0
  adjdur <- adjustmentNew 3.0 1.0 7.0 1.0 1.0 1.0
  dur <- hScaleNew adjdur
  boxPackEnd durbox dur PackGrow 0
  scaleSetDigits dur 0
  labeldur <- labelNew (Just "Duracion:")
  boxPackEnd durbox labeldur PackNatural 0
   --funcion cambiar duracion
  --termina controles
  
  sep1 <- hSeparatorNew
  boxPackStart main sep1 PackGrow 0
  
  --caja de teclas
  keystable <- tableNew 2 44 True
  containerAdd main keystable
  widgetSetSizeRequest keystable 1200 200 
  --keys definition
  button1m <- buttonNewWithLabel "C"
  button11m <- buttonNewWithLabel "C#/Db"
  button2m <- buttonNewWithLabel "D"
  button22m <- buttonNewWithLabel "D#/Eb"
  button3m <- buttonNewWithLabel "E"
  button4m <- buttonNewWithLabel "F"
  button44m <- buttonNewWithLabel "F#/G"
  button5m <- buttonNewWithLabel "G"
  button55m <- buttonNewWithLabel "G#/Ab"
  button6m <- buttonNewWithLabel "A"
  button66m <- buttonNewWithLabel "A#/Bb"
  button7m <- buttonNewWithLabel "B"
  --funciones
  onClicked button1m $ do
                        volume <- adjustmentGetValue adjvol
                        (playDev 2 $ addVolume (digits volume) $ c  3 qn)
  onClicked button11m (playDev 2 $ cs 3 qn)
  onClicked button2m  (playDev 2 $ d  3 qn)
  onClicked button22m (playDev 2 $ ds 3 qn)
  onClicked button3m  (playDev 2 $ e  3 qn)
  onClicked button4m  (playDev 2 $ f  3 qn)
  onClicked button44m (playDev 2 $ fs 3 qn)
  onClicked button5m  (playDev 2 $ g  3 qn)
  onClicked button55m (playDev 2 $ gs 3 qn)
  onClicked button6m  (playDev 2 $ a  3 qn)
  onClicked button66m (playDev 2 $ as 3 qn)
  onClicked button7m  (playDev 2 $ b  3 qn)
  
  button1 <- buttonNewWithLabel "C"
  button11 <- buttonNewWithLabel "C#/Db"
  button2 <- buttonNewWithLabel "D"
  button22 <- buttonNewWithLabel "D#/Eb"
  button3 <- buttonNewWithLabel "E"
  button4 <- buttonNewWithLabel "F"
  button44 <- buttonNewWithLabel "F#/G"
  button5 <- buttonNewWithLabel "G"
  button55 <- buttonNewWithLabel "G#/Ab"
  button6 <- buttonNewWithLabel "A"
  button66 <- buttonNewWithLabel "A#/Bb"
  button7 <- buttonNewWithLabel "B"
  
  --funciones
  onClicked button1  (playDev 2 $ c  4 qn)
  onClicked button11 (playDev 2 $ cs 4 qn)
  onClicked button2  (playDev 2 $ d  4 qn)
  onClicked button22 (playDev 2 $ ds 4 qn)
  onClicked button3  (playDev 2 $ e  4 qn)
  onClicked button4  (playDev 2 $ f  4 qn)
  onClicked button44 (playDev 2 $ fs 4 qn)
  onClicked button5  (playDev 2 $ g  4 qn)
  onClicked button55 (playDev 2 $ gs 4 qn)
  onClicked button6  (playDev 2 $ a  4 qn)
  onClicked button66 (playDev 2 $ as 4 qn)
  onClicked button7  (playDev 2 $ b  4 qn)
  
  button1p <- buttonNewWithLabel "C"
  button11p <- buttonNewWithLabel "C#/Db"
  button2p <- buttonNewWithLabel "D"
  button22p <- buttonNewWithLabel "D#/Eb"
  button3p <- buttonNewWithLabel "E"
  button4p <- buttonNewWithLabel "F"
  button44p <- buttonNewWithLabel "F#/G"
  button5p <- buttonNewWithLabel "G"
  button55p <- buttonNewWithLabel "G#/Ab"
  button6p <- buttonNewWithLabel "A"
  button66p <- buttonNewWithLabel "A#/Bb"
  button7p <- buttonNewWithLabel "B"
  --funciones
  onClicked button1p  (playDev 2 $ c  5 qn)
  onClicked button11p (playDev 2 $ cs 5 qn)
  onClicked button2p  (playDev 2 $ d  5 qn)
  onClicked button22p (playDev 2 $ ds 5 qn)
  onClicked button3p  (playDev 2 $ e  5 qn)
  onClicked button4p  (playDev 2 $ f  5 qn)
  onClicked button44p (playDev 2 $ fs 5 qn)
  onClicked button5p  (playDev 2 $ g  5 qn)
  onClicked button55p (playDev 2 $ gs 5 qn)
  onClicked button6p  (playDev 2 $ a  5 qn)
  onClicked button66p (playDev 2 $ as 5 qn)
  onClicked button7p  (playDev 2 $ b  5 qn)
  
  button1pp <- buttonNewWithLabel "C"
  onClicked button1pp (playDev 2 $ c 6 qn)
  
  --octava1
  --teclas #&b
  tableAttachDefaults keystable button11m 1 3 0 1
  tableAttachDefaults keystable button22m 3 5 0 1
  tableAttachDefaults keystable button44m 7 9 0 1
  tableAttachDefaults keystable button55m 9 11 0 1
  tableAttachDefaults keystable button66m 11 13 0 1
  --teclas
  tableAttachDefaults keystable button1m 0 2 1 2
  tableAttachDefaults keystable button2m 2 4 1 2
  tableAttachDefaults keystable button3m 4 6 1 2
  tableAttachDefaults keystable button4m 6 8 1 2
  tableAttachDefaults keystable button5m 8 10 1 2
  tableAttachDefaults keystable button6m 10 12 1 2
  tableAttachDefaults keystable button7m 12 14 1 2
  
  --octava2
  --teclas #&b
  tableAttachDefaults keystable button11 15 17 0 1
  tableAttachDefaults keystable button22 17 19 0 1
  tableAttachDefaults keystable button44 21 23 0 1
  tableAttachDefaults keystable button55 23 25 0 1
  tableAttachDefaults keystable button66 25 27 0 1
  --teclas
  tableAttachDefaults keystable button1 14 16 1 2
  tableAttachDefaults keystable button2 16 18 1 2
  tableAttachDefaults keystable button3 18 20 1 2
  tableAttachDefaults keystable button4 20 22 1 2
  tableAttachDefaults keystable button5 22 24 1 2
  tableAttachDefaults keystable button6 24 26 1 2
  tableAttachDefaults keystable button7 26 28 1 2
  
  --octava3
  --teclas #&b
  tableAttachDefaults keystable button11p 29 31 0 1
  tableAttachDefaults keystable button22p 31 33 0 1
  tableAttachDefaults keystable button44p 35 37 0 1
  tableAttachDefaults keystable button55p 37 39 0 1
  tableAttachDefaults keystable button66p 39 41 0 1
  --teclas
  tableAttachDefaults keystable button1p 28 30 1 2
  tableAttachDefaults keystable button2p 30 32 1 2
  tableAttachDefaults keystable button3p 32 34 1 2
  tableAttachDefaults keystable button4p 34 36 1 2
  tableAttachDefaults keystable button5p 36 38 1 2
  tableAttachDefaults keystable button6p 38 40 1 2
  tableAttachDefaults keystable button7p 40 42 1 2
  
  tableAttachDefaults keystable button1pp 42 44 1 2
  
  onDestroy window mainQuit
  widgetShowAll window
  mainGUI