# .DESCRIPTION

This ansible playbook will query the instance metadata of an EC2 Linux instance deployed in AWS cloud. The code utilizes IPv4 address of instance metadata service - 169.254.169.254 to produce associated attributes in json format.
Based on the given parameters, the code provides both the functionality of producing entire json attributes and retrieving value associated with a particular key.

#.PARAMETER
  Property_Name : Data key from instance metadata for which value needs to be fetched.

#. STEPS TO PRODUCE

- Connect with AWS EC2 Linux instance
- Execute 'curl http://169.254.169.254/latest/dynamic/instance-identity/document' to validate availability of instance metadata
- Install ansible core engine on instance
- Execute developed playbook through 'ansible-playbook' command
- Example : ansible-playbook AWS_EC2_Fetch_Metadata.yaml
  	        ansible-playbook AWS_EC2_Fetch_Metadata.yaml -e "Property_Name=instanceId"
