Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C94C3A4520
	for <linux-kselftest@vger.kernel.org>; Fri,  9 Oct 2026 05:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791522097; cv=none; b=DfecOweVCZRRJMgjLfvOJjsNyJLs9MQJ9e7gW98RodYvQ382r25InOsW7v9QCZgDx2J6+5tVko+y9AqyWW2ryYzlTQbr5fbTLuhXX9poNV8WRuhlZUp7PC7I1EIW+/R01yw64rkKHuIkJdXK1MZSnzcka72uGQevCJhZmlRDhj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791522097; c=relaxed/simple;
	bh=jWwNvQhVRJMaI/NuEyzm8YPpikM+OQknELJgCA/Uvq0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mRTocAZdOqXGVXD9etN/ooltaezEXl1+E17zTZrGYowmZ1P+Dk+03dlUHNNbyEcKkuzHxH7R7+hpHxY8ijPL2WA2fohbnChxf3Z/ZFEuaIlPhq70dP6fgw9/4iai/6y7WAnqGAZ8aGB+TA0ek/FO1lupvY+kttIfgZzri2YEdMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=abjvs95R; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="abjvs95R"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-4af7283bf83so1621938b6e.3
        for <linux-kselftest@vger.kernel.org>; Thu, 08 Oct 2026 22:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1791522094; x=1792126894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1U3fvYWJH0YcBKOkycFzaZNpcYiFFVMrPSZ0BUt9UTo=;
        b=abjvs95R8Dh34nO6E2E/FmMYMWpN7wPE2BZ2QqUptePgwWJPRL5D8YYxaekpurU3gh
         UZQQhRq9rLK9gq++Ttu4O71nrMAOtIjSArUTZ9uRQ6F4nR0sOF6dBFYYhWI0fLUDrYKz
         9Dbe/1j5GdXjUQ5lGws0cxZ76cDY8HksctlpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791522094; x=1792126894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1U3fvYWJH0YcBKOkycFzaZNpcYiFFVMrPSZ0BUt9UTo=;
        b=siFNZGyLWgbeLYKHNLx4NIHoGurjjddi35rbb4h/2kYwBwYMO2kP7uC4DOHDq2mk+/
         biXcaAia/tLxRLwNCKatlDCRqtEJ5bgJtwIERRbgz4mgatjmX7kpOgveCKpZzl/8pJB/
         vlS1HT1lpPBdhQgOP/UGtsAx0drFJF5AB2+Nt4gGBEvH9OzOw6lqra/nWQnMUAhWfwdu
         +/5ru37kmD2yh4aSSW73jDSuxaVhd0WqWlYlrzlD2wzwNE9I/6gldfQqn6PZdve5DbWB
         9YfWDKSmSQcqLKRJk0ZKBrschOmoOS3lv13IJFXDH8WlNIGz0N0AWDPv+A6b8mIIeDvD
         OcHA==
X-Forwarded-Encrypted: i=1; AKwUvBwhGSlLsC2a6aD87wo3qhvxOx3posGd+KnyrK9a7oYWtB/yIO5rSLFl4HoicodIEGiTIbraMPsAx5XUQohFztE=@vger.kernel.org
X-Gm-Message-State: AFuF++nLv95eQLabpekgl7I64C2gkW+VZva2Cg3U1iJRpjFU5uZ9vx+l
	e1agIxuizmvS5glylpPpO5QgkVX2OpZbHMhFOioMUUdRg3A85gBjTnaieiFe/wlbygs=
X-Gm-Gg: AYBFou1ttJ5ZXvpWbw4aOzh1s2WOaQiLbI7UHzb/6ZBeOSdFWGopojwSGgUyf2Q4bpZ
	vVqzeyB/F0DdzdAtIl1KnRwGBifJp/gKMI10MGJqVPPrgkJ1gOIJcyjkPoDn3DX/VxHasZbwFOL
	9LFb6c1N9qkZ3VJv0vd8IZ/6wSPpe8kAR1RqCUrzSVHE+2jztby/dfa2X4iZ6+pjOVjE9gMp4iT
	rGhb2FLMGmJxbRMuTZTZ14GwnmIiaB/Oun9mrXkgD1hwqm2UZkTWKeVAAwPoNVm4o893hDAOmoc
	7NIniq/54zJ1ccgDm+6jXE4fPgGNuajtYwqhCCJ2kCsNNEcbZTy8iOYuj4FxN1oncO1rqSy5OFx
	KPz7KU5nwxucV4C4OWcGbPoninwsiOyTuSWClVcn6mul1yghRlm6Gq8LfdzCaOcbFtocg6OZTzI
	uJcnMrXvqYYc0CFc0rFGctrbS5Dw6mzyZ/VDVwEbtbmgl8DvHaiR9QjlgLQ7R4N1O0zCE14O0Yb
	JQlahUm6Er8DBBxcW+Ji6L2urm8g2bLjlzhW07jHQjklJnL51RSxUT88JgAqfp8mkDDPdHcWstf
	AJc=
X-Received: by 2002:a05:6808:221f:b0:496:34a:d7e3 with SMTP id 5614622812f47-50c4ed40abcmr639887b6e.17.1791522094369;
        Thu, 08 Oct 2026 22:01:34 -0700 (PDT)
Received: from com-68297.corp.openai.org ([199.47.143.0])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-50c1c1246cbsm944574b6e.18.2026.10.08.22.01.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 22:01:33 -0700 (PDT)
From: nramaswamy@openai.com
To: netdev@vger.kernel.org
Cc: Neil Ramaswamy <nramaswamy@openai.com>,
	Eric Dumazet <edumazet@kernel.org>,
	Neal Cardwell <ncardwell@google.com>,
	Neal Cardwell <ncardwell.sw@gmail.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Yuchung Cheng <ycheng@google.com>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v3 1/3] tcp: restore RACK list membership when undoing loss
Date: Thu,  8 Oct 2026 22:00:32 -0700
Message-ID: <e11ac4c9231e2ff7b288a10b48baa5378f2e6cc1.1791506907.git.nramaswamy@openai.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791506907.git.nramaswamy@openai.com>
References: <cover.1791506907.git.nramaswamy@openai.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Neil Ramaswamy <nramaswamy@openai.com>

Partial undo can clear the TCPCB_LOST flag on segments already removed
from RACK's list, which prevents subsequent RACK loss detection, leading
to segments only being retransmitted after the RTO.

This patch uses the implementation provided by Neal Cardwell to linearly
insert lost segments that have not been retransmitted back into the RACK
list. The core observation is that segments that are lost but not ever
retransmitted are already sorted by their transmission timestamp, which
allows us to insert them into RACK's list linearly, without needing to
pre-sort them.

Segments with TCPCB_EVER_RETRANS are left for RTO recovery. Their
transmission order can differ from their sequence order, so reinserting
them would require addiitonal work (e.g. sorting) before reinsertion into
the RACK list. We assume that this case is rare, and allow those segments
to be transmitted by the RTO.

My investigation started from seeing repeated TCP stalls in prod and the
mitigation that seemed to prevent these stalls was limiting SO_SNDBUF to
96 KiB. It also seems like others have seen similar symptoms before [1].

[1]
https://lore.kernel.org/netdev/35A4DDAA-7E8D-43CB-A1F5-D1E46A4ED42E@gmail.com/

Fixes: 043b87d7599e ("tcp: more efficient RACK loss detection")
Suggested-by: Neal Cardwell <ncardwell@google.com>
Suggested-by: Yuchung Cheng <ycheng@google.com>
Link: https://lore.kernel.org/netdev/20261006141300.1722466-1-ncardwell.sw@gmail.com/
Signed-off-by: Neil Ramaswamy <nramaswamy@openai.com>
Assisted-by: LLM sparse
---
 net/ipv4/tcp_input.c | 50 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index 92bc60716f33..d0a1e8899c4b 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -2840,15 +2840,63 @@ static void DBGUNDO(struct sock *sk, const char *msg)
 #endif
 }
 
+/* Is skb @a after skb @b in tp->tsorted_sent_queue (send) order? */
+static bool tcp_tsorted_after(const struct list_head *a,
+			      const struct list_head *b)
+{
+	const struct sk_buff *skb_a = list_entry(a, struct sk_buff,
+						 tcp_tsorted_anchor);
+	const struct sk_buff *skb_b = list_entry(b, struct sk_buff,
+						 tcp_tsorted_anchor);
+
+	return tcp_skb_sent_after(tcp_skb_timestamp_us(skb_a),
+				  tcp_skb_timestamp_us(skb_b),
+				  TCP_SKB_CB(skb_a)->end_seq,
+				  TCP_SKB_CB(skb_b)->end_seq);
+}
+
+/* Link skb back into tp->tsorted_sent_queue in send order, at or after
+ * pos, and advance pos to it. Leave skb alone if it was sent before
+ * pos. During undo, all relink calls together traverse the RACK list
+ * at most once, as pos only moves forward.
+ */
+static void tcp_tsorted_relink_skb(struct tcp_sock *tp, struct sk_buff *skb,
+				   struct list_head **pos_ptr)
+{
+	struct list_head *head = &tp->tsorted_sent_queue;
+	struct list_head *node = &skb->tcp_tsorted_anchor;
+	struct list_head *pos = *pos_ptr;
+
+	if (pos != head && !tcp_tsorted_after(node, pos))
+		return;
+	while (pos->next != head && !tcp_tsorted_after(pos->next, node))
+		pos = pos->next;
+	if (pos != node)		/* not already linked in place */
+		list_move(node, pos);
+	*pos_ptr = node;
+}
+
 static void tcp_undo_cwnd_reduction(struct sock *sk, bool unmark_loss)
 {
 	struct tcp_sock *tp = tcp_sk(sk);
 
 	if (unmark_loss) {
+		struct list_head *pos = &tp->tsorted_sent_queue;
 		struct sk_buff *skb;
 
 		skb_rbtree_walk(skb, &sk->tcp_rtx_queue) {
-			TCP_SKB_CB(skb)->sacked &= ~TCPCB_LOST;
+			u8 sacked = TCP_SKB_CB(skb)->sacked;
+
+			TCP_SKB_CB(skb)->sacked = sacked & ~TCPCB_LOST;
+			/* RACK unlinked the skbs it marked lost. Skbs never
+			 * retransmitted keep their original send times, which
+			 * increase with sequence, so in one forward pass we
+			 * relink them all. For the rare case of undo after
+			 * lost retransmissions, we will fall back to RTO.
+			 */
+			if ((sacked & (TCPCB_LOST | TCPCB_EVER_RETRANS)) ==
+			    TCPCB_LOST)
+				tcp_tsorted_relink_skb(tp, skb, &pos);
 		}
 		tp->lost_out = 0;
 		tcp_clear_all_retrans_hints(tp);
-- 
2.55.0
