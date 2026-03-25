# ---------------------------------------------
# 1. Install & Load Required Libraries
# ---------------------------------------------
install.packages("ggplot2")
install.packages("dplyr")
install.packages("caret")

library(ggplot2)
library(dplyr)
library(caret)

# ---------------------------------------------
# 2. Import Real Dataset (Online CSV)
# ---------------------------------------------
data <- read.csv("https://raw.githubusercontent.com/selva86/datasets/master/BostonHousing.csv")

# View dataset
head(data)
str(data)

# ---------------------------------------------
# 3. Data Preprocessing
# ---------------------------------------------

# Check missing values
colSums(is.na(data))

# Remove missing values (if any)
data <- na.omit(data)

# Rename target variable
data$Price <- data$medv

# Drop original column (optional)
data$medv <- NULL

# ---------------------------------------------
# 4. Exploratory Data Analysis (EDA)
# ---------------------------------------------

# Summary statistics
summary(data)

# Correlation matrix (numeric columns only)
cor(data[, sapply(data, is.numeric)])

# Scatter Plot: Rooms vs Price
ggplot(data, aes(x = rm, y = Price)) +
  geom_point(color = "blue") +
  geom_smooth(method = "lm", color = "red") +
  ggtitle("Rooms vs House Price")

# Scatter Plot: LSTAT vs Price
ggplot(data, aes(x = lstat, y = Price)) +
  geom_point(color = "purple") +
  geom_smooth(method = "lm", color = "black") +
  ggtitle("Lower Status Population vs Price")

# ---------------------------------------------
# 5. Train-Test Split
# ---------------------------------------------

set.seed(123)

trainIndex <- createDataPartition(data$Price, p = 0.8, list = FALSE)
trainData <- data[trainIndex, ]
testData  <- data[-trainIndex, ]

# ---------------------------------------------
# 6. Build Linear Regression Model
# ---------------------------------------------

model <- lm(Price ~ ., data = trainData)

# Model Summary
summary(model)

# ---------------------------------------------
# 7. Predictions
# ---------------------------------------------

predictions <- predict(model, newdata = testData)

# ---------------------------------------------
# 8. Model Evaluation
# ---------------------------------------------

# Mean Squared Error
mse <- mean((testData$Price - predictions)^2)

# Mean Absolute Error
mae <- mean(abs(testData$Price - predictions))

# R-squared
r2 <- cor(testData$Price, predictions)^2

# Print Results
cat("Model Evaluation:\n")
cat("MSE:", mse, "\n")
cat("MAE:", mae, "\n")
cat("R-squared:", r2, "\n")

# ---------------------------------------------
# 9. Visualization: Actual vs Predicted
# ---------------------------------------------

results <- data.frame(
  Actual = testData$Price,
  Predicted = predictions
)

ggplot(results, aes(x = Actual, y = Predicted)) +
  geom_point(color = "green") +
  geom_abline(slope = 1, intercept = 0, color = "red") +
  ggtitle("Actual vs Predicted Prices")

# ---------------------------------------------
# 10. Save Results (Optional)
# ---------------------------------------------

write.csv(results, "predicted_house_prices.csv", row.names = FALSE)

# ---------------------------------------------
# END
# ---------------------------------------------