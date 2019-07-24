aws --profile aws-cms iam list-server-certificates --query 'ServerCertificateMetadataList[*].{ServerCertificateMetadataList:ServerCertificateName}' --output table
