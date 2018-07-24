From: jcline@redhat.com (Jeremy Cline)
Date: Tue, 24 Jul 2018 15:53:34 -0400
Subject: [PATCH v2] bpf: Add Python 3 support to selftests scripts for bpf
Message-ID: <20180724195334.13965-1-jcline@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180724195334.K8JagH_lpl8Yp4pfk52BYus7_5LQreSaN4r4CAO49rs@z>

Adjust tcp_client.py and tcp_server.py to work with Python 3 by using
the print function, marking string literals as bytes, and using the
newer exception syntax. This should be functionally equivalent and
supports Python 3+.

Signed-off-by: Jeremy Cline <jcline at redhat.com>
---

Changes since v1:
  - Drop Python 2 support

 tools/testing/selftests/bpf/tcp_client.py | 12 ++++++------
 tools/testing/selftests/bpf/tcp_server.py | 16 ++++++++--------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/tools/testing/selftests/bpf/tcp_client.py b/tools/testing/selftests/bpf/tcp_client.py
index 481dccdf140c..7f8200a8702b 100755
--- a/tools/testing/selftests/bpf/tcp_client.py
+++ b/tools/testing/selftests/bpf/tcp_client.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python2
+#!/usr/bin/env python3
 #
 # SPDX-License-Identifier: GPL-2.0
 #
@@ -9,11 +9,11 @@ import subprocess
 import select
 
 def read(sock, n):
-    buf = ''
+    buf = b''
     while len(buf) < n:
         rem = n - len(buf)
         try: s = sock.recv(rem)
-        except (socket.error), e: return ''
+        except (socket.error) as e: return b''
         buf += s
     return buf
 
@@ -22,7 +22,7 @@ def send(sock, s):
     count = 0
     while count < total:
         try: n = sock.send(s)
-        except (socket.error), e: n = 0
+        except (socket.error) as e: n = 0
         if n == 0:
             return count;
         count += n
@@ -39,10 +39,10 @@ try:
 except socket.error as e:
     sys.exit(1)
 
-buf = ''
+buf = b''
 n = 0
 while n < 1000:
-    buf += '+'
+    buf += b'+'
     n += 1
 
 sock.settimeout(1);
diff --git a/tools/testing/selftests/bpf/tcp_server.py b/tools/testing/selftests/bpf/tcp_server.py
index bc454d7d0be2..b39903fca4c8 100755
--- a/tools/testing/selftests/bpf/tcp_server.py
+++ b/tools/testing/selftests/bpf/tcp_server.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python2
+#!/usr/bin/env python3
 #
 # SPDX-License-Identifier: GPL-2.0
 #
@@ -9,11 +9,11 @@ import subprocess
 import select
 
 def read(sock, n):
-    buf = ''
+    buf = b''
     while len(buf) < n:
         rem = n - len(buf)
         try: s = sock.recv(rem)
-        except (socket.error), e: return ''
+        except (socket.error) as e: return b''
         buf += s
     return buf
 
@@ -22,7 +22,7 @@ def send(sock, s):
     count = 0
     while count < total:
         try: n = sock.send(s)
-        except (socket.error), e: n = 0
+        except (socket.error) as e: n = 0
         if n == 0:
             return count;
         count += n
@@ -43,7 +43,7 @@ host = socket.gethostname()
 
 try: serverSocket.bind((host, 0))
 except socket.error as msg:
-    print 'bind fails: ', msg
+    print('bind fails: ' + str(msg))
 
 sn = serverSocket.getsockname()
 serverPort = sn[1]
@@ -51,10 +51,10 @@ serverPort = sn[1]
 cmdStr = ("./tcp_client.py %d &") % (serverPort)
 os.system(cmdStr)
 
-buf = ''
+buf = b''
 n = 0
 while n < 500:
-    buf += '.'
+    buf += b'.'
     n += 1
 
 serverSocket.listen(MAX_PORTS)
@@ -79,5 +79,5 @@ while True:
                 serverSocket.close()
                 sys.exit(0)
     else:
-        print 'Select timeout!'
+        print('Select timeout!')
         sys.exit(1)
-- 
2.17.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
