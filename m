Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9517F3806C6
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 22:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777416134; cv=none; b=LiO2ZDlg5Cwz1wFrBc9dH61bWQceOEpjlJHt5VPVXE1kgV0SDiJypqgTcTlv4HrZiqrxfEJg92a/l2qpLbzJ4zLBGB2TH5H6B/tZ1KJQa5GmVo0Y/8/zHknK1Cd1dByKpF94SKPcnDYWIe1PUa5UCFp9IjXmmAw5no/f5qygJGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777416134; c=relaxed/simple;
	bh=aKUYZj3dKoRf2r8cTorj5veYi8EvMq/P59Mop727o3Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L+rHYnqZ7VssiOFg0jHXtZu5NUVJfTDxTFnXUr4I0g8veiFfb9NV5Flf9V68PE0sPXK7d9Dt3scuBm0t+4oVmQ7da48aYOEL8wXt2kixwbrnguXuWGQZsikgHXdd+htOfHAC72sG+I6mkfUwCU4cZtBeC8c6GAhQC5puyH6kr00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WXn7vFzh; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WXn7vFzh"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-793fdbb8d3aso129141197b3.3
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 15:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777416131; x=1778020931; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cpsYT+KuyZIiwZWdP0lM/x4OtgL97fY3WCk6CAMYDUs=;
        b=WXn7vFzhDl3yWA0zWPRWqK4KD7xu2MuOwL3H1cNWvI5ADzZpnvJ7BKNqPgOyJX8NIn
         MlaE4Xlyh/XkPdXUoD7hc5FAdQWE14QSYamYM53pDH7c+NZAW8C9vWWqhIcvNxyzf65S
         9l5PhIVscYsldq+U/n4EjZdsTMQ7N4BpPWX46/xCrEE9gQ8msUNFwVquiUBDwLokX+oX
         /RInPcxqYlj8trJUUyV6zDSocn4QczzAZi+VbYWCuJvWspQ3dpALLenTtku1gaR3LeO5
         PpOS2nR0A2ObhZw2cDTBOihNa7O7S7MhtkYgrJXrFnH2rqoJ3GcUI73y4W1d3tW24wBh
         8w1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777416132; x=1778020932;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cpsYT+KuyZIiwZWdP0lM/x4OtgL97fY3WCk6CAMYDUs=;
        b=dMSly3lUS2bFMllrTuaF1rr0wFSn3XyXURdgPRVk67w2Xc7sUjOROCBTg4VbHPNYwD
         ZA6/fI8ksiUBM6JyXRhKyJvGMh+yf67GNWCZtsm+d0Vs1adWWWGGWWLBmDFVYgh9mWnd
         r76+KAOLcev4rN+PrpwJ/MRjFZDzHG+cdDCRhACFF/EsBO4Uu3z0gRlG58d3EQV5gCO2
         t8w1R/1TR16s7s9671p19Q58ucdLoi6NwL46tvRqwVb3O8E1RLXJjOlsVWlaoaa3M9tf
         bE4BPc5YE/0RHSIdjcXGSgylDbfUGBoCr0GBcStdFiiUcVsPZPMRz1khijwHTij/2U6L
         Nvnw==
X-Forwarded-Encrypted: i=1; AFNElJ8+H3QdAYrd0njFHI4dLSS6LXGVinB2EMlHwSeblL38/+bYjXz8GCvb/FbZTTwrsj+GYEyoEOQnBaK2Z0JG1MY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVFzWvMedeMIzHi47RqHSlU4IS7rIqGWF+0EUVIGoQCf1l9Pwr
	sFEKVKuiXeNiu0HDaJPpHfT8M3x4/LknlhBnS4tPCZWWxmygoIGMWXIo
X-Gm-Gg: AeBDieumT98qwxdaaOta/frOOOlKImX5jCHnhsAiyO75EccAxqjgLd4Df8Zo++m+Vfl
	2pTXhESrk4enw8a3cZrvtJu2KbfGK+CxBylIzga7gd0G6CMeZE4/s+pSPF0ppqbzES+wXsCcZtv
	Xd8INr/qz6q9B0N1Dhae0L562HSR0gBykYSIYK0l6nkABqeJIfEqLq4XPoxGPIR9nRdUdsyWd7c
	mvE463FamcSCL6JDFaGqdD7xO2ZHjxC98EoUMmZxOlcAWTaR/YYKbCnoygv1vInKWKNBZwwFxdi
	Q2/M9xi/UsShDCsazWhxBDHpAiYl8gXRTwE3rmHkoPNQRbFBLsyqHMdwrXXy5z/w1AXlsx3UJS8
	WlmFd0O6F0CIHT767kp0sfj8x9gizzJpYOVgR6roZ7uf6crslXQHaTtypgIGd2NWj9sdwkwMV0W
	odnyIARfQNwDtPuE175eMQTtwIJO9AoXOS
X-Received: by 2002:a05:690c:b17:b0:7b9:d6b8:b9ac with SMTP id 00721157ae682-7bcf558efe6mr52968327b3.26.1777416131438;
        Tue, 28 Apr 2026 15:42:11 -0700 (PDT)
Received: from localhost ([2a03:2880:f806:45::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd258a2eafsm4650877b3.29.2026.04.28.15.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 15:42:11 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Tue, 28 Apr 2026 15:41:58 -0700
Subject: [PATCH net-next 01/11] net: add netmem_tx modes that indicate dma
 capability
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260428-tcp-dm-netkit-v1-1-719280eba4d2@meta.com>
References: <20260428-tcp-dm-netkit-v1-0-719280eba4d2@meta.com>
In-Reply-To: <20260428-tcp-dm-netkit-v1-0-719280eba4d2@meta.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Alex Shi <alexs@kernel.org>, 
 Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, 
 Michael Chan <michael.chan@broadcom.com>, 
 Pavan Chebbi <pavan.chebbi@broadcom.com>, 
 Joshua Washington <joshwash@google.com>, 
 Harshitha Ramamurthy <hramamurthy@google.com>, 
 Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, 
 Mark Bloch <mbloch@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
 Alexander Duyck <alexanderduyck@fb.com>, kernel-team@meta.com, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 Nikolay Aleksandrov <razor@blackwall.org>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org, 
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Stanislav Fomichev <sdf@fomichev.me>, Mina Almasry <almasrymina@google.com>, 
 Bobby Eshleman <bobbyeshleman@meta.com>
X-Mailer: b4 0.14.3

From: Bobby Eshleman <bobbyeshleman@meta.com>

Devices that support netmem TX previously set dev->netmem_tx = true.
This was checked in validate_xmit_unreadable_skb() to drop unreadable
skbs (skbs with dmabuf-backed frags) before they reach drivers that
would mishandle them or devices that would not have the iommu mappings
for them.

Some virtual devices like netkit (or ifb) never DMA and never touch frag
contents, as they essentially just forward the skb to another device.
They are unable to forward unreadable skbs, however, because they fail
to pass TX validation checks on dev->netmem_tx. This single bit flag
doesn't give the TX validator enough information to differentiate
devices that will attempt DMA on the unreadable skb and those that will
simply route it untouched.

This patch fixes this issue by adding an additional bit to netmem_tx, so
that drivers can indicate 1) if they have netmem support, and 2) if they
do, are they DMA-capable or not?

Replace the boolean with a 2-bit enum:

NETMEM_TX_NONE   - no netmem TX support (drop unreadable skbs)
NETMEM_TX_DMA    - full support, device does DMA
NETMEM_TX_NO_DMA - pass-through, device never DMAs

Subsequent patches update netmem drivers to the new flags.

Assisted-by: Claude Code:claude-sonnet-4-6
Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
 Documentation/networking/net_cachelines/net_device.rst |  2 +-
 Documentation/networking/netmem.rst                    |  8 +++++++-
 Documentation/translations/zh_CN/networking/netmem.rst |  7 ++++++-
 include/linux/netdevice.h                              | 11 +++++++++--
 4 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/Documentation/networking/net_cachelines/net_device.rst b/Documentation/networking/net_cachelines/net_device.rst
index 1c19bb7705df..c85784259544 100644
--- a/Documentation/networking/net_cachelines/net_device.rst
+++ b/Documentation/networking/net_cachelines/net_device.rst
@@ -10,7 +10,7 @@ Type                                Name                        fastpath_tx_acce
 =================================== =========================== =================== =================== ===================================================================================
 unsigned_long:32                    priv_flags                  read_mostly                             __dev_queue_xmit(tx)
 unsigned_long:1                     lltx                        read_mostly                             HARD_TX_LOCK,HARD_TX_TRYLOCK,HARD_TX_UNLOCK(tx)
-unsigned long:1                     netmem_tx:1;                read_mostly
+unsigned long:2                     netmem_tx:2;                read_mostly
 char                                name[16]
 struct netdev_name_node*            name_node
 struct dev_ifalias*                 ifalias
diff --git a/Documentation/networking/netmem.rst b/Documentation/networking/netmem.rst
index b63aded46337..217869d1108d 100644
--- a/Documentation/networking/netmem.rst
+++ b/Documentation/networking/netmem.rst
@@ -95,4 +95,10 @@ Driver TX Requirements
    netdev@, or reach out to the maintainers and/or almasrymina@google.com for
    help adding the netmem API.
 
-2. Driver should declare support by setting `netdev->netmem_tx = true`
+2. Driver should declare support by setting `netdev->netmem_tx` to the
+   appropriate mode:
+
+   - `NETMEM_TX_DMA`: for physical devices that perform DMA.
+
+   - `NETMEM_TX_NO_DMA`: for virtual or passthrough devices that do
+     not DMA, but still support handling of netmem-backed skbs.
diff --git a/Documentation/translations/zh_CN/networking/netmem.rst b/Documentation/translations/zh_CN/networking/netmem.rst
index fe351a240f02..320f3eacf51b 100644
--- a/Documentation/translations/zh_CN/networking/netmem.rst
+++ b/Documentation/translations/zh_CN/networking/netmem.rst
@@ -89,4 +89,9 @@ dma-mapping API 去处理。
 使用某个还不存在的 netmem API，你可以自行添加并提交到 netdev@，也可以联系维护
 人员或者发送邮件至 almasrymina@google.com 寻求帮助。
 
-2. 驱动程序应通过设置 netdev->netmem_tx = true 来表明自身支持 netmem 功能。
+2. 驱动程序应将 `netdev->netmem_tx` 设置为适当的模式：
+
+   - `NETMEM_TX_DMA`：适用于执行 DMA 的物理设备。
+
+   - `NETMEM_TX_NO_DMA`：适用于不执行 DMA 的虚拟或透传设备，但仍支持
+     处理 netmem 支持的 skb。
diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 0e1e581efc5a..11d68e75eb4f 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -1788,6 +1788,12 @@ enum netdev_stat_type {
 	NETDEV_PCPU_STAT_DSTATS, /* struct pcpu_dstats */
 };
 
+enum netmem_tx_mode {
+	NETMEM_TX_NONE,		/* no netmem TX support */
+	NETMEM_TX_DMA,		/* DMA-capable netmem TX (real HW) */
+	NETMEM_TX_NO_DMA,	/* no DMA, e.g. passthrough for virtual devs */
+};
+
 enum netdev_reg_state {
 	NETREG_UNINITIALIZED = 0,
 	NETREG_REGISTERED,	/* completed register_netdevice */
@@ -1809,7 +1815,8 @@ enum netdev_reg_state {
  *	@lltx:		device supports lockless Tx. Deprecated for real HW
  *			drivers. Mainly used by logical interfaces, such as
  *			bonding and tunnels
- *	@netmem_tx:	device support netmem_tx.
+ *	@netmem_tx:	device netmem TX mode (NETMEM_TX_NONE, NETMEM_TX_DMA,
+ *			or NETMEM_TX_NO_DMA).
  *
  *	@name:	This is the first field of the "visible" part of this structure
  *		(i.e. as seen by users in the "Space.c" file).  It is the name
@@ -2132,7 +2139,7 @@ struct net_device {
 	struct_group(priv_flags_fast,
 		unsigned long		priv_flags:32;
 		unsigned long		lltx:1;
-		unsigned long		netmem_tx:1;
+		unsigned long		netmem_tx:2;
 	);
 	const struct net_device_ops *netdev_ops;
 	const struct header_ops *header_ops;

-- 
2.52.0

