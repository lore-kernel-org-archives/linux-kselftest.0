Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794423328;
	b=YyO2mrw1RvlQnGWUg1UMaGFfr6Gmb4S2PspPUEAcpnP56K6FXAGWgxucqktuZaFXgiUK
	 31E9QIaY0C689sco8ZkbTwOKCL9K2WhLZHOmU6dcjAAJLPKh/s4KxBfEgZM5EHuIdMRPK
	 r8ox5i66otVQYu1NXi5cctixNvvp9gLrrMKXr2ywvVotyeyDA4JaTnIFI7CMffJ39+kMW
	 SnS4eNm3bwp8tKFqsk/vsWJJ8M/LvtOAh+/ENDx8DaqZyuEwl2VV9zVl74qcdv+YRQlgt
	 dSbJWDy6ABgfc8uR9C79dEP+SPgTAYtehOPUJBFgnUBpr6YN9jI2bH8sY0bVE/T7M/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423328;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=wCAr+Te3jqmrhBf9HSf5LhEPb+FzW7crY3KCEXAyqQQ=;
	b=IAXQN4X8EtKWPjyWInGoM9WLa0Jus3Rq9pybhEAj0VKdVg1v5/+aoXoKZnoW8h/1ijr4
	 q+MlO3+fViP0YuNt44hLoBwbz1U3Hqb5mWJY2DxGUtihjLeU8tCruy+xQPJDRhL/6LLu4
	 rXFLAyZwUFyYfqs7YKmxwsK07U7gAgPmTVObsvI4czVlRUfNqAqS6S7Bz2adgNV34NeYx
	 3oEYHHKcU+RV+gw9/QcVFMqt+bPkDo+8GpofFsiI6y5lqMYreKiOw9xd2DEStMR096aO1
	 mDnKrIJoRa3EqhGfWGUasBcrmrYk1JiEXwKwZkssLYKC8QD7DPXH3s7/pf2plPItaOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bHAsaZd4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E52606A331;
	Wed, 11 Nov 2026 18:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bHAsaZd4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A15841F00A0A;
	Wed, 11 Nov 2026 18:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794423328;
	bh=wCAr+Te3jqmrhBf9HSf5LhEPb+FzW7crY3KCEXAyqQQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bHAsaZd4okZ1CyY9I86Ngc18idXrAKl68bIRCbRcvPI2KaitAwAYVDZMirhIfsBVF
	 YkR/Tuci73vgLW7wRY24ePLopT4xp7y829yxvO99r2bsF+xzyeVoty+66SxYi3K2Pe
	 OGQq46PVSLBWTp+DhPKbnxqS0OQ6S7R8xwcY3Ha9YTU9JZ7ILc9NCwL3nyR3rGR/tI
	 1vZtryvKEXTMtrei0oz/MfudtM1/H6KCRAS31cqAr1d/9921unFK78mQp/RceNbab9
	 PIkJlPTQRXIlm8gHfm96cP+GkT8dJjewTrHFaXWtXO5f9jDBXLauvfis1LpuZWApKT
	 dN5qGGVuOGv4w==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	sd@queasysnail.net,
	john.fastabend@gmail.com,
	shuah@kernel.org,
	cel@kernel.org,
	linux-kselftest@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	sashiko-bot <sashiko-bot@kernel.org>
Subject: [PATCH net v2 1/5] tls: Break the connection after a burst of empty data records
Date: Wed, 11 Nov 2026 10:55:18 -0800
Message-ID: <20261111185522.2859004-2-kuba@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111185522.2859004-1-kuba@kernel.org>
References: <20261111185522.2859004-1-kuba@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TLS permits zero-length application_data records, and RFC 8446
suggests them for generating cover traffic. Nothing bounds how many of
them a reader processes back to back, though. They advance neither
loop bound in tls_sw_recvmsg() and tls_sw_read_sock(), so a peer
streaming them faster than the reader decrypts them keeps it in the
kernel for as long as they arrive. recvmsg() does not check for signals
while records are ready, and its peek and async paths queue every empty
record on rx_list. read_sock consumers like nvme-tcp hold the socket
lock throughout and never get control back.

Break the connection once a reader decrypts more than 128 consecutive
empty data records without sleeping or returning to its caller in
between, treating the burst as a protocol violation like a malformed
record header. A stream of empty records which the reader keeps up with
costs no more than any other traffic, so the count starts over on every
read and whenever the reader waits for the next record. The strparser
is stopped before it parses the next record, so the reader gets the
error from tls_rx_rec_wait() and no later record is delivered.
Returning to the caller and keeping the connection alive would need a
way to wake read_sock consumers which installed their own sk_data_ready
after the handshake, a lot of code for a peer that is either broken or
malicious.

Consume empty records in recvmsg() rather than queuing them on rx_list,
so that repeated MSG_PEEK cannot pile them up past the per-read count.
Decrypt them synchronously, too. Once a recvmsg() call has decrypted a
record asynchronously, recv_end replaces the error with the result of
process_rx_list(), so a call that saw only empty records returns 0, a
false EOF, instead of the error or -EAGAIN.

Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260720-tcp-read-sock-v2-0-29545d034f3c@kernel.org?part=1
Closes: https://sashiko.dev/#/patchset/20260630191551.875664-1-cel@kernel.org?part=1
Link: https://lore.kernel.org/all/20261019-tls-follow-on-v6-0-ab01c4ecca0c@kernel.org/
Fixes: c46234ebb4d1 ("tls: RX path for ktls")
Fixes: 3be28e2c9cd0 ("net/tls: Consume empty data records in tls_sw_read_sock()")
Reviewed-by: Chuck Lever <cel@kernel.org>
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
v2: no change
v1: https://lore.kernel.org/20261109175836.1246840-2-kuba@kernel.org
---
 include/net/tls.h |  1 +
 net/tls/tls_sw.c  | 29 +++++++++++++++++++++++++----
 2 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/include/net/tls.h b/include/net/tls.h
index e57bef58851e..0b001b8ab1c3 100644
--- a/include/net/tls.h
+++ b/include/net/tls.h
@@ -139,6 +139,7 @@ struct tls_sw_context_rx {
 	u8 zc_capable:1;
 	u8 reader_contended:1;
 	bool key_update_pending;
+	u8 empty_run;
 
 	struct tls_strparser strp;
 
diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
index 23eb94d9da6e..65e578c8c612 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -1146,6 +1146,7 @@ tls_rx_rec_wait(struct sock *sk, bool nonblock, bool released, bool has_copied)
 		if (!timeo)
 			return -EAGAIN;
 
+		ctx->empty_run = 0;
 		released = true;
 		add_wait_queue(sk_sleep(sk), &wait);
 		sk_set_bit(SOCKWQ_ASYNC_WAITDATA, sk);
@@ -1565,6 +1566,7 @@ static int tls_rx_one_record(struct sock *sk, struct msghdr *msg,
 			     struct tls_decrypt_arg *darg)
 {
 	struct tls_context *tls_ctx = tls_get_ctx(sk);
+	struct tls_sw_context_rx *ctx = tls_sw_ctx_rx(tls_ctx);
 	struct tls_prot_info *prot = &tls_ctx->prot_info;
 	struct strp_msg *rxm;
 	int err;
@@ -1582,6 +1584,19 @@ static int tls_rx_one_record(struct sock *sk, struct msghdr *msg,
 	rxm->full_len -= prot->overhead_size;
 	tls_advance_record_sn(sk, prot, &tls_ctx->rx);
 
+	/* A peer may send empty data records, e.g. as cover traffic, but
+	 * a burst of them traps the reader in the kernel. Treat more than
+	 * 128 in a row, without the reader sleeping or returning to the
+	 * caller in between, as a protocol violation. Stop the strparser
+	 * before the next record gets parsed, so the reader finds the
+	 * error in tls_rx_rec_wait().
+	 */
+	if (rxm->full_len ||
+	    tls_msg(darg->skb)->control != TLS_RECORD_TYPE_DATA)
+		ctx->empty_run = 0;
+	else if (unlikely(++ctx->empty_run > 128))
+		tls_strp_abort_strp(&ctx->strp, -EBADMSG);
+
 	return tls_check_pending_rekey(sk, tls_ctx, darg->skb);
 }
 
@@ -1761,6 +1776,7 @@ static int tls_rx_reader_acquire(struct sock *sk, struct tls_sw_context_rx *ctx,
 	}
 
 	WRITE_ONCE(ctx->reader_present, 1);
+	ctx->empty_run = 0;
 
 	return 0;
 }
@@ -1874,9 +1890,11 @@ int tls_sw_recvmsg(struct sock *sk,
 		    tlm->control == TLS_RECORD_TYPE_DATA)
 			darg.zc = true;
 
-		/* Do not use async mode if record is non-data */
+		/* Do not use async mode if record is non-data or empty,
+		 * recv_end would report an error after empty records as EOF.
+		 */
 		if (tlm->control == TLS_RECORD_TYPE_DATA)
-			darg.async = ctx->async_capable;
+			darg.async = ctx->async_capable && to_decrypt;
 		else
 			darg.async = false;
 
@@ -1918,7 +1936,10 @@ int tls_sw_recvmsg(struct sock *sk,
 
 			DEBUG_NET_WARN_ON_ONCE(darg.skb == ctx->strp.anchor);
 
-			if (async) {
+			/* Consume empty records, even when peeking, so that
+			 * they cannot pile up on rx_list.
+			 */
+			if (async && chunk) {
 				/* TLS 1.2-only, to_decrypt must be text len */
 				chunk = min_t(int, to_decrypt, len);
 				async_copy_bytes += chunk;
@@ -1939,7 +1960,7 @@ int tls_sw_recvmsg(struct sock *sk,
 			if (err < 0)
 				goto put_on_rx_list_err;
 
-			if (is_peek) {
+			if (is_peek && chunk) {
 				peeked += chunk;
 				goto put_on_rx_list;
 			}
-- 
2.56.0

