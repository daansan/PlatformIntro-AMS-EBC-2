sfdx force:org:create -f config/project-scratch-def.json -d 1 -s
sfdx force:source:push
sfdx force:user:permset:assign -n Cat_Extra_Permission
sfdx force:user:password:generate
sfdx msm:data:file:upload -f ./assets/einstein_platform.pem
sfdx force:apex:execute -f ./scripts/setupEinstein.cls
sfdx force:data:tree:import -f ./data/Cat__c.json
sfdx force:data:tree:import -f ./data/Interested_Person__c.json
sfdx force:apex:execute -f ./scripts/setupChatter.cls
sfdx force:org:open