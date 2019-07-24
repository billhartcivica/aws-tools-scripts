#!/bin/bash
# To produce an output file, simply pipe the script into a file - eg: './ec2list.sh > outputfile.txt'
profile=(aws-cms hosting dxm-dev evidon dqm dqm-devhosting dqm-root cms corporate evidon evidon-prod evidon-dev evidon-platform-dev ghostery gadget-prod gadget-dev search)

for j in ${profile[@]};
do
  echo " "
  echo "***** $j in $i *****"
  aws --profile "$j" aws-cms iam list-server-certificates --query 'ServerCertificateMetadataList[*].{ServerCertificateMetadataList:ServerCertificateName}' --output table
done


