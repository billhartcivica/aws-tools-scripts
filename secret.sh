result=`aws secretsmanager get-secret-value --secret-id $1 --region eu-west-1 --output text`
password=`echo "$result" | perl -e '$_ = <STDIN> ; ($pw)=/:\"([^\"]*)"/;print $pw'`
echo "$password"
