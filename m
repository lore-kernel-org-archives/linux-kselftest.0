Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB76824DCF6
	for <linux-kselftest@vger.kernel.org>; Tue,  4 Aug 2026 01:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785808075; cv=none; b=fr87DINF/bHbfNKEXjBnixdOqrYqT0FEOgKwYjXUujua8av4b+QgOyeM8ntL+9cfleJDinxCTq9rN6kgsDoSivykhUKkx0LGteeLiqZ55Q2Er2FdHghbNBoyZrNSfFigREYIyfPykaF0gu4+AhbkeWBu7JLM6DDn/SuZ9qRbE1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785808075; c=relaxed/simple;
	bh=o1eLQMEHSaO4J5F9k7/YliUZtUTXMI/llAbal8afmHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dCZwjkFgd/G7iCNBpSa/US+4W6ws1pz6rcpS8RWRHLwMxyRIw6rJaTpT3rUIomY/Ke55jNQZPnFzr0tyxIwJFcNfGzYGK/SHQGTg4FGvSs7bETwcgvOpzl734lOSjuBPNf3SutfSVxDRvda5VJR9gEORXVQ/jbHCQZaSolaP6IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uk1dWEOQ; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uk1dWEOQ"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8487214ad2bso5679228b3a.1
        for <linux-kselftest@vger.kernel.org>; Mon, 03 Aug 2026 18:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785808073; x=1786412873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8L2BgXJHdmrRxQEN7S4xlJQ5TE/oB/hO2agIkDxI05I=;
        b=Uk1dWEOQ2PSRwLvSnfaelB4IHyMD1Hnb9+GoaDC17pcnc5Mpk4xp87CYhHRDuMySYj
         HYtio68SSLm3nElyRjWmVVHtRQJjPkQWDf2iHX0DtcDXsRbrJA13nZuCB3GUSnYlhj1y
         spYAhKqzWLp/xbUL+xJfI5/L/g8Qe/iOmcSSiwmYB+uWJ0GhPqPHi/eQBWGdWhzwiwVF
         zZGaduaUHDVsOsfQmlOSdbPv1vDRzRjZxf7gph3kLQi+zc9eHP3FCze0o2WPuLlipt+X
         1yiLdIXCmw3B5FntiOnJHL8u5+gCHMdHNaJr+te9OYuyoNzRnYXb28FHKedRrOSNWb0L
         gk6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785808073; x=1786412873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8L2BgXJHdmrRxQEN7S4xlJQ5TE/oB/hO2agIkDxI05I=;
        b=HolT5QKxy+OodU/RqBYln/ZKQs6vqmJ4sbnG8azNr7vaHrAaOitLmTnuwBg6vwb4yU
         ybL7KxjKw4CUWhJY0JFqyLwTtSCdsoDMhfOM9h3R6wInEFIHH/aCEwImqVXRLdOhSaxq
         E0DEu1o0kpBW/YRb1BzpQduCzD2l45MOvG82uYbjgPAewKarSVhSei5cbxSOYrQIwcUy
         mgogLWWpq7x01/+yKz55zd6ILZvWoBxYlS/ZI0oWzhPZ/vX+rF0VcetyOmVefa+Iizws
         +Ul+kbg6hek0i2+FP30xzfnc1XrKyHoovpY0X1Bmc0ZFi5yV2aaWDu9yHyXoog3vWhYa
         DmgA==
X-Forwarded-Encrypted: i=1; AHgh+RoB/SZYadcNd0i8oyINI2WIyKzkE79cAUHMFHMRv8btS/uHFtwpZ2DVKL6a2vy2Scrn3COMzVJoUAXkTsSbewE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSCUOTGBcpHORNJv7kSr8swf7ls+tdRiIXw9kgrWNG+BjkGyrX
	MUR/JVBlfxEFXAoTfFavuTZLS+r9k7sgTC7xg9UBjM+98YpGhxvdtx+e
X-Gm-Gg: AR+sD12/6wq9yPsl8DlwLUV/427/GkzSGMUDp6aKQLSQJQNtGh/ob7qtQIjvHdPQlcx
	6Q6cduy/i7DqpESy0bovlA/ZBbrswY1W/0ECS5oX6DYD/GmjClcglu5Sz8/akUtY7cgR6rduZn7
	Xdj8Rd5n4qWHBzDb24WXuvIw0nlmWMHSnsEw4mZCorg/74Hen0nC0AHB/+RLqux+N4AIVVZ+9BQ
	DpggL6zRtVHgid14kDOWbubVxvAGnbXzNuPjunVymVEB6GySUdUGcsSmEfb7WfbL2yBiM1ysr2/
	nDybi4KayYFvWPNLoKHaAuU3dct5MXiW8XupTfekDkwCrLv0xwQanBjfdtC8FyKOUV9+kk52Phq
	0ZSUuQrzduOQaksOP5LZD1I6tKRw43mYyceHU4tYwV2ZbubyoaTLP3tOLBf2AUo/fUuk1KYQsiK
	fQUu5P2Eo4+A95UPvbvxM04Mg2ZDBFQ1nZnR1lRLqc4Hh80kYkfIjQe12xwrgPrPkRSi50hOOBt
	yNTBxgd1t0ppBIFr2JnzxRtKOlk94dXBawVh0tJQKFzbTr8jLVV
X-Received: by 2002:a05:6a00:10c7:b0:848:367e:ba48 with SMTP id d2e1a72fcca58-84ee4920b4cmr10995404b3a.45.1785808073190;
        Mon, 03 Aug 2026 18:47:53 -0700 (PDT)
Received: from m-upc-A520M-HDV.flets-east.jp ([2400:2410:3f60:500:cb1c:934a:3e5f:ef88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edc2d7b97sm4410164b3a.43.2026.08.03.18.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 18:47:52 -0700 (PDT)
Sender: Yuyang Huang <uyoko90@gmail.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	Chris J Arges <carges@cloudflare.com>,
	Daniel Zahka <daniel.zahka@gmail.com>,
	David Ahern <dsahern@kernel.org>,
	David Wei <dw@davidwei.uk>,
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Gal Pressman <gal@nvidia.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Nimrod Oren <noren@nvidia.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Willem de Bruijn <willemb@google.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v5 05/10] ipv6: expose the route deletion reason in RTM_DELROUTE
Date: Tue,  4 Aug 2026 10:47:09 +0900
Message-ID: <20260804014714.4362-6-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804014714.4362-1-sigefriedhyy@gmail.com>
References: <20260804014714.4362-1-sigefriedhyy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Emit RTA_DEL_REASON from rt6_fill_node() when the deletion reason is
not RT_DEL_REASON_UNSPEC, and reserve room for it in
rt6_nlmsg_size().

Every caller still passes RT_DEL_REASON_UNSPEC.

Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
---
 net/ipv6/route.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index 6732e95bf7b3..d3bf2dd209bd 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -5751,6 +5751,7 @@ static size_t rt6_nlmsg_size(struct fib6_info *f6i)
 	       + nla_total_size(sizeof(struct rta_cacheinfo))
 	       + nla_total_size(TCP_CA_NAME_MAX) /* RTAX_CC_ALGO */
 	       + nla_total_size(1) /* RTA_PREF */
+	       + nla_total_size(4) /* RTA_DEL_REASON */
 	       + nexthop_len;
 }
 
@@ -5966,6 +5967,10 @@ static int rt6_fill_node(struct net *net, struct sk_buff *skb,
 	if (rtnl_put_cacheinfo(skb, dst, 0, expires, dst ? dst->error : 0) < 0)
 		goto nla_put_failure;
 
+	if (del_reason != RT_DEL_REASON_UNSPEC &&
+	    nla_put_u32(skb, RTA_DEL_REASON, del_reason))
+		goto nla_put_failure;
+
 	if (nla_put_u8(skb, RTA_PREF, IPV6_EXTRACT_PREF(rt6_flags)))
 		goto nla_put_failure;
 
-- 
2.43.0

