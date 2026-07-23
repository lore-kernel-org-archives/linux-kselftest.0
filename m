Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191032C21EE
	for <linux-kselftest@vger.kernel.org>; Thu, 23 Jul 2026 01:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784769497; cv=none; b=qYvkP9yfgppFd4pQ47lXaLgM9HjaZDFb9Vis5gEyjkX0KWp0Pm3n7h5TBwZppFQBYxvobVkCtfRmi8Wt9RiVitY04AewdlpFGp6f5amaMx/5Qvb0As3Z9zVsz35aYU695mXjV/46uD8c5eP7cC3vtW7Ek8LoA5qgi0IWruqxNrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784769497; c=relaxed/simple;
	bh=cmZk/X88g292ILT+JnceL6lS8EcLUQt5/rCxrfDM+ag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r5xfvqkUiX4IUhGDegnodf95v31465pFghzC1TRFNbzq/6PIOgCM7JWZ6TRJvT/+Br5Zc3NTWFB+07e/P0lyIDYCQCTxUrUrYb0a+NJ40HI/xnb9igL62zQXtj9FYB5V2o0a8PzRbnk3lgxO8+ifrnRTb9GdRYlsbiBOVRSwsxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iAzki95u; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iAzki95u"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso81727a12.0
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 18:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784769494; x=1785374294; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UGBUPhCkGf4Z9PVVSo4mL4I1zGIBeZMASJ8gZ6MBIzs=;
        b=iAzki95uyqDwa7cjEJzpNHAh7jjHn76g9G1Z8o4dcmifV6Ql7UmIZLlWYCNU4/vJMt
         ZaY5gC3XgiTxAKzyLNVumQWDla2tVId9aPcN55eQZyEN3Kr5yDIRi0LKqU0X0oSHAY7r
         t4yYD17dLDiSigtQjLOhsruC3XLyj9xqoIWyXQ3q77ep5DOH7RN4ri86YrmzoSX8SvuM
         CrKCI5cJpWQF0maU9k3sWmtWQ9LY4+dYf9BCEZjF4FTVv90gmUTI8iSMv/TS8S4u4teq
         z+KJjXjFRHLFxby/7wRWeAYT8BneZGYZzqSZsYHtFwRGrVOz3/JoyjR5ua0txMNP2mV3
         MSOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784769494; x=1785374294;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UGBUPhCkGf4Z9PVVSo4mL4I1zGIBeZMASJ8gZ6MBIzs=;
        b=NODUcIsj5f1o7IVqJTRRFVgeNlSG0gvpu8bUll/ynJI9Qoe5iYqpSdW715QXvgGRi6
         q2tKDTCaUBlAmV7uTXENLiv3QXN+JCWZi6BEpFnAhZOVPa/81G35JsmrRC+AQJfJdpdX
         Gl+PxBJ1HfXV5SNLQqoNQjkmk1uwHShr9mz9aaT5E4G3RNsRqBE5NXurjHmPrTuq75W/
         pERf1FQEM6Wcr4KnB+nuURXoJ8iRIfJRPLFzjHzFULFAT30YgibQRN964kYqtF/9DMRr
         it58sp4yhI6UiX3Cb68vtebn7aBN8+fN3wPTKiWUhRdTTsI96wghkk6KvpM+ks0P0f08
         P8zQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqa52fTxZa+477IWdvKs2sk+8xbdiQ0WTwcIjiRU3h6D3H9a1N5qGIlKnpBG7Mpv1YUVJshc/g2r5HUiXRl9O4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ8zEAFLHNkgBjKzXHLv7pg1jt//H9jddpRo7+bBOBiGGsGLcN
	Kajfc5M0acqfJEesX69lkxS68EvesVTMQB3vKPuH5mM0GWb2kn7hjNXSxJV2UbAe
X-Gm-Gg: AR+sD10sLvJeoG4gi4cgDMb61Rxlp8xbAs1wfFL2SqcexQD3XNvVvgIykx4ffwo8Ehp
	BAfTnYmnXOgYvj/24IUCeDhWYUn+kkTY8vJMFTORN11I9QEG0xnlouNpP+u6TAwlD5AZ3oQ0A9z
	4YmULii67vYKlGN/1csETKCV5SzQA9QtUBKzcYn/jrAHhkOOgJ51kFl0echZ+Jr0q73h8JXhvBU
	IjciCKWcpL7StLjY6zdqBSL3sNn7Cf7z+zU8yTNHnkyYyy4bNo9nAf3Yc+I2vvePz5l2/qugsVu
	sjEiAOBzQdcp737JYeFOlHvXUIq4Gl2VjXaXHA5WcXNW2++BRWotR+vHFiRXiIh+EgyRThHIpKC
	aRaAoZ6681FnWv3RGpyvVRnNpoOq+W2dDNC4HcAhcutU/0L77C55A20ArDgum4qIDhgI5cIII0z
	VF7VmAj2fAYcOi/FQ=
X-Received: by 2002:a05:6a00:94f7:b0:84c:5349:daa1 with SMTP id d2e1a72fcca58-84e2bc2ea4cmr1311124b3a.76.1784769494397;
        Wed, 22 Jul 2026 18:18:14 -0700 (PDT)
Received: from CPC-mjac-HKWGEZ.localdomain ([70.37.26.37])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e175ea5c7sm2089045b3a.53.2026.07.22.18.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 18:18:13 -0700 (PDT)
From: Jack Ma <jack4it@gmail.com>
Date: Thu, 23 Jul 2026 01:17:54 +0000
Subject: [PATCH net-next v4 2/3] vxlan: honor per-nexthop fdb destination
 port
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-b4-vxlan-fdb-port-v4-2-46e3a2dd88a3@gmail.com>
References: <20260723-b4-vxlan-fdb-port-v4-0-46e3a2dd88a3@gmail.com>
In-Reply-To: <20260723-b4-vxlan-fdb-port-v4-0-46e3a2dd88a3@gmail.com>
To: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Jack Ma <jack4it@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784769488; l=2195;
 i=jack4it@gmail.com; s=20260712; h=from:subject:message-id;
 bh=cmZk/X88g292ILT+JnceL6lS8EcLUQt5/rCxrfDM+ag=;
 b=9uuszWWcjPI/mbp9xj6Li57CE1j7vPm34gZ9jxIEawV/Qe7i9XKBSxm8e4zVa9VrMI1aIt0Wy
 NaYkLz/m9kDCnGRN40wAWH21AAZEXpG+ZbWrihU9GCI3EmkjekW6+HW
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

