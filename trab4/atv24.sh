#!/bin/bash

# Pega as ultimas 10 linhas de /var/log/syslog e sobreescreve o arquivo
tail /var/log/syslog | tee /var/log/syslog > /dev/null
