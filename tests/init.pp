#class {"odbc_data_source":}

odbc_data_source::name{ 'vcenter':
          db_name => 'vcdb',
          db_server_ip => '102.168.10.34',
          sql_version => '2012',
          dsn_64bit => false,
          user_id => 'gmoore',
          trusted_connection =>'Yes'
      }
