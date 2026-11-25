Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617930;
	b=TOy87umrd+HhJuj2qcDUcww2I9O1SzJqwyOWoxyUZaIOOWgwWAalGb77uhvw6yDuHaro
	 dvOo9X/kYAMKVKansf9w67w0vUBEJTaOgqTtNmBEz4DisDwYPcbLNAEL6T2gGVI2bgqxt
	 zWLCjmwkTXGFr5qbs3Flj/gCJzKM4NuHTbmtU+OBteymJkW63JfwJLKcG8njOAUB4t5sL
	 UoYXYTvpdI3g3XK//lt1HyeHKrSEAdcj7aGLCFgkh39dU1a+NOSKuRxFIvPW6lt3Qyd9c
	 daY1KFdXKiSZgoX3D94fa2Yo0eC1zXpDUl7n/lnaYt7JmAojQomBJFyYz1JipxMDadg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hznFWbWvFOaXuVUd+3ixFiuNbdML6L6UHVu/kgMSL3M=;
	b=uVpjWzWaLBEEdctzs4Aqos1OeGqwtzgd6U+xIlY4FUequ2jvXbWjDeJifuvIJ88flyFy
	 aomnCXGECWbzu5jlxQCi4dOCrU+uOIB9YNJa7U4KtVF1hFJwLXXLI6EMvr+S7fTEgaAc7
	 sr0ntFnojDlvBPBVNPD9nBxUmUBZ57LSYzkzr2mC5LuAFGUg0jY56qVYD7nZz5NZdlxyL
	 s/4l8f28pr2CoJ+5wM3INrS4KzAAfkA8wV+YOJYsBK1jALVitbXbHpU9BH6RNDnNTR/mj
	 hYGR2YOj2Zhy++S3/B23hzau8BsF4M17WDEChLyFH6qvUHLWol5k4vja6iau16IsX+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="m/qcKfE/";
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1301606A321
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 14:45:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1301606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m/qcKfE/
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-38190551625so11590982eec.1
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 06:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795617929; x=1796222729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hznFWbWvFOaXuVUd+3ixFiuNbdML6L6UHVu/kgMSL3M=;
        b=m/qcKfE/GXu8G+yiXOSULJHlUG62GMnvxJ5jcZv/Z5AJkOKAoM3rUyywvGTps1ClVf
         54na3AyT9L+QXeBJeNQy137zdOaUDZ5yF4actVJDyH0LLywOfuQYMPnXh7CQGwU2APTR
         kJfF5B7CeG6ZhqLforOavDqRg8Ejex5fDJT7yutI58syJ/Tuq1mpoGpaKYueTa61tIr3
         UXNuyYcUZr8p1MpcUZQ7Bcp0qioW0orOhFoMkkmPR09954IyLZVHqMN/MBVrk6E2l4X4
         6TaneeNB/VasWV0NlIr0iHNQe9tQEjU1Lr7jcEwR+NJMZKz2/2JZJU+XNUU5ZASit3ey
         cvdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795617929; x=1796222729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hznFWbWvFOaXuVUd+3ixFiuNbdML6L6UHVu/kgMSL3M=;
        b=f3b6CEZ1wkUSQhq99d7gMuIeyKY0AY/MddjLhktkqXYi5EZaXrw9cfhEtbjXpOhDxu
         l4HbCmKNQxwNfmthPH9r8JuaTCWSlntpHn5Z9Fxl6DqApy4ZdetmjZ85t2QaJYfYKHse
         k03tyDodsJtq9jW+EUjOSKeBxDaUdxY+kN0HGQXzci5n+t+tq3aGqVQqBVC0PO0zjfNv
         97OCokSjuOP61kJrSuoGIVB40FvH+4QgFSQjrICWhxxsgdRoVlDbPi65/L9SqjkFvrMi
         nhc4oJgGHtG8QfatZwcEAioRMtiGfjUTd9hgMSkSn5DQ6EQ7JeLeM+qgGPmxjentIbaB
         Txcg==
X-Forwarded-Encrypted: i=1; AL+hErGX6zByeB3WQkzGvs3J10ksFGztU0oDswQNrgvguunq96cRHoa7IcTWVAfjUEe1vU3NyDwyiXnjL5KckU9GAeg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8i+HM2ffskZ4yQWPFEXgroB/uyWVTAjHpWzAelWP+1bC2YeXdm
	pIgo74vqU6th5Zk1pJkWDN2aarBtqylQ76xRcGfkd/9LP9tyV7aWu1yA
X-Gm-Gg: AZFdTZey0bq/Hi+1IONYOcV7EdzVfxxmi7797SXPo1TI7x/Jy9dXgO5p65nl0dMoEON
	KDW/fQA4Ok+4zardZ2RFFu+A+DuxL20+PSBeoKQcktfzGtAJn0Nu5lhry53NTHqb/VoJu78OPJg
	Ak4tKhSXhs3f5H4sc2NbdceRcZJzS8WjBAdMjUfVvFtv21J4Pbema9dgy1KHDzbs5NdgDksqmUw
	s9jhK27AnR1bWeJBms0pWYzbo7jIrIlVW89l9s9H3NGiWPridU89mZWAZtZ97XY8qVS6+/vhW1B
	HiV83YHMeFeeioeUmwYNsL0sBlOFL8byAlkERRbWqQcyjrUHUOkC16mqVW5EvtVAj4ON4naj0Qu
	/lezIBrS/KdM/qtdHHklmt+2z9ULVBL1jCNwl/frXmue4+rFMRDsg2/9UJygnpVZ2TuB5RI5H26
	axsJ7MyxnPDVmXZNIcqStanvrwM1rVuRzCXZo6QpdtNumUYzWffsADZSD5knXztufQ5yhfclKTS
	g3E5kewmAGXIOe0Z39nm2UvvjnxcO5w/qCSCtxP2r4x/F9azrGWtydmjdNuzarLs+/3uOHGuh35
	YLqD+IoPSb8LjDr41I93w9IaWI+895mOMfm/y7y+B3expc1WrVmZcwgTasTbR/8AOZG4E2KippQ
	KbkQyoReFcvVvYGMcs6Zb4FNu67XI8bf5KEiP/U+1Uxv9QHf/Ef83h3UrC/I74l9//WnzKAj+BA
	==
X-Received: by 2002:a05:693c:8859:b0:386:b494:864e with SMTP id 5a478bee46e88-386b4948821mr7204800eec.15.1795617928749;
        Wed, 25 Nov 2026 06:45:28 -0800 (PST)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm57121181eec.28.2026.11.25.06.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:45:28 -0800 (PST)
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
Subject: [PATCH net v9 1/2] genetlink: Reject joining multicast groups no family owns
Date: Wed, 25 Nov 2026 14:45:13 +0000
Message-Id: <20261125144514.2717012-2-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261125144514.2717012-1-anilkaushikwireless@gmail.com>
References: <20261125144514.2717012-1-anilkaushikwireless@gmail.com>
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

