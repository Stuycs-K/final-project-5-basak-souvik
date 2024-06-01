# Work Log

## Souvik Basak

### 2024-05-22

Created all the class files.

### 2024-05-23

Wrote and tested the Hitbox class, which includes the collidesWith method. I also wrote parts of the LevelObject and its child classes, including displayImage, which works as intended. I also imported sprites for the basic block, normal spike, and short spike. The IDs in the sprite's name of the file are in accordance with the IDs of those blocks in Geometry Dash.

### 2024-05-24 to 2024-05-26

Wrote the functions for collideWithPlayer for some of the level object types. Also extracted a few hundred objects from Stereo Madness into the new class called StereoMadness. Wrote the drawMap and calculateCollisions in the Level class, and started writing the playFrame method in the Game class.

### 2024-05-28

Added most of the sprites, including the rotated sprites.

### 2024-05-29

Finalized the object list for Stereo Madness, and added some pause/noclip features.

### 2024-05-30

Coded jumping for the cube, added a death sound effect, fixed some bugs, and made some functions, such as calculateCollisions, more efficient.

### 2024-05-31

Shifted around some code: the code relating to updating the player's velocity is in a new class called Gamemode. Also started and finished coding the physics for the ship. Added icons for the cube and the ship as well.
