Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773013B440E
	for <linux-kselftest@vger.kernel.org>; Sun, 12 Jul 2026 19:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783883801; cv=none; b=QPVSbWQIdqHa+wI3tPPb4CsuCp2ZBy1BQ4CZ2Mc28RsBbq0i7G+PyDKiALSmpvPTfBNHjXvywXVu+55ktUX+L/4ZOcoQg80Y9g6+f1HIWUSo6TYayctWyWRWdlxrIKGAcxLY1jE4TU8poTQ4Rk4eXG9RBaDoYKkRt3rzr2r5ibY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783883801; c=relaxed/simple;
	bh=3omQbdkzxVMUTQWPVFWGZOcimZIiLKSzRtsVqayRl6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oe7SAYx+5rDIhwY1ElkHoIVjMmYsTZDQq/NJj8kLDk91Axxchvm2LD0k1pv4osXt8+UnQSNSNzmy7sDuVBArAigKpy6Lmrm6s20FgmDFRDLzQW/ZmLiYoupw9ofl+xaYItnOJ818PAaWKUyZuCbA0nOYCANiHWr26GTD2WBdfRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OPjCV2Si; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OPjCV2Si"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84874b52eabso3101720b3a.0
        for <linux-kselftest@vger.kernel.org>; Sun, 12 Jul 2026 12:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783883800; x=1784488600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5uUX9nBMX6dend7Nz469oivKMBhodrKtUvZhGLjA08A=;
        b=OPjCV2SifqQTkWTJ0FWmhRPFqvsoxA/pKlZu7TfAeYBDojM7ZJ1RJiR2V3ok0VfafT
         pLGo4vX/HedlPvxZ0WNL0lgh4HzcwxFGUPP4SX3GjYa4ikZ1l0jFqNLu3czfMkrXURL3
         YIhDqmy4ICz5dFa67x3/hp/WPJ+YhKy1elPxNrAYymifwbGq4Xa+kgNO4Eox+z9irOt7
         Dd6ZptwYuqsXNpmnzyPMhzh3+8hWU3FKA0CXDdi7Cpj5cQfqITZ+LzB3J9FTmdr2LE8J
         tYl7kFMCEkvW8WnZY3RSLF9xfvE6VJqhwPBdEk23l1k1406T9goChOPK2HCrAB55sMag
         mDiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783883800; x=1784488600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5uUX9nBMX6dend7Nz469oivKMBhodrKtUvZhGLjA08A=;
        b=TU2qcNedQO9uFtLOk/qXuaY+XUgyU6rbJ4LH9g9nuoH6kR1dN2VHnMlinNuGFodD6A
         6FTbgHwJxQrwpFX/CJFx9fVWfM00i8dRWUAhKk/YAQMBeUQGkrcD42p6OqowOF8p//wz
         LN9PqjMzQF0Qh+JV8Tj2C7uJpIDpkrYJx+B8l6QBLcPlVxmvWUHIbRvXFJsahABNKWgk
         8mvKXYn+/dJnQoVjFvOT9ds0T/YbLly528IJP7VIm1czok3oJzeI9CZB48b0U8xkVxqs
         mVfGpicotOkVJTgyHoO+lq65h8n/bmvZVVMsLbDel6/dr1aQH9l3+mPxx8x3ezqEU0fK
         iibw==
X-Forwarded-Encrypted: i=1; AHgh+RorFvTU4+gUuqkXVybMQLPd916bKHhY1xJsZ6+h1gBidQNS9LUZAQhyrf1cf2ak0ok7wXZIheJEjoesrJvF2kg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNHQzLAe0D1DJwhErRqexue833VOTQ7npZS5kbqR5c07hwhDAM
	rkJ9PNmDIEmNnZXf7PjFlgXdHWIQrteffYtErgny3ppEfVaUBbed2hhc
X-Gm-Gg: AfdE7clw0ksUx8pBzYLtEnCq/dx1CwFoAcAb8DU/IPsGJCMofjcVRa3iXCd8lYj/XM5
	X/hivWKuVa/3oJpB8JLY7YW5dQ8SxNL7dbtcs4NtF/Grt7MksBVvFe+SrcScA58+xnGdzaCdbF2
	3tB35tY9E3nPvCiRSy4sW+FxXoerS2duoiGixIZH+avBIVuWeI5U+jMGggWHJe5aiLi+gG49/w7
	RLQmtsZP2iRfUGzmZgQYvOViRXPMQJegdiOl3zJPTzeLBC2I11nfS3IHNHaYB4lYnQXITiFT8z2
	MkLBWFDt4kBbpyE8ufoQwtDb7KcMvCon3TjkYvjWURVR9ld4hMCp91I46ebIm1cK41OtGKpWHkG
	7qPgA64xelYp7wXDD8X46taC0LVCFuG+qL5vZl2jH8bFMn7jF99BU94bdFJpzYAcSj3N2Kx2ZqJ
	YT+nnvfYCkA2Y5whNS62kiupCTpCnRqS9JG2JlND6eF1tJ/w==
X-Received: by 2002:a05:6a00:2d02:b0:842:6004:3fda with SMTP id d2e1a72fcca58-84889643027mr6044387b3a.25.1783883799726;
        Sun, 12 Jul 2026 12:16:39 -0700 (PDT)
Received: from CPC-mjac-HKWGEZ.redmond.corp.microsoft.com ([70.37.26.40])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6ddc974sm13079371b3a.60.2026.07.12.12.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 12:16:39 -0700 (PDT)
From: Jack Ma <jack4it@gmail.com>
To: netdev@vger.kernel.org,
	David Ahern <dsahern@kernel.org>
Cc: Ido Schimmel <idosch@nvidia.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jack Ma <jack4it@gmail.com>
Subject: [PATCH net-next 2/3] vxlan: honor per-nexthop fdb destination port
Date: Sun, 12 Jul 2026 19:12:17 +0000
Message-ID: <20260712191218.236-3-jack4it@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712191218.236-1-jack4it@gmail.com>
References: <20260712191218.236-1-jack4it@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
 include/net/nexthop.h | 5 ++++-
 include/net/vxlan.h   | 5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/include/net/nexthop.h b/include/net/nexthop.h
index 9c8227996..7fb612a73 100644
--- a/include/net/nexthop.h
+++ b/include/net/nexthop.h
@@ -576,7 +576,8 @@ struct fib_nh_common *nexthop_fdb_nhc(struct nexthop *nh)
 }
 
 static inline struct fib_nh_common *nexthop_path_fdb_result(struct nexthop *nh,
-							    int hash)
+						    int hash,
+						    __be16 *fdb_port)
 {
 	struct nh_info *nhi;
 	struct nexthop *nhp;
@@ -585,6 +586,8 @@ static inline struct fib_nh_common *nexthop_path_fdb_result(struct nexthop *nh,
 	if (unlikely(!nhp))
 		return NULL;
 	nhi = rcu_dereference(nhp->nh_info);
+	if (fdb_port)
+		*fdb_port = nhi->fdb_port;
 	return &nhi->fib_nhc;
 }
 #endif
diff --git a/include/net/vxlan.h b/include/net/vxlan.h
index dfba89695..de41b3746 100644
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

