Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBD53264F7;
	Thu,  1 Oct 2026 22:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790894512; cv=none; b=fEZDw4YQ5aCWtVT4NvThF5gfYMIkevJZE6Oz1bxWr2h+tmr2lCNZIB2WzVTguG1MFa2AIVj35xB5hv/IrEtVNF2OB/HUk8tyx8LVToAVFz1EIxftMjNpcHtsjXGJITG6Ty7rRV6V8uSE/kYlW/CUtqQ4lcZGOQInzDPWzGV+al0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790894512; c=relaxed/simple;
	bh=nkVsMwucJbqb7XZrIlSqnJmUzk47lFIkf0HDUhH73bI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IkqfCEgM67jRLwWsCGrMGyd5/eel/Gb1TRoCsAGFfDfGjsqM3mkVUJVCvpWbVwTbqSXVWlnQ/sy6ch83OvOGZ7YJPGTwTI7MnbIaOFQ5LgTd2mdpIbJ4k9kV8bEuweqfJWsbiu9nNdlQfHinz7RXmdF2RqlBr3qIPLfVS2kKcvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KvYYWONx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KvYYWONx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 509861F00898;
	Thu,  1 Oct 2026 22:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790894510;
	bh=h44k2erx490tdtkKisYF1ZEwzE/8sI9i5NcMWYtvKkM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KvYYWONxZOIMEtkbXn4rYmwmYIn+WG+OtSdyXqgE8Pp9/k2cV3UtdqxhuBFD5PxJ8
	 iDDRRPsxkp8NKyyDrBnAHTm6YRriv2+7iCPWVW/XvkvqACRZ9JSTTp1+K7V9rBPgsa
	 ChxCy64f7AH37IF2JHbUGNVEx0AZdqrr2zVKMLZQUuAawF+HBq0WCKqNU26ec6J2Oz
	 acjLnNbC+Kpsi5e8DARaNtDksVJrEOzfSCnLkzWX8h7HbnQBggHuicb30kyVppLFLk
	 Ab8NaBuUfpyg6q7gKHmdG5HOgsK/xKtac2ncUtgwEq2J66dJo+YFZZ8Awszc8nso6f
	 sTQtrnBLjpBtA==
From: Chuck Lever <cel@kernel.org>
Date: Thu, 01 Oct 2026 18:41:38 -0400
Subject: [PATCH net-next v2 6/8] selftests: tls: add peek and splice
 coverage for zero-length records
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-tls-follow-on-v2-6-2dd1947bb642@kernel.org>
References: <20261001-tls-follow-on-v2-0-2dd1947bb642@kernel.org>
In-Reply-To: <20261001-tls-follow-on-v2-0-2dd1947bb642@kernel.org>
To: John Fastabend <john.fastabend@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>, 
 "David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Chuck Lever <cel@kernel.org>, 
 Dave Watson <davejwatson@fb.com>, Shuah Khan <shuah@kernel.org>, 
 Qingfang Deng <qingfang.deng@linux.dev>, Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailer: b4 0.16-dev-da966
X-Developer-Signature: v=1; a=openpgp-sha256; l=7783; i=cel@kernel.org;
 h=from:subject:message-id; bh=nkVsMwucJbqb7XZrIlSqnJmUzk47lFIkf0HDUhH73bI=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBqvuGprCVWYWZWFoZVCytfsQBZCrpS+S4o/eyIx
 l+I8pq0nnyJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCar7hqQAKCRAzarMzb2Z/
 l8kPD/9QSbPLqLJLrEwSRGx8IOLGAr7rZ4Ix0ht8sKqyCOBDz2MnQaIQoXQEd1MzTBlSzKEjx6X
 R4iDlSW0tT4OLvsCOv4QyOWwW3jI5RTPNwAi/91hpKNEm2AD04oNr8XpqFUdjuU2crwynApVOfm
 Q1ZwJu133HXQeJ5j8DRSVJkL8s403Xha2Quj79ArcTOKNnjICbbs9VNSvtiFChwnLKXmVkeW+kK
 tWcOWtWNWiHVMmIuk3P3qCmIdfYAmPF9tZOEep0qp2oI5mlfgsBTeEI7rI8tFgUCZwZeB35qNLA
 yCKznHnhl6/DPFXFmOQDD96IDdI6i1kZwlaBgFqRQmVqmY4jgaBQMD2joacYrpjjnl2XE21OdOy
 Tm2Z1KRKQE69tjX3jWw90QrZiw66qI26L5dG2g46cG/9ez1/v2lvRgHQJmPeOVBy8lbSteBSmqY
 B+Vyu5CbT9YcJZ3Vwl4Cy3NfyfypDgr/5uxf3wyoANxRXhU3H3zPVnFcGYAeKNwTJEKnGgSoggp
 AaInqadfVR5qduaop/ibwoWi2I2ShbUYbSP2g19w71fHJfuIvCGcF6VmQmgDrbvsxY+PITKsv3s
 pgzS3OEOEy65Sk+s5T8gbBvqvPsANo5Q/SYP7i9qteyTcXCuS4vOLiIvluoAWVVct7CdplgkZ2E
 4nTCD7iYZEKGTkg==
X-Developer-Key: i=cel@kernel.org; a=openpgp;
 fpr=28B2E5B01286DF243CF23EFE336AB3336F667F97

The zero_len fixture injects raw pre-encrypted records over a
socket carrying a TLS_RX key only, and its record table already
holds zero-length application_data records. Every variant reads
them back with a plain recv(), so neither splice nor MSG_PEEK is
tested against a record that decrypts to no payload.

Add zero_len_splice. A zero return from splice() means EOF, so an
empty data record must not end a live connection. Its variants
expect the payload's length when one sits behind a run of empty
records, EAGAIN when none does, and EINVAL when a control record
does. An unfixed kernel returns 0 for all three. Add zero_len_peek,
which checks that a peek reaches the payload behind such a run and
leaves it in place for the read that follows. It reproduces no
failure, because the unbounded rx_list growth needs a sustained
flood that three fixed-sequence records cannot supply.

Signed-off-by: Chuck Lever <cel@kernel.org>
---
 tools/testing/selftests/net/tls.c | 224 +++++++++++++++++++++++++++++++++++---
 1 file changed, 207 insertions(+), 17 deletions(-)

diff --git a/tools/testing/selftests/net/tls.c b/tools/testing/selftests/net/tls.c
index 9d3cd4fff062..419c6cc0cc5e 100644
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
@@ -2611,19 +2647,7 @@ FIXTURE_VARIANT_ADD(zero_len, data_0data_0data)
 
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
@@ -2639,10 +2663,7 @@ TEST_F(zero_len, test)
 	int rec_off;
 	int i;
 
-	for (i = 0; i < 4 && variant->recs[i]; i++)
-		EXPECT_EQ(send(self->fd, variant->recs[i]->cipher_data,
-			       variant->recs[i]->cipher_len, 0),
-			  variant->recs[i]->cipher_len);
+	zero_len_send_recs(_metadata, self->fd, variant->recs);
 
 	rec = &variant->recs[0];
 	rec_off = 0;
@@ -2668,6 +2689,175 @@ TEST_F(zero_len, test)
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
+		ret = recv(self->cfd, buf, sizeof(buf), MSG_DONTWAIT);
+		EXPECT_EQ(ret, -1);
+		EXPECT_EQ(errno, EAGAIN);
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

