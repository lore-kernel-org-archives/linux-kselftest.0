Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A201524BBEB;
	Fri,  7 Aug 2026 00:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786063462; cv=none; b=c6x3TbtVusWVtstoWLMyaobVQ4HeGJqzu36DvsbVdj7TI7k38qdKo6p7iYaaJ2OAo1XV7k7wLE14mrC9LxTnMtndyLj3yoUTE9nMfK1jJeSmTP1wfK8rP0zduHShhM1pjQ+mqei6cshVNZEvTHW8TELCEolmnhD9sLVkZem4AMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786063462; c=relaxed/simple;
	bh=diDfx9CY5qqZjzw/PWn4z/sy4AeRV2lOKdlZaBCioOQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B+uwrb+e88LhbwwoHC/PWBU6C2DEDmOLFblFlzX0+9jd97Rbl/k2BoFbSoR+YEs4Go0/d51I+VtfIGcZW3Ibx7hHuUBLBqiRFc4d9XpCJfvL75A/Lo6m3hkzdTyNxhWxKXuhWmBpBve2oB2Ik8zG1Yqtvnpy1AT2rU6dFjAzVHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HlIzDS45; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HlIzDS45"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F0791F00A3A;
	Fri,  7 Aug 2026 00:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786063460;
	bh=n6RqouRsqmNA2+Fx2ZooauUKUTtvMf6N/rExkNV7EbU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=HlIzDS456hP9qcUcvdex32ndePO9XkwMo97MdMokvJgRiyN/nnr0dukk5ne4Fb3cJ
	 ByrEfHgwawCc1EQA4xHCWo24psOYUQKLGI+HNwD+6wM9+VMUd1kwLVCfcC2MCJY4MY
	 lsscriF6gT6mm0GE0iTD/0RN0ppYkg0wGQ78Fbj4BshoDYilc1EeWM7u/3y/w5Rpsj
	 IQf6XLayHg+3K111REu42LBbMX0HXW9d2QB3VCZZzOCOf+sjqjhpbp597U+7jSGpOM
	 LM9f1EP9buTE3+8XjKkDHKGUQsN3QE7xbLzjpr7gLSXkI4Cw6f0lCjbnFUsSHinjBJ
	 h+GmHBVSxCEcA==
From: Chuck Lever <cel@kernel.org>
Date: Thu, 06 Aug 2026 20:44:08 -0400
Subject: [PATCH net 2/2] selftests: tls: cover splice after a failed
 decrypt
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-tls-splice-crypto-fix-v1-2-a2624005a286@kernel.org>
References: <20260806-tls-splice-crypto-fix-v1-0-a2624005a286@kernel.org>
In-Reply-To: <20260806-tls-splice-crypto-fix-v1-0-a2624005a286@kernel.org>
To: John Fastabend <john.fastabend@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Chuck Lever <cel@kernel.org>
X-Mailer: b4 0.16-dev-da966
X-Developer-Signature: v=1; a=openpgp-sha256; l=4542; i=cel@kernel.org;
 h=from:subject:message-id; bh=diDfx9CY5qqZjzw/PWn4z/sy4AeRV2lOKdlZaBCioOQ=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBqdSphjRU7PGofo1B7PNCAfIyY9GeQVN7+grxHy
 N3Ds1FpClaJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCanUqYQAKCRAzarMzb2Z/
 l1l2EACPzipUDRkHliXZxXtbF/jpsnyX5M4a/rrV0eLJCLEMfK3JLy7ZV/DMwkF0Fmro719f1yc
 1UUrSxqYGoD5f0MTpPo8IyDbWH58E8UMkKiC7cFIenBd7JNxbIjiPuaZhXpmkTEFg+S9ZMUeQIB
 soOhRd8atzT0XrJEhBRIL3s2W4L4J1YrZFr4mlMMxbmLog2UoO2/cnsu17S7XgJfrRtITwDatlr
 v6wu+AauOWJ4Wf3GdoW4yfH+O/YDRnGGZyYFVw68R/gm3VOgMpgjC7nRFBp+wFLJTsYAIEAPzMG
 7YAx/N4eiWr5MwG30ZTcnC+4zQtrLxTKC+PsMAgrrCHfQGqZqfrBPlYQY/s7VrINfEVEAsF9F1v
 2OwUrYHRFEy8Rvczmd3NVFyVbi60gOk/ica8MMuOhNCKl7D2wp1/weql61uFyAp2E5vgSoHL03W
 HAbXupQBzi7Ed5CbJqPk4XBJcgymkR73FSnvPftygcZ9oyXS+kJJDzzXIzQnY121275hybhzG3p
 ncedQvoKZ1YhkI79wPHDxnMQ9p0h0oUzVa8rlNShzXuVmj6Uf7m22Kovt/tkzlHXl5hKALXzNzE
 /O10CjdEGcFM9lkpjJsstosYBJKK7z8EN3lhYyFIrFxvOo5wMmfPMoCsDqXPG5u1MYH3KKqZUys
 gxkensG+NJxlljg==
X-Developer-Key: i=cel@kernel.org; a=openpgp;
 fpr=28B2E5B01286DF243CF23EFE336AB3336F667F97

Nothing in this file splices a socket whose last decrypt failed, so
the check that fails tls_sw_splice_read() on a broken connection can
be removed without a test noticing. Such a splice hands the
application plaintext that recvmsg() and read_sock() already refuse
to return.

Extend the bad_auth pattern. Corrupt an authenticated record, confirm
recvmsg() reports EBADMSG, then splice the same socket and require
EBADMSG again. A synchronous decrypt fails again on the still-queued
record, so only an async decrypt reaches EBADMSG through the
recorded-failure check alone.

bad_auth builds the same corrupted record, so its construction moves
into a helper the two tests share.

Signed-off-by: Chuck Lever <cel@kernel.org>
---
 tools/testing/selftests/net/tls.c | 75 +++++++++++++++++++++++++++++++++------
 1 file changed, 65 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/net/tls.c b/tools/testing/selftests/net/tls.c
index a0e72e402748..9d3cd4fff062 100644
--- a/tools/testing/selftests/net/tls.c
+++ b/tools/testing/selftests/net/tls.c
@@ -24,6 +24,7 @@
 #include "kselftest_harness.h"
 
 #define TLS_PAYLOAD_MAX_LEN 16384
+#define TLS_HDR_LEN 5
 #define SOL_TLS 282
 
 static int fips_enabled;
@@ -2732,28 +2733,83 @@ TEST_F(tls_err, bad_rec)
 	EXPECT_EQ(errno, EAGAIN);
 }
 
+/* cfd carries a byte stream, so one recv() can return part of a
+ * record. Take the fragment length from the record header and wait
+ * for the remainder.
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
+	EXPECT_EQ(errno, EBADMSG);
+
+	close(p[0]);
+	close(p[1]);
+}
+
 TEST_F(tls_err, bad_in_large_read)
 {
 	char txt[3][64];
@@ -3009,7 +3065,6 @@ static size_t parse_tls_records(struct __test_metadata *_metadata,
 {
 	const __u8 *rec = rx_buf;
 	size_t total_plaintext_rx = 0;
-	const __u8 rec_header_len = 5;
 
 	while (rec < rx_buf + rx_len) {
 		__u16 record_payload_len;
@@ -3029,7 +3084,7 @@ static size_t parse_tls_records(struct __test_metadata *_metadata,
 
 		/* Plaintext must not exceed the specified limit */
 		ASSERT_LE(plaintext_len, max_payload_len);
-		rec += rec_header_len + record_payload_len;
+		rec += TLS_HDR_LEN + record_payload_len;
 	}
 
 	return total_plaintext_rx;

-- 
2.54.0

