# Exercise-02c-Bullets

Exercise for MSCH-C220, 10 February 2021

This exercise should provide a crucial step toward being able to implement Project 02. The exercise will allow you to generate self-propelling bullets when you press the mouse button. 

Fork this repository. When that process has completed, make sure that the top of the repository reads [your username]/Exercise-02c-Bullets. *Edit the LICENSE and replace BL-MSCH-C220-S21 with your full name.* Commit your changes.

Press the green "Code" button and select "Open in GitHub Desktop". Allow the browser to open (or install) GitHub Desktop. Once GitHub Desktop has loaded, you should see a window labeled "Clone a Repository" asking you for a Local Path on your computer where the project should be copied. Choose a location; make sure the Local Path ends with "Exercise-02c-Bullets" and then press the "Clone" button. GitHub Desktop will now download a copy of the repository to the location you indicated.

Open Godot. In the Project Manager, tap the "Import" button. Tap "Browse" and navigate to the repository folder. Select the project.godot file and tap "Open".

The first thing to do is to add a new action to the Input Map. Open Project->Project Settings->Input Map. Add an input called "fire". Assign the left mouse button to the new input.

Next, create a new scene (Scene->New Scene). Create a Root Node->Other Node->Area2D. Name the new Area2D node "Bullet".

Right-click on the Bullet node and Add Child Node. Choose Sprite. Select the sprite; drag Bullet/missle.png from the FileSystem panel to the Texture property in the Inspector node.

Then, in the Toolbar, select the Sprite menu. Select CreateCollisionPolygon2D Sibling.

Right-click on the Bullet node and Attach Script. Navigate to res://Bullet/Bullet.gd and press Load.

In Bullet.gd, copy the following, and paste it on line 7:

```
export var Velocity = Vector2(0,-1)
export var Acceleration = Vector2(0,-1)


func _physics_process(_delta):
	position += Velocity
	Velocity += Acceleration
	if global_position.x < -10 or global_position.x > VP.x + 10 or global_position.y < -10 or global_position.y > VP.y + 10:
		queue_free()
```

Be careful to ensure that the resulting code is inserted with tabs instead of spaces.

In the Scene panel, select the Bullet node, and then in the Inspector, open the Area2D->Collision section. Clear the Layer, and set the Mask to the third box from the left on the top row (Enemies).

In the Scene panel, select the Bullet node, and then go to the Node panel (next to the Inspector). In Signals->Area2d, select body_entered(body: Node). Connect to "Bullet (Connecting From)" and then press the Connect button.

Save the scene as res://Bullet/Bullet.tscn

Go back to the Game Scene. Test it and make sure everything is working correctly. You should be able to shoot missles at the aliens.

Quit Godot. In GitHub desktop, you should now see the updated files listed in the left panel. In the bottom of that panel, type a Summary message (something like "Completes the exercise") and press the "Commit to master" button. On the right side of the top, black panel, you should see a button labeled "Push origin". Press that now.

If you return to and refresh your GitHub repository page, you should now see your updated files with the time when they were changed.

Now edit the README.md file. When you have finished editing, commit your changes, and then turn in the URL of the main repository page (https://github.com/[username]/Exercise-02c-Bullets) on Canvas.

The final state of the file should be as follows (replacing my information with yours):
```
# Exercise-02c-Bullets
Exercise for MSCH-C220, 10 February 2021

A simple game allowing the player to shoot aliens with self-propelling missles.

## To play
Use the mouse cursor to position the missiles. Click to release a missle (which will fire upwards).

## Implementation
Built using Godot 3.2.2

## References
None

## Future Development
None

## Created by 
Jason Francis

```
