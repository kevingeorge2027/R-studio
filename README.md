# 📊 R-Studio: Boston Housing Price Prediction

## Project Overview

This R project demonstrates a complete **machine learning workflow** for predicting house prices using the Boston Housing dataset. It covers data preprocessing, exploratory data analysis (EDA), model building, and evaluation using linear regression.

## Project Objective

The main goal is to build a predictive model that estimates house prices based on various features like:
- Number of rooms (rm)
- Lower status population percentage (lstat)
- And other housing-related attributes

---

## Repository Structure

```
R-studio/
├── README.md                                  # Project documentation
├── Sample Code.R                              # Main R script with complete workflow
├── Dataset.csv                                # Local dataset (20KB)
├── Boston_Housing_Regression_Report.pdf       # Analysis report (564KB)
└── predicted_house_prices.csv                 # Output: predictions from the model
```

---

## Getting Started

### Prerequisites

- **R version**: 3.5.0 or later
- **Required R Packages**:
  - `ggplot2` (data visualization)
  - `dplyr` (data manipulation)
  - `caret` (machine learning & model evaluation)

### Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/kevingeorge2027/R-studio.git
   cd R-studio
   ```

2. **Install required packages** (run in R console):
   ```R
   install.packages(c("ggplot2", "dplyr", "caret"))
   ```

3. **Run the analysis**:
   ```R
   source("Sample Code.R")
   ```

---

## How It Works - Workflow Overview

### 1. Library Setup
Loads essential packages for data manipulation, visualization, and machine learning:
- `ggplot2`: Beautiful, publication-quality graphics
- `dplyr`: Data wrangling and transformation
- `caret`: Model training and evaluation

### 2. Data Import
Loads the Boston Housing dataset directly from an online CSV source:
```R
data <- read.csv("https://raw.githubusercontent.com/selva86/datasets/master/BostonHousing.csv")
```

### 3. Data Preprocessing
- Checks for missing values using `colSums(is.na(data))`
- Removes any rows with missing data
- Renames the target variable from `medv` to `Price` for clarity

### 4. Exploratory Data Analysis (EDA)
- **Summary statistics**: Basic descriptive statistics
- **Correlation matrix**: Identifies relationships between variables
- **Visualizations**: 
  - Rooms vs. Price (scatter plot with linear trend)
  - Lower Status Population vs. Price
  - Shows how features correlate with house prices

### 5. Train-Test Split
Splits data into:
- **80% training set** (used to build the model)
- **20% test set** (used to evaluate performance)
```R
trainIndex <- createDataPartition(data$Price, p = 0.8, list = FALSE)
```

### 6. Linear Regression Model
Builds a multiple linear regression model using all available features:
```R
model <- lm(Price ~ ., data = trainData)
```

### 7. Predictions
Generates price predictions for the test dataset using the trained model

### 8. Model Evaluation
Calculates three key performance metrics:
- **MSE (Mean Squared Error)**: Average squared prediction errors
- **MAE (Mean Absolute Error)**: Average absolute prediction errors
- **R² (R-squared)**: Proportion of variance explained by the model (0-1 scale)

### 9. Results Visualization
Creates an "Actual vs. Predicted" scatter plot to visually compare model predictions with real prices

### 10. Export Results
Saves predictions to a CSV file for further analysis

---

## Usage Instructions

**Option 1: Run the entire script**
```R
source("Sample Code.R")
```

**Option 2: Run line-by-line** (recommended for learning)
- Open `Sample Code.R` in RStudio
- Execute sections step-by-step to understand each phase

**Option 3: Modify for your own data**
Replace the data source with your own CSV file:
```R
data <- read.csv("your_dataset.csv")
```

---

## Output Files Generated

- **Console output**: Model summary, evaluation metrics (MSE, MAE, R²)
- **Visualizations**: 4 ggplot2 charts displaying relationships and predictions
- **predicted_house_prices.csv**: Contains actual vs. predicted prices for test data

---

## Key Insights

- The model uses multiple linear regression to predict house prices
- Features like room count and lower status population are strong price predictors
- Model performance is evaluated using MSE, MAE, and R² metrics
- The "Actual vs. Predicted" plot shows model accuracy visually

---

## Learning Outcomes

By studying this project, you'll learn:
✅ Data loading and preprocessing in R
✅ Exploratory data analysis techniques
✅ Building and training machine learning models
✅ Model evaluation and performance metrics
✅ Data visualization with ggplot2
✅ Complete ML workflow from raw data to predictions

---

## Files Included

| File | Description | Size |
|------|-------------|------|
| `Sample Code.R` | Complete R script with all steps | 3.3 KB |
| `Dataset.csv` | Boston Housing dataset | 20 KB |
| `Boston_Housing_Regression_Report.pdf` | Detailed analysis report | 564 KB |
| `README.md` | This documentation | - |

---

## Contributing

To improve this project:
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/improvement`)
3. Commit your changes (`git commit -m 'Add improvement'`)
4. Push to the branch (`git push origin feature/improvement`)
5. Open a Pull Request

---

## License

This project is licensed under the **MIT License** - see the LICENSE file for details.

---

## Acknowledgments

- **Dataset source**: [Selva86 Datasets](https://github.com/selva86/datasets)
- **Boston Housing Dataset**: Classic machine learning dataset
- Built with R and popular ML libraries