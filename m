Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12734A3D58;
	Mon, 12 Oct 2026 15:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791819016; cv=none; b=LpjXQxE57r7xdHE4seZYKBCfsUhG2m1nYKWdo/aUDh+eugSbP/CV8Cf5RHc3IODMsAzTqYzp+vCMldBcqrrafvdtmnuaDpn0oIZvP0LyF5n5gerYmYFMM47KvXQD9qc8FwuIXMl8zNl7JLwG8bf13uHFXdsn1GsjYuYy698I1+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791819016; c=relaxed/simple;
	bh=78Z8/4OGtTSSgFQW8yOyyyrOmUsT9sMsyDl389sQ5WE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=skb35OzROpLMklKgNbsDrgbg0dk3eue/3U0ss/YZLaUBNaRCR6pSb6Mk3Y2czoFEMN1Cr44/bXEehTx1yzh5vnf12JlXSSACJNcYEGWEorZ8rn+nxR7GK7qtH2rQ0zI13TrIsb5HbnAkjYee/aB/7ujX+NZwBzjuDHrjtNgS+I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kWpc5+wB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kWpc5+wB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A97F91F008A0;
	Mon, 12 Oct 2026 15:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791819014;
	bh=jw8eOMJT0PO00iCG8j19BieCP71AeNu1dzFnwJ6S190=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=kWpc5+wBP/OPTLrjEUWnfru5c9yC44LJM/+loF3KjwXZirFeJcbRNTSgeMNzfHQYY
	 N5bskO3YbUNAOrP7qmVQJt9Mfr2GDkqE/vq8BQPOR8DN6SC9EcfJ48fySjZ+OH4R/2
	 iWWVUVKRM6YvIYrrUs/+OVDjt2G6CzdOoEdgoZByKaEtEtUVDkmq0xD4ICzHPDu4Nb
	 ThSctxgVq+Rv6/J81imxudaFEcDjOjT9v7hJQSo1UxxyglndLS5rKGW4LFPkqq9kzg
	 pkMQG624XIhad0mbdIoZ4MriKkvJx2q0d4Vaw6JoWqahePlqmYhQOHLSh3MedOAEYv
	 f4rMIxPADOxWA==
From: Chuck Lever <cel@kernel.org>
Date: Mon, 12 Oct 2026 11:29:56 -0400
Subject: [PATCH net-next v4 8/9] selftests: tls: Extend coverage for
 zero-length records
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-tls-follow-on-v4-8-8cea429565da@kernel.org>
References: <20261012-tls-follow-on-v4-0-8cea429565da@kernel.org>
In-Reply-To: <20261012-tls-follow-on-v4-0-8cea429565da@kernel.org>
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
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBqzPz6m9BRkZwNfewqlu2sOq3sp0MERmYJ0bIo5
 hdPb/UJX2iJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCasz8+gAKCRAzarMzb2Z/
 l5GbD/wLTWS0YaU1LIuWaq0bqPEcNycv6Yl3tzjFtM534P8oNGEb548fm7KjpuUHNxMcT5S3v9q
 8pCNMzmqH4yrtVyaaOsh4oQvMcK6DGtdenH6B+OvG54NLFz8VNQIsyCWqf72tVfOo31WMH0KFk9
 9RIhJqwt5oGSvbsRxmB4lVjxrFC5BFnIv20MEnRBJbmhihdWBN+Ui4+ZI3Z2TzMWXerBaynaygv
 eyL0TxwLISUYVvAsNZoKjniUH+RX2WZDjgpTjTvBbQH/tJU8de8z60CY/U403THj6ML3jbWLzpw
 pRNuo80v4Re6J/mn/OX1XY5INfuPoLPbKXK4Hlsi1qKzF+bbO6YgBL/iA7NbB8yAiXc7d5q759D
 0TkiA5XTWdjfUGHT5U9EJz7/0sFN5k0rdAMDfQM/E6Onj+YGfwuCTHIQbueGB0ZflKlYdL5xskx
 URgelVEqQ4fMEmS0dIfprHt1MwuG8l5qWjGw37dYEjLnsnVyIfSBO9GaWpZMC6iuXcIO2PA1mVB
 t4twUgOqwaF//cd8jlYoW/5rEVyEJxFX6HboSJmzU+DAaHKvvSyfjYdJI7qcxHnY/4HOxWVaBMd
 SMVaLpP3t7vuA3VPhjp7BUnzC8AC7eLmZ2I7kscWOoIS7868VkX8YGrb2cRcFxr3GuBfVX2cRDR
 7AU9QMSFh63v+Xw==
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

