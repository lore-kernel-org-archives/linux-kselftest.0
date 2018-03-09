From: anders.roxell at linaro.org (Anders Roxell)
Date: Fri,  9 Mar 2018 14:47:55 +0100
Subject: [PATCH] selftests/ipc/msgque: Fix warning implicit declaration
Message-ID: <20180309134755.11101-1-anders.roxell@linaro.org>

gcc warns about implicit declaration.

gcc -I../../../../usr/include/    msgque.c  -o msgque
msgque.c: In function ‘restore_queue’:
msgque.c:52:7: warning: implicit declaration of function ‘msgget’
 [-Wimplicit-function-declaration]
  id = msgget(msgque->key, msgque->mode | IPC_CREAT | IPC_EXCL);
       ^~~~~~
msgque.c:66:7: warning: implicit declaration of function ‘msgsnd’
 [-Wimplicit-function-declaration]
   if (msgsnd(msgque->msq_id, &msgque->messages[i].mtype,
       ^~~~~~
msgque.c:76:6: warning: implicit declaration of function ‘msgctl’
 [-Wimplicit-function-declaration]
  if (msgctl(id, IPC_RMID, 0))
      ^~~~~~
msgque.c: In function ‘check_and_destroy_queue’:
msgque.c:87:9: warning: implicit declaration of function ‘msgrcv’
 [-Wimplicit-function-declaration]
   ret = msgrcv(msgque->msq_id, &message.mtype, MAX_MSG_SIZE,
         ^~~~~~
msgque.c: In function ‘main’:
msgque.c:204:15: warning: implicit declaration of function ‘ftok’
 [-Wimplicit-function-declaration]
  msgque.key = ftok(argv[0], 822155650);
               ^~~~

In the current code, we include the headers that the functions want
according to the man pages, and we define MSG_COPY if its not defined.
We also use 'struct msqid_ds' instead of 'struct msqid64_ds'.

I thought about another patch where I just forward declared these
functions. However, I wasn't happy with that patch since it feels that
it forces user space apps to do the same in order to get this to work.
Another reason was that checkpatch.pl complained that I added forward
declarations in the c file.

Fixes: 3a665531a3b7 ("selftests: IPC message queue copy feature test")
Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
---
 tools/testing/selftests/ipc/msgque.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/ipc/msgque.c b/tools/testing/selftests/ipc/msgque.c
index ee9382bdfadc..3e32917cd7f4 100644
--- a/tools/testing/selftests/ipc/msgque.c
+++ b/tools/testing/selftests/ipc/msgque.c
@@ -3,11 +3,18 @@
 #include <stdio.h>
 #include <string.h>
 #include <errno.h>
-#include <linux/msg.h>
 #include <fcntl.h>
 
+#include <sys/types.h>
+#include <sys/ipc.h>
+#include <sys/msg.h>
+
 #include "../kselftest.h"
 
+#ifndef MSG_COPY
+#    define MSG_COPY        040000  /* copy (not remove) all queue messages */
+#endif
+
 #define MAX_MSG_SIZE		32
 
 struct msg1 {
@@ -129,7 +136,7 @@ int check_and_destroy_queue(struct msgque_data *msgque)
 
 int dump_queue(struct msgque_data *msgque)
 {
-	struct msqid64_ds ds;
+	struct msqid_ds ds;
 	int kern_id;
 	int i, ret;
 
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
