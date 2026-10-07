Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D7D4963A5;
	Wed,  7 Oct 2026 19:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791402594; cv=none; b=seIrU6Yl3TGDdf8Y5tHjd1NQkgBX0OMbfnKuy9KNQ72CK4GPtUAtnqrVLE0TwfcYaqxHIXjjteFZsKIdR8T4zlgEat0bvSMNO+joXHDEDOfVYm42XDnvShjdsoZ/1c41xDVg9rSrVOBucQfedFHwTebf/z3mFxhTxbDRC7VyZ5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791402594; c=relaxed/simple;
	bh=gL94DbTKPyJg1aI+P1zPnNxaG4l2wBRyKFnQymzznSQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YsC3p19aawobZ0lUiwFfXqWSLSFl3Zr9+H3cJCq3NPM9O67Qp3Zbj1vaGJy2u9oBdHn14taqPXV4/OC7WJDAFr720BS/u35ABw0H5bYvoUEBUK1w48jawyleFYEVTuo9eRgfhkhQt8CH1IE7FWzTga3FtWDLkiOoBu5N6YYuyXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QqmfS6+E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QqmfS6+E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90A4C1F0089B;
	Wed,  7 Oct 2026 19:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791402593;
	bh=C95DEevTTh8GT5SyYu6S4riBcWMuX9yXgfF8LFind3c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=QqmfS6+EOP/oTJgKT8i0GguMCwguqlBSYYOS4cU9cUrk34+DypTlYslLfHdR1UvPl
	 0AW+V1EoLIccaXkBIJG/fgvz0KfoOCgQr199in0CaZ5k77xlfmbQlC7bi9sdN6kdj2
	 kqyBtgA8MIpNN3Pjyq1W2ECjjcc1rntqm7vnTIC55YAod3R/8oZWkzs9gyREn7h91n
	 joLQJXGE9S2/m8GSLMXRZ1sTVG9/KYh2imkbEZF9LDF2EARF5NiWHflKw8Yq3SB8Pr
	 oOtle59LbSQ8hgeZTgQhl3yx0lu5jQVLhSsVPkWdsAEEuF5QjbBzoqetSHt1JXvM6A
	 PLBi5CZYBZA/g==
From: Chuck Lever <cel@kernel.org>
Date: Wed, 07 Oct 2026 15:49:34 -0400
Subject: [PATCH net-next v3 5/9] tls: Consume empty data records in
 tls_sw_recvmsg()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-tls-follow-on-v3-5-6d52d98389b3@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2529; i=cel@kernel.org;
 h=from:subject:message-id; bh=gL94DbTKPyJg1aI+P1zPnNxaG4l2wBRyKFnQymzznSQ=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBqxqJZO2VxHtQQYm7GbnyvecfyhkF7hSMhwAqGb
 ZN8leZr1FqJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCasaiWQAKCRAzarMzb2Z/
 l7JqD/9wnMTLA3gK8a5vaUPG5snF+3k6dLXgJdYHSE93EngZ0yDqKJogyNdHzs2vcuzMeS1yy10
 jcBnovQ38q3vLGdzXex+pvNqFweHGzvioLobGS/A2w8ZML27fE27La7t7zs9a+tTNq67gCMGUrL
 8uTtW/UGwJPyg3tAZzCmkFLETbFisGG9gLk5QdQWkYJ0V/I89OAy940bwmx3zIqzarYeMaEpRE8
 +62Lg47cX30HLVmxJ8zfxWahir4CR2sjqdaKlACLLPh7QKNpdjahIP+1bfFv5bP7T/boZ6l9l70
 DlzWhNfIDrDsym1zGVMcVCWsthWgjAGiWK5NPmGj08mw0mqc9BfM8T9YmRk/Z69UTs0L3XMxleD
 +ARxHNwOdFNPRIhuwiuHUyRyoswt4rW0Ql4QM678a7LSvyzedvTKBql49trYxfBAJECR54tOHj/
 zPkkTgvnDDyxfrEtjfENexFZkg4oSmxOEneh9KSdkWextmhC7iAIxL667HLvaz748g3NXLoPWup
 s1lMMwQR/suzkf8fEotQqOUqvXUxlVEksKNvaaA2JTgiCuUGKaDLSPAlFn8Fsjhw/o7NAMgMEnK
 yyqDWaUTK67sCWWGmY6CMd+r4bPEzQ7RBtGExWrVo4GSIwLR5Y+xFfuEfIxT0hxmZe/eC1UzJF6
 35hFX3us/uF2Gzw==
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
index ff82e2f4e9e5..b7f3edf9828e 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -1886,8 +1886,8 @@ int tls_sw_recvmsg(struct sock *sk,
 			darg.zc = true;
 
 		/* Do not use async mode if record is non-data, or if it
-		 * is empty: once a record has gone async, recv_end
-		 * discards the error that ends a run of empty records.
+		 * is empty: the receive loop frees an empty record's skb,
+		 * which an async decrypt would still be using.
 		 */
 		if (tlm->control == TLS_RECORD_TYPE_DATA)
 			darg.async = ctx->async_capable && to_decrypt;
@@ -1927,6 +1927,19 @@ int tls_sw_recvmsg(struct sock *sk,
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

