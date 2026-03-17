Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0683A6EF0
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Mar 2026 10:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773744036; cv=none; b=aiahAfo1tX5sJPbTR0jhBjqgOAZNfwVkBprDXyypc3nM/NxBUTE4ztP3xfxdMbjlKO+OjbeZa0XCWoJoWiwpGOSKal5VQWlOJpwK/ynASUsYC/iyf2K3+tig2LUSTooB12ZoPOIDCIVfrH5aRtmUiQhcw9pcoG2PHuT2iTTsTmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773744036; c=relaxed/simple;
	bh=JSJGJMK6KyufJ/PXMyD+v1i6aM7TmhBZWN5SubcrK5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=onPnphzrkDX9FT8MK1DHnaCI53OnQOhoaAUhO6VyCZwXkpGMybD7ExITnW6/GISxnga4BK4UhYlHZZnSgSClRH6yOM4xHA/nbuqwvbrlHA2+YnyujVEjebTMJ2W7SeqsywlGQXcbOWy8H2u44WCPZ6L1lTd3R0omFQYKtxPdyJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net; spf=pass smtp.mailfrom=openvpn.com; dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b=gshEMQFL; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvpn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b="gshEMQFL"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439fe4985efso4947412f8f.3
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Mar 2026 03:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvpn.net; s=google; t=1773744033; x=1774348833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qqDo5H8oLMcH1+Hu7RTzP1KSiSjs6M89cDFS4JLvEmU=;
        b=gshEMQFLw9uiZR09Hq0z+84YGWDkjg6yDZNDXwtlVHcxDeMTCBPgfokWEeNBiqbV3I
         13rGHJw7vgN+adYgdAVIvUHjIvnZZtFN+s+ixxbgSjWkPmWaP6uRuiu9XANLyrmPu5t9
         fw3+iabXvnqC+0H5QrJy/Rvoe7x8vm8T2uzciwasy7NyDq9dilVYPgnk+Bvb3RrITzeu
         +vOAg78upPMfSxGbwoS7fdpANDCkPv8DTvvdK1RXbCTNvVa0HyNXegJmXun8nXZEH/+W
         +bTS/AUSuU9soqmDZ+5ZQWBx+kOtLcv1zRxs4edVyjz0iIcJPUzeLeWBfxrLhSZh49Un
         /amA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773744033; x=1774348833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qqDo5H8oLMcH1+Hu7RTzP1KSiSjs6M89cDFS4JLvEmU=;
        b=hdIe7LZoKy866XUpkt9JTpFbL43eaWPIt+AmHbyXp8VWHX/flfGj7jDidxJhW43RVx
         yt92d+Wjz1ZBTDMdp0E4vPXU9bcbAUEObmTW5rUWjQ/psy5cjwPp8BJmzusbBrRPB1CO
         +ZlWtetKgLs9WtbEtWnBpZ7R3Z9gscNuFDmUPZ4CJ84WRiCeNq5rrw+FlNLBUBmyCc+Z
         +6wxG81NHMEVU402FenXRtm3LXjleIIh8Mrg5lAz5Y0SGnqILqleeZ9QH27Iqrs3p8Vz
         x2Z8UtSRcAab8NovlmxrnBnE+ULp52EQecjcwLyqC0FopZl8fy+30EaUH+itbpnCwsIq
         smpQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3XE7LxB18ap39nVVkXVjplA3GSgBqI3lp+CVK3X06KFoyqPUdAqSb+tymxrEUHm3M4AHXEkaqrnej4CiWoPU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkhBoZ6pu8Wq14HnzPvXR4qv544OhgXuYFFrWyA9S89lO7dxuT
	9EYQaDhYn5oD7Uvf2Sa4f/lvSsEdIMAffFcvqRVdH7HsHWgQuVt65TdgKUn3b8BOuVJR3DCqm3f
	CPM+OfGjcVHtwg1+17glENzjq2zQiznyfjmVlgchuDt6rk4K0vnVQ0zsNj2mjOOw=
X-Gm-Gg: ATEYQzzVCTjbMJzWTM+HFP6uhYogctVntSaRMEioUrGSaFpvnHY9Vt2GU2OxBaonbRa
	ZFslcmZNBeE7u/QBHMQ0i49bbEdkYNWnhEUXAVUJqd7aaCOqym8Spx1z+CBzGaz8DV9dqcbcWGM
	K9P02pxgCw0fBVJO5YQ3b6VR1koLI5OzPn8ljP+7KodvRFtFVpxiPIVNTGRIDnKd7/o9CqnepDD
	HkSK3NZtuaBDKWRYpGluyvYBJ0SAZxVJBsssth/CgZYHYtzL7fA6MsqyncqaXiTAJcjk+KYk9GT
	OcZaT1XGV2iNeSFxM9GiktKB4GA9OVoCJxpGoYObwcGM1Yfwg/V4DpRAgcPTy3bQLmHVYAE7xSJ
	2sXKfGne9nfvrkQTb6H7i/2+TeOR1JHsizNY1u9YGxbiHOrv6cSdeLNTv6P3L4OkHpB3t/dLEI5
	lH0tMbkrIQmzOjAZefvO4Qb5A2EqEJw9/09MQ=
X-Received: by 2002:a05:6000:40ce:b0:439:abcd:b305 with SMTP id ffacd0b85a97d-43a04d87081mr29517629f8f.13.1773744032972;
        Tue, 17 Mar 2026 03:40:32 -0700 (PDT)
Received: from inifinity.mandelbit.com ([2001:67c:2fbc:1:4f22:3f9:13dd:cf23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe22529csm49948215f8f.31.2026.03.17.03.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 03:40:32 -0700 (PDT)
From: Antonio Quartulli <antonio@openvpn.net>
To: netdev@vger.kernel.org
Cc: ralf@mandelbit.com,
	Sabrina Dubroca <sd@queasysnail.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	linux-kselftest@vger.kernel.org,
	horms@kernel.org,
	shuah@kernel.org,
	donald.hunter@gmail.com,
	Antonio Quartulli <antonio@openvpn.net>
Subject: [PATCH net-next 4/9] ovpn: notify userspace on client float event
Date: Tue, 17 Mar 2026 11:40:18 +0100
Message-ID: <20260317104023.192548-5-antonio@openvpn.net>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260317104023.192548-1-antonio@openvpn.net>
References: <20260317104023.192548-1-antonio@openvpn.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ralf Lici <ralf@mandelbit.com>

Send a netlink notification when a client updates its remote UDP
endpoint. The notification includes the new IP address, port, and scope
ID (for IPv6).

Cc: linux-kselftest@vger.kernel.org
Cc: horms@kernel.org
Cc: shuah@kernel.org
Cc: donald.hunter@gmail.com
Signed-off-by: Ralf Lici <ralf@mandelbit.com>
Signed-off-by: Antonio Quartulli <antonio@openvpn.net>
Reviewed-by: Sabrina Dubroca <sd@queasysnail.net>
---
 Documentation/netlink/specs/ovpn.yaml       |  6 ++
 drivers/net/ovpn/netlink.c                  | 82 +++++++++++++++++++++
 drivers/net/ovpn/netlink.h                  |  2 +
 drivers/net/ovpn/peer.c                     |  2 +
 include/uapi/linux/ovpn.h                   |  1 +
 tools/testing/selftests/net/ovpn/ovpn-cli.c |  3 +
 6 files changed, 96 insertions(+)

diff --git a/Documentation/netlink/specs/ovpn.yaml b/Documentation/netlink/specs/ovpn.yaml
index 1b91045cee2e..0d0c028bf96f 100644
--- a/Documentation/netlink/specs/ovpn.yaml
+++ b/Documentation/netlink/specs/ovpn.yaml
@@ -502,6 +502,12 @@ operations:
             - ifindex
             - keyconf
 
+    -
+      name: peer-float-ntf
+      doc: Notification about a peer floating (changing its remote UDP endpoint)
+      notify: peer-get
+      mcgrp: peers
+
 mcast-groups:
   list:
     -
diff --git a/drivers/net/ovpn/netlink.c b/drivers/net/ovpn/netlink.c
index fed0e46b32a3..e10d7f9a28f5 100644
--- a/drivers/net/ovpn/netlink.c
+++ b/drivers/net/ovpn/netlink.c
@@ -1203,6 +1203,88 @@ int ovpn_nl_peer_del_notify(struct ovpn_peer *peer)
 	return ret;
 }
 
+/**
+ * ovpn_nl_peer_float_notify - notify userspace about peer floating
+ * @peer: the floated peer
+ * @ss: sockaddr representing the new remote endpoint
+ *
+ * Return: 0 on success or a negative error code otherwise
+ */
+int ovpn_nl_peer_float_notify(struct ovpn_peer *peer,
+			      const struct sockaddr_storage *ss)
+{
+	struct ovpn_socket *sock;
+	struct sockaddr_in6 *sa6;
+	struct sockaddr_in *sa;
+	struct sk_buff *msg;
+	struct nlattr *attr;
+	int ret = -EMSGSIZE;
+	void *hdr;
+
+	msg = nlmsg_new(NLMSG_DEFAULT_SIZE, GFP_ATOMIC);
+	if (!msg)
+		return -ENOMEM;
+
+	hdr = genlmsg_put(msg, 0, 0, &ovpn_nl_family, 0,
+			  OVPN_CMD_PEER_FLOAT_NTF);
+	if (!hdr) {
+		ret = -ENOBUFS;
+		goto err_free_msg;
+	}
+
+	if (nla_put_u32(msg, OVPN_A_IFINDEX, peer->ovpn->dev->ifindex))
+		goto err_cancel_msg;
+
+	attr = nla_nest_start(msg, OVPN_A_PEER);
+	if (!attr)
+		goto err_cancel_msg;
+
+	if (nla_put_u32(msg, OVPN_A_PEER_ID, peer->id))
+		goto err_cancel_msg;
+
+	if (ss->ss_family == AF_INET) {
+		sa = (struct sockaddr_in *)ss;
+		if (nla_put_in_addr(msg, OVPN_A_PEER_REMOTE_IPV4,
+				    sa->sin_addr.s_addr) ||
+		    nla_put_net16(msg, OVPN_A_PEER_REMOTE_PORT, sa->sin_port))
+			goto err_cancel_msg;
+	} else if (ss->ss_family == AF_INET6) {
+		sa6 = (struct sockaddr_in6 *)ss;
+		if (nla_put_in6_addr(msg, OVPN_A_PEER_REMOTE_IPV6,
+				     &sa6->sin6_addr) ||
+		    nla_put_u32(msg, OVPN_A_PEER_REMOTE_IPV6_SCOPE_ID,
+				sa6->sin6_scope_id) ||
+		    nla_put_net16(msg, OVPN_A_PEER_REMOTE_PORT, sa6->sin6_port))
+			goto err_cancel_msg;
+	} else {
+		ret = -EAFNOSUPPORT;
+		goto err_cancel_msg;
+	}
+
+	nla_nest_end(msg, attr);
+	genlmsg_end(msg, hdr);
+
+	rcu_read_lock();
+	sock = rcu_dereference(peer->sock);
+	if (!sock) {
+		ret = -EINVAL;
+		goto err_unlock;
+	}
+	genlmsg_multicast_netns(&ovpn_nl_family, sock_net(sock->sk), msg,
+				0, OVPN_NLGRP_PEERS, GFP_ATOMIC);
+	rcu_read_unlock();
+
+	return 0;
+
+err_unlock:
+	rcu_read_unlock();
+err_cancel_msg:
+	genlmsg_cancel(msg, hdr);
+err_free_msg:
+	nlmsg_free(msg);
+	return ret;
+}
+
 /**
  * ovpn_nl_key_swap_notify - notify userspace peer's key must be renewed
  * @peer: the peer whose key needs to be renewed
diff --git a/drivers/net/ovpn/netlink.h b/drivers/net/ovpn/netlink.h
index 8615dfc3c472..11ee7c681885 100644
--- a/drivers/net/ovpn/netlink.h
+++ b/drivers/net/ovpn/netlink.h
@@ -13,6 +13,8 @@ int ovpn_nl_register(void);
 void ovpn_nl_unregister(void);
 
 int ovpn_nl_peer_del_notify(struct ovpn_peer *peer);
+int ovpn_nl_peer_float_notify(struct ovpn_peer *peer,
+			      const struct sockaddr_storage *ss);
 int ovpn_nl_key_swap_notify(struct ovpn_peer *peer, u8 key_id);
 
 #endif /* _NET_OVPN_NETLINK_H_ */
diff --git a/drivers/net/ovpn/peer.c b/drivers/net/ovpn/peer.c
index 3716a1d82801..4e145b4497e6 100644
--- a/drivers/net/ovpn/peer.c
+++ b/drivers/net/ovpn/peer.c
@@ -287,6 +287,8 @@ void ovpn_peer_endpoints_update(struct ovpn_peer *peer, struct sk_buff *skb)
 
 	spin_unlock_bh(&peer->lock);
 
+	ovpn_nl_peer_float_notify(peer, &ss);
+
 	/* rehashing is required only in MP mode as P2P has one peer
 	 * only and thus there is no hashtable
 	 */
diff --git a/include/uapi/linux/ovpn.h b/include/uapi/linux/ovpn.h
index 959b41def61f..0cce0d58b830 100644
--- a/include/uapi/linux/ovpn.h
+++ b/include/uapi/linux/ovpn.h
@@ -100,6 +100,7 @@ enum {
 	OVPN_CMD_KEY_SWAP,
 	OVPN_CMD_KEY_SWAP_NTF,
 	OVPN_CMD_KEY_DEL,
+	OVPN_CMD_PEER_FLOAT_NTF,
 
 	__OVPN_CMD_MAX,
 	OVPN_CMD_MAX = (__OVPN_CMD_MAX - 1)
diff --git a/tools/testing/selftests/net/ovpn/ovpn-cli.c b/tools/testing/selftests/net/ovpn/ovpn-cli.c
index 0f3babf19fd0..7178abae1b2f 100644
--- a/tools/testing/selftests/net/ovpn/ovpn-cli.c
+++ b/tools/testing/selftests/net/ovpn/ovpn-cli.c
@@ -1516,6 +1516,9 @@ static int ovpn_handle_msg(struct nl_msg *msg, void *arg)
 	case OVPN_CMD_PEER_DEL_NTF:
 		fprintf(stdout, "received CMD_PEER_DEL_NTF\n");
 		break;
+	case OVPN_CMD_PEER_FLOAT_NTF:
+		fprintf(stdout, "received CMD_PEER_FLOAT_NTF\n");
+		break;
 	case OVPN_CMD_KEY_SWAP_NTF:
 		fprintf(stdout, "received CMD_KEY_SWAP_NTF\n");
 		break;
-- 
2.52.0

