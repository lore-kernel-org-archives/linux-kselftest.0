Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD55D223DE9;
	Mon, 27 Jul 2026 00:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785112438; cv=none; b=GMh9udGn2JhEzcnYsslQ8uhI4NOdrg2STyvjIPg2QICaxn98O9zh+mllWIBGnKKv6A9DEZwJRgn0z56PzBSkXCyXmS4QUKhiReizceoJgz8xiUGuPK8TSsDW+6+UP+Dhi4wlEwIiBhZNfKtDx4Tq9AI0SPZqckajmVH21rszzFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785112438; c=relaxed/simple;
	bh=sOaQ2FSWbuc1wGZgWpVrPzCm3/pSLywsFAZEyo+GFY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jOSridt5oVOXCR147qspGoAB0ptyvB9aSH1CebVI1lUu83JA0YhsPBFHz8lWNOXw50B2lZdVgq0o3vK3BQ61krMXBZePf3w6QL18orW20bJBtFm0bZv62hj/rDPO6MSNZMSziq1yFRsPOmR20i3+VEoqVReKbI/omzyZIzlQbHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VIE9XCWj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VIE9XCWj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C8951F00ACF;
	Mon, 27 Jul 2026 00:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785112436;
	bh=BAwhA2kCKE7sPbH3qIOulBop0ZwjU5zdVf03X4xMTIo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=VIE9XCWjIpoEIilT35YHWOvT9ITDI6+6UPGMc7tbHBvzhrcx3eZxDstNaUKz7qt1a
	 3EdfFOcS+MXb5kllgUvSuTnn0LorQpAcn/6GU4Z5E9zWrLCxyhrDO8TEEj/G+TMjag
	 CMQMNtoLqCvPjg8YGKqB41TqQeolyyR89gqQtvAz1DUvWU4N3eqzPVSYsVf8yDjTyB
	 rBrnoRLGJs+yRzOKvzQ75+PRBUV7LJWnavmCX2T9zHZPw+ZEMUoaNuxqAvs7Xr9676
	 +DT9C1JOrkw6KK9/eZKO9/kx6lkoxjOgEr7K1bTUb/Q+bpxQb3r+Cav7jZJCQbUsYu
	 JAvweDwG6ABBQ==
From: Chuck Lever <cel@kernel.org>
Date: Sun, 26 Jul 2026 20:33:36 -0400
Subject: [PATCH net 8/9] selftests: tls: cover splice on a nonblocking
 socket
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-tls-follow-on-v1-8-99bf4cc1c729@kernel.org>
References: <20260726-tls-follow-on-v1-0-99bf4cc1c729@kernel.org>
In-Reply-To: <20260726-tls-follow-on-v1-0-99bf4cc1c729@kernel.org>
To: John Fastabend <john.fastabend@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Chuck Lever <cel@kernel.org>, Dave Watson <davejwatson@fb.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailer: b4 0.16-dev-da966
X-Developer-Signature: v=1; a=openpgp-sha256; l=3643; i=cel@kernel.org;
 h=from:subject:message-id; bh=sOaQ2FSWbuc1wGZgWpVrPzCm3/pSLywsFAZEyo+GFY0=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBqZqdqUqtaRzGixo+kzrInEbUOcYk22/Z4u8nhf
 Qqx3wNb8fmJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCamanagAKCRAzarMzb2Z/
 l5SMEACi5LUq38Uz92VnBVSArzj2EVpQV3bsZjlOzPWkHu2Jt6RvbN1rf0ziZnBP6tyH+6HW8NB
 G2cPL0eh98dz5jmo6QDcVSHxuEy1qmRRQnGpMsH7q2MH42n4Eum5wpyhdkjg6hh/weuxjVeykef
 DJzqR+FFZ4nvmx6DRaGbRYNdhvCfpUSdCW6MbxUt3fqJMoIXghKKOdbCC749lDjVwldNBb4SWML
 5kmf9S0FMiiiVG855GCPzdD3Hh4k0uVOgRbQ5cVsyC+9nTPy8yDPHcz2AHaj2ao7PzpgXHuEbSl
 08IIcwAi8hD+x7E8IkgozkPtQIFFyILGkN7yNVYGo1fpmvE61NALr5GTqVhjBsG22nNc/2/8aXK
 qmSMMKKuzbocelaM1PHmUyHDm1/NWXbC1h0aQjRHHzJdlXQJff66BmuOjo1tKW0p3puIg9j9Nba
 FTV0tiPxCrfhVUWK8HxV1muBG676SzlCia/S0LyevC+UK2x+81QG/sln0mK4Mqih6ou6PryYeMH
 KhXFaWB2u0JFpUTLPeLXltVjBGbMBt/I5mTffo7OBTK77woQlqFPfqfHRRh5Bk87oasIe32J7NE
 sibhcdLIHKVpksslpsXtLTjJN1Rk5fmbRAmUGeM6DPsikd8CtxxdPIE5dWmR0RkGgKk3yUE0cYc
 PKdCsqKx1Irp8ag==
X-Developer-Key: i=cel@kernel.org; a=openpgp;
 fpr=28B2E5B01286DF243CF23EFE336AB3336F667F97

Every existing splice call in this file either passes
SPLICE_F_NONBLOCK or runs on a blocking socket, so nothing exercises
the socket's own O_NONBLOCK on the splice path. A change that stops
consulting sock->file->f_flags puts splice(2) and sendfile(2) back to
sleeping in tls_rx_rec_wait() while a peer streams empty records, and
the suite still reports pass.

Run the zero-length record variants a second time with O_NONBLOCK set
on the socket and SPLICE_F_NONBLOCK left out of the splice flags. The
two forms are required to reach the same outcome, so the existing
per-variant expectations carry over unchanged. A kernel that ignores
the socket flag sleeps in the EAGAIN variant until the harness
timeout rather than returning.

Only the flags the two forms pass differ, so the body of the
existing test moves into zero_len_do_splice() and both call it. The
check that a successful splice consumed the empty records ahead of
the payload now covers the nonblocking socket as well.

Signed-off-by: Chuck Lever <cel@kernel.org>
---
 tools/testing/selftests/net/tls.c | 41 +++++++++++++++++++++++++++++++++------
 1 file changed, 35 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/net/tls.c b/tools/testing/selftests/net/tls.c
index af47d9a6098c..7c178541edf4 100644
--- a/tools/testing/selftests/net/tls.c
+++ b/tools/testing/selftests/net/tls.c
@@ -2743,23 +2743,24 @@ FIXTURE_TEARDOWN(zero_len_splice)
  * A control record behind the run reports EINVAL, the error splice
  * already reports for a control record it meets first.
  */
-TEST_F(zero_len_splice, test)
+static void
+zero_len_do_splice(struct __test_metadata *_metadata,
+		   struct _test_data_zero_len_splice *self,
+		   const struct _fixture_variant_zero_len_splice *variant,
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
 		if (ret == -1)
 			EXPECT_EQ(errno, -variant->splice_ret);
@@ -2769,7 +2770,7 @@ TEST_F(zero_len_splice, test)
 		 * would then block until the harness timeout.
 		 */
 		ASSERT_EQ(splice(self->cfd, NULL, p[1], NULL, sizeof(buf),
-				 SPLICE_F_NONBLOCK), variant->splice_ret);
+				 splice_flags), variant->splice_ret);
 		ret = read(p[0], buf, sizeof(buf));
 		EXPECT_EQ(ret, variant->splice_ret);
 		if (ret == variant->splice_ret)
@@ -2789,6 +2790,34 @@ TEST_F(zero_len_splice, test)
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
+/* The socket's own O_NONBLOCK governs the record wait, as it does on a
+ * plain TCP socket, so a splice that omits SPLICE_F_NONBLOCK reaches
+ * the same outcome as one that sets it. An unfixed kernel derives the
+ * wait from SPLICE_F_NONBLOCK alone and sleeps here until the harness
+ * timeout.
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
2.54.0

