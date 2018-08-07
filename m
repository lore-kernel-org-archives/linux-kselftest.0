From: dan.carpenter@oracle.com (Dan Carpenter)
Date: Tue, 7 Aug 2018 14:57:18 +0300
Subject: [bug report] selftests: add seccomp suite
Message-ID: <20180807115718.mqnrnp2aag4tkpqi@kili.mountain>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180807115718.mlSPRPNypzHUD_T_Krs8XhZIKf4-nIIOwie1p7bnBmk@z>

Hello Kees Cook,

The patch c99ee51a9d97: "selftests: add seccomp suite" from Jun 16,
2015, leads to the following static checker warning:

	./tools/testing/selftests/net/tls.c:206 tls_sendmsg_large()
	warn: curly braces intended?

./tools/testing/selftests/net/tls.c
   187  TEST_F(tls, sendmsg_large)
   188  {
   189          void *mem = malloc(16384);
   190          size_t send_len = 16384;
   191          size_t sends = 128;
   192          struct msghdr msg;
   193          size_t recvs = 0;
   194          size_t sent = 0;
   195  
   196          memset(&msg, 0, sizeof(struct msghdr));
   197          while (sent++ < sends) {
   198                  struct iovec vec = { (void *)mem, send_len };
   199  
   200                  msg.msg_iov = &vec;
   201                  msg.msg_iovlen = 1;
   202                  EXPECT_EQ(sendmsg(self->cfd, &msg, 0), send_len);
   203          }
   204  
   205          while (recvs++ < sends)
   206                  EXPECT_NE(recv(self->fd, mem, send_len, 0), -1);

The EXPECT_NE() macro has an OPTIONAL_HANDLER() which isn't inside the
do {} while(0).

   207  
   208          free(mem);
   209  }

regards,
dan carpenter
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
