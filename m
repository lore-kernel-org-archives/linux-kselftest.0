From: bhole_prashant_q7@lab.ntt.co.jp (Prashant Bhole)
Date: Thu, 31 May 2018 13:42:39 +0900
Subject: [PATCH bpf-next v4 4/5] selftests/bpf: test_sockmap,
 fix data verification
In-Reply-To: <20180531044240.796-1-bhole_prashant_q7@lab.ntt.co.jp>
References: <20180531044240.796-1-bhole_prashant_q7@lab.ntt.co.jp>
Message-ID: <20180531044240.796-5-bhole_prashant_q7@lab.ntt.co.jp>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180531044239.aBqsMfbGPOTK7xCA-oBl9g-yfFzzILquSb3mdPYN3oA@z>

When data verification is enabled, some tests fail because verification is done
incorrectly. Following changes fix it.

- Identify the size of data block to be verified
- Reset verification counter when data block size is reached
- Fixed the value printed in case of verfication failure

Fixes: 16962b2404ac ("bpf: sockmap, add selftests")
Acked-by: John Fastabend <john.fastabend at gmail.com>
Signed-off-by: Prashant Bhole <bhole_prashant_q7 at lab.ntt.co.jp>
---
 tools/testing/selftests/bpf/test_sockmap.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/test_sockmap.c b/tools/testing/selftests/bpf/test_sockmap.c
index 5cd0550af595..2bc70e1ab2eb 100644
--- a/tools/testing/selftests/bpf/test_sockmap.c
+++ b/tools/testing/selftests/bpf/test_sockmap.c
@@ -337,8 +337,15 @@ static int msg_loop(int fd, int iov_count, int iov_length, int cnt,
 		int fd_flags = O_NONBLOCK;
 		struct timeval timeout;
 		float total_bytes;
+		int bytes_cnt = 0;
+		int chunk_sz;
 		fd_set w;
 
+		if (opt->sendpage)
+			chunk_sz = iov_length * cnt;
+		else
+			chunk_sz = iov_length * iov_count;
+
 		fcntl(fd, fd_flags);
 		total_bytes = (float)iov_count * (float)iov_length * (float)cnt;
 		err = clock_gettime(CLOCK_MONOTONIC, &s->start);
@@ -393,9 +400,14 @@ static int msg_loop(int fd, int iov_count, int iov_length, int cnt,
 							errno = -EIO;
 							fprintf(stderr,
 								"detected data corruption @iov[%i]:%i %02x != %02x, %02x ?= %02x\n",
-								i, j, d[j], k - 1, d[j+1], k + 1);
+								i, j, d[j], k - 1, d[j+1], k);
 							goto out_errno;
 						}
+						bytes_cnt++;
+						if (bytes_cnt == chunk_sz) {
+							k = 0;
+							bytes_cnt = 0;
+						}
 						recv--;
 					}
 				}
-- 
2.17.0


--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
