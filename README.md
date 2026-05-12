# Predictive Demand Schema Architecture for Food-Tech Analytics

## Objective
To design a normalized, high-performance relational database architecture optimized for real-time feature extraction to support restaurant success prediction models. This project processes raw, unstructured data from the Zomato Bangalore dataset and transforms it into a 3rd Normal Form (3NF) analytical database.

## Project Structure
This repository contains the end-to-end pipeline for data validation, schema creation, ingestion, and feature engineering:

*   **`schema.sql`**: The Data Definition Language (DDL) script that establishes the 3NF relational database, including primary/foreign key constraints and indexing for read-heavy analytical queries.
*   **`ingestion_pipeline.py`**: A Python-based ETL automation script utilizing `pandas` for data validation (handling nulls and inconsistent string formats) and `SQLAlchemy` for automated relational data ingestion.
*   **`er_diagram.dbml`**: Database Markup Language code to generate the visual Entity-Relationship diagram, illustrating the relationships between Locations, Restaurants, and Ratings.
*   **`feature_engineering.sql`**: A suite of SQL queries designed to extract predictive features (e.g., Competitive Density, Digital Adoption Index) for downstream Machine Learning models.

## Technology Stack
*   **Language:** Python 3.x
*   **Data Processing:** Pandas, NumPy
*   **Database Management & ORM:** MySQL, SQLAlchemy
*   **Architecture Standard:** 3rd Normal Form (3NF)

## Setup & Execution Instructions

### 1. Database Configuration
Ensure you have a local instance of MySQL running. Execute the `schema.sql` file in your SQL environment to establish the `food_tech_analytics` database and its tables.

### 2. Environment Setup
Install the required Python dependencies:
```bash
pip install pandas numpy sqlalchemy pymysql
