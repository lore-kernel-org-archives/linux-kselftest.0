From: dan.carpenter@oracle.com (Dan Carpenter)
Date: Tue, 8 Jan 2019 23:17:27 +0300
Subject: [bug report] selftests: add seccomp suite
In-Reply-To: <20180807115718.mqnrnp2aag4tkpqi@kili.mountain>
References: <20180807115718.mqnrnp2aag4tkpqi@kili.mountain>
Message-ID: <20190108201727.GH3253@kadam>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190108201727.zfBH2afEQ3cKH7ntxsdiRYhELxiInLtuC7X0MLr5PB8@z>

Hopefully everyone had a happy new year.  :)  This warning is still
present.

regards,
dan carpenter

On Tue, Aug 07, 2018@02:57:18PM +0300, Dan Carpenter wrote:
> Hello Kees Cook,
> 
> The patch c99ee51a9d97: "selftests: add seccomp suite" from Jun 16,
> 2015, leads to the following static checker warning:
> 
> 	./tools/testing/selftests/net/tls.c:206 tls_sendmsg_large()
> 	warn: curly braces intended?
> 
> ./tools/testing/selftests/net/tls.c
>    187  TEST_F(tls, sendmsg_large)
>    188  {
>    189          void *mem = malloc(16384);
>    190          size_t send_len = 16384;
>    191          size_t sends = 128;
>    192          struct msghdr msg;
>    193          size_t recvs = 0;
>    194          size_t sent = 0;
>    195  
>    196          memset(&msg, 0, sizeof(struct msghdr));
>    197          while (sent++ < sends) {
>    198                  struct iovec vec = { (void *)mem, send_len };
>    199  
>    200                  msg.msg_iov = &vec;
>    201                  msg.msg_iovlen = 1;
>    202                  EXPECT_EQ(sendmsg(self->cfd, &msg, 0), send_len);
>    203          }
>    204  
>    205          while (recvs++ < sends)
>    206                  EXPECT_NE(recv(self->fd, mem, send_len, 0), -1);
> 
> The EXPECT_NE() macro has an OPTIONAL_HANDLER() which isn't inside the
> do {} while(0).
> 
>    207  
>    208          free(mem);
>    209  }
> 
> regards,
> dan carpenter
