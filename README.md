Samuel Chan
ES2
Image Manipulation

Acknowledgments: The mathematical techniques for this program were adapted from information provided by Professor Eric Miller (materials found in the subfolder "Prof Eric Miller").

TO RUN: double-click GUI.mlapp
Note: Running more than one instance of this program may result in an error; it seems to work fine if the program is closed before opening it again.
a) Usage
The code is designed to run on a GUI and not in in a script-based environment. The core functions are call-able without the GUI, but the GUI holds a lot of code on its own
and interconnects all the functions. Open MATLAB and navigate to the "GUI.mlapp" file which can be double-clicked. Once there, an image can be selected, and all the 
functions are reachable through the GUI's buttons. Users can manually save the image and histogram at any point. The final image, final histogram, and the record of all
transformations done are automatically saved upon closing in the files "[original image name]-edited.[original extension]", "histogram.jpg", and "ImageManipulationOutput.txt".
These files will be in the same folder as GUI.mlapp itself.

b) Functions
Non-uniform rotation: A rotation transformation with a tapering effect from the center outwards or inwards towards the center.
Non-uniform scaling: A scaling transformation with a tapering effect from the center outwards or inwards towards the center.
Uniform rotation: A standard rotation; take an image and then turn it by a certain number of degrees.
Uniform scaling: A standard scaling; take an image and then multiply it by a certain factor.
Select region: Select a particular region of the image to transform.
Zoom Back Out of Selection: Zoom out of the edited region into the full edited image.
Revert: Turn the edited image back into the original.
Smoothing: Use either gaussian or box smoothing methods to either smoothen sharp edges or at a higher intensity, blur parts of an image.
Outline: Use edge filtering to trace the edges of an image and highlight them a certain color.
Portrait (work-in-progress): Use edge filtering to determine subject(s) in the image and then blur everything else.
Contrast Enhance: Boost contrast which in some cases can aid in distinguishing dark details.

c) Run Example
All the .m function files are tied together within GUI.mlapp; double-click GUI.mlapp and the interface should open. Once there, click "Choose Image" to select an image
from a file directory (some given images are under the folder "ImageExamples"). After an image is chosen, there are a variety of manipulations that can be done to it, 
including non-uniform/uniform rotation/scaling, smoothing, edge tracing, contrast enhancement, and the work-in-progress portrait mode. There is also the option to revert 
to the original image at any time, save the edited image, compare the RGB histograms of the original image to the edited one, scale R/G/B, and the option to select a 
particular part of the image to change (select region). Selecting a region zooms in on it; to see the full edited picture, click the "Zoom Back Out of Selection" button. 
The manipulations done to the image are recorded in an output file called "ImageManipulationOutput.txt" and the histograms can be saved by first clicking 
"Show Histograms," then "File" then "Save as." The edited image itself can be saved with "Save Image."

The image transformations that were based off calculations in slideshows done by Prof. Eric Miller should be noted in comments.
The slideshows containing the information itself will be in the PPT files under folder "Prof Eric Miller."
One function ("FindEdges") was written by referencing to MATLAB's own website, which is linked in comments.