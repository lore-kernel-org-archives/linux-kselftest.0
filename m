Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9713CF030
	for <linux-kselftest@vger.kernel.org>; Wed,  7 Oct 2026 11:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791374354; cv=none; b=gyKXUalC4TBQvp9B08s6sOUFkBZOVNLKHH2GUOPRmCIeFEHwrX5mldTXSruCKs8UirH2oOMpeI9B/yMYgmjlz7LfQHc0ERjzEHjH3sFte4khZ7fl8bJwyCfn6L2y22xGtrEa0CYSZbQXC1IWyCgP6cfHKsUXPVMfFgMRSSecoyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791374354; c=relaxed/simple;
	bh=USMYquWjDSlhNyRAuuQZlk822YJxe0sgKgXXZbTaiuM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MYy4TTURT9lKW4xDFr2Wx1W4OD1u65OOJanUk3o0D4O9CEmpe5/LkS4jHgRGGM29uZw+7EZqr0ipYRx0D63elFYlAC/H8hhJ4CqJYyRbZSuhmpeF+0z8AVqfqGrXALwFIUKbS4yfFEwXcmdDNlENoxXFN+3IQSFnhyEIr6kdJmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ir3Y+PfV; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ir3Y+PfV"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3a7fecf8440so1025085a91.1
        for <linux-kselftest@vger.kernel.org>; Wed, 07 Oct 2026 04:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791374344; x=1791979144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RNJQaLaUPhfizQ3mt3ZckrLpssIZdRd+0u34vIFrxiI=;
        b=ir3Y+PfVvkQz2sPu/v4KfKcdRpBs11xY/pwU06eR/s6le1VMzV77ABFUFCMkVmKyT/
         rQ34l2rcnM7aBPCum6XHA0nVIFVdIPaeou9V9SC0axANiq1GykxCW/L69GdQKqf6bi9F
         JC3qwez6aTH8xl6TpJuvhUaxtVuxvFuWQkjhrjZGJuGdNsE0jBygLbmA66q7iqhG/jZi
         UQN6CZ4+Wu8FLBT1bqkwF4jpoJ5rBQS/8pPyf4StHg5bYzAt0FAwESvWlH65Pq1BTLCh
         zUJVyNviNIP2hC+TaJNArB0RKOpqcA/bkIG+k4JZOrT6GWjfJM5F2ramV0AzkQN+kHH4
         irHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791374344; x=1791979144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RNJQaLaUPhfizQ3mt3ZckrLpssIZdRd+0u34vIFrxiI=;
        b=WQ2OzMPI5GtbTISp2ar9eDZSQgnUsqnIFpjLyixvXBIlRymx2a8RywEwoQZODqiiLH
         BXMmUhbHNK/XcKdE12aqNWfDKmllbMwWzugHapf98BqLMN0IBbeUwaCtFkiwi4hYpBuK
         q9LeTo3COGKayGbRLzvQ82YylRCI8bj+kxdZcBcr788zMIiG+pXt0FpjyfOhqV9dhn3t
         +VFKTFuWlgs5KeXPDKQ/KwQdoZ1p7geRK1ZOJ16EeX8uWJLSpyVxmW26dPYnEqlurVdD
         CJJEGOxCxyfU7ItjuWuya7i4/wwPiIc46OCQFhYTlG5bQxX/DusWWY1tyJGAm5jNgF79
         +28g==
X-Forwarded-Encrypted: i=1; AKwUvBw6oDOl+GQsb5reyXq+/bVgBFfu1eP3bERCsi5v8OyUxvDslNZ1EMI9QbMCXCF6c+HrYbwdoGhtIkZSwy2z4e4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIc99bjKAaP1gQM+7EXbvJ6urV2NoIVhbt5lEFI0nlExLeDE6+R
	QpwkafSEM8z/79wgj1EbZXkptyhS8+z8JhhVrZh+Uf1/qMbnjhF6rdtA
X-Gm-Gg: AYBFou1zZZ9lsC7ClDRNwWNBLPDwVWRMPtwRDrIg0sjeqIw+EeQxYz1YnIx4Ryx/90/
	RyizSb9lk7q6OZal4ss19HJMVyUzhpRWoY6NDhhRrAklmsMT9JqZlbwSa1Yv+8YDJRbJfQ8mtty
	LVx04oqgdRrEcX6iqexYcA352L3NksRAiT0CU2eppeVmjZRXqZGdPywQWbIpzCBVd2syNveyazn
	4deGj8M1X+7G24g4He8zY8eTg2plzbOq2i0v9OqyQSW2uXtXrOh3k8NO+hKCrnnegfT66pxJkOW
	ilRPHebkKb4umPQzpGAaWK8wej+o9KjezLVhj7/f+gAne+Zx86jYwvD1mjsBWhZwTM4bn3wBLe8
	DxUnlCVlvXwg5xhKLa/SwAebOMLoijtCRTQSGqwma8H4qw8YUhtKcOgwkuTy55zW4EQuYHbdIrP
	dHlkbSKXFm1mBn6m3w2/1oZ5To6MOvI6gcvsZoe0Z3A809sqJLYMjrdbzPpqKXU3/AT/O3InLQT
	orrUpoPwi2DX5StIIe9qmvBOgJntxBk07JNUxUX/rnqHA3+bGmHs0qX5nuvM0HOb5YTv8FbjLue
X-Received: by 2002:a17:90b:1dc2:b0:3a8:545f:520d with SMTP id 98e67ed59e1d1-3a8a1ae940cmr1539624a91.32.1791374343687;
        Wed, 07 Oct 2026 04:59:03 -0700 (PDT)
Received: from m-upc-A520M-HDV.lan (oki-109-236-14-10.jptransit.net. [109.236.14.10])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8987b09e2sm4456582a91.2.2026.10.07.04.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:59:03 -0700 (PDT)
Sender: Yuyang Huang <uyoko90@gmail.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: Ajay Singh <ajay.kathat@microchip.com>,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	"David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	Kees Cook <kees@kernel.org>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	Nikolaos Gkarlis <nickgarlis@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf.kernel@gmail.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Willem de Bruijn <willemb@google.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v10 5/6] netlink: specs: rt-addr: document AF_PACKET multicast dumps
Date: Wed,  7 Oct 2026 20:58:20 +0900
Message-ID: <20261007115821.11332-6-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007115821.11332-1-sigefriedhyy@gmail.com>
References: <20261007115821.11332-1-sigefriedhyy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the global flag, list the attributes the AF_PACKET dump uses and
describe how ifa-family selects IPv4, IPv6 or link-layer output for
RTM_GETMULTICAST.

Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
Reviewed-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
---
 Documentation/netlink/specs/rt-addr.yaml | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/Documentation/netlink/specs/rt-addr.yaml b/Documentation/netlink/specs/rt-addr.yaml
index 17ead22034515..cccfccf49cc11 100644
--- a/Documentation/netlink/specs/rt-addr.yaml
+++ b/Documentation/netlink/specs/rt-addr.yaml
@@ -77,6 +77,8 @@ definitions:
         name: mcautojoin
       -
         name: stable-privacy
+      -
+        name: global
 
 attribute-sets:
   -
@@ -168,7 +170,17 @@ operations:
           attributes: *ifaddr-all
     -
       name: getmulticast
-      doc: Get / dump IPv4/IPv6 multicast addresses.
+      doc: |
+        Get / dump multicast addresses. ifa-family must select the address
+        family: AF_INET or AF_INET6 for the IP multicast groups joined on
+        a device, AF_PACKET for the link-layer multicast addresses in the
+        device filter. Link-layer entries added explicitly, e.g. with
+        SIOCADDMULTI or "bridge fdb add ... self", rather than by a
+        protocol join are reported with the global flag set. For AF_PACKET
+        a non-zero ifa-index restricts the dump to that device and
+        ifa-prefixlen, ifa-flags and ifa-scope must be zero, AF_INET and
+        AF_INET6 apply this and target-netnsid with NETLINK_GET_STRICT_CHK
+        only.
       attribute-set: addr-attrs
       fixed-header: ifaddrmsg
       do:
@@ -181,10 +193,13 @@ operations:
             - multicast
             - mc-users
             - cacheinfo
+            - flags
+            - target-netnsid
       dump:
         request:
           value: 58
-          attributes: []
+          attributes:
+            - target-netnsid
         reply:
           value: 58
           attributes: *mcaddr-attrs
-- 
2.43.0

