Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794991572;
	b=DasLHlc+0MY988giZkI4m1HFJ9UkRxQKzXPSv3XpWE9MpfzPRIm0LzL0jxlrnf28oC5/
	 ain6Vj/w1dLpW2haiQA9rPJY88cFRlnB/TuMKV+aYZWSl8y55xzcMdQVt+msGxO7N7cjC
	 t0pGwp8rzfovieHOXHm+EjQ+WsJGdLA5iHk6wwthtrfwF3jzaJmsvKQuMSJ09daE1MdrR
	 UGKI4p+X0VUOkfzDFX0jLX8ezrB66mIZu6pTjvw7hS0j5NYnawh/IXiYpiZQ/NvWDkpDD
	 a0HjAi6Ck5cRuPzwEetJuUWyHpZufTyUrGblcQvDud8/odZ4Pii3XJ1SxYdoKKjV7Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991572;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3QIwNNjbPCMY9vDnX5iy4rnVih4SICdsbjgMj/Fl6DI=;
	b=OaWY4dqYGUxJFJ5cft5VTrU3aGRw6fBZNDms+P+5OAI/4xD64ooCYGp7rGJsvVST4UMt
	 cf2H9magxZV5OK8em3XnDO4ry2OWVRTCaRMWMskc1XTsorQD5ag7ebqZmutmsT1PvI4uF
	 C4r9bx9R3IsxBxCFF2rXtpC6eYV8aiF/M44wk1gzb2lxsEq1vFbINI2+UgzMchMKayFgm
	 yG7CgiqrsEq/9TGULCrwLIqsR/RbeVOrRwdp9O9l/hyGY08jBuEZedGggfq8xecLb0ihW
	 NRG/nu2cFvTvoj5xTdl+shsRO1TbwJKjo4xVJPnIyQ8bYpYm9rJut1ye6KdqCo3CUXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ylwfilqf;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC073606A325
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 08:46:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC073606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ylwfilqf
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b3b4944a0eso579723c88.0
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 00:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794991571; x=1795596371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3QIwNNjbPCMY9vDnX5iy4rnVih4SICdsbjgMj/Fl6DI=;
        b=YlwfilqfImrmeUkjlmi31h8/Gtwx5R+YTc3jkhYD55hYY4e+ISCZjjjbTdIiTzhcV7
         cbSD6Mhy0IK4wtt/gqPLb3WBm/5UwX5ZaiG7GxzQQ21Y16HGi71C6/Q32aJHlyQFBTo9
         o43bdcYA4TeNLD/jN8dVcvW6x4KD5Y9xsgFAE/mXaBPcVfAQSxmdd0ZmeS+88bPuJ6/y
         GuEXauXS/+B4MK+eeDHAnsozZwqhXA3K+9RnlLJPuWqj3W0vecclR2WMx3PKOYSu4nm2
         0JE54dk5TPK5j/uixo96McpIYb+68Q936zCzgqvjbOwp/oco8cQjFQZImAqdnXwEA/h7
         eJUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794991571; x=1795596371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3QIwNNjbPCMY9vDnX5iy4rnVih4SICdsbjgMj/Fl6DI=;
        b=YEQOfgmpPfDQYnEMfNbOQ3ZbLeo4Wbyx3W8LzGNEtVYj7dEEEsb5D+DNS3icTNMCFX
         W1XVt7AHddqWX9iqqqKJQyGbosr6COQaeWz7Gvr+n7lMXK1edbGpoBtuNlemFLnzlXo4
         ARE3kz4GbLuBbg+CJuOvBPpodynCQd7ANZznWYPX3fwSl5DV7MirErNKweZ40prBLroe
         wR6YuiIOcSB94lKZfzyhwT1lvK9b3JG06fsNgfY3ZnBJxrX4X6n/rz6c1gJNWdj/+2Me
         N6I4m9dweh7ITs8o2Ig7lmvVnXRqoRvN1Yo6JMhSmMoZdUEW1k4YK9Z4bdRdxynQwsMR
         AAMg==
X-Forwarded-Encrypted: i=1; AL+hErFV+yeyLJHKsMYBapSjqhS0Fw3d2dXrwHAuUWXNAOWSj4H93WDl+LkgImRTFzM13N6ieKsiIxF4Mj3utzMASig=@vger.kernel.org
X-Gm-Message-State: APuU4Z98tBPujJfh9hn6gyp44DD/m62jidFQtIwQ4685sOJxh+BGSc7H
	nbYDQOiILDzAQ//5hGFUENgkrdIn5NUCnkY1J5CCMu/MqtbPDLjckDrb
X-Gm-Gg: AYBFou2Q1l70MrQ77Yt1RAohke+2i5Spqlz63qruVkQtWFQVQk8jp9z0pAnoppDlJWG
	/v0bV6rR05NqLd7F1IgyyLXjU+v2T0wSNPgQh/3xwjmlVdvdP+uCiOvaRBpTEX4Ur5nBC27pUnP
	aQg1IbcIxLoUA/PT4YMAgLtbtZTfVsI9HwTtewDtYoOY7/A1tdvrq21XyhDl4Z0h2Zd+IQZACOH
	LKQmuPtd4v2+gMuy+k7J0gnzxKantdRP+uqAf7Sv4AeT+uDJEeiGnBN1jaA17uFR9h5ZqEPEE3z
	1z6sG/efEs89JcM/ON3BVYJh+OrZ/f1m8RtQ0XPHsCj4u3TQRQhLdnCHJM0ou2Z4kr8BEeGX7z1
	DK1gv9xA7s7FaWd1KMRf/OiW8b8pjZeG+xJtEMETR9m7KVsa0heGRaHconoRaaC6AOtThJ/54+W
	N3hVDN6y5AL2HqclWECEoQ5N545z8jLA7huzxk8dNFDx27QvrjyRtSLMIQREDUzqaUbMwuycF92
	no/wCNUXa1VSr8K0XiqZe4jc/X6CM9T3kY7iRJQbMQtTNSnGltFuRMc13Stly4BZYh/xXBBcYUT
	Lg0UDbk34haQBroIc+WGKB14PmfkY1N5FrA7EawNWjBULs1VPNiIIFU3xBCAkiFifkkCmMmPo/I
	QsA==
X-Received: by 2002:a05:701b:4584:b0:138:30b1:4c00 with SMTP id a92af1059eb24-1b543af0334mr2051555c88.3.1794991570825;
        Wed, 18 Nov 2026 00:46:10 -0800 (PST)
Received: from zypulse-in-radeon-MS-7E24.lan ([2406:da18:1601:7200:e02b:e41c:8db0:668d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447dc5e9sm7220671c88.11.2026.11.18.00.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:46:10 -0800 (PST)
From: Yuen Su <zypulsecore@gmail.com>
To: netdev@vger.kernel.org
Cc: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Stephen Hemminger <stephen@networkplumber.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org
Subject: [PATCH net 1/2] ipv4: accept nexthop dump attributes in route deletes
Date: Wed, 18 Nov 2026 16:45:09 +0800
Message-ID: <20261118084510.332821-2-zypulsecore@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261118084510.332821-1-zypulsecore@gmail.com>
References: <20261118084510.332821-1-zypulsecore@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ip route flush reuses route dump messages as RTM_DELROUTE requests.
With nexthop compatibility mode enabled, the dump includes RTA_NH_ID
alongside expanded nexthop attributes. rtm_to_fib_config() rejects the
combination with -EINVAL, leaving the routes installed.

Skip the mutual exclusion check for RTM_DELROUTE. fib_nh_match()
already uses the ID to match the nexthop when an ID is supplied, so
the expanded fields do not constrain that match. Keep the validation
for RTM_NEWROUTE and leave the other delete selectors intact.

The failure was reproduced while investigating the iproute2 flush
report below. An unmodified kernel and iproute2 reproduced it without
fault injection in a fresh network namespace with compatibility mode
enabled.

    ip link add d0 type dummy
    ip link set d0 up
    ip -4 nexthop add id 101 via 192.0.2.1 dev d0 onlink
    ip -4 route add 198.51.100.0/24 table 1111 nhid 101 metric 10
    ip -4 route flush table 1111 metric 10

Verified the flush and the existing new-route validation in QEMU/KVM.
The IPv4 compatibility selftest reproduced the failure on the base
kernel and passed with the fix. The IPv4 group and IPv6 compatibility
selftests also passed with the fix.

Codex assisted with isolating the IPv4 delete change, writing the
regression test and running the QEMU comparisons.

Fixes: 493ced1ac47c ("ipv4: Allow routes to use nexthop objects")
Link: https://lists.openwall.net/netdev/2026/10/26/186
Signed-off-by: Yuen Su <zypulsecore@gmail.com>
---
 net/ipv4/fib_frontend.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/net/ipv4/fib_frontend.c b/net/ipv4/fib_frontend.c
index 8c123b1..6b012c8 100644
--- a/net/ipv4/fib_frontend.c
+++ b/net/ipv4/fib_frontend.c
@@ -868,7 +868,10 @@ static int rtm_to_fib_config(struct net *net, struct sk_buff *skb,
 		goto errout;
 	}
 
-	if (cfg->fc_nh_id) {
+	/* Dumps can include both a nexthop ID and compatibility attributes.
+	 * On deletion, fib_nh_match() uses the ID to match the nexthop.
+	 */
+	if (cfg->fc_nh_id && nlh->nlmsg_type != RTM_DELROUTE) {
 		if (cfg->fc_oif || cfg->fc_gw_family ||
 		    cfg->fc_encap || cfg->fc_mp) {
 			NL_SET_ERR_MSG(extack,
