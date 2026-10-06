Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FDB381EBB
	for <linux-kselftest@vger.kernel.org>; Tue,  6 Oct 2026 05:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791263792; cv=none; b=bBYH1ExHO4ybC88qwl3X7grhP/zagvERluzXTaUulD1rNghNgOFPC8pBaykmxsCunvMj95Q/Npgo7tqsqlIoFDkz1TiSqK8+33Dyz+ITr9Q2ttFtJiWz4hGft6XECLGCC1Pk8J8P3iBNhSbU8BAbTAh86wwpfgRag8jYJuV3Noc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791263792; c=relaxed/simple;
	bh=CDywOygPmrlx3R5gRwy722wB/kkMjtMnkgCl3dvZdFw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jA/bJCIFdWR6rGwFKGLgdjFJJEsjg1zpb4ekRsQCM8YmEJY01vruUwzcNCczrHnTRmAhLpljsYT4PH9tjQYQIJVk5d1Zg/zBacoPO7FkRCGwCbpUqjdk/c0EqiJgtuVjoymOh5n16AvurDKW5yQ3uflnvsdv0mWNfNLmu6adZ3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=LHp1/dtZ; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="LHp1/dtZ"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-821a7bee9b2so376887a34.0
        for <linux-kselftest@vger.kernel.org>; Mon, 05 Oct 2026 22:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1791263789; x=1791868589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MSdwC3NRHxiBT/jc1RHLKkfmkBi6P75t29jHlr5sJqE=;
        b=LHp1/dtZ2maaQCAJs79MCkKRUDhmVqOfm113xoMEXB1jQeKV0QawfNFnHK73xar+PD
         pvMC0IWg5Q1pDpkshBYx/OF8kKce1aPhaBOaagDjPwuunGMRt2amFF6y2XOQUL2/dsG0
         ZJHKrzekQYWxT1N6fBcb/tJS5nVeSarHYLjzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791263789; x=1791868589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MSdwC3NRHxiBT/jc1RHLKkfmkBi6P75t29jHlr5sJqE=;
        b=AlYTakCZJSK7JOAvGHG7KZ+p/BExsJUj2wCL/sgC/VcbUVfjRk38Jztu09ePfjeGeD
         /lcK7yX9xXDoMWr1onNp0UY41/yOCNfvWdq/vchi4ZH+qh+hfIUt5uDo9iuaMlEfoI4X
         19TW58TQAL2JVHO2NMks1v5l8AtPhG3DHn6sC27nakCorp25saBF+EBF4IimoHW8RyJh
         /tjtk7m2nOD0Fhh96sxce9U+7OL7nbhJpMxEp/1JCF/BOzi/n1kZwDCWvkSocmPIf6pM
         CGpi9G3i9lDEhkcsQuGJULoGq7T97x7pEH4QoDJRS7ubjup5uhf5jw+vQiCxTRN9TX+2
         TDDQ==
X-Forwarded-Encrypted: i=1; AKwUvByxuMKLDoEv0rSLV2JyKUMQCkOCO9w9cHxlzgkdzE/SVW6PcsmrC//3CxexHitWum9P9+tAdM8+gSQyAnEEgA4=@vger.kernel.org
X-Gm-Message-State: AFuF++lXCNIT81xHQHqOHzBcwGH0nNLbu5wXWg99NlzOo2Iz+8XRCG7X
	XbV5iKdlTaT0Elh+mGVuNv5GbuvCDPR5ePtah/oDDj3Dyr//oeVH3WppiXhv5r3raXk=
X-Gm-Gg: AYBFou0Jp4epZRinGzGu6kQJmuwhYocMex11Z+ba2DcfptvXf2CrXlTVxshHG0nYSMH
	B7dkrGbiAwRhPb3ar5FJNtUmaX0r1HXX4XsAS/1ODrgugKK0s2dLagdWZzBrJZROoXZ4UbbNlyF
	YJaoj2UcCBf0/eZNImpRaaYsh8amfWNbDdDoVIqP5OxRz9ILgCyhJMdsbPZAshApm349khjDcZV
	f8cBeU+EjH6Iha2eTn5yR6bHHGkVT9HKIJEi8V2E1VHyBMweXwuXPtTzgkZUB8lQyZPHLJF4oFU
	QqQxglzkhO9/m5yaLDyojqzTz52BiOESI76rlgrTL1WC4ehjF3JVdZL3TqA3b13mNGRkGhaMHeM
	oLn7jF2yLiY4C9y9uJrb6W9g3spdyHB4sB8/PAytIXv1KXVkFEndq0lkaWR+2KsrjGGPOZYWJdv
	zvNtws8fwzwxDB/DbxBTa1FV3kJK3jzwV+cKNJA0Kk75Wzcoo/iXr4qvMahUzgDTcVkthrKa6zi
	nJ4H3QM4Hne3Hc4XQ9LhwBRyszc7759vngYUwPOxB5SrvXwCrLq3dRjsc0zGMe/iiu/1DMPs7p0
	ukJYYmmzKX21dw==
X-Received: by 2002:a05:6830:412a:b0:822:1216:d9e2 with SMTP id 46e09a7af769-828a3925be9mr218472a34.14.1791263789511;
        Mon, 05 Oct 2026 22:16:29 -0700 (PDT)
Received: from com-68297.corp.openai.org ([199.47.143.7])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8281fcce238sm1622898a34.6.2026.10.05.22.16.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 05 Oct 2026 22:16:29 -0700 (PDT)
From: nramaswamy@openai.com
To: netdev@vger.kernel.org
Cc: Neil Ramaswamy <nramaswamy@openai.com>,
	Eric Dumazet <edumazet@kernel.org>,
	Neal Cardwell <ncardwell@google.com>,
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
Subject: [PATCH net v2 1/2] tcp: restore RACK list membership when undoing loss
Date: Mon,  5 Oct 2026 22:15:26 -0700
Message-ID: <f366f5325d7eb96f0edd999b4f984213743914b8.1791248202.git.nramaswamy@openai.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791248202.git.nramaswamy@openai.com>
References: <cover.1791248202.git.nramaswamy@openai.com>
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
to segments only being retransmitted after the RTO. Restoring them to
the RACK list as part of partial undo makes sure we can properly
reconsider them for fast retransmission in the future.

To do this, we first sort (by transmission time) the segments whose
TCPCB_LOST flag is being cleared and then linearly insert those back
into the RACK list, which is sorted by transmission time.

My investigation started from seeing repeated TCP stalls in prod and the
mitigation that seemed to prevent these stalls was limiting SO_SNDBUF to
96 KiB. It also seems like others have seen similar symptoms before [1].

[1]
https://lore.kernel.org/netdev/35A4DDAA-7E8D-43CB-A1F5-D1E46A4ED42E@gmail.com/

Fixes: 043b87d7599e ("tcp: more efficient RACK loss detection")
Signed-off-by: Neil Ramaswamy <nramaswamy@openai.com>
Assisted-by: LLM sparse
---
 net/ipv4/tcp_input.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index 92bc60716f33..51f04c7474dc 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -69,6 +69,7 @@
 #include <linux/module.h>
 #include <linux/sysctl.h>
 #include <linux/kernel.h>
+#include <linux/list_sort.h>
 #include <linux/prefetch.h>
 #include <linux/bitops.h>
 #include <net/dst.h>
@@ -2840,16 +2841,50 @@ static void DBGUNDO(struct sock *sk, const char *msg)
 #endif
 }
 
+static int tcp_rack_skb_cmp(void *priv, const struct list_head *a,
+			    const struct list_head *b)
+{
+	const struct sk_buff *skb_a = list_entry(a, struct sk_buff,
+					       tcp_tsorted_anchor);
+	const struct sk_buff *skb_b = list_entry(b, struct sk_buff,
+					       tcp_tsorted_anchor);
+
+	return tcp_skb_sent_after(tcp_skb_timestamp_us(skb_a),
+				  tcp_skb_timestamp_us(skb_b),
+				  TCP_SKB_CB(skb_a)->end_seq,
+				  TCP_SKB_CB(skb_b)->end_seq);
+}
+
 static void tcp_undo_cwnd_reduction(struct sock *sk, bool unmark_loss)
 {
 	struct tcp_sock *tp = tcp_sk(sk);
 
 	if (unmark_loss) {
+		LIST_HEAD(restored);
 		struct sk_buff *skb;
 
 		skb_rbtree_walk(skb, &sk->tcp_rtx_queue) {
+			if (TCP_SKB_CB(skb)->sacked & TCPCB_LOST)
+				list_move_tail(&skb->tcp_tsorted_anchor,
+					       &restored);
 			TCP_SKB_CB(skb)->sacked &= ~TCPCB_LOST;
 		}
+		if (!list_empty(&restored)) {
+			struct list_head *pos = &tp->tsorted_sent_queue;
+
+			/* Ensure lost skbs are added in transmission order */
+			list_sort(NULL, &restored, tcp_rack_skb_cmp);
+			while (!list_empty(&restored)) {
+				struct list_head *entry = restored.next;
+
+				while (pos->next != &tp->tsorted_sent_queue &&
+				       !tcp_rack_skb_cmp(NULL, pos->next,
+						 entry))
+					pos = pos->next;
+				list_move(entry, pos);
+				pos = entry;
+			}
+		}
 		tp->lost_out = 0;
 		tcp_clear_all_retrans_hints(tp);
 	}
-- 
2.55.0

