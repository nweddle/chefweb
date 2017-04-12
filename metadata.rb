name             'chefweb'
maintainer       'Chef'
maintainer_email 'saleseng@chef.io'
license          'All rights reserved'
description      'Installs/Configures the chef website for demo purposes'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.31'

depends 'iptables'
depends 'aws'
