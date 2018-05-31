From: bhole_prashant_q7 at lab.ntt.co.jp (Prashant Bhole)
Date: Thu, 31 May 2018 13:42:36 +0900
Subject: [PATCH bpf-next v4 1/5] selftests/bpf: test_sockmap,
 check test failure
In-Reply-To: <20180531044240.796-1-bhole_prashant_q7@lab.ntt.co.jp>
References: <20180531044240.796-1-bhole_prashant_q7@lab.ntt.co.jp>
Message-ID: <20180531044240.796-2-bhole_prashant_q7@lab.ntt.co.jp>

Test failures are not identified because exit code of RX/TX threads
is not checked. Also threads are not returning correct exit code.

- Return exit code from threads depending on test execution status
- In main thread, check the exit code of RX/TX threads
- Skip error checking for corked tests as they are expected to timeout

Fixes: 16962b2404ac ("bpf: sockmap, add selftests")
Signed-off-by: Prashant Bhole <bhole_prashant_q7 at lab.ntt.co.jp>
---
 tools/testing/selftests/bpf/test_sockmap.c | 27 +++++++++++++++++-----
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/bpf/test_sockmap.c b/tools/testing/selftests/bpf/test_sockmap.c
index eb17fae458e6..7b2008a144cb 100644
--- a/tools/testing/selftests/bpf/test_sockmap.c
+++ b/tools/testing/selftests/bpf/test_sockmap.c
@@ -429,8 +429,8 @@ static int sendmsg_test(struct sockmap_options *opt)
 	struct msg_stats s = {0};
 	int iov_count = opt->iov_count;
 	int iov_buf = opt->iov_length;
+	int rx_status, tx_status;
 	int cnt = opt->rate;
-	int status;
 
 	errno = 0;
 
@@ -442,7 +442,7 @@ static int sendmsg_test(struct sockmap_options *opt)
 	rxpid = fork();
 	if (rxpid == 0) {
 		if (opt->drop_expected)
-			exit(1);
+			exit(0);
 
 		if (opt->sendpage)
 			iov_count = 1;
@@ -463,7 +463,9 @@ static int sendmsg_test(struct sockmap_options *opt)
 				"rx_sendmsg: TX: %zuB %fB/s %fGB/s RX: %zuB %fB/s %fGB/s\n",
 				s.bytes_sent, sent_Bps, sent_Bps/giga,
 				s.bytes_recvd, recvd_Bps, recvd_Bps/giga);
-		exit(1);
+		if (err && txmsg_cork)
+			err = 0;
+		exit(err ? 1 : 0);
 	} else if (rxpid == -1) {
 		perror("msg_loop_rx: ");
 		return errno;
@@ -491,14 +493,27 @@ static int sendmsg_test(struct sockmap_options *opt)
 				"tx_sendmsg: TX: %zuB %fB/s %f GB/s RX: %zuB %fB/s %fGB/s\n",
 				s.bytes_sent, sent_Bps, sent_Bps/giga,
 				s.bytes_recvd, recvd_Bps, recvd_Bps/giga);
-		exit(1);
+		exit(err ? 1 : 0);
 	} else if (txpid == -1) {
 		perror("msg_loop_tx: ");
 		return errno;
 	}
 
-	assert(waitpid(rxpid, &status, 0) == rxpid);
-	assert(waitpid(txpid, &status, 0) == txpid);
+	assert(waitpid(rxpid, &rx_status, 0) == rxpid);
+	assert(waitpid(txpid, &tx_status, 0) == txpid);
+	if (WIFEXITED(rx_status)) {
+		err = WEXITSTATUS(rx_status);
+		if (err) {
+			fprintf(stderr, "rx thread exited with err %d. ", err);
+			goto out;
+		}
+	}
+	if (WIFEXITED(tx_status)) {
+		err = WEXITSTATUS(tx_status);
+		if (err)
+			fprintf(stderr, "tx thread exited with err %d. ", err);
+	}
+out:
 	return err;
 }
 
-- 
2.17.0


--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
