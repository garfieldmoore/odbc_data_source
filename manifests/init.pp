# Class: odbc_data_source
#
# This module manages MS Windows system dsn's
#
# Actions:
#
# Requires: see Modulefile
# @example:
#   odbc_data_source::name{"vcenter":
#          db_name => 'vcdb',
#          db_server_ip => '192.168.10.12',
#          sql_version => '2012',
#          dsn_64bit => false,
#          user_id => 'mooreg',
#          description => 'Data source name for vcentre',
#          trusted_connection =>'Yes'
#      }
#
class odbc_data_source {
  registry_key { [ 'HKLM\SOFTWARE\ODBC',
                   'HKLM\SOFTWARE\ODBC\ODBC.INI' ]:
                   ensure =>'present'
  }

  registry_key { [ 'HKLM\SOFTWARE\Wow6432Node\ODBC',
                   'HKLM\SOFTWARE\Wow6432Node\ODBC\ODBC.INI' ]:
                   ensure => 'present'
  }
}
