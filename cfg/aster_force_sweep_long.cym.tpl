% A confined aster
% F. Nedelec, April 2010

set simul system
{
    time_step = 0.01
    viscosity = 0.01
    verbose = 0
}

set space cell
{
    shape = rectangle
}

new cell
{
    length = 10,10 
}


set fiber microtubule
{
    rigidity       = 30
    segmentation   = 0.5
    confine        = inside, 200
    min_length     = 0.5  
    activity       = classic
    
    % first column if for PLUS end; second one for MINUS end
    %growing_speed            = 0.12,   0.06
    %shrinking_speed          = -0.30, -0.15
    %catastrophe_rate         = 0.008,  0.004
    %catastrophe_rate_stalled = 0.08,   0.04
    %rescue_rate              = 0,      0
    %growing_force            = 3.33,   1.67
    
    %display = ( plus_end=10, 2; minus_end=10, 2; )
}

set solid core
{
    display = ( style=4 ; color=red; )
}

set aster centrosome
{
    stiffness = 1000, 500
}

[[ L = range(1, 32,5) ]]% [[L]]

new [[round(250/L)]] centrosome
{
    solid = core
    radius = 0.3
    point1 = center, 0.3
    fibers = [[L]], microtubule, ( length = 4;  end_state = green, green;)
}

set hand binder
{
	binding_rate = 10
	binding_range = 0.01
	unbinding_rate = 0
}
set couple crosslinker
{
	hand1 = binder
	hand2 = binder
	stiffness = 100
	diffusion = 10
}
new 400 crosslinker

[[ X = range(1, 152, 25)]]% [[X]]

set hand dynein
{
    binding_rate = 100
    binding_range = 0.01
    unbinding_rate = 0
    unbinding_force = 3
    
    activity = move
    unloaded_speed = -10
    stall_force = [[X]]
    display = { size=8 ; color=0xFF00FFFF; } % THIS COLOR IS MAGENTA; REPRESENTS MOTOR PROTEIN?
}
                                            % NEW
set single graftedD
{
    hand = dynein
    stiffness = 100
    activity = fixed
}


set hand kinesin
{
    binding_rate = 100 % originally 10
    binding_range = 0.01
    unbinding_rate = 0
    unbinding_force = 3
    
    activity = move
    unloaded_speed = -10 %og 0.8
    stall_force = [[X]]
    display = { size=8; color=0x00D9EAD3; } %  these are the speckeled motor proteins! 0x00FF00FF
}
                                            % NEW
set single graftedK
{
    hand = kinesin
    stiffness = 100
    activity = fixed
}

new 1000 graftedK { position=surface; placement = surface,, ( y > 4.99999;); }        %used to be 200 grafted
new 1000 graftedD { position=surface; placement = surface,, ( y < -4.99999;);}




run system
{
    nb_steps = 1500 
    nb_frames = 10
}
