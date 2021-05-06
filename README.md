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
mv ~/Downloads/DATABASE.bk2 /var/opt/mssql/data/
```

```bash
sqlcmd -S localhost -U SA -P '<YourPassword>' -Q "RESTORE DATABASE DATABASE FROM DISK = N'/var/opt/mssql/data/DATABASE.bk2' WITH RECOVERY, MOVE N'database_data' TO N'/var/opt/mssql/data/DATABASE_DATA.MDF', MOVE N'database_log' TO N'/var/opt/mssql/data/DATABASE_LOG.LDF'"
```

## Install database tool

Free multi-platform database tool for developers, SQL programmers, database administrators and analysts. Supports all popular databases: MySQL, PostgreSQL, MariaDB, SQLite, Oracle, DB2, SQL Server, Sybase, MS Access, Teradata, Firebird, Derby, etc.

Download: [DBeaver](https://dbeaver.jkiss.org/)

> Linux Debian package 64 bit or 
> Linux Debian package 32 bit
