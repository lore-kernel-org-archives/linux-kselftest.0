Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34C921B9F5
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Apr 2026 03:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775620019; cv=none; b=GNpr/yvHyIJP+wjSSvTYVBKbg2I1z7m2J6T2rbT0JgVZRe3ufHbjVow0I3NZABd/al5sTV9pesfoe//BQkjLm1C2MkPJ6Y4NV5OBswWr10dEBFNAVXYR/+eUk1S/Pgi01FGozelM7OsQoIMG8F2nmSBCBUr7iIrpSxiRLle8mCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775620019; c=relaxed/simple;
	bh=XLWK3U7t3wtnUiVeSeL403GD/3ggJvFV0dCHkY3YMwo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fjx8YGw12r/VAmo/uiEFrLGVd8ijBgp/tOwfeJLs4LECJYviAx+PNLnu8qCQ6tdO5oDnBh2TsbsFPgq9T8W3+x2llSJ9rMzw1/zXjzsSfTbpMaulpvwM2M4cnLKlAEYXe0VX7ntp6dX3av+Zklgrs+Jsn5nShud0eSjqUdHpnvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IlImg9ZM; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IlImg9ZM"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-79be0de8610so56742107b3.2
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Apr 2026 20:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775620018; x=1776224818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gEYNDhDMiU1B6pQ6eoniUd0oA2vBhdScWVGs5ZrFJmE=;
        b=IlImg9ZMzcIHtEWX/wo0mYRM8uDU2XMJZ8EDGrXzzqUqv3WoAN8SidnFqMpOEkCFPO
         kbCPOpGTHN1EvpKxB6WtgcS15Uikw4alIYqtGwAMU0IqJom2qEfRL29aoYCKvtCKsx+c
         blBvxHyB0DWnyEVmFtdBu7dmIAtp3zi6q7uLwoD29B1DJ/WCN94o8n6jV4qWCCRhmnf6
         2+7SotRmxzvVwbfPlAbj6jHO7zTRKD3KWjLYNp8IecZaOOMFORgJxZwPgFgzqyKt6XL2
         uFGm4HlLruAIxX1hQfdfOKjpG2AUwI6r6iA7a3UDlQauUU+ZS+2YSrc23uO9ZKpo10nz
         1n/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775620018; x=1776224818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gEYNDhDMiU1B6pQ6eoniUd0oA2vBhdScWVGs5ZrFJmE=;
        b=PwzbqW9ol84N2u7lYKxsRxgvisVWUz8flS0l7mlobjLx6lIf/XBxVpy4Tw+uVxAdlN
         MvV/dJJoLUlX0BJ7drrFWt5gbQTcoxawxUl3r7cGzlF6aduUWX4Bb+PGAf5g2Sv/qqE4
         5lOFxF+TdTL2GJqGVQziIZV8D3Dj5poHWMDfC6jFJyZO/3vftFrsbsLCedDyNKTnRW74
         sQFWQdKU41422HAFpTp9FvoTgCmumsbOqW/wEXfHdcWVYgezeZ8v+6e0rdINgWH8hLmV
         q3SPj2cw1cvbO7eJI4fzF0997iP4qkUd6aQGeXmHej9hv0Iw5Zun6Bsmv+E+4qAWMZKw
         rXMg==
X-Forwarded-Encrypted: i=1; AJvYcCUewNK3EPlcXch7OzIxt3tGiRaN//fAWXWV36e6QhiRaAYtMTb3z+/tI1DrmUywwVlEjCP42do9fuMf0J0P0zY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxDxlWSkrqoc3ouORHgzju6rTqTD8AOzFqrkSFCIi9rCpT9TWh
	sKyQfoKp1b6Ur7tIVsFHJWU3ihGDL8UcYtVXrn+6Q/3zhhcfIxyqInZw
X-Gm-Gg: AeBDievF5egUFeTmMhUdS2J7Br5Hbsdcc3aH2QGQWioFEopGiC6jfE7LHOlyOarhOL0
	tweqa05Rm7LjU5A1pgENqlVlI0LC1e1oW6rhushK+Mm66dyYCcxViavsJnOHOtA5Yf0+JeBeFZk
	sIt5Nh70/P71807u9gAF9RIkGqxs2l2tIfLuxeoO0L6X7a/h2FIxXoHSgP9EM0aipkda3xUjAOe
	tGTAKgjIR4eUPLE2Ckd3jBPS3vpwduTFIOCG9TMfXQQsyKRzP1ESAgPRf5MhwPctjOERFi3C2nR
	RvJhRnR40WJIgVxr8ZkwjDoJihptMaoPdmiZiOMu0RIimAuQOoh9DgM4nUsyBrKExl9F0+YCy/1
	yEQaqat0lGuo/Hhpc5tWIhR2RCqQ0OLUvk3nqAHhknSL1+zmVPe6UoLkjSPXYa1CBomwDFgKh16
	aX+SSS2ii3sIKFowfiv39bss+B44j3phBHxPOkWeBtx7jawW1BL+/CPWhS1xLis9ieDSQoJOwfZ
	eqVQjpjnm8pi5B/EpTwxochICkC2jHszs7rflKUM1C4G3ijpS2+itmqxNFj6NfHeFE=
X-Received: by 2002:a05:690c:3482:b0:7ac:ff2:4603 with SMTP id 00721157ae682-7ac0ff272d5mr6996747b3.20.1775620017727;
        Tue, 07 Apr 2026 20:46:57 -0700 (PDT)
Received: from localhost.localdomain (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7a370df155csm79129167b3.36.2026.04.07.20.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 20:46:57 -0700 (PDT)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org
Cc: martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	horms@kernel.org,
	syzbot+619b9ef527f510a57cfc@syzkaller.appspotmail.com,
	bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH bpf v4 1/2] bpf: reject short IPv4/IPv6 inputs in bpf_prog_test_run_skb
Date: Wed,  8 Apr 2026 11:46:22 +0800
Message-ID: <20260408034623.180320-2-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260408034623.180320-1-sun.jian.kdev@gmail.com>
References: <20260408034623.180320-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bpf_prog_test_run_skb() calls eth_type_trans() first and then uses
skb->protocol to initialize sk family and address fields for the test
run.

For IPv4 and IPv6 packets, it may access ip_hdr(skb) or ipv6_hdr(skb)
even when the provided test input only contains an Ethernet header.

Reject the input earlier if the Ethernet frame carries IPv4/IPv6
EtherType but the L3 header is too short.

Fold the IPv4/IPv6 header length checks into the existing protocol
switch and return -EINVAL before accessing the network headers.

Fixes: fa5cb548ced6 ("bpf: Setup socket family and addresses in bpf_prog_test_run_skb")
Reported-by: syzbot+619b9ef527f510a57cfc@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=619b9ef527f510a57cfc
Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 net/bpf/test_run.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/net/bpf/test_run.c b/net/bpf/test_run.c
index 178c4738e63b..300e2bfc5a62 100644
--- a/net/bpf/test_run.c
+++ b/net/bpf/test_run.c
@@ -1120,19 +1120,23 @@ int bpf_prog_test_run_skb(struct bpf_prog *prog, const union bpf_attr *kattr,
 
 	switch (skb->protocol) {
 	case htons(ETH_P_IP):
-		sk->sk_family = AF_INET;
-		if (sizeof(struct iphdr) <= skb_headlen(skb)) {
-			sk->sk_rcv_saddr = ip_hdr(skb)->saddr;
-			sk->sk_daddr = ip_hdr(skb)->daddr;
+		if (skb_headlen(skb) < sizeof(struct iphdr)) {
+			ret = -EINVAL;
+			goto out;
 		}
+		sk->sk_family = AF_INET;
+		sk->sk_rcv_saddr = ip_hdr(skb)->saddr;
+		sk->sk_daddr = ip_hdr(skb)->daddr;
 		break;
 #if IS_ENABLED(CONFIG_IPV6)
 	case htons(ETH_P_IPV6):
-		sk->sk_family = AF_INET6;
-		if (sizeof(struct ipv6hdr) <= skb_headlen(skb)) {
-			sk->sk_v6_rcv_saddr = ipv6_hdr(skb)->saddr;
-			sk->sk_v6_daddr = ipv6_hdr(skb)->daddr;
+		if (skb_headlen(skb) < sizeof(struct ipv6hdr)) {
+			ret = -EINVAL;
+			goto out;
 		}
+		sk->sk_family = AF_INET6;
+		sk->sk_v6_rcv_saddr = ipv6_hdr(skb)->saddr;
+		sk->sk_v6_daddr = ipv6_hdr(skb)->daddr;
 		break;
 #endif
 	default:
-- 
2.43.0

