Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4F424DCF6
	for <linux-kselftest@vger.kernel.org>; Tue,  4 Aug 2026 01:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785808069; cv=none; b=Xyev39FUUqykABgsX5ATz9w7qOuh5KLDoBHPXSmwg8e+CColS5BjBXLKs38bNxVuNmd5VFD2zDKvBm1C3kSPVgW0hmqOfYSr6/Q7WIBoEGBsl+9HM7KYRErwKK/iGXbNSxYwhwQjtR7/ZXpTUbXkpipISiX1QGGlRRyjrgF5ZcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785808069; c=relaxed/simple;
	bh=f5iPNAYIyJSTNkvHBBow6IJ3IWHzS+d8VwQ3xtwEm28=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k1tXY9imfry7+C+TUVN1+3/vSMcybx+o0uNnfj/RcXgeSvsNl27Jq4DkKl6QfrrVx11kMDOtJPrvJo6TPZv9Tv7x/vnQf5iZAOi0WvlcNKmQOSmpVGtKDMk6UwuE6hJd2L2p9JNcpuVQ8IY4tfZsJkcxBDTK/F/SXNqRxtblDx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XXKM4WEO; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XXKM4WEO"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84a4d8fd6ecso4340390b3a.1
        for <linux-kselftest@vger.kernel.org>; Mon, 03 Aug 2026 18:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785808067; x=1786412867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dY62WD4TU3Z29Lpr2YEceEfxUVbEPTovp2j+MS49Yco=;
        b=XXKM4WEOUxNKfgwl1WcakjZsNRVcKvep4CaBVlFsrL6LaZ1bm9R/B8P14QhABdn1hl
         uePZ6vk0l4GoDMRSomkDAP4eeXyF0nDXzEn5o5xjbLg8cBSstr0T8g97GnwBrJTT6C1m
         orjr3QOwgYIzLYPmusyrCEsKnvifXQRMOdm2JBLYNRspNeCnSB1JXsM9Smd6OigKi5ZP
         cV/czZcDe+7L9iSkMm/fatS0xuRGSo4w5xmd/45preJMdK4hOhmFiWZEJZdG/y9aqCJx
         /id3BdkF5Hfbqzwo75xyFspXG774yOe0ZCxB20ccMAeE/e5cQ+m4VPE0vqJuHZsrpudn
         Xjuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785808067; x=1786412867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dY62WD4TU3Z29Lpr2YEceEfxUVbEPTovp2j+MS49Yco=;
        b=dc1tzFV6RPKpdUqn825KvkCZ/EQnM3Ki8/uR/7Qiabw41jh9gwQHG7LhfAf4LRhFxT
         AFVWQQbLpQFIMMXrmcS0lmw4TUHQjHn/oPLMST5x1GdkVzGEnxM8R9yGFZ1UK5orkl+o
         NH7LucoO+vCzPnw2T3Dh7NLzxa7TXmHDAgaZHQCuvl5HaYMuOC4yjqxgZ7NOTc6azQxq
         FEF7wpUAOAQcfbaRQe/5/yL+KsMcBArHHAI3mto8Ffu5leWE8VO99l0MgLHzfrF9ymzR
         ZZVpuzEWzniSjkcjaqZh71ei/F1ZrPntlYoolpE66aRnHj0s/qTru86ex4avjr7/JT/+
         BttA==
X-Forwarded-Encrypted: i=1; AHgh+RoqgsEID0qvVB+qFEAFixgQGR67of89ktLDqKSLCAFmqR7dANDhMd7+zmFZ87atrDmo5k3MSwRScRAyhtP+8tg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1mdcTVrdttPeQS6ifFedfdMtAErKBtTstVX6oX+WezR8JsoSZ
	/ycLhONvFzkd5Lks4gNMUfIsl0WLnZua73Tj80LzmF3MSy0jB+4zvYTH
X-Gm-Gg: AR+sD10s++maQlUbPtKWwCCublkL6oXSbB5DFEYmhqN4s+7ioZSkT5Q/cgNpCDXyELF
	KYBrw0aqS5OMZzT7aRz/N8Y0m/LK/qkqW2WLToKvlL86zRpsLj3RpzmZvhAxj1102qgyAwnQeVY
	Thfukr1z3fmPgkzK1Xk1cHoaWGSgVFeVL5jmkaT4larypfuykkFZg00+suvfdcVoi0OyfGa2y9q
	q3u+vm54W1qN/IhKAWinKLIqZtyt2RTl3x+xjdnpgjvA8a3rQb9k5NTj5vI+tWvmGNxvEFHemR9
	Ooh1iqatl9++NoSj6H9/nIbQlQDQWmk87ObGtn4BEtU5cNJbhrqmn0lm3A8D0S0MTDwh+jMgnxQ
	oHkt9+lDvvyU8TMYrjmMkEQtpdWquT+pJMA/DgyKmuCbZzFgfPAl1PC3madajYUkPBv2uixeR28
	hCmwgubqBp71vnh8kmBpxZwO95LtiYM7KQq1eGDkSh8yeuir701WQTFk5JzlhnLDwlk3+fvnQ5w
	U+KrKHFtFX2JlHb0L8KChUnEA4tuvudya1IhDw2dY7YbWdEYyc=
X-Received: by 2002:a05:6a00:429b:b0:848:75a1:a0fe with SMTP id d2e1a72fcca58-84ee485ac05mr11064217b3a.18.1785808067164;
        Mon, 03 Aug 2026 18:47:47 -0700 (PDT)
Received: from m-upc-A520M-HDV.flets-east.jp ([2400:2410:3f60:500:cb1c:934a:3e5f:ef88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edc2d7b97sm4410164b3a.43.2026.08.03.18.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 18:47:46 -0700 (PDT)
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
Subject: [PATCH net-next v5 04/10] ipv6: add a deletion reason argument to rt6_fill_node()
Date: Tue,  4 Aug 2026 10:47:08 +0900
Message-ID: <20260804014714.4362-5-sigefriedhyy@gmail.com>
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

Add the deletion reason to rt6_fill_node() so that it can report it to
user space. All callers pass RT_DEL_REASON_UNSPEC for now.

Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
---
 net/ipv6/route.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index bb14d7f7bad4..6732e95bf7b3 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -111,7 +111,7 @@ static int rt6_fill_node(struct net *net, struct sk_buff *skb,
 			 struct fib6_info *rt, struct dst_entry *dst,
 			 struct in6_addr *dest, struct in6_addr *src,
 			 int iif, int type, u32 portid, u32 seq,
-			 unsigned int flags);
+			 unsigned int flags, enum rt_del_reason del_reason);
 static struct rt6_info *rt6_find_cached_rt(const struct fib6_result *res,
 					   const struct in6_addr *daddr,
 					   const struct in6_addr *saddr);
@@ -4037,7 +4037,8 @@ static int __ip6_del_rt_siblings(struct fib6_info *rt, struct fib6_config *cfg)
 
 			if (rt6_fill_node(net, skb, rt, NULL,
 					  NULL, NULL, 0, RTM_DELROUTE,
-					  info->portid, seq, 0) < 0) {
+					  info->portid, seq, 0,
+					  RT_DEL_REASON_UNSPEC) < 0) {
 				kfree_skb(skb);
 				skb = NULL;
 			} else
@@ -5786,7 +5787,7 @@ static int rt6_fill_node(struct net *net, struct sk_buff *skb,
 			 struct fib6_info *rt, struct dst_entry *dst,
 			 struct in6_addr *dest, struct in6_addr *src,
 			 int iif, int type, u32 portid, u32 seq,
-			 unsigned int flags)
+			 unsigned int flags, enum rt_del_reason del_reason)
 {
 	struct rt6_info *rt6 = dst_rt6_info(dst);
 	struct rt6key *rt6_dst, *rt6_src;
@@ -6066,7 +6067,8 @@ static int rt6_nh_dump_exceptions(struct fib6_nh *nh, void *arg)
 					    &rt6_ex->rt6i->dst, NULL, NULL, 0,
 					    RTM_NEWROUTE,
 					    NETLINK_CB(dump->cb->skb).portid,
-					    dump->cb->nlh->nlmsg_seq, w->flags);
+					    dump->cb->nlh->nlmsg_seq, w->flags,
+					    RT_DEL_REASON_UNSPEC);
 			if (err)
 				return err;
 
@@ -6114,7 +6116,8 @@ int rt6_dump_route(struct fib6_info *rt, void *p_arg, unsigned int skip)
 			if (rt6_fill_node(net, arg->skb, rt, NULL, NULL, NULL,
 					  0, RTM_NEWROUTE,
 					  NETLINK_CB(arg->cb->skb).portid,
-					  arg->cb->nlh->nlmsg_seq, flags)) {
+					  arg->cb->nlh->nlmsg_seq, flags,
+					  RT_DEL_REASON_UNSPEC)) {
 				return 0;
 			}
 			count++;
@@ -6347,12 +6350,14 @@ static int inet6_rtm_getroute(struct sk_buff *in_skb, struct nlmsghdr *nlh,
 			err = rt6_fill_node(net, skb, from, NULL, NULL, NULL,
 					    iif, RTM_NEWROUTE,
 					    NETLINK_CB(in_skb).portid,
-					    nlh->nlmsg_seq, 0);
+					    nlh->nlmsg_seq, 0,
+					    RT_DEL_REASON_UNSPEC);
 		else
 			err = rt6_fill_node(net, skb, from, dst, &fl6.daddr,
 					    &fl6.saddr, iif, RTM_NEWROUTE,
 					    NETLINK_CB(in_skb).portid,
-					    nlh->nlmsg_seq, 0);
+					    nlh->nlmsg_seq, 0,
+					    RT_DEL_REASON_UNSPEC);
 	} else {
 		err = -ENETUNREACH;
 	}
@@ -6388,7 +6393,8 @@ void inet6_rt_notify(int event, struct fib6_info *rt, struct nl_info *info,
 		goto errout;
 
 	err = rt6_fill_node(net, skb, rt, NULL, NULL, NULL, 0,
-			    event, info->portid, seq, nlm_flags);
+			    event, info->portid, seq, nlm_flags,
+			    RT_DEL_REASON_UNSPEC);
 	if (err < 0) {
 		kfree_skb(skb);
 		/* -EMSGSIZE implies needed space grew under us. */
@@ -6421,7 +6427,8 @@ void fib6_rt_update(struct net *net, struct fib6_info *rt,
 		goto errout;
 
 	err = rt6_fill_node(net, skb, rt, NULL, NULL, NULL, 0,
-			    RTM_NEWROUTE, info->portid, seq, NLM_F_REPLACE);
+			    RTM_NEWROUTE, info->portid, seq, NLM_F_REPLACE,
+			    RT_DEL_REASON_UNSPEC);
 	if (err < 0) {
 		/* -EMSGSIZE implies BUG in rt6_nlmsg_size() */
 		WARN_ON(err == -EMSGSIZE);
@@ -6474,7 +6481,7 @@ void fib6_info_hw_flags_set(struct net *net, struct fib6_info *f6i,
 	}
 
 	err = rt6_fill_node(net, skb, f6i, NULL, NULL, NULL, 0, RTM_NEWROUTE, 0,
-			    0, 0);
+			    0, 0, RT_DEL_REASON_UNSPEC);
 	if (err < 0) {
 		/* -EMSGSIZE implies BUG in rt6_nlmsg_size() */
 		WARN_ON(err == -EMSGSIZE);
-- 
2.43.0

