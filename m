Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6B22D3A93
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Mar 2026 01:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773969919; cv=none; b=iQWh2jF/b3ha/dh1yQVTTiYAjQg4CNVFpolmf2lSdVXGYElB6v80Hd1UD+DVBkrCXEEoOjxpHTiaq+oh8964F95AnLGj+hz9s60GLZNBn18o7N7v3nYBxGJpFhhh6EU4YxIrO9LV+flMIvMCzGkDHtZ0kwooxRoKzZ6sbyba4TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773969919; c=relaxed/simple;
	bh=FkE3aEmYq3JFi5GpqJgM6OBmxi48BQXX3kwNVt8fzXo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F3H/eHIznixNEiosj1NNXmAa4P6CKbvohW4cVKhpRgrikkzaXD7eAwuiq3cGw+mnREbH1D2csSxTCZIlDIvA7S3XLppMXCjenim2szqmIVqE4oLoXLOOD7kgJ2DLgD7Z+2H/e4YNmaRjhA8YS0dUS7J0uWVam1mxJFcFrxvX+14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2c0ecaae7dfso2572911eec.1
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 18:25:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773969916; x=1774574716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RnwqqwAxnRG8s2vaRYDrbUdfVznpcDcr1raRDlnvaSE=;
        b=q3Awt6zDArnXgTs8rlYKCuJqRupRsTG4+y2smatxAefq223ZJ86DFYjysMlnCUNzem
         qlBWd3vplwN4dfdxGW2e63Q1gJ49lqnfHXNZVaoT+mLTiHCOJz9HLhyxN14iBkXXZKCF
         br2RB9oCp++CTQIn5HoMOiH4xueFEowq2OgG5n8m3XgcTYNisHWmR3fNXJsMB/Gt5Kft
         KYJfdbnAGQcm6eSLeuA1OJRCk9H6hUY7/jJpCaouwRY+2c0LV1Q7JfqpRiLR2XfxMTov
         z4ZQDlEBQ70/s2J9ukoV0G8z1XXbpD9fCYpr1akCykYCfPgAjWCb3WJViLsuVQXaP8ih
         k17Q==
X-Forwarded-Encrypted: i=1; AJvYcCW4NIDkAI6xTAk7WRXGWAC9KMGGy2ZeigNmD69qz2s8qsutcE7t1BG8Y4slilKpqHGHLKhOxsTW+XgHPC+71bc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQX3KszA9wg4nHxVHm2iWuHoNv308oBbXL8wLiQSxtdSpM9dk5
	BVI8mVDQDElrp3LQQx8PFwZ10FQ+UwAeU48Lt8CD+Qt0cPaukK08EfM=
X-Gm-Gg: ATEYQzzXtpju4T1PytPUgoxd5oaeII3ztSamuB6qwt3ub6l+7t3xV64XtIdnYBzpuTO
	RQCXjqWQAd7uw/QwzeD4tFHy/tj7mTJvUTviGU54Hiy9Cp0B+lQhhijRXo+lCekovyrCXbb4x8f
	DshEbPyO4QRfM1ZR7cQJNeylw6w5WOCivs8IoZqF1KYZDMd+L8pBwrUq3OAWP+aQCAmtEHAWbQI
	Orr03ACS88uzWNFWey1a6uBuzz6DzJNg3qs8SMdtKgHiOcDyjhD34CPIqoDiInOZwhtemh3Vqc4
	KfwylTWZzcqXl4bpHC0pe5esPbqqZRw1vvViQSBYNiKZ1VaOT4XcKQc0CwOA7lwCcdswwO4zcgC
	BbuITTPKpPIEAwrUw0bsGzFK0eMBWDPmNX/icYNMquxJi1NP2QsDIVhQrClDImNbhqJLCwPVVNx
	0it1fYSD7qCDky0Wvn1VRegIf3iPZ9P45kxL7l9XEJCkAJMyETIlDOEGNdkbCdlfflnm22QLRLf
	5iHLrwRkfV/v+BUrLzkGVD7D6I4
X-Received: by 2002:a05:7301:4083:b0:2c0:cc90:a71 with SMTP id 5a478bee46e88-2c1095c78d8mr746759eec.8.1773969915768;
        Thu, 19 Mar 2026 18:25:15 -0700 (PDT)
Received: from localhost (c-76-102-12-149.hsd1.ca.comcast.net. [76.102.12.149])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b1a88e5sm1421784eec.13.2026.03.19.18.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 18:25:15 -0700 (PDT)
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
Subject: [PATCH net-next v3 10/13] netdevsim: convert to ndo_set_rx_mode_async
Date: Thu, 19 Mar 2026 18:24:58 -0700
Message-ID: <20260320012501.2033548-11-sdf@fomichev.me>
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

Convert netdevsim from ndo_set_rx_mode to ndo_set_rx_mode_async.
The callback is a no-op stub so just update the signature and
ops struct wiring.

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 drivers/net/netdevsim/netdev.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/netdevsim/netdev.c b/drivers/net/netdevsim/netdev.c
index 5ec028a00c62..9c9217792125 100644
--- a/drivers/net/netdevsim/netdev.c
+++ b/drivers/net/netdevsim/netdev.c
@@ -182,7 +182,9 @@ static netdev_tx_t nsim_start_xmit(struct sk_buff *skb, struct net_device *dev)
 	return NETDEV_TX_OK;
 }
 
-static void nsim_set_rx_mode(struct net_device *dev)
+static void nsim_set_rx_mode(struct net_device *dev,
+			     struct netdev_hw_addr_list *uc,
+			     struct netdev_hw_addr_list *mc)
 {
 }
 
@@ -641,7 +643,7 @@ static const struct net_shaper_ops nsim_shaper_ops = {
 
 static const struct net_device_ops nsim_netdev_ops = {
 	.ndo_start_xmit		= nsim_start_xmit,
-	.ndo_set_rx_mode	= nsim_set_rx_mode,
+	.ndo_set_rx_mode_async	= nsim_set_rx_mode,
 	.ndo_set_mac_address	= eth_mac_addr,
 	.ndo_validate_addr	= eth_validate_addr,
 	.ndo_change_mtu		= nsim_change_mtu,
@@ -664,7 +666,7 @@ static const struct net_device_ops nsim_netdev_ops = {
 
 static const struct net_device_ops nsim_vf_netdev_ops = {
 	.ndo_start_xmit		= nsim_start_xmit,
-	.ndo_set_rx_mode	= nsim_set_rx_mode,
+	.ndo_set_rx_mode_async	= nsim_set_rx_mode,
 	.ndo_set_mac_address	= eth_mac_addr,
 	.ndo_validate_addr	= eth_validate_addr,
 	.ndo_change_mtu		= nsim_change_mtu,
-- 
2.53.0

