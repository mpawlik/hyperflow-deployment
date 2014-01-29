 #!/bin/bash
/bin/su - -- ubuntu -l -c '/usr/bin/screen -dmS executor bash -c "source /etc/amqp-executor-credentials; hyperflow-amqp-executor"'
exit 0