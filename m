Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793917274;
	b=PutBEuEHBGhntwa3CdnLo9Rdx8XOQ3c4sYrF2JGsvVOpDUMKIJK60c3/U/xlurz1j6z6
	 AiQaN9d6oBULLkBky124+mOL/MBBoYAUMBak+ETEfzY/G+VNKJnLZDJo36h7OE8/tCRUs
	 ZcYvISP4uvREb7NwoD90BI2lBGArKnzU9c8Nb1deFoBZ9J20bw6NVEmCbpzjNlaUtieY7
	 49DopQDabebPV3fcclNnL3ZmoU2WAN2Z7tClyIA7ehnUEZbS6QBV3zw2DWkroMBE5sqg7
	 dbpuXlRhLNDP0tfDlG7wgMt8OaxlafR5PkI4Lo4LNqPSPXX6egzgQVCcXzmjWw/sNAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793917274;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=6YYrjHk+nB8Qt9ThWiyhnTgXhSxUl+9UI8ospp2Q6VI=;
	b=3SaGESUUk3IRSmgRsQBihSLz07CpahYsnvVsSF4KzUbfiZooJU6fRhj9BmdOzzJ7hrXV
	 pKtJV+1rXzeFCSHKvAAfuwdDL2T03dqA8Ptqv4HPaUlw3LY/Gv+sjJhoDiPNsuHD6nP0s
	 m2d3njIZgFXm4gl7u2VFneR0Sy3yQUvVlGIZsh0oEFv6i4qXpTpbo4YLoN9JxmGNG/0vI
	 BJCcJQszNAE3Rrrg5lImsI8TXODRAeypwtSph6+XcVciomqwcoXDRYBvIvMIevN+JmJ9T
	 VxeYsZWSVFtyyn6xB7fISTz1EOKaZNe3MrZGAvjhplRq4Q1GARqtBCSqHXRkrNkWGGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qbldxGQz;
	arc=none smtp.remote-ip=74.125.229.131
Received: from mail-dl2-f3.google.com (mail-dl2-f3.google.com [74.125.229.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42470606D813
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 22:21:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42470606D813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qbldxGQz
Received: by mail-dl2-f3.google.com with SMTP id a92af1059eb24-1521c45a248so138832c88.0
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 14:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793917265; x=1794522065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6YYrjHk+nB8Qt9ThWiyhnTgXhSxUl+9UI8ospp2Q6VI=;
        b=qbldxGQz8ySn5OTVN0MzE2NHWTJ5of5pmpV2gl0mwPzMVoPNOzEqQx8BBOtBfleLZA
         DgwXUvYDiPtuFEls04z8RJqJvrkG6l3pHum1BEO4It6bfM3zYd0lrmWRYXSXGoX3UMra
         /q0i9BjelbNEoRQjGZSmziVesSuwDEE+mc8pt1m9iji8MSzsV+Egs4TwMKnx68UJi/nS
         bSeiPSvAdVPUg5TLkdoG1oFTlqOwCwWlj/mJski4Zej2z/MUcRo+FQwgCPx36M7GCWwF
         GJb1caxzYeeiGcf0DKtd35S6M3udphZNwJwDBZfZ9r3T7CpBL70nR87LfgQPO3irZ4Ye
         4TrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793917265; x=1794522065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6YYrjHk+nB8Qt9ThWiyhnTgXhSxUl+9UI8ospp2Q6VI=;
        b=IFZpMiAGVHIGD/E27bGTp4q57QB7uP26W9lid7Warh1yinZzp6qFc2xzzRH4Yk8e34
         VmSSU+gHEJ3F2HmdlbkJJJFjX1fpVmr+rhwRduSYe6ZG20QvrFjLqnLoQX0SqxATGB4r
         ttr4lwQDS21AJndpM6rO+zr8cMIxAZ06VDdVdB4x3Wq063lzhw1/U3YBupVJr8RYh08Y
         vsotac+OTevndoHUSqiPbh0nWrJL6X12zGKvKLDj72n2+syS6Yp83BPo2C1vmLULSAwe
         jbGHS26G8lhP2s3TzVrUFkcJrezehxOyV6QcCxBEEgVsbH2usR1RiVeuUWDHSQMjqmsg
         7nPw==
X-Forwarded-Encrypted: i=1; AKwUvBxVC4Jk6c5YIUXm4VIOI0L6lCVvVj8fWLT2pV74Q/sl/mqCqwMzkocSJ9Yg/yJr5XPZt++uu/tx4IcLRIF/bHc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Fk8v5Wcg1VphNLnsEWExd+NBL8KyASLwzEEEXyfGLAs9zrMu2
	Sb6N5VBl+CeC4y2OcOucICtOqVOHLhzfmhN4l5V158Q2CgrzUZHfgBha
X-Gm-Gg: AYBFou0bLfY0eQEWsZrT6/zQ/13dDwmCZT/0/WyWYJTOAnGU+DFAYaTn6FmPFlcyD4/
	sW5CTJN+FkuEpyWTybznk4xpqy5ePpu3bDdlfsWpQF0/u300ClK3i1wf2UBAP8A9JaQGUPrn5zU
	rcsNGhnXuZizRtz7cDgDu9OAJN2GKFS4xqztsg95jtYME0HpKjrSD4PJVIS7HLGkQptnw+fhf5A
	BVvSPs8qZy6mXFEXuVmtE5BuAi+GCxkf6aV+RvONkbKStPugYBkWovL61EH6jBJlTwt40Ksfe2c
	py5n7enrvRx/jS3VXWu2fx13UuzQBRfoBbgsylyrG6C2xTCk2xY93Ma4H/3hcPu1fMm3UJq6GRs
	WXmMDplt57dA27JGRj2NtMCgUfPaSM2DNr/nzqPOKr1G1cuJ7rnSy2IHlxk6wrEOGMp0hI4IGk2
	2tuBZ6FU+pr1OJjxYU+SCsr8eXePeNXHm2tcufTF09dDqGXOlquPfKwowRVDdhBSbHNu4LLPyXA
	rMBf1HypIKkd7GqrpmWMVYOXCrvE+QjSWfmqAb0Q0B7jadI1txC15oO3s8Hue4z51Abx92JfCjO
	PxLEKvYWqIfs0fQHfx/NVq46svbf8mxr6V7a11lyTaR48w==
X-Received: by 2002:a05:701b:454d:20b0:19a:bbe8:41a8 with SMTP id a92af1059eb24-1b25d3186f8mr494812c88.20.1793917265224;
        Thu, 05 Nov 2026 14:21:05 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:60::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c69c3fsm18985071c88.20.2026.11.05.14.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 14:21:04 -0800 (PST)
From: Stanislav Fomichev <sdf.kernel@gmail.com>
X-Google-Original-From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	edumazet@kernel.org,
	horms@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	saeedm@nvidia.com,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	alexanderduyck@fb.com,
	kernel-team@meta.com,
	sdf@fomichev.me,
	dimitri.daskalakis1@gmail.com,
	almasrymina@google.com,
	dtatulea@nvidia.com,
	bobbyeshleman@meta.com,
	asml.silence@gmail.com,
	daniel@iogearbox.net,
	razor@blackwall.org,
	leitao@debian.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	leon@kernel.org
Subject: [PATCH net-next v3 4/9] net: devmem: add a per-device netmem TX frag size limit
Date: Thu,  5 Nov 2026 14:20:53 -0800
Message-ID: <20261105222058.944293-5-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105222058.944293-1-sdf@fomichev.me>
References: <20261105222058.944293-1-sdf@fomichev.me>
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

Devmem TX frags are bounded only by the net_iov size, which is about
to grow up to 2MB, more than some devices can describe in a single TX
descriptor.

Add netmem_tx_max_frag_size and cap devmem TX frags to the limit of the
device the binding is attached to. Default it to PAGE_SIZE, the largest
TX frag today, so drivers opt in to larger frags.

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
Reviewed-by: Mina Almasry <almasrymina@google.com>
Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>
---
 Documentation/networking/net_cachelines/net_device.rst | 1 +
 Documentation/networking/netmem.rst                    | 7 +++++++
 include/linux/netdevice.h                              | 2 ++
 net/core/datagram.c                                    | 1 +
 net/core/dev.c                                         | 1 +
 net/core/devmem.c                                      | 1 +
 net/core/devmem.h                                      | 1 +
 7 files changed, 14 insertions(+)

diff --git a/Documentation/networking/net_cachelines/net_device.rst b/Documentation/networking/net_cachelines/net_device.rst
index 8eceaa80b686..4f5fd5b99154 100644
--- a/Documentation/networking/net_cachelines/net_device.rst
+++ b/Documentation/networking/net_cachelines/net_device.rst
@@ -76,6 +76,7 @@ unsigned_short                      dev_id
 unsigned_short                      dev_port
 spinlock_t                          addr_list_lock
 int                                 irq
+u32                                 netmem_tx_max_frag_size
 struct netdev_hw_addr_list          uc
 struct netdev_hw_addr_list          mc
 struct netdev_hw_addr_list          dev_addrs
diff --git a/Documentation/networking/netmem.rst b/Documentation/networking/netmem.rst
index 6871dcdd700c..a7b5bbe1cc65 100644
--- a/Documentation/networking/netmem.rst
+++ b/Documentation/networking/netmem.rst
@@ -155,3 +155,10 @@ Driver TX Requirements
 
    - `NETMEM_TX_NO_DMA`: for virtual or passthrough devices that do
      not DMA, but still support handling of netmem-backed skbs.
+
+3. Devmem TX frags are capped at `netdev->netmem_tx_max_frag_size`,
+   PAGE_SIZE by default. Drivers which can describe larger TX buffers
+   may raise it, up to the largest buffer a single TX descriptor can
+   describe. A frag can then span a whole net_iov, which may be much
+   larger than a page. The value is read when the dmabuf binding is
+   created.
diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index c0ae442c4344..4453b80bf7ea 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -1845,6 +1845,7 @@ enum netdev_reg_state {
  *			drivers. Mainly used by logical interfaces, such as
  *			bonding and tunnels
  *	@netmem_tx:	device netmem TX mode
+ *	@netmem_tx_max_frag_size: max size of a netmem TX frag
  *	@pacing_offload: enable EDT pacing offload.
  *
  *	@name:	This is the first field of the "visible" part of this structure
@@ -2342,6 +2343,7 @@ struct net_device {
 	unsigned short          dev_port;
 	int			irq;
 	u32			priv_len;
+	u32			netmem_tx_max_frag_size;
 
 	spinlock_t		addr_list_lock;
 
diff --git a/net/core/datagram.c b/net/core/datagram.c
index 489d92fe6dae..a8d3f87d38c5 100644
--- a/net/core/datagram.c
+++ b/net/core/datagram.c
@@ -734,6 +734,7 @@ zerocopy_fill_skb_from_devmem(struct sk_buff *skb, struct iov_iter *from,
 
 		size = min_t(size_t, size, length);
 		size = min_t(size_t, size, iter_iov_len(from));
+		size = min_t(size_t, size, binding->tx_max_frag_size);
 
 		netmem_inc_ref(net_iov_to_netmem(niov));
 		skb_add_rx_frag_netmem(skb, i, net_iov_to_netmem(niov), off,
diff --git a/net/core/dev.c b/net/core/dev.c
index 3ac700d37e59..0af4e4debcc8 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -12350,6 +12350,7 @@ struct net_device *alloc_netdev_mqs(int sizeof_priv, const char *name,
 	dev->gro_ipv4_max_size = GRO_LEGACY_MAX_SIZE;
 	dev->tso_max_size = TSO_LEGACY_MAX_SIZE;
 	dev->tso_max_segs = TSO_MAX_SEGS;
+	dev->netmem_tx_max_frag_size = PAGE_SIZE;
 	dev->upper_level = 1;
 	dev->lower_level = 1;
 #ifdef CONFIG_LOCKDEP
diff --git a/net/core/devmem.c b/net/core/devmem.c
index 6339f221bc82..19c039ed2cb2 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -218,6 +218,7 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
 
 	binding->dev = dev;
 	binding->vdev = vdev;
+	binding->tx_max_frag_size = dev->netmem_tx_max_frag_size;
 	write_pnet(&binding->net, sock_net(nl_sk));
 	binding->uid = sk_uid(nl_sk);
 	binding->niov_shift = niov_shift;
diff --git a/net/core/devmem.h b/net/core/devmem.h
index 8fa089776610..97ff1f13fb84 100644
--- a/net/core/devmem.h
+++ b/net/core/devmem.h
@@ -79,6 +79,7 @@ struct net_devmem_dmabuf_binding {
 	struct net_iov **tx_vec;
 
 	unsigned int niov_shift;
+	u32 tx_max_frag_size;
 
 	struct work_struct unbind_w;
 };
-- 
2.53.0-Meta

