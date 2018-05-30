From: bhole_prashant_q7 at lab.ntt.co.jp (Prashant Bhole)
Date: Wed, 30 May 2018 14:56:09 +0900
Subject: [PATCH bpf v3 3/5] selftests/bpf: test_sockmap, fix test timeout
In-Reply-To: <20180530055611.10216-1-bhole_prashant_q7@lab.ntt.co.jp>
References: <20180530055611.10216-1-bhole_prashant_q7@lab.ntt.co.jp>
Message-ID: <20180530055611.10216-4-bhole_prashant_q7@lab.ntt.co.jp>

In order to reduce runtime of tests, recently timout for select() call
was reduced from 1sec to 10usec. This was causing many tests failures.
It was caught with failure handling commits in this series.

Restoring the timeout from 10usec to 1sec

Fixes: a18fda1a62c3 ("bpf: reduce runtime of test_sockmap tests")
Signed-off-by: Prashant Bhole <bhole_prashant_q7 at lab.ntt.co.jp>
---
 tools/testing/selftests/bpf/test_sockmap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/test_sockmap.c b/tools/testing/selftests/bpf/test_sockmap.c
index 64f9e25c451f..9d01f5c2abe2 100644
--- a/tools/testing/selftests/bpf/test_sockmap.c
+++ b/tools/testing/selftests/bpf/test_sockmap.c
@@ -345,8 +345,8 @@ static int msg_loop(int fd, int iov_count, int iov_length, int cnt,
 		if (err < 0)
 			perror("recv start time: ");
 		while (s->bytes_recvd < total_bytes) {
-			timeout.tv_sec = 0;
-			timeout.tv_usec = 10;
+			timeout.tv_sec = 1;
+			timeout.tv_usec = 0;
 
 			/* FD sets */
 			FD_ZERO(&w);
-- 
2.17.0


--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
