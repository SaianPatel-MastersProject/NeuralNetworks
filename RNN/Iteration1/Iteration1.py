import numpy as np
import tensorflow as tf
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import LSTM, Dense
from sklearn.model_selection import train_test_split
import pandas as pd
import matplotlib.pyplot as plt
import time

# Start the timer
start_time = time.time()

# Set a random seed for reproducibility
np.random.seed(42)
tf.random.set_seed(42)

# Load the dataset from a CSV file (replace 'your_dataset.csv' with your actual file name)
data = pd.read_csv('Iteration1/TrainingDataNorm.csv')

# Separate input features (first 4 columns) and output (5th column)
X = data.iloc[:, :4].values  # First 4 columns as input features
y = data.iloc[:, 4].values   # 5th column as output (steering angle)

# Define sequence length (time steps per input sample)
time_steps = 5  # Use past 5 timesteps to predict the next steering angle

# Function to create sequences for RNN input
def create_sequences(X, y, time_steps):
    X_seq, y_seq = [], []
    for i in range(len(X) - time_steps):
        X_seq.append(X[i:i+time_steps])  # Store past 'time_steps' inputs
        y_seq.append(y[i+time_steps])  # Predict steering for the next time step
    return np.array(X_seq), np.array(y_seq)

# Create sequences for training, validation, and test sets
X_train, X_temp, y_train, y_temp = train_test_split(X, y, test_size=0.3, random_state=42)
X_val, X_test, y_val, y_test = train_test_split(X_temp, y_temp, test_size=0.5, random_state=42)

X_train_seq, y_train_seq = create_sequences(X_train, y_train, time_steps)
X_val_seq, y_val_seq = create_sequences(X_val, y_val, time_steps)
X_test_seq, y_test_seq = create_sequences(X_test, y_test, time_steps)

# Define the LSTM model
model = Sequential([
    LSTM(32, activation='relu', return_sequences=True, input_shape=(time_steps, X_train.shape[1])),
    LSTM(16, activation='relu', return_sequences=False),
    Dense(8, activation='relu'),
    Dense(1, activation='tanh')  # Output steering angle (normalized to [-1, 1])
])

# Compile the model
model.compile(optimizer='adam', loss='mse', metrics=['mae'])

# Print the model summary
model.summary()

# Train the model
history = model.fit(
    X_train_seq, y_train_seq,
    validation_data=(X_val_seq, y_val_seq),
    epochs=50,
    batch_size=32,
    verbose=1
)

# Stop the timer
end_time = time.time()
elapsed_time = end_time - start_time
print(f"Training Time: {elapsed_time:.2f} seconds")

# Plot training and validation loss
plt.figure(figsize=(10, 6))
plt.plot(history.history['loss'], label='Training Loss')
plt.plot(history.history['val_loss'], label='Validation Loss')
plt.title('Training and Validation Loss')
plt.xlabel('Epochs')
plt.ylabel('Loss (MSE)')
plt.legend()
plt.show()

# Predict on test set and visualize results
y_pred = model.predict(X_test_seq)
plt.figure(figsize=(10, 6))
plt.scatter(y_test_seq, y_pred, alpha=0.5)
plt.title('True vs Predicted Output')
plt.xlabel('True Output')
plt.ylabel('Predicted Output')
plt.plot([min(y_test_seq), max(y_test_seq)], [min(y_test_seq), max(y_test_seq)], color='red', linestyle='--', label='Perfect Prediction')
plt.legend()
plt.show()

# Save the model
model.export("Iteration1\\SteeringModel_Iteration1")

