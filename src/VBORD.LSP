;;***************************************************************************
;                 VBORD.LSP V1.0 by Zoltan Toth
;    ZOTO Technologies,
;    23 Greenhills Dve,
;    Melton 3337.
;    E-MAIL: zoltan.toth@ains.net.au
;       WWW: http://www.ains.net.au/zoto/
;;*****************************************************************************
;    Draws a border to the extents of the current viewport in layer
;    DEFPOINTS so it will not plot. Layer DEFPOINTS will be created if
;    needed. Useful for creating a border in Model space to indicate the
;    extents of a Paper space viewport when working with TILEMODE = 1.
;    This is done by changing Tilemode to zero, making a viewport current
;    with the MSPACE command and then running VBORD. The border will be
;    created automatically. Layer DEFPOINTS is sort of a "child" of layer
;    0 so anything you do to layer 0 will affect objects on layer
;    DEFPOINTS as well. For some reason, you can't make changes to
;    DEFPOINTS alone.
;
;    Since most monitors have a slightly different dot pitch in the
;    vertical and horizontal directions, a variable called PIX_RATIO is
;    used to correct this. To determine what value PIX_RATIO should have,
;    open a drawing and change TILEMODE to 0 if it isn't already and
;    create a viewport whose X and Y dimensions are the values of your
;    screen resolution ie. If your resolution is 1024x768 then your
;    viewport dimensions should be 1024 drawing units wide and 768
;    drawing units high. Make that viewport active and run VBORD with
;    PIX_RATIO at the default value of 1.0. Then TILEMODE to 1 and you
;    should see the rectangle created by VBORD. You may need to zoom out
;    if you can't see it. Run the CAL command and at the:
;         >> Expression:
;    prompt, key in:
;         (1024/768)/(dist(end,end)/dist(end,end))
;    and hit <return>. The "(1024/768)" is assuming a video resolution of
;    1024x768. If yours is different, key that in.
;
;    After you hit <return>, you will be faced with what looks like a
;    pickbox the size of your APERTURE setting and a prompt on the command
;    line:
;         >> Select entity for _END snap:
;    Pick the top left hand corner of the VBORD rectangle, then the top
;    right corner of the rectangle, the top right again and then the bottom
;    right corner. This compares the ratio of your video resolution ratio
;    to the ratio of the width and height of the border drawn by VBORD - a
;    ratio of ratios if you will. Once done, CAL will display a number on
;    the command line which should be fairly close to 1. This is the value
;    for PIX_RATIO.
;
;    Make sure that you have configured the video display in AutoCAD to
;    produce round circles and square squares prior to calculating the
;    value for PIX_RATIO. Altering the video display ratio in the AutoCAD
;    configuration will require you to recalculate PIX-RATIO.
;    Should you have different machines on a network with different
;    PIX-RATIO requirements, and they use the same VBORD.LSP, you can put
;    in a COND function linked to either the _PKSER or LOGINNAME SETVAR to
;    set PIX_RATIO according the the machine.
;;***************************************************************************
;define program and localize variables
(defun C:VBORD(/ CLAY2 PWID2 X_CEN YCEN SCRHGT X_DIM Y_DIM XY_RATIO PIX_RATIO
                 SCRWID LEFTEX RIGHTEX BOTEX TOPEX PT2 PT3 PT4 PT5
              )
 (setq PIX_RATIO 1.0 ;set PIX_RATIO to horizontal/vertical dot pitch ratio of monitor
       CMD2 (getvar "CMDECHO")                      ;save current command echo status
       CLAY2 (getvar "CLAYER")                                    ;save current layer
       PWID2 (getvar "PLINEWID")                         ;save current POLYLINE width
 )
 (setvar "CMDECHO" 0)                                       ;turn off command echoing
 (command "._UCS" "_VIEW")                                         ;align UCS to view
 (setq X_CEN (car (getvar "VIEWCTR"))                 ;get X value of viewport centre
       Y_CEN (cadr (getvar "VIEWCTR"))                ;get Y value of viewport centre
       SCRHGT (getvar "VIEWSIZE")                ;get height of viewport in dwg units
       X_DIM (car (getvar "SCREENSIZE"))            ;get height of viewport in pixels
       Y_DIM (cadr (getvar "SCREENSIZE"))            ;get width of viewport in pixels
       XY_RATIO (/ X_DIM Y_DIM)             ;calculate width:height ratio of viewport
       SCRWID (* SCRHGT XY_RATIO PIX_RATIO) ;calculate width of viewport in dwg units
       LEFTEX (- X_CEN (/ SCRWID 2.0))                    ;\  calculate left,
       RIGHTEX (+ X_CEN (/ SCRWID 2.0))                   ; \ right,  
       BOTEX (- Y_CEN (/ SCRHGT 2.0))                     ; / bottom and
       TOPEX (+ Y_CEN (/ SCRHGT 2.0))                     ;/  top extents of viewport
       PT2 (list LEFTEX BOTEX 0.0)                    ;bottom left corner of viewport
       PT3 (list RIGHTEX BOTEX 0.0)                  ;bottom right corner of viewport
       PT4 (list RIGHTEX TOPEX 0.0)                     ;top right corner of viewport
       PT5 (list LEFTEX TOPEX 0.0)                       ;top left corner of viewport
 )
 (command "._LAYER" "_MAKE" "Z-0-----O-----------OUTROS_LAYOUT" "")           ;set current layer to DEFPOINTS
 (command "._PLINE" PT2 "_WIDTH" "0.0" "" PT3 PT4 PT5 "_CLOSE")          ;draw border
 (command "._UCS" "_PREVIOUS")                                  ;restore previous UCS
 (setvar "CMDECHO" CMD2)                                 ;restore command echo status
 (setvar "CLAYER" CLAY2)                                      ;restore previous layer
 (setvar "PLINEWID" PWID2)                           ;restore previous POLYLINE width
 (princ)                                                                ;exit quietly
)
