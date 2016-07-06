define odbc_data_source::entry(
  $system_folder,
  $hklm_odbc_ini,
  $hklm_odbc_sources,
  $db_name,
  $db_server,
  $sql_version,
  $last_user='Administrator',
  $description="",
  $trusted_connection ='Yes'
  ){

  $hklm_dsn_key = "${hklm_odbc_ini}\\${name}"
  notice ("Creating key for ${hklm_dsn_key}")

  if $sql_version == '2012'{
    $driver_2012 = "C:\\Windows\\${system_folder}\\sqlncli11.dll"
    $sql_client_name_2012 = 'SQL Server Native Client 11.0'
    $driver=$driver_2012
    $sql_client_name = $sql_client_name_2012
  }
  elsif $sql_version == 'SQLNativeClient'{
  	$driver_native = "C:\\Windows\\${system_folder}\\sqlncli.dll"
    $sql_client_name_native = 'SQL Native Client'
    $driver=$driver_native
    $sql_client_name = $sql_client_name_native
  }
  else
  {
      $driver_other = "C:\\Windows\\${system_folder}\\sqlncli10.dll"
      $sql_client_name_other = 'SQL Server Native Client 10.0'
      $driver=$driver_other
      $sql_client_name = $sql_client_name_other
  }

  Registry::Value {
    key   => $hklm_dsn_key,
  }

  registry::value {$name:
    key   => $hklm_odbc_sources,
    value => $name,
    data  => $sql_client_name,
    type  => string,
  }

  registry::value {"${name}_Driver":
    key   => $hklm_dsn_key,
    value => 'Driver',
    data  => $driver,
    type  => string,
  }

  registry::value {"${name}_Server":
    key   => $hklm_dsn_key,
    value => 'Server',
    data  => $db_server,
    type  => string,
  }

  registry::value {"${name}_Database":
    key   => $hklm_dsn_key,
    value => 'Database',
    data  => $db_name,
    type  => string,
  }

  registry::value {"${name}_LastUser":
    key   => $hklm_dsn_key,
    value => 'LastUser',
    data  => $last_user,
    type  => string,
  }

  if ($trusted_connection == 'Yes'){
    registry::value {"${name}_TrustedConnection":
      key   => $hklm_dsn_key,
      value => 'Trusted_Connection',
      data  => 'Yes',
      type  => string,
    }
  }
  
  if ($description != ''){
    registry::value {"${name}_description":
      key   => $hklm_dsn_key,
      value => 'Description',
      data  => $description,
      type  => string,
    }
  }
}
