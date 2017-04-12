chefweb Cookbook
===============
This cookbook stands up a demo version of the chef.io website.

Requirements
------------
Spin up a standard demo and add the default recipe to your runlist.  The only external dependencies are the iptables and aws community cookbooks. 

Attributes
----------
There are only two configurable attributes, namely the port for standard web traffic and the port for SSL traffic.  As you might expect these are configured in the attributes/default.rb file.


Usage
-----
Just include `chefweb` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[chefweb]"
  ]
}
```

Contributing
------------

1. Create a named feature branch (like `yourname/add_component_x`)
2. Write your change
3. Write tests for your change (if applicable)
4. Run the tests, ensuring they all pass
5. Submit a Pull Request using Github

License and Authors
-------------------
Authors: The Chef Sales Engineering team
