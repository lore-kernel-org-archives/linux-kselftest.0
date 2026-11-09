Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794247121;
	b=c0OyVJXvsVlVBdxx9Bg9Fjovc8WpSBLxpFOpdZVMsGcArfUW/ifobTA/AjR8lJOoYYmE
	 PkerPIU4kdkJcZOYBFcfNLoTLG9auDfYJ8K8D3/lceGl/mKKjYo3LSUcCR2ZFUmiX+bhB
	 u2Oow+0ovaQfqW4QgrfFmKV6x6BjyIYc5cgrM4/JmtS4LkQhygDgEjjfsPwY100SyxCgv
	 zql5qp8P/GALaur+vQgaDGaJ5tEoGPUnAyof+OO7aLdjBuWY0ACP+2Nsbl2wSWIDmiFPp
	 6l+JelUYMtUKYzkTbT1zUyBv2UTWVDJwIZZQNzIML7yTtBX2YCgPb68KEPvhM13rIOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794247121;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=D9l5nssXItN1Kq0USy5bLMDvnWCUn8XY2TRyCHNmrpc=;
	b=YTw7L1otzZfKCOF/vKS/NsjtihUl+KmoDhvXIfWlaApyn3i9JN34FEhHS4C5LukzRKJB
	 wm5orMYoafiqVE1/aq+eDo2EYI0F2QsK1Q+bYX7yeoyjfMc8zYqQfnR0mdVk3ys3DkZco
	 DJnjXdltKw1tRPZwv4EG3C60o7hmS6oO1pkeWS8lkUIml3okVbrEfeAEuWh9vqVQcuj6t
	 QNTl1oMPGczq7804otrAvl+9usHg09eyH16LsBQ5tpij18icvu2KTnAW6orj1lWX+0xfz
	 Z/hoZUcllb3G/oXmR/ItzZtfsSbNgop8ry8xMBuRmjUx+I5PP2/XJguxBsDLrIO0Gtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LjDR8Nxp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDA9606A33F;
	Mon,  9 Nov 2026 17:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LjDR8Nxp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EA7B1F008AB;
	Mon,  9 Nov 2026 17:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794247120;
	bh=D9l5nssXItN1Kq0USy5bLMDvnWCUn8XY2TRyCHNmrpc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LjDR8NxpQFe47/bObH8+6wXefcgx1/s9Kd7WYRFEV/U1e5/RmZoTSAZxTNWeNrDQp
	 4jBfIPbZo0X+lfNAEaf3GaaQzHCtDz+pOejfeKVh2CF1e1NrYNjRJPPJDfktvESC3c
	 LXjEqM2isDH9xkgqvugfOINuxxtS6zSEJGMXc2F/09q+5yp6fcEvozZI8j4r7blZLD
	 LmugAYalWDjenvyaLzgzW0LFXMwY81a5F88Q6CGkhdTQUSUjjvWqdJY9vLbjMXtWwr
	 lCrZJ4l9hM1mjdAecZEu/pl2QALSs15tpEe7w81uZPqi11DdmrVhNx7tV4OEN0N3yC
	 6yhXmswNy8b3A==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	sd@queasysnail.net,
	shuah@kernel.org,
	cel@kernel.org,
	linux-kselftest@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net 4/5] selftests: tls: Extend coverage for zero-length records
Date: Mon,  9 Nov 2026 09:58:35 -0800
Message-ID: <20261109175836.1246840-5-kuba@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109175836.1246840-1-kuba@kernel.org>
References: <20261109175836.1246840-1-kuba@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chuck Lever <cel@kernel.org>

The zero_len fixture injects raw pre-encrypted records over a
socket carrying a TLS_RX key only, and some of those records are
zero-length application_data records. Every variant reads the
records back with recvmsg() without MSG_PEEK, so neither splice nor
MSG_PEEK is tested against an empty record.

Add zero_len_splice and zero_len_peek. A zero return from splice()
means EOF, so zero_len_splice checks that a run of empty data
records does not end a live connection. zero_len_peek checks that a
peek reaches the payload behind a run of empty records and leaves
the payload in place for the read that follows. An unfixed kernel
returns 0 from splice().

Signed-off-by: Chuck Lever <cel@kernel.org>
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 tools/testing/selftests/net/tls.c | 221 +++++++++++++++++++++++++++---
 1 file changed, 204 insertions(+), 17 deletions(-)

diff --git a/tools/testing/selftests/net/tls.c b/tools/testing/selftests/net/tls.c
index ca47576220d3..ed7feeac1cc4 100644
--- a/tools/testing/selftests/net/tls.c
+++ b/tools/testing/selftests/net/tls.c
@@ -2580,6 +2580,42 @@ static const struct raw_rec id2_data_l0 = {
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
+	/* fd gets no keys, since these fixtures send raw records over it */
+	ret = setsockopt(*cfd, SOL_TLS, TLS_RX, &tls12, tls12.len);
+	ASSERT_EQ(ret, 0);
+}
+
+/* Send a variant's records and return the last one carrying payload */
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
@@ -2642,19 +2678,7 @@ FIXTURE_VARIANT_ADD(zero_len, data_0data_0data)
 
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
@@ -2673,10 +2697,7 @@ TEST_F(zero_len, test)
 	if (self->notls)
 		SKIP(return, "no TLS support");
 
-	for (i = 0; i < 4 && variant->recs[i]; i++)
-		EXPECT_EQ(send(self->fd, variant->recs[i]->cipher_data,
-			       variant->recs[i]->cipher_len, 0),
-			  variant->recs[i]->cipher_len);
+	zero_len_send_recs(_metadata, self->fd, variant->recs);
 
 	rec = &variant->recs[0];
 	rec_off = 0;
@@ -2702,6 +2723,172 @@ TEST_F(zero_len, test)
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
+ * behind them, and a run with no payload behind it must report EAGAIN.
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
+		EXPECT_EQ(errno, -variant->peek_ret);
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
+		/* ASSERT so a zero return stops the test before the read
+		 * below blocks until the harness timeout.
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
2.56.0

