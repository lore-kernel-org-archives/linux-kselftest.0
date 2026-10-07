Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A9B38D3F0;
	Wed,  7 Oct 2026 19:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791402591; cv=none; b=a53QnEDeCtE9gZFXjvLlIYrLx+inuTSTWjf8jZjDNB2jqbv6t3T43CJfkpBXBwIEs8ySec9aEzQT2K9/RQLaJ0PpB15u9+l+fkmuD95bxfzNi7zLmgPHMe6MQWrkGfXa8dtZAXeEcRgwcTMeEU47ZIA1jHrtJ6YComb5Nllv67k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791402591; c=relaxed/simple;
	bh=Wdhb3pW7f+y7cF6TjE/est2fJddaFrDQGeAMlxf89aQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F9xmHpTiEEVKu/VULN61P0Ac3nUnuSO3Bl1WrTl62lUuMsr3mb1SNRudPHjvjzeoJ2KU1AqM4AZiBQRk9C6BBwWU8UOrb2j53pXXw9bn9x2S5g78I0UO4mLRio5EtKdiVFiNPFdQBLw2VRA9EKYLVF9w972PJxRn9qUBqK1WqoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OXwMJV/O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OXwMJV/O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8B1B1F0089A;
	Wed,  7 Oct 2026 19:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791402590;
	bh=DINgOqURJ5eGbdb4g7792UX6puWOtU60lJWEbBwVUZ4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=OXwMJV/OVtSn4t58rnBw4QkCm9FmNgitwDT/nrD80cFtnrl/YIgQT6ij9st8BpfWQ
	 x/eX41E67/EWeH0kTYybLKL4JbGbwR2kXTZAACkdCaEkeegVpNgqUNAiKOtJ/+cG++
	 eNkmWnKTIqIR+SH99PZY0HZb3iGnMQcUEo3lqJEpiU2w1tOOhDlg/j2IEehtJUJ9Cr
	 chtn3IvwikHrOogNZUC+hPDf3k41bglRN3fsPIpk4cYuQ3rRnBntMiDQdQxGqcyiWU
	 TTqYo3+x2GGGtm4ns+wjwMEzOu4WTOnD81ac2d6R4VFPWTfSJap73I/ziKCC91tXpq
	 SvJhV7unufvmQ==
From: Chuck Lever <cel@kernel.org>
Date: Wed, 07 Oct 2026 15:49:31 -0400
Subject: [PATCH net-next v3 2/9] tls: Check for a pending signal after an
 empty record
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-tls-follow-on-v3-2-6d52d98389b3@kernel.org>
References: <20261007-tls-follow-on-v3-0-6d52d98389b3@kernel.org>
In-Reply-To: <20261007-tls-follow-on-v3-0-6d52d98389b3@kernel.org>
To: John Fastabend <john.fastabend@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>, 
 "David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Chuck Lever <cel@kernel.org>, 
 Dave Watson <davejwatson@fb.com>, Shuah Khan <shuah@kernel.org>, 
 Qingfang Deng <qingfang.deng@linux.dev>, Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 sashiko-bot <sashiko-bot@kernel.org>
X-Mailer: b4 0.16-dev-da966
X-Developer-Signature: v=1; a=openpgp-sha256; l=3037; i=cel@kernel.org;
 h=from:subject:message-id; bh=Wdhb3pW7f+y7cF6TjE/est2fJddaFrDQGeAMlxf89aQ=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBqxqJZxqM/O4r1Wisx3dGvXo/ge7CTlAGv+q/tc
 k1H+9DBdpCJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCasaiWQAKCRAzarMzb2Z/
 l1aTD/9TLeZQjYqsWAD2rzELmUqsdQuxloSBVcaW3sbiRjdC6deh69yBsKsuEAgZxyJTNP4Sxrq
 8pOMu3hrRookQebhwfLoPnNsoK3rODQd+kxDQIhWfihFdeVZfK+Ck6JBpcbSZoD17tc9kQuE+Ef
 GJDr1nkP7ihEsYmKbayoYI0rFtqT3aLQR6zUS9chi1tbKG+hc8a5spH3uTrkieF++diWuywPY4E
 +StsSLyAUeJwH0ai7YNG6fIYL8V22cFOPlnQEbiOiDndlVzyiZPtSsZDIeWTmOsmdoDoT9JqSql
 F04qQAb7gpJ2RCV8njdBuN/mzY4sWrgoLBf/L34NXmvj9PSIpQA0+YyzKqk7DqLXJKqnf6hhNwg
 0hjZ1pbr5EQpdfEaKiU16PgN0OLFJlIrXXYwvhw/AqXFf3xiGPjgdkLvboXfDR+zrjEtAQ6phU3
 zSb/O0+e4QCUv038vPw/2cmXJxVkZ5RhkvLsgaIwU+MldXoZqAKnf28AqemGI0joSXyaI+KPlFR
 bHOt+uZHKr5THX8dIBoucpzz4oGXpRx9WdSwgJSzTorodtSkPpGuKplkqWeOt62de2g673y4ZrO
 tXWFixRnhUohUOhMQuhzT6J9azPFkxaL1F3vjnJyQoXXl+VnEikViPzbx6jtycbc5ODK1sNNFmd
 /amgDkyiw+fhB6A==
X-Developer-Key: i=cel@kernel.org; a=openpgp;
 fpr=28B2E5B01286DF243CF23EFE336AB3336F667F97

tls_rx_rec_wait() tests signal_pending() only after it sleeps, and
it skips the wait loop when a record is already parsed.
tls_sw_recvmsg() calls tls_rx_rec_wait() once per record, and a
zero-length application_data record does not advance either bound
of the receive loop. A peer that streams such records holds the
caller in recvmsg(), unresponsive to SIGKILL, for as long as they
arrive. The hang has not been reproduced.

Test for a pending signal in tls_sw_recvmsg() before it fetches the
record after an empty one. A reader that has copied data gets the
data, and a nonblocking reader gets -EINTR. The test stays out of
tls_rx_rec_wait() because tls_sw_read_sock() also calls
tls_rx_rec_wait(), from callers that cannot act on a signal.

Decrypt an empty record synchronously. The code at recv_end
overwrites err once any record has been decrypted asynchronously.
With only empty records queued, the reader then gets zero, not the
errno.

Fixes: c46234ebb4d1 ("tls: RX path for ktls")
Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260720-tcp-read-sock-v2-0-29545d034f3c@kernel.org?part=1
Signed-off-by: Chuck Lever <cel@kernel.org>
---
 net/tls/tls_sw.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
index 275a6047da9e..32be5a8f80ed 100644
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
@@ -1874,9 +1885,12 @@ int tls_sw_recvmsg(struct sock *sk,
 		    tlm->control == TLS_RECORD_TYPE_DATA)
 			darg.zc = true;
 
-		/* Do not use async mode if record is non-data */
+		/* Do not use async mode if record is non-data, or if it
+		 * is empty: once a record has gone async, recv_end
+		 * discards the error that ends a run of empty records.
+		 */
 		if (tlm->control == TLS_RECORD_TYPE_DATA)
-			darg.async = ctx->async_capable;
+			darg.async = ctx->async_capable && to_decrypt;
 		else
 			darg.async = false;
 
@@ -1910,6 +1924,7 @@ int tls_sw_recvmsg(struct sock *sk,
 		/* TLS 1.3 may have updated the length by more than overhead */
 		rxm = strp_msg(darg.skb);
 		chunk = rxm->full_len;
+		nodata = !chunk;
 		tls_rx_rec_done(ctx);
 
 		if (!darg.zc) {

-- 
2.55.0

