grant execute on utl_http to ereality;

begin
  dbms_network_acl_admin.append_host_ace(
    host => 'api.ereality.ru',
    ace =>  xs$ace_type(privilege_list => xs$name_list('http'),
                        principal_name => 'ereality',
                        principal_type => xs_acl.ptype_db));
end;
/
