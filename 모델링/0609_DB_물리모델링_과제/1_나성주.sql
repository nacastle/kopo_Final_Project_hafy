

--전체 스크립트를 RUN 시킬 쿼리문
SET HEADING ON
SET PAGESIZE 1000
SET LINESIZE 1000
SET ECHO OFF
SET TERM OFF
spool C:\Users\Na\Desktop\HanaKopoEdu\DB\Final_Project\모델링\0608_DB과제\1_나성주.lst
@C:\Users\Na\Desktop\HanaKopoEdu\DB\Final_Project\모델링\0608_DB과제\1_나성주_CRD_TBL.sql
@C:\Users\Na\Desktop\HanaKopoEdu\DB\Final_Project\모델링\0608_DB과제\1_나성주_CRUD_DAT.sql
@C:\Users\Na\Desktop\HanaKopoEdu\DB\Final_Project\모델링\0608_DB과제\1_나성주_CRUD_SQL.sql
@C:\Users\Na\Desktop\HanaKopoEdu\DB\Final_Project\모델링\0608_DB과제\1_나성주_PL.sql
spool off



