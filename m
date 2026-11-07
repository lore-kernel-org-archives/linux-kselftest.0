Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794022487;
	b=cDXSivWud3eEhyPMv++wO2DXi6DMcAaBrRrrPTa6AfXm9qAPxy0dkTrFkAGBZGljpOfq
	 7O7SqtQv5jH0JE1rZ5wgG+s7v/MZjq+iT6q3KU1yxv86jI43lmBvp885g2GpWBAUcrkOa
	 fWGdJz0ERLrgiZfN/lFQGyUkE+ef+Tvzl6O1tF0CeTmEREDY4b54VBbORKB2r+ova+09P
	 MWGglLM7CVkfAGwqATTma8eITCssdoYJxze/eXCnl9JMAWo5/rTXh+QcFQwu2WrYFfsFE
	 niEdrU0SfqpW00s/3gE3gZssZK8VYRHQlkywIAC7jtTOdrkfZQMougB+qLqyX9H+sYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794022487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=x4zTBAOSJlU8f106RKk3bpv2K/L+ZgYBExNbeipkUpI=;
	b=zkWwcwLG8NO+sar4SJiCWjXgohxvxTAbZpMmIvVemCIIMqouz8TioTNDrMfniG1ZiUpT
	 gxOBVmRa0NIM1E7shz6HbA3tnKgPjTDMnjQ3Sb8+few1xkVpJmxukeBukgRmFAKhr8dLk
	 gVTWR0a1OMyZ/5xhRy7enwcIILWTIuDWvw2DDLEN37TgKJwunCOVvMin8Ar38tnetEcYb
	 MxM2I13KNysTMObh656avp0hEwBO6YWaMio5tcizb6vZhVoD8bi+30nKoQBwepKcgQ3RD
	 DuYqpeOAQ5tBGR7ZRTYfItSL0ezA7l0+kwSsUXzWvNsfZkHrKUQX74ipCXWbBNVX+7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=GIe+ZKoW;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFE1606A32C
	for <linux-kselftest@vger.kernel.org>; Sat,  7 Nov 2026 03:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CFE1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=GIe+ZKoW
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c423b145922so177655066b.3
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Nov 2026 19:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794022485; x=1794627285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x4zTBAOSJlU8f106RKk3bpv2K/L+ZgYBExNbeipkUpI=;
        b=GIe+ZKoW+pY5Fl7fRKi2DeDJ5Qd5FjGaaUW23q/i6MvM4UFc/J0l7jS5zsjSA4ZRxj
         r6pa4/VmNL+ASX+wt8RkjKMbgD4AleZmF4shbhyaUu6J/yEbfU3gpkM9UDZCBmABAm7k
         hIu2H6X8DvuG2YzUBsOyN+IcVqUlaVVw/FpnqNNLKwbVfyNlRV0MoM4IgrJnhdunFLYv
         gIan4/vx0SSq/FbCC4OmZw9l6xwUBLa9I6SULVV+kMzUrNrkMJKSY7+IEue2duvueLN1
         jH/6HLvXOqGgB/K9Cy+yZ2LN8sVQwYVnB4lHkTjXaMC5uzulWt+HinTK7nADVY5mR1Dz
         WUog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794022485; x=1794627285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x4zTBAOSJlU8f106RKk3bpv2K/L+ZgYBExNbeipkUpI=;
        b=Cst+XrWsc3F6cnYvJt37MUyqTsR9gKcHURZnyV0BBEg/PoRZXaYcULZY5R8M0ztNax
         RlhksOYbp+nTQlik7EZA14jkEIPuPcWq+SrOVcWulHVCO/ndxGKL4DmFmm8SO8ceRCbt
         0ZIW88kWe4sKIhRUvN1IZP8F0ScoZFdmMP6NN4JuMvysViXycevPoNvRSLdfSWbepNBu
         6WE5UseLD79Ho8/dCk6zsH8+XCm+hFd7VEC6yoEptZR9hBNjH/W0WlfmenJ6znNSQMFu
         +l4j96lKLPX58rISpBIg7EG4vMvlylW5W60r4/5VFFMGi73APSEFjnJBY4EMCZJ0CN2z
         hEmA==
X-Forwarded-Encrypted: i=1; AL+hErHerUxq9X3bXD8ySxoBhjYn/H74AAiKPk2joBe0AACk5danvr13C7HHo7nXX5++ghJJ1L8mqhjwlhoYs6FC6hw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hcpTQ1ho0TwOmVgHrQmm5vhHkzZ8/ekFH9chJZ1w38blYlD/E
	tI5aFJVFnvsoHPG6p2NZ27+kEX/UiLkWL5Vv67EbAqyySYWNglFKhgvkWDU6hX5y7dE=
X-Gm-Gg: AYBFou3rN6onPKd9hzlA4LKjJI9heet7ZCYFgLAq8PTXG0zqmXf3tPGVo8UTz5oabVV
	zYkA1X9lN6C8d43Th6ctxTlGThL/BdN/ZOWQ1X5u3/ILj1E7MRzHTlXoaoIhE9JFbyu00JxRYUW
	W++q6C+mDFm0RdCqqG7IU1e0HxrBLzbJMUGT4tV+SIQUkDsDIP0at9tH7YP1lYC4VD339GEUaR6
	rYEdt/PYNXtE5IMWZVJejp+VFv/3buqnRfhQTsj760EIq1WYqWqJyrthW6bAbNr3SkpiKVj2uoR
	OhWH1et9cCv6gAsVxjFkygey5GLG92+9wDFRDMMNgCKrCdIwhNpNMD3ot7SZ6T0xy/xjzlG4lbD
	6IU+NYESAWf0DqN6b80KckCXY+7PENY2Q5cSlrEJr3A02CjOIpQILkDKWR0UBHNOvTwMsGZtMjw
	LNynCq+SMAaVR0/aoqGwlukl+b1JUhVOfah1NLC8FZMh6TlCHnV5f3Jf7joRCJfiIJwBKQ7KMcp
	Dvfj9JCUSKJ0r6XeLKEaI8YESAmVxhhRuyeKQ1S/wpCJ+UWLrAXzMFqseo+SafrImUCHclS3TY4
	IP818oD/FAJqyJUrA76I3UF/ph1fmMwRoa/pHiesTQNnMrkyKfLZVc9mfbK5EHwsMGVU8wJut2m
	N0C8fuS8W
X-Received: by 2002:a17:907:3e8d:b0:c37:c0dd:6642 with SMTP id a640c23a62f3a-c4d34c6d09emr361258566b.37.1794022484771;
        Fri, 06 Nov 2026 19:34:44 -0800 (PST)
Received: from L9JK9NPFH9.lan ([104.28.20.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d3562e00dsm121104166b.21.2026.11.06.19.34.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 19:34:43 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: netdev@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Simon Horman <horms@kernel.org>,
	David Keogh <dkeogh@amazon.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	David Woodhouse <dwmw2@infradead.org>,
	Dragos Tatulea <dtatulea@nvidia.com>,
	Nimrod Oren <noren@nvidia.com>,
	Alasdair McWilliam <alasdair@mcwilliam.dev>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Magnus Karlsson <magnus.karlsson@intel.com>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Alexei Starovoitov <ast@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Breno Leitao <leitao@debian.org>,
	=?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>,
	Danielle Ratson <danieller@nvidia.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	bpf@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kernel-team@cloudflare.com,
	nh-open-source@amazon.com,
	Tianyi Gao <tianyi@cloudflare.com>
Subject: [PATCH net-next 3/8] rtnetlink: add IFLA_TX_EXTRA_HEADROOM
Date: Sat,  7 Nov 2026 03:34:22 +0000
Message-ID: <e515d1a0d46831ca06f45659caa8c7c5668e20c9.1794020868.git.tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1794020868.git.tianyi@cloudflare.com>
References: <cover.1794020868.git.tianyi@cloudflare.com>
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

From: David Keogh <dkeogh@amazon.com>

Expose tx_extra_headroom through a new IFLA_TX_EXTRA_HEADROOM u32
attribute. The value is bounded to NETDEV_TX_EXTRA_HEADROOM_MAX
(512 bytes) by the netlink policy, which is plenty for several layers
of encapsulation while keeping the growth of per-packet allocations
modest.

The attribute can be given when creating a link and when changing one.
It is included in link dumps and a change triggers the usual link
notification when the device is up. Zero is the default and resets the
reservation.

IFLA_HEADROOM keeps reporting needed_headroom, the driver's own
requirement, so userspace can tell the two apart.

The setting applies to the device the packet is allocated for, that is
the device selected by the route, and is not inherited by stacked
devices. Document that together with the allocation-only semantics in
netdevices.rst and add the attribute to the rt-link spec.

Signed-off-by: David Keogh <dkeogh@amazon.com>
[tianyi: make IFLA_TX_EXTRA_HEADROOM a u32, fix the docs]
Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
IFLA_TX_EXTRA_HEADROOM is a u32 attribute, although the maximum value
(NETDEV_TX_EXTRA_HEADROOM_MAX) is 512.
Documentation/userspace-api/netlink/specs.rst says to avoid types
smaller than 32 bits. Netlink aligns each attribute to 4 bytes, so a
smaller type does not save memory. The dev->tx_extra_headroom field
stays unsigned short. IFLA_GSO_MAX_SEGS and the u16 dev->gso_max_segs
do the same.
---
 Documentation/netlink/specs/rt-link.yaml | 12 ++++++++
 Documentation/networking/netdevices.rst  | 35 ++++++++++++++++++++++++
 include/uapi/linux/if_link.h             |  1 +
 net/core/rtnetlink.c                     | 19 ++++++++++++-
 4 files changed, 66 insertions(+), 1 deletion(-)

diff --git a/Documentation/netlink/specs/rt-link.yaml b/Documentation/netlink/specs/rt-link.yaml
index 81b58633911d..fb76410abd5b 100644
--- a/Documentation/netlink/specs/rt-link.yaml
+++ b/Documentation/netlink/specs/rt-link.yaml
@@ -1098,6 +1098,16 @@ attribute-sets:
         name: pacing-offload
         type: u32
         doc: Enable EDT pacing offload (0 - disabled, 1 - enabled).
+      -
+        name: tx-extra-headroom
+        type: u32
+        doc: |
+          Additional headroom, in bytes, reserved on top of the driver's
+          requirement when the UDP, raw, AF_PACKET and AF_XDP copy mode transmit
+          paths allocate a packet for this device. TCP and forwarded packets are
+          not covered. Zero (the default) disables the extra reservation.
+        checks:
+          max: 512
   -
     name: prop-list-link-attrs
     subset-of: link-attrs
@@ -2471,6 +2481,7 @@ operations:
             - gso-ipv4-max-size
             - gro-ipv4-max-size
             - af-spec
+            - tx-extra-headroom
     -
       name: newlink-ntf
       doc: Notify that a link has been created
@@ -2567,6 +2578,7 @@ operations:
             - gso-ipv4-max-size
             - gro-ipv4-max-size
             - pacing-offload
+            - tx-extra-headroom
       dump:
         request:
           value: 18
diff --git a/Documentation/networking/netdevices.rst b/Documentation/networking/netdevices.rst
index 6a87f09e7015..da3556e56cc2 100644
--- a/Documentation/networking/netdevices.rst
+++ b/Documentation/networking/netdevices.rst
@@ -441,6 +441,41 @@ from a notifier.
 
 Drivers **must not** generate nested notifications of the ops-locked types.
 
+TX headroom reservation
+=======================
+
+``needed_headroom`` is the driver's own additional header-space requirement.
+It is written by the driver, or by a stacked device inheriting the value of
+the device below it, and is reported read-only through ``IFLA_HEADROOM``.
+
+``tx_extra_headroom`` is a separate reservation configured by the
+administrator through the ``IFLA_TX_EXTRA_HEADROOM`` rtnetlink attribute, a
+byte count from 0 to 512 that defaults to 0. It can be supplied when a link
+is created or changed, is reported in link dumps and change notifications,
+and setting it back to 0 removes it.
+
+The extra reservation is only applied when the stack allocates a locally
+generated packet for transmission through the device. ``LL_ALLOC_SPACE()``
+adds ``tx_extra_headroom`` before ``LL_RESERVED_SPACE()`` aligns the sum to
+``HH_DATA_MOD``, and is used by the UDP, raw and AF_PACKET transmit paths.
+AF_XDP copy mode adds it through ``netdev_tx_alloc_headroom()``. Its purpose
+is to give programs attached at TC egress room to push additional headers
+without having to reallocate the packet first.
+
+The setting is deliberately not part of ``LL_RESERVED_SPACE()``, which
+remains the threshold for deciding whether an already existing packet must
+be expanded. Packets that reach the device with less than the extra
+reservation, such as forwarded packets or TCP segments, are therefore not
+reallocated because of it. Consumers must keep their usual headroom and
+clone checks.
+
+The setting is not inherited through stacked devices. Packets are allocated
+against the device selected by the route, so configure it on the VLAN,
+bond or bridge device the route points at rather than on the device
+beneath it. It survives link down/up and network namespace moves and is
+independent of any TC or BPF attachment. It does not change the MTU or
+the bytes on the wire.
+
 NETDEV_INTERNAL symbol namespace
 ================================
 
diff --git a/include/uapi/linux/if_link.h b/include/uapi/linux/if_link.h
index 245b36204525..fb3a6b382a78 100644
--- a/include/uapi/linux/if_link.h
+++ b/include/uapi/linux/if_link.h
@@ -382,6 +382,7 @@ enum {
 	IFLA_HEADROOM,
 	IFLA_TAILROOM,
 	IFLA_PACING_OFFLOAD,
+	IFLA_TX_EXTRA_HEADROOM,
 	__IFLA_MAX
 };
 
diff --git a/net/core/rtnetlink.c b/net/core/rtnetlink.c
index e141340172ce..16ee1a874107 100644
--- a/net/core/rtnetlink.c
+++ b/net/core/rtnetlink.c
@@ -1409,6 +1409,7 @@ static noinline size_t if_nlmsg_size(const struct net_device *dev,
 	       + nla_total_size(4)  /* IFLA_PACING_OFFLOAD */
 	       + nla_total_size(2)  /* IFLA_HEADROOM */
 	       + nla_total_size(2)  /* IFLA_TAILROOM */
+	       + nla_total_size(4)  /* IFLA_TX_EXTRA_HEADROOM */
 	       + rtnl_dev_parent_size(dev)
 	       + 0;
 
@@ -2206,7 +2207,9 @@ static int rtnl_fill_ifinfo(struct sk_buff *skb,
 	    nla_put_u16(skb, IFLA_HEADROOM,
 			READ_ONCE(dev->needed_headroom)) ||
 	    nla_put_u16(skb, IFLA_TAILROOM,
-			READ_ONCE(dev->needed_tailroom)))
+			READ_ONCE(dev->needed_tailroom)) ||
+	    nla_put_u32(skb, IFLA_TX_EXTRA_HEADROOM,
+			READ_ONCE(dev->tx_extra_headroom)))
 		goto nla_put_failure;
 
 	if (rtnl_fill_proto_down(skb, dev))
@@ -2367,6 +2370,8 @@ static const struct nla_policy ifla_policy[IFLA_MAX+1] = {
 	[IFLA_HEADROOM]		= { .type = NLA_REJECT },
 	[IFLA_TAILROOM]		= { .type = NLA_REJECT },
 	[IFLA_PACING_OFFLOAD]	= NLA_POLICY_MAX(NLA_U32, 1),
+	[IFLA_TX_EXTRA_HEADROOM] =
+		NLA_POLICY_MAX(NLA_U32, NETDEV_TX_EXTRA_HEADROOM_MAX),
 };
 
 static const struct nla_policy ifla_info_policy[IFLA_INFO_MAX+1] = {
@@ -3374,6 +3379,15 @@ static int do_setlink(const struct sk_buff *skb, struct net_device *dev,
 		}
 	}
 
+	if (tb[IFLA_TX_EXTRA_HEADROOM]) {
+		u32 val = nla_get_u32(tb[IFLA_TX_EXTRA_HEADROOM]);
+
+		if (dev->tx_extra_headroom != val) {
+			WRITE_ONCE(dev->tx_extra_headroom, val);
+			status |= DO_SETLINK_NOTIFY;
+		}
+	}
+
 	if (tb[IFLA_OPERSTATE])
 		set_operstate(dev, nla_get_u8(tb[IFLA_OPERSTATE]));
 
@@ -3865,6 +3879,9 @@ struct net_device *rtnl_create_link(struct net *net, const char *ifname,
 		netif_set_gso_ipv4_max_size(dev, nla_get_u32(tb[IFLA_GSO_IPV4_MAX_SIZE]));
 	if (tb[IFLA_GRO_IPV4_MAX_SIZE])
 		netif_set_gro_ipv4_max_size(dev, nla_get_u32(tb[IFLA_GRO_IPV4_MAX_SIZE]));
+	if (tb[IFLA_TX_EXTRA_HEADROOM])
+		dev->tx_extra_headroom =
+			nla_get_u32(tb[IFLA_TX_EXTRA_HEADROOM]);
 
 	return dev;
 }
-- 
2.56.0

