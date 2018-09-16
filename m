From: vakul.garg@nxp.com (Vakul Garg)
Date: Sun, 16 Sep 2018 10:04:28 +0530
Subject: [PATCH net-next] selftests/tls: Add MSG_WAITALL in recv() syscall
Message-ID: <20180916043428.24329-1-vakul.garg@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180916043428.vq-taIkCzyLm1Z6XYVf1WXD8cEICD2hwnghOHTsc3_s@z>

A number of tls selftests rely upon recv() to return an exact number of
data bytes. When tls record crypto is done using an async accelerator,
it is possible that recv() returns lesser than expected number bytes.
This leads to failure of many test cases. To fix it, MSG_WAITALL has
been used in flags passed to recv() syscall.

Signed-off-by: Vakul Garg <vakul.garg at nxp.com>
---
 tools/testing/selftests/net/tls.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/net/tls.c b/tools/testing/selftests/net/tls.c
index 07daff076ce0..96fc6fe70293 100644
--- a/tools/testing/selftests/net/tls.c
+++ b/tools/testing/selftests/net/tls.c
@@ -121,11 +121,11 @@ TEST_F(tls, send_then_sendfile)
 	buf = (char *)malloc(st.st_size);
 
 	EXPECT_EQ(send(self->fd, test_str, to_send, 0), to_send);
-	EXPECT_EQ(recv(self->cfd, recv_buf, to_send, 0), to_send);
+	EXPECT_EQ(recv(self->cfd, recv_buf, to_send, MSG_WAITALL), to_send);
 	EXPECT_EQ(memcmp(test_str, recv_buf, to_send), 0);
 
 	EXPECT_GE(sendfile(self->fd, filefd, 0, st.st_size), 0);
-	EXPECT_EQ(recv(self->cfd, buf, st.st_size, 0), st.st_size);
+	EXPECT_EQ(recv(self->cfd, buf, st.st_size, MSG_WAITALL), st.st_size);
 }
 
 TEST_F(tls, recv_max)
@@ -160,7 +160,7 @@ TEST_F(tls, msg_more)
 	EXPECT_EQ(send(self->fd, test_str, send_len, MSG_MORE), send_len);
 	EXPECT_EQ(recv(self->cfd, buf, send_len, MSG_DONTWAIT), -1);
 	EXPECT_EQ(send(self->fd, test_str, send_len, 0), send_len);
-	EXPECT_EQ(recv(self->cfd, buf, send_len * 2, MSG_DONTWAIT),
+	EXPECT_EQ(recv(self->cfd, buf, send_len * 2, MSG_WAITALL),
 		  send_len * 2);
 	EXPECT_EQ(memcmp(buf, test_str, send_len), 0);
 }
@@ -180,7 +180,7 @@ TEST_F(tls, sendmsg_single)
 	msg.msg_iov = &vec;
 	msg.msg_iovlen = 1;
 	EXPECT_EQ(sendmsg(self->fd, &msg, 0), send_len);
-	EXPECT_EQ(recv(self->cfd, buf, send_len, 0), send_len);
+	EXPECT_EQ(recv(self->cfd, buf, send_len, MSG_WAITALL), send_len);
 	EXPECT_EQ(memcmp(buf, test_str, send_len), 0);
 }
 
@@ -306,7 +306,7 @@ TEST_F(tls, splice_from_pipe2)
 	EXPECT_GE(splice(p[0], NULL, self->fd, NULL, 8000, 0), 0);
 	EXPECT_GE(write(p2[1], mem_send + 8000, 8000), 0);
 	EXPECT_GE(splice(p2[0], NULL, self->fd, NULL, 8000, 0), 0);
-	EXPECT_GE(recv(self->cfd, mem_recv, send_len, 0), 0);
+	EXPECT_EQ(recv(self->cfd, mem_recv, send_len, MSG_WAITALL), send_len);
 	EXPECT_EQ(memcmp(mem_send, mem_recv, send_len), 0);
 }
 
@@ -436,7 +436,7 @@ TEST_F(tls, multiple_send_single_recv)
 	EXPECT_GE(send(self->fd, send_mem, send_len, 0), 0);
 	EXPECT_GE(send(self->fd, send_mem, send_len, 0), 0);
 	memset(recv_mem, 0, total_len);
-	EXPECT_EQ(recv(self->cfd, recv_mem, total_len, 0), total_len);
+	EXPECT_EQ(recv(self->cfd, recv_mem, total_len, MSG_WAITALL), total_len);
 
 	EXPECT_EQ(memcmp(send_mem, recv_mem, send_len), 0);
 	EXPECT_EQ(memcmp(send_mem, recv_mem + send_len, send_len), 0);
@@ -537,7 +537,7 @@ TEST_F(tls, pollin)
 
 	EXPECT_EQ(poll(&fd, 1, 20), 1);
 	EXPECT_EQ(fd.revents & POLLIN, 1);
-	EXPECT_EQ(recv(self->cfd, buf, send_len, 0), send_len);
+	EXPECT_EQ(recv(self->cfd, buf, send_len, MSG_WAITALL), send_len);
 	/* Test timing out */
 	EXPECT_EQ(poll(&fd, 1, 20), 0);
 }
@@ -555,7 +555,7 @@ TEST_F(tls, poll_wait)
 	/* Set timeout to inf. secs */
 	EXPECT_EQ(poll(&fd, 1, -1), 1);
 	EXPECT_EQ(fd.revents & POLLIN, 1);
-	EXPECT_EQ(recv(self->cfd, recv_mem, send_len, 0), send_len);
+	EXPECT_EQ(recv(self->cfd, recv_mem, send_len, MSG_WAITALL), send_len);
 }
 
 TEST_F(tls, blocking)
@@ -701,7 +701,7 @@ TEST_F(tls, control_msg)
 	EXPECT_EQ(recv(self->cfd, buf, send_len, 0), -1);
 
 	vec.iov_base = buf;
-	EXPECT_EQ(recvmsg(self->cfd, &msg, 0), send_len);
+	EXPECT_EQ(recvmsg(self->cfd, &msg, MSG_WAITALL), send_len);
 	cmsg = CMSG_FIRSTHDR(&msg);
 	EXPECT_NE(cmsg, NULL);
 	EXPECT_EQ(cmsg->cmsg_level, SOL_TLS);
-- 
2.13.6
