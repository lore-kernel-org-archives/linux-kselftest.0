Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0059E390234
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 22:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777416138; cv=none; b=OhBQZjP4wDQamC+636MCwIDwjzdZ7Q4vfecaYHVsUOR54M8hcrVgRRXnMlBumjj8otuLzPgVMhY+b+A1A84dkIFPb8aakk9r5Wmn79Vscof0ruJy41bNCkoa39UdVFowE67+kPT81JSLD/OKUdAWkFnd5ej3072xzAys/7Txgg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777416138; c=relaxed/simple;
	bh=KFECSS4aB7ebsKhc9cQ+oy1mgcCmosbiDCQwtAwfgmA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ac2HDiKPnAgi31+h4ulc/ihgrerr69g8wE30D+iVhOrODFTerAKnpRM9+zM0GVlK3nuU61R9YCaMXI3ytcuZil89fq22kH1LYtiqTCbPkxStfXeTnzUgKQWm2LgfVVcXu3yvJ2/sHfRaDeNLxuT+DwsxGLwmbKr7lalCGr8vU0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oeNEkbSt; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oeNEkbSt"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7a4f9cf2b4eso96279807b3.3
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 15:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777416136; x=1778020936; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ecnzl0rAEZ1GRn0EllrW0hRzekmmc0UPEYdKJcAYG5Y=;
        b=oeNEkbStlmLUtV+R1Lb0dnvKyG3mYrR68OwGidORtt/N/kbaWolnqjT7+XPgPKPKUI
         iiKDBigsqLDbvI6K8vt3weq05Pw1JAWlKOgrDsybRs/Ges7lV0lTxOObUWBebGxDzLQT
         AI6vHZmcqH63UOukMICr/4BaB7IP/dRDkcekfYwAmQNxAFP94lyKJ2QCxdFIE6A4kOtw
         NUdA25YMiuzmZ2BUEglA8vm4HQqjnqrNFOhYAU6pGlZ3bbDPlNfKpqLLd5Glxt5dNWQo
         3Z1/GL0c3wkXEBY4b07wQML3Yi0XIzEJu6t1if5fn55y2DSF98evS8114FIyJktkaGD3
         8EOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777416136; x=1778020936;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ecnzl0rAEZ1GRn0EllrW0hRzekmmc0UPEYdKJcAYG5Y=;
        b=SpptlwRkdZEGV04G7zKwHG1CEyFC3wxcm5sxU31VC93hGBuNrGsCn2O7SOCo67ztBc
         LE2rxmegqNO9YE2WmyIfy6NoVgqAsNtMW6yBcWPO2nwH9wWrSOqQal672hJL3uj8VekK
         dpLZAH+DLlXG3gzdjEkZ9PndSbwxpawkk4A14wal7Vmy1xcyRsockqdy0WVmwJhGnS2B
         zIyayKrLH57GPGAGr4cqEZwGZu0CBZYzENdKw1sHzeMXckRW5W3DUABouvEAmz5FAeqF
         aKqZ6ascRsKbCfyf1jfE/BcashCtH2lU3UC1Yz1MHum6rpaJF1HKrliKAz6p1Av9erRx
         /r4A==
X-Forwarded-Encrypted: i=1; AFNElJ9yh6xmFTiljZ3kYqIYRkzgxWogjWJtXTaVayUOeP6ghRe5AXQeuoFUKZhKqku6GGeE6U6hoc+IeWDf7L+bj2s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm7y8xczHzipgY07o/kB7Mm3cauUdc+ewMNE+c4FPgMfBF362i
	bOjTB45DNTsQG1xa8WqNXXyFQxvgYtnEQEITQNyurLXaE0/QlXe2MxzQ
X-Gm-Gg: AeBDiesaHrqE4xctVFbXPcDMalHGHsc+/5sP8LoMzQ5GLv9kbU55U88u4rVB+SV5uxh
	OzgFyDA6JzIX4st0bq3+6lPGsttDoM4NYJbhT4kiJN8Cr3qv7uN+LcuLUrOaio0Fzg30i5rTX/+
	tNW0bJqDbVoDc2nkE+LavEL2od+SXY+1Dsqz0/9u73yMKqke5X4lJ4ifOMxljh5bGdOjhAE3XEJ
	HAMCc1INZwVFnRDre41gJyB+u/dOAkytm9MTZrGtuX6xMZA+va/i1PcwQcGrUyXnTTOWfcfi+9x
	NWwVQOnE0K7PGFW5pWtVmybxmTKNAlqzqOPRQh6g/v4v34aeTVhlQ/OD8lIUQDDailn3dvUBIoA
	nz/oeT0cCZVCzwA+wWSBls1bx2k/iuji5l72K+lRU8vLnrcj0Iexz3GPzwbCsFfqhzRQxtVcUGa
	kYbmhpj+gJgCN555OUB8/0C6F/WZxDLsAg
X-Received: by 2002:a05:690c:6987:b0:79b:cd3a:a5c7 with SMTP id 00721157ae682-7bcf50cba57mr49522287b3.11.1777416136081;
        Tue, 28 Apr 2026 15:42:16 -0700 (PDT)
Received: from localhost ([2a03:2880:f806:12::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd25183ff8sm4798037b3.10.2026.04.28.15.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 15:42:15 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Tue, 28 Apr 2026 15:42:01 -0700
Subject: [PATCH net-next 04/11] net/mlx5e: convert netmem_tx from bool to
 NETMEM_TX_DMA enum
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-tcp-dm-netkit-v1-4-719280eba4d2@meta.com>
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
 drivers/net/ethernet/mellanox/mlx5/core/en_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_main.c b/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
index 5a46870c4b74..fc49aae38807 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
@@ -5924,7 +5924,7 @@ static void mlx5e_build_nic_netdev(struct net_device *netdev)
 
 	netdev->priv_flags       |= IFF_UNICAST_FLT;
 
-	netdev->netmem_tx = true;
+	netdev->netmem_tx = NETMEM_TX_DMA;
 
 	netif_set_tso_max_size(netdev, GSO_MAX_SIZE);
 	mlx5e_set_xdp_feature(priv);

-- 
2.52.0

