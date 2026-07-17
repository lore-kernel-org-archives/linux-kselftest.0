Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3FD339863
	for <linux-kselftest@vger.kernel.org>; Fri, 17 Jul 2026 06:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784270747; cv=none; b=SUYFVhxdbTKea++UsLYozNvH+w2GfUZvY8i33uUDNW7RM1quep5bl5cNGEOnvRS2yboX4440K7nACH7nQIoHV9sxi1eAI7gea1y6EfVFg4VA/IBNHXg6wu5rPXfGLlvBjukkhf1yN2ETky3zpe9a/TXVw7tqnSxCxNdXmjJmvKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784270747; c=relaxed/simple;
	bh=xEM4PWSdufJQRFlVx8hDi0jZLJQtFRoDWHIzLk+sx3Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=htecaS0pmhUXWVxP34c91wC8BKr7QnQVixfXYbJ3BT0KLEauIPjIMFBtt0MUxxSShJ2pd/caIUKV7ZVew75A2DMCErpjoawsGfN3IVhtLX8w+bhCRaUvY7DBNC9vnIvhndfw3tswsnMmWH3BCLazr3kI+XoqDV5lsLuQ5gNJTiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O2gmXDsM; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O2gmXDsM"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-848643382fcso8498834b3a.1
        for <linux-kselftest@vger.kernel.org>; Thu, 16 Jul 2026 23:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784270726; x=1784875526; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pGWzAqMnXIx+QjNO6QbhWdHJZEGF73MjjXZSZbQ8KHE=;
        b=O2gmXDsMmWZEygqF3pPjKqCS0emvhEZL82wd0/W2DY8LuQjRJiSAxmsGXzlP6ebnGL
         DkqGCcx54sWYJjw7JKeb74htcfhoeVpGUnmDPHnDq0vvPTelUdadeCt5DlHr2Hde/4me
         Qffp3nONpOpiOhPn+qca6zTfV5PQI+EMGwgWS7TB9qdWdqU7bJcpJ1C7FGil4ozxTFUK
         MHeyBslnVAzXK06JVKrx17tdDE8dn6B3u4gUrEjYOxPUEvLsp89j0ZkJ0+wMPahwH7yh
         lWaLhFZQJ3AEIMBopWgt9Vohq4F5SwH8QtcGaHRdntPxTONllvRlVTYtE5tYCteF+TpB
         zPNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784270726; x=1784875526;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pGWzAqMnXIx+QjNO6QbhWdHJZEGF73MjjXZSZbQ8KHE=;
        b=ou509S5qVReaV0iqCh0e1rlViPwjrBXAK/Yo9RQ4Ce0YhoHrRgTWipXPdhrcv0Rxok
         wRGOdsEQnDjQYoD3bDUB+6zJJZcLmq+tfqvLPvC73vAucQdp+JaeedwylLc5U2dPVvHx
         cIfi1oBJH1RXSkU30QVGWhhdUxxyL7LIOsv2M0wSDdfk5pxNtQIC/c9muIbD9d3/BgOV
         pdH1nnUvzmmL+iTvuGCcI+620eENYOa/aysBWqzDyDIP0bW0qPq+iFEXQR79ts2K7q25
         3tX+b8thDEyjFG4t3PZTEnnFxlCTS0ddG5zrS9d/yM8p5vMXZY7SEWPT62pXfVSdEMy+
         BBxw==
X-Forwarded-Encrypted: i=1; AHgh+RqmliHqNwZ/xbw/T1QRRxzO7cX653nbq5fHGTEeGMdjhQafMzgOylDdw53pYfE/UqaU8HNzKvb4sEhCk0nz08c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7//qp2ipacssf9QJsu8VfABV4Fxjn/Fcxt0xJhiJkNdmNvZv2
	s9frcyptTicnqhNezPCrSEtLhRd0rCfe8BaONXwaCZ1gFeG3pa8OkmNbaSoEorSl
X-Gm-Gg: AfdE7cmSCTMMpngmUDb9gw5Auai6Pe90lrnKq4zM+8xHM1gerKofIPwGDR1erJzltHk
	t/YAi1VzTGLLNNU0jP/hnl8NTG51qWPN5zR0JbHMTTVgKR7plWeEmg+WyvFuR6rrGC4F5TlEk/g
	8pDT+mMD3fVSFT36GJSsaNagRVrhsowXg4B7lg9U+eIp1ZGnmGsl1WQ+mWraLiZELR1tg+B9n1S
	dRqEP98trP10ra/kXLP0t5JlmoU9+GC7IgaCebto/El3CeBYhjeuOnQ6+ABj/xacwjF2lmy6TXE
	t0BP/t3Hfb7inJDmmanimCxx3CmqyQKiPTMmrTKcZry4i3a3zsxe9QVAPl9W+UxlejryZXDZy4M
	7rLYkL1ecE1YQ500NL2fT6mK3p61HQ+nqoGoDVRLxddBVQxSQSkrXzlUfMhuBCmqTb0fadGAQKo
	gDxQo0XiK/pfZbQi+FFYZ82tdsGg==
X-Received: by 2002:a05:6a00:1492:b0:848:2f73:8ffb with SMTP id d2e1a72fcca58-84c29528564mr1412058b3a.68.1784270726474;
        Thu, 16 Jul 2026 23:45:26 -0700 (PDT)
Received: from CPC-mjac-HKWGEZ.localdomain ([70.37.26.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2ad8855fsm430531b3a.12.2026.07.16.23.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 23:45:26 -0700 (PDT)
From: Jack Ma <jack4it@gmail.com>
Date: Fri, 17 Jul 2026 06:45:17 +0000
Subject: [PATCH net-next v2 2/3] vxlan: honor per-nexthop fdb destination
 port
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-b4-vxlan-fdb-port-v2-2-f4862e8fe867@gmail.com>
References: <20260717-b4-vxlan-fdb-port-v2-0-f4862e8fe867@gmail.com>
In-Reply-To: <20260717-b4-vxlan-fdb-port-v2-0-f4862e8fe867@gmail.com>
To: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Jack Ma <jack4it@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784270724; l=2196;
 i=jack4it@gmail.com; s=20260712; h=from:subject:message-id;
 bh=xEM4PWSdufJQRFlVx8hDi0jZLJQtFRoDWHIzLk+sx3Y=;
 b=YhfQRticdo6ewbVHM1o14OsXcOGRoOkDyWL1lmyZ6SYsB5zZVIHJLM9i5b5iwgu0Rz/Nvgv9D
 EiG7Vf5UwMjA+3l2IAKLgjaslE7mE51uTANXD1z14w+fmFc/Lb5y3iL
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

