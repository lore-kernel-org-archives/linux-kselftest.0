Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07ED8388E46
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 22:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777416137; cv=none; b=L+59LYH57hkMnFB1Oha5jGO38RX5932/ewEMNlkNohC4PvR9umfBje3zKOlDQc3kkg/rYYh6HynyvzFz0DmxV9j2Bnzsn97Zf2AFNv05eBhyVVsXcR/vJ+us4+PL6M5StneGMTVzeRdukpQQ/ThPnjZZocyH7wFvQ0Rq/QRw6XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777416137; c=relaxed/simple;
	bh=yr6AoTDFdh4MqEMxnu13OdxlbpWzGzc+BNKVis4NGcE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aJWfj7marcwFsckegBQ6RcWom38vVpJ3QHl79nEd5qnV5aZG2VG+ORWeqWuZ+px/9Z2iirCozT/Ib2dHmwxOzRhE+OyVZLfSGuAsNEDPTDv58gKuZZXPHG5nT3bgX8BTOZRrVNUZnAmHpZqmnh8VfKFqBmRKcjUmDXBvUOwzBrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MaJDSLxa; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MaJDSLxa"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7b4ee3a88e1so128125107b3.1
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 15:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777416133; x=1778020933; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2u+rkDBVuW0DwLrX33JN+GmAXBBEhpi2PB6tf5nm73I=;
        b=MaJDSLxavajfyTAEJdCYLscgPlaC+Dwf52Se1w0ySLkONCRh3lvD0nvWTqcSgKT5N/
         clsbq79Yt6nnYgqYiOL42WNO4gWNgtpTOPi1lAEB2TQlqhxVqPaTiF+9Ng/1t75R+4Da
         okaMGdldIL2/B7Cgr6hBux+zeGp7IK/rkemNH0pO46Wwgxw4nptWtU3AhUEoq3ZB+sS4
         Uz38CJlekYWJzp6I1yaBbe3XzEcYWNTkVGK04Ta1ngfbTDhXupGicOdbNnBMtynMT+P0
         AnCpNI7xwvekjyUDsV53iUOG6/dg/N4KUQnA0E7O4qHMC5CJyCBKOxGaS+MwXivXE3yX
         SVaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777416133; x=1778020933;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2u+rkDBVuW0DwLrX33JN+GmAXBBEhpi2PB6tf5nm73I=;
        b=oSpHrSpoIwuseVUqnpnyT8GiLZon/B4NJeMpQgdRoq3wtOKBYgwyffe+hb8xogjnmi
         IECFwgZmyH/BnYId4JZCOssPA0uoSUPNTRZODdTc0mbU1jOaQR4fnJqg1gfT2k/HRMce
         b7rfOP4amIKYt5Cn9oVWV+hBTcQ22AWkpOOQYLBkdAWIJQFthh8BrWUhr0UipEtV4YVs
         k4rsHWyfGHAKhCftLVZ508+Oy8RRxSn91mM4EJOvN9GPkGjYyJ7bms+QLITdEbVFbuEe
         gI4kNw6rin18tOzfemF3rNmGhsW6IwtEsl32YkXDjmLCiuuQ+ycVAxFism7Yza68vkXB
         LHUw==
X-Forwarded-Encrypted: i=1; AFNElJ8mCcvVwQXw+30Hz0SajyrY1x4a1RuDaSHHiYiTJFnviSwSG3wOE2NRMcHP0Mj9d24qT2t/h/aQKl/EI2E5ySY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKLMPokM59K+fntWL5Ydcg8HrzZRJim7968MuNQuMToMIJX71n
	PjGLo/4Ig/bb+phmh9Wl8LlWKVyWPGL47eQSSbPI5kcX1BRNHUNPtHRY
X-Gm-Gg: AeBDies417dfT4Iu27lIURkjGjI551084je1ySfQIV5V4ClH8K12Zc/haUIUjD6OQ17
	ttMAAKJENuNDbOhL7vCxfQ9Dmof6r+n1ZxnYCtyf7pGm5jLFRQ/xUDd6puhlMVgzgQoXULtYKUJ
	uvxfPDYv7GRuqbVl82sRyXrNOiSLrxRJRnjHCW5z2Smi1qpW0hy04SKuaowZ8gNqhXWUgpJyvjO
	ZafI54EuBCLFRBkKc1IfxnwusP2C/qGmamf+1UBHWKJ4W4rW8OdYOd8k3Acsgnv532Si+rKS9H6
	M/xLnBZB7Zzrb/tvtHBD+BBDkmijn7K8HhAoMFjtYL6Wb6qVcAZ6k0EQOhrvK0EKejyobX9bEEX
	RTRV+Fo2LG+fbwNSfHPUNCSBeqwmiThUWgW7jzh1ooOBW7VtgsTkgI5kX9t1FONLhppJGIYc6el
	IFv8lq2uzBZlg6vGePUmlqMa/XSZPRYlAP
X-Received: by 2002:a05:690c:660c:b0:7b3:9f53:9374 with SMTP id 00721157ae682-7bd1d378604mr17118827b3.3.1777416133033;
        Tue, 28 Apr 2026 15:42:13 -0700 (PDT)
Received: from localhost ([2a03:2880:f806:4f::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd258cc768sm4466607b3.35.2026.04.28.15.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 15:42:12 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Tue, 28 Apr 2026 15:41:59 -0700
Subject: [PATCH net-next 02/11] net: bnxt: convert netmem_tx from bool to
 NETMEM_TX_DMA enum
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-tcp-dm-netkit-v1-2-719280eba4d2@meta.com>
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
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index 8c55874f44ca..ed9c22dc4a5a 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -17120,7 +17120,7 @@ static int bnxt_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 	dev->queue_mgmt_ops = &bnxt_queue_mgmt_ops_unsupp;
 	if (BNXT_SUPPORTS_QUEUE_API(bp))
 		dev->queue_mgmt_ops = &bnxt_queue_mgmt_ops;
-	dev->netmem_tx = true;
+	dev->netmem_tx = NETMEM_TX_DMA;
 
 	rc = register_netdev(dev);
 	if (rc)

-- 
2.52.0

