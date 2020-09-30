node 'node1' {

  #include tomcat

  class { '::tomcat' :

    xms           => '60m',
    xmx           => '120m',
    user          => 'tomcat',
    group         => 'root',
    service_state => 'stopped',

  }

  include prefs
  include base

}

node default {

  notify{ "checkpoint_1" :

    message => "***** DEFAULT BLOCK *****"

  }

}

node 'node2' {

  class { '::tomcat' :

    xms           => '70m',
    xmx           => '130m',
    user          => 'tomcat',
    group         => 'tomcat',
    service_state => 'running',

  }

  # notify{ "***** NODE2 BLOCK *****" : }

  include java::install
  # include tomcat::install
  # include tomcat::service
  include base



}
