Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839F735E1A3
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 01:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790127267; cv=none; b=L6VYauBXLR5/K8ptNf5avImV8+wAqdmCmfA1NPMbQKCsJ/6/LzWWJpg35I6NJX0bDbacxgKwoWS3OU25auEQP3sTVm6CHEcu5i63TsPOUJq4jAQiz58G7OMqQS4udkcX/LrM1xConXTHrBhXgGmn3YmUXd+BkNdYfMgZzAxp4bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790127267; c=relaxed/simple;
	bh=xA4WU1urp6a9IoQYp7ZKNyOjLTk6vSKIj/MoA4yE48c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fWHr1SqXNcy36oqQD4Vxv6YWgeBPifsD9aLJ8NRAKIvyhmXLfAXAdERnKfP5gnfJzXJFmf4q+wG7KiKDyskOjSng0lW+k4DnlSZ9QKvy5LVy1r8lMHBpBieCadHrmQQqpq8NE+dj5yYx1nO56byUhX6qrpvBLTEPUaBX+uDulYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W+NYEXf5; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W+NYEXf5"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33e456e7869so207377eec.0
        for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 18:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790127264; x=1790732064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rBZlZPS0y4qnYkFfYjvPWcFQrZpMybZs72GhSU2wrpE=;
        b=W+NYEXf5/fvNyrSSiNZDFAnRIWupmQrLxXO5qMZgCZIiP5F2BE6raVD2X7qUzP4iCK
         v57/Z/Ne3pmMArzL5cqEOgPLaQbOSvRSEguXHcqW52h5IlEdrA8GwbthbBNN598kQ+od
         lgHGqg0ikSX2sqUGf3qfgEmo7zi1MHZi+U8UMwAPFWOWryDuvBAiJIa0+HY7Q5cfDC4p
         rzV3aciDOeCW7Gzb0mZOElJqNOTk3isSm5OmtgduRjNvfQl+Qvrf1X/cTs4F8UTmwEMU
         Y9AcNhlFce4FSnxircw8EhFkCf/sZLFqrgD5sjGRC7wWlMbk41NyrRHI3CzJeYqQB7so
         5MdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790127264; x=1790732064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rBZlZPS0y4qnYkFfYjvPWcFQrZpMybZs72GhSU2wrpE=;
        b=qAWzqmqwXKeOmflaIoC9TLTcxtc8wK9UNSBaENpC1GbPCAgaisfWItSFmK6LEhibBF
         /d3E+fHws5lW2teebLoqPPXBHul1i3Q8fJ891mI4wbRQgEgmjomniWze4F2VtcHZRrEF
         jCSbAoFQDnEVMXKr66ZMZEclCQXMFmZ++YvqmtuUrPrrU9Fk7+1/cTZWZz+mWFv0rXLl
         lAcgXWjQ/3vYl8Vo81XVulHoFUchi0LiQ5PBeTm89iU0OsxjaLXVpct3QFs215TybM/B
         DVRqOldOp03JHvJDv1hyGShKVrytqrVnCI8IWOp8Z9JsSEoPWZRSTEwQKCjbd/Gc6XVX
         Z78g==
X-Forwarded-Encrypted: i=1; AKwUvBxVKBV4p7AjEUHjQSjOSlujRkG10Ex4oIkCapkyFtI1UtO0A7ygAKKB2IjpvxS/OE0BTyM4Ou3IcD4oJXldCyU=@vger.kernel.org
X-Gm-Message-State: AFuF++mak+ZmTWKwGAfarg+yeomkD4kksob8V51vGcU1s/furmUhE1I/
	1lJmnj/5ZXwfS4hKglKHo4GdmJuB2iyVsokuFfDAI4BaZmtrd6Q/Ft1+
X-Gm-Gg: AYBFou10IqiWX+4PDIN2AJplC31xAr3uSPgAmv8e6ozUyC0GTg3Ay9xKlV3qMLR2QvO
	iJc9/0l3WB+MFTvkdCwYXmKP5l7+Th9Wj5iDgno9WGZmZGIa0ct+Q/VfwIOvQfPGduLODxDsdT6
	295OVF6YWIiO6T5wNioRwoh5gsbbk+a4AKhkZ+QRBl65RlfWRV6kPKm84S0dei2QqAu1cmyFEaA
	pDFKbFHvB+8cib6CBYawmgMBXnJPUzoG7nxdyllNs93VbFIzSlfRYGhRNSEZSUaA47Cx8sbLDmn
	XDOi94rXqALRTozwcU36jKDJXcq2hwUJ+Iz2IoQsSUHowW1fVQGplIcO12ljHQpgfNbZQsjYlpv
	kANh0LVK49cJDhQfiM+FKIwnxNaLqYiKO15bl6FtofLK+P00iKJCKfiBqirybIoLMDfuJMJbzJ3
	Dpt3Wz1ElxLFIi23PEdi6I7jvy0peVw2LxK93YMjdGMKWjlzGFihr8uZ1rPPp5r3IXP2pdYOzbS
	8v7gVWbkg4qzBoy6F9T9t1T/nc80DeOgP8t3Xmo+GSKH5WPZgLh/GOWpOJCt3n+6Wxt1x8S0mWi
	vJC+MbFW778lj5Z8/k9Vg4kg6pMO53I=
X-Received: by 2002:a05:7300:dd41:b0:339:851c:4c1 with SMTP id 5a478bee46e88-33e5ca9fdbbmr1148155eec.18.1790127264190;
        Tue, 22 Sep 2026 18:34:24 -0700 (PDT)
Received: from lawlee-vm0.d4y3nv5wwgfelhhopdxv1tqjld.dx.internal.cloudapp.net ([13.93.150.60])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96f47d52sm2013520eec.28.2026.09.22.18.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 18:34:23 -0700 (PDT)
From: Lawrence Lee <lfqlee314@gmail.com>
To: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	netdev@vger.kernel.org,
	Arun Ajith S <aajith@arista.com>,
	Roopa Prabhu <roopa@nvidia.com>,
	Jaehee Park <jhpark1013@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v4 1/2] ipv6: update NUD_FAILED neighbors from NA messages
Date: Wed, 23 Sep 2026 01:34:18 +0000
Message-ID: <6be400e601f4ffa59e47ddb5daa33ecdd85dd88b.1790127207.git.lfqlee314@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1790127207.git.lfqlee314@gmail.com>
References: <cover.1790127207.git.lfqlee314@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Transition a FAILED neighbor entry to STALE upon receipt of an NA
message on routers when accept_untracked_na is enabled. This extends the
RFC 9131 accept_untracked_na behavior so that FAILED entries are treated
the same as non-existent entries.

RFC 4861 section 7.3.3 says that an entry should be deleted when address
resolution fails. Linux instead retains the entry in NUD_FAILED, so
treating it as untracked is consistent with the protocol model.

Trying to resolve FAILED neighbors via periodic probing (e.g. using
NTF_EXT_MANAGED) is more work compared to this approach which uses
information in NAs that the kernel may already be receiving. Note that
because this behavior in IPv6 is dependent on the accept_untracked_na
sysctl setting, this approach is more conservative than IPv4 which
transitions FAILED neighbors to STALE by default upon receiving GARPs.

Link: https://lore.kernel.org/r/20260813233344.445265-1-lfqlee314@gmail.com
Assisted-by: LLM Sashiko sparse
Signed-off-by: Lawrence Lee <lfqlee314@gmail.com>
Reviewed-by: Ido Schimmel <idosch@nvidia.com>
---
The existing 6LoWPAN override-only handling also applies to INCOMPLETE
entries and is intentionally left unchanged. The existing
rt6_clean_tohost() source-versus-target behavior applies to all neighbor
states and is also left unchanged.

 Documentation/networking/ip-sysctl.rst | 28 ++++++++-------
 net/ipv6/ndisc.c                       | 47 ++++++++++++++------------
 2 files changed, 41 insertions(+), 34 deletions(-)

diff --git a/Documentation/networking/ip-sysctl.rst b/Documentation/networking/ip-sysctl.rst
index f7af0286341c..685c84cf543d 100644
--- a/Documentation/networking/ip-sysctl.rst
+++ b/Documentation/networking/ip-sysctl.rst
@@ -3225,18 +3225,19 @@ drop_unsolicited_na - BOOLEAN
 	Default: 0 (disabled).
 
 accept_untracked_na - INTEGER
-	Define behavior for accepting neighbor advertisements from devices that
-	are absent in the neighbor cache:
+	Define behavior for accepting neighbor advertisements for IPv6 addresses
+	that are absent from the neighbor cache or whose entries are in FAILED
+	state:
 
-	- 0 - (default) Do not accept unsolicited and untracked neighbor
-	  advertisements.
+	- 0 - (default) Do not create new neighbor cache entries or update
+	  FAILED entries from neighbor advertisements.
 
-	- 1 - Add a new neighbor cache entry in STALE state for routers on
-	  receiving a neighbor advertisement (either solicited or unsolicited)
-	  with target link-layer address option specified if no neighbor entry
-	  is already present for the advertised IPv6 address. Without this knob,
-	  NAs received for untracked addresses (absent in neighbor cache) are
-	  silently ignored.
+	- 1 - For routers, add a new neighbor cache entry or update an existing
+	  FAILED entry to STALE upon receiving a neighbor advertisement (either
+	  solicited or unsolicited) with the target link-layer address option
+	  specified. Without this knob, NAs received for untracked addresses
+	  (absent from the neighbor cache or in FAILED state) are silently
+	  ignored.
 
 	  This is as per router-side behavior documented in RFC9131.
 
@@ -3251,9 +3252,10 @@ accept_untracked_na - INTEGER
 	  used in conjunction with the ndisc_notify setting on the host to
 	  satisfy this prerequisite.
 
-	- 2 - Extend option (1) to add a new neighbor cache entry only if the
-	  source IP address is in the same subnet as an address configured on
-	  the interface that received the neighbor advertisement.
+	- 2 - Extend option (1) to add a new neighbor cache entry or update a
+	  FAILED entry only if the source IP address is in the same subnet as
+	  an address configured on the interface that received the neighbor
+	  advertisement.
 
 enhanced_dad - BOOLEAN
 	Include a nonce option in the IPv6 neighbor solicitation messages used for
diff --git a/net/ipv6/ndisc.c b/net/ipv6/ndisc.c
index 90cd5d852569..12d85d7f8234 100644
--- a/net/ipv6/ndisc.c
+++ b/net/ipv6/ndisc.c
@@ -973,13 +973,13 @@ static enum skb_drop_reason ndisc_recv_ns(struct sk_buff *skb)
 static int accept_untracked_na(struct inet6_dev *idev, struct in6_addr *saddr)
 {
 	switch (READ_ONCE(idev->cnf.accept_untracked_na)) {
-	case 0: /* Don't accept untracked na (absent in neighbor cache) */
+	case 0: /* Don't accept untracked NA (absent or FAILED) */
 		return 0;
-	case 1: /* Create new entries from na if currently untracked */
+	case 1: /* Create new or update FAILED entries from NA */
 		return 1;
-	case 2: /* Create new entries from untracked na only if saddr is in the
+	case 2: /* Create new or update FAILED entries only if saddr is in the
 		 * same subnet as an address configured on the interface that
-		 * received the na
+		 * received the NA
 		 */
 		return !!ipv6_chk_prefix(saddr, idev->dev);
 	default:
@@ -1067,34 +1067,39 @@ static enum skb_drop_reason ndisc_recv_na(struct sk_buff *skb)
 	neigh = neigh_lookup(tbl, &msg->target, dev);
 
 	/* RFC 9131 updates original Neighbour Discovery RFC 4861.
-	 * NAs with Target LL Address option without a corresponding
-	 * entry in the neighbour cache can now create a STALE neighbour
-	 * cache entry on routers.
+	 * NAs with Target LL Address option can now create a STALE neighbor
+	 * cache entry on routers if the NA does not have a corresponding entry
+	 * in the neighbour cache or has a corresponding FAILED entry.
 	 *
-	 *   entry accept  fwding  solicited        behaviour
-	 * ------- ------  ------  ---------    ----------------------
-	 * present      X       X         0     Set state to STALE
-	 * present      X       X         1     Set state to REACHABLE
-	 *  absent      0       X         X     Do nothing
-	 *  absent      1       0         X     Do nothing
-	 *  absent      1       1         X     Add a new STALE entry
+	 *       entry accept  fwding  solicited        behaviour
+	 * ----------- ------  ------  ---------    ----------------------
+	 *  non-FAILED      X       X         0     Set state to STALE
+	 *  non-FAILED      X       X         1     Set state to REACHABLE
+	 *      FAILED      0       X         X     Do nothing
+	 *      FAILED      1       0         X     Do nothing
+	 *      FAILED      1       1         X     Set state to STALE
+	 *      absent      0       X         X     Do nothing
+	 *      absent      1       0         X     Do nothing
+	 *      absent      1       1         X     Add a new STALE entry
 	 *
 	 * Note that we don't do a (daddr == all-routers-mcast) check.
 	 */
 	new_state = msg->icmph.icmp6_solicited ? NUD_REACHABLE : NUD_STALE;
-	if (!neigh && lladdr && idev && READ_ONCE(idev->cnf.forwarding)) {
-		if (accept_untracked_na(idev, saddr)) {
-			neigh = neigh_create(tbl, &msg->target, dev);
-			new_state = NUD_STALE;
+	if (!neigh || (READ_ONCE(neigh->nud_state) & NUD_FAILED)) {
+		if (!lladdr || !idev || !READ_ONCE(idev->cnf.forwarding) ||
+		    !accept_untracked_na(idev, saddr)) {
+			if (neigh)
+				neigh_release(neigh);
+			return reason;
 		}
+		if (!neigh)
+			neigh = neigh_create(tbl, &msg->target, dev);
+		new_state = NUD_STALE;
 	}
 
 	if (neigh && !IS_ERR(neigh)) {
 		u8 old_flags = neigh->flags;
 
-		if (READ_ONCE(neigh->nud_state) & NUD_FAILED)
-			goto out;
-
 		/*
 		 * Don't update the neighbor cache entry on a proxy NA from
 		 * ourselves because either the proxied node is off link or it
-- 
2.43.0
