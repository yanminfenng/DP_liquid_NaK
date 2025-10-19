# Machine Learning Interatomic Potential for Liquid Na-K Systems

[![DOI]( https://zenodo.org/badge/DOI/10.5281/zenodo.17390093.svg) ]( https://doi.org/10.5281/zenodo.17390093)

This repository contains a machine learning interatomic potential (MLP) model trained for liquid sodium-potassium (Na-K) alloy systems,including pure sodium, pure potassium, and sodium-potassium alloys. The model is designed for molecular dynamics simulations of liquid metal systems.

## Repository Structure

### 📁 `pre_training`  
Contains files related to the pre-training phase:  
- Input parameter configuration file  
- Training dataset  
- Pre-trained model files  

### 📁 `simplify`  
Files for the simplify transfer learning and optimization phase:  
- Transfer learning input parameter file  
- Training dataset  
- Validation dataset  
- Test dataset  
- Optimized final model  

### 📁 `vasp_run_input`  
Example input files for VASP calculations:  
- Input templates for AIMD (Ab Initio Molecular Dynamics) simulations  
- Input templates for static DFT calculations  
- Reference files for first-principles calculations  

## Key Features
- Deep learning-based potential trained on liquid Na-K systems  
- Transfer learning protocol for model optimization  
- Compatible with LAMMPS/DeePMD-kit for molecular dynamics  
- Validation against DFT (VASP) reference calculations

All models are compatible with [DeePMD-kit]( https://github.com/deepmodeling/deepmd-kit) and [LAMMPS]( https://www.lammps.org/).
