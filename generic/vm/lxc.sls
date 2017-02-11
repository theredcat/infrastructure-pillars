servers:
  ssh:
    networks:
      service:
        from:
          - { host: salt-01.infra.fr2.nodster.fr }
