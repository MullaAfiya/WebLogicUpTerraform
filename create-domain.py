readTemplate('/home/ec2-user/Oracle/Middleware/Oracle_home/wlserver/common/templates/wls/wls.jar')
cd('Servers/AdminServer')
set('ListenAddress','')
set('ListenPort', 7001)
cd('/')
dumpStack()
cd('Security/base_domain/User/weblogic')
cmo.setPassword('weblogic123')
setOption('OverwriteDomain', 'true')
writeDomain('/home/ec2-user/Oracle/Middleware/Oracle_home/user_projects/domains/Testing_Base_Domain')
closeTemplate()
exit()
