include_recipe "aws"

node['chefweb']['sites'].each do |site_name, _site_data|
  aws_elastic_lb "#{site_name}_elb_register" do
    name "#{site_name}ELB"
    action :register
  end
end
