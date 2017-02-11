country: fr
networks:
  management:
    ip: 10.111.0.0/24
    shared_env: True
  backend-web:
    ip: 10.200.0.0/24
    shared_env: True
  nat:
    ip: 10.250.0.0/24
