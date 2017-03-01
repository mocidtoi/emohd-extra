attach 'IR_data_db.sqlite' as db2;
insert into ir_data (device_type, model, name, ir_data, label, icon)
select device_type, model, name, ir_data, label, icon  from db2.ir_data
where not exists (
    select 1 from ir_data
    where model = db2.ir_data.model and name = db2.ir_data.name
);
