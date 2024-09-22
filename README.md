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
    git clone https://github.com/yourusername/ANN-Automotive-Predictive-Model.git
    ```
2. Navigate to the project directory:
    ```bash
    cd ANN-Automotive-Predictive-Model
    ```
3. Run the MATLAB script to simulate the ANN predictive model:
    ```matlab
    run ANN_Model.m
    ```

---

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
