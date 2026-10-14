Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6156A568FC0;
	Wed, 14 Oct 2026 18:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792002541; cv=none; b=SWiSqEh+nbZJ4LeAqCd1DJ61zgRsXCx2AtdU0sIdmM/BNN44/4ObqwdKwvWjXPUA6pdau38SARAOTDXlKG1jKAS9YR/ZWE7G5IpaxjEcVrrD9hDltF3DNsRS1TzVN6bOOeZJyQpyAcv/aSCvumKNbLwdRD7tH40xBJSEqPRtk3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792002541; c=relaxed/simple;
	bh=5JefvHpiY0ExCFItfFzC7Cg7MQcEg2ZpB/C1lSxifio=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=avokCrGB40jI8e4bjEwpkaRhHLZUq7eywkFePZTYy5Wr/UpUCT/SwkEUTU5+Rm4CDk0ktT3l6Llb+c75+ltbXaSbmsZkKc6mm3fqJySqcAjJ5gXJltw+Y4C4ANaRZuOiseeFhxJFqRF3USZpZjaUeFMTZ3Jrzpc/GGbLx4284WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QCvueSJu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QCvueSJu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 337251F000C8;
	Wed, 14 Oct 2026 18:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792002539;
	bh=c08m0SSz8yv0yXkDgRUfof/w7MPLAwAuVJD4b/swrNQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=QCvueSJuEyP6HHwsDKWGpJHHzke9dd2Z9WD01MsGSk45TxhqWtXjIvJkUIvMQCgol
	 SDjZNQm503oiHyAO9+gOU32Vy+2ZX9Qojw4CWsNZfRq5rMZlMU2S5VNjHUoYCl6DsC
	 QwAhSWjoNAYK13XBNGlYE75cZjUP+HtU7nLxr4frlXwroLbgi4iBVJgQW8q0obEU8w
	 KLizcQrlNOo1w8W+MPZ9FQubsxBerbhxvkUTgpwIVsglI9BGDvxeRVhf3FI0QVEI00
	 xgNF1wZCfUxOTHDjp6Ag/LlmjTY1T/wtNGV/AEZJTPWbVzlN8CnG63gUchDSSrg+lY
	 56AFoxBmK5bSA==
From: Chuck Lever <cel@kernel.org>
Date: Wed, 14 Oct 2026 14:28:39 -0400
Subject: [PATCH net-next v5 09/10] selftests: tls: Cover splice on a
 nonblocking socket
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-tls-follow-on-v5-9-e76c301d4f05@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3221; i=cel@kernel.org;
 h=from:subject:message-id; bh=5JefvHpiY0ExCFItfFzC7Cg7MQcEg2ZpB/C1lSxifio=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBqz8ndwVUJey3BB+btszwAsu0BpV49kHwUwJ5EV
 81P+J0Ei3yJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCas/J3QAKCRAzarMzb2Z/
 l0fRD/99evQtztTUYSUbJ7XuIUFiHgdYJQ2ryGN5iRiz7U2R3BH16LyJbF1fiWp5/y4UmsoP2ni
 5lfX0G8qX2NVXNRmDijE3nuyelYLr1keuNmQ4sDBexIFe0yjhIXQD8wa1v3V9XCwiBytzH1fkHT
 abWFd3de8lqcZeStFAtt6n2t9h6yuvVSLKFl7Mu0qQ0nlmWXEdQdb9zzDFNnqHz9bhXZGLpjq78
 ihRUGTCEaFQJWX2cfGf29G3V+ZwGHKlam2JfXniKppMdYQWc1o44gYQiIXSspFHa8Buqx4IbS9q
 lO/Pbpt/3SnBvyGWs+sYR8xbC5S7ZLFPEr7CW/yqbQLd+1jwpvjy9txbuGCw3AMfGXtLHiFZa/p
 J5vjIzW755JLYc+/5wZO4+gN0HyC+3DTbPNM6DcSc+tD57dDuahdaKRMzKXC0PALMYlsH3zfJVU
 mojeO41QZsrUL5q7jtcqWFHcyhO4Fn7gbxgcHF5hYdWGtqdNS3CEKYz5iCYEfhJlwhdXDeTXDRI
 lgi+u6klM9fDvHSN6OSHiz/+wwD6wuAzRNW0yyi3VtHFat+1sg1lijGtNFFcDnyR4gtpvmn9CQn
 VEM5kWn3584WEtk+4ICE5ue83XsLWY4m+FwwSVs2BpJxzbFkJL1J6PNhS807FJX1PyAyribJUMT
 0i0kqaPwjV5Q+1Q==
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
 tools/testing/selftests/net/tls.c | 39 +++++++++++++++++++++++++++++++++------
 1 file changed, 33 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/net/tls.c b/tools/testing/selftests/net/tls.c
index 8ce5a9032960..57edf6e6640f 100644
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
 		 * below would block until the harness timeout.
 		 */
 		ASSERT_EQ(splice(self->cfd, NULL, p[1], NULL, sizeof(buf),
-				 SPLICE_F_NONBLOCK), variant->splice_ret);
+				 splice_flags), variant->splice_ret);
 		ret = read(p[0], buf, sizeof(buf));
 		EXPECT_EQ(ret, variant->splice_ret);
 		if (ret == variant->splice_ret)
@@ -2869,6 +2870,32 @@ TEST_F(zero_len_splice, test)
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
+ * socket, so a splice without SPLICE_F_NONBLOCK behaves like one that
+ * sets it.
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

