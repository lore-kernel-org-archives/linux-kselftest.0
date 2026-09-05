Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8E43DB97A
	for <linux-kselftest@vger.kernel.org>; Sat,  5 Sep 2026 09:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788601191; cv=none; b=bfIDqKRS8RtO9np9Oxw/8YkF6kMXDR9cz+x3gHrnpiJM50QnGx9RL8sDXVbBkSiC6NacHKwiAu3KdvJSieagHlsISfCOzIDwBWp3plfb6N0780RD/uUVRiWPnsd/33XMuz07rM2NqwNat4RZFBixZeQ3FApjkxrWqTm+54Uu8bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788601191; c=relaxed/simple;
	bh=2zQvRUscIgNiPZoEjC1Z5mtgLCeG0uKE2CLDirOMMRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=royML9POVbvGi2eIYh2SShfWUMdh6tG4+zqqeckcKU1o0jzdPpFIhmlsL62mBETaEvUko112do1gyYk2JdVJyKY3iv8AOLOxjPf4e1djMbUfuxR1bpi9LxCbXeHdZgXXo9u6i1b8wn2XESnw/lY84Evqk1JOiMtVyd2IRLmdhSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z5uRxfuQ; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z5uRxfuQ"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d8fd3b729dso16001345ad.1
        for <linux-kselftest@vger.kernel.org>; Sat, 05 Sep 2026 02:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601189; x=1789205989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=263Ot5CK8k8W50+c/iZQZai2Z4LPXqFiKiK4/FLJICs=;
        b=Z5uRxfuQPO7vRR3AcaQhSTSINViylUkUzrar1hGkf40UvxNae79gyGUbaTUdtR2WRs
         hCkeoMYRG+rJqorEjyXgkxqIIvYWvIbnXOGs2z5UoyByFdfEFpu3HNkNe6UvaWh6fW24
         +usJubVDvODNRX+JmqCexzDZ02SD+fVQcBxkq/8okuiZYPJzARASw+M3Ir+nYZOhcVp/
         QxHwVdP0+dGSx1K5gXc2m3kxX2MrifJkbGsJG9VXYI31O6ZHMwEZ8xtebuLMz5VLyUQP
         TaLn6t9CeJh6rZ6mjjKVgMdNDoYDsKJ/iF691oDZVKykHRkQiOi3fxpwo+q09dviCn1y
         sqsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601189; x=1789205989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=263Ot5CK8k8W50+c/iZQZai2Z4LPXqFiKiK4/FLJICs=;
        b=H9o5pxtkSQxC37qrRfrOJHT9upOzaOb7B1jVQQnJia01gKpBarJCm1KYImY+x8ce82
         rxL/RwLd+f0n5KIBTydcSSb6MVUC0M0/iqnwt8X/Ao+OPYfU436+E68sVr5RuQaOs5du
         Z9oFO1YBGRMeKeqVc/zpky3tl+6dMvif7789SNTUiDoG/oF7nY4zsqopmTf/a/wv7yiL
         1py0r6ZO13JoQXy0Yy9cJvum5D+OxFny5HdiFkXgHc+S2edANW5UbvNY/nMNYgBdi56k
         W4MJEe0cdQ+139cZ8yEloLJKbxHsF4SXDETBo/6X7GTXH2XDINm0/JN6u4ELkNZMm+GW
         MzRg==
X-Forwarded-Encrypted: i=1; AKwUvBxofUHOxQzRM8PkQ7/yucSnbUS3rWjYHXnQLZ5Q/0DHGQMZriZFEm5QYkPQZu2MCl5VP6aX6VtlXpa3UAw6jOU=@vger.kernel.org
X-Gm-Message-State: AFuF++nOBHNqb7vyBKfi8UnF3ZnnSnnAwdaXtOUZeEp84WwiRPFKgo3r
	4bivAqe+ZxZnWAcSQQETs4jPjDoaVwjk2z4ucZ0lGcWRgmcBaUF3gMyc
X-Gm-Gg: AYBFou3FHntIw3Aezbe962j1uI5qoEKnBXTvxUN3yI/Ba0sjZ3vD9cylT8BDV6mPle4
	cYw1XrSF4ACXD9qE5jz9fLYG9W/ybeAQXp/wjj9tFuXBqrp0x4yeu88QkaNhfwxwkBTEKteIT+h
	uvkW2PMs0iHrkk+JWBkpGsKJGtYrK4ovC1XxS5jsshZMY9AgG2P2DkLr3d5ihK6ztAftogyryXR
	wFd7BGp+tzzrYkmr/7iBicY4ukxrNIsZ91Xu3+hRU7hhUltEBfnVZ80z7GIoZ5NMYkxT1HUCXiJ
	HjN1BZu7y5SukHoQ1fRz/qsuLCYgixtJ5e9RLcWC+A/N74aUgkE8Rzw/JpNRPhFk6f4xniOVt64
	oz2lGYWca0KyIduIIm/XskHboFciByS83OVo87Zw8sv8QdVJ6c/VMer1mzolco3AVhabpZyT9z8
	41X/QHA6XEl5X95iSmtUGgSFHfHiWTpRHhjkuLOu2sJEF5NOFlAk79lulYLXurgWl4ZRt7ZmchM
	sDoQzd/fm6v5b4kom95YbG9gm/FIWlXQOz2Rg==
X-Received: by 2002:a17:903:8c3:b0:2d6:fec3:bd57 with SMTP id d9443c01a7336-2db125c2f3cmr189302985ad.14.1788601189102;
        Sat, 05 Sep 2026 02:39:49 -0700 (PDT)
Received: from m-upc-A520M-HDV.lan ([2400:2410:3f60:500:dbc1:ef89:4dd5:b812])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1495a0c0sm20393745ad.17.2026.09.05.02.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 02:39:48 -0700 (PDT)
Sender: Yuyang Huang <uyoko90@gmail.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Nikolaos Gkarlis <nickgarlis@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf.kernel@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next 2/3] netlink: specs: rt-addr: document AF_PACKET multicast dumps
Date: Sat,  5 Sep 2026 18:39:31 +0900
Message-ID: <20260905093932.43726-3-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260905093932.43726-1-sigefriedhyy@gmail.com>
References: <20260905093932.43726-1-sigefriedhyy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mention that ifa-family AF_PACKET dumps link-layer multicast addresses
and what the permanent flag means for them.

Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
---
 Documentation/netlink/specs/rt-addr.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/netlink/specs/rt-addr.yaml b/Documentation/netlink/specs/rt-addr.yaml
index 0ecbd24c890c..2a2310cb0df0 100644
--- a/Documentation/netlink/specs/rt-addr.yaml
+++ b/Documentation/netlink/specs/rt-addr.yaml
@@ -168,7 +168,12 @@ operations:
           attributes: *ifaddr-all
     -
       name: getmulticast
-      doc: Get / dump IPv4/IPv6 multicast addresses.
+      doc: |
+        Get / dump multicast addresses. ifa-family selects the address
+        family: AF_INET or AF_INET6 for the IP multicast groups joined on
+        a device, AF_PACKET for the link-layer multicast addresses in the
+        device filter. Link-layer entries added with SIOCADDMULTI are
+        reported with the permanent flag set.
       attribute-set: addr-attrs
       fixed-header: ifaddrmsg
       do:
-- 
2.43.0

