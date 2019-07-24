import boto3

session = boto3.Session(profile_name='dqm')
ec2= session.client('ec2', region_name='eu-west-1')
ec2.describe_instances()

response=ec2.describe_instances()

# get vpc list
vpcs=[]
for i in range(len(response["Reservations"])):
    instance_vpc=response["Reservations"][i]["Instances"][0]["VpcId"]
    vpcs.append(instance_vpc)
vpcs=list(set(vpcs))

# dict with k=vpc v=[instances]
dict_vi={}
for v in vpcs:
    dict_vi[v]=[]
    for i in range(len(response["Reservations"])):
        instance_vpc=response["Reservations"][i]["Instances"][0]["VpcId"]
        instance_id=response["Reservations"][i]["Instances"][0]["InstanceId"]
        if instance_vpc == v:
            dict_vi[v].append(instance_id)

# print vpc and instance list
for i in dict_vi:
    print("---------------------- %s ---------------------" % i)
    print(', '.join(dict_vi[i]))
    print('\n')
