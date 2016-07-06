# Class: odbc_data_source
#
# This module manages MS Windows system dsn's
#
# Actions:
#
# Requires: see Modulefile
# @example:
#   odbc_data_source::name{"qtxml":
#          db_name => 'STK',
#          db_server_ip => 'internal-Innovata-OAT-HostDB-759183424.us-east-1.elb.amazonaws.com',
#          sql_version => '2012',
#          dsn_64bit => false,
#          user_id => $userId,
#          description => 'Data source name for the QT XML web service',
#          trusted_connection =>'No'
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
