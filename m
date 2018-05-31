From: bhole_prashant_q7@lab.ntt.co.jp (Prashant Bhole)
Date: Thu, 31 May 2018 13:42:38 +0900
Subject: [PATCH bpf-next v4 3/5] selftests/bpf: test_sockmap,
 timing improvements
In-Reply-To: <20180531044240.796-1-bhole_prashant_q7@lab.ntt.co.jp>
References: <20180531044240.796-1-bhole_prashant_q7@lab.ntt.co.jp>
Message-ID: <20180531044240.796-4-bhole_prashant_q7@lab.ntt.co.jp>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180531044238.f8zZcL-OGtOUtjyyFhNc8uDehumJ5jxI2isBsC35Vjw@z>

Currently 10us delay is too low for many tests to succeed. It needs to
be increased. Also, many corked tests are expected to hit rx timeout
irrespective of timeout value.

- This patch sets 1000usec timeout value for corked tests because less
than that causes broken-pipe error in tx thread. Also sets 1 second
timeout for all other tests because less than that results in RX
timeout
- tests with apply=1 and higher number of iterations were taking lot
of time. This patch reduces test run time by reducing iterations.

real    0m12.968s
user    0m0.219s
sys     0m14.337s

Fixes: a18fda1a62c3 ("bpf: reduce runtime of test_sockmap tests")
Signed-off-by: Prashant Bhole <bhole_prashant_q7 at lab.ntt.co.jp>
---
 tools/testing/selftests/bpf/test_sockmap.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/bpf/test_sockmap.c b/tools/testing/selftests/bpf/test_sockmap.c
index 7f9ca79aadbc..5cd0550af595 100644
--- a/tools/testing/selftests/bpf/test_sockmap.c
+++ b/tools/testing/selftests/bpf/test_sockmap.c
@@ -345,8 +345,13 @@ static int msg_loop(int fd, int iov_count, int iov_length, int cnt,
 		if (err < 0)
 			perror("recv start time: ");
 		while (s->bytes_recvd < total_bytes) {
-			timeout.tv_sec = 0;
-			timeout.tv_usec = 10;
+			if (txmsg_cork) {
+				timeout.tv_sec = 0;
+				timeout.tv_usec = 1000;
+			} else {
+				timeout.tv_sec = 1;
+				timeout.tv_usec = 0;
+			}
 
 			/* FD sets */
 			FD_ZERO(&w);
@@ -1025,14 +1030,14 @@ static int test_send(struct sockmap_options *opt, int cgrp)
 
 	opt->iov_length = 1;
 	opt->iov_count = 1;
-	opt->rate = 1024;
+	opt->rate = 512;
 	err = test_exec(cgrp, opt);
 	if (err)
 		goto out;
 
 	opt->iov_length = 256;
 	opt->iov_count = 1024;
-	opt->rate = 10;
+	opt->rate = 2;
 	err = test_exec(cgrp, opt);
 	if (err)
 		goto out;
-- 
2.17.0


--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
