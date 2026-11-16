Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830699;
	b=eVpYoZ9tpnTIjtKBOgJuU1pbRd5ph5DczeZQz1i9lOvU8yB9eQXyT6b4JzUTwuOhq9bi
	 caP5ORTqqklZyZ6y7b2viQS1FTJohhkYEg//VlmriEiUzo92/eNZXV6yi4dT+Db+nGGnE
	 AtaHfPx5+UNov3wjOYM1tFCZniqs57/A5S4sncgBqLabhN26kH6Fpdukpu6F80ir17Lln
	 v4kWJFXAdR0Qm1c0eLl5hcQRKoX4a+m85ndN5lIroE/xnSy03ElyWtk7JRXF4EKVwEART
	 ERzdxaTucjCEZNyamWD7P7bp8Yxo2ZsqezvbM4GeOqRilupcJdb9TmXzDd/gRn7b8jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830699;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=T8x2RfWqC4sWMy3tixcc28MUcdJoxePFEMTBw5xM84A=;
	b=cI/O+n/iBSFc2kUMrGa4o4Must2VSqDtN8FpoMJ7z5yM3RahZ9hLnV7NwvZFADA9MZkg
	 +Y2zDb03tLZZlyJpEdyWq5ujz7TkoLvqvfRfeMu8nAVoGOQs3NqDZkKmRHGtowVF/TCQl
	 BwBTDPqgmR+gHmNMDkG+VwFx6jtwxlfvj9dKJQGN6F9tIjDxlgoDRg1eWBu2dYLLQ6hMQ
	 oN6CL3dGyWuQ9iHd4We1LGBa//1awhXlUATm7J6UQ7rFYn0kfiIyz30HFBdtdtBgp4ZJ7
	 ipzIeBIUaKIh6nKn4rJwLXreFEruZN0pj9H9FmvzQCGtODfg4GcRseIEwFMH95kskpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0I5X9Fro;
	arc=none smtp.remote-ip=74.125.224.46
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE78606A33F
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 12:04:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDE78606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0I5X9Fro
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-67be1e468a8so2420159d50.0
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 04:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794830698; x=1795435498; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T8x2RfWqC4sWMy3tixcc28MUcdJoxePFEMTBw5xM84A=;
        b=0I5X9Fro5lTpqrbTIJJvYIobMHUh80nHVy51NkUgs0cZyJk7aueiHYWXPwaLeIOvZN
         qwJGzc6RrLUvj9I5DLGaQTXn1ewCUUSnKPbTTE7o5Ysx12G9MF3+NIe7DPP1Wtsr6BQa
         CoqU9SBM+he7p8Sxw0U51krnBadTzBWn+2yiALp24XnEhLwbfT/U3YB6/UFSmsxTSE7D
         ZSgoMOTZywFZ3HogO+Od+P3dPDl8TBVWHtCJmlWqMbhYbRvw8ansbw2YJ38ttYsXTWpB
         z0PtVq//0Ehsdgww5oEwRifxndf9H6qlH7wm4/akCrejK2nU/TgL+s4a8vZQFHwHPigH
         nwVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794830698; x=1795435498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T8x2RfWqC4sWMy3tixcc28MUcdJoxePFEMTBw5xM84A=;
        b=HU5ChVYntZypnMcAWYxAJ6anNxshwcQnHy3z3W2cNpl2itrGC7g1dE7ccz2lh7hglO
         3pxDfR6wJ9St3bXr0gnjutugK9jt2M8SpTtLub6HEdtayeHWggD5gDkjFxXIfkP01zPp
         wG6hLZoq4QHnHF0xShD3WNHHbtmxWeZwEK49LqaLV6zz4j+eP0j0SX4v4Tu4uRnQepoE
         sF6lRwJlGRl0pqb9XjWKwgBl1LJpR8wfZadnIyJOn951/zyoqpZ+Gue1rrliosfkk9rR
         Yq4WAFmjun2m7YyX5quE65Ju4a/eGqyVD9NpBGwgXcLlMSi9imvr28FU+RqNVAe8XA38
         8LCA==
X-Forwarded-Encrypted: i=1; AL+hErFj2ddKPAnpA7gbacsal+lbJKDZT73e6Ac3iJgitxjVCjzE2/u0/blP3fJGHWT0AFnLcdCU0Z48LXYn1vfchF0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9skjvjCmJsf6jmxR6vmDQ6ZSFwkbe+BODciw+qFqvYJuhN8cAR
	OzOOItN8BrH2seKktdXMz5Udw/GJ935L+svGe+3NC8Byc/+yv3djwhAPiQRN5r1v
X-Gm-Gg: AZFdTZeepM8fMUwf7YQgs4e/D+gcX5LE5H6hyOFOrq7HaF//kBWACxz7LmKn9g8yQgr
	w+H7S53iBeCg1cQXpdw4ZT6v/XxF/oFHqHrRF1BO9uXduocydXgiS7mqmQ6D4nz48vjjSrZqV1p
	19i0HsOMH03TblwKUqmUn6d3sxT3q35KhGSmtBFzezArn9RupcWgMeK6kZzWcuXtpwcmc35TORm
	4QG6FVngmTX+KlBdqQOe0T1NX9ECmSGVbEpSSf6jLSE91tEsj54Ju9uc3PhtJl9W1gvIDNDzerb
	wAhGQ/YBOSQEbcqF98FSbPuVhY+lm1wvS99aosHe1tJs4ZYLG57bD7dySpRgwnAafVvjZojuhUP
	vRDxhbelRJ/cL2rFsJmcmwzPSafLZkhoJNdP3AGodsfkipv41xfzzmY18FzlpeKzpzmH0j8oGE8
	W6Sbvcx3MFX37qaEzEZhd0F3s0Rmt9ajXG2qBMjsE79kIOL9r20FULwoalPlAesahxascRMBbWr
	qfzhCmczb3ODIVmVNztaRDnr1kyl2HqHH/0cQ2CwEphP1+vv9CmtgcGA/mH++RHqkvVzMxiJpss
	5SPJJHBtHrayhmhL8einuY3IKyM3xunRPHM30MOA6rjdUb+j
X-Received: by 2002:a05:690e:1c1b:b0:67c:b95:6757 with SMTP id 956f58d0204a3-67d897366a7mr6743663d50.80.1794830697852;
        Mon, 16 Nov 2026 04:04:57 -0800 (PST)
Received: from localhost ([2a03:2880:30ff:75::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67d8a59e70asm9706309d50.10.2026.11.16.04.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:04:55 -0800 (PST)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Mon, 16 Nov 2026 04:04:37 -0800
Subject: [PATCH net-next v4 2/5] psp: support tx rekey operation
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-psp-v4-2-1a599df2aefa@gmail.com>
References: <20261116-psp-v4-0-1a599df2aefa@gmail.com>
In-Reply-To: <20261116-psp-v4-0-1a599df2aefa@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Donald Hunter <donald.hunter@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Willem de Bruijn <willemb@google.com>
X-Mailer: b4 0.13.0

The tx rekey operation creates a new psp_assoc with the same rx state,
but with new tx state. The new association is spliced into the socket
with RCU to be used immediately in the tx path.

Drivers that use on-device tx key storage need additional logic to delay
key deletion until after any in-flight users of the key have been
drained, so return -EOPNOTSUPP for now.

Reviewed-by: Willem de Bruijn <willemb@google.com>
Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
v3:
- move the replaced assoc to psd->stale_assocs, so a rotation
  racing with its free doesn't count the socket twice in stale-events
- document that the previous rx SPI also stops being accepted once
  its device key is rotated out
- drop the claim that the peer accepts both the old and new SPI
  after a tx rekey
- document tx rekey in the tx-assoc op doc in psp.yaml

v2:
- place new assoc on pas->assocs list instead of psd->active assocs
  list
- reject tx rekey on SADB devices until deferred tx key deletion
  lands
---
 Documentation/netlink/specs/psp.yaml |  4 ++-
 Documentation/networking/psp.rst     |  5 +++-
 net/psp/psp_sock.c                   | 57 ++++++++++++++++++++++++++++++++----
 3 files changed, 58 insertions(+), 8 deletions(-)

diff --git a/Documentation/netlink/specs/psp.yaml b/Documentation/netlink/specs/psp.yaml
index d5713f5d1af7..f6af1a510d17 100644
--- a/Documentation/netlink/specs/psp.yaml
+++ b/Documentation/netlink/specs/psp.yaml
@@ -283,7 +283,9 @@ operations:
         post: psp-device-unlock
     -
       name: tx-assoc
-      doc: Add a PSP Tx association.
+      doc: |
+        Add a PSP Tx association.
+        If the socket already has a Tx association, rekey its Tx direction.
       attribute-set: assoc
       do:
         request:
diff --git a/Documentation/networking/psp.rst b/Documentation/networking/psp.rst
index fab797506b0a..43f222b38d3d 100644
--- a/Documentation/networking/psp.rst
+++ b/Documentation/networking/psp.rst
@@ -145,7 +145,8 @@ Rekeying
 
 A connection which has completed the exchange described above and is
 in the "PSP Full" state can be rekeyed in place without being torn
-down, using the same netlink calls as in connection setup.
+down. The Tx and Rx directions are rekeyed separately using the same
+netlink calls as in connection setup.
 
 ``rx-assoc`` allocates a new Rx key and SPI, which should be passed
 to the peer exactly as during the initial exchange. The SPI which was
@@ -154,6 +155,8 @@ next Rx rekey, or until the device key it was derived from has been
 rotated out, so packets the peer sent before it learned the new SPI
 are still received.
 
+``tx-assoc`` installs a new Tx key, which takes effect immediately.
+
 A rekey is rejected with ``-EINVAL`` if it would change the PSP device
 or the PSP version of the association. It is rejected with ``-EBUSY``
 if the socket has not completed its initial exchange in both
diff --git a/net/psp/psp_sock.c b/net/psp/psp_sock.c
index c1e38845f08c..d497f41c483e 100644
--- a/net/psp/psp_sock.c
+++ b/net/psp/psp_sock.c
@@ -280,6 +280,53 @@ psp_sock_set_tx_key(struct sock *sk, struct psp_dev *psd, struct psp_assoc *pas,
 	return err;
 }
 
+static int
+psp_sock_tx_rekey(struct sock *sk, struct psp_dev *psd, struct psp_assoc *pas,
+		  struct psp_key_parsed *key, struct netlink_ext_ack *extack)
+{
+	struct psp_assoc *new;
+	int err;
+
+	if (psp_dev_has_sadb(psd)) {
+		NL_SET_ERR_MSG(extack, "Tx rekey not supported on this device");
+		return -EOPNOTSUPP;
+	}
+	if (!pas->peer_tx) {
+		NL_SET_ERR_MSG(extack, "Socket PSP state is not fully established");
+		return -EBUSY;
+	}
+
+	new = kzalloc_flex(*new, drv_data, psd->caps->assoc_drv_spc,
+			   GFP_KERNEL_ACCOUNT);
+	if (!new)
+		return -ENOMEM;
+
+	new->psd             = pas->psd;
+	new->dev_id          = pas->dev_id;
+	new->generation      = pas->generation;
+	new->version         = pas->version;
+	new->peer_tx         = 1;
+	new->prev_spi        = pas->prev_spi;
+	new->prev_generation = pas->prev_generation;
+	refcount_set(&new->refcnt, 1);
+	memcpy(&new->rx, &pas->rx, sizeof(new->rx));
+
+	err = psp_assoc_set_tx(psd, new, key, extack);
+	if (err) {
+		kfree(new);
+		return err;
+	}
+
+	psp_dev_get(new->psd);
+	list_add(&new->assocs_list, &pas->assocs_list);
+	list_move(&pas->assocs_list, &psd->stale_assocs);
+
+	rcu_assign_pointer(sk->psp_assoc, new);
+	psp_assoc_put(pas);
+
+	return 0;
+}
+
 int psp_sock_assoc_set_tx(struct sock *sk, struct psp_dev *psd,
 			  u32 version, struct psp_key_parsed *key,
 			  struct netlink_ext_ack *extack)
@@ -312,13 +359,11 @@ int psp_sock_assoc_set_tx(struct sock *sk, struct psp_dev *psd,
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
2.52.1

