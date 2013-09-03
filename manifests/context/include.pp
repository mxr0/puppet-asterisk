define asterisk::context::include{

  file_line{ "include /etc/asterisk/$dir/*":
      path => "/etc/asterisk/$name.conf",
      line => "#include </etc/asterisk/$dir/*.conf>",
  }

}
