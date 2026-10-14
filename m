Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B9056C65A;
	Wed, 14 Oct 2026 18:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792002539; cv=none; b=cmnJGjvq0ZVVnQiDP6tY3dMpSzR7YVG7UwXVdfZPiXucfxO78dBPILqoqw5oocxhHj3KJVdaZNlUNUdJmfWvOCUW6H0jNDVl+r2VHER49F5/Y94+33P41YIfqo93kQ76HQoetgWrUO5F5C1/FsLTJ7J0DumsGIReSMXRhIx6CUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792002539; c=relaxed/simple;
	bh=z7YMOinxv/vs+9WrZ6LqmqfwMlldsbcMi98arW+c0xs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XROy89mbHk5tkSPPw185Ke0y3svUBUMK/2JmFWC7dXLObAL2iSCMblR/E7Uh6XqJeX0uQwR1d2Z5hQQyZzNvMffkXs3but2vYRZImHVg9IYsyXEKdFCV4onKILV5iAw/pEg0ruZPYGE4stDkFilD4xUoeiBbX9qORrBgJB0SGOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cyW27wX8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cyW27wX8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BF671F000C5;
	Wed, 14 Oct 2026 18:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792002534;
	bh=BP43dl2j4OhXpXjaEGvJoxWcFfJpwjcTcmro5xhEnO8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=cyW27wX8T606k9g/qPPhSWWZCEHBbvux7P3qqmCc2VyaIX4ZfSHYAf8oR8NLCf+h0
	 imto/mYMHJx+iTqOBUJnZlxqCwdfI8pGWMZ0ZYST7gk9vuBrsWfyGDXK2pIEQSpfB1
	 Ui9CC1MdqZ1vxe4wsE14wZfySwbHEZFu7iWwnbPQR8Ij8ZZwU9Vayb42QiV8L5dK6H
	 DLgQX/8fJ6QLtk86tKz7iBxvJNBJo5Uj41OsXF6bM116peFEWksX1Ep0a1PGHoN3ja
	 mAmUxT10WgU/aT0hrv+SCafRS6v6C0NGOJllTOWMMw4RqPjJucCQ6laje0jZW2Wqs+
	 paJFJzKCUJ9hQ==
From: Chuck Lever <cel@kernel.org>
Date: Wed, 14 Oct 2026 14:28:35 -0400
Subject: [PATCH net-next v5 05/10] tls: Consume empty data records in
 tls_sw_recvmsg()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-tls-follow-on-v5-5-e76c301d4f05@kernel.org>
References: <20261014-tls-follow-on-v5-0-e76c301d4f05@kernel.org>
In-Reply-To: <20261014-tls-follow-on-v5-0-e76c301d4f05@kernel.org>
To: John Fastabend <john.fastabend@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>, 
 "David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Chuck Lever <cel@kernel.org>, 
 Dave Watson <davejwatson@fb.com>, Shuah Khan <shuah@kernel.org>, 
 Qingfang Deng <qingfang.deng@linux.dev>, Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 sashiko-bot <sashiko-bot@kernel.org>
X-Mailer: b4 0.17-dev-9c833
X-Developer-Signature: v=1; a=openpgp-sha256; l=2529; i=cel@kernel.org;
 h=from:subject:message-id; bh=z7YMOinxv/vs+9WrZ6LqmqfwMlldsbcMi98arW+c0xs=;
 b=kA0DAAoBM2qzM29mf5cByyZiAGrPyd2gzpya8LJdH2GSp6xvfMohxm4BRrpWRu+GdeWsvMiE0
 4kCMwQAAQoAHRYhBCiy5bASht8kPPI+/jNqszNvZn+XBQJqz8ndAAoJEDNqszNvZn+XK04P/R3B
 PB9RgK0/cl8M7RDgTvUuiv1mGJM1mt7lBdA5ClSBX5832PS6xSRQ6l6cvFer3CqiDV2iy7Cj+U/
 Cdyz/v/1hncSHBmMwyog7L/bgcm8BC5pmCxYLkrUf/Q/2G0ZvLeiMDM0IwSX8OftX+QMrcLLl+g
 69AE0VoeNWlm2jJehv8xkBCNmo6z34HFZsQFUGB0jaomm8DKGWtoYRNMi1g/FBkIMenTUwQMCxp
 HHzZbaEW13/pOQ5l4R3EVMWX2sbeDnOEfTOP5WPO39OiWSLn44buun5UCJQJsnYP8H25fJOS1fK
 E/8a0iiXMzguurT92ZF4hxwQAK9tXgca8Hrt0XugtsVBGRnLFnzncIVqzuP169DHrlX16fFYkEq
 no76U+dnz5xOz4YbDuWn/AJjrb5ChBQfte6TA0JoHf0mLloDGEBqSpupwgpMpwPiW/UwlYJe8rW
 bc8R8JepLGuMA4Se+MwvOrIHmUGY5uBKeCoKeUchqjtHdnUDd5PwakA18ppAnpzFvUvgFXwt4ox
 z2kpVZR6GgEWyPODDoY6oNKOYJKklIu2kooNAMTQdauJExnW6RGN5OkHmS+gG0M3qB4hYCexDg4
 T/bR+RHEB0yRfT7L3y7kfXf5nf8mkAkVRy/ZvJ2+cDky4C2dK12BCFHrRwkVsL8kzcosL5vLcWg
 3+zd3
X-Developer-Key: i=cel@kernel.org; a=openpgp;
 fpr=28B2E5B01286DF243CF23EFE336AB3336F667F97

TLS 1.2 and TLS 1.3 both permit zero-length application_data
records as a traffic-analysis countermeasure (RFC 5246 Section
6.2.1 and RFC 8446 Section 5.1). A record that decrypts to
full_len == 0 advances neither len nor decrypted, so
tls_sw_recvmsg() keeps reading empty records for as long as they
arrive. The peek arm and the async arm queue each empty record on
rx_list, and a peer that streams empty records grows rx_list
without bound. The growth has not been reproduced.

Consume an empty data record as soon as the receive loop has it,
before the paths diverge on darg.zc. Freeing the skb requires its
decryption to have completed, and an empty record is already
decrypted synchronously. The new branch sets MSG_EOR itself,
because the record no longer reaches the assignment at the bottom
of the loop.

After this change, tls_sw_recvmsg() still reads empty records for
as long as they arrive, until a signal is pending.

Fixes: 692d7b5d1f91 ("tls: Fix recvmsg() to be able to peek across multiple records")
Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260630191551.875664-1-cel@kernel.org?part=1
Signed-off-by: Chuck Lever <cel@kernel.org>
---
 net/tls/tls_sw.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
index 53a4af9eeeef..153ff135a395 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -1888,8 +1888,8 @@ int tls_sw_recvmsg(struct sock *sk,
 			darg.zc = true;
 
 		/* Do not use async mode if record is non-data, or if it
-		 * is empty: once a record has gone async, recv_end
-		 * discards the error that ends a run of empty records.
+		 * is empty: the receive loop frees an empty record's skb,
+		 * which an async decrypt would still be using.
 		 */
 		if (tlm->control == TLS_RECORD_TYPE_DATA)
 			darg.async = ctx->async_capable && to_decrypt;
@@ -1929,6 +1929,19 @@ int tls_sw_recvmsg(struct sock *sk,
 		nodata = !chunk;
 		tls_rx_rec_done(ctx);
 
+		/* Keep an empty record off rx_list. On the zero-copy path
+		 * the strparser owns darg.skb, and tls_rx_rec_done() has
+		 * released it.
+		 */
+		if (!chunk && control == TLS_RECORD_TYPE_DATA) {
+			if (!darg.zc)
+				consume_skb(darg.skb);
+
+			/* An empty record still marks a boundary. */
+			msg->msg_flags |= MSG_EOR;
+			continue;
+		}
+
 		if (!darg.zc) {
 			bool partially_consumed = chunk > len;
 			struct sk_buff *skb = darg.skb;

-- 
2.55.0

