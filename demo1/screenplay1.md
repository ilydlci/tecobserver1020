# Screenplay for Demo 1

* Open AWS Console
* Go to RDS, show database creation
* Create database with AWS CLI
  * Create technical IAM group (with AmazonRDSFullAccess) & user
  * Configure AWS CLI
```
$ aws configure
AWS Access Key ID [None]: <see above>
AWS Secret Access Key [None]: <see above>
Default region name [None]: eu-central-1
Default output format [None]: 
```
  * Execute DB creation command
```
aws rds create-db-instance --db-instance-identifier tecobserver-rds-cli-test-1 --db-instance-class db.t3.micro --engine postgres --db-name mydb --master-username tecobserver --master-user-password tecobserver --allocated-storage 20 | tee create-db-instance-1.out
```
  * Show database being created in RDS
  * Try to connect to DB --> fail due to security group
```
psql -h <see above> -p 5432 -U tecobserver -d mydb
```
  * Adjust security group in order to connect to port 5432
  * Retry connect --> success
  * Create another database, but this time specifying the specifying security group above
```
aws rds create-db-instance --db-instance-identifier tecobserver-rds-cli-test-2 --db-instance-class db.t3.micro --engine postgres --db-name mydb --master-username tecobserver --master-user-password tecobserver --allocated-storage 20 --vpc-security-group-ids <see above> | tee create-db-instance-2.out
```
  * Connect successfully on the first try
