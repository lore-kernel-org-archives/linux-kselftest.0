Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE79556E052;
	Wed, 14 Oct 2026 18:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792002541; cv=none; b=kZ7tQNFFqRbbhopSPZXQUK4YGPPBfB6ovhlPty8SnmeI3a3mYfN7oS8mIttN4PsZ4ur1Y4gapbVVt/Lecqy4AgmSG8tM6g1J0DyhOyMlzwaVDgLFHQotT3wBDYiARslphh5dizMGjsq9sQq8ZZDzxeL4tZnBXN0UU2OVP5/X/VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792002541; c=relaxed/simple;
	bh=78Z8/4OGtTSSgFQW8yOyyyrOmUsT9sMsyDl389sQ5WE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=migy5jJxJscGf2taCZd8QNJPk98NAtV2QjKah53f6RL2Oz4jONbcoTq5uTKSKAT8iRT95nJtUK4j1pDg/cDCZFCqfgBeZhWKQEshwi61EQ816RftE8tBRAdKUDe7I24UWUUPo+939uoRfwWCLj9GR7ggYwD1A2+Tc2EMTyCohiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MbStaw+U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MbStaw+U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED1751F000C6;
	Wed, 14 Oct 2026 18:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792002538;
	bh=jw8eOMJT0PO00iCG8j19BieCP71AeNu1dzFnwJ6S190=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=MbStaw+UwAIuPFgnas1vtJJodl+tIQdyVwbOECSrmcj7caHha6Unn3Dmhg/LfUPLV
	 ajziiUQ7ApgZoGRYvaTVqShKrLQsM31pFHhEAVHpXZ8JTsaNaFj0l7/LXmjiQnnDyF
	 L7lZzzDhzUzvIQ8a2lhS/yY8ffXrm9NhuEUuSiqhd6IPOg1iwk0OvXffix156EkGvX
	 qxGhYlt/YKeDPaxn2RAvOF4vo12g8ZX+8gSrWbaAB+BQRBvTuz/OzjxqxHFmzDsgzu
	 C5HA2F8SwDXY29h4b9jmpViIHNm7IblVgDpyD9H63ZNJFZwwVGnKle6ex8ETmFfQYp
	 vKfbs/CwzSLuw==
From: Chuck Lever <cel@kernel.org>
Date: Wed, 14 Oct 2026 14:28:38 -0400
Subject: [PATCH net-next v5 08/10] selftests: tls: Extend coverage for
 zero-length records
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-tls-follow-on-v5-8-e76c301d4f05@kernel.org>
References: <20261014-tls-follow-on-v5-0-e76c301d4f05@kernel.org>
In-Reply-To: <20261014-tls-follow-on-v5-0-e76c301d4f05@kernel.org>
To: John Fastabend <john.fastabend@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>, 
 "David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Chuck Lever <cel@kernel.org>, 
 Dave Watson <davejwatson@fb.com>, Shuah Khan <shuah@kernel.org>, 
 Qingfang Deng <qingfang.deng@linux.dev>, Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailer: b4 0.17-dev-9c833
X-Developer-Signature: v=1; a=openpgp-sha256; l=8342; i=cel@kernel.org;
 h=from:subject:message-id; bh=78Z8/4OGtTSSgFQW8yOyyyrOmUsT9sMsyDl389sQ5WE=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBqz8ndETJoafy05RLTXNgaO+okbW7oU6pSth99F
 Lp+lgwskPaJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCas/J3QAKCRAzarMzb2Z/
 l/3qD/9ABNa20uLgFctzXEHdOo3Y8iwJ7m2yRcxnePQJwEyemKbDi2FpfuHZtPLtDMHY3jso38Y
 8ymTT460KoBPUs99O0DIxPNWCKoDc5UH9j3QQ/E3sgRxkFsUKiarthRrW7sb2+f8uhrIFSez5El
 yvzSKb7qmY6HqoIjjZB4fRMo14uhp07YWyOxVRNjcUipROIfntLKhcG+Py5q0RBd8mqw41Shgbc
 o7JQeEWbOOdr2Iv1AwcrZ/SLM/ibcjn9hjSg/SI1qrYPp9V9I2nhuA3KZiDbYdF1KFSfa3TTDxF
 LCo3vapIz26SpTAHJ9hpZdtbDlV3DlkJrPv1psNeVi5QHCb/FKpTmyms86TrFGO3uGrguhVTbKc
 ldRSGCixxhd50a3mFjGXvQMNDl/xxn2aOo+OemFeObd2OezQlK+NfKN9aLQ3kFANCjtsvym5LDp
 ZeRUIrtE8sUwN1TazFSbdBN0R9KcKvKByQVd+oOC8186n0P3owMhHRO8AeSwQhjVWT1iGlMEcZW
 OIpZf9ttg/x/lLTNsHWbRHBKELvxP5GU1g0LvUuyhW87ZxX4gJwUBQfyDbqmmkRr1n4alc2/ITB
 szxl8eWBYpiILHaIj553f4Atx79IK12U9GqU5IIhqduL7ynxkzkiTEIUGGi2zAJK3Zy34z3Lo2B
 ftTjv7DS6hKnYqQ==
X-Developer-Key: i=cel@kernel.org; a=openpgp;
 fpr=28B2E5B01286DF243CF23EFE336AB3336F667F97

The zero_len fixture injects raw pre-encrypted records over a
socket carrying a TLS_RX key only, and some of those records are
zero-length application_data records. Every variant reads the
records back with a plain recv(), so neither splice nor MSG_PEEK is
tested against an empty record. No variant places an empty record
between two data records, the one sequence where returning copied
data ahead of a run of empty records changes what recv() reports.

Add zero_len_splice and zero_len_peek. A zero return from splice()
means EOF, so zero_len_splice checks that a run of empty data
records does not end a live connection. zero_len_peek checks that a
peek reaches the payload behind a run of empty records and leaves
the payload in place for the read that follows. When a payload does
not follow the run, the peek must leave the socket unreadable. An
unfixed kernel returns 0 from splice(), and after the peek poll()
reports the socket readable.

Add data_0data_data to zero_len. The first recv() returns the first
record alone and leaves the second for the next call. A kernel that
reads through the empty record returns both payloads from the first
call and fails the variant.

Signed-off-by: Chuck Lever <cel@kernel.org>
---
 tools/testing/selftests/net/tls.c | 232 +++++++++++++++++++++++++++++++++++---
 1 file changed, 215 insertions(+), 17 deletions(-)

diff --git a/tools/testing/selftests/net/tls.c b/tools/testing/selftests/net/tls.c
index 0bc43728262e..8ce5a9032960 100644
--- a/tools/testing/selftests/net/tls.c
+++ b/tools/testing/selftests/net/tls.c
@@ -2549,6 +2549,42 @@ static const struct raw_rec id2_data_l0 = {
 	},
 };
 
+static void zero_len_sock_pair(struct __test_metadata *_metadata,
+			       int *fd, int *cfd, bool *notls)
+{
+	struct tls_crypto_info_keys tls12;
+	int ret;
+
+	tls_crypto_info_init(TLS_1_2_VERSION, TLS_CIPHER_AES_CCM_128,
+			     &tls12, 0);
+
+	ulp_sock_pair(_metadata, fd, cfd, notls);
+	if (*notls)
+		return;
+
+	/* fd stays keyless; these fixtures send raw records over it */
+	ret = setsockopt(*cfd, SOL_TLS, TLS_RX, &tls12, tls12.len);
+	ASSERT_EQ(ret, 0);
+}
+
+/* Send a variant's records; return the last one carrying payload */
+static const struct raw_rec *
+zero_len_send_recs(struct __test_metadata *_metadata, int fd,
+		   const struct raw_rec *const *recs)
+{
+	const struct raw_rec *payload = NULL;
+	int i;
+
+	for (i = 0; i < 4 && recs[i]; i++) {
+		EXPECT_EQ(send(fd, recs[i]->cipher_data, recs[i]->cipher_len, 0),
+			  recs[i]->cipher_len);
+		if (recs[i]->plain_len)
+			payload = recs[i];
+	}
+
+	return payload;
+}
+
 FIXTURE(zero_len)
 {
 	int fd, cfd;
@@ -2609,21 +2645,15 @@ FIXTURE_VARIANT_ADD(zero_len, data_0data_0data)
 	.recv_ret = { 11, -EAGAIN, },
 };
 
+FIXTURE_VARIANT_ADD(zero_len, data_0data_data)
+{
+	.recs = { &id0_data_l11, &id1_data_l0, &id2_data_l11, },
+	.recv_ret = { 11, 11, -EAGAIN, },
+};
+
 FIXTURE_SETUP(zero_len)
 {
-	struct tls_crypto_info_keys tls12;
-	int ret;
-
-	tls_crypto_info_init(TLS_1_2_VERSION, TLS_CIPHER_AES_CCM_128,
-			     &tls12, 0);
-
-	ulp_sock_pair(_metadata, &self->fd, &self->cfd, &self->notls);
-	if (self->notls)
-		return;
-
-	/* Don't install keys on fd, we'll send raw records */
-	ret = setsockopt(self->cfd, SOL_TLS, TLS_RX, &tls12, tls12.len);
-	ASSERT_EQ(ret, 0);
+	zero_len_sock_pair(_metadata, &self->fd, &self->cfd, &self->notls);
 }
 
 FIXTURE_TEARDOWN(zero_len)
@@ -2642,10 +2672,7 @@ TEST_F(zero_len, test)
 	if (self->notls)
 		SKIP(return, "no TLS support");
 
-	for (i = 0; i < 4 && variant->recs[i]; i++)
-		EXPECT_EQ(send(self->fd, variant->recs[i]->cipher_data,
-			       variant->recs[i]->cipher_len, 0),
-			  variant->recs[i]->cipher_len);
+	zero_len_send_recs(_metadata, self->fd, variant->recs);
 
 	rec = &variant->recs[0];
 	rec_off = 0;
@@ -2671,6 +2698,177 @@ TEST_F(zero_len, test)
 	}
 };
 
+FIXTURE(zero_len_peek)
+{
+	int fd, cfd;
+	bool notls;
+};
+
+FIXTURE_VARIANT(zero_len_peek)
+{
+	const struct raw_rec *recs[4];
+	ssize_t peek_ret;
+};
+
+FIXTURE_VARIANT_ADD(zero_len_peek, 0data_0data_data)
+{
+	.recs = { &id0_data_l0, &id1_data_l0, &id2_data_l11, },
+	.peek_ret = 11,
+};
+
+FIXTURE_VARIANT_ADD(zero_len_peek, 0data_0data_0data)
+{
+	.recs = { &id0_data_l0, &id1_data_l0, &id2_data_l0, },
+	.peek_ret = -EAGAIN,
+};
+
+FIXTURE_SETUP(zero_len_peek)
+{
+	zero_len_sock_pair(_metadata, &self->fd, &self->cfd, &self->notls);
+}
+
+FIXTURE_TEARDOWN(zero_len_peek)
+{
+	close(self->fd);
+	close(self->cfd);
+}
+
+/* Peeking past a run of empty data records must reach the payload
+ * behind them, and a run with no payload behind it must report EAGAIN
+ * and leave no record queued.
+ */
+TEST_F(zero_len_peek, test)
+{
+	struct pollfd pfd = { .fd = self->cfd, .events = POLLIN };
+	const struct raw_rec *payload;
+	unsigned char buf[128];
+	ssize_t ret;
+
+	if (self->notls)
+		SKIP(return, "no TLS support");
+
+	payload = zero_len_send_recs(_metadata, self->fd, variant->recs);
+
+	if (variant->peek_ret < 0) {
+		ret = recv(self->cfd, buf, sizeof(buf),
+			   MSG_DONTWAIT | MSG_PEEK);
+		EXPECT_EQ(ret, -1);
+		EXPECT_EQ(errno, -variant->peek_ret);
+
+		/* A record left on rx_list keeps the socket readable */
+		EXPECT_EQ(poll(&pfd, 1, 0), 0);
+		return;
+	}
+
+	ret = recv(self->cfd, buf, sizeof(buf), MSG_DONTWAIT | MSG_PEEK);
+	EXPECT_EQ(ret, variant->peek_ret);
+	if (ret == variant->peek_ret)
+		EXPECT_EQ(memcmp(buf, payload->plain_data,
+				 variant->peek_ret), 0);
+
+	ret = recv(self->cfd, buf, sizeof(buf), MSG_DONTWAIT);
+	EXPECT_EQ(ret, variant->peek_ret);
+	if (ret == variant->peek_ret)
+		EXPECT_EQ(memcmp(buf, payload->plain_data,
+				 variant->peek_ret), 0);
+
+	ret = recv(self->cfd, buf, sizeof(buf), MSG_DONTWAIT);
+	EXPECT_EQ(ret, -1);
+	EXPECT_EQ(errno, EAGAIN);
+}
+
+FIXTURE(zero_len_splice)
+{
+	int fd, cfd;
+	bool notls;
+};
+
+FIXTURE_VARIANT(zero_len_splice)
+{
+	const struct raw_rec *recs[4];
+	ssize_t splice_ret;
+};
+
+FIXTURE_VARIANT_ADD(zero_len_splice, 0data_data)
+{
+	.recs = { &id0_data_l0, &id1_data_l11, },
+	.splice_ret = 11,
+};
+
+FIXTURE_VARIANT_ADD(zero_len_splice, 0data_0data_data)
+{
+	.recs = { &id0_data_l0, &id1_data_l0, &id2_data_l11, },
+	.splice_ret = 11,
+};
+
+FIXTURE_VARIANT_ADD(zero_len_splice, 0data_0data_0data)
+{
+	.recs = { &id0_data_l0, &id1_data_l0, &id2_data_l0, },
+	.splice_ret = -EAGAIN,
+};
+
+FIXTURE_VARIANT_ADD(zero_len_splice, 0data_0ctrl)
+{
+	.recs = { &id0_data_l0, &id1_ctrl_l0, },
+	.splice_ret = -EINVAL,
+};
+
+FIXTURE_SETUP(zero_len_splice)
+{
+	zero_len_sock_pair(_metadata, &self->fd, &self->cfd, &self->notls);
+}
+
+FIXTURE_TEARDOWN(zero_len_splice)
+{
+	close(self->fd);
+	close(self->cfd);
+}
+
+/* Splicing must skip a run of empty data records to reach the payload
+ * behind it, since a zero-byte splice reads as EOF. Splice reports
+ * EAGAIN for a run with no payload behind it, and EINVAL for a control
+ * record behind the run.
+ */
+TEST_F(zero_len_splice, test)
+{
+	struct pollfd pfd = { .fd = self->cfd, .events = POLLIN };
+	const struct raw_rec *payload;
+	unsigned char buf[128];
+	ssize_t ret;
+	int p[2];
+
+	if (self->notls)
+		SKIP(return, "no TLS support");
+
+	ASSERT_GE(pipe(p), 0);
+
+	payload = zero_len_send_recs(_metadata, self->fd, variant->recs);
+
+	if (variant->splice_ret < 0) {
+		ret = splice(self->cfd, NULL, p[1], NULL, sizeof(buf),
+			     SPLICE_F_NONBLOCK);
+		EXPECT_EQ(ret, -1);
+		EXPECT_EQ(errno, -variant->splice_ret);
+	} else {
+		/* ASSERT so a zero return stops the test here; the read
+		 * below would block until the harness timeout.
+		 */
+		ASSERT_EQ(splice(self->cfd, NULL, p[1], NULL, sizeof(buf),
+				 SPLICE_F_NONBLOCK), variant->splice_ret);
+		ret = read(p[0], buf, sizeof(buf));
+		EXPECT_EQ(ret, variant->splice_ret);
+		if (ret == variant->splice_ret)
+			EXPECT_EQ(memcmp(buf, payload->plain_data,
+					 variant->splice_ret), 0);
+
+		/* The empty records were consumed, not left queued */
+		EXPECT_EQ(poll(&pfd, 1, 0), 0);
+	}
+
+	close(p[0]);
+	close(p[1]);
+}
+
 FIXTURE(tls_err)
 {
 	int fd, cfd;

-- 
2.55.0

