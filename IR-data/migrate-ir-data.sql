-- usage: sqlite3 /tmp/database.sqlite < migrate-ir-data.sql
attach 'IR_data_db_complete.sqlite' as db2;

delete from irdevmodel;
delete from ircommand;

insert into irdevmodel (name, createdAt, updatedAt) 
select distinct model, datetime('now'), datetime('now') 
from db2.ir_data
where not exists (
    select 1 from irdevmodel
    where name = model
);

insert into ircommand (modelId, name, irData, icon, createdAt, updatedAt) 
select irdevmodel.id as modelId, ir_data.name, ir_data, icon, datetime('now'), datetime('now') 
from db2.ir_data ir_data, irdevmodel 
where ir_data.model = irdevmodel.name
and not exists ( 
    select 1 from ircommand
    where ircommand.modelId = irdevmodel.id and ircommand.irData = ir_data);
