<h1 align="center">Practical Machine Learning – Feature Analysis & Multi-Label Classification</h1>

<p align="center">
  <a href="https://www.um.edu.mt/courses/studyunit/CCE3503">
    <img src="https://img.shields.io/badge/University%20of%20Malta-CCE3503-blue?style=for-the-badge&logo=scikitlearn" alt="CCE3503 Course">
  </a>
  <a href="https://scikit-learn.org/">
    <img src="https://img.shields.io/badge/Built%20with-scikit--learn-orange?style=for-the-badge&logo=scikit-learn" alt="scikit-learn">
  </a>
  <a href="https://pytorch.org/">
    <img src="https://img.shields.io/badge/Neural%20Networks-PyTorch-red?style=for-the-badge&logo=pytorch" alt="PyTorch">
  </a>
</p>

<p align="center">
  Assignments for CCE3503 – Practical Machine Learning, including feature selection techniques and multi-label neural network classification, supervised by <a href="https://www.um.edu.mt/profile/trevorspiteri">Dr. Trevor Spiteri</a> at the <a href="https://www.um.edu.mt">University of Malta</a>.
</p>

---

## 🧪 Repository Contents

```
.
├── assignment1/
│   ├── feature_analysis.ipynb       # Notebook for feature selection and evaluation
│   └── ...                          # CSV dataset assumed to be downloaded via VLE
│
├── assignment2/
│   ├── multi-label-classification.ipynb   # Full pipeline for multi-label classification
│   └── ...                                # Yeast dataset (not included)
└── README.md
```

---

## 📊 Assignment 1 – Feature Analysis (Communities & Crime Dataset)

### Objective
Perform data cleaning and dimensionality reduction using:
- Filter methods (correlation heatmap + thresholding)
- Wrapper methods: Sequential Forward/Backward Selection (SFS, SBS)
- Projection: Principal Component Analysis (PCA)

Each technique was evaluated by training an `MLPRegressor` on a target variable: `assaultPerPop`.

### Highlights
- Missing data imputed using mean strategy.
- Normalisation applied using `StandardScaler`.
- Train/test split: 80/20

### Evaluation
MSE (Mean Squared Error) was used to compare:
- **Filter**
- **SFS**
- **SBS**
- **PCA**

Final results showed that PCA and SFS achieved lowest MSE, with PCA reducing feature count significantly.

---

## 🧬 Assignment 2 – Multi-Label Classification (Yeast Dataset)

### Objective
Train and evaluate neural networks for **multi-label classification** using:
- Problem transformation (Binary Relevance vs Classifier Chains)
- Algorithm adaptation with hyperparameter optimisation (HPO)

### Dataset
- Yeast gene expression dataset (2417 samples, 103 features, 14 classes)
- Preprocessing and label binarisation performed within notebook

### Approaches
- Binary Relevance (BR): independent classifiers per label
- Classifier Chains (CC): models label dependencies
- Adapted Neural Network: trained with `OneVsRestClassifier` and `MLPClassifier` using HPO

### Hyperparameters Tuned
- Hidden layer sizes
- Learning rate
- Batch size

HPO performed using `GridSearchCV` with 5-fold cross-validation.

### Evaluation Metrics
- Hamming Loss
- Exact Match Ratio (EMR)
- F1 Score (Macro and Micro)

### Observations
- Classifier Chains outperformed Binary Relevance in Exact Match Ratio.
- Adapted neural network showed best balance across all metrics.
- EMR values were expectedly low due to high label cardinality.

---

## 📚 How to Run

1. Clone the repository:
```bash
git clone https://github.com/GrahamPellegrini/cce3503.git
```

2. Launch Jupyter Lab or VSCode and open the notebooks:
```bash
jupyter lab assignment1/feature_analysis.ipynb
jupyter lab assignment2/multi-label-classification.ipynb
```

3. Download the datasets via VLE and place them in the correct folders.

> 📁 Communities & Crime CSV for Assignment 1  
> 📁 Yeast Dataset for Assignment 2

4. Run all notebook cells sequentially. Make sure all dependencies are installed:
```bash
pip install numpy pandas matplotlib seaborn scikit-learn scikit-multilearn
```

---

## 👨🏻‍💻 Author

**Graham Pellegrini**  
B.Eng. (Hons) Computer Engineering  
University of Malta  
GitHub: [@GrahamPellegrini](https://github.com/GrahamPellegrini)
