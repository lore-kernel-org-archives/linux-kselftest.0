Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794089156;
	b=0FnLIC9e4iOdh8Hz61x/0zyQP+1w2S3kgHJ6jLwcxpvXcy7lfSHu5xbbMYUzXaRUrOne
	 CrK4GnPakz3oCREt5Ah8NJ9LfiAnpmzt5my+QmyoIJrbI81w7vht5uul9Ugy4LXP3DwTy
	 pCAuEEDXN4Vem8u8Xoad0CMOnTedAURYoT4tuNQGUH8b7lePELUtZt0Ebv0YN+qJhco5v
	 n6krH4ZkEqzRHIEnG3hITPDt8CHSsGwc5omKzMs0tO0MEK53sd7359bt5EYN/7Q1SHi6N
	 4tflS94+OTy5wgkENVSN2f4QqdjLInk0dq9W+73XyFoE1fREeV4r0YwNuWuXNz9IgGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794089156;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aKP/DpJRzJyt9/8HhoM5ZhK9oYmsUYgljoAV0yx+rFI=;
	b=j9fUkFr+p2sTJK6kdi7qBqecv/btYd7ia0GpRwNM5QGhiQcB7NjLOms8/oC6ACczUH8u
	 GBNhqydtxoBs2awaygXgznDDo1e0108PX8ECZLP5YjQxRJ2+bh4qKFi1ieVBePoaM79V+
	 Q/zqgebPanFPQn88eYbBkZm/9nF5uWRoOJl1e+eA/zVLw+ab/kSZ6TF+V9EiBJaaTK+iR
	 M1BEXIrg0JWuAjwzWCdMRwJFlRIrF+wL5HnDzpvLFF9LB1lCgvztpTDvtU8LK7+TNFup2
	 L+apWoXQAvHiT354PguEMQWOnAop5S3acLWu4rsPdOWzXUj2JGQ77qTL62jJTzr4G2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0Z4tRWN1;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE2B606D802
	for <linux-kselftest@vger.kernel.org>; Sat,  7 Nov 2026 22:05:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BE2B606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0Z4tRWN1
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-490af3c91d0so1886f8f.3
        for <linux-kselftest@vger.kernel.org>; Sat, 07 Nov 2026 14:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794089154; x=1794693954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aKP/DpJRzJyt9/8HhoM5ZhK9oYmsUYgljoAV0yx+rFI=;
        b=0Z4tRWN1mk2FwpqxkqSDckSzbbByd8wQ7IRIxNkV3PqQ94KO3Xm++Rj8wUzl59GVKR
         991wjvgrvDRu1NlfyMpXEql7xvwi7YhYygEd2SogkhV1UDJLk7ANj8+uMn0lAYV9fKej
         o+LIaqy871zlHDrnN1JAx/m5GGNUPI+BiLfhq7YCMxnPfj/w8DCfeAXXIrrHanYQagal
         YfY3XMMbf7U3wYn3j64bfGrY5A9hl3lnAvZ2nn8/eftyYotZgsU68biZ2jqQya58ixdr
         JCNaLcaq1RvMVRfmUjZ+S34W5kdWaZPSCU/wGMsR6TrI9pkbmIS6kTERLvf2vk3ci73a
         sY2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794089154; x=1794693954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aKP/DpJRzJyt9/8HhoM5ZhK9oYmsUYgljoAV0yx+rFI=;
        b=J5MZ0rLq4Cqb+DQEvsYworuBYRwoY2H8cduKYBT9yx0mlF/xnj5D9qBKQjE0EtWqKt
         6z6ooPqdPzGSoHtmN/gQTxeksTSOgCGNaJEOYQn+3pn16NopvBU8Rkgt5mN0EnFqW1mc
         5eZVaRUWxxSTclKacdNw6XE4oWJSpJ/Ojgnd61sSufV6S4M8eGBOfyUhgGZ+IOd7Zzd3
         Iu7KCn5AWwjhZMibhgcdPz7r0zVe2h2Swa7AwqGb//4t6DHaXeiABF7hhq6IrXcPodtr
         xh82Hf7gx4twjK1A/smppDiR9lHKl2sO8IzNia6jIKsndE4d34L4QRpUMjkNoFIrutrO
         ZWYw==
X-Forwarded-Encrypted: i=1; AL+hErHTfhH5CN8D3WcjJuxDjRVFQzQ54ZWlSut8H1nOvjo7ou42bYom1aUmPvxvZsS1nDHXgPB4pgBgJkZmRetfPoA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xnsBK3kS4ysp9ipRW7WrL45laOuoicZxZIUh1ApEmXq3YqMy+
	ZyeC+P6TD4ADUR8YDoiRsr/xM3ry/IYaNQifn8kr7yEqGqaW3owt8y2A
X-Gm-Gg: AYBFou2KRAOSwLiGJ63SEOJw/vx+9wN0Ud44JSmHwtbVmaIHcxq0CiWW2vGnVwWlYdc
	8e3Q8dycZXDEUgti9pyQEaEJWKojUl41n66rVCoagXGGwa/N6mPmS2itpdH/RXheo2lpxVvBh4I
	OPEe7y5ys5MQyP91aJnO7d0WD04aAltOJjr3tQnDhzfRf5NbldBgEd9yIEwwRrWppPbXm7xWre7
	i3qCtZNWNZ8atcdprilf0D7tF+m2gtIC6sxt+KDWVavT4IhYgwOsj3IYzmydq7A1HbNN6pgsBcy
	JG5bOfrF3Leh/5z/BSllZXAGbwVvTURqdKqqKN3JbF9Yj51zy7LBZOCWG9f0sq2HG0KYAVNrwsv
	1sfHYqF448EafWv3FNFLxbS+TU/OA6R/lBtDlFplnw8X+MESLuwz7WA1qjkyca0HKH52Dbu2k82
	x1MSM7RGSwiGPCjYNJQF4T/fuYBqBnKljF3Y/AsbqgnBmmaKVf6jygBn7DtuC9QHVtZku5AphAz
	9aqb/nzTQlLsZWP305Hq4fQ+BydunN4sU3bOhlCUhlAKtHFSXFaWTOsLlcJM6LfsAxRUXC8Jq23
	1Ha5SFi6DUiUqh1odMqBR9qTlohdQAiRIAs941Pg9kZcqFvqGlsQNR9iAa4YdbnmCN9+OR4cC8S
	m1//6+b4aoQbDakYuYc/d1TI5OskeDJ//mFFz76r6H09z38DcwTvPLxa3Jwa7uz0R3hjkAn3CNo
	XqsHehyPmq
X-Received: by 2002:a05:6000:220d:b0:48e:eb:56a5 with SMTP id ffacd0b85a97d-49583dec0camr553506f8f.4.1794089154261;
        Sat, 07 Nov 2026 14:05:54 -0800 (PST)
Received: from L-022584.energy.envision.com (dynamic-077-189-161-157.77.189.pool.telefonica.de. [77.189.161.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597b1f969sm358958f8f.50.2026.11.07.14.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 14:05:53 -0800 (PST)
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
Subject: [PATCH net v8 2/4] net: hsr: refuse forwarding devices as HSR/PRP ports
Date: Sat,  7 Nov 2026 23:05:41 +0100
Message-ID: <20261107220544.20-3-xiexinet@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261107220544.20-1-xiexinet@gmail.com>
References: <20261107220544.20-1-xiexinet@gmail.com>
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

Refuse bridge and OVS masters, bond and team masters (also without
ports, since ports can be added later), and macvlan and MACsec devices
as slave or interlink. The rule is by device type, not by the presence
of lower devices, because a DSA user port is an upper of its conduit
and can offload HSR. VLAN devices are already refused. A tunnel device
whose route leads back through the HSR master, or a software device
without an identifying flag such as batman-adv, is not covered.

Also refuse, before any state is changed, a device whose RX handler is
in use or not supported (IFF_NO_RX_HANDLER: ipvlan, VRF), with an
extack message and the same error codes. Some of them, such as a
macvlan lower, ipvlan or VRF, used to fail only in
netdev_rx_handler_register(), after the previous patch had dropped
their GRO request; a refused device now keeps its state.

A bridge can no longer be used directly as the interlink; connect it
through a veth pair.

Reported-by: syzbot+fbf74291c3b7e753b481@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=fbf74291c3b7e753b481
Fixes: 06afd2c31d33 ("hsr: Synchronize sending frames to have always incremented outgoing seq nr.")
Fixes: 430d67bdcb04 ("net: hsr: Use the seqnr lock for frames received via interlink port.")
Signed-off-by: Xin Xie <xiexinet@gmail.com>
---
 net/hsr/hsr_slave.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/net/hsr/hsr_slave.c b/net/hsr/hsr_slave.c
index bc340ae0b52e..26f16d98e479 100644
--- a/net/hsr/hsr_slave.c
+++ b/net/hsr/hsr_slave.c
@@ -120,6 +120,22 @@ static int hsr_check_dev_ok(struct net_device *dev,
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
+
 	if (is_vlan_dev(dev)) {
 		NL_SET_ERR_MSG_MOD(extack, "HSR on top of VLAN is not yet supported in this driver.");
 		return -EINVAL;
@@ -131,9 +147,19 @@ static int hsr_check_dev_ok(struct net_device *dev,
 		return -EOPNOTSUPP;
 	}
 
-	/* HSR over bonded devices has not been tested, but I'm not sure it
-	 * won't work...
+	/* Forwarding devices feed HSR frames into another device's
+	 * transmit path. A bridge, bond, team or OVS master or a macvlan
+	 * or MACsec device makes no sense as a ring or LAN port and can
+	 * nest seqnr_lock through a second HSR device. Refuse them by
+	 * type: devices with lower devices in general stay valid, DSA
+	 * user ports are uppers of their conduit.
 	 */
+	if (netif_is_any_bridge_master(dev) || netif_is_lag_master(dev) ||
+	    netif_is_macvlan(dev) || netif_is_macsec(dev)) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "Cannot use a bridge, bond, team, OVS, macvlan or MACsec device as HSR port.");
+		return -EINVAL;
+	}
 
 	return 0;
 }
-- 
2.53.0

