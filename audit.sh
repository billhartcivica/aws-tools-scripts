#!/bin/bash
# To produce an output file, simply pipe the script into a file - eg: './ec2list.sh > outputfile.txt'
regions=("us-east-1" "us-east-2" "us-west-1" "us-west-2" "eu-west-1" "eu-west-2" "ap-southeast-1" "ap-northeast-1")
profile=(aws-cms hosting)

for i in ${regions[@]};
do
  for j in ${profile[@]};
  do
    echo " "
    echo "***** $j in $i *****"
    aws ec2 describe-instances --region="$i" --profile="$j" --query 'Reservations[*].Instances[*].[InstanceId,Tags[?Key==`Name`].Value|[0],State.Name,PrivateIpAddress,PublicIpAddress,Platform]' --output table
#    echo "$i" "$j"
  done
done


