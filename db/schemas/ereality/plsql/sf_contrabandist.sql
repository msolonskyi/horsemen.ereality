create or replace function sf_contrabandist
  return t_contrabandist_table
  pipelined
is
  cv_module_name      constant common.batches.module%type := 'get contrabandist info';
  cv_uri              constant varchar2(200) := 'https://api.ereality.ru/contrabandist.txt';
  cv_timezone         constant varchar2(200) := 'Europe/Moscow';
  l_contrabandist_row t_contrabandist;
  vv_name             dictionary.name%type;
  --
  vt_req          utl_http.req;
  vt_resp         utl_http.resp;
  vv_value        varchar2(1024);
begin
  common.pkg_log.sp_start_batch(pv_module => cv_module_name);
  vt_req := utl_http.begin_request(cv_uri);
  vt_resp := utl_http.get_response(vt_req);
  utl_http.read_line(vt_resp, vv_value, true);
  apex_json.parse(vv_value);
  select nvl((select name from dictionary where id = apex_json.get_number('w_id')), '') into vv_name from dual;    
  l_contrabandist_row := t_contrabandist(
    apex_json.get_number('w_id'),
    vv_name,
    apex_json.get_number('count_max'),
    apex_json.get_number('count_sold'),
    common.javascript_date_to_date(apex_json.get_number('info.generated_at'), cv_timezone));
  utl_http.end_response(vt_resp);
  pkg_log.sp_finish_batch_successfully;
  pipe row (l_contrabandist_row);
  return;
exception
  when others then
    utl_http.end_response(vt_resp);
    pkg_log.sp_log_message(pv_text => 'errors stack', pv_clob => dbms_utility.format_error_stack || pkg_utils.CRLF || dbms_utility.format_error_backtrace, pv_type => 'E');
    pkg_log.sp_finish_batch_with_errors;
    raise;
end sf_contrabandist;
/
