# eltpython

A ELT pipeline using Python where the source files are first cleaned and stored in as tables in a 'tempdb' temporary SQL server database. Cleaning and pre-processing is done in Python, followed by extraction and loaded in PostgreSQL database. Once the tables have been loaded in PostgreSQL, answers to few questions and insights have been observed using SQL queries. 

75-61-25 is the main script for cleaning and ELT.
1-1-8 is for scheduling and Automation with Airflow.
2 sql files (lichtblick.sql) - is the main script to answer few preformed questions, tempdb_access_vs353.sql is to create user and password to grant access to database on SQL server.
