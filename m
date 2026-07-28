Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D0945348A
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Jul 2026 14:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785249377; cv=none; b=mF4bHGhDnr8YXZLyAhAMSsoL4xoff6WVjIacjxDTrD8l5sx1IV4/mq9hHgJZjgXvUuUAHTMD1hybPAKsQO5PGqtohUXtYKtNKclF3VrAsFXiUJDP6Q6jM+lMoLgKHmtbKwC5n7E4V561wr6CTu+7TnL9uCwfzlkpGO8PMqn9DR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785249377; c=relaxed/simple;
	bh=JiBrAmbJiM1RtUF5EuCg38M4dOYobpLpQnIXGn0FdnU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lxO3vF4YHZlIpvQkogF0KbWx692GiRbLIRiDOQ2J4hcfRtrtc+OX1Nl52VVQRSYU2ND0oWESnIy7KqLkq5r7PClZZsU7ytmb3RcDK2YWn4pyFgis0dbll371pjnnUxM52/mIm3/HR+QlyuKRxVTraEy8Xo8pEp+rOiLX3BNfGyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nVvIC/ug; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nVvIC/ug"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4706f016316so180962f8f.3
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Jul 2026 07:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785249368; x=1785854168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n6d67jM+qK7S9AuBw7ITUYXOxF3mCoNausBAPxmDUU8=;
        b=nVvIC/ugK+BqRz+APF+di5HzEzJFLcgmhGLJAM1iEBLFcXZvxQFxmt/IsfM8F14mhl
         7Abkr7IpMejsTzTpXQg9YK0R2T2v3eO/RihVGz6epPXI5CthzwLU+kETMwyy31osS6A+
         uUeyE/AUwc3YhKsY8ienaZ6lGyn0seUsehorKAJSb0aT4dAwY5dLe7sZUOmtrvKyJHK3
         c7VPk1g4+YBmkSKQcpEHqA1X2FXBAR/Pxxzd5NLoBPQhqFB9ctQDYItXr4lnR3RFadzO
         ngnDgiFLopIgaIOZt9R/Ad+P7ZKpQOutSRT+Jig9FL0FxGjNzVlncZBWlc7A/Yg+SGjt
         L7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785249368; x=1785854168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n6d67jM+qK7S9AuBw7ITUYXOxF3mCoNausBAPxmDUU8=;
        b=hM1TCOEchR1d8kjlWX69pdnj7UJeSSfCZxdz/cEEmCi3zcOjoJHhnjuw4MzxxcFUJ6
         uK/VipwptC9KuOLH3AlfSUOTfXUfqfxx4S2daRYLSkAyFm0NILnF5Y1XzuEMOtMbtseX
         qxXeWBhdSwNk2TgMbEIYzrS+Hh/SQ6jfROD9XZjhdk/Woso9wvPTZTIM7zifUciAMO5b
         3CZYToUDKDMGOrWoE0iRpF7W40e1mPm5M3hEqfBFYKojACNUDz4As+Y19WctdhYdpxfH
         SqEvB0hd8HlFumsaGNVPKf1yv7onXT+8uuZmu1pFLw538/PJ3PdM/FaXktvtqG2tC60d
         YbhQ==
X-Forwarded-Encrypted: i=1; AHgh+RpEzfqIIA5iRVrTNBkkdjOJ3VYzoitBUpWHUVf9u3wJsMfmkrHvs/u48yGjzoByBAVEOotWupL3tLUpwpZfwWs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLPwxYhZ5idlIwW37dggkwA+MGyZCpK5qc+0dN3vDVo/LfQ9jE
	LWh8c2mxOhitZA53YEdniaiZN9fcWqdsUI8CXxOkeqDuQSm25N/1kGFz
X-Gm-Gg: AR+sD1219nuSnjLVTdJHUVayRbx2sVJ4PVCx5bBpRq9CuTjB8X2+GzsC6LHDE3DkJWp
	hVQtdXwRUXNxf07oIQI6GRkNhb8lH1emo12KfGjKWySyMUQOHZ/ALXM1UZ8fH//ueSrVqEQsJby
	5nNips+FeD9zJUYb/AhylGXib2e3ELmISw8QWEIJV0U5poVkotVzDqmS6AnUwlb1msQhAsD9avJ
	JQCB98ozHcjegoUfSuQlpUcAKW8yp7P4KXduMNO/EQJ9qlyKGqS0sMznuVwma4zILbY6ff3e5H9
	MUT1vSjalGu2FtOW6z4k3c5gyHlYtT5T+zl5ohJ9VMXC1wcSH38YTxhgZr1nR8BLWfo0dLgDFbj
	FyMBMmz/21wtdKsVbdXAGBhh0t8YijH4JqFxuqbKflmDMUVXkT0QclBPhb4NuVgV/qAFDucTq/T
	P0QdkxsA+2yhstERxDQe+EEPFvZZGJ4Pw/wL4OJPR6hKM4R40jkKzjQRD6eWLiW4MGHLvaYOJ6P
	hWSY+uA95AzhD/9FGWemn/lIM1XwFuo0lYECsw=
X-Received: by 2002:a05:600c:548a:b0:493:ec89:db4a with SMTP id 5b1f17b1804b1-496c60c2746mr17907035e9.0.1785249367859;
        Tue, 28 Jul 2026 07:36:07 -0700 (PDT)
Received: from L-022584.energy.envision.com (dynamic-077-179-168-074.77.179.pool.telefonica.de. [77.179.168.74])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957bfe07e1sm303390105e9.3.2026.07.28.07.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 07:36:07 -0700 (PDT)
From: Xin Xie <xiexinet@gmail.com>
To: davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: edumazet@google.com,
	horms@kernel.org,
	shuah@kernel.org,
	lukma@denx.de,
	m-karicheri2@ti.com,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Xin Xie <xiexinet@gmail.com>
Subject: [PATCH net 1/3] net: hsr: privatize interlink-bound skbs before address mutation
Date: Tue, 28 Jul 2026 16:36:02 +0200
Message-ID: <20260728143604.26-2-xiexinet@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260728143604.26-1-xiexinet@gmail.com>
References: <20260728143604.26-1-xiexinet@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On an HSR RedBox, frames forwarded to the interlink go through
hsr_get_untagged_frame() and arrive in hsr_xmit() as
skb_clone(frame->skb_std). Two reachable alias cases make the writes
there unsafe:

(a) A tagged multicast or broadcast frame received on a slave is
    also delivered to the master through another clone of the same
    buffer: hsr_deliver_master() writes the node MAC and hsr_xmit()
    writes hsr->macaddress_redbox into the same six source bytes, so
    the local stack receives the RedBox MAC instead of the
    originating node's - deterministic without backpressure.

(b) A master-originated frame forwarded to the interlink aliases the
    original TX skb, which packet taps or the TX path may still hold.
    The master-origin substitutions (hsr_addr_subst_dest() and the
    outgoing-slave source write) and the RedBox rewrite would all
    modify that shared data.

Privatize the interlink-bound skb with skb_cow() before any address
mutation whenever it can alias a live consumer: for all
master-originated frames, and for ring frames the master also
consumes (is_local_dest && !is_local_exclusive - the exact inverse
of the port loop's master skip rules, so the condition does not
depend on port order). Every interlink skb reaching hsr_xmit() is a
clone from get_untagged_frame(), so the selected cases always pay
one private copy. On the hardware tag-insertion path, the selected
master-originated and locally consumed ring frames are now isolated
before the interlink address write: the interlink write can no
longer change an already queued clone of the same frame. Ring frames
the master does not consume (is_local_dest == false, e.g. unicast
ring-to-SAN) keep the zero-copy path; aliases that already exist
there - for example between the interlink clone and a peer slave's
hardware-tag-insertion clone - are pre-existing and unchanged by
this patch. On allocation failure the frame is dropped with the same
accounting as a tagged-frame creation failure.

Fixes: 5055cccfc2d1 ("net: hsr: Provide RedBox support (HSR-SAN)")
Signed-off-by: Xin Xie <xiexinet@gmail.com>
---
 net/hsr/hsr_forward.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/net/hsr/hsr_forward.c b/net/hsr/hsr_forward.c
index 0774981a65..67aaf5a862 100644
--- a/net/hsr/hsr_forward.c
+++ b/net/hsr/hsr_forward.c
@@ -420,6 +420,22 @@ static void hsr_deliver_master(struct sk_buff *skb, struct net_device *dev,
 static int hsr_xmit(struct sk_buff *skb, struct hsr_port *port,
 		    struct hsr_frame_info *frame)
 {
+	/* An interlink-bound skb from get_untagged_frame() can still alias
+	 * another live consumer: for master-originated frames the clone
+	 * shares the original TX skb (which taps or the TX path may still
+	 * hold); for ring frames the master also consumes them when they
+	 * are destined to the local node without being exclusive to it.
+	 * Privatize before any address mutation.
+	 */
+	if (port->type == HSR_PT_INTERLINK &&
+	    (frame->port_rcv->type == HSR_PT_MASTER ||
+	     (frame->is_local_dest && !frame->is_local_exclusive)) &&
+	    skb_cow(skb, 0)) {
+		frame->port_rcv->dev->stats.rx_dropped++;
+		kfree_skb(skb);
+		return NET_XMIT_DROP;
+	}
+
 	if (frame->port_rcv->type == HSR_PT_MASTER) {
 		hsr_addr_subst_dest(frame->node_src, skb, port);
 
-- 
2.43.0

