Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D471607A4;
	Mon, 27 Jul 2026 00:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785112436; cv=none; b=cV1xDqHv7RiBpE2v+Xr4EegKqT1mui+e65ZM8G9cd8Zthf1fKkk9Ot6kiylhZHQf45ybht7c+Tkk9lD+YgrNAKeC3zdFceBaQDP0y+XWPao096n4nQfpGqmsykVCOxRCrynE+Z1bVJOgahQ7CQqKllxehNC90Knqe9RHuKOi4So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785112436; c=relaxed/simple;
	bh=Z96cexxdSqQr6NGoYNBE6xGrBLnuFCth2MyWMHCOZ/E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NzB+PPblXSl1J2bf1hwULIJh63rLTglWmEC6E2QZLjAPBfxito8ogqigmOGB7ab4+76i9lemP6ILckEQFOJ/Mq6fB574ni1lRdTeyjeF+sqQK4XS6lblP0ujPiSGXexQZ16UTdHegjhThboFZnJe0uc6Tbl3Diz5KOz3w2GGbmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UcP19Ydn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UcP19Ydn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 124D61F00A3A;
	Mon, 27 Jul 2026 00:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785112434;
	bh=oEpZiCGogfrAw6Gwjnl7SAKCo+lxApq8W6cKzd9Yd9c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=UcP19YdnyusZI0YehaQPFvGvY0vBLQrj/qJnYUqwbmIYf4b0P+td/utzxJk0RDErS
	 49CtpbiJDGlGfY2AbUXT68RgqMxf9LRFRYr3avjnLi+SNQWdjTxwPtZ0VehsInzabI
	 d12Swh6BOAsak85nXPUEW6GDhfTxmbXcCBKKE4yhqC0RcrxuCh+p1z5njmsS8Tunxr
	 Y4RNUDiYVYA/3QOAeEaQ872iCnwTOeh/EzmDoa81z8gBcrsFfv9ggFTRO5HDYv5uJh
	 CeYgU7O7aykdQtkA3LhzOoia7kl+EUZb9z4X0wGFMNqzSFFT9v+5HrqWaW3BQWheiK
	 95qfR+ro+N53g==
From: Chuck Lever <cel@kernel.org>
Date: Sun, 26 Jul 2026 20:33:34 -0400
Subject: [PATCH net 6/9] selftests: tls: add peek and splice coverage for
 zero-length records
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-tls-follow-on-v1-6-99bf4cc1c729@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7026; i=cel@kernel.org;
 h=from:subject:message-id; bh=Z96cexxdSqQr6NGoYNBE6xGrBLnuFCth2MyWMHCOZ/E=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBqZqdpa5z69NZBBlupJojelrqIBF/+InLPCsc+i
 sEfTOjvGU+JAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCamanaQAKCRAzarMzb2Z/
 l+G3D/4/ouP0XgB7Uc54o08JJmT8fUnOCJ2owBYUBJcqmmhMMfLW46E4Ibm25ezKgHDv68G72Bw
 n97eILrA77EWWuH+zTfFI/CmkqEkTSnKxHDipXYl0BOSmw1p2tqq/XwzfhrkQtbKM5CySjV6UFv
 ngtoZXxDexkh49T+iwVZP2Kdo8iDEJjwhy62DQ6ljdCh0qr8FcIxYxkGD2Jkta1WyJiQ9ZzyIBH
 1e1t81x2U6+3A+rw3Zm0HfgSsny4WA05k+FILxUcGCuA4frAiIjGnc0CGXsCYCCyNzFK4kxthap
 L+hMAbzT/MtdCILqH7OHObke02ZvBQUAgCHeVXeLjuFbyRNMzCLCzL3ItOwkN9U9sVe/Ss/HKvx
 DBkuwV0LDnRqO5RnVnGxHh+9GOggwAx1yY1Ib9Cz+0NXaD8z13qKpBAQCUAMRVfIZYd0MGnjcWL
 xqsMbPBHzwbXcvnoBtpk7ZT8EaiEq8WkCCtxM8/MeZbTClbnmcv46zSJ2AtNy9Y0kiSqRDt+ewe
 ou6uh4Cv/dbft18n8yy4FoKRQ6jWbiqCmCp2ULyAXp5riUxz4mFdZ4ibwgUjvx/ZwRKHpHg1hfp
 f3/uHFhi+XA880xhNcyiGljTTjQhXMt5InS30UEU/8Up6GB2KLyiVElBx7M0tPoy3Tbr9C0qrYF
 YWbIdStmQX6wd0g==
X-Developer-Key: i=cel@kernel.org; a=openpgp;
 fpr=28B2E5B01286DF243CF23EFE336AB3336F667F97

The zero_len fixture injects raw pre-encrypted records over a socket
carrying a TLS_RX key only, and its record table already holds
zero-length application_data records. Every variant reads them back
with a plain recv(), so neither the splice path nor MSG_PEEK is
exercised against a record that decrypts to no payload.

Add zero_len_splice. An empty data record splices zero bytes, and a
zero return from splice() means EOF, so a peer that sends one ends a
connection that is still live. Its variants expect the payload's
length when one sits behind a run of empty records, EAGAIN when
nothing does, and EINVAL when a control record does; an unfixed
kernel reports 0 for all three. Add zero_len_peek, which checks that
a peek reaches the payload behind such a run and leaves it in place
for the read that follows. That one reproduces no failure: the
unbounded rx_list growth it accompanies needs a sustained flood that
three fixed-sequence records cannot supply.

Signed-off-by: Chuck Lever <cel@kernel.org>
---
 tools/testing/selftests/net/tls.c | 213 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 213 insertions(+)

diff --git a/tools/testing/selftests/net/tls.c b/tools/testing/selftests/net/tls.c
index cbdd3ea28b99..089e940ac43d 100644
--- a/tools/testing/selftests/net/tls.c
+++ b/tools/testing/selftests/net/tls.c
@@ -2573,6 +2573,219 @@ TEST_F(zero_len, test)
 	}
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
+ * rather than the zero return that means EOF.
+ */
+TEST_F(zero_len_peek, test)
+{
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
+		if (ret == -1)
+			EXPECT_EQ(errno, -variant->peek_ret);
+		return;
+	}
+
+	ret = recv(self->cfd, buf, sizeof(buf), MSG_DONTWAIT | MSG_PEEK);
+	EXPECT_EQ(ret, variant->peek_ret);
+	if (ret == variant->peek_ret)
+		EXPECT_EQ(memcmp(buf, payload->plain_data,
+				 variant->peek_ret), 0);
+
+	/* Peeking left the payload in place for the read that follows */
+	ret = recv(self->cfd, buf, sizeof(buf), MSG_DONTWAIT);
+	EXPECT_EQ(ret, variant->peek_ret);
+	if (ret == variant->peek_ret)
+		EXPECT_EQ(memcmp(buf, payload->plain_data,
+				 variant->peek_ret), 0);
+
+	ret = recv(self->cfd, buf, sizeof(buf), MSG_DONTWAIT);
+	EXPECT_EQ(ret, -1);
+	if (ret == -1)
+		EXPECT_EQ(errno, EAGAIN);
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
+/* An empty data record splices zero bytes, which a splice caller reads
+ * as EOF. Splicing must skip past such a record to the payload behind
+ * it, and report EAGAIN when a run of them has no payload behind it.
+ * A control record behind the run reports EINVAL, the error splice
+ * already reports for a control record it meets first.
+ */
+TEST_F(zero_len_splice, test)
+{
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
+		if (ret == -1)
+			EXPECT_EQ(errno, -variant->splice_ret);
+	} else {
+		/* Assert: a zero return, which is what an unfixed kernel
+		 * gives here, leaves the pipe empty, and the read below
+		 * would then block until the harness timeout.
+		 */
+		ASSERT_EQ(splice(self->cfd, NULL, p[1], NULL, sizeof(buf),
+				 SPLICE_F_NONBLOCK), variant->splice_ret);
+		ret = read(p[0], buf, sizeof(buf));
+		EXPECT_EQ(ret, variant->splice_ret);
+		if (ret == variant->splice_ret)
+			EXPECT_EQ(memcmp(buf, payload->plain_data,
+					 variant->splice_ret), 0);
+
+		/* Reaching the payload consumed the empty records ahead
+		 * of it rather than leaving them on the receive queue
+		 */
+		ret = recv(self->cfd, buf, sizeof(buf), MSG_DONTWAIT);
+		EXPECT_EQ(ret, -1);
+		if (ret == -1)
+			EXPECT_EQ(errno, EAGAIN);
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
2.54.0

