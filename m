Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32313C1D5F
	for <linux-kselftest@vger.kernel.org>; Fri, 18 Sep 2026 22:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789769611; cv=none; b=U8VjnvZrcwfpEOdGaMoPioNgzqYz+Is5CHb/+7L+Xq7UaWBZgjjkXkQnBmCMG0xNoAGxBJzlfcZRZrPDIgjU7eA7/cv9PYGEptZ2bzcsTjSaS3JswZEjroUZUc3T0fn93B1wlmQwyIrQ28OcIg5z/7lctRNHXnmfkoIU7uM4Qh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789769611; c=relaxed/simple;
	bh=lMhWyqDKU8tuhSb63S6z46HY7Dg7FOFh3EIVXTTzpPw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KPKLlN/3nmzbu3sbwX6xG12tT+vU+9h6tPf9ozzDQ1/fEyy1AtWaEvMUrvoXYff/2DWfsVn5WRBUykTH/fDm6JatOjHIGsW6CTQVCQedb6JQwgn2rNtLqZcKGrlBDobr3xow6idvGXC/0+IKedDI/8d1jFIkCfymvyRKjTMaOPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lF4qAbm/; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lF4qAbm/"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2dd1dcdcf95so9063065ad.1
        for <linux-kselftest@vger.kernel.org>; Fri, 18 Sep 2026 15:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789769609; x=1790374409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eOwaBnnM/eJvrLcA+Skp3S3cmP/0pzGWTCv//0JXzxA=;
        b=lF4qAbm/BLdITdpanQGFmjZhWxCS3ksn889qJJr+BiqHSqZZzuIoMTd3HOPW7nS5CO
         6+XShZWVhtBG/73n33Vz2Z7b1GNZlK09jqSwUs2U8ZYWKYxqchbqOCn+ldzFdP+Low1E
         dmLE0IiO3i0eD5HfmducbY2BhGDtAIv2XsUlFX7M2XRPaID3f+bDUbYwY/u0XZ36L2D2
         wZ3H9ZoX7GvcEFaRvFY9ovUmWp+tRYDT6IqSuBwRljOLdKwSLMh0JSmoUaIoWTlAeqRg
         oOulOk+m/+msi30+uFQu8Fl4ahBJnGqmk0eXT8vabCKM9pWQ0FOSsqF0fBfPrFkhkAqD
         WW1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789769609; x=1790374409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eOwaBnnM/eJvrLcA+Skp3S3cmP/0pzGWTCv//0JXzxA=;
        b=DGu574Ri8+GYbnMXFspcvvNhReITwLucMVoVOZq1cSQTkJeUx4VFYPJYMXGDS2zMtj
         XejjR8QWFFrvFAbGVYBB9ngTqAzu6K3cKq7lSsepMJbKkkqeljfFiNjXYawtdiVGC147
         sDUD9t2t4YZIdoi2JqGoqqrgMaJK9l4xjsAno/2EpAGkI5Vo4aRY14Xjpczi9hTZshcv
         Ets1BE3n0LlipoLVGim43L4Z5oBwiwgvjUt4vBRWC9/EnPTJeADS/3ILLYaOyhmZH9Ze
         tBj1ffEHMnKhzVyKWLoHH5e8vNB8FDrWYHEuxIwNVCa48+9+p3tuaClggRLacfonsQB7
         C6Kw==
X-Forwarded-Encrypted: i=1; AKwUvBwVq5DFsvmyTbnJM6ztB9TG3zpK/ws2XDNyghLDYOcaiZ0qPC5snhtNZXWiBIUqKAXXWQahzmBX0Ma4C2g/Irs=@vger.kernel.org
X-Gm-Message-State: AFuF++nK3h5nJFCz8HMiTR9OScnAJM19tDjR0HA7lV0la9V4e5gKmZ2+
	8yAMmO6LbxS3JZPy9OcStchwk+Zh1lWzf3HyeALAW3DhhfPQapiXv2+4
X-Gm-Gg: AYBFou1PtxXqgtsBoAbTY0G+Q84ilamxBkQcbL8EE/yluMKyjFsK8SwPamdZ2CdSAWA
	ZIQh/QJho52y7l262UoBBhFRUql/x5k9StJQAS4DSleO0cXghUct12XybqFSEA9/K1cJhR2KkJY
	jUgYm0hGFmiGH3TGxSrNWebNUKQujyns7F4YSjK761UxiWvZcMV4Nha8p56CtsAt4tVkWXaO82H
	5ZYOh4aOvMXQhOlbBMBVcgquE3NHhTccdH/IMWOxP7yqWLNQELTzsClMxQPrYjCD1f4MuKpNevy
	V8OGCwdTbqJSlfpNoPydO3HLUVZF3hWj0yewOWlxG04UhRA0T9N+tTE/zc1c+JoW+QJFfNA3xVA
	hmM3MGDan/h7bVxo6ZZ3R26ObyitIxGPR+/zxO2J5Z+aGpNWYHp4SitKQQxBpIvDLGsAxSB77Xz
	210zzUsbBt+7KswGCzvCRm3IsHVldXqbWIlQrF9vr/PjfEOLpcJ0bWduLm+8F5OrI/haJcBG10e
	mHiM8VN76iRq4OaPqWfS7OwX0ZpX1spQHz5KgmBuq25jJmspeD9sWbgPX+QBCuJIuXSwNcs+Uhm
	d96Coe95/SbAlgw0Hqqj
X-Received: by 2002:a17:903:1103:b0:2dd:ad7d:72e1 with SMTP id d9443c01a7336-2ddad7d753amr64644185ad.24.1789769608714;
        Fri, 18 Sep 2026 15:13:28 -0700 (PDT)
Received: from lawlee-vm0.d4y3nv5wwgfelhhopdxv1tqjld.dx.internal.cloudapp.net ([13.93.150.60])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3311a716sm1553671eec.8.2026.09.18.15.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 15:13:28 -0700 (PDT)
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
Subject: [PATCH net-next v3 1/2] ipv6: update NUD_FAILED neighbors from NA messages
Date: Fri, 18 Sep 2026 22:13:23 +0000
Message-ID: <e5b7a4f8cbd7c436b463b3751bf283ce861fcfaa.1789734885.git.lfqlee314@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1789734885.git.lfqlee314@gmail.com>
References: <cover.1789734885.git.lfqlee314@gmail.com>
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
