
//------------------------------------------------------------------------
//   Directory Structures
//-----------------------------------------------------------------------
<username>     
     README
     run.csh
     /cytosim
          README.md
	  Makefile
	  /bin
	     play
	     report
	     sim
	  /build
	  /cym
	  /doc
	  /lib
    /cfg
        config.cym.tpl
    /driver
         run_size.csh
    /runs
    	/crosslinkers_surface
   	/asters_rigidity

//-------------------------------------------------------------------------
//   Checkout and Run Instructions 
//-------------------------------------------------------------------------
% git clone git@github.com:arusli1/arusli_cytosim.git <username>
% cd <username>
% git clone https://gitlab.com/f-nedelec/cytosim.git cytosim
% cd cytosim
% make
% cd ..
% driver/run_size.csh

