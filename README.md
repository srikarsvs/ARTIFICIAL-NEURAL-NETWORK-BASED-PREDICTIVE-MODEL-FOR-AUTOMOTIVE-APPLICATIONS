# Artificial Neural Network Based Predictive Model for Automotive Applications

This project presents a predictive model for automotive applications using an Artificial Neural Network (ANN). The model focuses on identifying key parameters such as peak displacement, peak acceleration, power, and stiffness for automotive suspension systems, which are crucial for improving ride comfort and vehicle handling.

## Project Overview

### Department: 
Mechanical Engineering

### Project Title: 
**Design an Artificial Neural Network-Based Predictive Model for Automotive Applications**

### Author: 
**Savadi Venkata Sai Srikar (19KQ1D1513)**

### Guided by: 
**Mr. Ajay Kumar Revuri, M.Tech, (Ph.D.), Assistant Professor**

---

## Table of Contents
- [Introduction](#introduction)
- [Literature Review](#literature-review)
- [Problem Statement](#problem-statement)
- [Objective](#objective)
- [Proposed Methodology](#proposed-methodology)
- [ANN-Based Research Model](#ann-based-research-model)
- [Results and Discussion](#results-and-discussion)
- [Conclusion](#conclusion)
- [Future Work](#future-work)
- [How to Use](#how-to-use)

---

## Introduction
With the increasing usage of automobiles worldwide, the demand for enhanced ride comfort and safety has risen. Road-induced vibrations can lead to discomfort, fatigue, and long-term health issues for vehicle occupants. To mitigate these vibrations, suspension systems play a crucial role by isolating the vehicle body from road irregularities, thereby enhancing ride comfort and vehicle handling.

However, the challenge lies in balancing the conflicting requirements of ride comfort and vehicle handling, leading to the need for a robust predictive model that can optimize the suspension system.

---

## Literature Review
- **Jugulkar et al.** proposed a design for a variable stiffness suspension system (VS) using a fluid damper and helical springs, demonstrating improved vibration isolation and handling.
- **Lin et al.** developed an adaptive ANN-based model for a hydraulic adjustable damper, significantly improving accuracy and reducing computational resources.
- **Nagarkar et al.** applied ANN to model and optimize a passive suspension system, achieving substantial improvements in ride comfort and health criteria through genetic algorithm optimization.

---

## Problem Statement
Identifying peak displacement, acceleration, power, and stiffness in automotive suspension systems involves complex, time-consuming processes that often require expert supervision. This leads to increased costs, especially during experimentation. 

To address this, an AI-based predictive model can help reduce computational complexity and cost, while improving accuracy.

---

## Objective
The primary objective of this research is to develop an Artificial Neural Network (ANN) model to predict:
- Peak displacement
- Peak acceleration
- Power
- Stiffness 

The model will use frequency and the number of holes open as inputs and will be validated by comparing the predicted results with experimental data.

---

## Proposed Methodology
### Suspension System Design
The research focuses on passive shock absorbers, which are designed for standard load conditions and work by converting vibrational energy into heat through a viscous fluid. This ensures both comfort and handling.

### ANN Model
An ANN is used to predict key suspension parameters, employing the following training algorithms:
1. **Resilient Backpropagation (RP)**
2. **BFGS Quasi-Newton (BFG)**
3. **Scaled Conjugate Gradient (SCG)**

The model is trained using 80% of the dataset, with the remaining 20% used for testing. The **SCG** algorithm yielded the lowest error values.

### Implementation Platform
The entire process is implemented in **MATLAB**, utilizing its powerful neural network toolbox for predictive model development.

---

## ANN-Based Research Model
The developed model is designed to predict the suspension system's parameters based on inputs such as frequency and number of holes open. The SCG algorithm outperformed RP and BFG algorithms in terms of prediction accuracy.

---

## Results and Discussion
The model was validated by comparing predicted results with experimental data. The **SCG algorithm** consistently outperformed other training techniques, achieving minimal error in all cases:
- **Peak Acceleration**: Error of 2.54
- **Peak Displacement**: Error of 7.07
- **Power**: Error of 6.88
- **Stiffness**: Error of 2.25

Overall, the SCG algorithm showed a **57.53% improvement** over RP and **84.56% improvement** over BFG.

### Sample Output
- Comparative graphs showcase the error performance of each algorithm.
- SCG consistently provides better predictive accuracy.

---

## Conclusion
This research successfully developed an ANN-based predictive model for automotive suspension systems. The model simplifies the process of identifying key parameters such as peak displacement, acceleration, power, and stiffness, achieving results close to experimental data.

The SCG algorithm achieved the lowest error rate compared to RP and BFG, making it the most efficient technique for this predictive model.

---

## Future Work
Future research will focus on enhancing the ANN model by optimizing weight parameters using advanced optimization techniques. This will further improve the accuracy and performance of the predictive model for automotive suspension systems.

---

## How to Use
1. Clone the repository:
    ```bash
    git clone https://github.com/srikarsvs/ARTIFICIAL-NEURAL-NETWORK-BASED-PREDICTIVE-MODEL-FOR-AUTOMOTIVE-APPLICATIONS.git
    ```
2. Navigate to the project directory:
    ```bash
    cd ARTIFICIAL-NEURAL-NETWORK-BASED-PREDICTIVE-MODEL-FOR-AUTOMOTIVE-APPLICATIONS
    ```
3. Run the MATLAB script to simulate the ANN predictive model:
    ```matlab
    run ANN_Model.m
    ```

---

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

# Certificate of Publication

---

**Manuscript ID:** DE160349SS  
**Date:** 15/7/2021  

## Publication Details:

This is to certify that the research paper entitled **"Design an Artificial Neural Network Based Predictive Model for Automotive Applications"**, authored by **Savadi Venkata Sai Srikar, Ajay Kumar Revuri, Kota Venkateswarlu, M. Sreenivasan**, has been reviewed by the Editorial Board and published in **Design Engineering**, Issue 7, July 2021, pp. 13335 - 13344.

- **ISSN Online:** 0011-9342
- **Journal Impact Factor (2016):** 9.2286 Calculated by GISI ([www.jifactor.com](https://www.jifactor.com))
- **InfoBase Index IBI Factor (2017–18):** 3.46  
- **Thomson Reuters' Researcher ID:** B-7384-2017

**Retrieved from:** [http://www.thedesignengineering.com/index.php/DE/article/view/4582](http://www.thedesignengineering.com/index.php/DE/article/view/4582)

**Editor-in-Chief**  
Design Engineering  

**Editorial Office:**  
Design Engineering  
4143 Danforth Avenue, Toronto, ON M4K 1A6  
**Email:** editor@thedesignengineering.com

---

## Paper Abstract

The research introduces an **Artificial Neural Network (ANN)** based predictive model, specifically for **automotive applications**. Focusing on **passive fluid shock absorbers**, the study explores how ANN can predict parameters like **peak displacement, acceleration, power, and stiffness** for varied frequencies and fluid orifice conditions. Among several training techniques explored, the **Scaled Conjugate Gradient (SCG)** method demonstrated the lowest error, establishing it as the most accurate approach for predictive modeling in this domain.

---

### Key Findings:

- **ANN Prediction Accuracy**: The SCG technique achieved a minimal error rate compared to other training techniques such as **Resilient Back-propagation (RP)** and **BFGS Quasi-Newton (BFG)**, making it 57.53% more accurate than RP and 84.56% more accurate than BFG.

- **Automotive Application**: This model can enhance vehicle suspension design, improving both **driver comfort** and **vehicle handling**.

- **Practical Implementation**: MATLAB was used to develop and test the predictive model, with 80% of the data for training and 20% for testing. Experimental results validated the model's effectiveness.

---

### Performance and Results:

- **Peak Acceleration**: Achieved error of **2.54**.
- **Peak Displacement**: Achieved error of **7.07**.
- **Power**: Achieved error of **6.88**.
- **Stiffness**: Achieved error of **2.25**.

The overall performance of the SCG method outperformed the other techniques, demonstrating its robustness in predicting critical suspension parameters.

---

### How to Clone and Use the Model:

1. **Clone the Repository**:
   - Use the following command to clone the repository containing the model:
     ```bash
     git clone https://github.com/username/repository.git
     ```

2. **Set Up Your Environment**:
   - Ensure you have MATLAB installed with the necessary toolboxes (e.g., Neural Network Toolbox).

3. **Load the Data**:
   - Prepare your dataset and load it into MATLAB.

4. **Run the Model**:
   - Navigate to the cloned repository in MATLAB and run the main script to initiate the ANN training process. 
   - Adjust the training parameters if needed.

5. **Evaluate Results**:
   - After training, use the testing dataset to evaluate the model's performance. Review the error metrics to assess accuracy.

6. **Visualize Results**:
   - Utilize provided MATLAB scripts for visualizing the predicted outputs and performance metrics.

---

### Conclusion:

The developed ANN-based predictive model offers a computationally
