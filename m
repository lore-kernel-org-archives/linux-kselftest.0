Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E84643FD0D
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 22:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784673004; cv=none; b=XOBh1YXt5BEBg2xqqEI6HlDONftQU7nVomfiCNdmfXx93DlIOx0vVVEGu9zfiwUcRHlfU2Z6pw3kexSzIe3quXz46+BjypjCtmuM82UaTDt8LXJrJqSyEAEV/tVa2R19m5CEChBp9QwGOHH8+8AnZ4seN2cJhXWzIjSgEigtf9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784673004; c=relaxed/simple;
	bh=FxAaKZNrqIYMFVFz0kxYus4A4eLSft8cn0LfWd09iUQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fHEAqpfQU7F5lh/Nhdg8n7mAvcZwkAsKzdL8xFpXivcLMh5OhdLZEwLDtpvC5qMPzZTeh0Qpi6+u0rrJ/ycO865IwvrGldNULSx4Uu3Oe5WaBhZgN+30Kzdq9op9z+CWTkabdhkiRz6xVscAsm9MqlnFximXxuzViBVI7Fds7CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YDbkqWYl; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YDbkqWYl"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso133491985ad.1
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 15:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784673003; x=1785277803; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DBZyOnBzaFrr93xN0hje2B80zLLVKQ4FJDvNO4Frc1g=;
        b=YDbkqWYlj686Fp99HZKHs0WazBQymjQxVrdy479Bkqg39eX8zhYDCf47OABEjjT3EZ
         qICR2Ct9MFQbL5npbkPDhYKK4VtH/YYNuiub5ZAXSTFhogYm+ENW2l2oxabItOPzCbbg
         Vs4C0xwb3GMs5qUmWYWdanTzosG1AA2nTzYEfo9wOuE7YiEQmXkEhoxaBKJ+Rp1ibAsO
         ZeNTH/A5HkfQWDyhpmAqNL4dihnavOWTSzBdSmRci12NMutnKNU0ghkNkTTrlPmJ4udc
         h53Ga6kC1eP7Bmymfu3k5cQvND4Z1GbtpK9QXah4ipXeNWOMRKh4H1qOahJfWYNwt+EK
         YZAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784673003; x=1785277803;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DBZyOnBzaFrr93xN0hje2B80zLLVKQ4FJDvNO4Frc1g=;
        b=biKRR++0QReOBzXS6xwShLSMp/BLSk9xtsYfZgRVebOJW4FMXlAtLA1Y9nMLucgPUa
         8OI9n/YmhKErfBn/lASxiDvFT5k5pxgfhGQykXyc+BoQAtMlY8J2iexUBcZ9b2GS+8Vu
         jCcLfxCb/Z7rgCxycqIQnSdPU2Gsb/vmS2CU2mLpUSl8N4GlC5NnvOgqh1n3UJ6Cog1b
         Y1xxkXzvo/qdvIEpg20ICMCTMnl26oy7+5uB5TP/aD+HaVI9vAKKMjf2RSGDsv8SL1TN
         WdYPh7F0e6tg7A7gVT/QRlJ/tuqf4driGREQT4TJ7C53qOzv5IL4nqN9XV10M7Qfuv1V
         FH0Q==
X-Forwarded-Encrypted: i=1; AHgh+RqM6KX741DqO7ILllmwLKB3Ndecy8w1wQYrMu7eRw55Vv8yOp4Nv5djP1PLALdYl5xchFiOAL+wFyi5Q/Zddlk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzavx/0rdf5qGuk3qA1QbQgmrMqFhsM8It/cf7u1JCATZ6Wz8ZL
	FMrGlYoOpL/OdlUBp95aDU+74Io1MFOuLJVI1kJPmbYTTLeRtc4YVBlX
X-Gm-Gg: AR+sD11Lvq6k5FvXaL/HE0J1xeC5graU6L6VpDtJYyLIPcIpW/saVLZdMuzKcuz9uGV
	Wg2PBVzOvjVgjHaOBZQSgK5EpXFGD9k+bd9K56/2ewiS5DpDQHUEoAGvaZZaY/GoTQlEsKWGlwN
	IDaDV/XcMXY9lLsa+GBx3BmmDpRYtXE0+raJoR6N60mweMlq5fSHuREfiEe3d3Q5Xo10OfSq9Mq
	ol2uGNS7RVB1z1mLpljQzenRS+tvNnk27e8UO2GJIekRCAb72km4h22TJ99hZefV2Hdrd8XL97y
	ELsV83wVA3Z9UJ4e6HUTadTJNxJnuhWMKpfdSnfX+qkv+QNtJGi1Vbh8U+0Au/eK4V1rzEsqfiu
	RuyvC8BXvObPab15qvA7mQkWhyOHPx43AERG86Hs0a/kVCOKj1GcPVBwesyfqA4zF/47uiOyEq8
	neD5xjn+sjesVUFvc=
X-Received: by 2002:a17:903:988:b0:2cc:f5aa:9513 with SMTP id d9443c01a7336-2cf34821a87mr233529595ad.10.1784673002699;
        Tue, 21 Jul 2026 15:30:02 -0700 (PDT)
Received: from CPC-mjac-HKWGEZ.localdomain ([70.37.26.40])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efde5cfsm3787685ad.31.2026.07.21.15.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 15:30:02 -0700 (PDT)
From: Jack Ma <jack4it@gmail.com>
Date: Tue, 21 Jul 2026 22:29:51 +0000
Subject: [PATCH net-next v3 2/3] vxlan: honor per-nexthop fdb destination
 port
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-b4-vxlan-fdb-port-v3-2-9aa0a543a78a@gmail.com>
References: <20260721-b4-vxlan-fdb-port-v3-0-9aa0a543a78a@gmail.com>
In-Reply-To: <20260721-b4-vxlan-fdb-port-v3-0-9aa0a543a78a@gmail.com>
To: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Jack Ma <jack4it@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784672999; l=2191;
 i=jack4it@gmail.com; s=20260712; h=from:subject:message-id;
 bh=FxAaKZNrqIYMFVFz0kxYus4A4eLSft8cn0LfWd09iUQ=;
 b=TpM/CzrB56PS+2og2O88NqgEelFcCWHLRmmLI+3lhGXZM4Fq3vAjkzu4rskxzu3jPSMf+HO/o
 2cxKb8SeSpFAZ9tQ/19VTWFsy/w27NYb7s6NZHscCYs1ojq6HU3Ov8d
X-Developer-Key: i=jack4it@gmail.com; a=ed25519;
 pk=x8xh2Md9yNDil0xBOA9WA/oqC3O4Eg4rdlIul4YUktU=

When an fdb entry points at a nexthop group, vxlan_fdb_nh_path_select()
resolves the selected leg's remote IP but leaves the UDP destination port
at the device default (vxlan->cfg.dst_port).

Extend nexthop_path_fdb_result() to also return the selected nexthop's
NHA_FDB_PORT (0 when unset) and have vxlan_fdb_nh_path_select() store it
in rdst->remote_port.  vxlan_xmit_one() already prefers rdst->remote_port
when non-zero and falls back to the device port otherwise, so nexthops
without a port are unaffected.

This lets one fdb nexthop group load-balance a flow across legs that
share an underlay IP but differ in UDP destination port.

Signed-off-by: Jack Ma <jack4it@gmail.com>
---
 include/net/nexthop.h | 4 +++-
 include/net/vxlan.h   | 5 ++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/include/net/nexthop.h b/include/net/nexthop.h
index 9c822799634f..19e8670d964d 100644
--- a/include/net/nexthop.h
+++ b/include/net/nexthop.h
@@ -576,7 +576,8 @@ struct fib_nh_common *nexthop_fdb_nhc(struct nexthop *nh)
 }
 
 static inline struct fib_nh_common *nexthop_path_fdb_result(struct nexthop *nh,
-							    int hash)
+							    int hash,
+							    __be16 *fdb_port)
 {
 	struct nh_info *nhi;
 	struct nexthop *nhp;
@@ -585,6 +586,7 @@ static inline struct fib_nh_common *nexthop_path_fdb_result(struct nexthop *nh,
 	if (unlikely(!nhp))
 		return NULL;
 	nhi = rcu_dereference(nhp->nh_info);
+	*fdb_port = nhi->fdb_port;
 	return &nhi->fib_nhc;
 }
 #endif
diff --git a/include/net/vxlan.h b/include/net/vxlan.h
index dfba89695efc..de41b374688f 100644
--- a/include/net/vxlan.h
+++ b/include/net/vxlan.h
@@ -567,8 +567,9 @@ static inline bool vxlan_fdb_nh_path_select(struct nexthop *nh,
 					    struct vxlan_rdst *rdst)
 {
 	struct fib_nh_common *nhc;
+	__be16 fdb_port = 0;
 
-	nhc = nexthop_path_fdb_result(nh, hash >> 1);
+	nhc = nexthop_path_fdb_result(nh, hash >> 1, &fdb_port);
 	if (unlikely(!nhc))
 		return false;
 
@@ -583,6 +584,8 @@ static inline bool vxlan_fdb_nh_path_select(struct nexthop *nh,
 		break;
 	}
 
+	rdst->remote_port = fdb_port;
+
 	return true;
 }
 

-- 
2.43.0

