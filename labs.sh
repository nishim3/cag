 1) # India map with mini globe
[  
   #!/bin/sh

gmt pscoast -R55/99/3/39 -Wthick -Gwheat -EIN+gred -Df -Sazure -B5g5 -P -N1/thick,red -K -JM15c > test.ps

gmt psbasemap -R -J -DjBL+w4c+o0.01c -F+gwhite+pthick -K -O >> test.ps
gmt pscoast -Rg -JG75E/5S/1.5i -Gwheat -Sblue -Bg -EIN+gred -O >> test.ps

   
gs test.ps 
     
     ]
     
     
     
    2) #  India Map, World Map ,Round world Map
     [
     #!/bin/sh
#gmt pscoast -R64/100/4/40 -JM4.5i -N1 -P -B5g5 -Sblue -Ggrey > test.ps
#gmt pscoast -Rd -JR4.5i -Wthick -N1/thin,red -P -B5g5 -Sazure -Gwheat > test.ps
gmt pscoast -R0/360/-80/80 -JR4.5i -N1 -P -B5g5 -Sblue -Ggrey > test.ps
gs test.ps
     ]
     
     
     
    3) # India Map with Major River ,Fancy frame ,2x2 degree , Cities Name with Red Dot
  [
     
     #!/bin/sh
#gmt gmtset FORMAT_GEO_MAP DD
gmt gmtset MAP_FRAME_TYPE fancy
gmt pscoast -R64/100/4/40 -JM4.5i -Wthick -N1/thick,red -Sblue -B2g2 -Ia/blue -Ggrey -K -P > practice.ps

cat cor.dat | gmt psxy -R64/100/4/40 -JM4.5i -Sc0.3 -Gred -O -K -P  >> practice.ps
#to labeling  HYDRABAD
gmt pstext -R64/100/4/40 -JM4.5i -W1,0 -O -P <<!>> practice.ps
88.36 22.5 Kolkata
77 28.70 Delhi
!

gs practice.ps

   ]

       4) # Topographical MAp of India  With Labelling Hyderabad
   [  
#!/bin/sh -x
ps=india.ps
Reg=-R60/100/4/40
Pro=-Jm0.3
GRD=TOPO.grd

cpt1=tmp.cpt
gmt makecpt -Ctopo -T-5000/8500/500 > $cpt1

#gmt gmtset FORMAT_GEO_MAP DD
#gmtset MAP_TICK_LENGth -0.6
gmt grdcut $GRD $Reg $Pro -Gtmp1.grd -V
gmt grdsample tmp1.grd -Gtmp.grd -I4m -r -nc+c -V
gmt grdgradient tmp.grd -A315 -Ggradient.grd -Nt -V
gmt grdimage $Reg $Pro tmp.grd -Igradient.grd -C$cpt1 -K -P > $ps

cat cor.dat | gmt psxy $Reg $Pro -Sc0.3 -Gred -K -O -P >> $ps

#to labeling  HYDRABAD
gmt pstext $Reg $Pro -W1,0 -O -P <<!>> $ps
88.36 22.5 Kolkata
77 28.70 Delhi

!

gs $ps
]

    5)  # Taup Tool Kit For Ray-Path Design
    [   (# For pierce point taup pierce -mod prem  -sta 17 78 -az 90 -evt 60 150  -h 550 -ph SKS,SKKS )

    taup path -mod iasp91 -h 550 -deg 74 -ph S,ScS,sS,sScS --gmt 
    sh taup_path.gmt
    #ls *.gmt  
   kate taup_path.gmt
    #ls *.pdf
    okular taup_path.pdf
    ]
    
    6) # Stereographic projection 
    [
    
   #!/bin/sh
gmt pscoast -R-64/100/4/40 -Js0/90/3c/60 -B10g -Dl -A180 -N1 -K -P -Groyalblue -Sseashell > stereo1.ps 

cat cord.dat | gmt psxy -R-64/100/4/40 -Js0/90/3c/60 -Sc0.3 -Gred -O -K -P  >> stereo1.ps
#to labeling  HYDRABAD
gmt pstext -R-64/100/4/40 -Js0/90/3c/60 -W1,0 -O  <<!>> stereo1.ps
88.36 22.5 Kolkata
77 28.70 Delhi
!
gs stereo1.ps


{ #!/bin/sh
gmt pscoast  -R64/100/4/40 -Js0/90/3i/60 -B10g -Dl -A315 -N1 -K -P -Groyalblue -Sseashell > e.ps
cat cord.dat | gmt psxy -R64/100/4/40 -Js0/90/3i/60  -Sc0.3 -Gred -K -O -P  >> e.ps
#to labeling  HYDRABAD

gmt pstext  -R64/100/4/40 -Js0/90/3i/60  -W1,0 -O <<!>> e.ps
88.36 22.5 Kolkata
77 28.70 Delhi
!
gs  e.ps
}

] 


