# Microsoft SQL ODBC System DSN puppet module.

This module adds a ODBC System DSN for a MS SQL 2005, 2008 or 2012 database. This has been tested on Windows Server 2012.  

## Installation

Run this code on your puppet node using the Puppet Module Tool:

```bash
$ puppet module install creativeview/odbc_data_source
```
This module depends on puppetlabs/registry >= 0.1.1

## Usage
Example usage:

```puppet
odbc_data_source::name{"vcenter":
          db_name => 'vcdb',
          db_server_ip => '102.168.10.34',
          sql_version => '2012',
          dsn_64bit => false,
          user_id => 'gmoore',
          trusted_connection =>'Yes'
      }
```

##### sql_version parameter options

| Value  | Driver |
| ------------- | ------------- |
| 2012 | SQL Server Native Client 11.0 - sqlncli11.dll |
| 2008 | SQL Server Native Client 10.0 - sqlncli10.dll |
| SQLNativeClient | SQL Native Client - sqlncli.dll |
