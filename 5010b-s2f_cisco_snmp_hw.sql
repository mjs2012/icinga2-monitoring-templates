--
-- Relations Service Template - Director Field
-- For default deployment
--

INSERT IGNORE icinga_service_field (service_id, datafield_id, is_required) VALUES ((select id from icinga_service where object_name = "snmp_nwc_health"),(select id from director_datafield where varname = "nwc_health_mode"),'y');
INSERT IGNORE icinga_service_field (service_id, datafield_id, is_required) VALUES ((select id from icinga_service where object_name = "SNMP-NWC Hardware Health"),(select id from director_datafield where varname = "nwc_health_blacklist"),'n');
