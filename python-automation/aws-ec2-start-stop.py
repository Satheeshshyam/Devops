import boto3

ec2 = boto3.client('ec2', region_name='ap-south-1')

instance_id = "i-xxxxxxxx"

action = input("Enter action (start/stop): ")

if action == "start":
    ec2.start_instances(InstanceIds=[instance_id])
    print("Instance starting...")

elif action == "stop":
    ec2.stop_instances(InstanceIds=[instance_id])
    print("Instance stopping...")

else:
    print("Invalid action")
