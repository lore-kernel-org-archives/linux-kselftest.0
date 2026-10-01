Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404094C6F08;
	Thu,  1 Oct 2026 22:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790894511; cv=none; b=ttIRnxJT9hx3BUNuw1CVJNy16rivyPiRY2zKigRu+q96nnlSyGuvIkZn93jd+IGgSqlX0AG2BwUP31X7ZEOk12o+xEMzFLg7jaohTeS7/KegxhPeNtmo5yT75HPx31p+xsK8tR5VnGHPkvQD1DVs9/0FF2MD6SX+I+02OyxQT6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790894511; c=relaxed/simple;
	bh=MTOE9Z/yrLb15YyikeeEqT2cFigH+xwC35oCd7FCTq0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WwWNhwKaB23F5BGuHzb2UNuht5ts0NEaZjtib82sclur4How4EgYVSQfA6gC59gwFSY3amQC5BBC/B0oprp7osxiCEXNU7GOiY9zC3OO85faaM0dVYRUz/l9hri50sBPrrfr1KcMMTUMOaL767vo18VjyZrD+G6V/YzoPWeQX+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HIPXomom; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HIPXomom"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A161A1F0089B;
	Thu,  1 Oct 2026 22:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790894510;
	bh=TreTEuLsnCgWMXbrteN+GY2dAhv7KRNASUG61ifsCL0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=HIPXomomboPSn/KZDDED4QN3BVVO6Ik+JrAu2UwuFzOhmxUPkdctZdxaH8KtHJ0aM
	 SUa3ADnKdUrpF1aU11zvki+4PNzQRNI53vDiLEO7Cw5/Wyxvw+Y9xZRtICLVtUydm8
	 DhGe3Qbp+bHL7dj1QXkykU9lLmfEPrtDqQihhVnDqCDBW9FCiueTF7ok3w3RHYu55G
	 h+ZxU+NizHXaDDeMYRLeKuQe4Klwzla+2JFo71adPloYzOCkIdqAc47+0h9Luvj+/K
	 TrdloQdw4QyPJmFpdfS4NIpF7ujsZb457uZid9vynuaQjKfrcXmQtYMyCncdv05Usw
	 8wZ/PpWv7ImGg==
From: Chuck Lever <cel@kernel.org>
Date: Thu, 01 Oct 2026 18:41:37 -0400
Subject: [PATCH net-next v2 5/8] tls: consume empty data records in
 tls_sw_recvmsg()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-tls-follow-on-v2-5-2dd1947bb642@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2354; i=cel@kernel.org;
 h=from:subject:message-id; bh=MTOE9Z/yrLb15YyikeeEqT2cFigH+xwC35oCd7FCTq0=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBqvuGpmEUKUzR/3N5u7rXU12rR3r9JUJxp7UCWW
 k8p3qzT2YqJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCar7hqQAKCRAzarMzb2Z/
 l8PPD/41441LUYC0J5MbWZC+2SaICjdhlXNqquddd5fjWpjBQic08yk0DZ/EYlUzjFYRD4M7LgV
 0rD7zqnW1BVHewi5m+aGmo+mZG6g6keoBJrUl4qbZdWTfBGiur8Q8Aomg+60CFdOVHmbeIM49IR
 82F4XnRlUzmTZOJ6dTyexMrwTUwlB/CyEKd3ZlZFD8S+3pY3983XNou4ot2vmw3uXrb/ENb0TQO
 OdeokJBIakW9queCka9Sq84uWsg6JimFtI2fR2XNwz6KSudzy3/n48x2dx0ezOc3dTFsZeuK1uS
 UeNMAOkubgRmvXJC7vYVUn009aYX7x81PENA98d/9yGHsjiLoeWCireaCfRM5+51Yz41nRmE+Kv
 2U/ASDQNpMytPL47uLIV2lmZZJluOzhkVcctEaGe2u9wwmLhXKbyK7zLvboWN/Mhs9rt/wRqib6
 PV8cSSKG6qsT09yKsPk3aKawx3R5ush9Z3Z5wNtwCJw2c9KW/Fyi2copmPji7KQwIBIekkFqqUb
 2/c1shQR0nyF9KzsaCiNdeyhd3kyUia38byL7OUnyJBb7JEJAvUUaYp5rHf6Avc1adplkup3bly
 8CPV6K81yg/8I6kyWXglKQ/TadE0+tWJhs2clXjw0rNm8IIuQ8FgP2yMvKKIzhJvg1Sr0ZoNyPU
 EIy8n3l6H0TT2rA==
X-Developer-Key: i=cel@kernel.org; a=openpgp;
 fpr=28B2E5B01286DF243CF23EFE336AB3336F667F97

TLS 1.2 and TLS 1.3 both permit zero-length application_data
records as a traffic-analysis countermeasure (RFC 5246, Section
6.2.1; RFC 8446, Section 5.1). Such a record decrypts to
full_len == 0, so every arm of the receive loop reaches
"decrypted += chunk" and "len -= chunk" with chunk == 0. len never
reaches zero, and tls_strp_msg_ready() keeps the second loop term
true while records keep arriving. The peek arm and the async arm
also queue each record on rx_list, which then grows without bound.

Consume an empty data record as soon as the receive loop has it,
before the paths diverge on darg.zc. Freeing the skb requires its
decryption to have completed, so an empty record is no longer
decrypted asynchronously. The new branch sets MSG_EOR itself,
because the record no longer reaches the assignment at the bottom
of the loop.

Fixes: 692d7b5d1f91 ("tls: Fix recvmsg() to be able to peek across multiple records")
Signed-off-by: Chuck Lever <cel@kernel.org>
---
 net/tls/tls_sw.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
index 6ca1e9f4e504..4fecac8a0b0d 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -1885,9 +1885,12 @@ int tls_sw_recvmsg(struct sock *sk,
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
 
@@ -1924,6 +1927,19 @@ int tls_sw_recvmsg(struct sock *sk,
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

