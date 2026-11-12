Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794497621;
	b=cUlpIHGG5FCNeRPHElJ9iBGHsCTZdWfEMoEGu9QSnmx42cQtm1q7eS7bINJ0Ga1TiveN
	 P1CTebLBSU3lENaHhC/6crqrKkyhX0zFIIHqYsmDtf0rZg/8xSFbp3dUjKv3EgxpTzRWO
	 ODglGy/2VJgVEYKAX8+yJhYJpuccYBFTJkWnHQjulXJYncYYbmWTGAhsy0VoG8uqpRhwF
	 ijDAQV4S3ohFkewxSH1b0njDJnamQIef/vtR1ibaeH1Cq5kG+r/U4OHFiGcD5AH1H/U9L
	 BSRk2J3ekdJxGol7vIbVLjAoaBIeJXlmzd1pskMuulM6P+NVjJrfNCp2W3ooKNAv6Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794497621;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3xfIK9b16iFD8RabDIv0jNeXjsZ6mto/eDWpaCXgusI=;
	b=FVsr1huToKpqOrhgNkgG0V2AmnOTS9FBGyaqWGLRxUrhTfGu5ZNMaO72dWgGvdfxZFdW
	 2e8I46MPRIrg+bemHhtHId6AwhYkEZxBxtHptTnh+TVahg1+l6wDjy/p5JGUL942UAypT
	 bJGYJDj8QF9yPV7bBgydRUmsx5+yo+3m3Wq9lxA/bqU21mfzLgkXV8HJMIaAYqS5zvXH5
	 ehPzhRQjUW80HFH7RZSLi90dm45HMhFS4wHeT4yrPxOOJApDyHlwiyVESCwfZBpmY3gNm
	 52vQfYcmyT7AOa/oS39JiDhswkvDu0wWl0c9cjuR1L2kPSgOhNI01gEhHHleE8lWrYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yZEQjkEc;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C15606A8AA
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 15:33:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1C15606A8AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yZEQjkEc
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a78ec32fadso2307705e9.3
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 07:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794497619; x=1795102419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3xfIK9b16iFD8RabDIv0jNeXjsZ6mto/eDWpaCXgusI=;
        b=yZEQjkEchwiAQkQRDzZMJ+fRKObEzFTosyO/AqTA3Zo7Qji7bFqwQRZJ/BH1KT3T9U
         LttUmM72agPqas0bE9oDGF2VQ2ToPeYeFgQltyyvnDlWVKx8LCxKpOLKzNEiHbMEl8ET
         fR89lRYpEDzzmqpVsS1FznEEq15oiQW01yPMoQTKbfNrSi7LgaOD/7F4/uPst5pfsMDP
         fDUSLWB6bD0sEmI7Dq8u8ilPi2Yc3SzDoZoFYHiWdtBmmQDM5Ij42ajV6ke+cobFx5U9
         0leEBR0YBVAxEI/N+9006Cf5Xg11YSEw1wd4BJ6sjm0isfk3RSEht0i8T0oaEEy34cYO
         02aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794497619; x=1795102419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3xfIK9b16iFD8RabDIv0jNeXjsZ6mto/eDWpaCXgusI=;
        b=JaTp3q//xPDAvUVTQqUuVwB+bJzwr7RGBYqE9H289Tik75vFxO24xD3iBJiSCn4JQh
         rq7SRVJ3QL445L0wZpEgJ2ql5dX+lkF43mdgWW1KyxjTG7TvvuB1qzWieFjIEhgrim0x
         WdmEHHSttpPseiHllM6pHB2r/0KU+zGdWw3VgZM1x6ZsDufdHEUeeoEE4jOS4wlToTNB
         YXxTQ72UV+3hxDGg1okAVF3egkBx6inENkPEVax3gJarRNqShT+KxPJb3Xqaa4Ix7LO2
         L0NJPTArqSY+hsz8z2hYARDBTGPYYfLZx1GEV6QfpXhAceC8uqbgtgl/Zs+cn0jJGwJ2
         cJ9w==
X-Forwarded-Encrypted: i=1; AL+hErHBubmc3/SLsEBu+yUgKqYVmfeYMIAAQ34uLgFfdxFJ0A/UKnMM97XRiKt4yBWMgm2vTB4Aga6P84OirhqaCnM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9+udnR36HH4Y7pXTYRK4cGvekCPs4HSEpoaAVrcKBY6Rp+4OZ
	WlCdnuqK4iSUGY9cVZPkDLhKDkxdpTz8bq1Q15UO6aeAhvi5tUY2T1Sr
X-Gm-Gg: AYBFou0wq37bCCZpYTo6IJ5XNoQ3tSl19TZAPL52lcjHI1vuGsEWoOoxkirLSUGMRCF
	XvM+uXz3JNxVOEqDyh5FN0R1inKpc6Yglvq80Jh2NLKufU6o7Xm38iOMhtQE11AKmBVLOlCnxCL
	+VGNMU5xAB45erNL2zbUilV0RrxCM/H/TtGUq1rBU/8fQbRFxn17wBDdVYyZymQq/DPUmsM6Caz
	3coI7QsxJ+o9hRLBSAtqgpuhE8iEffCxwZM0SE/E8IwXStoBmwxGaBj2jH25WAIFrR2gIXBNxbC
	4XMbYLL+gs7nM5Y7419vIdyyJ8SF9nZTebAf90mLDk8G6oXz0Gu87U8Is3lJ7yM+THlfjh9zlph
	CmHKYnGJAAxR1fQ4/jYgWN6Jhxc+136n3liQPQqYwTUFVKMoLoooqdS8bBkcDQTsZB1OXyQ82+T
	/U/GZZb2kqvncW8a4aMJl49TbbXmwmyfhx37gPpH3D4eBUpSCLv+eciXrYKIjwpnhjXJAnc8Ikw
	MEKZXXdWP5aY3SsUjyrTllA+6wFHfkug1djn3ek+24VjCZMVM2fx+s4/jP95Jh3CX82hWksIYpS
	gadeL6AlJMTWvVVy2Wl8JbajmBSUrYMOVnyK7QhBVdd2AvPwB9HSFQQ8ZwAC/N/sJr9lk2TZnnm
	s+ldvlMszjPYmddGV7msS0wXEuU/kTRdNnBCSLJ+ofFpdmQAwhw7jtEEzElyCi04=
X-Received: by 2002:a05:600c:4e56:b0:4ad:5ec2:d3b3 with SMTP id 5b1f17b1804b1-4ba09357427mr110192375e9.1.1794497619120;
        Thu, 12 Nov 2026 07:33:39 -0800 (PST)
Received: from L-022584.energy.envision.com (dynamic-093-130-172-139.93.130.pool.telefonica.de. [93.130.172.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08ddbe68sm229331185e9.0.2026.11.12.07.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:33:38 -0800 (PST)
From: Xin Xie <xiexinet@gmail.com>
To: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	andrew+netdev@lunn.ch,
	shuah@kernel.org,
	kees@kernel.org,
	petr.wozniak@gmail.com,
	qingfang.deng@linux.dev,
	fmaurer@redhat.com,
	luka.gejak@linux.dev,
	bigeasy@linutronix.de,
	xiaoliang.yang_1@nxp.com,
	skhawaja@google.com,
	liuhangbin@gmail.com,
	stable@vger.kernel.org,
	sdf.kernel@gmail.com,
	xiexinet@gmail.com,
	lukma@denx.de,
	fmancera@suse.de,
	danishanwar@ti.com,
	syzbot+fbf74291c3b7e753b481@syzkaller.appspotmail.com,
	sd@queasysnail.net
Subject: [PATCH net v9 2/4] net: hsr: refuse forwarding devices as HSR/PRP ports
Date: Thu, 12 Nov 2026 16:33:31 +0100
Message-ID: <20261112153333.20-3-xiexinet@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261112153333.20-1-xiexinet@gmail.com>
References: <20261112153333.20-1-xiexinet@gmail.com>
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

syzbot reported recursive locking with an HSR device whose slave is a
bridge, and that bridge has the master of a second HSR device as a port.
The first device transmits its supervision frames with its seqnr_lock
held; the bridge floods them to the second HSR master, whose
hsr_dev_xmit() takes the seqnr_lock of that device:

  WARNING: possible recursive locking detected
  ...
   hsr_dev_xmit+0x18a/0x210 net/hsr/hsr_device.c:234
   ...
   br_dev_xmit+0x1202/0x1b40
   ...
   hsr_forward_skb+0x171c/0x2ac0 net/hsr/hsr_forward.c:728
   send_hsr_supervision_frame+0x63b/0xcc0 net/hsr/hsr_device.c:351
   hsr_announce+0x1f8/0x3a0 net/hsr/hsr_device.c:408

Interlink RX forwards to the slaves with the same lock held. A chain of
two devices does not deadlock, but such a port makes no sense: an HSR
ring and the two PRP LANs are attached to the node directly.

Refuse bridge and OVS masters and bond and team masters (also without
ports, since ports can be added later) as slave or interlink, and a
macvlan or MACsec device when an HSR/PRP, bridge, bond or team master
is below it; on an ordinary NIC or veth such a device stays valid. This
also refuses one on a DSA user port whose conduit is a bond or team,
since it can gain ports later too. A macvlan takes its GRO setting
from its lower device, so it is accepted only if GRO is off there when
it is attached. The lower devices of other ports are not checked,
because a DSA user port is an upper of its conduit and can offload HSR.
VLAN devices are already refused. The check runs at attach; later
changes below a stacked device are not rechecked. Not covered are a
tunnel whose route leads back through the HSR master, a tc or BPF
redirect to it, other stacked devices, and a software device without
an identifying flag such as batman-adv. Narrowing seqnr_lock, planned
for net-next, addresses that class as a whole.

Also refuse a device whose RX handler is in use or not supported
(IFF_NO_RX_HANDLER: ipvlan, VRF), or that already has a master, such as
a VRF port, with an extack message and the same error codes. All ports
are checked before any of them is changed. Some of these devices, such
as a macvlan lower, ipvlan or VRF, used to fail only in
netdev_rx_handler_register(), after the previous patch had dropped
their GRO request; a refused device now keeps its state, and so do the
ports given with it.

A bridge can no longer be used directly as the interlink; connect it
through a veth pair.

Reported-by: syzbot+fbf74291c3b7e753b481@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=fbf74291c3b7e753b481
Fixes: 06afd2c31d33 ("hsr: Synchronize sending frames to have always incremented outgoing seq nr.")
Fixes: 430d67bdcb04 ("net: hsr: Use the seqnr lock for frames received via interlink port.")
Signed-off-by: Xin Xie <xiexinet@gmail.com>
---
 net/hsr/hsr_device.c |  7 ++++
 net/hsr/hsr_slave.c  | 79 ++++++++++++++++++++++++++++++++++++++++++--
 net/hsr/hsr_slave.h  |  2 ++
 3 files changed, 86 insertions(+), 2 deletions(-)

diff --git a/net/hsr/hsr_device.c b/net/hsr/hsr_device.c
index fc512204600c..90ee55eb3c19 100644
--- a/net/hsr/hsr_device.c
+++ b/net/hsr/hsr_device.c
@@ -758,6 +758,13 @@ int hsr_dev_finalize(struct net_device *hsr_dev, struct net_device *slave[2],
 	INIT_LIST_HEAD(&hsr->proxy_node_db);
 	spin_lock_init(&hsr->list_lock);
 
+	/* Refuse a bad port before any port is changed. The same checks
+	 * in hsr_add_port() remain as a safety net.
+	 */
+	res = hsr_check_ports(slave, interlink, extack);
+	if (res)
+		return res;
+
 	eth_hw_addr_set(hsr_dev, slave[0]->dev_addr);
 
 	/* initialize protocol specific functions */
diff --git a/net/hsr/hsr_slave.c b/net/hsr/hsr_slave.c
index b7765a4bb992..666220b24dee 100644
--- a/net/hsr/hsr_slave.c
+++ b/net/hsr/hsr_slave.c
@@ -10,6 +10,7 @@
 #include "hsr_slave.h"
 #include <linux/etherdevice.h>
 #include <linux/if_arp.h>
+#include <linux/if_macvlan.h>
 #include <linux/if_vlan.h>
 #include <net/netdev_lock.h>
 #include "hsr_main.h"
@@ -97,6 +98,16 @@ bool hsr_port_exists(const struct net_device *dev)
 	return rcu_access_pointer(dev->rx_handler) == hsr_handle_frame;
 }
 
+/* A lower device that forwards into other ports or into a second
+ * HSR/PRP device; called under RTNL by the lower-device walk.
+ */
+static int hsr_lower_forwards(struct net_device *lower,
+			      struct netdev_nested_priv *priv)
+{
+	return is_hsr_master(lower) || netif_is_any_bridge_master(lower) ||
+	       netif_is_lag_master(lower);
+}
+
 static int hsr_check_dev_ok(struct net_device *dev,
 			    struct netlink_ext_ack *extack)
 {
@@ -120,6 +131,27 @@ static int hsr_check_dev_ok(struct net_device *dev,
 		return -EINVAL;
 	}
 
+	/* The RX handler is taken by devices such as bridge/bond/team
+	 * ports, macvlan and ipvlan lowers and HSR ports, or unsupported
+	 * (IFF_NO_RX_HANDLER). Refuse before any state change, so a
+	 * failed attach leaves the device as it was.
+	 */
+	if (dev->priv_flags & IFF_NO_RX_HANDLER) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "This device does not support an RX handler.");
+		return -EINVAL;
+	}
+	if (netdev_is_rx_handler_busy(dev)) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "RX handler busy: device is already a lower of another device.");
+		return -EBUSY;
+	}
+	/* A master without an RX handler on its ports, such as VRF. */
+	if (netdev_master_upper_dev_get(dev)) {
+		NL_SET_ERR_MSG_MOD(extack, "Device already has a master.");
+		return -EBUSY;
+	}
+
 	if (is_vlan_dev(dev)) {
 		NL_SET_ERR_MSG_MOD(extack, "HSR on top of VLAN is not yet supported in this driver.");
 		return -EINVAL;
@@ -131,13 +163,56 @@ static int hsr_check_dev_ok(struct net_device *dev,
 		return -EOPNOTSUPP;
 	}
 
-	/* HSR over bonded devices has not been tested, but I'm not sure it
-	 * won't work...
+	/* Forwarding devices feed HSR frames into another device's
+	 * transmit path and can nest seqnr_lock through a second HSR
+	 * device. A bridge, bond, team or OVS master makes no sense as a
+	 * ring or LAN port and is refused by type. A macvlan or MACsec
+	 * device is refused if such a master or an HSR/PRP master is
+	 * below it. Other devices keep their lower devices unchecked:
+	 * DSA user ports are uppers of their conduit.
+	 */
+	if (netif_is_any_bridge_master(dev) || netif_is_lag_master(dev)) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "Cannot use a bridge, bond, team or OVS master as HSR port.");
+		return -EINVAL;
+	}
+	if ((netif_is_macvlan(dev) || netif_is_macsec(dev)) &&
+	    netdev_walk_all_lower_dev(dev, hsr_lower_forwards, NULL)) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "Cannot use a macvlan or MACsec device stacked on an HSR, bridge, bond, team or OVS master as HSR port.");
+		return -EINVAL;
+	}
+	/* A macvlan takes its GRO setting from the lower device, so the
+	 * member role cannot turn it off. Refuse at attach, before any
+	 * state change, if the lower device runs GRO; it can still turn
+	 * GRO on later.
 	 */
+	if (netif_is_macvlan(dev) &&
+	    (macvlan_dev_real_dev(dev)->features & NETIF_F_GRO)) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "macvlan inherits GRO from its lower device; turn GRO off on the lower device.");
+		return -EBUSY;
+	}
 
 	return 0;
 }
 
+/* Check every port before any of them is changed, so that a refused
+ * port does not leave an earlier one modified.
+ */
+int hsr_check_ports(struct net_device *slave[2], struct net_device *interlink,
+		    struct netlink_ext_ack *extack)
+{
+	int res;
+
+	res = hsr_check_dev_ok(slave[0], extack);
+	if (!res)
+		res = hsr_check_dev_ok(slave[1], extack);
+	if (!res && interlink)
+		res = hsr_check_dev_ok(interlink, extack);
+	return res;
+}
+
 /* Member role and feature policy.
  * Setting the role makes __netdev_update_features() clear GRO
  * and configurable GRO_HW from the request and before
diff --git a/net/hsr/hsr_slave.h b/net/hsr/hsr_slave.h
index edc4612bb009..e19c779b500d 100644
--- a/net/hsr/hsr_slave.h
+++ b/net/hsr/hsr_slave.h
@@ -14,6 +14,8 @@
 #include <linux/rtnetlink.h>
 #include "hsr_main.h"
 
+int hsr_check_ports(struct net_device *slave[2], struct net_device *interlink,
+		    struct netlink_ext_ack *extack);
 int hsr_add_port(struct hsr_priv *hsr, struct net_device *dev,
 		 enum hsr_port_type pt, struct netlink_ext_ack *extack);
 void hsr_del_port(struct hsr_port *port);
-- 
2.53.0

