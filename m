Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795749782;
	b=3V3F1Apn1MuZf75xAyS0tiA1mGZWvfYKNj20Cx6HUxqIJleBFWKJ+Fp76x2O22bQfm2V
	 OKDo762zP7R+xrzu2IsVuKZ0zLhnAvjXMD+/8HgsYcS6J8aL4XSFWMbpLtrZ7+fZnFvWf
	 aLJkHLFl6Y0Yx5yLDhqHmPfBNsTIn46vohUVe5AzEgXe1T78u9Mp+GLVnBwxPSBHkPVQA
	 h+8WSg3AEvfMFhFprCzciOpNu8gGnPbQZ+EqRxpWTKKcGn9WEzRGViCTFs6uUCpC9uIR9
	 4eOesBvkmkbmkRpZneWxIHsCR4H8y2/EKujG9e0dII0J01RKRshTokXKMRIH21P3qtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795749782;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hznFWbWvFOaXuVUd+3ixFiuNbdML6L6UHVu/kgMSL3M=;
	b=v4d5JthxgFBkhybvuTQoM8mN4YdSIo8ff8V8yN9qBzzCkiA5FYHIT2IkjViR/jf/DtLo
	 /MLkhd/jwI55yBIgCztLfKfQzfPX86KdQTsSwE8ERs/OIHqBoiJzLHoIgRud45Hceh5BJ
	 GcUVINrQCwh8brrLiin09QEE3aXinIQBLN65lakc6b15y6VFcanDprf2tHJER0WqEQHbS
	 qGQafnY+JRScsGgEUnd0+RZmf4NCnz+NfaVR74XYoPFAZ6yVD9Rde3b+TjK1hiwYvJ2ae
	 95OeiCO4xGblfvx8rNQeU7p6x5/H5CUpjDme4TEetJDL69qiUTu7fFbF6TPyukm9RBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r5ZH4zGp;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DA3606A323
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 03:23:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75DA3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r5ZH4zGp
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-386cf1041cdso4347378eec.0
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 19:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795749781; x=1796354581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hznFWbWvFOaXuVUd+3ixFiuNbdML6L6UHVu/kgMSL3M=;
        b=r5ZH4zGpmH4pGT9enKvbDw5wuFmV4aPCXwt3bXPyHaHQrAfDJN6MkGIPkAHcSITBbz
         EaECUZ76dOSmLFNkCLrxd4kge+s8Za1PgyBZKoU7PLI7bw1JkpQoohfgQlKTTTJ74PvR
         lBFNkNW+9lP0RT/D0ASIDEE/bIpKjRA+cL7k30YzMcLf+cih0Ffu+e2ykhHwApjDdq9r
         +mV/iBG2jnaUYBDg7e34eBrCT9fF+TXdBGdsQQznXktgc89RKz8OfS1LpBehD4UX0+DD
         ku4x1BTi6VZv5Sytftvvw/Pz6+MAlFB80yX6ymWYc61hZA6cC200J+S/Ihk37K0+jlGI
         pLOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795749781; x=1796354581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hznFWbWvFOaXuVUd+3ixFiuNbdML6L6UHVu/kgMSL3M=;
        b=ibb2iVP1vIMLOIa7+2w9HReDQ8lXoK60oQZEdTR0Ph7ln9PQU7FEInZtNzMTyvYN9B
         yTsDwFNfmesZoHI9ni5jYXgaq1Xfeyxr/aY2KesY8i0OyNdOEtZQp6X8rHsm+pZ1jsTJ
         V3XukkW4HquN2f4muTfi7g0j4Gb+70DRzdrJmMaiifsUUWjFuCYe+AHuZ9DsVYwLMr00
         RiNQo8jn+SBmf6sdchVCMrg4G3+ko3pCA5roJEUuPh6qMwu+jrp9Ve8SfcJ+vu5jw38G
         NiBMStLP3iRgDa4RsX7Z50zLK9iZDQnrBOgLRZyXIHokjPCwkBFLiNg6reIU7kUOTft0
         4tjw==
X-Forwarded-Encrypted: i=1; AL+hErEH83SXrqy1uhWPYPPYaojh6G+PeVqK8d/90wLgfWhn34fRpQ4CmK2Hbq5pKkx3Pey+PJPsN1yI5Ys5gaTXqM8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8eoZLzI6/Yqj4s7rzxi8Qh2FCqYock7A9hoFlhqqh1AXzjhKL0
	LvETI0svROAYFKd+RGAnLNi+KB0LkxFmjAn+EUknPqLAITgB9InoT1Yw
X-Gm-Gg: AZFdTZf5JDEQtxXZem00xEHrq94xndVKZIDbfbAKhUMyBrisop0JtGkaRFT8rhIzEh3
	BQB3GJ5X/e/bAae+JwpuWZGNhC48VDi+kwXcH8e1zvsuRicOP9ockdODIqZd8Vmgyrk/9+Ho0QE
	VOCRyQkxIl4Zm6sRdjDWWvr4fKkFnBdy/Sw9RO927t7MT0CHzZse4JpmUGefIRb/cMf20sKmVJM
	c9QWp/EIbD7Yci+nBeEwuYLjDvMJJ/L3/JFrW0n8pacfnbJnen7zpYMTUD5tiltcCITSadDI2F/
	+CSW+tqK5/nKrD4lW0fmrx2Pr6rldKQYZfTT0OSQrPDwEKaiX9OhGFFqBU0CiVMu5c8m5H7K0gI
	6lIPUVuiutXrLClfxtB9E/HezF3ana5xEfUealZqhgcVFPDC02bK32iLA8P+hXJ4MxBRyhT2yUi
	jvddFT/dwgZP6MCIMInDGiiSOz172MUmBe+dgA57Q7I/RNR8eBzaskeNIQYQNxaBTZHzQu7kca8
	rL81Ew99Sds5Jf0shAxnoJnsW3To8LNZgI9UuTUG+A2JHLBNzsVehZmsSgfwUOr2bePCegnzKKd
	01ME9roj/UP7uiibA8+H4Q5dU2A4MkOb6ial+GoEpj/pbkJPlSSV+PNTSHS5YkuzkXu0lEKly/3
	m2Dyg/xS9yJelHz5kqnTOjPorYsdDGgu5kkuvhfbWjn8kYgbk0lI82F7MlDtlm7TB+cxevX18hQ
	==
X-Received: by 2002:a05:7301:714:b0:36a:7b3c:4e0a with SMTP id 5a478bee46e88-3856fd5e4a4mr23525999eec.24.1795749781348;
        Thu, 26 Nov 2026 19:23:01 -0800 (PST)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm81845568eec.10.2026.11.26.19.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 19:23:00 -0800 (PST)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	idosch@nvidia.com,
	willemb@google.com,
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
Subject: [PATCH net v10 1/2] genetlink: Reject joining multicast groups no family owns
Date: Fri, 27 Nov 2026 03:22:45 +0000
Message-Id: <20261127032246.2886407-2-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261127032246.2886407-1-anilkaushikwireless@gmail.com>
References: <20261127032246.2886407-1-anilkaushikwireless@gmail.com>
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

