Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1153C3F64
	for <linux-kselftest@vger.kernel.org>; Sun,  4 Oct 2026 16:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791130348; cv=none; b=q+2NZ/mVKVD76Isu4NSnATmOf8a7TUh2hPh4WSH2xUXU/8oHck9umVzd1Yk4U/HuC7ql59o7S3A/a/vf9+97f+6t6F2Ui/1MTko3SuBISyX4pHGLckqWNuWVHaRH7E9Usn22yU7mJ72JHmgTToCaxJ00EyHuCMhttX9y7r5aOso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791130348; c=relaxed/simple;
	bh=cygj9XrML4i1wJQ8hHaGD+G5g+hpr9bOnAluhNYTSDA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z9mDj0cZHqgZBvCy+bDSuC2Rcq7EptpM2hbJz/JNuqLww55ukqRO+Meb5QkxuU/Ps5JmZOhh4lKo9psbCzbN+Umw3yON1yshswCas2sofDKaSL1yTq+yqk1bdJ74aDrX4oS+LIihN9dc2TzJxW2876aoap8c8Wnc/Ajc26iW3Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net; spf=pass smtp.mailfrom=blockcast.net; dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b=eh4qp+TF; arc=none smtp.client-ip=74.125.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b="eh4qp+TF"
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-48c54d65743so381525f8f.1
        for <linux-kselftest@vger.kernel.org>; Sun, 04 Oct 2026 09:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1791130344; x=1791735144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0IQefR0ITJSQZvvgSeBhwGRR05na9J9C3XNmDgSGtQA=;
        b=eh4qp+TFOKpPkQo9I20hLQA++A85KCA+XcbXBxi21mt6k33ZMEKwcC5h9/IiikwFXL
         I3GJ0zgmHCsIaL+ifdjwL2fj8dJHuPeidzqGbvezXqppQs2iJleaw7WOOc1IrQL6iP/e
         hWW58vOqivsdc6ACIyLIjTNAVfjEMYZF9Zx1nwdAzDXy0YR3KF3JKSFs0PUJpt2Szo1/
         eIBl5lwV15t62DTLrE0fLmDzJ5fFJwBCPXxAd9W8TF2EU19v2CeKASCLNUBtjjb/Swu0
         TsvFr+tQLlTvbsSTyUGq6VXASV/UaRX8geyxkauZyb5TCz43xQMkLJILJJ2RNe5Ud5LR
         R9kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791130344; x=1791735144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0IQefR0ITJSQZvvgSeBhwGRR05na9J9C3XNmDgSGtQA=;
        b=NiHYdqVH4OOp9jW2J52UejiaRSroOb7V03TSvejG1cWfbYpstR/EsJYt6ys0eRArFx
         a1oF7HJ+4VzWJ8DhsDIZe6aK4WWzrKEcvcylJOwYbCmrryGPX2J/1ZteV4qMRB6G8uwl
         id8srxwzZJI2xFIF/UCJuzq0Nk3UhytVCmaf2sdNX2uEP6+Px2h+xUcRHAzdS9+ujZ/U
         MQ64Dd0jorvueGkbQYw3KcwJ0nuMwU7US7Ld/u8CVB1HtutPVM5DRCL40ye3m0UkhEFE
         Hcob56sa3RsndNOHzU09HN9vm93PMuiTe63WDWv/1Y1iEygLgqDZTtmLzEDMCU0yxCh1
         eRcA==
X-Forwarded-Encrypted: i=1; AKwUvBwEHOsIbTQxnjZIJQ969cYTmMsMj7PDGY3TNGhBCEQhXd4xZr4MDGUUYzTheX+nDWuAjj6OfFP1Fq0dTtbxTEQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mBD3tV4mEZ9xTjhWsS7JnTaL+GNou/hxE1awIhkHanfjkKzA6E
	vCvDVJnqFcQYNIojfBywF1XXxNwScQVc8IAH0Zp5g0yBBPexJRVe6Lni3HbDeJvfHaY=
X-Gm-Gg: AYBFou1xhyGxbxXjo/oQsKvav9+40R+CuXvzRz6k2zPITqWW5DuV5nh3lXn60kIdgDD
	KuXMeZO9W+d09gE9eN7itoFysdPhezMPPml8T0KYSECgrpeA+9MEZWYWO0t1qI4WY24jMXgzo+k
	YYCP8jxzGte1B5j1lhDoVD6u4losKzrTRNy1JRHUWJZIz8T8hL/lcMCCRAXTZZscL6TT52ag/Pg
	KmqdblvDzzCD69vW2GSwyNIHTIGyPuqSaYvNy1cplk0my/ilwVTOy+XxD8xzq1yQQVf/NoytiHb
	PmklDfDb13vHJyabtXFevyt8+amwZYVYOHncZNpfV/Jbx0N6cxs0++FMAPmZ6rCTKBE0i+vWUtm
	pzNQ1XhDVkzS+lob86FpL2qg+Q5UEJa+OUbrym2+ITogi1sS6N1S3lY5ZlaXDr3MIWfriTFLPn5
	H9IL5CexG9vcKjBCOk0akA9QMaZK0IKsmsNjk1K8QXE1UjHSO+Njz4HTensIYS91mi6WMJ+E8NQ
	0eS5KmMJsc9PXyF7N/TbV3L8tfXGrns1j8tBsX2fBkkEdVMCR2oOgEx3yX1xKfkYKlgIcDf02bk
X-Received: by 2002:a05:600c:6092:b0:4a0:20c7:6d4c with SMTP id 5b1f17b1804b1-4a027452eb0mr134814135e9.0.1791130343733;
        Sun, 04 Oct 2026 09:12:23 -0700 (PDT)
Received: from localhost.localdomain ([197.51.72.2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a02854073csm244512275e9.3.2026.10.04.09.12.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 04 Oct 2026 09:12:22 -0700 (PDT)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Eric Dumazet <edumazet@kernel.org>
Subject: [PATCH net-next v3 1/2] amt: mark relay data as a UDP tunnel packet before sending it
Date: Sun,  4 Oct 2026 19:11:59 +0300
Message-ID: <20261004161200.27196-2-omar@blockcast.net>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261004161200.27196-1-omar@blockcast.net>
References: <20261004161200.27196-1-omar@blockcast.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

amt_send_multicast_data() encapsulates the multicast packet in
AMT + UDP + IP headers, but unlike other UDP tunnels it never calls
udp_tunnel_handle_offloads().

If tx checksum offload is enabled on the amt device (off by default),
GSO packets (e.g. from a UDP_SEGMENT sender) reach amt_dev_xmit()
unsegmented. They are then sent with neither skb->encapsulation nor
SKB_GSO_UDP_TUNNEL_CSUM set, and the lower device drops them:
__udp_gso_segment() fails because csum_start does not match the
(outer) transport header.

Call udp_tunnel_handle_offloads(skb, true), as other UDP tunnels do.
udp_csum is true because udp_tunnel_xmit_skb() is called with
nocheck == false.

Also reset the mac header of the copy before recording the inner
headers. amt_dev_xmit() pulled the Ethernet header without moving
mac_header, so inner_mac_header would point 14 bytes before the
inner IP header. That makes tnl_hlen negative in
__skb_udp_tunnel_segment().

Suggested-by: Eric Dumazet <edumazet@kernel.org>
Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---

Notes (v3):
    Found by an LLM-assisted review of drivers/net/amt.c. Reproduced with
    the selftest in patch 2 (x86_64 KVM guest, CONFIG_DEBUG_NET=y), tx
    offload on, UDP_SEGMENT bursts of 8 x 1200 + 100 bytes, IPv4 and IPv6
    inner traffic, 40 runs per kernel on net-next eb0c18404c89 and 20 with
    this version of the selftest on 071876fd5048:
    
     - before: 0 of 900 datagrams delivered and tx_dropped +100 on the
       relay's egress device, in every case
     - after: 900 of 900 delivered, no drops and no UDP checksum errors at
       the gateway, in every case
     - with only the skb_reset_mac_header() call removed (two runs, an
       earlier version of the selftest), the packets are still dropped and
       DEBUG_NET warns in skb_udp_tunnel_segment()
     - tx offload off, and non-GSO datagrams with it on, work before and
       after; amt.sh passes with the patch
    
    Not tested here: hardware UDP tunnel segmentation offload, hardware
    checksumming of a non-GSO CHECKSUM_PARTIAL packet (it now leaves amt
    with skb->encapsulation set, as with other UDP tunnels; the selftest's
    egress device has tx offload off), a forwarded GRO packet as the GSO
    source, KASAN (the netdev CI's debug kernel ran v1), sparse, udp_csum ==
    false, and amt.sh on the unpatched kernel.

 drivers/net/amt.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index 0277e4c..a8236d4 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -1078,7 +1078,17 @@ static void amt_send_multicast_data(struct amt_dev *amt,
 	if (!skb)
 		return;
 
+	/* amt_dev_xmit() pulled the Ethernet header without moving the mac
+	 * header. The tunnelled payload has no link-layer header, so the
+	 * inner mac header must coincide with the inner IP header.
+	 */
+	skb_reset_mac_header(skb);
 	skb_reset_inner_headers(skb);
+	if (udp_tunnel_handle_offloads(skb, true)) {
+		kfree_skb(skb);
+		return;
+	}
+
 	memset(&fl4, 0, sizeof(struct flowi4));
 	fl4.flowi4_oif         = amt->stream_dev->ifindex;
 	fl4.daddr              = tunnel->ip4;
-- 
2.50.1 (Apple Git-155)

