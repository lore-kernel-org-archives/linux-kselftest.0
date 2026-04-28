Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E108388E71
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 22:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777416137; cv=none; b=VSo/TUUiibjCqu4hLzrjQ4/CFP5KI4iuzCZTfPst6B5Wl/cT5o5BfXmaNkUzXbXbS7U79v5pxmRqQV8Hki0y8TJ4dBEoCDsR2RlxzN4VjAfs8BJhHxZ93fFsnRfMrTKG3GfgR4XyzCnTxYmtEdV7RoVkxaCmJog3nwf1i8fj1AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777416137; c=relaxed/simple;
	bh=vzUUg5dUyzpvG2rKRSov0XZCUJEJWBan5Kd7XHmSVMY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p0tZr8iLae123pSSHWOF3CefwHpyQ4KbEc83KSkbxguRc+CiG+PKz68n4+0c48MO+0QyWxE7oNGMn62UkdDAWtyCniPrxkw08X4Kf3V7DDw6A0Y7CtWL3IwJumHSdymvoYnZ3p3IuhetOue6ylmI+PEFWjCKPRzRrABTl+C2OPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i9zpQ80s; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i9zpQ80s"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-79ee5037d44so5603107b3.0
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 15:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777416134; x=1778020934; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7LWnUfnbOgtmJXE6gI2zxE0u23Zp9z86buEnIjkZCpw=;
        b=i9zpQ80se0Jlxr9Ek7vx74wnKI3t49CkgH9GRtaRn61bW/xP4d0r3b8BP0dtNHh9UJ
         0t1ZLXuzCeY/o/6tIKtYh6BJfydOT9oHLHeJMhTkERl14A7yZ1oiRKbzUtdlFAYY6oD2
         7CGfmY9EP+PxdfnX4SBNfc2EmprinvWNN7sZzWKAg7EeDGI2nlMoLhKLH2K9XxweuLSo
         O0zusU2GY+Xh+xDyR3qdLwA/MFuYGT6OLH+P6QcS7XVfVIdiqjteEYX6HpDAX+7nBAgC
         2GLsscizSa53j1jAZ9GcVwvOdAR9AGW2sBQgkoUUdeoLHjEgOeXidFuSW88JOxZir5NF
         i3vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777416134; x=1778020934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7LWnUfnbOgtmJXE6gI2zxE0u23Zp9z86buEnIjkZCpw=;
        b=tDnl0ZvYbHhl+VDu0u8P5Y7pNmAGfleUFA1lwlMP+kO8aU3EiFSY5RqEAHL6uz+aqS
         cN2dhNM2p2QtYkIbf066jFDDpeHEIqyH9h5/YtR+b8J8+HBLYvhMEabN2kDOy1E/xUT8
         2t9aXt5Gm06XK0CsHGj0D4jn4pqloEcCi7s3gnxEhEXyfD5WULGtpvanq3S/PB89LapS
         JUwff/9a52UPbR/lCaVPEXN4Vw0iaCvLDOcdm4jF9YFBvn+epbrQXehBUaKEPPb87l3a
         afinpCV+0NSZ05xkanI2QMIb5DHrbOetmYU2nWU7+yCJG04mT1RY2sqOOVoTaTEeMhZ1
         5iYA==
X-Forwarded-Encrypted: i=1; AFNElJ902XoJjDYn9AhoLw3B59NF8A0lz623aO0TPgbbffwMLfPkMbVlHXdNHDzZNOtSreyUAVQYMCU54eMgeOFaTM4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzA8pS4/5GEqVpl4Dyjvyehn6fFIZPTiaI5Sdhao7N60dZL1e4d
	QMupx/ToJkXXBpuL1vjrjX5l+7B44qbdB3igVJ+KZLg3p03cUDigSiUC
X-Gm-Gg: AeBDieuysj8AQ56rnhPrHfd6AzE0CbbYnIspnUML0KLZaNaN/H8jTrDbgeaDFLjw1uJ
	nwobA+RKYSWJK8C7RhDARKsO495htx8BacTXZojgpGZLQOwv1Xv/95JB/pWGwgb+Yk4trWQY7wp
	QHOthPMQF6cdmnjoqNaH5IW6CzW09KldpPBmcJ0zyNdpVrnLKXe0h8CkzULOuk3neItfzQ2MZZ8
	9qiyD2jkp9eDMsYNjBZm9F8Gy/5E2Zsznsvwz0qSjXGlwsFOhj5oyYQfZafiiSbzSwtPQLyW49F
	zA+Bw1SRtHHvPk+sxBnmm76gPSRb5RK07Wb5f+WpMKFkK4Mlc8jRUfl/592rt9wdKTSJFBMQtrL
	sEAxNm+xFON+XOXv2xhF5Kwawn8HHobLYQfZFritZAk1EhqGHGB84KeMDstZ2UpQDt4FoGrpaoA
	71sp/Jch9l1l2Ofl5JGyTz7TTF6kg/2lZi
X-Received: by 2002:a05:690c:6d84:b0:7b3:b0a6:2c6b with SMTP id 00721157ae682-7bd241aec69mr6798867b3.20.1777416134516;
        Tue, 28 Apr 2026 15:42:14 -0700 (PDT)
Received: from localhost ([2a03:2880:f806:19::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd252ca6b9sm4764757b3.19.2026.04.28.15.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 15:42:14 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Tue, 28 Apr 2026 15:42:00 -0700
Subject: [PATCH net-next 03/11] gve: convert netmem_tx from bool to
 NETMEM_TX_DMA enum
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-tcp-dm-netkit-v1-3-719280eba4d2@meta.com>
References: <20260428-tcp-dm-netkit-v1-0-719280eba4d2@meta.com>
In-Reply-To: <20260428-tcp-dm-netkit-v1-0-719280eba4d2@meta.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Alex Shi <alexs@kernel.org>, 
 Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, 
 Michael Chan <michael.chan@broadcom.com>, 
 Pavan Chebbi <pavan.chebbi@broadcom.com>, 
 Joshua Washington <joshwash@google.com>, 
 Harshitha Ramamurthy <hramamurthy@google.com>, 
 Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, 
 Mark Bloch <mbloch@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
 Alexander Duyck <alexanderduyck@fb.com>, kernel-team@meta.com, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 Nikolay Aleksandrov <razor@blackwall.org>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org, 
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Stanislav Fomichev <sdf@fomichev.me>, Mina Almasry <almasrymina@google.com>, 
 Bobby Eshleman <bobbyeshleman@meta.com>
X-Mailer: b4 0.14.3

From: Bobby Eshleman <bobbyeshleman@meta.com>

Now that netmem_tx is a multi-mode enum (NETMEM_TX_NONE, NETMEM_TX_DMA,
NETMEM_TX_NO_DMA), set it to NETMEM_TX_DMA to indicate this driver
supports DMA-capable netmem TX.

No functional change.

Assisted-by: Claude Code:claude-sonnet-4-6
Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
 drivers/net/ethernet/google/gve/gve_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/google/gve/gve_main.c b/drivers/net/ethernet/google/gve/gve_main.c
index 424d973c97f2..dd2b8f087163 100644
--- a/drivers/net/ethernet/google/gve/gve_main.c
+++ b/drivers/net/ethernet/google/gve/gve_main.c
@@ -2894,7 +2894,7 @@ static int gve_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		goto abort_with_wq;
 
 	if (!gve_is_gqi(priv) && !gve_is_qpl(priv))
-		dev->netmem_tx = true;
+		dev->netmem_tx = NETMEM_TX_DMA;
 
 	err = register_netdev(dev);
 	if (err)

-- 
2.52.0

