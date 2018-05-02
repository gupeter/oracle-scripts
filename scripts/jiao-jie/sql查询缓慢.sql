alter session set nls_timestamp_format='yyyy-mm-dd hh24:mi:ss';

select * from DBA_HIST_SQLTEXT c where rownum<2

select a.instance_number,a.begin_interval_time,a.end_interval_time,c.sql_text,
 b.sql_id,b.elapsed_time_delta/decode(b.executions_delta,0,1,b.executions_delta)/1000000 t,
b.cpu_time_delta/decode(b.executions_delta,0,1,b.executions_delta)/1000000 c,
b.disk_reads_delta/decode(b.executions_delta,0,1,b.executions_delta) d,
decode(b.executions_delta,0,1,b.executions_delta) executions_delta
from DBA_HIST_SQLSTAT b,DBA_HIST_SNAPSHOT a,DBA_HIST_SQLTEXT c
where b.snap_id=a.snap_id
and c.dbid=a.dbid
and c.dbid=b.dbid
and b.sql_id=c.sql_id
and b.instance_number=a.instance_number
and b.sql_id='gx3p75tbnh1xv'
and a.begin_interval_time between to_date('2017-03-26 11:00:00','yyyy-mm-dd hh24:mi:ss') and to_date('2017-03-26 12:00:00','yyyy-mm-dd hh24:mi:ss')
--and b.elapsed_time_delta/decode(b.executions_delta,0,1,b.executions_delta)/1000000>1
order by 5 desc

select a.SQL_ID,a.SQL_FULLTEXT,a.ELAPSED_TIME/decode(a.EXECUTIONS,0,1,a.EXECUTIONS)/1000000 t,
a.CPU_TIME/decode(a.EXECUTIONS,0,1,a.EXECUTIONS)/1000000 c,
a.DISK_READS/decode(a.EXECUTIONS,0,1,a.EXECUTIONS) d,
decode(a.EXECUTIONS,0,1,a.EXECUTIONS) EXECUTIONS
from v$sql a where a.ELAPSED_TIME/decode(a.EXECUTIONS,0,1,a.EXECUTIONS)/1000000 >1
order by 3 desc


select * from v$session where username='LOTTERY' and status='ACTIVE'


