import pymysql
import boto3
import os
from pathlib import Path

backuppath = "./dbbackup"

backupfolder = os.mkdir(backuppath)

def upload_file(file_name, bucket):
    """
    Function to upload a file to an S3 bucket
    """
    object_name = file_name
    s3_client = boto3.client('s3')
    response = s3_client.upload_file(file_name, bucket, object_name)

    return response


connection = connect(
    host = os.getenv('MYSQL_HOST'),
    user = os.getenv('MYSQL_USER'),
    password = os.getenv('MYSQL_PASSWORD'),
    db = os.getenv('MYSQL_DATABASE'),
    charset = 'utf8mb4'
)

cursor = connection.cursor()

query = """mysqldump -u "%s" -p "%s" "%s" > "%s"%s".sql""" % (user, password, db, backuppath, db)

cursor.execute(query)

upload_file("backuppath/db.sql", bucketname)
