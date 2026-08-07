Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67554233956;
	Fri,  7 Aug 2026 00:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786063460; cv=none; b=s8RCnNAvIl57OVbWlz00TIkvL1rXwVgPOFCWXDj1rh/iRZLjrcuyDQ8/KHM97YIRc3darCg6mFZts7+lUmPMGsjZ+XTPAB4S9iShHOlFFFiVCb58+/ELsPsPzC9hyiKLZGXVrkMEBX3rBFUtcTnlHNb5A30lbveOF8w03FQU8hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786063460; c=relaxed/simple;
	bh=02P+7Sm+k5ehjNzfgZbIpVidYKDUdqflkm07u62Zxa8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uMfHnEw2anYrWQIFbbiGUa+AjN5uE8IPV08xWF9qVrp14XgwBpb5eAGT8WUfeFZ6+6LtXr1hW8+WSAqy+6HXKpaONSlTfnLRAcIOwdZblO+NykQqvj81gvaRJjd2LqpTAiaLj1ENmTuwtsiKIrf6SiGc9SwPFtBpItz6oIuNvxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FTWYVnun; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FTWYVnun"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65C721F00A3F;
	Fri,  7 Aug 2026 00:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786063459;
	bh=zhkGl3Zkf9OjSfS9KyD3KNepy52LNYLsmKj1DGAg8IU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=FTWYVnunc5l7sbV5nSSmBUW4JHUYm/gRf8ydV7vCywRk8g06tXOjkkytPjv2Gz/eE
	 D4YS74K8GbLgtnZuf/VLx2A7pqAOw8HgApxHr+SG1QKWaiVtmsWpf7Qr76pRHJPoxz
	 3VlpQ1OJ667G6oXKHeUo2mt2SPkR6WZ8VkOkWTleDbX8TkunCJrnkDmOJ1HeU2OwbH
	 rwOaIG/plRNgr+ZK1t//8y+gN+koVGjq4MVkbXO0Nvngb+pdY2Pr6I/aST5XgFTr+1
	 K9T4bw9F9rFHvXYo4PLExUxXB4S9iXptyEU6pMeG9QEbks+sCaTcxzo8XYBfN4NR9a
	 +H1aPhH69fgug==
From: Chuck Lever <cel@kernel.org>
Date: Thu, 06 Aug 2026 20:44:07 -0400
Subject: [PATCH net 1/2] net/tls: Fail tls_sw_splice_read() after a failed
 async decrypt
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-tls-splice-crypto-fix-v1-1-a2624005a286@kernel.org>
References: <20260806-tls-splice-crypto-fix-v1-0-a2624005a286@kernel.org>
In-Reply-To: <20260806-tls-splice-crypto-fix-v1-0-a2624005a286@kernel.org>
To: John Fastabend <john.fastabend@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Chuck Lever <cel@kernel.org>
X-Mailer: b4 0.16-dev-da966
X-Developer-Signature: v=1; a=openpgp-sha256; l=1511; i=cel@kernel.org;
 h=from:subject:message-id; bh=02P+7Sm+k5ehjNzfgZbIpVidYKDUdqflkm07u62Zxa8=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBqdSphvq7pAAiPeKB0ouqQ9Mg7dHams4u1TvL6x
 dnEyGaf1z2JAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCanUqYQAKCRAzarMzb2Z/
 lzagEACO8z0RiokfM84fsNPdJB2JAjAUhWVM8N/+k72Bi8BpCZpDwObnaNKCV/NJ5sjDtRdNO2f
 DY6AzTUc4YEwke7JBvMQqnkYV28LEtrBXE8GuSt0V0/33F4mHhOefd8X7NzDIesaomez6Efsx19
 bqGYuIEvyhfiRDmgT9lqTt6xFrDH+uoheBxbeICjarHC25EXpbFas5nKjOISev4vF2pwStwy95w
 Qwx4pyckdEPFgP9xXKWtXzO/HhVGG1VL0AH/KMBMgbFlrCtxfnOPauFrIr7F+JKXA+VRlxhUc/s
 t8PELQ8cYcG35iZKwMn/5n1AXW62j1qoeFC+trQr/ZTGtCU6kiGqgqvsPJQ02t55GQLl4FR8ppi
 UNHTquOKqKKYDmGmQGdH6VIzMq05vcRCm9Db/rcYP/TFABCAqVF3JNWz+kN9JvXZ3RSNwSZ2odp
 K+iqiR2LB4d4QnxND6mP568fWcZUwmO5NjxwGzGgmEwJkezMgTCMBwC5NN+xBZvfaWUIyOknIwJ
 pAMYMuYWNynjs4CgZWpBL50qG070Y0DA5JpnJK67/3vRUvve09w7uTuSUvWbg8Osnta/D6WCssK
 I8KxYbv2zKgHYMafyMsi9nKuda/03sutsNjYV0b7/js8MZaxwE03AwnIbUcx3bMWrE2MfBnRmZ8
 3ajO7VW6CJboEGA==
X-Developer-Key: i=cel@kernel.org; a=openpgp;
 fpr=28B2E5B01286DF243CF23EFE336AB3336F667F97

When an async decrypt fails, tls_decrypt_done() records the error in
ctx->async_wait.err and calls tls_err_abort(), which stores it in
sk_err. tls_sw_recvmsg() and tls_sw_read_sock() each read
async_wait.err once they hold the reader lock and fail the call: a
record that did not authenticate breaks the connection.

tls_sw_splice_read() has no such check, and sk_err does not stand in
for one. tls_rx_rec_wait() tests sk_err only inside the loop it
skips whenever a record is already parsed, and the first reader to
reach sock_error() clears it, while async_wait.err persists. A
splice therefore keeps delivering records on a connection that
recvmsg() and read_sock() refuse to read.

Read async_wait.err in tls_sw_splice_read() as the other two readers
do.

Fixes: f314bfee81b1 ("tls: rx: return the already-copied data on crypto error")
Reviewed-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Chuck Lever <cel@kernel.org>
---
 net/tls/tls_sw.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
index 62d46736e24b..d1ad31986cf2 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -2014,6 +2014,11 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
 	if (err < 0)
 		return err;
 
+	/* If crypto failed the connection is broken */
+	err = ctx->async_wait.err;
+	if (err)
+		goto splice_read_end;
+
 	if (!skb_queue_empty(&ctx->rx_list)) {
 		skb = __skb_dequeue(&ctx->rx_list);
 	} else {

-- 
2.54.0

