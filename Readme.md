


### Software to install

- Visual studio code
- the extension [glsl-canvas](https://marketplace.visualstudio.com/items?itemName=circledev.glsl-canvas&ssr=false)
- the extension "Shader languages support for VS Code"

Run ⌘ ⇧ P on mac os, ctrl ⇧ P on windows. Then Then type Show glslCanvas. Click on the icon setting to set up a shortcut.

On linux, control shift p. Launch the gsls-canvas, then set a custom shortuct. I use win-p

### 

### Resources

[The Book of shaders](https://thebookofshaders.com)

[Hugh Sky tutorial](http://hughsk.io/fragment-foundry/chapters/01-hello-world.html)

[Matt DesLauriers tutorial](https://github.com/mattdesl/lwjgl-basics/wiki/Shaders)

[Shadertoy](http://www.shadertoy.com/)

### Lesson 1 (27/10/2021)
Intro to fragment shaders, variables, swizzling, uniforms, sin wave,coordinate system, write your first function.

### Lesson 2 (3/11/2021)

Fix screen proportion, improve your square function, pass the position parameter to it.Pass the size parameter. Create a library of functions that you can reuse. create a `circle` function using `lenght`. Merge two circles.

### Lesson 3 (10/11/2021)
Intro to step and smoothstep. Use them to draw a line. Explore built-in [functions](https://thebookofshaders.com/05/).Add a function `fill`, and `stroke`. Use them to draw the circles
Put the merge function into a new file in the libs folder. Add the new boolean functions `merge`, `intersect`, `smoothMerge`, `subtract`. Try to use them with two circles
Add new 2d primitives to your `2dshapes` file. Choose 4 of them from [here](https://www.iquilezles.org/www/articles/distfunctions2d/distfunctions2d.htm).

### Lesson 4 (17/11/2021)
Intro to [matrices](https://thebookofshaders.com/08/). Move the coordinate system to move things.

### Lesson 5 (24/11/2021)
Intro to [patterns](https://thebookofshaders.com/09/). Deform the coordinate system to deform things.

### Lesson 6 (7/12/2021)
Truchet patterns and multiple layers patterns.


### Lesson 7 (10/12/2021)
Load images.
In the root of your folder, create a folder called "textures", and put an image, like "first.jpg" in it.
Go to File -> Preference ->Settings. Click on the tab "Workspace", then click on "extensions". Find the extension "glsl-canvas". Scroll down to "textures", click on "edit in settings.json". Edit the file as follow:

```
{
    "glsl-canvas.textures": {
        "0": "./texture/first.jpg",      
    }
}
```

Now you are ready to use this image in the sketch. Have a look at `070-texture.glsl`.

### Lesson (5/01/2022)

Kernel convolutions. Files 08*.

### Lesson (12/01/2022)

Random. Intro to Pixelspirit and its library.

### Lesson (19/01/2022)

Noise and Cellular noise

### Lesson (26/01/2022)

Feedback buffer

### Lesson (02/02/2022)

Fractals

### Lesson (09/02/2022)

Reaction diffusion or cellular automata

### Lesson (16/02/2022)

Raymarching

<!-- 
#### Resources About raymarching.

[Ray Marching (in french)](https://www.youtube.com/watch?v=s6t0mJsgUKw). You can find a trascript of this video with code and images [here](https://github.com/edap/edap.github.com/tree/master/shaders/ray-marching-tutorial)

[Ray Marching workshop](https://github.com/ajweeks/RaymarchingWorkshop)

[Ray Marching and sdf](http://jamie-wong.com/2016/07/15/ray-marching-signed-distance-functions/) -->

