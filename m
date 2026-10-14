Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79F156E07D;
	Wed, 14 Oct 2026 18:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792002544; cv=none; b=F6nca60C1xEq46nuX01KhIvBfugKCoI8M6jaRKmPbBR/V6sxxtXkwlXa3G8qtHRM/5wHb/JN+AD8CB9KCFS7jiPX+E3QCFtZ/fWTedJ9ZVJgk2Lct7OfFiIPOzCeeX1TyBj0PtkHauXGKfIoURMKkXzGp292jr6PYbnWDOgZPjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792002544; c=relaxed/simple;
	bh=OpbgIP3wg/GRjvF4rxOMcjFrr5/7I6aCoikZaEiwLG4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f8fhLvRTHhe59otuAR40hoxrJNumCvrybDZ9O/ckuF+MmhSZ8EP35TH4WE+1zWAnpA9yskatOY8YpzOFDJuWBx8ez4SGxfL/lRE6ibkAxxid3MtHf88pLwESzZEAcGOWcTSlXR7VN3OAlmEPGLRJBXulZ8iLcsfxxHSLpcbiyUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cStc3Mwh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cStc3Mwh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D1BF1F000C7;
	Wed, 14 Oct 2026 18:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792002540;
	bh=X3Io63uUCeUu2STTp01qgK43STX9Whh0l5LRb3nJ3Cs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=cStc3MwhBwsMW8Q59v65+g3xyqZGiNCasYsmqr8X58PTdPwusemNsh9TW7UfIJoWS
	 2WUA8Zfr/X23PpzWdMKkFD1E6iC7EsMbNi9LIMGe51qTvQrSFd9KU99ckcfwJPG4XZ
	 jqERJ75ZQgzw8N7P0jg7Wam1KomtkLXmmywx+JsNxk/h8fC3B2sqsMJcZclYNCfWzT
	 ia6b96SoU1GB6r1195d/WcBzLoN32bGjDKWDb3R+f+H64NlU2UtdjSrKRVKEQXd48y
	 LULko2LwlZ5tdQAaUz/vkm70ChD1JyhTQTeYLisrutkq6k43k8L2lpZVuOWynVV3AS
	 8Not/juT87Vjg==
From: Chuck Lever <cel@kernel.org>
Date: Wed, 14 Oct 2026 14:28:40 -0400
Subject: [PATCH net-next v5 10/10] selftests: tls: Cover the empty-record
 cap in splice
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-tls-follow-on-v5-10-e76c301d4f05@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7015; i=cel@kernel.org;
 h=from:subject:message-id; bh=OpbgIP3wg/GRjvF4rxOMcjFrr5/7I6aCoikZaEiwLG4=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBqz8ndiQNSbjDUuupKy0++qhbue9ZOkLR1KMeIF
 7T6iTJeyD2JAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCas/J3QAKCRAzarMzb2Z/
 l+XbEACWyM+5O7RHuH+R/XT0SwDITY4REcIzTE8grblkkQN09AEaOnqa2b8qkN3ckrWXWFeZzQo
 qNXOwnJLU/4YmLAeof8C/eWNOxD3W8kJCDmfoJAfg/2c/aesKML5qGoPOkJcwsANdRYswHE7drn
 B9AG1q8bVvmc1hPJcq9nmfvcKJ4iJljdnrpDzbeoSTyh2slI9bfts01SHQhYYR8sgb3WBaJEfGh
 o+LLuyz9rKWA7mL+mXPfUGp3goduNalxSxET3EdlRxB+1pKr050AG2uMBf3JfzSS0VeyLsjYM+c
 kcJHQ3hwWQh2vVrBOW2Xirrl2tlZobxSUppS5TjMJLJNtJ56vTvb11vuETX7euyunqM0mJG9RSp
 I8Pxlhkbe08KmWv/jdf6XwaVfUDzsEiOn3KkymXIC74DQgkG4DzeO/UgtTYvzaVYP6R5cfGd1Xw
 eQ1D33gyjIPCX02fKYzhD4aCPaujJPAMj19u+o8jg4ILFRO6DJu9oyC+HMR/Fc04pjzPZVBFaE6
 zOd68QUsnbeVlo0NZq241OYTeaVbosaMvyqQpUI3ZFaNfK04hWllmMaomKeboLcbFOnagOHAz+I
 ZC7e3TbCem6ZGHL8Xu/tdSIIaD3Nnj1gcdvIMv7u3emsmt5oAPcPN0KYhwjktPAaQjUQo7gRhoa
 OEcZb6r4ViU1rjg==
X-Developer-Key: i=cel@kernel.org; a=openpgp;
 fpr=28B2E5B01286DF243CF23EFE336AB3336F667F97

tls_sw_splice_read() stops after TLS_RX_NODATA_LIMIT consecutive
empty data records and reports EAGAIN with the next record still
queued. No zero_len_splice variant reaches the cap: the raw_rec
fixtures carry empty records at sequence numbers 0 to 2 only.

Add a variant that sends sixteen empty records ahead of a payload
record. The empty records differ only in sequence number and AEAD
tag, so a table of tags and a sender that fills in the header and
nonce stand in for sixteen raw_rec fixtures. The first splice
reports EAGAIN at the cap, and the second splices the payload.

Signed-off-by: Chuck Lever <cel@kernel.org>
---
 tools/testing/selftests/net/tls.c | 116 ++++++++++++++++++++++++++++++++------
 1 file changed, 100 insertions(+), 16 deletions(-)

diff --git a/tools/testing/selftests/net/tls.c b/tools/testing/selftests/net/tls.c
index 57edf6e6640f..38443675bc2f 100644
--- a/tools/testing/selftests/net/tls.c
+++ b/tools/testing/selftests/net/tls.c
@@ -2549,6 +2549,61 @@ static const struct raw_rec id2_data_l0 = {
 	},
 };
 
+/* TLS 1.2, AES_CCM, data, seqno:16, plaintext: 'Hello world' */
+static const struct raw_rec id16_data_l11 = {
+	.plain_len = 11,
+	.plain_data = {
+		0x48, 0x65, 0x6c, 0x6c, 0x6f, 0x20, 0x77, 0x6f,
+		0x72, 0x6c, 0x64,
+	},
+	.cipher_len = 40,
+	.cipher_data = {
+		0x17, 0x03, 0x03, 0x00, 0x23, 0x00, 0x00, 0x00,
+		0x00, 0x00, 0x00, 0x00, 0x10, 0xd3, 0x50, 0x90,
+		0xe1, 0x2a, 0x77, 0xc9, 0x38, 0x95, 0xef, 0xa4,
+		0x6f, 0x5e, 0xb6, 0x52, 0x05, 0x4b, 0x01, 0x44,
+		0x06, 0xc2, 0x51, 0x3f, 0x5e, 0xa5, 0x3e, 0x65,
+	},
+};
+
+/* TLS 1.2, AES_CCM, data, seqno:0-15, plaintext: '' -- the AEAD tag
+ * of each; the header and explicit nonce are built at send time
+ */
+static const unsigned char nodata_tags[16][16] = {
+	{ 0xc5, 0x37, 0x90, 0x70, 0x45, 0x89, 0xfb, 0x5c,
+	  0xc7, 0x89, 0x03, 0x68, 0x80, 0xd3, 0xd8, 0xcc, },
+	{ 0xce, 0xfc, 0x86, 0xc8, 0xf0, 0x55, 0xf9, 0x47,
+	  0x3f, 0x74, 0xdc, 0xc9, 0xbf, 0xfe, 0x5b, 0xb1, },
+	{ 0xc3, 0xca, 0x26, 0x22, 0xe4, 0x25, 0xfb, 0x5f,
+	  0x6d, 0xbf, 0x83, 0x30, 0x48, 0x69, 0x1a, 0x47, },
+	{ 0x4d, 0xfc, 0xe2, 0xc3, 0xfe, 0x11, 0x80, 0x85,
+	  0x94, 0x53, 0x79, 0x1d, 0x31, 0x14, 0x39, 0xec, },
+	{ 0x1e, 0x63, 0xa1, 0xfa, 0xef, 0xf1, 0x9e, 0x5c,
+	  0xee, 0x39, 0xcf, 0x41, 0x27, 0x36, 0xf5, 0x69, },
+	{ 0xa3, 0x49, 0x72, 0x01, 0x1a, 0xff, 0x1f, 0x71,
+	  0x51, 0x57, 0x80, 0xd2, 0x81, 0xee, 0xef, 0x75, },
+	{ 0x95, 0x92, 0x72, 0xda, 0x7a, 0x4e, 0x68, 0x91,
+	  0x02, 0x09, 0xfc, 0xe8, 0x2b, 0x3a, 0x54, 0x05, },
+	{ 0x41, 0x00, 0x73, 0xcf, 0xd3, 0xb3, 0xa7, 0x19,
+	  0x7d, 0x0f, 0x6d, 0x9d, 0xf6, 0x57, 0xee, 0xdd, },
+	{ 0xb5, 0x24, 0x17, 0x2d, 0xac, 0xcf, 0x5f, 0xac,
+	  0x2d, 0x24, 0xf2, 0x8c, 0xaf, 0xf3, 0xd7, 0x78, },
+	{ 0xf8, 0x23, 0xde, 0x09, 0x08, 0x7c, 0x75, 0x7c,
+	  0x23, 0x3a, 0xb6, 0x46, 0xc2, 0xfc, 0xac, 0xdb, },
+	{ 0x72, 0x01, 0x24, 0x35, 0x9f, 0x13, 0x92, 0xb2,
+	  0x93, 0xd9, 0xb4, 0x2e, 0xfc, 0xfc, 0x95, 0xa7, },
+	{ 0x2f, 0x0f, 0x94, 0xcf, 0x1a, 0x0f, 0x1a, 0xf1,
+	  0xe2, 0x6a, 0x97, 0x21, 0x12, 0x5f, 0x24, 0x39, },
+	{ 0xb4, 0xb9, 0xe1, 0x0a, 0x9c, 0x28, 0xbb, 0xf6,
+	  0xd9, 0xd7, 0x39, 0xf6, 0xfa, 0xcd, 0x47, 0xd6, },
+	{ 0xe8, 0xb9, 0x01, 0x90, 0x2e, 0x72, 0xa1, 0xd5,
+	  0x13, 0xdc, 0x28, 0xa7, 0x91, 0x04, 0x9b, 0xcb, },
+	{ 0x73, 0x67, 0x17, 0x6e, 0x50, 0xee, 0x28, 0x3b,
+	  0x6e, 0x2b, 0x32, 0xdd, 0xa1, 0x55, 0x97, 0x7a, },
+	{ 0xaf, 0xd4, 0xed, 0x91, 0xc3, 0x91, 0x21, 0x55,
+	  0xd8, 0xef, 0x23, 0xbe, 0xbf, 0x7b, 0xf2, 0x36, },
+};
+
 static void zero_len_sock_pair(struct __test_metadata *_metadata,
 			       int *fd, int *cfd, bool *notls)
 {
@@ -2585,6 +2640,21 @@ zero_len_send_recs(struct __test_metadata *_metadata, int fd,
 	return payload;
 }
 
+/* Send @count empty data records with sequence numbers 0 to @count - 1 */
+static void
+zero_len_send_nodata(struct __test_metadata *_metadata, int fd,
+		     unsigned int count)
+{
+	unsigned char rec[29] = { 0x17, 0x03, 0x03, 0x00, 0x18, };
+	unsigned int seq;
+
+	for (seq = 0; seq < count; seq++) {
+		rec[12] = seq;
+		memcpy(rec + 13, nodata_tags[seq], 16);
+		EXPECT_EQ(send(fd, rec, sizeof(rec), 0), sizeof(rec));
+	}
+}
+
 FIXTURE(zero_len)
 {
 	int fd, cfd;
@@ -2785,6 +2855,7 @@ FIXTURE(zero_len_splice)
 
 FIXTURE_VARIANT(zero_len_splice)
 {
+	unsigned int nodata;
 	const struct raw_rec *recs[4];
 	ssize_t splice_ret;
 };
@@ -2813,6 +2884,14 @@ FIXTURE_VARIANT_ADD(zero_len_splice, 0data_0ctrl)
 	.splice_ret = -EINVAL,
 };
 
+/* TLS_RX_NODATA_LIMIT empty records ahead of the payload */
+FIXTURE_VARIANT_ADD(zero_len_splice, 0data_x16_data)
+{
+	.nodata = 16,
+	.recs = { &id16_data_l11, },
+	.splice_ret = -EAGAIN,
+};
+
 FIXTURE_SETUP(zero_len_splice)
 {
 	zero_len_sock_pair(_metadata, &self->fd, &self->cfd, &self->notls);
@@ -2827,7 +2906,8 @@ FIXTURE_TEARDOWN(zero_len_splice)
 /* Splicing must skip a run of empty data records to reach the payload
  * behind it, since a zero-byte splice reads as EOF. Splice reports
  * EAGAIN for a run with no payload behind it, and EINVAL for a control
- * record behind the run.
+ * record behind the run. A run at the cap reports EAGAIN with the
+ * payload left for the next splice.
  */
 static void
 zero_len_do_splice(struct __test_metadata *_metadata,
@@ -2843,29 +2923,33 @@ zero_len_do_splice(struct __test_metadata *_metadata,
 
 	ASSERT_GE(pipe(p), 0);
 
+	zero_len_send_nodata(_metadata, self->fd, variant->nodata);
 	payload = zero_len_send_recs(_metadata, self->fd, variant->recs);
 
+	ret = splice(self->cfd, NULL, p[1], NULL, sizeof(buf), splice_flags);
 	if (variant->splice_ret < 0) {
-		ret = splice(self->cfd, NULL, p[1], NULL, sizeof(buf),
-			     splice_flags);
 		EXPECT_EQ(ret, -1);
 		EXPECT_EQ(errno, -variant->splice_ret);
-	} else {
-		/* ASSERT so a zero return stops the test here; the read
-		 * below would block until the harness timeout.
-		 */
-		ASSERT_EQ(splice(self->cfd, NULL, p[1], NULL, sizeof(buf),
-				 splice_flags), variant->splice_ret);
-		ret = read(p[0], buf, sizeof(buf));
-		EXPECT_EQ(ret, variant->splice_ret);
-		if (ret == variant->splice_ret)
-			EXPECT_EQ(memcmp(buf, payload->plain_data,
-					 variant->splice_ret), 0);
+		if (!payload)
+			goto out;
 
-		/* The empty records were consumed, not left queued */
-		EXPECT_EQ(poll(&pfd, 1, 0), 0);
+		ret = splice(self->cfd, NULL, p[1], NULL, sizeof(buf),
+			     splice_flags);
 	}
 
+	/* ASSERT so a zero return stops the test here; the read
+	 * below would block until the harness timeout.
+	 */
+	ASSERT_EQ(ret, payload->plain_len);
+	ret = read(p[0], buf, sizeof(buf));
+	EXPECT_EQ(ret, payload->plain_len);
+	if (ret == payload->plain_len)
+		EXPECT_EQ(memcmp(buf, payload->plain_data, ret), 0);
+
+	/* The empty records were consumed, not left queued */
+	EXPECT_EQ(poll(&pfd, 1, 0), 0);
+
+out:
 	close(p[0]);
 	close(p[1]);
 }

-- 
2.55.0

