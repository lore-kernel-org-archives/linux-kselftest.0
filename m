Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0043C060F;
	Thu,  1 Oct 2026 22:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790894509; cv=none; b=PP+C7dIesEve16V6mfeGSqnvBgFJWWD8Q4RBlU4IMVb8S2ZhzExYJ2sT3cYH71m6bm+op9Kx0/8bdfO5//6OXY+NJ6Jkr6imifJ8RP3hyau05eUltoxsM4PgzfPheQ3nyQEgKPdnZAuF0CUHSR4jIg5i8X2RHqvBYVDRPn6h/hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790894509; c=relaxed/simple;
	bh=gl06H5ac+GYvdgA09zGhy4HCp1QSnFsY3MUD/IgBh6g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aZLbOiaMLKXNJpN7YEnydtAZIQkFNKFIfWFUVWJwZlYntO08OPTQYjHpPOLCe6pmdpqUb1zCKBEahsrvlRGm8t4bofwUdUR3uz0tp0qDsCPERJPeSzeL1LGdjTKRnO6o8x1eiDQkhaveNdbVis4F2gsHuhbz9VaOWJkmKw5Ov+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZYCvSqZh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZYCvSqZh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 983101F00899;
	Thu,  1 Oct 2026 22:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790894508;
	bh=cvnAvOGjTcRaRmSVQHpISNvXNK2/LfKpauQ9tpCTvDI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ZYCvSqZhr747VtfDyB4k534vF6UybDbtdaM/z5lrISZtNQSwLeRbt/Sw1NMlDFcbK
	 pTFWU1yFs2kEBid/NfZUCki/nriI461/l/TU4BIK6+qg/HC1X6ywQiaJt+FC3XFCsj
	 6OmxbGsQXuF7nTBx2yGfzKs2p4M2b/bZSY9rNm/4iIdIqA+isS2M5rfgsAA9Wfv8F5
	 e4YJvZQNlKrTkdCkilZhHIqeL0mFT8acYqpPg7Yi1fF7M5CIr3kQT3+tGz4q8o3+PS
	 t08Sjo/RigjKsDsmQlFjSaJiHgC4Y4eOmOzyZu/m1vJzG4uJS8O7G00nkNUJ6MLtCX
	 Zl98bNW5cFQiQ==
From: Chuck Lever <cel@kernel.org>
Date: Thu, 01 Oct 2026 18:41:34 -0400
Subject: [PATCH net-next v2 2/8] tls: check for a pending signal after an
 empty record
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-tls-follow-on-v2-2-2dd1947bb642@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2034; i=cel@kernel.org;
 h=from:subject:message-id; bh=gl06H5ac+GYvdgA09zGhy4HCp1QSnFsY3MUD/IgBh6g=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBqvuGp5IWP7u1OQ7qJzwnYWpENfH1HcyDu1Jd2/
 wtc/Pg3q2qJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCar7hqQAKCRAzarMzb2Z/
 lwt5D/99t5DLkYb9kxuF6wwRVFDwRBgXYCebcBTZiNIbPTQz6Do7/UKnJbfbYgDEtj9HjGqNmX4
 9iHxQh9Or44LGLJgBLf3mgvMv/oN+FAGIfeZriMS/EifO7WGZq5uhNjhaWHDY/unP5MCVlI9mb/
 1TBFG/NtkerKsZH+K4Z3edjF5mQ1rPrPL5LLkqFAupT/YPwDOH8Ep0ZCkX9k/RmWBV72OXfveiD
 gMtEMvdeQlU9aTKiY/Fd+POfN9z/l9xXUdd1A3zokUc82GTP7fJYV3Qb2RFthf+XJSPBjhyeuw7
 jX9hD+oJBUgA+plFYDNoSKe16fg2Mw6y3N49wIe3tHKSWVgfBQMg/Z9GdIpfzNNFt9zYMC+U3qp
 K4+COCy0dniTybalaa4UzrEDY+FwZrpRVCNRbwiL9MXek2MneXjrQonprPT7wcglld0DlOxSnDU
 s1trXHs3mY2Nj3psbvPw6ReGN6Pj31z2W78WlJuumCezUg0hVuffCnfRD7WWy8FqK4MCd3IZ1h5
 Gatif8mRhKWN9UBkmV7wUwrI2x9ChB6kZCKx5neTnqL4zgCMxxWR4SpY8E1mEYjVhvNdGsrz7T9
 lJZjd85EYTsSC5PVwztK6xEtZ6npQ6XtZIiIUKwXBx6022ZyvGYzcLZe3fVcie0IR1bn3SKt7+J
 WsZipizkjXXBqAg==
X-Developer-Key: i=cel@kernel.org; a=openpgp;
 fpr=28B2E5B01286DF243CF23EFE336AB3336F667F97

tls_rx_rec_wait() tests signal_pending() only after it sleeps, and
it skips the wait loop when a record is already parsed.
tls_sw_recvmsg() calls it once per record, and a zero-length
application_data record advances neither of its loop bounds. A
peer that streams such records holds the caller in recvmsg(),
unresponsive to SIGKILL, for as long as they arrive.

Test for a pending signal in tls_sw_recvmsg() before it fetches the
record after an empty one. A reader that has copied data returns
it, and a nonblocking reader gets -EINTR. The test stays out of
tls_rx_rec_wait() because tls_sw_read_sock() also calls it, from
callers that cannot act on a signal.

Fixes: c46234ebb4d1 ("tls: RX path for ktls")
Signed-off-by: Chuck Lever <cel@kernel.org>
---
 net/tls/tls_sw.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
index c78471c53f2f..ee50b9028264 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -1824,6 +1824,7 @@ int tls_sw_recvmsg(struct sock *sk,
 	bool is_peek = flags & MSG_PEEK;
 	bool rx_more = false;
 	bool released = true;
+	bool nodata = false;
 	bool zc_capable;
 
 	if (unlikely(flags & MSG_ERRQUEUE))
@@ -1858,6 +1859,16 @@ int tls_sw_recvmsg(struct sock *sk,
 		struct tls_decrypt_arg darg;
 		int to_decrypt, chunk;
 
+		/* A run of empty records advances neither loop bound, and
+		 * tls_rx_rec_wait() tests for a signal only after it sleeps.
+		 */
+		if (nodata && signal_pending(current)) {
+			long timeo = sock_rcvtimeo(sk, flags & MSG_DONTWAIT);
+
+			err = sock_intr_errno(timeo);
+			goto recv_end;
+		}
+
 		err = tls_rx_rec_wait(sk, flags & MSG_DONTWAIT,
 				      released, !!(decrypted + copied));
 		if (err <= 0)
@@ -1910,6 +1921,7 @@ int tls_sw_recvmsg(struct sock *sk,
 		/* TLS 1.3 may have updated the length by more than overhead */
 		rxm = strp_msg(darg.skb);
 		chunk = rxm->full_len;
+		nodata = !chunk;
 		tls_rx_rec_done(ctx);
 
 		if (!darg.zc) {

-- 
2.55.0

