Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7B73101A2
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Mar 2026 01:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773969921; cv=none; b=Pz+c4OwEEi+Wzh8MbDZIYeLjaUC4UYd+lzRLedyDkLOhp2V38h45y9THBuvjbqjH8dd7+Q+2nos6swkDAXx2pRiCCW8Uv0kHaVx083PoGKVmyyCmcs4eqbvKfj7COJyA+H5liE89sLJEPZ6QVT7mlIoexdyFETFYr1u63F1lxAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773969921; c=relaxed/simple;
	bh=VK90M3+EGSzjVfsemFKOmNIILll+ZAdpTFJtqe6Y2Mo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xu33Xj9xTvy/nD32dVfSNDwrDM1jnKeJmYNvikgldCbbW8paBDxf5MbhBTb7FTZq7wiUQKHU1UMXEwJtHoyOYY5D6K/CJebIVGFsZHfmlT50RGzSk8IYwzrOxT+Zl8ihfWu8tS/P0DHEIQSx03VuDuAddy5gswEJlpLm+EddQQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-128b9b7e3edso2688603c88.0
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 18:25:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773969918; x=1774574718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LWBQoO52uK1jdWWUCzjHOfQ7E5wdgkDdRoNSlPpZPUc=;
        b=UXPN4zNQhs0mWd1rEoQUuFDo8krIu3ObWIldmD3vobeN2x2EnCWtMS7p1UNSJwk0Ak
         XQgONCi+0fn5MXrHQZU/fnxP8ou53gaMGdehnL5q4rWZ+9BwWMPK1+fMu0Llhqz2Nug6
         CmzmH1ER1OIj6z0ZGHE+bAvcRzFFH0VgjRknT6hXfR4dXB0CM3CDeb3MbGgC23ERkuhK
         e/L7mNDkv/ddRpNg+jEKyQjnC52pA4CnnK3VK/vser+n5R5CRS2hdqaUqjzkb1gRwpX/
         Alg1bPhkOvIJrQeBo396WBdUBejiFCgakBD0rAB2dQFyn7UGgzcyLUvE1XEPnCnIdI5R
         Rgrw==
X-Forwarded-Encrypted: i=1; AJvYcCXr8k6BU1yLJvNlgIts67503tE1P4kt0GDoWbSiPegbUlFSgfYxUUsecK4lN9r/lEMMuH4GfaV0koq5G3n8le4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFr1PYvTkIRu90L6AhQfycbpXy/zPZBrXX3v1aAYLfGJWZ+kNQ
	gmACpy1nDrnvxyzsNavcVaNESAsj3OeBF9dEPuB4Hgm85X39hKcuToY=
X-Gm-Gg: ATEYQzwzDi88jAwO3ZhGQZjEN+EzP2CxdiZG+Xo4QazdFpn2SI0jBYoitmdWETkWL+W
	5Vo538IQvVoTpE6QyCT4kZ9DmYFEQWik+XAOcde33jFhVf2XG2fYqVijHiY+HeV3J2KflUA8/0B
	ea8LbDfm9BhjVwnw3MUDu0ljIW7pGhyFmYP8UFq+cPFd2oToQihkovaeVomQwH52obB52Ic8/Jj
	dYd15s8BK0oaPXDIuPGSxFTnlRyn6kscadCFxpxj1b6bI0Ig2/ywP9aGJHzS3zblAYTutnauDsb
	DRg/Iwfq8Sj+hMl2O/VonUWh3J9unIlsBi9lZI4QQOnVM2ccej+P0s/nbhWK/yZcUYh2ABHyty7
	RH2GxaEYIFDWJ5ZQbvOFIKQj87FYYiFQwFUiQO80ZBcTxfosLSDZaNAR+Dm4iNTpyMPxrgFPw5E
	3NOlaR8vhtA5GwG5FW5dB02EQ1ucvK9Wqx+wBNT8U4AcJx8hOw0WqJu/eavyXoIES3b/oQUP3pz
	+feALoQPUFPTaNslw==
X-Received: by 2002:a05:7022:e08:b0:128:d737:d7a6 with SMTP id a92af1059eb24-12a7266cdddmr651698c88.3.1773969917836;
        Thu, 19 Mar 2026 18:25:17 -0700 (PDT)
Received: from localhost (c-76-102-12-149.hsd1.ca.comcast.net. [76.102.12.149])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a734bbbc5sm747251c88.11.2026.03.19.18.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 18:25:17 -0700 (PDT)
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
	aleksandr.loktionov@intel.com,
	kees@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	linux-rdma@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	leon@kernel.org
Subject: [PATCH net-next v3 12/13] net: warn ops-locked drivers still using ndo_set_rx_mode
Date: Thu, 19 Mar 2026 18:25:00 -0700
Message-ID: <20260320012501.2033548-13-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320012501.2033548-1-sdf@fomichev.me>
References: <20260320012501.2033548-1-sdf@fomichev.me>
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
index fc5c9b14faa0..f38ab254708b 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -9779,7 +9779,8 @@ void __dev_set_rx_mode(struct net_device *dev)
 	if (!netif_up_and_present(dev))
 		return;
 
-	if (ops->ndo_set_rx_mode_async || ops->ndo_change_rx_flags) {
+	if (ops->ndo_set_rx_mode_async || ops->ndo_change_rx_flags ||
+	    netdev_need_ops_lock(dev)) {
 		queue_work(rx_mode_wq, &dev->rx_mode_work);
 		return;
 	}
@@ -11471,6 +11472,11 @@ int register_netdevice(struct net_device *dev)
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

