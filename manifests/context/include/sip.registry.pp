define asterisk::context::include::sipregistry{

  asterisk::context::include::include{ "sip.conf":
      path => "sip.registry.d",
  }

}
