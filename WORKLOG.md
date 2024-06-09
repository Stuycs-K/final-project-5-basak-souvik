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

### 2024-06-01

Fixed bugs with songs and added a challenge level.

### 2024-06-02

Fixed a bug with the player being able to jump in the air. The canJump boolean is now false whenever the player's velocity isn't 0.

### 2024-06-03

Wrote the JumpPad class, which just sets the player velocity to a specific value when the player touches the jump pad.

### 2024-06-05

Created the text file for Back on track, will need to update later.

### 2024-06-06

Updated the Back on Track level file and allowed for input buffering.

### 2024-06-07

Tried to implement a loading screen while the Game class initializes, but failed.

### 2024-06-09

Fixed the error with the loading screen, and made menus and background more clean.
