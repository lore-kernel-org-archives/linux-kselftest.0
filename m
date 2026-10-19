Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792428944;
	b=cskhzg3Lx081q/u7yQ+g+Y/GUM34A5Wbs9KQ7gDd86bqQt7UoOVSY7hOHSnVAgi5BQqC
	 +wfYZZpgPEcY9IJBx19fjxX98MD8NJGl4NJGtKk/GSGWnG34P6VnuAphdhj6uVR+5vU1n
	 pA5cWUaNYTLOB1BWV5SCY+04cz8YDIgvTfIZtJfOqxghu89hWmR12DV/7lHRWurilpslw
	 OYB7kBTPcr/wbANUIB+NTgJu96prRY4DfPZ8K8oVRgVy4akcFgsrlZ+6dkJzyyb8mJi4h
	 mRRdA53GQ16lfJzdtzhBBKWdE6Wi+TdzzU1DiNt0hbCiSKgxahs6FqCkxVEVwgH0HwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792428944;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=46i9+i0Hc04BxSzE7aQt788VtDTZgEaNlJW8RY+AVfU=;
	b=oqfi6xPApdcu9n30Wln3dn0QmN91EiM0iE2x8VaxoKdZgUpiadwSlSzW9TO5UkXxboyt
	 vN/1dPBtO0c5EKTzk6Xj4LsljBXEO26D/uzkxXX624an+sxMeEBXPZ2GhtIqdHYlxOAwN
	 u62ZpP78NhNl0hnx9sRbIzlRrIGk255mDZ/KNe0iTZ9NC0G4iLz8XiA0QtA2vCSeCC05z
	 ylEipaiEp54sT5f4ERz8Qj9hKBV98LtHytPwAYwCGFc7wirhCCWSHdsAT7L/YDx+TmpuQ
	 2b+8RKtcKOpP1/AWwjPMPZMJ6p+AW4hMIIMhkUTU4aDfT7OVBsWwzHO3jo4/2B03uIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=exgiYCzb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A49606A323;
	Mon, 19 Oct 2026 16:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=exgiYCzb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B33E1F01578;
	Mon, 19 Oct 2026 16:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792428943;
	bh=46i9+i0Hc04BxSzE7aQt788VtDTZgEaNlJW8RY+AVfU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=exgiYCzb51gHMHDJgMp4R+KWY/ZG0Sa8r1LOVtpuWnx16Zi7xeIrageWzBpJaUE93
	 ayzYIN7RjcRGVwOY8gva6tGbcnAh/kkB4avh+MbUyhKone5x2dmtPx71/fHSVyPBC2
	 eeAsUoDKr0SxRhxprKVLqyP+aVD9uPIH7cG+8FoCHKqWZlLVtbYTkguRrFDnjbcxDZ
	 NjNx+4gAggABi23zARxnNF4Ag25AASgLwhZmw7L129OB2LeoFIxpwPREUgGWqQTcwq
	 npj37Bs+zh8pkkXQjrimxo/ANsWeNd3PC8wGbomQz18xlYoQl3QpQ9YyruzUD4ZeD2
	 rjfex93odOerw==
From: Chuck Lever <cel@kernel.org>
Date: Mon, 19 Oct 2026 12:55:25 -0400
Subject: [PATCH net-next v6 9/9] selftests: tls: Cover splice on a
 nonblocking socket
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
Message-Id: <20261019-tls-follow-on-v6-9-ab01c4ecca0c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3203; i=cel@kernel.org;
 h=from:subject:message-id; bh=KukeFJgS54qtvw5izEZ32sgslUmda+KldBICsgzAp6k=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBq1kuBMddlOiUN/xxFvLM/LaHRFIpOH0vUktIAZ
 jQLLj2HWI+JAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCatZLgQAKCRAzarMzb2Z/
 l1irD/0Rcnm01l24G5fnlPE39NjsxNfV0H4LSXYv10Oa4nuPH4JzLX33ax9vceqP0RFc5kyirJo
 19grMriaf7YbHVjF6y5+sKOYanlH1qC/xpYaxfzUIteR6RvKjVqWN1YzK6i5fDHXltWyOG/TgtP
 A4rRkVxN6Uz5Y0hvrimfJSFnnm8FInvKVDx7pj1qFHrt6yNDl77HmLLpbIs7L/B7MTutJCj3X7S
 EwZCAE4/ltp73GYegYemQCpxF3CZ2es1uNiaeEeGs0ixlReHkzit8Is/wsr3cCGEhgOM2peHmmi
 on3vZGogX77HySgG279JFxNTwc136oavVZ9B442VecDdhbx1lZiROtym88JbhvyCdAzWao7NDUT
 pjqMRBb+tHY2AS6vqQC1ufKBPFacMnOJyeGPRE3Y7B9xW21XFcxO8++cZScN0k9wqzwVMbhbVgU
 c4MrnYkBEbx7HZ/T5MjlJ+Ix5Z5AnFTQVsqb0bruHpD/xd8TlTrzRBSx5y3InsuvAkeEYGRs4ze
 lklJ5Dw75eMv5fZAnBm2mqu8gj2cZc0o+AmrTOFfAy7u+upmEeIsht7AClBP+N3rb0ll9mrTFf/
 EKcDSOlUcZI0WlWof+kvQj3S/LY6EujqAV8Kv/anQK4MjMRYOWE5BpmKWaeT70QUfKL4GYWg1ko
 En84gDi6JsfvTJg==
X-Developer-Key: i=cel@kernel.org; a=openpgp;
 fpr=28B2E5B01286DF243CF23EFE336AB3336F667F97

Every existing splice call in this file either passes
SPLICE_F_NONBLOCK or runs on a blocking socket, so nothing
exercises the socket's own O_NONBLOCK on the splice path. A change
that stops consulting sock->file->f_flags puts splice(2) and
sendfile(2) back to sleeping in tls_rx_rec_wait() while a peer
streams empty records, and the suite still reports pass.

Run the zero-length record variants a second time with O_NONBLOCK
set on the socket and SPLICE_F_NONBLOCK left out of the splice
flags. Each variant expects the same result with either flag. A
kernel that ignores the socket flag sleeps in the EAGAIN variant
until the harness timeout rather than returning.

Signed-off-by: Chuck Lever <cel@kernel.org>
---
 tools/testing/selftests/net/tls.c | 38 ++++++++++++++++++++++++++++++++------
 1 file changed, 32 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/net/tls.c b/tools/testing/selftests/net/tls.c
index aa66d0bbd1b5..cdd53b8f0ed8 100644
--- a/tools/testing/selftests/net/tls.c
+++ b/tools/testing/selftests/net/tls.c
@@ -2829,7 +2829,11 @@ FIXTURE_TEARDOWN(zero_len_splice)
  * EAGAIN for a run with no payload behind it, and EINVAL for a control
  * record behind the run.
  */
-TEST_F(zero_len_splice, test)
+static void
+zero_len_do_splice(struct __test_metadata *_metadata,
+		   FIXTURE_DATA(zero_len_splice) *self,
+		   const FIXTURE_VARIANT(zero_len_splice) *variant,
+		   unsigned int splice_flags)
 {
 	struct pollfd pfd = { .fd = self->cfd, .events = POLLIN };
 	const struct raw_rec *payload;
@@ -2837,16 +2841,13 @@ TEST_F(zero_len_splice, test)
 	ssize_t ret;
 	int p[2];
 
-	if (self->notls)
-		SKIP(return, "no TLS support");
-
 	ASSERT_GE(pipe(p), 0);
 
 	payload = zero_len_send_recs(_metadata, self->fd, variant->recs);
 
 	if (variant->splice_ret < 0) {
 		ret = splice(self->cfd, NULL, p[1], NULL, sizeof(buf),
-			     SPLICE_F_NONBLOCK);
+			     splice_flags);
 		EXPECT_EQ(ret, -1);
 		EXPECT_EQ(errno, -variant->splice_ret);
 	} else {
@@ -2854,7 +2855,7 @@ TEST_F(zero_len_splice, test)
 		 * below blocks until the harness timeout.
 		 */
 		ASSERT_EQ(splice(self->cfd, NULL, p[1], NULL, sizeof(buf),
-				 SPLICE_F_NONBLOCK), variant->splice_ret);
+				 splice_flags), variant->splice_ret);
 		ret = read(p[0], buf, sizeof(buf));
 		EXPECT_EQ(ret, variant->splice_ret);
 		if (ret == variant->splice_ret)
@@ -2869,6 +2870,31 @@ TEST_F(zero_len_splice, test)
 	close(p[1]);
 }
 
+TEST_F(zero_len_splice, test)
+{
+	if (self->notls)
+		SKIP(return, "no TLS support");
+
+	zero_len_do_splice(_metadata, self, variant, SPLICE_F_NONBLOCK);
+}
+
+/* The socket's O_NONBLOCK governs the record wait, as on a plain TCP
+ * socket, so splice behaves the same with or without SPLICE_F_NONBLOCK.
+ */
+TEST_F(zero_len_splice, nonblock_socket)
+{
+	int sflags;
+
+	if (self->notls)
+		SKIP(return, "no TLS support");
+
+	sflags = fcntl(self->cfd, F_GETFL, 0);
+	ASSERT_GE(sflags, 0);
+	ASSERT_EQ(fcntl(self->cfd, F_SETFL, sflags | O_NONBLOCK), 0);
+
+	zero_len_do_splice(_metadata, self, variant, 0);
+}
+
 FIXTURE(tls_err)
 {
 	int fd, cfd;

-- 
2.55.0

