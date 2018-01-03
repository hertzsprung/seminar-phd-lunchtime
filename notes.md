# Numerically stable advection over steep terrain

- Many weather and climate models solve discretised equations on grids, or 'meshes'
- chop the world up into boxes, arranged in columns
- hence we tend to choose horizontal and vertical meshes separately
- Met Office Unified Model uses lat-lon mesh in the horizontal and a terrain-following mesh in the vertical
- TODO: reasons that lat-lon is dying
- TODO: alternatives to lat-lon: "quasi-uniform" meshes
- TODO: disadvantages of TF 
- TODO: alternatives to TF

- slanted cells
- cubicFit description
- highOrderFit (no maths, just description)
