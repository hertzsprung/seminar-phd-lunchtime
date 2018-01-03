# Numerically stable advection over steep terrain

- grid boxes in weather and climate models are becoming ever-smaller in order to resolve small-scale features
  - steeply-sloping terrain is one of the small-scale features that become resolved at finer mesh spacings
  - I'll talk about the numerical problems associated with steep slopes and explain what I've been doing to alleviate the problems

- Many weather and climate models solve discretised equations on grids, or 'meshes'
- chop the world up into boxes
- we arrange these boxes in columns, hence we tend to choose horizontal and vertical meshes separately
- these boxes are getting ever-smaller in order to resolve small-scale features
- introduce CFL constraint
  - demonstrate with a whiteboard diagram, x--z slice
  - |u dt/dx| < constant
  - we've said that we want dx to be small
  - we'd also like dt to be large to produce forecasts quickly
  - hence we run up against the CFL constraint
- currently, Met Office Unified Model uses lat-lon mesh in the horizontal and a terrain-following mesh in the vertical
- lat-lon is a real problem because of the CFL constraint
  - singularity at poles
  - there are methods to alleviate the problem: semi-Lagrangian methods, semi-implicit methods
  - but such methods need to exchange data between non-local grid boxes
  - lat-lon mesh creates a parallelisation bottleneck that gets worse as mesh spacing becomes finer
- hence, the next Met Office global model will use an alternative "quasi-uniform" mesh
  - show some examples from staniforth-thuburn2012
- I've talked about horizontal meshes, what about the vertical?
- I said that Met Office use a terrain-following mesh
- there are several types of TF mesh, one of the earliest was BTF (also called sigma)
- we typically use a vertical coordinate transform to move points up above mountains (draw on whiteboard)
  - hence, computational domain is a rectangle, direct addressing into array data structures
- but you can see that, the steeper the slope, the poorer the mesh quality (draw on whiteboard)
  - distorted meshes tend to make our discrete approximations less accurate (will we see examples of this problem throughout the talk)
- hence, lots of work to make TF meshes smoother and less distorted
- Met Office Unified Model uses a hybrid TF mesh
- DWD models use SLEVE meshes
- but cells are *still* badly distorted immediately above steep slopes
- Cut cells are an alternative to terrain following methods
  - show how to make one on whiteboard
  - but cut cells are arbitrarily small, remember CFL constraint!
- an example of a model that's already using different meshes is the Ocean-Land-Atmosphere Model (OLAM)
  - uses a triangular icosahedron in the horizontal, cut cells in the vertical

- meshes summary
- so we've chopped out world up into boxes (by some means), now what?
- we discretise our continuous equations
  - show continuous equations
- this is a big topic, but today I'll focus on advection
  - identify advection terms
  - let's simplify, show advection equation

- traditional advection schemes can perform poorly

- my project focuses on the representation of mountains: can we make a better mesh or better advection schemes that avoid the disadvantages I just mentioned?

# Slanted cells
- aims: easy to construct, avoids small cells, generalises to 3D
- draw the method on whiteboard
- show comparison of cut cell and slanted cell mesh

# cubicFit

- highOrderFit (no maths, just description)
