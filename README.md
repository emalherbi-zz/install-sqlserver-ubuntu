# Install SQL Server Ubuntu

Quickstart: Install SQL Server and create a database on Ubuntu.

## Install

```bash
sudo chmod +x install.sh
bash install.sh
```

## Test connect locally

* Please, after install close the terminal and open again.

```bash
sqlcmd -S localhost -U SA -P '<YourPassword>'
```

```sql
SELECT Name from sys.Databases
GO
```

## Restore a database

```bash
chmod -R 777 /var/opt/mssql/data/
```

```bash
mv ~/Downloads/DBTEST.bk2 /var/opt/mssql/data/
```

```bash
sqlcmd -S localhost -U SA -P '<YourPassword>' -Q "RESTORE DATABASE DBTEST FROM DISK = N'/var/opt/mssql/data/DBTEST.bk2' WITH RECOVERY, MOVE N'DBTEST_DATA' TO N'/var/opt/mssql/data/DBTEST_DATA.MDF', MOVE N'DBTEST_LOG' TO N'/var/opt/mssql/data/DBTEST_LOG.LDF'"
```

## Install database tool

Free multi-platform database tool for developers, SQL programmers, database administrators and analysts. Supports all popular databases: MySQL, PostgreSQL, MariaDB, SQLite, Oracle, DB2, SQL Server, Sybase, MS Access, Teradata, Firebird, Derby, etc.

Download: [DBeaver](https://dbeaver.jkiss.org/)

> Linux Debian package 64 bit or 
> Linux Debian package 32 bit
