

# Install Java
curl https://raw.githubusercontent.com/dminGod/install_scripts/master/install_java.sh | bash


# Download the GPG-Key
sudo rpm --import http://packages.elastic.co/GPG-KEY-elasticsearch

# Create Elasticsearch and Kibana repo
echo '[elasticsearch-2.x]
name=Elasticsearch repository for 2.x packages
baseurl=http://packages.elastic.co/elasticsearch/2.x/centos
gpgcheck=1
gpgkey=http://packages.elastic.co/GPG-KEY-elasticsearch
enabled=1
' | sudo tee /etc/yum.repos.d/elasticsearch.repo


echo '[kibana-4.4]
name=Kibana repository for 4.4.x packages
baseurl=http://packages.elastic.co/kibana/4.4/centos
gpgcheck=1
gpgkey=http://packages.elastic.co/GPG-KEY-elasticsearch
enabled=1
' | sudo tee /etc/yum.repos.d/kibana.repo


echo '[logstash-2.2]
name=logstash repository for 2.2 packages
baseurl=http://packages.elasticsearch.org/logstash/2.2/centos
gpgcheck=1
gpgkey=http://packages.elasticsearch.org/GPG-KEY-elasticsearch
enabled=1
' | sudo tee /etc/yum.repos.d/logstash.repo


# Add epel release
sudo yum -y epel-release


# Install 
sudo yum -y install elasticsearch kibana logstash epel-release nginx httpd-tools


# /etc/elasticsearch/elasticsearch.yml

# Add elastic search and kibana to startup
sudo systemctl enable elasticsearch; sudo chkconfig kibana on


# Start elasticsearch and kibana
sudo systemctl start elasticsearch
sudo systemctl start kibana



sudo htpasswd -c /etc/nginx/htpasswd.users kibanaadmin
# enter the password 


# vim /etc/nginx/nginx.conf
# Find the default server block (starts with server {), the last configuration block in the file, and delete it. When you are done, the last two lines in the 
# file should look like this:

# nginx.conf excerpt
#    include /etc/nginx/conf.d/*.conf;
# }



echo 'server {
    listen 80;

    server_name example.com;

    auth_basic "Restricted Access";
    auth_basic_user_file /etc/nginx/htpasswd.users;

    location / {
        proxy_pass http://localhost:5601;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;        
    }
}
' | sudo tee /etc/nginx/conf.d/kibana.conf


# sudo systemctl start nginx

# sudo systemctl enable nginx
