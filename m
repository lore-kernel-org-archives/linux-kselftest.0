Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793822671;
	b=eKDICg6g30jcHP5cBVUc7qVGmmiryOwrr5AWx5iiltDwujJWdRW3nDqaxipbn1ZUuXMM
	 lnMBGJH/NUXrxpdV1JJs577g2FzHpP+ttx99IH2iJPOF5sbv3QB3E+JGgCvWq56rFHMu7
	 W9Xji3At4ozT8BJQeJDy5dmXTnAT+DDpd0vfljgaNt3KjOANiKz2sM0Q7L8BOKNtXSeK1
	 b80gU2oXaoHJb5eXSVfJnEpXo7SunQ1sfWVGHlGfvpfiuDuYVXwdwIgj9RwOiVxcV2pJ6
	 bOF1Vf6GpYANEjKd0E/LTpNnU39EnCEJNv9P9AGxFBRCFk4amSIc+R/4HDypP59Yp8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793822671;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mAUYa7DsnYJVWK5uXvFQ0zTldnyeSGGQ67HR5sn+wb4=;
	b=ifNRGmeoKeyesw2OUnddv55hcTJkBqzfft193ehRaQuibQ8WUPCoQthR5v90RZ9aDMw2
	 DuW6U+n24fXRBB7QzOixRttIpaaLGkdPlMNpDjm+ixKi9Z714E3q3S3B0UzcPnosnO1R1
	 dcDW5NSHTh/uRt/hqiqQD6a8jjaaoHH9fHTHWdJAMu6/iSRMXd3LX7iYehHLq557x31yt
	 6pNghaI7F/Bo7mpSCSGPMn1CJ9rQUL7kPQMoP52JGcnVBM7fL5G2QFfmJYac19o1T+pJc
	 gLJT2B6EuuC6lqa0P8yrpwqMJ44Hm5vaCvpGyeWxUEfVyXHLHyj8C0pB0C/D63SbqwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iIGQtM82;
	arc=none smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0E1606E839
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 20:04:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F0E1606E839
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iIGQtM82
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3ab53a99771so9594291fa.3
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 12:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793822670; x=1794427470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mAUYa7DsnYJVWK5uXvFQ0zTldnyeSGGQ67HR5sn+wb4=;
        b=iIGQtM82BiNLyonv+Vl1VspuOaMrUC9/Ps8jkarVh6KbuKTW0cgRyFG3800Y8PBh94
         0O1TWzSF/QTQci3Jk8AyntkfwTrPK+ONyfVuEcW5cRCww6IwspuYxE6yDuZO/To2EWNB
         SExxL0YrZIYwTAFcBxjHG/uRDjSNW/mA7AME+Q3Z7c7217QIh1j0Ie9cf+jgYRxX6wn3
         0CP8WkGxtJawP+paRtQYxDz+iqhcbKsDOFdDCIiSrryfAUVwYa7zt0xC2AbpU3KnJCHW
         P9MGnd0HI+2n2KJKUS6Mvd95vktqGYhifeMI/55MUHToq+3/nMCk15kwgFdTtDAF0d0k
         l3RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793822670; x=1794427470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mAUYa7DsnYJVWK5uXvFQ0zTldnyeSGGQ67HR5sn+wb4=;
        b=ymiGziYp3gwELLUZQWvzJlrqhGruuFyll1BeUTsFEA2HNGAc1RTJPt/QP2AbRgJYqb
         97jhC2+I6AuegCgRIfLD+xEnfjw2w+2npol9hoN2cDXPSz8XJUF3aCK66u9sBHHvKxco
         8gSerPRq8li6YkQ/+zJK1EnwzBlgP9TodwAabNpemOpyVFMIs8qnOrU6T6jVqF8XqDvZ
         V3BuF4t0T1zTR34Oc6hHEaKZBpUaXWpYpSCfmSUDQakrxekdSKM8+Gy9ENhJkEstl+Xl
         KmY5Lfpr+csQ06Wo25YDbwTMQecauDdytByyLv+Zy8TnAakOziykaNExNt9ntVH9LiSf
         olUw==
X-Forwarded-Encrypted: i=1; AKwUvByrxwfjGhnwaSVOnl5WBVYlpo6NavhbCsxEAC0p90lq3KX6R95IkBA1dtMq9/7OWm+AC9caeFEQp5j20P2A4dg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KRPVf9by5w1pcNf6P2Kgtx+D6Fx+DT8yV3K/wr9fHj/nt+YvD
	rm59IgtfDTF6aRwEsnz/jDXmC8nq0Fomh2AGlwLVcHg4shooJvfc/znh
X-Gm-Gg: AYBFou1uIYXrsaVJpvosvHFn9L/KWTYj95WmhvNHA+QN0HxlOzbdlpB73CIyvlsQwKz
	3G1dr5LmyAvrnfWcd58HIgb8OZkEdxyVj+2r49lYd5rc4+iOibIQaoKy/OsvENf+Hgapm/Na7MR
	qFHtoTbj/mqjvJuIpjwHA+gThsMSbol+YjXeCnBzhN8kkjsr9oMmd1swEt/GTN24us1vsol/dgv
	wL86Vh36y6shEsyli2cZn8lvAjIqvu/hYzCDBeFIxz8CAoZNhs6OTAojgISQj+Q/GUysxPt4vck
	rrdmBOaBxqwALsKlxVuxLhGjXdbvW74R1I4bocmsDr5JlxCjmiSuwrX8jF3ANDZJ+xZ8t3uLbym
	jxGARhuHLj0dptxlkt3WvNeFvGxsxAALlBpNM4tEuSlEyfV768KASvXjwa9FlMs22WyrQo+vQ7J
	4pc6+9BnCf2Q/JTbkA6EG8ZlynBnxf5oRTnNOpom6eD9RLiL6ZNhYr2paGXuE7Cz27k5y3qZJz/
	7ZA4UFtis7y5ycu29S7C6Tr+CE/TD5KJdbBXSiHMN/G41IIXrndO5ybjihhGTzJAIoo4aOQnqnH
	Av/zF6O++A6YQNketCt6oAKpXGM/ak6uORn+RF/YNxy21FkxAR0=
X-Received: by 2002:a05:651c:43d1:10b0:3ac:cf09:d6ff with SMTP id 38308e7fff4ca-3accf09d9c0mr17250161fa.24.1793822669498;
        Wed, 04 Nov 2026 12:04:29 -0800 (PST)
Received: from gentoo ([95.55.209.127])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acdc6e9b60sm5848021fa.35.2026.11.04.12.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 12:04:28 -0800 (PST)
From: Yaroslav Dudkov <aroslavdudkov622@gmail.com>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	weiwan@google.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Yaroslav Dudkov <aroslavdudkov622@gmail.com>
Subject: [PATCH net v2 1/2] ipv6: ignore link state in gateway check
Date: Wed,  4 Nov 2026 19:56:54 +0000
Message-ID: <20261104195655.1406837-2-aroslavdudkov622@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104195655.1406837-1-aroslavdudkov622@gmail.com>
References: <20261104195655.1406837-1-aroslavdudkov622@gmail.com>
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

IPv6 route cannot be added in table when all
following conditions are true:
- gateway is not link-local address
- ignore_routes_with_linkdown=1 on device
- nexthop has no carrier
- gateway is not present or covered by any route in table already
Also multipath routes addition is invalidated by kernel even
if only one of added nexthops satisfies all above conditions.

Reproducer:

  ip netns add t
  ip -n t link add va type veth peer name vb
  ip -n t link set va up
  ip -n t addr add fd00::1/64 dev va nodad
  ip netns exec t sysctl -w \
    net.ipv6.conf.va.ignore_routes_with_linkdown=1
  ip -n t -6 route add 2001:db8::/64 via fd00::2 dev va
  # added
  ip -n t -6 route add 2001:db8::/64 table 100 via fd00::2 dev va
  # RTNETLINK answers: No route to host
  ip -n t -6 route show table all
  ip netns del t

Route should be added because:
- RT6_LOOKUP_F_IGNORE_LINKSTATE in commit d5d32e4b7668
("net: ipv6: Do not consider link state for nexthop validation")
was added for this
- the same route is valid in main table (when no specifying table id
while adding route)
- fib6_nh_init() initializes nexthops with no carrier
- IPv4 already does this (fib_check_nh_v4_gw() ignores link state
using the FIB_LOOKUP_IGNORE_LINKSTATE flag)

Before commit b2c709cce682 ("ipv6: Convert gateway validation to
use fib6_info") rt6_lookup() was used for checking if nexthop is
valid, rt6_lookup called rt6_device_match() which does not check the
link state. After change rt6_lookup() to fib6_lookup()
find_match() under fib6_lookup() started to invalidate linkdown
devices, because RT6_LOOKUP_F_IGNORE_LINKSTATE is not passed to it.

Adding RT6_LOOKUP_F_IGNORE_LINKSTATE to flags for ip6_route_check_nh()
solves the problem. RT6_LOOKUP_F_IGNORE_LINKSTATE is already used
inside the first search ip6_nh_lookup_table() and fixes the
bug in second search fib6_lookup(). Also RT6_LOOKUP_F_IGNORE_LINKSTATE
isn't read inside fib6_select_path().

Fixes: b2c709cce682 ("ipv6: Convert gateway validation to use fib6_info")
Signed-off-by: Yaroslav Dudkov <aroslavdudkov622@gmail.com>
---
IPv4 example of this situation:
  ip netns add t
  ip -n t link add va type veth peer name vb
  ip -n t link set va up
  ip -n t addr add 192.168.0.1/24 dev va
  ip netns exec t sysctl -w \
    net.ipv4.conf.va.ignore_routes_with_linkdown=1
  ip -n t route add 192.0.2.0/24 table 100 via 192.168.0.2 dev va
  # added
  ip -n t route show table all
  ip netns del t

Also when adding RT6_LOOKUP_F_IGNORE_LINKSTATE to flags of
ip6_route_check_nh() makes adding this flag inside of
ip6_nh_lookup_table() unnecessary for this call, making another call in
ip6_route_check_nh_onlink() with flags=0 the only place where it is
needed.
---
 net/ipv6/route.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index 94e5ef1c4f83..73d8a2c95602 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -3424,9 +3424,9 @@ static int ip6_route_check_nh(struct net *net,
 			      netdevice_tracker *dev_tracker,
 			      struct inet6_dev **idev)
 {
+	int flags = RT6_LOOKUP_F_IFACE | RT6_LOOKUP_F_IGNORE_LINKSTATE;
 	const struct in6_addr *gw_addr = &cfg->fc_gateway;
 	struct net_device *dev = _dev ? *_dev : NULL;
-	int flags = RT6_LOOKUP_F_IFACE;
 	struct fib6_result res = {};
 	int err = -EHOSTUNREACH;
 
-- 
2.54.0

