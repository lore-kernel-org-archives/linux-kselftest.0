Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439404A4993;
	Mon, 12 Oct 2026 15:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791819017; cv=none; b=hypynTXJORcSQZcDsW6yXJAcqA+o/lC5r7lUXOBRtqLKvfvFGPyVGUD2CeA+5OtvpgRLixz0zkkji8UnafDKDq6Bihj0dLKp8zDwmqyXIKEufitzIGSnFgem7nT9OuLjQ3toDNPDuwdvlfWUYRlPl9LKNqZ7vlzsnH+j4V/ckOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791819017; c=relaxed/simple;
	bh=5JefvHpiY0ExCFItfFzC7Cg7MQcEg2ZpB/C1lSxifio=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oyJwSWNDShw21F8kplpdl0y2Vw58qWi3asM6H4T7kly6kPAX06/EkVKemIkgMsB8FOrlJzqeKjNTb2Yg6I2tLjHHczpVl/ZoiZoSC7k7Bb2ISvF3X6XtyetU6yAuw2Bm6923t4Bwl05Y/6sHsn230pYrVht0qMtHeH3y++XvnUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NbIPq4EK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NbIPq4EK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D46EA1F0089C;
	Mon, 12 Oct 2026 15:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791819015;
	bh=c08m0SSz8yv0yXkDgRUfof/w7MPLAwAuVJD4b/swrNQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=NbIPq4EKfSrBOKxBnnjo8MxzWYp9YSVXgHNHM6h4E/jeiTXL4tOfU1V+p5FK88JI+
	 9X/OZCdLVY1knuuAzr03uBk0zTl1ZRnnCau+4dY7MYXhSrWYpKN+Zv7j62icR5iLgE
	 lPhZPnGO8dSn5ynmGG0k80n3xoeAuIUO2FMb5d2JsCZw4Y2y7Cb2QS8/XCvZ58+uPw
	 iGB9/spQmnKCBX39vPQ3MGBT86DAZK64kQJ8oRdySFtAH0RSvrKyZ33xXLcRxW29Xf
	 +EjYdzrqdcy/3+OEsa1do1upOltaEKJjRNn/CVtwQ7Cg+MoZ78jZOCueQ0xgRTesd9
	 Q56qH251MYgIw==
From: Chuck Lever <cel@kernel.org>
Date: Mon, 12 Oct 2026 11:29:57 -0400
Subject: [PATCH net-next v4 9/9] selftests: tls: Cover splice on a
 nonblocking socket
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-tls-follow-on-v4-9-8cea429565da@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3221; i=cel@kernel.org;
 h=from:subject:message-id; bh=5JefvHpiY0ExCFItfFzC7Cg7MQcEg2ZpB/C1lSxifio=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBqzPz6usYc4kDrWOd1+afDy6uLkdOwKHzK43rg8
 Rr2QJSlB92JAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCasz8+gAKCRAzarMzb2Z/
 l4TxD/0efozl7p96Am42aAaLoCEht8V4jx7ME3+fi3nE9uUfpagOmdYSq9RLgaPAc/qHb9lPwvN
 i5CHEer48scnuGqC5QTIg0n/qdKIzEh8sCwgYdG6WXD0mjl5qPQeggqA+tsNJgzlPl3h3NuKo69
 iCbpg48Eotv8AlgqGQ9KommzffFFufD9wGkIFUCK7S2V+W7LXlM1/ngHoVBlU1Db5YewBnLFN1q
 /V7VdnIcMK00PNxz+o1FLCynpdW278dmHrSpukwGgtK6ix0goCjJhOTxznKMwo+AA1JXLOzTTDl
 H+N/owFH6PS3El6hpOOFwBqRHdr3cj8/+iHUHn8z5xTc+CMP5laiCZbR9rBXX7egMIvKyvmJ2hd
 gNPgqaB03Q3B2Oj8/tzNyNX7cvOb4tiXC44/fJFqkVbxpE34aP+p6epYE1smP91tvVdclKUMHOt
 Hu5a0gg6yIWNoL4cWVaKA11F6r/UDS+zgA+OGRCmzNezyAsZMhIJ7DCwtxHWIRjcbqX6nIB5gej
 1+3pkSE4GXnuhzDtXnIP8wIdZkWKXSxlB9WAeXQqOsoOZFxHqxgRf/sjcoRDoEbb90VyzhZtCAZ
 jYPgKiyCdfSQottTium6qFf7i9RygEsZPNqygBjtnuEEhBrcoMLFsaNIzYAxmt72hc7g3HoxIUY
 yUntJQS5TQ9jNMg==
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

