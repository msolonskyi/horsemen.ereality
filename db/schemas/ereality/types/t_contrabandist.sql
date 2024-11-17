create or replace type t_contrabandist is object(
  w_id  number,
  name varchar2(100),
  count_max number,
  count_sold number,
  generated_at date)
/
