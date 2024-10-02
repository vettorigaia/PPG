![Logo_Politecnico_Milano](https://github.com/user-attachments/assets/979e8edb-0b53-4ad0-b4d4-297af0080bf6)

# Heart Rate Extraction from Skin Videos using Photoplethysmography

This project implements a method for extracting heart rate information from a video of human skin using photoplethysmography (PPG). Photoplethysmography measures changes in blood volume by analyzing variations in light absorption through the skin, allowing for the derivation of the heart rate based on these fluctuations.

## Project Overview

Photoplethysmography is a non-invasive technique that detects changes in blood volume in the microvascular bed of tissue, often used to measure heart rate, blood pressure, and respiratory function. In this project, a video capturing a section of human skin was analyzed to extract heart rate information by tracking variations in pixel intensity over time.

The project focuses on the red channel of the video, as hemoglobin in the blood absorbs more light in the red spectrum, making it ideal for detecting blood volume changes.

## Methodology
### Video Frame Extraction: 
The video (IMG_2033.mov) is loaded, and each frame is extracted and stored in a structured array. The red component of each frame is isolated for analysis.
### Standard Deviation Calculation: 
For each pixel in the video, the intensity variation over time is computed as a time series. The standard deviation of each pixel’s intensity across all frames is then calculated and stored in a parametric image.
### Heart Rate Visualization: 
The areas in the parametric image with the highest standard deviation—specifically the top right and bottom right corners—are identified as containing the most relevant information for heart rate extraction. These areas exhibit the characteristic systolic and diastolic patterns of blood flow.
### Signal Validation: 
By plotting the overall standard deviation of each frame (using the std2() function), a signal resembling the typical waveform of blood pressure variation can be observed, which allows for heart rate determination.
### Results
The processed video data shows that the right-hand regions of the frame contain the most valuable information for heart rate extraction. This is confirmed by the periodic patterns observed in the time-series graph of the standard deviation, which corresponds to the systolic and diastolic phases of the cardiac cycle.

## Code Details
The code is structured to load and process the video frames, extract the red channel, compute pixel-level standard deviations, and visualize the relevant results. 

Below are the key functions and their purposes:
### Key Functions Used
`VideoReader`: Loads the video file and extracts individual frames into a structured array for analysis.

'read': Retrieves each frame from the video and stores it in the mov structure.

'std2()': Computes the standard deviation of pixel intensities across all frames, allowing for the extraction of the cardiac signal.

'imshow()': Displays the parametric image of standard deviations to highlight regions with significant blood flow variations.

'colormap('turbo')': Enhances visualization of the parametric image by applying a color map that highlights intensity variations effectively.

The process iterates over all pixels in each frame to calculate the time-series standard deviation for every pixel, and the result is stored in a parametric image that visually identifies regions of interest in terms of heart rate signal extraction.

## Conclusion
This project successfully demonstrates the use of photoplethysmography to extract heart rate from a video of human skin. By isolating the red channel and focusing on regions with significant intensity variations, the heart rate signal can be extracted from the video data.
