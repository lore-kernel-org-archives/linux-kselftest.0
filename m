Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793749921;
	b=2VC+EGhGj0tq/tbiIjg/ryC4b2nT2RaUnEleQPuyvIDEBa5EBGT8hMb2Ffx/+fDKZUY9
	 m25G132M/VjQ6mzENaj5rMlF/yzcoX2hqasFfMWh3ikNkCa8lEdzIBPTK1nyyAbC49OAA
	 c+jNuB09muRXOo2x+Q3Q0b26eDAmmxNbawQ0/qF7Jk1ELQQMGvfb4qq6A3AuhfHx1JlM4
	 +auhGOxUHBjx2S3ft5Szb9W08z0/h7i286jV+nun6crGtmEjw6CndiTXUfalLD7Wjgv89
	 GUUq65VfH2r+TiSQ98eCaXuURRbJl425CNsSZyosmUGUP24XHES6Wy+LDHEX5jgdnCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793749921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=ebj5WEXuQbI24aZxPiirAFW91UeqhX9/gKfZ+31Y7fw=;
	b=cLZfsSv4kW/8cPJjf63L+Ou0ZvHl09orxbSBX2Rf197wCBqrhV+iD1A9aouki7ucV4cn
	 /XPwVaK1XT9OaYcOThAqGxsEIjQDAKMnjbkjFYtHbWP7ovRpfQghdm1LOgNq2nEXCWQ2T
	 QK2WPmAXEXPJz0w4qMUZn5qK0XTJoKW1TmEphaHVqLKhwE7ffy+aTejjsBx4BwsK+X6x5
	 3rGHL1z913mW3aBBTzUi2AXjPW1sjXvthYvNwvwaakYh5FiI1Zm4bIN1lAuNUM5ZLWNxY
	 r/ytjGojQnQFPC5vCztZmerEzUG+7FOOd4XJn5QSmwmfokcAJ66jTTCCYFE5bMZsZUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZLmnF98k;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA50606D839
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 23:52:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AA50606D839
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZLmnF98k
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-36c9b5c6faaso34027eec.0
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 15:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793749920; x=1794354720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ebj5WEXuQbI24aZxPiirAFW91UeqhX9/gKfZ+31Y7fw=;
        b=ZLmnF98kpeprPr+z0eOsrKOEX38dYgOf+ttdgBjIGkFnCJvR3fgwFwB5gNnco5G6Kh
         Y6XUl3pGo58Bj8+Ny55irvuHn7PTJcGSe4tBGJkqE0ZE0cncWUBa+1szJH/OecgPbOmk
         5pLtJpcIX6OTQAol0NBYJq+o5EgJSc3n37o0JFom2aTi0q8WgZ+4lqbEnE0Jf0+ada5q
         QK7wZWHnFM628pV+mxipeT+OhwI3luqHoSNDycr88qRxHYkByF09nr8/8L7MCAZDVLvZ
         oODZbImTrdiLZqZPJ8snwhhR12dzHZrxuFUJb5jI3vqpsu4QzFi532+LJ7Wc1R6cCjec
         +GEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793749920; x=1794354720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ebj5WEXuQbI24aZxPiirAFW91UeqhX9/gKfZ+31Y7fw=;
        b=Hx52LxeqlPRCGIYLEU30MQKkFfsqg4aT2raVEsvU9/9rvgFtaHYLEVsKTq7gi4mvyD
         oGBrYyeiRnV+XM4xLsLGOquzuIL4SB43oGe8eKZDkyXhdiQbAaEUmS4eklbK8MYTW5hE
         CqEjzHuJelVPM1XTQ+3eLS3al7XfRWfr9ObF9FzPJPNREwWxjrCMcGF8UKIVjtLR9Fa1
         74Sh0zOXc5r2Y6RX1ETw/+XClruwgkrVL99hlFhzWhivgLtLo92qj/h8q9o1d8Axj4Kx
         Ymg21agN3Xqw3440h1KRZj3hEHQRt53ISIKGxfI1GOutCb4DC2pFMo5AvMzrNnD6f0WS
         ibAQ==
X-Forwarded-Encrypted: i=1; AKwUvByak+e7hbWbD0QLeRriSBi6jKg5q68QCr1G4F/ZaG8oxKbjJlmp2aEP58WGulEJD0v9SGBRUwMF6h0ObGu6M5E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CK8NHoy3tRyK7ygR7ZMfhAk+++xAx78WxDNJ6w4BP5ka+MZYq
	GEYMuMhOtomkYpA2rM2dMNToBweegED+oHnkicxA4hz036tYp9JvlC3J
X-Gm-Gg: AYBFou3FcdDMBXNikYcv+w/yVURm4/NCXH68ttOZd1NEfZOu7XOLt2qQlENoZ6QWDKJ
	aqw/ZrnlA0ur6GUON9+sWHltCeVG3V2+/VdqKFW7Y2Gl7Ry6XLblOosZR7anwXKGYVG1TfmaMNj
	XtFVFSovs2R8Uoh7MNj0XcnF9rlAYZ9gIxQi0Gz5UVMw9dCKUGMC5DIs5wwUtk1IRegkFx5y1xf
	GSdmzQxVJBq1ojXwcjt8ah7Z0EB5meu5J1pU4QVh1iv5y0eOqsDXyM2Q2yZL9gb3UMyjVt9FdsD
	EElJg+cut0KbXPz4J95xzIr9P/lEcLanajgqTEWoEM8l4OsQXdBcSx4NbMnxBQ8IiwFXYIdECZr
	fGCmKlEj+4DC9AtSdEPQnm+eB7j94XyrRqG5Dkmf3LNwuamaWRNMvl5fEgwZc8jq2KLHCZjH9fA
	ZwGjs3nLh6+QnHTV4rA9hn6y3jIRs1c8RQkc56NfEHTp5BrvLvlq7sUMV9RwsIQu0OsJ5TDBKjF
	byDkI2nHznxzjYD5veqA+AoMW2f+15f1/rk4tuYMmQmby0Xw2Ox74JZr+CxdULaM2Wp2S/GnNZq
	04A1Jy7nifQo27gb8Q9SVGbtIzeldb25MuLH86iWK/wC
X-Received: by 2002:a05:701b:4201:10b0:16c:3408:760b with SMTP id a92af1059eb24-1ac5da797eemr21678353c88.32.1793749919546;
        Tue, 03 Nov 2026 15:51:59 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:65::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c57430sm2434693c88.18.2026.11.03.15.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 15:51:59 -0800 (PST)
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
	razor@blackwall.org,
	daniel@iogearbox.net,
	leitao@debian.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v2 4/7] net: devmem: add a per-device netmem TX frag size limit
Date: Tue,  3 Nov 2026 15:51:49 -0800
Message-ID: <20261103235152.1904727-5-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103235152.1904727-1-sdf@fomichev.me>
References: <20261103235152.1904727-1-sdf@fomichev.me>
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

