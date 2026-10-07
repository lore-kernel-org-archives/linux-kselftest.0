Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69F34E781A;
	Wed,  7 Oct 2026 19:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791402600; cv=none; b=SxmjLI3K8wU/SKrtEZyQGBfJA9nsu+8bX+s5nLsdxktJ19regqYDZfo2OjL6Yw2QWv7ObZjx+3t5HmFI0lccXOuyOP18gr3TMA/K4XNPMQ0UbKaYCZDQSCamlH7AKZzNvLublRDRUv95OfoZsg/OAfD7GaXwTwDtzMHJk75mmnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791402600; c=relaxed/simple;
	bh=6vwEB+jUOAvwa1H7r8hsU0XxMIdJxmXVm+BQYkDXVy0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MN5s1Cp5n+RBM929nAYbMbe1R1tvAaN6+p/uPwl5Bl0Gm/TELazqNIdAhi8lgZyvuqgKerxDhB4lCrEaVASzME3zhnGOkxgoYWsPc54jzWYBtDg0Y8/GeIKQbvEkZ1EluacWqSVA0R815Cw+XT5MJS4HXpcI1a6mLughiQ41rTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K6vddJbx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K6vddJbx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 890451F00899;
	Wed,  7 Oct 2026 19:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791402598;
	bh=37NykdREizaAMkH6IGcflJwIu7cgYM6UiNAhTQTN1C4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=K6vddJbxFJnRlQR6yY/XHHhSmOzvb4RpFU4xH8I4fpyaba/wqdgv+j8MhopByrccr
	 JmquF9J1b/uRBFR2lBEEFHJ4rSw2K6KAq4CubtT7XaITa+M+bcPjGiKBuR7Rg1UKCd
	 indBr2ee0cRk408oLrmEB01d9F8Eez2cfovfjIVqcBFutIyPs3cWCJABfg2er3Pzfi
	 cxjn31CjTQz872qY+aAVukFi1aifP6D1HqssvsCGhsd4jBGSVB4ccJ7105mrFGQPRE
	 hqaqrtU/3+qAhnXLITVTlgqNf0n7udYH2Dkkiiv26Sh+qujSRVUQ1EDg7tNwKKEX4f
	 7AzmmEb7iu6tw==
From: Chuck Lever <cel@kernel.org>
Date: Wed, 07 Oct 2026 15:49:38 -0400
Subject: [PATCH net-next v3 9/9] selftests: tls: Cover splice on a
 nonblocking socket
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-tls-follow-on-v3-9-6d52d98389b3@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3221; i=cel@kernel.org;
 h=from:subject:message-id; bh=6vwEB+jUOAvwa1H7r8hsU0XxMIdJxmXVm+BQYkDXVy0=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBqxqJaQ92tN29oo61BSojeDZbGCouiQrGAjsjM/
 2UqEyiP/QCJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCasaiWgAKCRAzarMzb2Z/
 l4/VEACmTe5xzez4BqOS9hX8WUSt1S1v7rQiQBQCa9bjQsJN0XQVGdKVsEbMi6az4gF7uPScnsY
 0sHmy4zJ7d1SxT8irv9UtMW6RWJUnfcJdUkLU/tKglA9mIEGsJdrgjiYmEHPBK9SP/Qq+TWCMx2
 W2UVC8sS9RcksjFBtObKcDBaPy1DrnxELKqcQ1saCLvxjEKBZLHejBsrw8652QRkh6TCPs/6K1a
 tusOj/RhKY6Pdyig0MV9/va4N3eqEBRyXnL1KPh4q/M6GWPX7+4RYY6tG1iVXPBrNGM3uegRsot
 WV3o7gPgIRrjh7+ZAGBxmRfi1jwCuyUtqfw8hleMiSDxeIISYGK+p8RYUCSarb23EcbgBxu6Ytb
 36dXxQAUKdf0Q+JKq9JoYTLToL3p6mwwhRF41RMmFZeDo9ZXBjuMMzrXbOBhljbHZUqr4UTNpo9
 EsG8JpA/x01twA07kCu5bd8iby7DAtTiWhtZuqDy9uFv+Ul2coYThtvYgmHx/dCS7q4Umyp/M1G
 CNiAEzSIRhbFSt+7e/3lcI0+/k12JMhFInj1JYhdK7t2GoP/iOaTfl88fDnkF/zguluLygaUC4H
 uWJaWgoF2Yu4HboWMwqWbRtlxNVKC9XykJzlc6ZlP/8ignwpM2tcDCEBFN76GstmpNl8tLEbwOi
 ULtcYgOvEsE5u6w==
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
index 5ff77f1c40c6..557dae37b3f1 100644
--- a/tools/testing/selftests/net/tls.c
+++ b/tools/testing/selftests/net/tls.c
@@ -2823,7 +2823,11 @@ FIXTURE_TEARDOWN(zero_len_splice)
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
@@ -2831,16 +2835,13 @@ TEST_F(zero_len_splice, test)
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
@@ -2848,7 +2849,7 @@ TEST_F(zero_len_splice, test)
 		 * below would block until the harness timeout.
 		 */
 		ASSERT_EQ(splice(self->cfd, NULL, p[1], NULL, sizeof(buf),
-				 SPLICE_F_NONBLOCK), variant->splice_ret);
+				 splice_flags), variant->splice_ret);
 		ret = read(p[0], buf, sizeof(buf));
 		EXPECT_EQ(ret, variant->splice_ret);
 		if (ret == variant->splice_ret)
@@ -2863,6 +2864,32 @@ TEST_F(zero_len_splice, test)
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

