Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794832847;
	b=kQm6pDgHKv9XqBz2/9A/VTy//H/4YW8ibre7pO5F1haPLsDst5s3eg0VviaWV26VEDIt
	 GI2cfrwcEyZf2+hjzhv99s0u3DBomw8dREz9XQCIQp9Gnmtp+6U27XScoU5V7hAoac5qs
	 R3PAZICuzIvXrqVX9aFY4VcpsRXgD/X2awd6YBmMz2kTex/KIiXwOvjI2rlWSvXh+EreY
	 QCfgTNCvxEnEGO4p4MrshPGATOLKXYODnYM9P7i6K2knesiVYGGC8EqxloMEj8i0OkRIF
	 cg9YjtAOi0wTMw+spKkyzFVCctnnKJ0+k7y7ZXcLC8PwAlFpZo36W8qIKWRQIDbB2tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794832847;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hznFWbWvFOaXuVUd+3ixFiuNbdML6L6UHVu/kgMSL3M=;
	b=XgxOxLH1WwBOutXOONk4DkwRfkTMSSZZjgtfOisx24nBdXXuBj2032KxbDGhe+fvjs56
	 7pAyrJFZyMrBT63tTjLA8qLo8+PjrXvhQjffLOCPbwXe9Svij1OE0Ky/mF5DaASEQLb0X
	 Guv12MHHPrr3Jcau2w+wed685SawXX+VSJ9BxviA7qyu91L4+sRcUftRr1w6J6CSFNP8h
	 s/Cw87PfF8iYFdZ9fofhVIjn8ZK470bXhVZ7YpkAF4GBsCZtDyxpE2zz8OvFdjqagjw+J
	 aVSvp977Bvid8EuROIOWJYOB3bCb1CkP3GI6gBGQk8Ec+vaTHF95iZ0y2tayvQpBCAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="h/mUxU8i";
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BE7606A331
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 12:40:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0BE7606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h/mUxU8i
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-844a8bf7e25so3062943a34.1
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 04:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794832846; x=1795437646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hznFWbWvFOaXuVUd+3ixFiuNbdML6L6UHVu/kgMSL3M=;
        b=h/mUxU8iT5smy/Nn3/TImjg0PoArS74qd8+QGBliY7Qu+r8ZahiepWhdAe+dWF8FY/
         RsE7FXfC4YyF0zNfa+rJ1fUQ1bg6Tw3KtvLYa47LuoDp7oOmpNRr7n9IB5kqKawpZ1wQ
         7Ewl7FpCFtkRWsB5H6dfXRQt4JWhVYPuNyAQAVc31HEPdH3ONmSIZ7T5yCqxajo1Ky/R
         10rXRQQ0NDgMrvyBZvDw97pz0+Awos07NBYeaN/elymWk+aER6GgjIt37xWKGSyWVcdN
         adJ11onhhPuvH06pPviW885hm7lTGi2gA86v+w6ZLLcToPZz2zaci1bYYlNO2T6lh/SX
         704w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794832846; x=1795437646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hznFWbWvFOaXuVUd+3ixFiuNbdML6L6UHVu/kgMSL3M=;
        b=UEtzaSIfNjcG2WSoAmgW189bZQLoPVtSNKCa3NjJ7/u5iiwIZYwmjkulaTJQjqmiKl
         1w2VDLhZOr70/L8+ye06TixcQwsgYWKswiV8/0FgJpBpnGyQbzuunGZ1oXWJE66YzQOB
         u5OYt5kLpz+FbarVxnAPI9kRsI85BLuc1pKbTsOEem7Tu/3Xmit0ISuhrGqtarWqrJQS
         MktQgbXM26ENSZXTZZ7XHy4bfr9Wyu9qAWM01hUuag75J6cnEJ2kqis15H/i1KFkZuvM
         o2yEfP8jsp/DIA80oAFcvs9NRwTbhXZdI/4EQ0PC94J+2DGWTWhcrbBx3y2g1X1MEYGh
         pDtg==
X-Forwarded-Encrypted: i=1; AL+hErEaOkz4OJL+zCHAdfBZEgbuQlp5vHxyevv/BYs/UQlIqn2XXC/D+8fNy+TZjELTglu1bV9nCaWjreQxpTEJugc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5ImLNkzW08+CsC07Eqf+3Wn26f1m4ozoLKTfXyJ+HYTuFDfSz
	wnPC4uHzddndOku9JwIaFJL9aWG494YHk6nqRBM4zxufW9lA0PtXKaxv
X-Gm-Gg: AYBFou0dAJJ0XNhePw4ZohRg524Je3B0H2m539VfSXnkA6Ov7W2PH0jTHMl/XC/dMAd
	QbPvQ62c0btf2nLSxC9oQuPu03QVKKehIiiLQzwg1W14+H/GfvfLqPzyp3V32dTQlgebcFZJfFk
	jiS70W3ItBvA4wUhzkXIfO91j4pRZH+h67JDVMA5a0MB2/XIisnIE4b/PdAxmix9avr7JohCV9M
	Zo3FjbAv3GFGF/axer7LTbFoAKsdXNiArCGnou+FEm0ldWdNdWJ2G+kc63CxFGHOp1p2GUAolNO
	gXhgvmxnKo8j+C246w9qOG1EoXCnLvCCTlAswaY4z6kvrz/xxG5meM+2MbPp065WHrH7P4fWXBo
	mvENe29lsYj7bxjtkXxCLDSbx0YdI3xFOjGt+VqDp/ZAzem2AYJQAjPTL6WTqA1V3MOrHivvpH3
	tTQArB5mTT+gEnQDa+vDqcMJrCCyMY9SOFZU6o2La+T2ALcbr5Oxg/54obupZRFkfz/oX+ZoonS
	mHPSHpoRsxEVP73WsqOQM5U88wEqn9fBavYfjmCjjb5ZxPxsCp5o/Hp7yAqzWFhC7NmlNSw6ahw
	HfsUR+doR/GXTNNsArAO0CZa9VIQ1l2ru8oJYNho3HKSLxDGvi/oqj1ev5OG1LXBaO0r0tZBDqY
	t81un+DV4v4Wzv2E2fAIpNhBz5b+h6pTfDFRXJfU/HGfi7dP15VKNAjiJ6e59huXkiQgWrEFhwA
	==
X-Received: by 2002:a05:6830:2b0e:b0:85f:c55:b0e8 with SMTP id 46e09a7af769-862898287b3mr8933968a34.5.1794832845686;
        Mon, 16 Nov 2026 04:40:45 -0800 (PST)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862c4dd9abesm2830937a34.20.2026.11.16.04.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:40:45 -0800 (PST)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	idosch@nvidia.com,
	nicolas.dichtel@6wind.com,
	jacob.e.keller@intel.com,
	jiri@resnulli.us,
	fw@strlen.de,
	martineau@kernel.org,
	v3rdant.xiang@gmail.com,
	aliceryhl@google.com,
	linux-kernel@vger.kernel.org,
	nhorman@tuxdriver.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	anilkaushikwireless@gmail.com
Subject: [PATCH net v7 1/2] genetlink: Reject joining multicast groups no family owns
Date: Mon, 16 Nov 2026 12:40:29 +0000
Message-Id: <20261116124030.1595567-2-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261116124030.1595567-1-anilkaushikwireless@gmail.com>
References: <20261116124030.1595567-1-anilkaushikwireless@gmail.com>
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

genl_bind() checks the GENL_MCAST_CAP_* flags of a group only when a
family owns it. For a group ID that no family owns, it returns 0, so any
user can join it.

A family registered later can get that ID, and the socket stays a member:
nothing checks it again. An unprivileged user can join the free IDs, load
a family module with CTRL_CMD_GETFAMILY, which calls request_module(),
and then receive the notifications of a group with
GENL_MCAST_CAP_NET_ADMIN or GENL_MCAST_CAP_SYS_ADMIN. For example the
drop_monitor "events" group always gets ID 1, and is free until the
drop_monitor module is loaded.

Fix by returning -ENOENT from genl_bind() when no family owns the group.
There are no group flags to check before the family registers, so this
applies to privileged callers too: a program that joins a fixed ID such
as NET_DM_GRP_ALERT before the family is loaded no longer gets its
messages. I don't know of a program that does this. One that resolves
the family first still joins. Say so in the comments on the static
IDs.

bind() takes a mask of groups, and most IDs in it can have no owner. Such
a mask used to work, so keep it working: netlink_bind() skips an ID when
the bind callback returns -ENOENT, and joins the others. Only genl_bind()
returns -ENOENT. A skipped ID is not joined, so it is no longer in the
groups that getsockname() and NETLINK_LIST_MEMBERSHIPS report.
setsockopt() returns the error, as it asks for one group.

This does not cover a family that is unregistered between the check and
the point where the membership bit is set. Hitting it needs a
privileged module unload at the same time, and the capability check
already has the same window.

Found by the Sashiko review of the gtp multicast group fix. Tested as an
unprivileged user who joins all free IDs, then loads gtp and
drop_monitor:

Before:
  joins: ok=62 EPERM=2
  gtp/gtp (ID 15): member
  NET_DM/events (ID 1): member

After:
  joins: ok=19 ENOENT=43 EPERM=2
  gtp/gtp (ID 15): not member
  NET_DM/events (ID 1): not member
  bind(), an owned group and free IDs: ok, member of the owned group only

genl_bind() was added, with its first capability check, in the commit
in the Fixes tag.

Link: https://lore.kernel.org/netdev/179324692107.3134.14443689892607921337@kernel.org/
Fixes: 4d54cc32112d ("mptcp: avoid lock_fast usage in accept path")
Signed-off-by: Anil Kaushik <anilkaushikwireless@gmail.com>
---
 include/linux/netlink.h          | 3 +++
 include/uapi/linux/net_dropmon.h | 2 ++
 net/netlink/af_netlink.c         | 6 ++++++
 net/netlink/genetlink.c          | 5 ++++-
 4 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/include/linux/netlink.h b/include/linux/netlink.h
index 882e9c1b6c1d..b4eb873850e7 100644
--- a/include/linux/netlink.h
+++ b/include/linux/netlink.h
@@ -48,6 +48,9 @@ struct netlink_kernel_cfg {
 	unsigned int	groups;
 	unsigned int	flags;
 	void		(*input)(struct sk_buff *skb);
+	/* -ENOENT means no one owns the group: bind() skips it and joins the
+	 * others, setsockopt() returns the error.
+	 */
 	int		(*bind)(struct net *net, int group);
 	void		(*unbind)(struct net *net, int group);
 	void            (*release) (struct sock *sk, unsigned long *groups);
diff --git a/include/uapi/linux/net_dropmon.h b/include/uapi/linux/net_dropmon.h
index 87cbef48d4c7..4f2fee982c8a 100644
--- a/include/uapi/linux/net_dropmon.h
+++ b/include/uapi/linux/net_dropmon.h
@@ -58,6 +58,8 @@ enum {
 
 /*
  * Our group identifiers
+ *
+ * The group can be joined only after the NET_DM family is registered.
  */
 #define NET_DM_GRP_ALERT 1
 
diff --git a/net/netlink/af_netlink.c b/net/netlink/af_netlink.c
index 69bb951b5fb8..ee573ba6396d 100644
--- a/net/netlink/af_netlink.c
+++ b/net/netlink/af_netlink.c
@@ -1033,6 +1033,12 @@ static int netlink_bind(struct socket *sock, struct sockaddr_unsized *addr,
 			err = nlk->netlink_bind(net, group + 1);
 			if (!err)
 				continue;
+			/* no one owns this group, still join the others */
+			if (err == -ENOENT) {
+				__clear_bit(group, &groups);
+				err = 0;
+				continue;
+			}
 			netlink_undo_bind(group, groups, sk);
 			return err;
 		}
diff --git a/net/netlink/genetlink.c b/net/netlink/genetlink.c
index 5cc1037d4917..e5d4f3c4e22a 100644
--- a/net/netlink/genetlink.c
+++ b/net/netlink/genetlink.c
@@ -85,6 +85,8 @@ static DEFINE_IDR(genl_fam_idr);
  * cater to that by giving it a static family and group ID.
  * Bit 18 is marked as already used since the PMCRAID driver
  * did the same thing as the VFS quota code (maybe copied?)
+ * These IDs can be joined only after the family that owns them
+ * is registered.
  */
 static unsigned long mc_group_start = 0x3 | BIT(GENL_ID_CTRL) |
 				      BIT(GENL_ID_VFS_DQUOT) |
@@ -1825,7 +1827,7 @@ static int genl_bind(struct net *net, int group)
 {
 	const struct genl_family *family;
 	unsigned int id;
-	int ret = 0;
+	int ret = -ENOENT;
 
 	down_read(&cb_lock);
 
@@ -1841,6 +1843,7 @@ static int genl_bind(struct net *net, int group)
 			continue;
 
 		grp = &family->mcgrps[i];
+		ret = 0;
 		if ((grp->flags & GENL_MCAST_CAP_NET_ADMIN) &&
 		    !ns_capable(net->user_ns, CAP_NET_ADMIN))
 			ret = -EPERM;
-- 
2.25.1

