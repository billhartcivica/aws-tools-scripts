#!/usr/bin/python
import boto3
from sys import exit
from botocore import exceptions

ec2 = boto3.client('ec2')
try:
    instances = ec2.describe_instances()
except exceptions.ClientError:
    exit(1)

for instance in instances['Reservations']:
    print(instance['Instances'][0]['Tags'][0]['Value'] + ':')
    print('  ' + instance['Instances'][0]['PrivateIpAddress'])  
