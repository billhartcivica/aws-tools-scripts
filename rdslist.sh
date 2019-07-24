#!/bin/bash
# To produce an output file, simply pipe the script into a file - eg: './ec2list.sh > outputfile.txt'
regions=("us-east-1" "us-east-2" "us-west-1" "us-west-2" "eu-west-1" "eu-west-2")
profile=(aws-cms hosting dxm-dev evidon dqm dqm-devhosting dqm-root cms corporate evidon evidon-prod evidon-dev evidon-platform-dev ghostery gadget-prod gadge
t-dev search)

for i in ${regions[@]};
do
  for j in ${profile[@]};
    do
      echo " "
      echo "***** $j in $i *****"
      aws rds describe-db-instances --region="$i" --profile="$j" --query 'DBInstances[*].[DBInstanceIdentifier,Engine,AllocatedStorage]' --output=table
    done
done
