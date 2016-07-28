#   - Manage the odbc data source entry
#
# == Requires:
#   - Registry Module
# @param db_name the name of the database
# @param db_server_ip The ip address or name of the database server
# @param sql_version The name of the SQL version.  Currently four are supported;
#         Default - Windows Native SQL Server  (sqlsrv32.dll)
#         SQLServer - Windows Native SQL Server  (sqlsrv32.dll)
#         2012 - SQL Server Native Client 11.0 (sqlncli11.dll)
#         2008 - SQL Server Native Client 10.0 (sqlncli10.dll)
#         SQLNativeClient - SQL Native Client (sqlncli.dll)
# @param dsn_64bit True for a 64 bit DSN, otherwise a 32 bit DSN is created
# @param user_id The user id for the database connection. Defaults to Administrator
# @param trusted_connection True for a trusted connection.
# @param description Adds a description for the data source name

define odbc_data_source::name (
  $db_name = '',
  $db_server_ip = '',
  $sql_version = '2012',
  $dsn_64bit = true,
  $user_id = 'Administrator',
  $description = '',
  $trusted_connection = 'Yes'
) {
    if $dsn_64bit == true
    {
      odbc_data_source::entry{$name:
        system_folder      => 'system32',
        hklm_odbc_ini      => 'HKLM\SOFTWARE\ODBC\ODBC.INI',
        hklm_odbc_sources  => 'HKLM\SOFTWARE\ODBC\ODBC.INI\ODBC Data Sources',
        db_name            => $db_name,
        db_server          => $db_server_ip,
        sql_version        => $sql_version,
        user_id            => $user_id,
        description        => $description,
        trusted_connection => $trusted_connection
    }
  }
  else
    {
      odbc_data_source::entry{$name:
        system_folder      => 'SysWOW64',
        hklm_odbc_ini      => 'HKLM\SOFTWARE\Wow6432Node\ODBC\ODBC.INI',
        hklm_odbc_sources  => 'HKLM\SOFTWARE\Wow6432Node\ODBC\ODBC.INI\ODBC Data Sources',
        db_name            => $db_name,
        db_server          => $db_server_ip,
        sql_version        => $sql_version,
        last_user          => $user_id,
        description        => $description,
        trusted_connection => $trusted_connection
      }
    }
}
