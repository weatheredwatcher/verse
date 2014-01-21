name "example"
description "example project to demonstate installing zend-server and mongodb using Chef"
run_list(
  "recipe[my_cookbook::server]"
)