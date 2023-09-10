# Basic Banking App

## Table of Contents

- [Basic Banking App](#basic-banking-app)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Features](#features)
  - [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)
  - [Usage](#usage)
    - [Transferring Money](#transferring-money)
    - [Viewing Transaction Log](#viewing-transaction-log)

## Introduction

Welcome to the Basic Banking App This simple banking application allows users to create and manage customer accounts, transfer money between accounts, and view transaction history. It utilizes the SQLite database for local data storage, making it easy to manage customer information and transactions.

## Features

- **Money Transfer**: Transfer funds between customer accounts.
- **Transaction Log**: View a log of all previous transactions.
- **Local Storage**: Data is stored locally using SQLite, ensuring data persistence between app sessions.

## Getting Started

Follow these steps to get the Basic Banking App up and running on your local development environment.

### Prerequisites

Before you begin, ensure that you have the following prerequisites installed:

- [Flutter](https://flutter.dev/docs/get-started/install) (Minimum version: Flutter 2.0)
- [Dart](https://dart.dev/get-dart) (Minimum version: Dart 2.12)
- An IDE of your choice (e.g., Android Studio, Visual Studio Code) with the Flutter plugin installed.

### Installation

1. Clone this repository to your local machine:

   ```shell
   git clone https://github.com/DavidNael/banking_app.git
   ```

2. Navigate to the project directory:

   ```shell
   cd banking_app
   ```

3. Install the project dependencies using Flutter:

   ```shell
   flutter pub get
   ```

## Usage

### Transferring Money

1. In the app's main screen, select the customer from whom you want to transfer money.

2. Click the "Transfer Money" button.

3. Select the recipient customer and enter the amount to transfer.

4. Click the "Transfer" button to complete the transaction.

### Viewing Transaction Log

1. Navigate to the "Transaction Log" tab to view a list of all previous transactions.

2. The log includes details such as the date, sender, recipient, and transaction amount.
