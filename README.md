![Logo_Politecnico_Milano](https://github.com/user-attachments/assets/979e8edb-0b53-4ad0-b4d4-297af0080bf6)

# Heart Rate Extraction from Skin Videos using Photoplethysmography

This project implements a method for extracting heart rate information from a video of human skin using photoplethysmography (PPG). Photoplethysmography measures changes in blood volume by analyzing variations in light absorption through the skin, allowing for the derivation of the heart rate based on these fluctuations.

## Project Overview

Photoplethysmography is a non-invasive technique that detects changes in blood volume in the microvascular bed of tissue, often used to measure heart rate, blood pressure, and respiratory function. In this project, a video capturing a section of human skin was analyzed to extract heart rate information by tracking variations in pixel intensity over time.

The project focuses on the red channel of the video, as hemoglobin in the blood absorbs more light in the red spectrum, making it ideal for detecting blood volume changes.

## Methodology
### Red Channel Extraction:
The video frames are processed by isolating the red channel to focus on blood volume changes.
### Pixel-wise Intensity Analysis:
For each pixel in the video, the standard deviation of the intensity values across frames is calculated. This helps identify regions where the cardiac signal is most evident.
### Parametric Image Construction:
A parametric image is created where pixel intensity represents the standard deviation of each pixel over time. Regions with higher intensity values (standard deviation) correspond to areas with significant blood volume changes, making them ideal for extracting heart rate information.
### Heart Rate Signal Extraction:
By calculating the standard deviation for each frame (using MATLAB’s std2() function), a time-series signal is generated. This signal represents the changes in blood volume over time, allowing for the extraction of heart rate by identifying the periodic pattern typical of systole and diastole.
### Analysis of Specific Regions:
The analysis showed that the most informative areas for heart rate extraction were located in the upper-right and lower-right corners of the video. When the algorithm was applied to different regions of the video, only the right-hand side areas provided a clear cardiac signal, while the left-hand side contained mostly noise.
### Results
The processed video data shows that the right-hand regions of the frame contain the most valuable information for heart rate extraction. This is confirmed by the periodic patterns observed in the time-series graph of the standard deviation, which corresponds to the systolic and diastolic phases of the cardiac cycle.

## Code Details
The MATLAB code implements the following steps:

Image Pre-processing: Loading and processing the input image to extract the red channel and apply morphological operations to isolate areas of interest.
Statistical Analysis: Computing the area and eccentricity of the detected regions, along with the standard deviation of pixel intensities to identify variations over time.
Heart Rate Estimation: Calculating and displaying key metrics such as mean area, eccentricity, and video intensity to provide insights into the cardiac signal.
### Key Functions Used
imread(), im2gray(): For loading and processing the image.

bwboundaries(), regionprops(): To detect and analyze objects in the image.

std2(): For calculating the standard deviation of pixel intensities, crucial for tracking blood volume changes.

## Conclusion
This project successfully demonstrates the use of photoplethysmography to extract heart rate from a video of human skin. By isolating the red channel and focusing on regions with significant intensity variations, the heart rate signal can be extracted from the video data.
