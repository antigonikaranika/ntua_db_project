# Cooking Contest Database Project

## Overview

This project was developed as part of the **Databases** course assignment. The goal was to design and implement a relational database for a **cooking contest** held annually, consisting of **10 episodes per year**. The system supports the **storage, management, and analysis** of data related to the contest, including contestants, judges, recipes, ratings, and episodes.

The database was implemented using **MariaDB**, with additional components developed using **Python** and **Jupyter Notebooks** to manage users and populate the database with sample data.

---

## System Functionality

### **User Roles**

The system supports two distinct user roles:

- **Admin**: Full access to data management, backup/restore functionality, and overall system administration.
- **Cook**: Limited access to personal data and assigned recipes, with the ability to add and update their own entries.

---

## **Database Design**

### **Entity-Relationship Diagram (ERD)**

The database schema follows a well-structured **ER diagram** with clear cardinalities, representing the cooking contest domain. Key entities include:

- **Contestants (Cooks)**
- **Judges (Critics)**
- **Recipes**
- **Episodes**
- **Ratings**
- **Themes**
- **Food Groups**

### **Relational Schema**

Based on the ER diagram, the **relational schema** was implemented, with particular focus on the `Rating` table, which plays a central role in most queries.

---

## **Queries and Analysis**

The project includes **15 pre-defined SQL queries** covering a wide range of analytical and operational use cases, such as:

- **Average ratings** per cook and cuisine
- **Participation tracking** per episode and year
- **Top-ranked recipes and contestants**
- **Judges’ activity analysis**
- **Trends in ingredients and themes over the years**

---

## **Implementation Details**

### **Jupyter Notebooks**

The system includes a **helper\_functions.ipynb** file, which contains reusable Python functions for:

- **Contest draw and data insertion** (`fill_episode()`)
- **Dynamic user creation** (`create_admins()` & `create_cooks()`)

### **User Privileges**

- **Admin**: Full privileges, including administrative rights required for backups and restores.
- **Cook**: No direct access to the database — instead, they operate via predefined **stored procedures** that enforce business logic.

### **Indexes**

To optimize performance, several indexes were implemented:

- `Unique_Ratings` for efficient grouping by **recipe, cook, and episode**.
- `Score` for **aggregation and statistical calculations**.
- `Episode_Release_Date` for **filtering by year in joins**.

---

## **Setup & Installation**

### **Prerequisites**

- **MariaDB** (recommended on Ubuntu 22.04)
- **Anaconda** (for Python environment management)

### **Installation Steps**

1. Install required libraries using:

   ```sh
   sudo chmod 774 ./requirements.sh
   sudo ./requirements.sh
   ```

2. Set up MariaDB user:

   ```sql
   GRANT ALL PRIVILEGES ON *.* TO `myadmin`@`localhost` IDENTIFIED BY 'password' WITH GRANT OPTION;
   GRANT SUPER ON *.* TO 'myadmin'@'localhost' WITH GRANT OPTION;
   ```

3. Initialize the database:

   ```sql
   source ./Scripts/my_ddl.sql;
   source ./Scripts/dummy_data.sql;
   ```

4. Set up Python environment:

   ```sh
   conda env create -f ./environment.yml
   conda activate ntua_db_test
   jupyter notebook ./dummy_data.ipynb
   ```

5. Execute all cells in the `dummy_data.ipynb` notebook to populate the database with test data.

6. Load additional data (optional):

   ```sql
   source ./Scripts/extra_dummy_data.sql;
   ```

---

## **Documentation**

For full documentation, including the **ER Diagram**, relational schema, and query explanations, refer to the **report\_db.pdf** file included in this repository.

---

## **Authors**

- **Γεώργιος Τσαπικούνης**
- **Χρήστος Σκάρλος**
- **Αντιγόνη Μαρία Καρανίκα**

---


