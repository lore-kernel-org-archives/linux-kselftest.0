Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0607425CD9
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Feb 2026 15:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770218413; cv=none; b=ihv5m7SFnzj0zv9spTXhSBdoIzS24RdrzG3rUJdC0+pMhPkvaZCBcbSpqnJAetGqCUs699Ge2Sd7mo/BqQrdADiammBRRCYgSKQTgzPZWsUHHGwZsag/N8HilIB04haBDpGAsI1lVEMta4umDNcX5clVbocsuezFdOzbIOiy39U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770218413; c=relaxed/simple;
	bh=IXDSeUC5+cRE+OVG0Hf9hg9EzYy+I7cAflVjxV9P+y0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pWxfm5NkKB/QXo01vIskSH17S80nzepuOiMqwqSEHiGqseehiMxK8Dtv5BtLVIwCG/l0BUsmjGWX87E+a6C2mQxDB3bsIsYNUffJQ1OcW6ZHZGXXbmWufIXvTkJ4hj+c87vrSEa8Hsr4werVft1lBn1ZcVKnigs7LV2taQhepcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MonT7iid; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MonT7iid"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-79274e0e56bso67858367b3.0
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Feb 2026 07:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770218412; x=1770823212; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AS1GcH9E1CFOhJ9v6nYx4QtLIVjiKCkp4B8BLqgjvqE=;
        b=MonT7iidHBkKtkUYBxSbkZgl5HBkdQDtweR3E45Ss8HN4z53NWJH04WV/MNoOAJNwu
         eqt0ju6RpaHPY15eR9KhHvQ2eSKLsyzqWa77iny+rLgqeZ4SnwTu/0cNWPQjYXbQJlPe
         68Lb4Pl++dGGzF2E84Eyf3wdDQ6Nid9x5q3ntU7DI/T56HGhcbtdNpi2RquuGWiCuilR
         wFDuqKKVXVVXi8fKelIjaaBu8aKIXYK2rE4yE7vpJrqF/3XNvdx22eXFZ9YC2BFG+2p0
         Qv3Vs9EIRg/QTRi9oK4ovYy9KFYi5V6RAB1BDL4bRwhK4b3SW7Vvmem64yc7p6zUKXT6
         P1aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770218412; x=1770823212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AS1GcH9E1CFOhJ9v6nYx4QtLIVjiKCkp4B8BLqgjvqE=;
        b=UPAYx0Fa/Q2AYd+vGkYgJaKdm9f8sZ0GIrI/NcCZz5sSteEEj8wx9z/OLPDxfcPih7
         b7AGXahyQfNVdA3VbXtfr308qi7MlT43Wob2j4WhHm+vADACiyhr9qGG1drWBmJwSCdC
         Ly31CX+GpJpg5ReqlekLt5MzOy09XWxy1mF1z5c4U5kJ9EZrHEAh6vh07NUs7LVeICFN
         R8y1Czug0ozdWNWpkMc9lcTG30U1aRi/LMeGoM3I+uLMBGbz54CFT9J4IynGUWOOSK4E
         CsFdPrOL7QiLm9n1fCY6NACK2rX34Nosw+O5QIuKEgilbnCHpzZXhQrh15hhVah0HyGG
         AFFg==
X-Forwarded-Encrypted: i=1; AJvYcCWxq2u1UEkZmNDSGS2U3vxKi0A3vG1rB4b2r3qh/nd8G5nUfYSwUhWCVc7q3aQjeqflRw/biO1iQbTQ9mWWQsA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEeTiRWLQFaVbMB8bImWRS2EnPhcTMa/XbqKcj3RhD2N1XOOow
	nOQpuAxAfAT9o2ZA8/Pe0JU2NT0C9npoxHqbF+uOUoUIF4SX5P5gsFLE
X-Gm-Gg: AZuq6aLPYyyOctBggQFMqUzIMFcNOKouUC9iDCZ9qV2HsYhBsy2ozw2hSFly7J5iWMN
	BU3mPfhf0OD2u2E0LhyVTNEx8T+QErAxVUZLHd6jHCy/EIvFEYdcSDc9ci0MJq8O938jBnsc1uA
	t8QRgTKsqn5un7tT4TgHql+508HWIr4MOsXBEyNjxQSGzhT8Yp9gOx3YyPHLOZhIUNviGVMTxVW
	jFCuRTpeKriPQyS9I1LV8bgZpcntUWrjdcbn59Dgyl28GjR7BX7eAhPVlPuNQBt/Y6h+HfDYLPE
	zUUmAHI0UMgUE0DthJTqkMDxMFRof5JmKwL+xG2e0ipiXFiccMBk4MS1NbB5LrmXjklx7uIiknQ
	hzyFKs/NgKhyGfFqy/+9ksgQoJr/mDg2wInF9VfCM8WpsGGFUZdGZrELxSvHGdM2UoXJWPpNAP0
	k3FbDgCkT6
X-Received: by 2002:a05:690e:408d:b0:644:71e8:cd02 with SMTP id 956f58d0204a3-649db32ce54mr2737934d50.4.1770218411558;
        Wed, 04 Feb 2026 07:20:11 -0800 (PST)
Received: from localhost ([2a03:2880:25ff:70::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-649dc5ad347sm2601094d50.16.2026.02.04.07.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 07:20:11 -0800 (PST)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Wed, 04 Feb 2026 07:20:07 -0800
Subject: [PATCH net-next 3/9] psp: support tx rekey operation
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260204-psp-v1-3-5f034e2dfa36@gmail.com>
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

The tx rekey operation creates a new psp_assoc with the same rx state,
but with new tx state. The new psp_assoc will reference the current
assocs 'prev' assoc as its own. The assoc referenced by
'sk->psp_assoc' will have its reference dropped and be freed.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
 net/psp/psp_sock.c | 51 +++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 45 insertions(+), 6 deletions(-)

diff --git a/net/psp/psp_sock.c b/net/psp/psp_sock.c
index 9b0ecce8350f..f429b8b2d8f2 100644
--- a/net/psp/psp_sock.c
+++ b/net/psp/psp_sock.c
@@ -215,6 +215,47 @@ psp_pas_set_tx_key(struct psp_dev *psd, struct psp_assoc *pas,
 	return rc;
 }
 
+static int
+psp_sock_tx_rekey(struct sock *sk, struct psp_dev *psd, struct psp_assoc *pas,
+		  struct psp_key_parsed *key, struct netlink_ext_ack *extack)
+{
+	struct psp_assoc *new;
+	size_t pas_sz;
+	int err;
+
+	pas_sz = struct_size(new, drv_data, psd->caps->assoc_drv_spc);
+	new = kzalloc(pas_sz, GFP_KERNEL_ACCOUNT);
+	if (!new)
+		return -ENOMEM;
+
+	/* don't increase refcounts until we know we won't fail */
+	new->psd         = pas->psd;
+	new->dev_id      = pas->dev_id;
+	new->generation  = pas->generation;
+	new->version     = pas->version;
+	new->peer_tx     = pas->peer_tx;
+	new->upgrade_seq = pas->upgrade_seq;
+	new->prev        = pas->prev;
+	refcount_set(&new->refcnt, 1);
+	memcpy(&new->rx, &pas->rx, sizeof(new->rx));
+
+	err = psp_pas_set_tx_key(psd, new, key, extack);
+	if (err) {
+		kfree(new);
+		return err;
+	}
+
+	psp_dev_get(new->psd);
+	if (new->prev)
+		refcount_inc(&new->prev->refcnt);
+	list_add_tail(&new->assocs_list, &psd->active_assocs);
+
+	rcu_assign_pointer(sk->psp_assoc, new);
+	psp_assoc_put(pas);
+
+	return 0;
+}
+
 static int
 psp_sock_set_tx_key(struct sock *sk, struct psp_dev *psd, struct psp_assoc *pas,
 		    struct psp_key_parsed *key, struct netlink_ext_ack *extack)
@@ -269,13 +310,11 @@ int psp_sock_assoc_set_tx(struct sock *sk, struct psp_dev *psd,
 		err = -EINVAL;
 		goto exit_unlock;
 	}
-	if (pas->tx.spi) {
-		NL_SET_ERR_MSG(extack, "Tx key already set");
-		err = -EBUSY;
-		goto exit_unlock;
-	}
+	if (pas->tx.spi)
+		err = psp_sock_tx_rekey(sk, psd, pas, key, extack);
+	else
+		err = psp_sock_set_tx_key(sk, psd, pas, key, extack);
 
-	err = psp_sock_set_tx_key(sk, psd, pas, key, extack);
 exit_unlock:
 	release_sock(sk);
 	return err;

-- 
2.47.3

