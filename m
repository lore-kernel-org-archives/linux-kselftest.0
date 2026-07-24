Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCB52264C7
	for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 00:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784852801; cv=none; b=jl+Pf54ithsWoJH7HKLr7gjHoPkOv3mApGhi52BDF2TX089/PjcyUXqN7pQd/JqCSr8PjEb0fJcEPEcM9cZp3+qwF+36bcJnwZtU/C6pkP3pgHO00uCCrKcotrHLNF2n/zSSJaK+y6iTXqCIoSKy71+A7ZY007Zjfdv1nUcr63A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784852801; c=relaxed/simple;
	bh=Y8m14ZiW3FIOXzIy/0oNP6Yh9pxqiAS2i9WSjouqhuo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g2qZyRG5hu/fozvIbzP2ElLDhPbvAGg9hbSosEiIJcDfv+1Byfqvy4xB/TRES+Bd7M5PeGdZJWNAxFvyOUjtxDdocAauTPHBYw477OrC7AnKayzCgE77LpnSSWa1tYFX6pt3Q8FiZ/afiAsVY5gWE8HVRUuNMTBSe7+KcEXtJWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eqFwihHM; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eqFwihHM"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso5236455ad.3
        for <linux-kselftest@vger.kernel.org>; Thu, 23 Jul 2026 17:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784852799; x=1785457599; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j2zEeDwX4PMlG6t5dUWfFB3pMunViMfp5OcD9oFjtjE=;
        b=eqFwihHMV5pGULlGBWqLgNF+YR2zlRLTgu966pbyZmSHK/aS9wYq7wIO4bSXgFoXdx
         8Z6eV81cD6Rg/5G0JoBRQ7pUDMkgbXMoyWq75nCLzrl3uKvEsr9cesf1VdpZbuwJBpVi
         30HqFLo1p6UiwhczCaGWLjrSr5opcOopWabd9Z6X35evsvvdArFfLrOYPyx2hveFGydM
         0y2wvobJzg7deKYF9pTMSr8C0ElHoeQ+KddAqejaFKOZi5Gs/CSfzAP+ffddOxx+CB6T
         lqTdxmbwMtiNRdIX3tsEHzzuMXOdrkcdrFl/5KJdXJkexAkBX2Rf/jYVSwglwB25TrYe
         Xy7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784852799; x=1785457599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j2zEeDwX4PMlG6t5dUWfFB3pMunViMfp5OcD9oFjtjE=;
        b=mkuz0gLvYSfBSojX6N7inq1ZXVunCPcdmBVtqRUrAHsYfxihXXDHKIxy2KtVe2J1Yz
         Ry4J46IvLykXOT6WrupN5PAGCxiJLLrBBVpVtaEk31RhXW3VCHESVsP1vpgRbjP8U4Mj
         WvVoXwtcWZK/xFXYalQPZeZiJlN4M+3PIInjClO8EwuYmssVsGUgB3MLswkdAYIiYrim
         9b5YJnQ5jvL+r/c+cFLlVwJzntSVH0UGD0AK4CkRBejpNG01LvrRXbyOn52aRd1e20Di
         6QJEEbWrDsLmjZiqI0mFcz5hoGo/S8MyMEbMnsjw02WNen5ZtLC7pn49zImrrbtL81jk
         zd8A==
X-Forwarded-Encrypted: i=1; AHgh+RqSJjrhy5cXkRgght0Zs9LqKNNHAwzUDzCyOjytk3gAW5apt7id6gNolrip5dG1tCxhbUblRfSQ7/+frpOQgTY=@vger.kernel.org
X-Gm-Message-State: AOJu0YytsYRiZwRGrXlnj6xcyIO4ei00v8/zp84QvxHWIAHBsDPQfWdP
	+vvXiR3q36rjjl6v6PFYYIREzk0+LCKnv30u1I6UotzY7n9jqnlXUFCl
X-Gm-Gg: AR+sD101TVKS50j7uULo57VFtiFwQp3UE4mesa0kmelXGl5p6fHbujgi38O6ftEsS5U
	tGh/tW0b3JY/Ul9TNaOXMSvpQQi/p+WW5JHsjzMr29nN1aMa4dgM2+RuvaLdwBUAUZ9FvS8ICKV
	TpV8OkbiE0QLA6JRYEcSTiE9LrmjU4ssxeTdyIvjWASq2lvongL/3Qqu/7l87Vg99f28iduVtMb
	mb8DjzBtU9Lnpqs1eTtrQ/NEsiY3cvSOVzv3Vgy2uqugiHzWdpzYp3z1g7a5xdi/bpY5dL5dlU5
	yg8UUfja1+y0aGT+PysS45hToH1NwhZVlXHDsoQP7ecUNkZirPchb6MDl846UlSS/DA4he0XNWv
	yQ53a6SGfi33xbv+crmn6/jq12GiEjXKfmuKum3T4jG6+G+NbPw45bo0J5lF/VHKvsfdNiMgewj
	Z15V57Ku/CK0ao9BFkXzKNqPojxQ==
X-Received: by 2002:a17:903:2a86:b0:2ca:6d2a:871 with SMTP id d9443c01a7336-2cfa6c884f1mr61710555ad.37.1784852799457;
        Thu, 23 Jul 2026 17:26:39 -0700 (PDT)
Received: from CPC-mjac-HKWGEZ.localdomain ([70.37.26.40])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efd76cfsm42343205ad.20.2026.07.23.17.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 17:26:39 -0700 (PDT)
From: Jack Ma <jack4it@gmail.com>
Date: Fri, 24 Jul 2026 00:26:17 +0000
Subject: [PATCH net-next v5 2/3] vxlan: honor per-nexthop fdb destination
 port
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-b4-vxlan-fdb-port-v5-2-cd1c6aeee058@gmail.com>
References: <20260724-b4-vxlan-fdb-port-v5-0-cd1c6aeee058@gmail.com>
In-Reply-To: <20260724-b4-vxlan-fdb-port-v5-0-cd1c6aeee058@gmail.com>
To: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Jack Ma <jack4it@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784852797; l=2289;
 i=jack4it@gmail.com; s=20260712; h=from:subject:message-id;
 bh=Y8m14ZiW3FIOXzIy/0oNP6Yh9pxqiAS2i9WSjouqhuo=;
 b=z2Bu7o0Ky8J3lYVyKg3slZEx86Hq04M+zbA7WACZm1jDt+F+2zNpYv0uY69deS8pbCxVE6LPE
 yIvD/lyOOG4CRBq4j8aA6TUe/DyvzErg8Ubh933S6YzfvrbHbeoetxK
X-Developer-Key: i=jack4it@gmail.com; a=ed25519;
 pk=x8xh2Md9yNDil0xBOA9WA/oqC3O4Eg4rdlIul4YUktU=

When an fdb entry points at a nexthop group, vxlan_fdb_nh_path_select()
resolves the selected leg's remote IP but leaves the UDP destination port
at the device default (vxlan->cfg.dst_port).

Extend nexthop_path_fdb_result() to also return the selected nexthop's
NHA_DST_PORT (0 when unset) and have vxlan_fdb_nh_path_select() store it
in rdst->remote_port.  vxlan_xmit_one() already prefers rdst->remote_port
when non-zero and falls back to the device port otherwise, so nexthops
without a port are unaffected.

This lets one fdb nexthop group load-balance a flow across legs that
share an underlay IP but differ in UDP destination port.

Signed-off-by: Jack Ma <jack4it@gmail.com>
Reviewed-by: Ido Schimmel <idosch@nvidia.com>
Reviewed-by: David Ahern <dsahern@kernel.org>
---
 include/net/nexthop.h | 4 +++-
 include/net/vxlan.h   | 5 ++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/include/net/nexthop.h b/include/net/nexthop.h
index 7673aaeff3e28..f86c115074d7a 100644
--- a/include/net/nexthop.h
+++ b/include/net/nexthop.h
@@ -576,7 +576,8 @@ struct fib_nh_common *nexthop_fdb_nhc(struct nexthop *nh)
 }
 
 static inline struct fib_nh_common *nexthop_path_fdb_result(struct nexthop *nh,
-							    int hash)
+							    int hash,
+							    __be16 *dst_port)
 {
 	struct nh_info *nhi;
 	struct nexthop *nhp;
@@ -585,6 +586,7 @@ static inline struct fib_nh_common *nexthop_path_fdb_result(struct nexthop *nh,
 	if (unlikely(!nhp))
 		return NULL;
 	nhi = rcu_dereference(nhp->nh_info);
+	*dst_port = nhi->dst_port;
 	return &nhi->fib_nhc;
 }
 #endif
diff --git a/include/net/vxlan.h b/include/net/vxlan.h
index dfba89695efcf..6e64757151b88 100644
--- a/include/net/vxlan.h
+++ b/include/net/vxlan.h
@@ -567,8 +567,9 @@ static inline bool vxlan_fdb_nh_path_select(struct nexthop *nh,
 					    struct vxlan_rdst *rdst)
 {
 	struct fib_nh_common *nhc;
+	__be16 dst_port = 0;
 
-	nhc = nexthop_path_fdb_result(nh, hash >> 1);
+	nhc = nexthop_path_fdb_result(nh, hash >> 1, &dst_port);
 	if (unlikely(!nhc))
 		return false;
 
@@ -583,6 +584,8 @@ static inline bool vxlan_fdb_nh_path_select(struct nexthop *nh,
 		break;
 	}
 
+	rdst->remote_port = dst_port;
+
 	return true;
 }
 

-- 
2.43.0

