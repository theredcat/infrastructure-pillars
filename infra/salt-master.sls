roles:
  caserver: True
  salt.master: True

servers:
  salt-master:
    ports:
      main: 4505
      alt: 4506
    networks:
      service:
      management:
      public:
        from:
          - office
  ssh:
    networks:
      public:
