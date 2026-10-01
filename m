Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465D24E73BE;
	Thu,  1 Oct 2026 22:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790894513; cv=none; b=ahFPXa/CEEtGv6eypuv8xMM7G0Un4XpWmmISrfOJtQKserYILo2Xkc4MAaxwBWML5DqMX/aPEfCZ5DXIv3vsCwaok/srPUxKWOwomphcWD3A5Rrd4Zh5Lq511JIcnlszoCjAnjTjEEr+GQp7buhzDTZpooHrxCFpHGbaW67jHBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790894513; c=relaxed/simple;
	bh=dP0MLuUgDtOfR+y76IXvw8+FMicnMvani7ejifDzEgE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hUS7OXgP1QQc4rkOkLSklw6UacLqvXWV1/Iz4UOyA48RSXUZ/CXl+eh834jNGmhlDKm0+PeL4HbK2CEtPRGFEKtm7nXJ2BjYTTseKJdxe7PwvFeYynoJNP/+iWRwEnRuVZW19plFGYwB7j6081iPpUJG0cEtUzijHcOrZeQyTFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eLCJ2VSt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eLCJ2VSt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A71F91F000FF;
	Thu,  1 Oct 2026 22:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790894512;
	bh=oBjF8xKHg0K7tMX3j+pWx7Sug2E3hcNd7h135B1gOjo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=eLCJ2VStq/Gr3+ZyEUxubQCDR910p+5EKNInzDIN7tnT4CuH3VbTJ+wZU3UQ6Glz7
	 paImJ5ajLfY3MnVLBus7EewP63nwvORoUcAzMyd6hIEQUOKZxuvArJdQQS09z/gBVn
	 6fCV/LJcWMA7xzD4j/FcO+6bFDfZ74hWGOb9c+01M2Atr5sYO+oH7ipz+yhpw9xMzV
	 s6X3C6ZKtMKqhD4eeW+dDaTb4/G0yDBZ+g2sll+lD/hbOlmaoq8GWmKPBZnrVKwJGR
	 Z9ipIl7VneL0WAJ77JcPO1MEAAwUZvDuD1Joe2G3cFjGf83RCLWVhRnbAA3xNoky9K
	 ROy9KK4seDf8A==
From: Chuck Lever <cel@kernel.org>
Date: Thu, 01 Oct 2026 18:41:40 -0400
Subject: [PATCH net-next v2 8/8] selftests: tls: cover splice on a
 nonblocking socket
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-tls-follow-on-v2-8-2dd1947bb642@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3288; i=cel@kernel.org;
 h=from:subject:message-id; bh=dP0MLuUgDtOfR+y76IXvw8+FMicnMvani7ejifDzEgE=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBqvuGqfK33aaApbXPDD3a/b04+OZwWDxfJqbdQ7
 ZyXPNBWgSOJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCar7hqgAKCRAzarMzb2Z/
 l+auD/9LLMD4KLPCy13xfLZ61YTvuy4sEmbbX4xr3p7Cqcata7aNpZxzNqgvNXRt9CQpG74s4n5
 FTPgixBakDb8Bb4PKfc7HoPpMCtlMS7kiuLaWZtO+9RlZDfZ5bSrfabQwX3Vdqq2pkfzlEnxe3G
 qg5ZrGf4g9GpX8Lx8nQCMtN9WNrJoZOGK49ecSoHYHWX5+xrJ/MpF9xI1OTf8Hb5e0yHYwL730+
 Bs7CiAgGrlJotvVo5enm/EsLeH7m/thWSgkVwVRWZymUE9W3t3kwi7TWeG9k+zXw18Z7aCfwpsc
 89g2qVtOAem/e/I/qYDiIQPg9LqDEp2niPzQaFjcIn3mQUSTpZg/vbV1wpFC/vBXuf0JpizZhjt
 xBZTZ9qVcx0RtP7tuoxc6jqkkfW48cJqNrEjh/7sLDldNeDRRolLafSXkNnYupoxcojrRgjuiOG
 lo66M58F5Wy5EvFIDRDtp8x0fWPKDdsrVu+hVxcMsmI3tozaZkHk+s+EOmbrHiXHUayPmcNfT4t
 tfrnTu/+4DLrpqlUXZ+C0Bih88RjdpEww13O/9oWWr9bSR6PNZlp4xOXHFCnWf3gCay5KNk02DQ
 tYTxr8c7gwOW94sGNZ3aP2KbL6HsOk8Y8gzbbqsXJtXbTnEtChrtQbEmPfl7uFCKaX6FWzxDDHw
 0/oiz8PdlMx1Cqg==
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
flags. Both forms must reach the same outcome, so the existing
per-variant expectations carry over. A kernel that ignores the
socket flag sleeps in the EAGAIN variant until the harness
timeout rather than returning.

Signed-off-by: Chuck Lever <cel@kernel.org>
---
 tools/testing/selftests/net/tls.c | 40 +++++++++++++++++++++++++++++++++------
 1 file changed, 34 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/net/tls.c b/tools/testing/selftests/net/tls.c
index e6876b8caac8..6207a90c5f07 100644
--- a/tools/testing/selftests/net/tls.c
+++ b/tools/testing/selftests/net/tls.c
@@ -2820,23 +2820,24 @@ FIXTURE_TEARDOWN(zero_len_splice)
  * A control record behind the run reports EINVAL, the error splice
  * already reports for a control record it meets first.
  */
-TEST_F(zero_len_splice, test)
+static void
+zero_len_do_splice(struct __test_metadata *_metadata,
+		   FIXTURE_DATA(zero_len_splice) *self,
+		   const FIXTURE_VARIANT(zero_len_splice) *variant,
+		   unsigned int splice_flags)
 {
 	const struct raw_rec *payload;
 	unsigned char buf[128];
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
@@ -2844,7 +2845,7 @@ TEST_F(zero_len_splice, test)
 		 * below would block until the harness timeout.
 		 */
 		ASSERT_EQ(splice(self->cfd, NULL, p[1], NULL, sizeof(buf),
-				 SPLICE_F_NONBLOCK), variant->splice_ret);
+				 splice_flags), variant->splice_ret);
 		ret = read(p[0], buf, sizeof(buf));
 		EXPECT_EQ(ret, variant->splice_ret);
 		if (ret == variant->splice_ret)
@@ -2861,6 +2862,33 @@ TEST_F(zero_len_splice, test)
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
+ * sets it. Deriving the wait from SPLICE_F_NONBLOCK alone sleeps here
+ * until the harness timeout.
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

