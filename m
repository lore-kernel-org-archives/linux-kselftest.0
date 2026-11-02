Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793646885;
	b=iVJ1iKlgnrqtFtDWdH+1EE6jHjJJlN59agZZMxCVymhNBy1t1WYoxDmGTSp7ray/93K0
	 sFls77JLVzRkBX6/trfQU7L8imBZ4X4DARRptNA4+KA4eHUb6XnhSQ7Z5Eb3tcasFcLPS
	 T8lf6SR5aBlJMBVdvMMoE6wcjtp52ZentGOjbFpCAPGtRXC0DKGCrS71pvxcMDpvCYKoc
	 8zok4KDHYLQQ730d/WmSwafIVg4lC+yPceB7yUftB3u4+9Xl5goq50VxyOKJ57FwO+zrn
	 GGGSkj/CREW/ydD59OB4lxXAHyXmLXFo7eb0VB2cYWlsN2U8tErkH/uV4XnyMtpnj9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793646885;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=ebj5WEXuQbI24aZxPiirAFW91UeqhX9/gKfZ+31Y7fw=;
	b=AVAFzFg/SsbcWfColF2Ycu5IMzGw2hkJ62LQiJXJdfByA3upx7cGHf9i+PR5MR6e9JPS
	 KMV0TVsIaz+hAQNeH921nnq//ot0JEtBsZrWOKgdJ/s3tzuh7FcZiXPxmShbXHsZJ3ND5
	 XB4lOO5XwUy5QyB2zH8HY3H5WI1pCtYBUMbDq8IVdjhQnEyLgJlRNKMkLa0AOqtNIc4z7
	 CIQA3EJG50J9H/2en9S/wg9ZO4fmQS24ZmFp90s6SKaXGN47pnrPNTFOhAFp9lRqPhN7i
	 11XU283ARIf9Yu2IITgoqkt0QH0MYNzdJQAnWgbIE6PlTxiwHSa/527i3TH5DPMVJcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=olswBHUo;
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFCDF606D839
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 19:14:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFCDF606D839
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=olswBHUo
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-36a24f47293so2129612eec.0
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 11:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793646884; x=1794251684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ebj5WEXuQbI24aZxPiirAFW91UeqhX9/gKfZ+31Y7fw=;
        b=olswBHUoRGSS8folG1C3MfrCz90MbZhfMECYSpiKiG5MuewonhIp6YTa+5eVZW4Q99
         X9ZI5fUIBYHxQV3NfYx6IYr1JUWf1o6ougG5/3HX0zs0bY0OQJE57qir7bp4ZjQPpL1R
         0etCiZ3RhDTmGwFZCQuwpNB8+ZN4BiF045u3p5/H3R56t/Ztod+3iSCUyLhYfGpQWs8u
         8M5eT2GtiYSrx0uA/WyCUzWk0cQoXZtYIQvlM2x9Vph0vVfH2XQ6lfjUVitRc5G4EwBc
         5DPbizvxZUmNneEgLbDxyTeEVDV60nBRKdxGtxsolDQIlB6AGz8Fi0PbfJyyJhzTfeZh
         eGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793646884; x=1794251684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ebj5WEXuQbI24aZxPiirAFW91UeqhX9/gKfZ+31Y7fw=;
        b=vvHR6chAsKLkO3sejMpF87zN1UinTDP0nLqxK/QE1emO1z5F4z0QeGl+VR63wLavRe
         VUZAsd64ULh+JZi9EtHFkN8SZBZ+QuvJ/3wiXpzqJBPy0DPR41YBYuWF1AzS2cz4sWzw
         8iShfS3Di8zyH9s1Q9TLLgZIy/2YkqmRZCW1a9Gz1oyPQwu9HcXbMknQS6ljh+O0xQKO
         6GVf8Gh8a8+Q/dOlqPjVABnxWSrbLrPQaSevAirFbn9X7nXSS+SlApbdHI1O+4efL+jT
         EobXC5EXx7I3hu1bcFK/qkZX1jGPA4F95fmFCd/EbW8fa/EFckyImUeh0M2Jh6QzTzd1
         /qfw==
X-Forwarded-Encrypted: i=1; AKwUvBx3hbwtNT7RlHMSMTlfcEFAVqjuqGALY2ir/xrnPajo5/4USb5bdCwHx9XaVSpZqLRAbwctcjG//rSFkLSSU9I=@vger.kernel.org
X-Gm-Message-State: AFq9FYITWG6bsEofMe4YKVDBqDhXxm9Ezbcv5etImyLL5venIbSojFEP
	cJ+gALawJJzypS6qGlEQ7ZdNeWM+nTOS9nOXahCZnTBorNYJVUzRW7V6
X-Gm-Gg: AYBFou3Nx/hGHD9jNFhPsgw0p4hBwhpL2GYrZqXmSwnnmX5VIvyBxkmCfFRdnOahBwt
	Rb7VDjsuIHVFQOaPsMKdFNw9TnPmkSBN26q47cEWrxFj/jrDJcBAU2k8cEMgirZuDstrqFMv942
	vEkGbHQj2/DADeaimVu3HqSFMAuWv0uGJiqSOPuM0YXWje2GOts01PCDKh86bIf54y28jIgnzS7
	IA6rXUMEJe68QNv2cV/+qciSwxbmaFM/geuIwmGIgWH22inFm27AXzEtGb6rmhbtXTwDDfS4QIC
	JvTTp98vPPFQWDvTDR6USn/nL/xi29ihLeWjkDq8GeK7WqWVP4bb2H9Cf+u/H4ieNiG7TIAvuAL
	Pgqy5G4xqlAVbFBC7GyMiy6ZfM5EYO4+zfpspqT0nM0lyJLY3Qduxou2bagnq1sycGO44NggPdk
	BNqyv7aeVF12M7u75cIH0Itj08RfWotId3IkNlnR5gNiLvPXY2+c13eBTmth/JXYqFYDGgW1Cn+
	ioaq+nA8XGH/v+0v+YtPNlC1R+PEULObM+GatCPHYU7kvnEbZiadgKjA3A5OamBm+Prrmi/LbeF
	HhxLx6QsgDO1gda729bnTBs=
X-Received: by 2002:a05:7300:e9c5:10b0:367:3d68:8480 with SMTP id 5a478bee46e88-36a4206d82emr17568099eec.0.1793646883870;
        Mon, 02 Nov 2026 11:14:43 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:72::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42952e1csm42105061eec.20.2026.11.02.11.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:14:43 -0800 (PST)
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
	sdf@fomichev.me,
	almasrymina@google.com,
	bobbyeshleman@meta.com,
	asml.silence@gmail.com,
	daniel@iogearbox.net,
	razor@blackwall.org,
	leitao@debian.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next 4/7] net: devmem: add a per-device netmem TX frag size limit
Date: Mon,  2 Nov 2026 11:14:35 -0800
Message-ID: <20261102191438.1059771-5-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102191438.1059771-1-sdf@fomichev.me>
References: <20261102191438.1059771-1-sdf@fomichev.me>
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

Add netmem_tx_max_frag_size, U32_MAX by default, and cap devmem TX
frags to the limit of the device the binding is attached to.

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 Documentation/networking/net_cachelines/net_device.rst | 1 +
 Documentation/networking/netmem.rst                    | 6 ++++++
 include/linux/netdevice.h                              | 2 ++
 net/core/datagram.c                                    | 1 +
 net/core/dev.c                                         | 1 +
 net/core/devmem.c                                      | 1 +
 net/core/devmem.h                                      | 1 +
 7 files changed, 13 insertions(+)

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
index 6871dcdd700c..04861c60cfa1 100644
--- a/Documentation/networking/netmem.rst
+++ b/Documentation/networking/netmem.rst
@@ -155,3 +155,9 @@ Driver TX Requirements
 
    - `NETMEM_TX_NO_DMA`: for virtual or passthrough devices that do
      not DMA, but still support handling of netmem-backed skbs.
+
+3. Drivers which limit the size of a single TX buffer should set
+   `netdev->netmem_tx_max_frag_size` to that limit. Devmem TX frags are
+   capped at it, otherwise a frag can span a whole net_iov, which may be
+   much larger than a page. The default is U32_MAX, the value is read when
+   the dmabuf binding is created.
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
index 3ac700d37e59..ba2f887dcd39 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -12350,6 +12350,7 @@ struct net_device *alloc_netdev_mqs(int sizeof_priv, const char *name,
 	dev->gro_ipv4_max_size = GRO_LEGACY_MAX_SIZE;
 	dev->tso_max_size = TSO_LEGACY_MAX_SIZE;
 	dev->tso_max_segs = TSO_MAX_SEGS;
+	dev->netmem_tx_max_frag_size = U32_MAX;
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

