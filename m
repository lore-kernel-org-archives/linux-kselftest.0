Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0571B3033FD
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Mar 2026 14:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773154234; cv=none; b=N3EvBHRpawXY05dmxGfX8Y/0tnt/1ElejkROM1rSp0WlQRH2UhQuAPE0lIv7LJY2dpgrXpEoBmjhdtwbvKRtVa0LHYb9+XccyYMF+mpD36jBiFmZNbBbgTCy8EGsmMUOnnVaxDLhTC2ONnGk0D4aFpwyHNvTegWq9/gAmUz/To4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773154234; c=relaxed/simple;
	bh=JSJGJMK6KyufJ/PXMyD+v1i6aM7TmhBZWN5SubcrK5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kl7H80tRx5JD741javoVLRH42EFuQXrJJW4ZQUQ2yZc9OVO38KHa8MqjeZgyxBdi1uaHJjjY92qa3o8NY5HJRQiAhWFbOS1a11Km3iKR0CpSLIDua5gD+GHDVNJIBKzPYHYUY6OXbKJKDrY+ZQkKvI6Qo8NmjKa9ZX6qej1+6ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net; spf=pass smtp.mailfrom=openvpn.com; dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b=YOwcZeo9; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvpn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b="YOwcZeo9"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439cd6b0aedso4971777f8f.1
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Mar 2026 07:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvpn.net; s=google; t=1773154231; x=1773759031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qqDo5H8oLMcH1+Hu7RTzP1KSiSjs6M89cDFS4JLvEmU=;
        b=YOwcZeo9dYrTlISM0H+Rt48Hv8NoZOSy+fjctHg+mdkREyCCQzwHHKMwu22ynkccd+
         OaxPc8YbwXXqsCavlViNwUi1wqTNkbW6vMhYrmlDwbJzWYIdLo+TZe5QvamL2RQwQUPQ
         ORXAO4z5Io6/tWnj/+Bb6EspjdjN0AJ+l95jRk13lEHxaygOFiJYUViaZFj04SKJDLzJ
         SVu9jGF1OZJZzLdwOi9+XI38uZwt/qifZSW8GZgS4E1oPbpYVJ8U6qEBDgyVmxNgczeB
         b89jg80vg2T/qXqbdQCj7XS4qzmKOExRlYUsrps8ZBpfimDu1gjuBuOaNhEosBHpRLxD
         5cQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773154231; x=1773759031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qqDo5H8oLMcH1+Hu7RTzP1KSiSjs6M89cDFS4JLvEmU=;
        b=eNlYs1oN9ZnBp5mYKj/UeMTdLO7L+FmeWobIonSA09vDtOqb9hk2XlV50Plkz3FD2V
         qOW5gruPBEkSCjdZT5wmIt8s42jFdYY+h/LTeVa1cHLlC37lfy5nE0sbJff7nNCFq7J0
         diZgIzJ8y8StWq/MyAlcmQnRp3Inel80FmZiMYtxkI+g4Tcr4JLvLkLLX+aHVIWEnfVs
         Jh7+0yIb+3FbPpSVmKhzpKqzX7QIOa9OVRQ3XeCETVcaC8JwNsA7fKD0ObSHt7O59u3Y
         dDb0OTIiyuXGZHctVnp8MWte8HlsTo28bPfMERqTiZDF6nsovVuHreEwb0m8g45pNIMr
         FwLA==
X-Forwarded-Encrypted: i=1; AJvYcCXSZTiKfT4INaV+GklKqziSSsOochxjCAeS7PxCCp20z/DxhjA+j0FmslUJWe8ZiB74J70j5R6xsbZ9b45PIZg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxiDUIqkmdD3959UCOVZuo+vSjkfSWzLej7e6F6E+m4iK7KW7j
	D8BAawAwMixDlE9StJZTAWXOkbPbh1rLsb+s3aithGJzOVvOCk80MIDIPgpBtuvyX3/tBL6w/co
	OJV6rztiibdwGCepKF/jTo0jUCFGj5ptVfCgts9HQzV4KnqOUsF1eqiLHpvEKn3I=
X-Gm-Gg: ATEYQzwTqWypiUH7N2HxojHWttVKZW+tU2BEYzUC3y2F0yO4s1RxW3LYM5JIRExG1wk
	QJO+MFoD6tsIAyB97t/xMIQjUxYWu9ZX3SWEQwtG3su9pu+gCFrVyAmdlh/vgXPRtqW6ZWZipAu
	sSFiOhUjIsup5cgkxWWahpEczB/Cmc+ts00QaRV45z/gjud3Sp/oN6syXY6diJ3MYyRJf91nx+B
	vHfShZAzU/OH1meopJ/M87HkcwiiHjM+4w9ML7g0cQgeLnfdMIvnQ4J2oempDC2ryypgzSbO/dV
	Cua4P/xYOXYyCu9+mRwQfZd19+Ajs6sOT96CCOKXQ22DSaCFoF7l1PBx4+RsHFkzcPeheC+JMzE
	E0PB8T0Joxe3mpgjZxO/hxuti4RpCnyFXa0w0eYrTxkvbW1m4NCdMh8CYOxL9dRs3v66YLNDHLr
	FTt9Oaxxlv7J2KMHb9K064FCXpNJ9/Pdiz+5lhsxU7g001xoE=
X-Received: by 2002:a05:6000:258a:b0:439:c279:32df with SMTP id ffacd0b85a97d-439da885be0mr26960884f8f.35.1773154231298;
        Tue, 10 Mar 2026 07:50:31 -0700 (PDT)
Received: from inifinity.mandelbit.com ([2001:67c:2fbc:1:5594:94ef:1bd6:89e8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8d968sm35586700f8f.6.2026.03.10.07.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 07:50:30 -0700 (PDT)
From: Antonio Quartulli <antonio@openvpn.net>
To: netdev@vger.kernel.org
Cc: Ralf Lici <ralf@mandelbit.com>,
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
Date: Tue, 10 Mar 2026 15:50:01 +0100
Message-ID: <20260310145006.30858-5-antonio@openvpn.net>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260310145006.30858-1-antonio@openvpn.net>
References: <20260310145006.30858-1-antonio@openvpn.net>
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

