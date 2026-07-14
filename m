Received: from eidolon.nox.tf (eidolon.nox.tf [185.142.180.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADF243F8A4;
	Tue, 14 Jul 2026 09:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784022096; cv=none; b=Na7L2duzUdda78aCBSJd8ZevIykn0bnfqvVXiyFgzd2zgdSzC3G6xfUzhbxvfrDSkvACIQpuCysvB1qt0qMfy2eD8L614oejxOXWAC5kSd+q1soYVwjkivRmoDLixPHUEtnNFZljFCTZhIeSti66Qv8F2ekouJWNc17U80xYfFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784022096; c=relaxed/simple;
	bh=xODBINn5kfZ6vrsenLzTQo0xnlvb3+U0NJLHNp+49w8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SOHirP9F4QuUFz3kQGXVXNJ1Ceun+WJvn9Y8ynPwZ/a38bcz69rIRwei2viLYblyEpr5JHKEEZQYnguvIv9430YIXKl72K7JFTlS74mirCT0WmVUIx0FEyQBPF6e4CvJgnI8YT1XX1FfimGKsSdjiQ0B6r6goGskyfxRi5EB7fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=diac24.net; spf=pass smtp.mailfrom=diac24.net; arc=none smtp.client-ip=185.142.180.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=diac24.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=diac24.net
Received: from nat-wifi0.uniroma3.it ([193.204.167.180] helo=alea)
	by eidolon.nox.tf with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <equinox@diac24.net>)
	id 1wjZdh-000000022Sv-1tiP;
	Tue, 14 Jul 2026 11:41:21 +0200
Received: from equinox by alea with local (Exim 4.99.2)
	(envelope-from <equinox@diac24.net>)
	id 1wjZdK-00000000ZUX-3RNm;
	Tue, 14 Jul 2026 11:40:58 +0200
From: David 'equinox' Lamparter <equinox@diac24.net>
To: Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>
Cc: David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Fernando Fernandez Mancera <fmancera@suse.de>,
	Lorenzo Colitti <lorenzo@google.com>,
	=?UTF-8?q?Maciej=20=C5=BBenczykowski?= <maze@google.com>,
	Patrick Rohr <prohr@google.com>,
	netdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	David 'equinox' Lamparter <equinox@diac24.net>
Subject: [PATCH net-next 2/9] net/ipv6: flatten ip6_route_get_saddr
Date: Tue, 14 Jul 2026 11:40:05 +0200
Message-ID: <20260714094030.136317-3-equinox@diac24.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260714094030.136317-1-equinox@diac24.net>
References: <20260714094030.136317-1-equinox@diac24.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Inline ip6_route_get_saddr()'s functionality in rt6_fill_node(), to
prepare for replacing the former with a dst based function.

NB: the l3mdev handling introduced by 252442f2ae31 "ipv6: fix source
address selection with route leak" is dropped here - the l3mdev ifindex
was a constant 0 on this call site, so that code was in fact dead.

Signed-off-by: David 'equinox' Lamparter <equinox@diac24.net>
---
 net/ipv6/route.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index a1301334da48..704afe2ddea7 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -5850,9 +5850,19 @@ static int rt6_fill_node(struct net *net, struct sk_buff *skb,
 			if (nla_put_u32(skb, RTA_IIF, iif))
 				goto nla_put_failure;
 	} else if (dest) {
-		struct in6_addr saddr_buf;
-		if (ip6_route_get_saddr(net, rt, dest, 0, 0, &saddr_buf) == 0 &&
-		    nla_put_in6_addr(skb, RTA_PREFSRC, &saddr_buf))
+		struct in6_addr saddr_buf, *saddr = NULL;
+
+		if (rt->fib6_prefsrc.plen) {
+			saddr = &rt->fib6_prefsrc.addr;
+		} else {
+			struct net_device *dev = fib6_info_nh_dev(rt);
+
+			if (ipv6_dev_get_saddr(net, dev, dest, 0,
+					       &saddr_buf) == 0)
+				saddr = &saddr_buf;
+		}
+
+		if (saddr && nla_put_in6_addr(skb, RTA_PREFSRC, saddr))
 			goto nla_put_failure;
 	}
 
-- 
2.53.0

