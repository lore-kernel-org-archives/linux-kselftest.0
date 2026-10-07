Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86290412C0D;
	Wed,  7 Oct 2026 19:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791402598; cv=none; b=omcGA2J3gKup5AdvMDK2QWMIvvmEq9iUIaLvXxi2+igjsuu8WVtj0qKDCslpvxweX8VqilQC5TCjHpk395Dj+krHrSVCm/YbXY4eel8RX/iLG0F4JNi4yGyeHTNV6fabvdYTNjTjYmjzuaH+yKtjcEsHp2YP5yYwD1eWM+XhIbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791402598; c=relaxed/simple;
	bh=tKiOLHrC1hVZbNZUxmgIUI9pIyEwgKA9HzLQU+VJrjw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qT/PdT2EJ3I/qE7Sw3d028yk8IwRv98cyzYFFyl1iLW3Xk87n7GbZ3y/qjMETq+FBwXQtjK1Eiv7KR8d75Dval2JiFXBpwJUDYYVKGSF0Pt+JaYpA7MClqg8QzY9pAmpVcyvuJKzKxsV0612+hl0ZHw1ZeMtYnIWMISZG49rDmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z8/d+fgx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z8/d+fgx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56FD21F00893;
	Wed,  7 Oct 2026 19:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791402597;
	bh=6HsVs4VFDgrf3gx/RQGxSVr0r8MFj71a7KsH6eSYwPg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Z8/d+fgxGr9yjANz1kT4oKIxJFsbkkcPnSBpfugiDtb5ucJBDuOwoHOhV5laghLOA
	 iXuulrvViBB2Udavk9PEPMfiHYuo9AUZ00JgOzkOIlJmsEVqXnEz/p8w6Ov86+VlRm
	 m35ke6fSmVFJ56mmnKGGrahzViQj0723PvRRaUhKC9eRxRvokusoTS9P75lcrqlXqY
	 royldMPGmy8OMstSAcBuaa6AAdLwpOxVBlv1QvRF/Lx6D7CwkDj1KbpyHxEX5pTndK
	 PM4mfxCk9rWmxWZLcjZXPXNu5pdxWVPxTOKBqNHa13EWcqq10FMuFsd/Oi9ND8C4nQ
	 OVIY1kkxlTUyw==
From: Chuck Lever <cel@kernel.org>
Date: Wed, 07 Oct 2026 15:49:37 -0400
Subject: [PATCH net-next v3 8/9] selftests: tls: Add peek and splice
 coverage for zero-length records
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-tls-follow-on-v3-8-6d52d98389b3@kernel.org>
References: <20261007-tls-follow-on-v3-0-6d52d98389b3@kernel.org>
In-Reply-To: <20261007-tls-follow-on-v3-0-6d52d98389b3@kernel.org>
To: John Fastabend <john.fastabend@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>, 
 "David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Chuck Lever <cel@kernel.org>, 
 Dave Watson <davejwatson@fb.com>, Shuah Khan <shuah@kernel.org>, 
 Qingfang Deng <qingfang.deng@linux.dev>, Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailer: b4 0.16-dev-da966
X-Developer-Signature: v=1; a=openpgp-sha256; l=7739; i=cel@kernel.org;
 h=from:subject:message-id; bh=tKiOLHrC1hVZbNZUxmgIUI9pIyEwgKA9HzLQU+VJrjw=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBqxqJaPwYcH5cQAGEhYegNz0MHxKlRWtE5ocYTD
 jlOF7njL0qJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCasaiWgAKCRAzarMzb2Z/
 l3lhD/92rrsDGzH5S5LG3kJ05lJRqxIR5besVd9MhMuh+x8EwJVaO5CkXShR+/jGCSBtrXCc+oa
 8Dy0w+4ji3TS6qfBvla9qzr6tDlWt1Dta2i0lAdK5H+VLa7+oHunUY8C1nWTJlJuR79oZvZPSR9
 qPvOy9TyV25AQDnWseNqWlnKPCcEL21AsLgXThKzOJFgpLx2BLeBtyvuFKaUr/lc3Y3ypbNZ4lb
 ifHIJT+JpmOuv+MCurLXPPjmDdmFmwmP8Y703LxS0U5JoaUzsmXVHN6zP3B3O/TrjABc2cuYnSO
 sXKITKt/lJwn0dZfA9Jc3BmTjbgISs3CCSCSMY6ZIlq8evx/9EApO0nD0KWlvi5dLMHz/cT+djz
 WMUAXXxq0fLNoLvMxOzPn6ChXfhWxEaHH+bEUB1dl/Bto2W57kuULPlQia3aG3lIQCb8gPPa5oh
 CviPs4WLWs8I0tQdx5h/fHhlXVFKiv4owq2fEvUFLueihk1kTJe9b7t630pqgV/QfcOXJqje8c4
 4pIvIOOlIKMJUvTT17zNR5Qxlc8vqIx4QL6BANaGDT6pHw4dE78mcXqc8UMaX6+sjTNcuANVi7y
 StKVR6EZu48v6LGfnkMyzCMwucZxbvyATgtOfk/q7PuJVibcfz5JP7Yru4VK0eM3GNTw8GjW1Hq
 VDp030U+CFbwGyg==
X-Developer-Key: i=cel@kernel.org; a=openpgp;
 fpr=28B2E5B01286DF243CF23EFE336AB3336F667F97

The zero_len fixture injects raw pre-encrypted records over a
socket carrying a TLS_RX key only, and some of those records are
zero-length application_data records. Every variant reads the
records back with a plain recv(), so neither splice nor MSG_PEEK is
tested against an empty record.

Add zero_len_splice and zero_len_peek. A zero return from splice()
means EOF, so zero_len_splice checks that a run of empty data
records does not end a live connection. zero_len_peek checks that a
peek reaches the payload behind a run of empty records and leaves
the payload in place for the read that follows. When a payload does
not follow the run, the peek must leave the socket unreadable. An
unfixed kernel returns 0 from splice(), and after the peek poll()
reports the socket readable.

Signed-off-by: Chuck Lever <cel@kernel.org>
---
 tools/testing/selftests/net/tls.c | 226 +++++++++++++++++++++++++++++++++++---
 1 file changed, 209 insertions(+), 17 deletions(-)

diff --git a/tools/testing/selftests/net/tls.c b/tools/testing/selftests/net/tls.c
index 0bc43728262e..5ff77f1c40c6 100644
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
@@ -2642,10 +2666,7 @@ TEST_F(zero_len, test)
 	if (self->notls)
 		SKIP(return, "no TLS support");
 
-	for (i = 0; i < 4 && variant->recs[i]; i++)
-		EXPECT_EQ(send(self->fd, variant->recs[i]->cipher_data,
-			       variant->recs[i]->cipher_len, 0),
-			  variant->recs[i]->cipher_len);
+	zero_len_send_recs(_metadata, self->fd, variant->recs);
 
 	rec = &variant->recs[0];
 	rec_off = 0;
@@ -2671,6 +2692,177 @@ TEST_F(zero_len, test)
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

