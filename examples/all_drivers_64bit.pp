
  odbc_data_source::name{ 'vcenter':
    db_name => 'vcdb',
    db_server_ip => '102.168.10.34',
    sql_version => '2012',
    dsn_64bit => true,
    user_id => 'gmoore',
    trusted_connection =>'Yes'
  }

  odbc_data_source::name{ 'vcenter1':
      db_name => 'vcdb',
      db_server_ip => '102.168.10.34',
      sql_version => '2008',
      dsn_64bit => true,
      user_id => 'gmoore',
      trusted_connection =>'Yes'
  }

  odbc_data_source::name{ 'vcenter2':
        db_name => 'vcdb',
        db_server_ip => '102.168.10.34',
        sql_version => 'SQLNativeClient',
        dsn_64bit => true,
        user_id => 'gmoore',
        trusted_connection =>'Yes'
    }

    odbc_data_source::name{ 'vcenter3':
          db_name => 'vcdb',
          db_server_ip => '102.168.10.34',
          sql_version => 'SQLServer',
          dsn_64bit => true,
          user_id => 'gmoore',
          trusted_connection =>'Yes'
      }

      # Providing an unknown string will result in the default driver being used
      odbc_data_source::name{ 'vcenter4':
            db_name => 'vcdb',
            db_server_ip => '102.168.10.34',
            sql_version => 'the default driver',
            dsn_64bit => true,
            user_id => 'gmoore',
            trusted_connection =>'Yes'
        }
