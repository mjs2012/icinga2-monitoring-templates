#
#Service template: NetEye "agentless" as we don't have any endpoint = host_name
# Contribute exporting services:
# export OBJ="generic neteye"
# icingacli director service show "$OBJ" --json --no-defaults

#
#Service template
#
OBJ="generic neteye"
RES=`icingacli director service exists "$OBJ"`
if [[ $RES =~ "does not exist" ]]
then
   echo "Service '$OBJ' does not exists"
   icingacli director service create --json '
{
    "imports": [
        "generic_service"
    ],
    "object_name": "generic neteye",
    "object_type": "template",
    "use_agent": true
}
'
fi


OBJ="neteye load"
RES=`icingacli director service exists "$OBJ"`
if [[ $RES =~ "does not exist" ]]
then
   echo "Service '$OBJ' does not exists"
   icingacli director service create --json '
{
    "check_command": "load",
    "imports": [
        "generic neteye"
    ],
    "object_name": "neteye load",
    "object_type": "template"
}
'
fi

OBJ="neteye disk"
RES=`icingacli director service exists "$OBJ"`
if [[ $RES =~ "does not exist" ]]
then
   echo "Service '$OBJ' does not exists"
   icingacli director service create --json '
{
    "check_command": "disk",
    "imports": [
        "generic neteye"
    ],
    "object_name": "neteye disk",
    "object_type": "template"
}
'
fi

OBJ="neteye icinga cluster"
RES=`icingacli director service exists "$OBJ"`
if [[ $RES =~ "does not exist" ]]
then
   echo "Service '$OBJ' does not exists"
   icingacli director service create --json '
{
    "check_command": "cluster",
    "imports": [
        "generic neteye"
    ],
    "object_name": "neteye icinga cluster",
    "object_type": "template",
    "use_agent": true
}
'
fi

OBJ="neteye icinga ido"
RES=`icingacli director service exists "$OBJ"`
if [[ $RES =~ "does not exist" ]]
then
   echo "Service '$OBJ' does not exists"
   icingacli director service create --json '
{
    "check_command": "ido",
    "imports": [
        "generic neteye"
    ],
    "object_name": "neteye icinga ido",
    "object_type": "template",
    "use_agent": true,
    "vars": {
        "ido_name": "ido-mysql",
        "ido_type": "IdoMysqlConnection"
    }
}
'
fi

OBJ="neteye icinga zone"
RES=`icingacli director service exists "$OBJ"`
if [[ $RES =~ "does not exist" ]]
then
   echo "Service '$OBJ' does not exists"
   icingacli director service create --json '
{
    "check_command": "cluster-zone",
    "imports": [
        "generic neteye"
    ],
    "object_name": "neteye icinga zone",
    "object_type": "template",
    "use_agent": false
}
'
fi

OBJ="neteye load"
RES=`icingacli director service exists "$OBJ"`
if [[ $RES =~ "does not exist" ]]
then
   echo "Service '$OBJ' does not exists"
   icingacli director service create --json '
{
    "check_command": "load",
    "imports": [
        "generic neteye"
    ],
    "object_name": "neteye load",
    "object_type": "template"
}
'
fi

OBJ="neteye proc procname"
RES=`icingacli director service exists "$OBJ"`
if [[ $RES =~ "does not exist" ]]
then
   echo "Service '$OBJ' does not exists"
   icingacli director service create --json '
{
    "check_command": "procs",
    "imports": [
        "generic neteye"
    ],
    "object_name": "neteye proc procname",
    "object_type": "template",
    "vars": {
        "procs_command": "influxd",
        "procs_critical": "1:20",
        "procs_warning": "1:5"
    }
}
'
fi

OBJ="neteye processes"
RES=`icingacli director service exists "$OBJ"`
if [[ $RES =~ "does not exist" ]]
then
   echo "Service '$OBJ' does not exists"
   icingacli director service create --json '
{
    "check_command": "procs",
    "imports": [
        "generic neteye"
    ],
    "object_name": "neteye processes",
    "object_type": "template",
    "vars": {
        "procs_critical": "2000",
        "procs_warning": "800"
    }
}
'
fi

OBJ="neteye stats"
RES=`icingacli director service exists "$OBJ"`
if [[ $RES =~ "does not exist" ]]
then
   echo "Service '$OBJ' does not exists"
   icingacli director service create --json '
{
    "check_command": "icinga",
    "imports": [
        "generic neteye"
    ],
    "object_name": "neteye stats",
    "object_type": "template"
}
'
fi

echo "Generic NetEye Service Templates created"
