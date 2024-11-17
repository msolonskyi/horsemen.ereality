create or replace view vw_contrabandist as
select nvl(name, w_id) as name, 
       count_max, 
       count_sold, 
       generated_at
from table (sf_contrabandist())
/
