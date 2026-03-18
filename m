Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A853EC2DD
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Mar 2026 15:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773846211; cv=none; b=b17GFnT0LtFrlGYS8WMroXQyn16ycl/OBg2s4p132K4a15ZoyBlcnvuEZTF1M9Aj0Z1ZYZgh5b0its2Eb+D5GBsEGSI2+9eY3xY6KWSIvtVck4VT8mx/B4pIHm8+AfibAJGz/kwopS6veegNoHp9pw/Ve9ibGFOr7NErFKxa2hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773846211; c=relaxed/simple;
	bh=sVd8LTVEHoLKFD1aY4N3BnWCDAMnZxFR8UMGpqAS4sw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UvpUOchoTzR02vW98C78kw3akPOBNTypNybwMRe5Grx3bhghlrOKZFxYxd0ro/FKuwJg3UGuWpdulKRJuU/iDZCjnXxwmOdx0Rg0V2LXjG5I0gZMF/m6ckGSOF1rU+dWI9L+TNB0rvQ3iucMeSiUWWGpy0RsI3C6gLOSm6w6DQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2b4520f6b32so17294eec.0
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Mar 2026 08:03:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773846207; x=1774451007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S2Eshwmt0Yi5gowTBPApYQhLiCclUhxDbq8BJfNjYyM=;
        b=XBOL/5mSFkmSXiYAClxtjWBYiMBcXnzzSZREnG3sAMn6ye0RE1zAjvmXISMY13rlPB
         9sqHx6FXyMuqKhmDqgkXAkQOIDMjBvUGeyUdmL/364aEDAZT2EGiI3m/TXIn2ziVfuLs
         iBMKj3NAR7M1qs4MQFoz5L1FJ6mut3lsWAr7Obek68HpcpVDimLYgyJjloE2KUSS3bpy
         tK2uuDgvqoH6KSqEde9Vsqhu6RU94CY7/oICKHCuaoMcN7hxNmLamRKdKvClPylvWoTo
         r2UMpDPk6owHNxnqQ3DbhUv/+sn4le/AEPG/vWQZvZ8HhRCHld6hLjd1J9u+nn7cMsvw
         95ew==
X-Forwarded-Encrypted: i=1; AJvYcCUkK+CSlrOiQQc3cLtu752e62w8LWvwykIham7bH43U7c7Qj8oqGM949IZKxkeUGejVLZTxIcfbWjOAS9si5X0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv72WnAiaGBCquyhqKvzR1bo12YlbRFSanjEiQF0Luf9hAFqkl
	eRXNqOCMsiDl10Vz8nU1j1HshdLG8PMRGEhNoaKDU7nXaIpgKLXahGs=
X-Gm-Gg: ATEYQzzQoiiLEest/HXf8Km45/VBJcYXJUF8kVhxViCgfvGyJS08o2PPkToFqN91VHr
	vAiPj2Kun/Ym9S7C5OxJ9nWqJlyip6Knb8s829EWRuGPaHHjz/I70mbxNzg2euwUdcVe9mZu8OB
	zQuDfd+/wBc19uBq/bj5YZfxB/kE7iFV/jSyEjQiXia1h2J5tFuVyHE2/XjHNBwCOwf9WlOmK5Q
	MWhwRAobNcoUGenyNuCRnHF2Rcu3Uu4gVx/tqX9M9ikX5SwoACQSWeAe2S1DmxsfQZwbm7k0Mjq
	aFUdxFJ1dST/lThjD9ZO3s3Rt8LaiTMeVnHmQsiqww/M1pZvWZudrqSrmhrQbwrmLMGVJQx+5pP
	tvEnxKKKFJkwLk7HbXRIWuEHGVHgTfjpBXGlqqgtQAKPSCg4BO9rLDkJgJE0DGHcH3HFlGZngT8
	8UcarUJJn92aVfg/IHPqe+sxTQRzp0vpWT64wtJwxgaUpbMp84QNqrDEsKVWC8ZRwOTNdvzdCI1
	3gZKkcDdVRloBlskQ==
X-Received: by 2002:a05:7300:fb97:b0:2ba:a3f2:958c with SMTP id 5a478bee46e88-2c0e4dc3156mr1648308eec.0.1773846207075;
        Wed, 18 Mar 2026 08:03:27 -0700 (PDT)
Received: from localhost (c-76-102-12-149.hsd1.ca.comcast.net. [76.102.12.149])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e55cd9cfsm3997754eec.26.2026.03.18.08.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:03:26 -0700 (PDT)
From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	andrew+netdev@lunn.ch,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com,
	saeedm@nvidia.com,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	alexanderduyck@fb.com,
	kernel-team@meta.com,
	johannes@sipsolutions.net,
	sd@queasysnail.net,
	jianbol@nvidia.com,
	dtatulea@nvidia.com,
	sdf@fomichev.me,
	mohsin.bashr@gmail.com,
	jacob.e.keller@intel.com,
	willemb@google.com,
	skhawaja@google.com,
	bestswngs@gmail.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	linux-rdma@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	leon@kernel.org
Subject: [PATCH net-next v2 12/13] net: warn ops-locked drivers still using ndo_set_rx_mode
Date: Wed, 18 Mar 2026 08:03:04 -0700
Message-ID: <20260318150305.123900-13-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260318150305.123900-1-sdf@fomichev.me>
References: <20260318150305.123900-1-sdf@fomichev.me>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that all in-tree ops-locked drivers have been converted to
ndo_set_rx_mode_async, add a warning in register_netdevice to catch
any remaining or newly added drivers that use ndo_set_rx_mode with
ops locking. This ensures future driver authors are guided toward
the async path.

Also route ops-locked devices through dev_rx_mode_work even if they
lack rx_mode NDOs, to ensure netdev_ops_assert_locked() does not fire
on the legacy path where only RTNL is held.

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 net/core/dev.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/net/core/dev.c b/net/core/dev.c
index d50d6dc6ac1f..187cd7b5074f 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -9778,7 +9778,8 @@ void __dev_set_rx_mode(struct net_device *dev)
 	if (!netif_up_and_present(dev))
 		return;
 
-	if (ops->ndo_set_rx_mode_async || ops->ndo_change_rx_flags) {
+	if (ops->ndo_set_rx_mode_async || ops->ndo_change_rx_flags ||
+	    netdev_need_ops_lock(dev)) {
 		queue_work(rx_mode_wq, &dev->rx_mode_work);
 		return;
 	}
@@ -11470,6 +11471,11 @@ int register_netdevice(struct net_device *dev)
 		goto err_uninit;
 	}
 
+	if (netdev_need_ops_lock(dev) &&
+	    dev->netdev_ops->ndo_set_rx_mode &&
+	    !dev->netdev_ops->ndo_set_rx_mode_async)
+		netdev_WARN(dev, "ops-locked drivers should use ndo_set_rx_mode_async\n");
+
 	ret = netdev_do_alloc_pcpu_stats(dev);
 	if (ret)
 		goto err_uninit;
-- 
2.53.0

