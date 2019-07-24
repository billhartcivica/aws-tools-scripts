#!/bin/bash
# To produce an output file, simply pipe the script into a file - eg: './ec2list.sh > outputfile.txt'
regions=("us-east-1" "us-east-2" "us-west-1" "us-west-2" "eu-west-1" "eu-west-2" "ap-southeast-1")
profile=(aws-cms hosting dxm-dev evidon dqm dqm-dev dqm-root corporate evidon evidon-prod evidon-dev evidon-platform-dev ghostery gadget-prod gadget-dev search)

for i in ${profile[@]};
do
  echo " "
  echo "***** $j in $i *****"
  aws cloudfront list-distributions --profile="$j" 
#  aws cloudfront list-distributions --profile="$j" --query 'DistributionList.Items[*].DomainName' --output table
#    echo "$i" "$j"
done


