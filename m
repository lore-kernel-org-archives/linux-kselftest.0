Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EBF2FDC28
	for <linux-kselftest@vger.kernel.org>; Sat,  8 Aug 2026 00:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786150634; cv=none; b=r+43utcw66KiCp5nHkel9gCIW2TvgrkGVeENTMxmELOxvZErpZOVLie5CpXqg7wBPegWyfymoKOHCYHOp6J8zo3ZJKeNmOIDLh45Qq5ub0r2gu6aOfBZGshxSEVszy8hB6FH+grurvd/FV4RRfeE4AMJDIq1Tf7z2loyrro151A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786150634; c=relaxed/simple;
	bh=LptUurOI+OXACGzviKpmnx9OsYV5snEdOTU9fBVihMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kOj8LxRg+w9TxqQDT4kVslWhwJPk0Cppf2sc0qfAjc2dalq4Vs5+DjsjGx/mqLMYOe3z3Gd9CwV+UytV7c8TW1YOSjfHzwKsWZV2Qu+p0Ybp97eCK4UcCq+pfUwhrkQoaexA28uMLJeHd62jnGkgjQ7LoXFbv0HG4Ih+TUscqhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eyb/d6aS; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eyb/d6aS"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38e69bdb0fcso102982a91.1
        for <linux-kselftest@vger.kernel.org>; Fri, 07 Aug 2026 17:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786150632; x=1786755432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1EE695Rdk07hMzYmc0ZAJFaWL6Cw+K0q24XElbn1AAE=;
        b=Eyb/d6aSA3WBRlA9fYoSr5aWS9jh2mDRwK7fIH913cZRfNbX3+g3fOFuGZ5ik/gXc4
         HAnYUgARUufGej8vCWcV086d1Dsiyr5I2nO9qJKIOImy9Rp7/MvszERPdgHDuSVt6CKU
         1EU58W7LNf04LXef/dVkex2NxxZRxXujsLZaVhdnxI2NSDJUq+7xfnMHLKS417ikFcFL
         DNpGe6lL6iisyWtVsSCxQeUDqvSP7yJvw4LRNv+9WXuRKIi5s3sStniItcgbgKQeTWrs
         ikpmEy0UjnCuKpS1szNxUhh06OqUajqk+z5UbnXPVdlmj9Lg/JA5e5pseX7eyK4atvQe
         mHdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786150632; x=1786755432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1EE695Rdk07hMzYmc0ZAJFaWL6Cw+K0q24XElbn1AAE=;
        b=GVI4MCZESERdCgEVQryvgRaRhrp6dpNrS5JvWH/pWSG8YyZM+M6MHDri4ER9uX8SOb
         pKJ9voTK7Ez2KFAkAu4oUOvufZWZubKkMxIGdCrgFhGEgu4yp7UkzAnoNp+P+pK8rmtc
         ptt/+R1svgbGWqfa1BGFnO4//0JRMdciSC64HyFBRQseApnLH21iU9bAhRceOxfj95CK
         1sDpPHC6CD0G5NXC2vzb/4B+vGFIbiRXQCzu5OYxOceLrIJPKwqNQBNjMhc0TPJwPC6d
         Qj8+8dZydVHHsHgHv2YlFrFAu64D9eS5gtNGzZgTDqQIfli5OqS1bWbPmIYWYo1CAzwD
         tmMA==
X-Forwarded-Encrypted: i=1; AHgh+Ro5q/71WXeBdrpDOU6T5AgRjOYpdmTGVOaObhNPj0ZvrgnWacBUXgYqA3TOyJvPeQ7OxyWXjDPsFDI4YeSDg6g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBS0Dwj0I3v7DlOzqLXvZKSqz3CpS2ujr1N8USltZz8eAFduoj
	/S2X0cFgNjQx3tLai0CySNk1FdbmxiLD8NFViEYYpsSMb3GtJQsfsFWA
X-Gm-Gg: AR+sD102PCv6Btyhe5aPPTun0GV3wixky9td/6c1lEOqISZVCPKrk+YNGt1Rldbg2w9
	oDozI23vBc32EHuqOGiRmhexHMJipu8WMQG99p6aX3n0U1nyLbRN8zlIagnDau9rLSqMd5cpfJc
	imLdjhSoRiphVVLWV/ESidopzYGkFjuPxxeaAx9melMBRIrZ5db9JgdTSzs7KWS3uEzN1pyu7D+
	heUmTZeYEktwZ8qrUMUo1m/aWnSCbAM8qqRJ/8UWY79eSC4ZmM4ZZxnxH8wHCtDQ06DqFd2bK66
	GMmfsb5H9/PIK9nRBqj6T1+Diy0ywC4MzDq9szq7TMgyb1DpCa8E2Uuah6thtlDKW4yYMBzQqRb
	CjgimWW7c3E1+1aNp58xpTa/Pb52ys0CQo3h0pipPL/NBn1EpGZaHflWj1NlXKolox7ziYxWUGt
	ZcWIDRkMt+9uijJvlL6rhfP3P5GBTj0lYk0zlG2ywIN+bhzcl3nyiw3C2wMGTapJ2NnqX2PMctm
	acFzezcD9ojF8SuUoXEW7TxqcSEbN9vK0waHSPYCn58+iSg7J0xv2Qzdi+rfA==
X-Received: by 2002:a17:90b:2590:b0:37d:f983:7b5 with SMTP id 98e67ed59e1d1-3903c56fff5mr27286985a91.9.1786150632199;
        Fri, 07 Aug 2026 17:57:12 -0700 (PDT)
Received: from m-upc-A520M-HDV.flets-east.jp ([2400:2410:3f60:500:d7e9:6449:7464:1dfa])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925fc6c13asm4205182a91.2.2026.08.07.17.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 17:57:11 -0700 (PDT)
Sender: Yuyang Huang <uyoko90@gmail.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Chris J Arges <carges@cloudflare.com>,
	Daniel Zahka <daniel.zahka@gmail.com>,
	David Ahern <dsahern@kernel.org>,
	David Wei <dw@davidwei.uk>,
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Willem de Bruijn <willemb@google.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v6 05/10] ipv6: expose the route deletion reason in RTM_DELROUTE
Date: Sat,  8 Aug 2026 09:56:37 +0900
Message-ID: <20260808005642.26901-6-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260808005642.26901-1-sigefriedhyy@gmail.com>
References: <20260808005642.26901-1-sigefriedhyy@gmail.com>
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
Reviewed-by: Ido Schimmel <idosch@nvidia.com>
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

