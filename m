Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794952460;
	b=CmkUzXQB/gAl1eeLzrn5nCmni2IcKt8LK8VYKtSkGKwp51n2X02zphC0/gWkyGzKPnfN
	 4eHCWXYjdNk8UdxAm15jXNzDUeQ6o8GvvYN1+SAbrCTtF2KiX+KTxzM37/SwA+peYU6l1
	 qLtqUOWuUOyawS5jH5ZD+PsXd1jcba4uFtFGIx0VWzG3u/pTR5L2Mov3Ev0njK6DzIh9k
	 JDqQaVmxm9vn+R1vU2VKvtUtTpbQltb9zxJbZM5GuZkb7s6Rfu5BDAhjBkUUoDQYX1ni2
	 MvdSlIljPu9m+SX6C1fwtgziSh/RvgJ8INbixcRJAo728DIj7K1FX0XbXsCceZWVIVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794952460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8bB5b1dVANHFI9CUE+jOVpzaE3fUb8dk6NW9fqF85O8=;
	b=vyWjQY0PXlTKZ5+3six64gYihfmC9W4nAjiXce9rxUyw/0jIsHv1EqZcA8m8ayQUw1g4
	 XBYi1TCdXoWoFm9EJcBttt3Zg7S+fBGk7blF0cMFWXeITHzbjJ6vbtnbgmlbKR3Z2tKLo
	 pOjJBYLRk7/Rk6TKM/zjGkTa5idWqko6AxaZneS/PgbDSgMuEkAFWH9u7UCBQ5MRlkht9
	 xaNoyu559FNdDSyN8FvZ8OC3mROngX4xSbyI1zo5zNK0WvGxKMoEIti6e0iUekp7V0ZVt
	 qak+dJ+2uDr9LwdYbqg1Jde0AmleekZvtxYKwZ/EQuOr5apyyUOBlzYfd+qpsQC8CfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EngG3o59;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0BA606A333
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 21:54:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E0BA606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EngG3o59
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so152529a91.3
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 13:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794952460; x=1795557260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8bB5b1dVANHFI9CUE+jOVpzaE3fUb8dk6NW9fqF85O8=;
        b=EngG3o59wsEORWZNDZq6YsECulQhNEFJhHotm5bNd2cBz9+OO5TKydxKiwnMJ1/Djv
         rxsDPsWK9FNe2y6CufTPr0gwrMYrA+rSEu4aTJ4p4cV5/hD+YfQhsg3joUNnq/a+CINP
         soTsqr6kQ/gH9bILc9C//cxuDpO5g7CoN9HPZmbKGlKjUtdOztqc8Z4YpwhGfBNhSBRv
         M+u0fBJvRRhjkjjSQVcsPgRKVi6e7N471L25KC3upPS/d7uCZ11iwJUeajfnOvqQfYB0
         t1imIbQGKrNYKdd2xOsmv2XTLkrprXDdknuhwVUcujcQObK5O8bp/6VCnOnY/JpWvQo+
         b6Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794952460; x=1795557260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8bB5b1dVANHFI9CUE+jOVpzaE3fUb8dk6NW9fqF85O8=;
        b=aEXtG7YJLUzkm4hL1W0FCNqARuHvC5mMDONdm5E3o43hfCLQZF6fFL+5fmNdG5yGDs
         Jod7JqVtf0j1M/2Ar6yzwCZbICGtbER1+nlojyPtpKiU544z9aMKYMoXBxV92823cuBS
         ORJeiQ1DVon0eDpEvpeeJ2mNF69AZNyNjq/wDVs6KCK+EcRq7TydPtNED6WyxOCj16Vr
         WQjD6YsqpzLwtZ1SVQEoCpZGi93xUAqOYevU0PzarLfnRVxGKymfXhqK61NLWuYioX5h
         lfkhOaBIlJjMIDS3vie9IkVc3dTSVkO4bPemf3ciRXpTmkYefng/+u7OKdqF6Yo/4PII
         QIKQ==
X-Forwarded-Encrypted: i=1; AL+hErF9u237315C/YvMcjNRbCOaWxExl8DgETZkvMcNgrep5x24QZnlzEAwmecUjeBVqGkeyjBOwXSYkZ1HELxgU4Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+y4h8kMRRm8QGeq+UHAjiOgq/+yAzMCG1XweLnmt1VXqMrQm9y
	NLvIFrPH+JqjoOqIrJyvh66Ym6aSpLnQnG4vPrcuRSFnu0j0bdDpPdKc
X-Gm-Gg: AZFdTZdH6swjeqCFQivjrfP9wzU+MgmAiHC/9q+dz/mnNajJS5W1zNxG9EQ7nWKboL5
	yaIxwCWngMyvA0Mo6TInSPU0VyNoVOo8aa4mki4ryfN9+iTKbyaAXEQNcyGOW3+9z1DNhqe+zjg
	hN9FWexZisQGhYteZ+M2G+ic4TrJRkotMhtr7YcXIu1l0ebyfV76lsytKeArs56mPJmNM5ZJXhg
	AYJkXqXgNuaH/Nqm6crI735HzyK1c11UqvFazAC7+HV+D7zyE2qPHl4o1QW6Ebe2AHrYvJHC/6b
	MI+RlfUaEQ3TXjA42GG2XSoGebcR+oTSPZHMyeiNByrM18VCqdq1nR5w+gP/hpWvuVrK1/8ePc/
	MnwxFF18trjaxtfVSy5wnCPGYBUmlOvBv5HTskr6ClVrn1PdAapszyazwrU6x8bmGJ0AV+MJVZi
	Vhc58k8ts+huKQo9CEcIB0C9xBtx3MR7Yq7bwpwFtLxFUOibyNRhG8oJey92oCwJ2HdsXsfx07S
	vHjgmEWz3yUtKCg57OWdUEA2ouy/5Cjx7pLymqYT9Xcn+BGGzac96LZ5QfbJfavk902zK10Eayo
	i8E02/eccpGveSORWqOkqdDPCGXxaTDTsuU=
X-Received: by 2002:a17:90b:1649:b0:3b3:a9a4:8c9a with SMTP id 98e67ed59e1d1-3b3d064200emr728386a91.1.1794952459801;
        Tue, 17 Nov 2026 13:54:19 -0800 (PST)
Received: from localhost ([2a03:2880:7ff:52::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b4ecdsm733695a91.7.2026.11.17.13.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:54:19 -0800 (PST)
From: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Cc: Alexander Duyck <alexanderduyck@fb.com>,
	Jakub Kicinski <kuba@kernel.org>,
	kernel-team@meta.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Mohsin Bashir <hmohsin@meta.com>,
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Simon Horman <horms@kernel.org>,
	Mina Almasry <almasrymina@google.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Dimitri Daskalakis <daskald@meta.com>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
Subject: [PATCH net v2 1/5] eth: fbnic: wait on the correct queues in fbnic_queue_stop()
Date: Tue, 17 Nov 2026 13:54:12 -0800
Message-ID: <20261117215416.1901246-2-dimitri.daskalakis1@gmail.com>
X-Mailer: git-send-email 2.52.1
In-Reply-To: <20261117215416.1901246-1-dimitri.daskalakis1@gmail.com>
References: <20261117215416.1901246-1-dimitri.daskalakis1@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dimitri Daskalakis <daskald@meta.com>

fbnic_queue_stop() waits for every queue of the NAPI vector to go idle
before tearing it down, using sub0.q_idx as the queue index. We set
q_idx on submission queues for Tx, and completion queues on Rx, so
this waits on queue 0 for every Rx queue.

For non-combined channels, stopping an Rx queue always stops/wakes
Tx queue 0.

Set the queue id on Tx completion rings so we don't have to distinguish
between ring types to get the correct queue id, and don't stop/wake
disabled rings.

This bug was found by AI and verified on HW.

Reproduced by binding a devmem dmabuf to one Rx queue (netdev bind-rx).
Added a printk to fbnic_wait_queue_idle(), and traced Tx queue stop/wake
with bpftrace.

  combined 79, bind rxq 1:
    before:
      netif_stop_subqueue(1)
      fbnic_wait_queue_idle(tx, 1)
      fbnic_wait_queue_idle(rx, 0)
      netif_wake_subqueue(1)
    after:
      netif_stop_subqueue(1)
      fbnic_wait_queue_idle(tx, 1)
      fbnic_wait_queue_idle(rx, 1)
      netif_wake_subqueue(1)

  rx 34 tx 34, bind rxq 5:
    before:
      netif_stop_subqueue(0)
      fbnic_wait_queue_idle(tx, 0)
      fbnic_wait_queue_idle(rx, 0)
      netif_wake_subqueue(0)
    after:
      fbnic_wait_queue_idle(tx, 39)
      fbnic_wait_queue_idle(rx, 5)
                                ^ no more stop/wake of Tx queue 0
      (tx 39 is the XDP Tx queue of rxq 5's vector,
       Rx queues always get an XDP Tx queue)

Fixes: da43127a8edc ("eth: fbnic: support queue ops / zero-copy Rx")
Signed-off-by: Dimitri Daskalakis <daskald@meta.com>
---
 drivers/net/ethernet/meta/fbnic/fbnic_txrx.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
index 07d4b2e92362..5efed21e5932 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
@@ -1772,7 +1772,7 @@ static int fbnic_alloc_napi_vector(struct fbnic_dev *fbd, struct fbnic_net *fbn,
 
 		/* Configure Tx completion queue */
 		db = &uc_addr[FBNIC_QUEUE(txq_idx) + FBNIC_QUEUE_TCQ_HEAD];
-		fbnic_ring_init(&qt->cmpl, db, 0, 0);
+		fbnic_ring_init(&qt->cmpl, db, txq_idx, 0);
 
 		/* Update Tx queue index */
 		txt_count--;
@@ -3047,8 +3047,11 @@ static void __fbnic_nv_restart(struct fbnic_net *fbn,
 	fbnic_wr32(fbd, FBNIC_INTR_SET(nv->v_idx / 32), BIT(nv->v_idx % 32));
 	fbnic_wrfl(fbd);
 
-	for (i = 0; i < nv->txt_count; i++)
+	for (i = 0; i < nv->txt_count; i++) {
+		if (nv->qt[i].sub0.flags & FBNIC_RING_F_DISABLED)
+			continue;
 		netif_wake_subqueue(fbn->netdev, nv->qt[i].sub0.q_idx);
+	}
 	fbnic_dbg_nv_init(nv);
 }
 
@@ -3089,13 +3092,16 @@ static int fbnic_queue_stop(struct net_device *dev, void *qmem, int idx)
 	napi_disable_locked(&nv->napi);
 	fbnic_nv_irq_disable(nv);
 
-	for (i = 0; i < nv->txt_count; i++)
+	for (i = 0; i < nv->txt_count; i++) {
+		if (nv->qt[i].sub0.flags & FBNIC_RING_F_DISABLED)
+			continue;
 		netif_stop_subqueue(dev, nv->qt[i].sub0.q_idx);
+	}
 	fbnic_nv_disable(fbn, nv);
 
 	for (t = 0; t < nv->txt_count + nv->rxt_count; t++) {
 		err = fbnic_wait_queue_idle(fbn, t >= nv->txt_count,
-					    nv->qt[t].sub0.q_idx);
+					    nv->qt[t].cmpl.q_idx);
 		if (err)
 			goto err_restart;
 	}
-- 
2.52.1

