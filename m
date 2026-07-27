Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697182248A0;
	Mon, 27 Jul 2026 00:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785112439; cv=none; b=VvNplYOuRXXsE7x+vDbV8WTb4Say4WHLmBIZT4mTs19APv7jK+S4scXErHE9LrKBlz5HAeLc4CiEgabsNOOb7x99+VHKVE6cnqSnWNIFj1TtXpxQvauno4ITOaQIwEtKkKHi4h+2TAw4XkkVUHMLIT+KrmR2RUkTuFOD75Inyrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785112439; c=relaxed/simple;
	bh=ekd0UPDFYyfd2fgXSkSYzWqvvSN4Pdvo4U+SMTwgK2U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n9BeeRVeFbZFL/v6IlumnTcnAyhrg880pQYc0Tcetlia/gQ5JiEYDLWKzV4BkYtu+TPy9aPuAt4g97KqzqJ0TrksajjikSa3bkl/TdxcWAmuCU7BPcaUlziNVzvhunsv0Qc94+Q9UsukZibihrEJ+kumFilYYQGmL1HxoIpcgjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aXHCX+dm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aXHCX+dm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 687731F00A3E;
	Mon, 27 Jul 2026 00:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785112437;
	bh=kUN2qEqBVauu2435e4/0nZVZk4IpgraeVh8z6IiIeYQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=aXHCX+dmLew+6VD4LEH0FBLBSKsG2sR8VZ7Ppfl+UVADIWSFcmjbBNyYmcG/9xvKk
	 vZ+/kVPNQegEoWkLsGuirM62VWuORIn8c4te2PW6bTOAPBUpDw53ZigTTHZoT5oxxp
	 xpoe/fvnZU1JxiE/uowAlQrX8ywPaTnFkLz2pO6aeX2mDw0GtuOY+J/pdShgU9tbZi
	 oZ5lhXwAmkZVe9LSVY9UbbzRGojUr94Mp74KcNbYSdDXD0R7DtWHyNeV1HnnXb3Npu
	 7MIFvAnxM16luYrN1mAYW/zAKp63gtycND5DhMGQwvUb7bEiZr3XKFABnXlu5gLLTW
	 t1v8aDFUJ+Z0w==
From: Chuck Lever <cel@kernel.org>
Date: Sun, 26 Jul 2026 20:33:37 -0400
Subject: [PATCH net 9/9] selftests: tls: cover splice after a failed
 decrypt
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-tls-follow-on-v1-9-99bf4cc1c729@kernel.org>
References: <20260726-tls-follow-on-v1-0-99bf4cc1c729@kernel.org>
In-Reply-To: <20260726-tls-follow-on-v1-0-99bf4cc1c729@kernel.org>
To: John Fastabend <john.fastabend@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Chuck Lever <cel@kernel.org>, Dave Watson <davejwatson@fb.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailer: b4 0.16-dev-da966
X-Developer-Signature: v=1; a=openpgp-sha256; l=4752; i=cel@kernel.org;
 h=from:subject:message-id; bh=ekd0UPDFYyfd2fgXSkSYzWqvvSN4Pdvo4U+SMTwgK2U=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBqZqdqckQ+gymUd2QSbCG361mtpo22REvb7sXpn
 IO2tCbV3GaJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCamanagAKCRAzarMzb2Z/
 l0WjEACoPdu/51X4KAigYzO6HbCPSEa1jUCw659wqg5BwDPdJjyuEaY5ZPdqjmyS1eWeyXNOHLp
 pbrl3pXuLvcO51Zh4tgsrcDx3YP2EsideZdvxykUBxUR54OWlQ7t9NLexpugw7Qd+QYILetbVbK
 IHdZi7pFtU1r3KOMIoZdbVVO44NhllWtA8ST7+HpwJ+O4sJ1n3FIkNDvNvEAlx9TPApRTsv68eg
 OAzKbFPPT5u/BoLlurGjDDbJaI4WA8o47+Br8BJQMauBYyqb3Y1qEWCh69ho5N30cecWkrrIvyo
 m6SFUoDR9vr1favdvfPqyPfdy0yPAnAZqr0xWzRfoZoHbtMUCWmduyGCAdUa8LCvl4bEpM5RNsK
 whfk2g+Gy9pV9Fy4FvfiF/Chfh0CUfH2CABdXFZIg/a+M9WKEYPBPMpqONE+vpA6L2sL1IM2nJo
 GPyZwVGy7o+zBgUR7hLWPQYQry1vzGD9LXmpmg89akqYvS5EtbuSaaASg0C94fGA4Be5nknM7Rj
 76tc1vSu8Rtm87n8NeJxYwKKgEPtaQD2b5AMsqystR88A1ooDVGKsYvBXZwvBt0HcqNjHKd8MjR
 BkL9HfhyGpxeJ32w0LXBR5Vw4SqptHWLX+E7nwqqeEmzXz4Emm55j6aBBj/juJ1Ub+hCDHzxScX
 DjCbvvp8CazMQEw==
X-Developer-Key: i=cel@kernel.org; a=openpgp;
 fpr=28B2E5B01286DF243CF23EFE336AB3336F667F97

Nothing in this file splices a socket whose last decrypt failed, so
the check that fails tls_sw_splice_read() on a broken connection can
be removed without a test noticing. Such a splice hands the
application plaintext that recvmsg() and read_sock() already refuse
to return.

Extend the bad_auth pattern: corrupt an authenticated record, confirm
recvmsg() reports EBADMSG, then splice the same socket and require
EBADMSG again. A synchronous decrypt fails again on the still-queued
record, so only an asynchronous decrypt, which needs TLS 1.2 and an
AEAD advertising CRYPTO_ALG_ASYNC, reaches EBADMSG solely through the
recorded-failure check.

bad_auth builds the same corrupted record, so its construction moves
into a helper the two tests share.

Signed-off-by: Chuck Lever <cel@kernel.org>
---
 tools/testing/selftests/net/tls.c | 77 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 67 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/net/tls.c b/tools/testing/selftests/net/tls.c
index 7c178541edf4..8b68dbfcc592 100644
--- a/tools/testing/selftests/net/tls.c
+++ b/tools/testing/selftests/net/tls.c
@@ -24,6 +24,7 @@
 #include "kselftest_harness.h"
 
 #define TLS_PAYLOAD_MAX_LEN 16384
+#define TLS_HDR_LEN 5
 #define SOL_TLS 282
 
 static int fips_enabled;
@@ -2883,28 +2884,85 @@ TEST_F(tls_err, bad_rec)
 	EXPECT_EQ(errno, EAGAIN);
 }
 
+/* Encrypt a record on the TX-only socket pair, corrupt its last
+ * byte, and hand the result to the socket under test. cfd carries a
+ * byte stream, so one recv() can return part of a record: take the
+ * fragment length from the record header and wait for the remainder.
+ */
+static void tls_send_bad_auth(struct __test_metadata *_metadata,
+			      int fd, int cfd, int fd2)
+{
+	char buf[128];
+	int len;
+
+	memrnd(buf, sizeof(buf) / 2);
+	ASSERT_EQ(send(fd, buf, sizeof(buf) / 2, 0), sizeof(buf) / 2);
+
+	ASSERT_EQ(recv(cfd, buf, TLS_HDR_LEN, MSG_WAITALL), TLS_HDR_LEN);
+
+	len = ((unsigned char)buf[3] << 8) | (unsigned char)buf[4];
+	ASSERT_GT(len, 0);
+	ASSERT_LE(len, (int)sizeof(buf) - TLS_HDR_LEN);
+
+	ASSERT_EQ(recv(cfd, buf + TLS_HDR_LEN, len, MSG_WAITALL), len);
+
+	buf[TLS_HDR_LEN + len - 1]++;
+
+	ASSERT_EQ(send(fd2, buf, TLS_HDR_LEN + len, 0), TLS_HDR_LEN + len);
+}
+
 TEST_F(tls_err, bad_auth)
 {
 	char buf[128];
-	int n;
 
 	if (self->notls)
 		SKIP(return, "no TLS support");
 
-	memrnd(buf, sizeof(buf) / 2);
-	EXPECT_EQ(send(self->fd, buf, sizeof(buf) / 2, 0), sizeof(buf) / 2);
-	n = recv(self->cfd, buf, sizeof(buf), 0);
-	EXPECT_GT(n, sizeof(buf) / 2);
+	tls_send_bad_auth(_metadata, self->fd, self->cfd, self->fd2);
 
-	buf[n - 1]++;
-
-	EXPECT_EQ(send(self->fd2, buf, n, 0), n);
 	EXPECT_EQ(recv(self->cfd2, buf, sizeof(buf), 0), -1);
 	EXPECT_EQ(errno, EBADMSG);
 	EXPECT_EQ(recv(self->cfd2, buf, sizeof(buf), 0), -1);
 	EXPECT_EQ(errno, EBADMSG);
 }
 
+/* A record that did not authenticate breaks the connection for every
+ * reader, splice included.
+ *
+ * The two decrypt paths reach that result differently. A synchronous
+ * decrypt leaves the record parsed, so the splice re-runs the decrypt
+ * and fails on the record itself; the ctx->async_wait.err check in
+ * tls_sw_splice_read() is not what stops it. Only an asynchronous
+ * decrypt, which needs a TLS 1.2 socket and an AEAD advertising
+ * CRYPTO_ALG_ASYNC, consumes the record before the failure is
+ * recorded, leaving that check the sole reason the splice fails.
+ */
+TEST_F(tls_err, bad_auth_splice)
+{
+	char buf[128];
+	ssize_t ret;
+	int p[2];
+
+	if (self->notls)
+		SKIP(return, "no TLS support");
+
+	tls_send_bad_auth(_metadata, self->fd, self->cfd, self->fd2);
+
+	EXPECT_EQ(recv(self->cfd2, buf, sizeof(buf), 0), -1);
+	EXPECT_EQ(errno, EBADMSG);
+
+	ASSERT_GE(pipe(p), 0);
+
+	ret = splice(self->cfd2, NULL, p[1], NULL, sizeof(buf),
+		     SPLICE_F_NONBLOCK);
+	EXPECT_EQ(ret, -1);
+	if (ret == -1)
+		EXPECT_EQ(errno, EBADMSG);
+
+	close(p[0]);
+	close(p[1]);
+}
+
 TEST_F(tls_err, bad_in_large_read)
 {
 	char txt[3][64];
@@ -3160,7 +3218,6 @@ static size_t parse_tls_records(struct __test_metadata *_metadata,
 {
 	const __u8 *rec = rx_buf;
 	size_t total_plaintext_rx = 0;
-	const __u8 rec_header_len = 5;
 
 	while (rec < rx_buf + rx_len) {
 		__u16 record_payload_len;
@@ -3180,7 +3237,7 @@ static size_t parse_tls_records(struct __test_metadata *_metadata,
 
 		/* Plaintext must not exceed the specified limit */
 		ASSERT_LE(plaintext_len, max_payload_len);
-		rec += rec_header_len + record_payload_len;
+		rec += TLS_HDR_LEN + record_payload_len;
 	}
 
 	return total_plaintext_rx;

-- 
2.54.0

