# the minimum required is the database name and database server name/IP
# This will create an ODBC datda source with folloing properties;
# sql_version => 'SQLSERVER'
# dsn_65bit => true
# user_id => 'Administrator'
# description => ''
# trusted_connection => 'Yes'
odbc_data_source::name{ 'vcenter':
  db_name => 'vcdb',
  db_server_ip => '102.168.10.34',
}
