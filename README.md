# Find_cells

Sometimes a researcher wants to strip off mounted coverslips after recording images, conduct more experimental procedures upon the cells, re-mount coverslips and record a second-round images. One example is a sequential RNA- and DNA- FISH method: since RNA-FISH signals cannot be preserved in the DNA-FISH procedure which includes a high-temperature (75 – 80 °C) denaturation step, one can apply a sequential FISH procedure that involves a first-round microscopy recording after RNA-FISH, stripping off coverslips, conducting DNA-FISH, and a second round-microscopy recording. Therefore, it is critical to efficiently find the same cells on the coverslip for the second-round microscopy. Here I describe a method for finding the cells based on reference points marked on the coverslip and coordinates recording using the sequential RNA- and DNA- FISH procedure as an example. This method can be used to easily find hundreds of cells for high throughput imaging using a microscope system with a coordinate recording function (e.g. DeltaVision OMX from GE Healthcare).

Step 1. Coverslip preparation. Etch three cross-shaped points on a coverslip (e.g. Fisher Sci 12-545-81), wash off glass powders with water and autoclave. Record the pattern of the points and name them as ref point 1, 2, 3.

Step 2. Grow/attach cells on the coverslips and conduct RNA-FISH. Mount coverslips on glass slides with a non-solidifying glycerol-based medium (90% glycerol, 0.1xSSC, 0.1% p-phenylenediamine [pH 9]) and seal with nail polish. 

Step 3. First-round microscopy. Record images and record coordinates for each cell (save list as cells-1stMicroscopy.txt). Also record coordinates of the cross-shape center of the three ref points (save list as ref-1stMicroscopy.txt).

Step 4. Strip off coverslips from slides, wash off mounting media, conduct DNA-FISH and mount coverslips.

Step 5. Second-round microscopy. Search to find ref points 1-3 and record new coordinates (save list as ref-2ndMicroscopy.txt). Run the following R code (Find_cells.R) to convert cells-1stMicroscopy.txt to a new coordinate list (cells-2ndMicroscopy.txt). Import the generated coordinate list (cells-2ndMicroscopy.txt) into the microscopy system to find the cells and record images. R code and sample coordinate lists are provided here.
