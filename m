Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891093911B8
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Jul 2026 16:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783355073; cv=none; b=k0L7Ok8y1a64BrfLl1XpPr9W0eIO+eGQkEGPfoysQ6cjuNADFeJ2AP9zlCb6yshyW08n38umtxM5214o028UVJTz/P0dCjtDHIQSzUsJ2kCQk8e9mM+Yz70bj4DY8CEjm1DLYgfG/ifpfBjn3u+T0S9vC9Fdt4i4dqnw/ijTGD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783355073; c=relaxed/simple;
	bh=kYjyZKOu5BuvTQeegraRp8HuW0OwQSiyPN8ROmlETNw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tgNHn7dfkD4zah5/1dN1rzuSb51+L8MNvUlslFTA8chWFmUnevZWIyc2X1jn1+3+WMcAXr65J7ZMyi9M15UHyujp9qWcI5BPkMB5VFms+rumFK1RUtZzl/vQiFqBw96aY2vg59dfWSBDjubFvpjDKMEfGOEt2OTjifRd6Zw2cg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=USww8SF7; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="USww8SF7"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493bc8fda98so35803175e9.0
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Jul 2026 09:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783355070; x=1783959870; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=B3vq7ymDFM9EX/uHn2Ys6Oqxy7HM2kIJcIzJVFHBep0=;
        b=USww8SF7GY0pwQsyk+Qy8cUGc6QkXOu+aXZfUxpJxGj3XzhsaiZi7jycGTIpMdeJ4u
         TDl/d46ypXJmrD9xglW0qD6zaAsbLzMHyxX8tqeSBrPdzmeFv/TnS0ezIGxPqAyYYhgr
         O0qigw2xqRuDeVz1ZZcxTTOoEFPGMwzQzSLme85JvN7zgTbIVXkh1Q+RseiAiiTvLU1b
         qOX3J5up6cYPkQM4TPUOgGFovc1AOb1wA9GaHfEgDYmYqvEOsXAmDMQ700ViITmrgkTc
         +vR7O38V2FY6ZH65kLnq3nlMVZBAJra4CLSCUi4xnkCyxWbYixVlrX+8M7q2kzddPEzb
         SbgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783355070; x=1783959870;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=B3vq7ymDFM9EX/uHn2Ys6Oqxy7HM2kIJcIzJVFHBep0=;
        b=KB7OgRxseaUsGj+WQFYPlhc9A4JitwugWChVJbupR5UM3BL/BDN6BfVUI94q/Dcm+c
         y2gju1+wDpDbNu+FZH4CXrLQnuEbVRK5z0gMUHS1N9N7p2XoHg96xkdUFhQSfEtxOnbn
         V/WfoiuclQSPGD3GQxsBieHzsq5yXnv7PUc40BYXGPbhHOe7PcvXtN4qm+QoaDPoda8x
         H7myD4WN0V4z1BQtWtetmXRB8qFW++X2cmrDwBrad8v3gInOgUh9DUwhA/Uafls4ccuT
         Rq6K6LuoJym3cq8xdiXkCOiiIUAs1x5m0uAlmORgCVSQ7wLm1wWxOeE6v4LXBzc6ygHf
         pwVQ==
X-Forwarded-Encrypted: i=1; AHgh+RqUkwR1LYSC3xpDVGTpdEzpVIZc53waNOyGWmyI/aj9qcXcYZB3vJvpUfIiDRLoB5rT4vnDaPyNvB7QPVPlgqM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWyIn6+S/Mm1LkkqDalWsICxP+N595uOs13BatDOmRWnS2WOcv
	j/IWnnUPcowgkvHC1o5t8LWuY48cxUHFCIc0CsgmAijR2rCUh5l6cdnsaxoTaTNWjD99poxwTRL
	08HJz55o=
X-Gm-Gg: AfdE7cm3dH6WZGhHKLKM2tzwgB5xkcl5LJ4P77kHHcqBQiNX+iFjINa9c9iF85cnsVF
	jxcUKMoWK4Ynf3Rb3any9UJa6PybZH4yRc0FWTmhTmuZCevLMZGViCnovfFrhjyw5lEO1VBXc+E
	XkSfhoBeR+x8g103DI8AOMmB9Mz02t0Y3NwMthQiek19SyFsa6uY7Wbi9G5BMiukWCXC8xIJHv1
	0qNxieHXzNH3ABMzs356RptEKBHakF21pXij6BOoBrhPE6j0NmsQLZLAG9EejwZsjIX6dV4wBIs
	Nyef+K70F9HameR5yXDBRQaM4yMf8piyy6XIV/d8eD4NMdVVY4jrt3QpN/TfnUOVM9p1AD7ULD7
	cDGnh4jTjN+jYW1ydx5T7WWD74bpHzQWIeXiwqDIewWlc8W6h1flwOs48SGUMaGzX2/18InSI4i
	OUPg==
X-Received: by 2002:a05:600d:110:b0:493:c337:db18 with SMTP id 5b1f17b1804b1-493df042299mr10585915e9.16.1783355069970;
        Mon, 06 Jul 2026 09:24:29 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:157e:cc5f:6c4b:db0a:5d2a])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-969839dc37esm6075296241.8.2026.07.06.09.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 09:24:29 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Mon, 06 Jul 2026 13:24:04 -0300
Subject: [PATCH net] selftests/net: Fix tun IPv6 test addresses to avoid
 6to4 range
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260706-b4-net_tun_addr-v1-1-3d3cb2473560@suse.com>
X-B4-Tracking: v=1; b=H4sIAKPWS2oC/yWMUQrCMBAFr1L222BakipeRaRsktWu4CrZVITSu
 5vo5wzz3gpKmUnh1K2Q6c3KT6nQ7zqIM8qNDKfKMNhhtAc7muCMUJnKIhOmlI31PjnvMBx7C3X
 1ynTlz+/xDLWEy1/qEu4US/tqWUAlEzJKnJuq4f6BLLBtXwWvXEuTAAAA
X-Change-ID: 20260706-b4-net_tun_addr-055d454ab810
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Xu Du <xudu@redhat.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1783355066; l=2310;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=kYjyZKOu5BuvTQeegraRp8HuW0OwQSiyPN8ROmlETNw=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QGsxImto4BLYWX83ENgbi9BRJw4aGnVNlX0lWSyKU6KEtZYd0Yt+oOYh3CVT/jHst93iAhQHFGj
 tBVJGl8iocwc=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

The IPv6 addresses used for the tun_vnet_udptnl fixture currently fall in
the 2002::/16 prefix, which is reserved for the 6to4 transition mechanism
(RFC 3056).

On systems where the sit module is loaded, the kernel automatically claims
2002::/16 as a 6to4 tunnel prefix. When the test assigns a 2002:: address
to a TUN interface, sit registers a competing local route for the same
address. This ambiguity breaks the GENEVE decapsulation path: packets
injected via the TUN fd are not delivered to the test socket, causing the
IPv6-outer gtgso send_gso_packet variants to fail.

Replace all four IPv6 test addresses with addresses from the fd00:db8::/32
range, which is part of the ULA space (fc00::/7, RFC 4193) and carries no
special kernel semantics.

Fixes: 24e59f26eef2 ("selftest: tun: Add helpers for GSO over UDP tunnel")
Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/net/tun.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/net/tun.c b/tools/testing/selftests/net/tun.c
index cf106a49b55e..abe488bac50b 100644
--- a/tools/testing/selftests/net/tun.c
+++ b/tools/testing/selftests/net/tun.c
@@ -42,19 +42,19 @@ static struct in_addr param_ipaddr4_inner_src = {
 };
 
 static struct in6_addr param_ipaddr6_outer_dst = {
-	{ { 0x20, 0x02, 0x0d, 0xb8, 0x01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 } },
+	{ { 0xfd, 0x00, 0x0d, 0xb8, 0x01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 } },
 };
 
 static struct in6_addr param_ipaddr6_outer_src = {
-	{ { 0x20, 0x02, 0x0d, 0xb8, 0x01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2 } },
+	{ { 0xfd, 0x00, 0x0d, 0xb8, 0x01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2 } },
 };
 
 static struct in6_addr param_ipaddr6_inner_dst = {
-	{ { 0x20, 0x02, 0x0d, 0xb8, 0x02, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 } },
+	{ { 0xfd, 0x00, 0x0d, 0xb8, 0x02, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 } },
 };
 
 static struct in6_addr param_ipaddr6_inner_src = {
-	{ { 0x20, 0x02, 0x0d, 0xb8, 0x02, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2 } },
+	{ { 0xfd, 0x00, 0x0d, 0xb8, 0x02, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2 } },
 };
 
 #ifndef BIT

---
base-commit: 56abdaebbf0da304b860bed1f2b5a85f5a6a16a0
change-id: 20260706-b4-net_tun_addr-055d454ab810

Best regards,
--  
Ricardo B. Marlière <rbm@suse.com>

