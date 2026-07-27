Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C7E201004;
	Mon, 27 Jul 2026 00:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785112434; cv=none; b=l3f3kuoKHIv8NmLcbsyLWz6e3Y7y4bjsGDbbrBg0LTW3UOZEVtKlwoyWZMOLuMOS6uImOCmDIM90c6tURMM9srMdDPss3eE+9s+7wMTJXH/3076R5UJ6ASEHtbJlS61qEG7CxhJkxUrWdQf69BLkf12zdmHbPjAyOgCU3utnEVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785112434; c=relaxed/simple;
	bh=ZgCIY1q7PztCWFYdkp88EOPXcVoSzPaE7bXqCGFEoZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=neIY9Sh16uem7l13LGh8QBx2JF9ZBdTITUrD6u104aHZ9xPVOhQYssGi8vpGuBBSXOs/gMlYYHXXeHzv/iEgP2Ty/qhha3cFCBDMmr4uOyNsIj/qI0bRkD2vyxWUiyrFTQlnl4mRJE/GjGnc/lXIKNgTU8ZKI9PINNQ6wPib58c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QcnLki5k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QcnLki5k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E89021F00A3E;
	Mon, 27 Jul 2026 00:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785112432;
	bh=KExwVhOahB+nM8eB50eUMKMDqda64xIAhJZ8KbRbbAo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=QcnLki5kWDC+qtvrUXnJ43ZNRsu9g1EE5dMxS/jVlyyHWfx96dL5yce8wfwPmYo8+
	 Wfy6FwxJBwamwdceHWqrTjX6WyxY83tvmorz41tu1C2NXfCkd5CNF9eFX/uJXUePT9
	 cJ3VyQFfxLCdNDgLmV/J2CTwbPDkxbzL3xUZP+leVdVZi6ac65CwARZidl5nfSasg6
	 sI0i7nYASkg6rf2vF4byEi7amhd/XTYZgBTVVotuHtzx4TEH8roXWpIG0zslmalLS9
	 +INqeOel82iM7nHxQMzobCxtBJSgip41pFYX5yNMeAIUbijX0g4MCYRcgYBl4puQhx
	 LWhREANQ45biQ==
From: Chuck Lever <cel@kernel.org>
Date: Sun, 26 Jul 2026 20:33:33 -0400
Subject: [PATCH net 5/9] net/tls: Consume empty data records in
 tls_sw_recvmsg()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-tls-follow-on-v1-5-99bf4cc1c729@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3052; i=cel@kernel.org;
 h=from:subject:message-id; bh=ZgCIY1q7PztCWFYdkp88EOPXcVoSzPaE7bXqCGFEoZg=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBqZqdp8xEX1b7jX06UOOLEPIWRzuy+lYzEvgdXf
 rz9W5X9NRaJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCamanaQAKCRAzarMzb2Z/
 l3DhD/4sLXdE6ucVNXLv4NasJ4tNPgDaF/DnDIvNrjcetU2MnUeEJCStuHN1jz4t2CmHm/JZi4L
 6PKcOX00tR9kq92ERUHp33rM+KEQs7KlNQMkX/5HG7CwUGbCiuKSM4WDUEvZ8DtJxhJ8YW4amMh
 1hykrFud6TMMRczMBO+MLgGy74WDaRo9LmdHILhGESDN1J6bKaw6kqB5KE4ZrLWe/VKKuEGdG/F
 rmUd7qXaVEuZHZ62eOkA+kxNpTabDA2B5tqHes4fmQGiOJyVlOeZ+4N9ixwW2qTWRYZBOctUang
 QjTJm+PJ6HpzBXb4aLr6F2eoob5vtcAjmfIp/qwgaByF9dcawK5R0u76fav/a/jU4IGsWtc+M/W
 0bpwaPdrsf65TG6Y5aOYiWDe9qqA4eJD3V7gOnMAhYYJ1I9ezoxLaBVOGjKnywKJ/tC2MACTCYX
 G64dQV1+Tpd5UwwXzOihbng5M1Qfux9FZiP6EsKd42x8w2XVi6D9tsUG9EyI//FRgbYGfwkiViq
 IyLPacybw2ManCD8Ir3Z8v0M9nfpqFED372BngDtClm2BicEco29DGffkqgJqTcFEIPWT2T141z
 /EnuZMdOT88xEAJQFtj09iR59ubk9dHrE+He/opFNdWeyHvd9IUqLlzir8QjLiUX4M+YIQurah8
 DyB2UrsPq5xyuJw==
X-Developer-Key: i=cel@kernel.org; a=openpgp;
 fpr=28B2E5B01286DF243CF23EFE336AB3336F667F97

TLS 1.2 and TLS 1.3 both permit zero-length application_data
records as a traffic-analysis countermeasure (RFC 5246, Section
6.2.1; RFC 8446, Section 5.1). Such a record decrypts to
full_len == 0, so every arm of the receive loop reaches
"decrypted += chunk" and "len -= chunk" with chunk == 0: len
never reaches zero, and tls_strp_msg_ready() holds the second
loop term true while the peer keeps records arriving. The peek
arm and the async arm also queue each record on rx_list, which
then grows without bound. tls_rx_rec_wait() returns without
waiting whenever a record is already parsed, so its signal check
never runs, and no other test in the loop consults
signal_pending(). A peer streaming empty records therefore holds
the caller in recvmsg(), unresponsive to SIGKILL, until it stops.

Consume an empty data record as soon as the receive loop has it,
before the paths diverge on darg.zc, and test for a pending
signal there. Freeing the record's skb requires its decryption to
have completed, so an empty record is no longer decrypted
asynchronously, and the new branch sets MSG_EOR itself because
the record no longer reaches the assignment at the bottom of the
loop. Bytes already received take precedence over the signal:
they are returned, and the signal is handled when the caller next
enters the kernel.

Fixes: c46234ebb4d1 ("tls: RX path for ktls")
Signed-off-by: Chuck Lever <cel@kernel.org>
---
 net/tls/tls_sw.c | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
index f85d8a639731..0e76b31b1291 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -1877,9 +1877,12 @@ int tls_sw_recvmsg(struct sock *sk,
 		    tlm->control == TLS_RECORD_TYPE_DATA)
 			darg.zc = true;
 
-		/* Do not use async mode if record is non-data */
+		/* Do not use async mode if record is non-data, or if it
+		 * is empty: the receive loop frees an empty record's skb,
+		 * so its decryption must have completed.
+		 */
 		if (tlm->control == TLS_RECORD_TYPE_DATA)
-			darg.async = ctx->async_capable;
+			darg.async = ctx->async_capable && to_decrypt;
 		else
 			darg.async = false;
 
@@ -1915,6 +1918,27 @@ int tls_sw_recvmsg(struct sock *sk,
 		chunk = rxm->full_len;
 		tls_rx_rec_done(ctx);
 
+		/* An empty record advances neither loop bound, so a flood
+		 * of them can be interrupted only here. On the zero-copy
+		 * path darg.skb is the strparser anchor, already released
+		 * by tls_rx_rec_done().
+		 */
+		if (tls_rx_empty_data_rec(chunk, control)) {
+			long timeo = sock_rcvtimeo(sk, flags & MSG_DONTWAIT);
+
+			if (!darg.zc)
+				consume_skb(darg.skb);
+
+			/* An empty record still marks a boundary. */
+			msg->msg_flags |= MSG_EOR;
+
+			if (signal_pending(current)) {
+				err = tls_rx_intr_errno(timeo);
+				goto recv_end;
+			}
+			continue;
+		}
+
 		if (!darg.zc) {
 			bool partially_consumed = chunk > len;
 			struct sk_buff *skb = darg.skb;

-- 
2.54.0

