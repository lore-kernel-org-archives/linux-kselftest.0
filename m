Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497AA426699
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Feb 2026 15:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770218418; cv=none; b=CnP+ZkFfo7RB5ACRTa1F3RCrcScisEf/+zUW65/yFHH/nBSm/RdWm/CD+XVhwzhPFGqqj1v6ywr9FVs3Ij9hTPWqIRrMOG4putCZNYIisFNd/nGHcAnZfF0/V9EpVuVj4wQXMFk2BJ+0oY/R3jcfmXrpaMQL3KpbGyH6CjED6tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770218418; c=relaxed/simple;
	bh=zQR7YikApmhdQmv/Akonfc2j5j4bYx9WbU5MxAEwt/k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ilwLc3UACZRRLpk3FK6BSzrmk/5CqzI84DfWVTaVeXvOEnZPn07dKIj9MRJxpXyTLeLdlYkcQvm5o1rOp/3U2gEcUk4NztRBVwhwPkisyQm8gckoIyjm33PVYlyLTTF9K8NA8c0pgNUu4C3utbo/NB54gWZ8BmPDAqXxL9lL6pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ggQ7GbAO; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ggQ7GbAO"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-794f281eb04so20268667b3.2
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Feb 2026 07:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770218417; x=1770823217; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6O2MApH+Z2XpLOqXr6VFFQHet7k4aNKtWz6QvpY9Kkc=;
        b=ggQ7GbAOsgT/bOovXngkDCS2rvDW3FRTxQip1i6vN4khY8JVZLg9Zpwvr/U3PX73eW
         ksUTUa9vhmnYGAv8Wx+Ywjz7HpPDpGb6nlhmgJWmj+wYqgtzuykOysfowPx4AMcGJ2Q9
         XtSWBeFRoAqDCDL0rkgt050iJVYSOWlQ2wXZD3ctfZ0sxlrBuVv9uq6nNRUwmp2stkie
         a850Zmf9uuAm+FFKvtYmdECrV8F3Cb1mZ3HF2gu9xaRx60KgnLFm2GXi+GKy8/g8zX9U
         IkC1+RApnyLIFN7AvBlDBMT++feJID4q/CBu8J/iE+vWGgcN28nciRnqPjTyaf9bvL1e
         aXyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770218417; x=1770823217;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6O2MApH+Z2XpLOqXr6VFFQHet7k4aNKtWz6QvpY9Kkc=;
        b=i9hnMy/g4u9KHu2Wkd62t55/5WqmCyUcDdmtQDgYqnFlpyCQkHQy8zcLUUxcFz96xC
         U3e5yvry1+0E4i/UCZ84zjC1vIsnMfV0l6HfC9Tjbl4tOEt7EGo5+gkLUhdkLjkyM7mf
         6pHr65AcglPj1+I0uu/CVYy+ReTrMv6/bLcrbsXPqU8zjD1gZmfjqXmCaiWmsPbjTzAt
         Tc0lt/SZ1QV1menIBxOxj+HBJHIkXNlJkxTAJE7e+1+AAPQaeK8Uo9tmlDxBKNzA0bEO
         ETyFamj/GnpH8xVRUh0PnI4y66g2BMsp4uG3gyJ644sAN9l1NAX34hJpzrPcaFWMLJru
         hM6Q==
X-Forwarded-Encrypted: i=1; AJvYcCX2L/q1648EXXBwyXZwW7vGrZAFrE96xkmneddn4Kj70uDKAqyvci4q/wShHAwVGbHzXI9fRmd2WCVNfDcQITk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9nXZKXLgNain/5eWYzqwCJK3j+T6vx5KLyvDjh/tu5GGtWjTF
	e6ofDg3aQ7+BsbJB7T0pzVh9RyQkQqwANjil0Mri//sYndFc2dF9CZkd
X-Gm-Gg: AZuq6aJI5yBIq2KFSQq779KzvUpKjRFBfP254CgClHm3utjvDKtgpSKnbMoxkoqUaTC
	qvnbauKQ3lo+lFGzQYQIx6nNjJvN0cxkq+dzlBbewTb3plhkMaCMrMdfR4pBJDJizxPoSQZH8W5
	As2gKj7U3XLm3vBC18u5ILjCKT2/dzc1Fkg2IvPr1C8LSp7rodAwfI7VpMNcylgS8LHlKYDUw5Y
	xoPdHIQwFP1oAtr9SAXa6zataPfUymJ2WLGtxddMnMV+VIjzHnYukKlaHIh/rT0XsiPDUg3Vabe
	SJpPWhz2s2w5TdRofDTKcbReXd5TcMw5fOBp081yINAmeLqEBki3Lf0jMW/aa+SrmZSEL+zvJpc
	j6h4Y6p08JtihDeszKOwtIiwbclCaoeuJmDKy91iEWXZUTCMcaPRyUEEkYKAQBfD/Nxm8CBOl2m
	zh/nQ5tMgB
X-Received: by 2002:a05:690c:e3cb:b0:793:ac88:2a49 with SMTP id 00721157ae682-794fe797368mr67590857b3.49.1770218417261;
        Wed, 04 Feb 2026 07:20:17 -0800 (PST)
Received: from localhost ([2a03:2880:25ff:42::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-794fefef59asm23210007b3.50.2026.02.04.07.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 07:20:16 -0800 (PST)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Wed, 04 Feb 2026 07:20:11 -0800
Subject: [PATCH net-next 7/9] mlx5: psp: implement deferred tx key deletion
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260204-psp-v1-7-5f034e2dfa36@gmail.com>
References: <20260204-psp-v1-0-5f034e2dfa36@gmail.com>
In-Reply-To: <20260204-psp-v1-0-5f034e2dfa36@gmail.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Donald Hunter <donald.hunter@gmail.com>, Boris Pismenny <borisp@nvidia.com>, 
 Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
 Tariq Toukan <tariqt@nvidia.com>, Mark Bloch <mbloch@nvidia.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Daniel Zahka <daniel.zahka@gmail.com>
X-Mailer: b4 0.13.0

Implement the deferred tx key deletion api. In the case of mlx5,
mlx5e_psp_tx_grace_begin() records the number of wqes retired on each
tx queue, and then mlx5e_psp_tx_grace_end() returns 0 only if
all tx queues have advanced a full ring cycle past the point where
they were snapshotted.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
 .../net/ethernet/mellanox/mlx5/core/en_accel/psp.c | 101 +++++++++++++++++++--
 .../net/ethernet/mellanox/mlx5/core/en_accel/psp.h |   7 ++
 drivers/net/ethernet/mellanox/mlx5/core/en_stats.h |   1 +
 drivers/net/ethernet/mellanox/mlx5/core/en_tx.c    |   1 +
 4 files changed, 104 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_accel/psp.c b/drivers/net/ethernet/mellanox/mlx5/core/en_accel/psp.c
index 9a74438ce10a..30f1dbc3fa9d 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_accel/psp.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_accel/psp.c
@@ -1059,13 +1059,102 @@ mlx5e_psp_get_stats(struct psp_dev *psd, struct psp_dev_stats *stats)
 	stats->tx_error = atomic_read(&priv->psp->tx_drop);
 }
 
+static int mlx5e_psp_tx_grace_begin(struct psp_dev *psd)
+{
+	struct mlx5e_priv *priv = netdev_priv(psd->main_netdev);
+	struct mlx5e_psp_tx_snapshot *snap;
+	int num_channels, num_tc, num_sqs;
+	int idx = 0, rc = 0;
+	int i, tc;
+
+	mutex_lock(&priv->state_lock);
+
+	num_channels = priv->channels.num;
+	num_tc = mlx5e_get_dcb_num_tc(&priv->channels.params);
+	num_sqs = num_channels * num_tc;
+
+	snap = kzalloc(struct_size(snap, wqes, num_sqs), GFP_KERNEL);
+	if (!snap) {
+		rc = -ENOMEM;
+		goto out_unlock;
+	}
+
+	snap->num_channels = num_channels;
+	snap->num_tc = num_tc;
+
+	for (i = 0; i < priv->channels.num; i++) {
+		struct mlx5e_channel *c = priv->channels.c[i];
+
+		for (tc = 0; tc < c->num_tc; tc++)
+			snap->wqes[idx++] = READ_ONCE(c->sq[tc].stats->wqes);
+	}
+
+	priv->psp->tx_snapshot = snap;
+
+out_unlock:
+	mutex_unlock(&priv->state_lock);
+	return rc;
+}
+
+static int mlx5e_psp_tx_grace_end(struct psp_dev *psd)
+{
+	struct mlx5e_priv *priv = netdev_priv(psd->main_netdev);
+	struct mlx5e_psp_tx_snapshot *snap;
+	int num_channels, num_tc;
+	int idx = 0, rc = 0;
+	int i, tc;
+
+	mutex_lock(&priv->state_lock);
+
+	snap = priv->psp->tx_snapshot;
+	num_channels = priv->channels.num;
+	num_tc = mlx5e_get_dcb_num_tc(&priv->channels.params);
+
+	/* If channels were reconfigured, tell core to restart grace period */
+	if (snap->num_channels != num_channels || snap->num_tc != num_tc) {
+		kfree(snap);
+		priv->psp->tx_snapshot = NULL;
+		rc = -ESTALE;
+		goto out_unlock;
+	}
+
+	for (i = 0; i < priv->channels.num; i++) {
+		struct mlx5e_channel *c = priv->channels.c[i];
+
+		for (tc = 0; tc < c->num_tc; tc++) {
+			struct mlx5e_txqsq *sq = &c->sq[tc];
+			u32 ring_size = mlx5_wq_cyc_get_size(&sq->wq);
+			u64 current_wqes = READ_ONCE(sq->stats->wqes);
+			u64 snapshot_wqes = snap->wqes[idx++];
+
+			/* If the ring has cycled, any key_id handles in tx
+			 * descriptors must have been consumed by hw and
+			 * cleaned by sw.
+			 */
+			if ((s64)(current_wqes - snapshot_wqes) < ring_size) {
+				rc = -EAGAIN;
+				goto out_unlock;
+			}
+		}
+	}
+
+	kfree(snap);
+	priv->psp->tx_snapshot = NULL;
+
+out_unlock:
+	mutex_unlock(&priv->state_lock);
+	return rc;
+}
+
 static struct psp_dev_ops mlx5_psp_ops = {
-	.set_config   = mlx5e_psp_set_config,
-	.rx_spi_alloc = mlx5e_psp_rx_spi_alloc,
-	.tx_key_add   = mlx5e_psp_assoc_add,
-	.tx_key_del   = mlx5e_psp_assoc_del,
-	.key_rotate   = mlx5e_psp_key_rotate,
-	.get_stats    = mlx5e_psp_get_stats,
+	.set_config     = mlx5e_psp_set_config,
+	.rx_spi_alloc   = mlx5e_psp_rx_spi_alloc,
+	.tx_key_add     = mlx5e_psp_assoc_add,
+	.tx_key_del     = mlx5e_psp_assoc_del,
+	.key_rotate     = mlx5e_psp_key_rotate,
+	.tx_grace_begin = mlx5e_psp_tx_grace_begin,
+	.tx_grace_end   = mlx5e_psp_tx_grace_end,
+	.get_stats      = mlx5e_psp_get_stats,
 };
 
 void mlx5e_psp_unregister(struct mlx5e_priv *priv)
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_accel/psp.h b/drivers/net/ethernet/mellanox/mlx5/core/en_accel/psp.h
index 6b62fef0d9a7..29800050a331 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_accel/psp.h
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_accel/psp.h
@@ -22,10 +22,17 @@ struct mlx5e_psp_stats {
 	u64 psp_tx_bytes_drop;
 };
 
+struct mlx5e_psp_tx_snapshot {
+	int num_channels;
+	int num_tc;
+	u64 wqes[];
+};
+
 struct mlx5e_psp {
 	struct psp_dev *psp;
 	struct psp_dev_caps caps;
 	struct mlx5e_psp_fs *fs;
+	struct mlx5e_psp_tx_snapshot *tx_snapshot;
 	atomic_t tx_key_cnt;
 	atomic_t tx_drop;
 };
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_stats.h b/drivers/net/ethernet/mellanox/mlx5/core/en_stats.h
index 09f155acb461..5173a0d3f01a 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_stats.h
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_stats.h
@@ -445,6 +445,7 @@ struct mlx5e_sq_stats {
 	u64 cqes ____cacheline_aligned_in_smp;
 	u64 wake;
 	u64 cqe_err;
+	u64 wqes;
 };
 
 struct mlx5e_xdpsq_stats {
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_tx.c b/drivers/net/ethernet/mellanox/mlx5/core/en_tx.c
index a01ee656a1e7..412ebc160056 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_tx.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_tx.c
@@ -883,6 +883,7 @@ bool mlx5e_poll_tx_cq(struct mlx5e_cq *cq, int napi_budget)
 	wmb();
 
 	sq->dma_fifo_cc = dma_fifo_cc;
+	stats->wqes += (u16)(sqcc - sq->cc);
 	sq->cc = sqcc;
 
 	netdev_tx_completed_queue(sq->txq, npkts, nbytes);

-- 
2.47.3

