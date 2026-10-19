Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792428942;
	b=AlslR4fnEjxtCnxFbuMBtBQ7oWGU15RHdlhsQxcewA7uREwXsAZ0Yj3r2JxBvUhy1Lem
	 UJB/DSTla4wWavcZ670YXuGJyY6/LXYE56n3Wdz5FNx2Li0G9yVGPGm9W8f7UMRiiPkhf
	 8SfLMwO5k+xG7Id4oTc/SE2iVvwoAjOC10FoaVjSATFKBgdC+Nh+ZXX2ybK/d0J1kHWEv
	 rNB3l5hwtmq5Ohd/mvwHt5DakPeVuV/mpMTZowVbt6Qm4gtI5VkUAM1UdVJr1b70ZGBE9
	 WK2bgrTnRQ12PLCSULiuqBfZWEl2W9cLQx8GjRV4CKNDwVcpRn8mOiO6UmbnuJ0zY/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792428942;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=WCZFR7lkoua4j4EKOtb4wDRQVj7gOQ5bKDHT9kYoilA=;
	b=eO1QPU1s95zB4YAYrVF/YuuG3uVUC/7auRmxzcjLDKIzRZ3VpPXFfayvlCnE5WQ6Q7CG
	 1BPgyljMPx8K7lVQgUPpTpcVsAwBCDftyWLkd3liLmDnrWAc67ymBEXIIhB2EWVUq2WEh
	 JlknNF9LQKvYNFVfZTYYHTgSNOXEz/K498OtsSKD1A0CARz/NUEWXGJatt92JzwuLvydg
	 zigTVQGJQyBOhL0ixhHa6q8O1JiFzoSqfyFIEFVWwedzR5BRoLrRb2uFDYA0rSnCF3X7P
	 rjdRFZNQhuZzE8Z5oQT+iVzq31P2keyZxMdwLj6NpYhVOmaEZHdaIrgYnpSGKMfG8YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZMnn2L91;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFE260A2627;
	Mon, 19 Oct 2026 16:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZMnn2L91
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FCAE1F01574;
	Mon, 19 Oct 2026 16:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792428942;
	bh=WCZFR7lkoua4j4EKOtb4wDRQVj7gOQ5bKDHT9kYoilA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ZMnn2L91x2WOi61tX10ue2ADbHWPDzQs60XmxVBSpVaUtmikWkAv15VVM23KXSZ6W
	 wtcu+iQg/14lSWtY0ogdES9YneUQ8+IsOy7/eujplDs1B+Y0T8JY+DboQscvtV6mrp
	 64Zm4qpN96gN6alZuq1sKWJHCby9DJyzkRFgk1K+kd3eGwlSbCE9KkcX/kQAxUbVw+
	 wzuslQlXcvJm1F13NGMVVEFxtgw+eUlQJvgsV+4k2fRItzOmEWdSXVxMwjdovy8/eM
	 SDzTSWDJXewgyGKav/NA2gR9Y1aQDV/y/nQzAyFKYnGscS6y9iAMv7Rn2Wr4lRt4x3
	 dXRycsdUdmbow==
From: Chuck Lever <cel@kernel.org>
Date: Mon, 19 Oct 2026 12:55:24 -0400
Subject: [PATCH net-next v6 8/9] selftests: tls: Extend coverage for
 zero-length records
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-tls-follow-on-v6-8-ab01c4ecca0c@kernel.org>
References: <20261019-tls-follow-on-v6-0-ab01c4ecca0c@kernel.org>
In-Reply-To: <20261019-tls-follow-on-v6-0-ab01c4ecca0c@kernel.org>
To: John Fastabend <john.fastabend@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>, 
 "David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Chuck Lever <cel@kernel.org>, 
 Dave Watson <davejwatson@fb.com>, Shuah Khan <shuah@kernel.org>, 
 Qingfang Deng <qingfang.deng@linux.dev>, Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailer: b4 0.17-dev-9c833
X-Developer-Signature: v=1; a=openpgp-sha256; l=8346; i=cel@kernel.org;
 h=from:subject:message-id; bh=6aFN2CLrrTp4rUSNy0L37As0dtSOEz8VzDp9YKuaI/0=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBq1kuBbMuibH/KY5w5LXaXZ45Y/1BnKwZW30WgI
 EYkZVsd4pWJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCatZLgQAKCRAzarMzb2Z/
 lxSyEACBIHKgRxbzE+H7JP8/iXFNv0C4OUDyOlaHG2fiunPYFsa95wgEbD4zK8Am51Aum/jM4Td
 mTg8Hz3RN1xY6FRiDMjAu+7tm6bLqHAipON3TsOCnXNXq9pN8K0T/cbM08BV66q/I25VD9WSY2J
 3stYFnJTGsZbxi6N4vl5LusPz14V42nieDNqzuRzx27+agJvvq3ipL061vDNNhL65McJszj3Gcn
 7MsRV8G3gAOEOWDygFHI81x1dKzLVQ6WxiZPdkzul4B29yKbaXJBll13ZPCgclxp92Tnn4tv+Av
 fBNDgF/eQ47DQlFncJ0Go+SqGwVBYN3jKA8AZrW3S8Fa0hUEOFuU+teONtIMvYwRlZ8+sNRR72J
 0yNupqmxtolHZ0Xec3QsJ7wSrVZS/7/LqzZzMMK1vGbHHwE8tnL27eDNuJC/d6+BeNrF+rZzaUP
 XbhwJBp8z5wo6ownEyJWs4ttiQS+wVMM7CHyXmFd5NM6xMv2s34DKppyF0TcZLd2Fd3a3tE92Ii
 IH5gdxJMCIk6B73BA0b6c+JzrgX81XQ4s2CCvhvEYJvIUI8YQTYY+65+3WYgY7YBdQhyHJe8AEA
 6s94rYlkWBZeFastrgv2QOC+yPLGK220izj3oUNaOsSvTgaGEgeHxbzQLkxvApP5jjJKIYRmNX1
 BjiPBSojb0mKFXg==
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
index 0bc43728262e..aa66d0bbd1b5 100644
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
2.55.0

