Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A445F39768C
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 22:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777416140; cv=none; b=LjeybCTCQ5XET6t5b+CoEOUZRa6KHy9NGq/9hQF+XBDJev6AXdhMIMEH/Qpao/373ud2h+MnSrFGec6bj9jyMa6pL7gS4/DEoOa7syisSpDoe5vvyOrXSXSYZVq5eUZ48Py48UkTmsZ9YMhHth3zXUCqzSr8z2vOlQ9bSj+Uj9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777416140; c=relaxed/simple;
	bh=w8Q7fwzhxuNDsmhOs8CU1x0IUrDfpFLHCoe3mI0Gkkk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cc49USMYV6vuhh28EM0EzrFNmrljsYgGle2FToFlLrB48Py0f9mNJ9MoT5o5Qg2CFkzJKpObOOxTb8ejhCQxUEjOttjCik5fNONWutlRzIYtyl4uFkXEiW2eyGcmw9C5mIfeaouXaVJD6F7LJeQsdmC2LBdLE914zoMyam7RcLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZbVIyxpM; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZbVIyxpM"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7986e538decso122604807b3.1
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 15:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777416138; x=1778020938; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yf9C9Vs78X6Tori5C+6AMAUG6Jc3jDAPqdDnnefTEsY=;
        b=ZbVIyxpMWHXCvIrzJgV9mWyOvTaIOnoNxuTsNhnHC1iCMZzlOc7dDg7p817Hl4FHQM
         xFjWwCuJg7TPW6uQrJ8S6INB3wj7NwfhuCwyuVaXu5tJ4x8Gt0iSiiepFaSOY9pqS1HJ
         clIsEXhAZa7t5C6o7WWyaMppBRkUYtE9JaSGxz67lMgvXOOpqPmzfQkKrgcEcCHqckVx
         oPwNbFsY5GAkerbDc7GwNF3cT8PbV3TC+bEFEa1Dp7y7PldcbLlAk5w0SEFTdfKCrHNP
         xwqHwR8t07skJuRzFtJrlVTeiLLGgnBsizsHNM0/d5pPhVgD8qr80f7VPRoKuhjybJ6D
         SI8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777416138; x=1778020938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Yf9C9Vs78X6Tori5C+6AMAUG6Jc3jDAPqdDnnefTEsY=;
        b=P9a3N73NbC7T8OLIQpA53nMKwmAFDFUV93k6gdUlmhQXofuhHnev+KoAi7buyIiYWC
         bGmXfnOx7+viPVMTPlD5gCRWfkoz9kRT5CDpphYCBuhzTBI+s9K2xKP83XJyDaOwwrrR
         2WK6lb/kFFzZKXqr5Wky5+D0LciDf2MimV5Vf5LTmSYVwzEBxSQMb/04NHvmFGnae7jY
         CEezjXyx0VCmWWowyyW1qzrWXUsAxEOfAj+2TBkS/ILc/6w/AcmfblZsmJRWBAWofPi2
         lQ6G3GGKlnO4TzfYc/4Xxvz41HlG2kZzVzXSRROaXc81adEocP79qiOxefY3vOHMXffC
         5aUA==
X-Forwarded-Encrypted: i=1; AFNElJ8kEgAf5zuPQEziXwUWm5ROV//NYvhIOZrVQC73fdsu1tk24mBw8ESppy4SnKo0TEe4Fl1vuYjJvFwLFkUJJp4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIlVDOc/usQcTy6P555AN5aRyPde4VaphSt9/h6IKesO4+JOgL
	4hjaDC44+yso2JkGV2IjW9BbEMhnXq2im+2duKfPJzf2eQdpC4r1at+J
X-Gm-Gg: AeBDievVIuVyVivoTGUtdumqqIEKqiP6/9+dBJ2iDCWxTv3TlhpXSB8FpwVP/pwzN0l
	JljWuYJ2FzAVCBLHo9WNfylGuMhhUU0Ig45UKiE+83lW2dp+P0TnqqwcMRNcO3DbrgTWTcyGZ6L
	VR6ci08trd9x2l7ikctsVm3m/Iyy02+OWGZbEbX807coMJX9ObwEgguxlnP0VVTDnA0/+CIsNP5
	oImyAGGO7tncqSh0Fgwh5FDOOo9VfYkCG5uu+S44fro4vgcJ7P3v3EN8EjIUoTKMV+RfEJ1rYCJ
	LJMhcS0ckLpN99wGLmetngUhKe717UU8yIXUmSGiDpYwwhbUWd7UHktX+5UwWAco4xN+kpBQ5lv
	pnwQ2stdcaoUCP7fdTR3GdwZ6uZasCrbEXc/Fw/JU0CtSfQOAu+9fs7t7QBCeoRJ3KLs7PyK+JH
	nr6jE8ADno4efSzZ/kYjkdFOBdbQCKluQ=
X-Received: by 2002:a05:690c:6:b0:7b8:338d:7d78 with SMTP id 00721157ae682-7bcf579a631mr48995027b3.41.1777416137774;
        Tue, 28 Apr 2026 15:42:17 -0700 (PDT)
Received: from localhost ([2a03:2880:f806:f::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd24b8a86dsm5096607b3.0.2026.04.28.15.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 15:42:17 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Tue, 28 Apr 2026 15:42:02 -0700
Subject: [PATCH net-next 05/11] eth: fbnic: convert netmem_tx from bool to
 NETMEM_TX_DMA enum
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-tcp-dm-netkit-v1-5-719280eba4d2@meta.com>
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
 drivers/net/ethernet/meta/fbnic/fbnic_netdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_netdev.c b/drivers/net/ethernet/meta/fbnic/fbnic_netdev.c
index c406a3b56b37..138e522ef9b9 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_netdev.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_netdev.c
@@ -752,7 +752,7 @@ struct net_device *fbnic_netdev_alloc(struct fbnic_dev *fbd)
 	netdev->netdev_ops = &fbnic_netdev_ops;
 	netdev->stat_ops = &fbnic_stat_ops;
 	netdev->queue_mgmt_ops = &fbnic_queue_mgmt_ops;
-	netdev->netmem_tx = true;
+	netdev->netmem_tx = NETMEM_TX_DMA;
 
 	fbnic_set_ethtool_ops(netdev);
 

-- 
2.52.0

