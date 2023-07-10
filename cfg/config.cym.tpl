% A confined filament
% Andrew Rusli, Jun 2023, CA

set simul system
{
    time_step = 0.005
    viscosity = 0.02
}

set space cell
{
    shape = circle
}

new cell
{
    radius = 3
}

set fiber filament
{
    rigidity = 0.1
    segmentation = 0.2
    confine = inside, 10, cell
}

new 100 filament
{
    length = 2
}
set hand binder
{
	binding_rate = 10
	binding_range = 0.01
	unbinding_rate = 0.2
}
set couple crosslinker
{
	hand1 = binder
	hand2 = binder
	stiffness = 100
	diffusion = 10
}
set hand motor
{
	binding_rate = 10
	binding_range = 0.01
	unbinding_rate = 0.2
	activity = move
	unloaded_speed = 1
	stall_force = 3
}
set couple complex
{
	hand1 = motor
	hand2 = motor
	stiffness = 100
	diffusion = 10
}

new 200 complex
new [[range(0,4000,200)]] crosslinker


run 1000 system
{
    nb_frames = 10
}










