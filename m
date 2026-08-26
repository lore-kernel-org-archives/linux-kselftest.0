Received: from mta0.migadu.com (out-222.mta0.migadu.com [91.218.175.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEE3442391
	for <linux-kselftest@vger.kernel.org>; Wed, 26 Aug 2026 14:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787753524; cv=none; b=k4OHp7l/TYzaO4Rycad+YfgJgXrYYwiAAAZq8EvBSp5s8LIUKUkUgV8+k2w0iSK1nRte4zj+cB2Ghjt99UJdmttA17kctJXSj8UvuPSm8v+YpC1NE9QFwyl+mb7Y9FOEQoOMy6dMdk/72e/J7gxX37FzU9H+syVyq7PPJnP0kiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787753524; c=relaxed/simple;
	bh=juMREmWVk5HkRbldgH32b7VE/fBpLShpDSGyqfsso/U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UC1LOXmcUACGmc3+t2e4tyOpZBxjKe8EOtPpoVTeiDOKANr/1w7kq+h0SefxEoqz8WCtLjby+aoND5YEnaAXd5UnAt1wFMu1tweBEJdMVCYrwCGT+dPzwHDiMGHClNartJ3CVqYctmdduuUcs5yM+49LJR27KykRIdchplLH/lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=HJ2tgR7S; arc=none smtp.client-ip=91.218.175.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="HJ2tgR7S"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=juMREmWVk5HkRbldgH32b7VE/fBpLShpDSGyqfsso/U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787753513; v=1; x=1788358313;
 b=HJ2tgR7SNk3n2ZigFOG0Yi5f/2lehykzXCEg3QxIlsPfpxkJ0JoFpVf89zxKTTlMJ9iPIcsi
 VIZAuTkWDQU2S+eqBBT3gi8ghVwTYF/qIOI7S0T2vAg8Zxi1KEoy1a7omEfbdcanjS/BGGsHigS
 HVHxRcEux5O7IOOdNNreKvdU=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: from localhost.localdomain (147.136.157.0)
	by smtp.migadu.com with ESMTPS id f917dbac4e91bdf6;
	Wed, 26 Aug 2026 14:11:53 +0000
X-Mizu-Trace-ID: f917dbac4e91bdf6
X-Migadu-Flow: FLOW_OUT
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: netdev@vger.kernel.org
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	Eric Dumazet <edumazet@google.com>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Yuchung Cheng <ycheng@google.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net 1/2] tcp: fix corruption of urgent data on multi-segment retransmit
Date: Wed, 26 Aug 2026 22:11:26 +0800
Message-ID: <20260826141145.67823-1-jiayuan.chen@linux.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the normal xmit path, while in urgent mode we refuse to build a
multi-segment TSO packet, so every segment gets its own urg_ptr:

	/* tcp_write_xmit() */
	limit = mss_now;
	if (tso_segs > 1 && !tcp_urg_mode(tp))
		limit = tcp_mss_split_point(...);

The retransmit path has no such guard. __tcp_retransmit_skb() builds a
segs > 1 skb and hands it to the GSO layer, which only advances th->seq
per segment and copies urg_ptr verbatim:

	/* __tcp_retransmit_skb() */
	len = cur_mss * segs;		/* segs > 1, no urg_mode check */
	...
	/* tcp_gso_segment(): bumps seq only, urg_ptr is copied */

urg_ptr is an offset from the segment's own seq, so a copied value points
at a different place on each segment. The receiver rebuilds the absolute
urgent seq as seg.seq + urg_ptr, so it walks a moving urgent point instead
of the one OOB byte:

	seg1  seq 1     urg_ptr 5001 -> urgent @ 5001   (ok)
	seg2  seq 1001  urg_ptr 5001 -> urgent @ 6001   (wrong, +MSS)
	seg3  seq 2001  urg_ptr 5001 -> urgent @ 7001   (wrong, +2*MSS)

The real OOB byte is never pointed at, so the receiver stops splicing it
out and delivers it as normal in-band data, corrupting the stream.

Guard the retransmit length like the xmit path: keep segs = 1 while in
urgent mode.

Fixes: 10d3be569243 ("tcp-tso: do not split TSO packets at retransmit time")
Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
---
 net/ipv4/tcp_output.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ipv4/tcp_output.c b/net/ipv4/tcp_output.c
index fcaa04e65189..86e255794027 100644
--- a/net/ipv4/tcp_output.c
+++ b/net/ipv4/tcp_output.c
@@ -3603,7 +3603,7 @@ int __tcp_retransmit_skb(struct sock *sk, struct sk_buff *skb, int segs)
 		avail_wnd = cur_mss;
 	}
 
-	len = cur_mss * segs;
+	len = cur_mss * (tcp_urg_mode(tp) ? 1 : segs);
 	if (len > avail_wnd) {
 		len = rounddown(avail_wnd, cur_mss);
 		if (!len)
-- 
2.43.0

