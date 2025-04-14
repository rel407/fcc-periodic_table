# Periodic Table Database 🧪🔬  
**A relational database project for freeCodeCamp's Relational Database Certification**  

## 📖 Overview  
This project is a PostgreSQL relational database designed to store and query elements of the periodic table.  
The database schema includes tables for elements, properties, and types. The **`element.sh`** Bash script enables users to query element details dynamically.  

## 🏗️ Project Structure  
### Files Included:
- **`periodic_table.sql`**: The PostgreSQL database dump defining the schema, constraints, and inserted data.
- **`atomic_mass.txt`**: Displays the expected output format for the atomic mass column.
- **`element.sh`**: A Bash script that allows querying the database by atomic number, symbol, or name.  

### Database Schema:
#### Tables:
- **`elements`**: Stores atomic number, symbol, and name.
- **`properties`**: Stores atomic mass, melting point, boiling point, and type ID.
- **`types`**: Defines element types (e.g., metal, nonmetal, metalloid).  

#### Constraints:
- Primary key and foreign key constraints ensure database integrity.
- Unique constraints on `atomic_number`, `symbol`, and `name`.

## 🚀 Running the Project  
### 1️⃣ Setup the PostgreSQL Database:
- Restore the database using the `periodic_table.sql` dump:
  ```bash
  psql --username=freecodecamp --dbname=postgres < periodic_table.sql
  ```

### 2️⃣ Running the Bash Script (element.sh):
- Make the script executable:
  ```bash
  chmod +x element.sh
  ```
- Query an element using atomic number, symbol, or name:
  ```bash
  ./element.sh 1        # Queries Hydrogen
  ./element.sh He       # Queries Helium
  ./element.sh Lithium  # Queries Lithium
  ```
## 🔗 Version Control (Git Usage)
- Used Git for version control of `element.sh`.
- Created **5 branches**, made **7 commits**, then merged and deleted unnecessary branches after integration into `main`.

## 📌 Features:
- ✔ Query elements using atomic number, symbol, or name  
- ✔ Returns atomic mass, melting & boiling points, element type  
- ✔ Efficient PostgreSQL relational design with constraints  
- ✔ Implements Git best practices for version control  

## 📖 Learnings & Experience
- **PostgreSQL commands (`psql`)** for database creation and manipulation  
- **Relational database design** with primary & foreign key constraints  
- **Bash scripting** for command-line data retrieval  
- **Git** for version control, branch management, and merging strategies  

## 🏆 Acknowledgments  
Developed as part of [freeCodeCamp's Relational Database Certification](https://www.freecodecamp.org/learn)  
