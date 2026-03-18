Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332953DFC87
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Mar 2026 15:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773846195; cv=none; b=WbHMLVaqM2cbqPBaGcDmfJbeIraKVvPjoeKuBi0gITeKLvFzvthOqvHkKrvEhVGgcrJ9Hv0d3GyvM5siBsoLoS95OO0OWG9XcKjjJ8aLJoVptKkFdfpNit11pTKBAnm10qxiBUWaRBhrMX2Mq3pw9V51UmUnQuDLlCr/icH6pdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773846195; c=relaxed/simple;
	bh=h0p10z8eZpClUXYtUVukCJgrHGYSRkh1nSA6pgFkCig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D6ngHV6lqkWsDaspb2ov3IB0kuYaWdmw6PeVVBo7Ad+E4UAtvqzTSa47DEb0DDqxwvxqp81BsoCaBcri7mJ2YlXhMXxSoCMNiCvaEMIBJfrvcCuYmEbIIeFkhvFATGyaOmClRssdck9PZ3e2WZxTUPdOllz1t2Z6XZCV5ioNOPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-127380532eeso192061c88.1
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Mar 2026 08:03:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773846192; x=1774450992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bCbPYXsJyjrslfVQf+TqWui1no/uksX6ojvJaHIhI9s=;
        b=tTfmhc9w9nKcuJNGUo/hwo4bbq3csoT+9YMJvyHOKHDJZKyYnUlqlb2XzZIxxIFwOo
         Mievp0p/uldTK+CNmCQF+OLOwfPGFVFITZIL7FyVpcaLTAZ5PdoM2PT1Z4EKKDs472ic
         nouCM4kHqVw0tgUAAJfqguZa+UFNcHC/jUW8z967bCMNzAEjWTi8P5hcpwCrmo6UFAHT
         uI2NH8YOGevV0P4Fanars/oxTD/5U8o1qmU8pVdvltMKmlRGQThf1dhJZdcXltqotQ9j
         NlkQ0n/W/1EKsYtHl3pduslPv2F305jaosuNZYUNKLJ1dLEQFCWeYC6fADpasqowayCq
         CjTA==
X-Forwarded-Encrypted: i=1; AJvYcCUboFfoyHkZLrm0emya9YOzUbItltd3aVlT+WItMegc5hVwyo2o3qqkmzGq7BvoSC8TlNgYfVM2PbI/mReUY8U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYGcXA3WA/2kchksg1OKO/3icDw3eBvkcYfPm7Ms7MzSz2Q3zV
	AKFceehMEf0fIZE6+TJLVr4acA4eTx4eabvVFmWHs8MQsNWBuLcjHy0=
X-Gm-Gg: ATEYQzxxSxggxdZBLW+In+i98B5AM0/E6fdT7tHlxwNpcxHnwaBhWivCNColbTic7+W
	6ldBFc56sVbS7KwpRfUEJzx3c/6sSYrd+6/QfmZJ3g+F03GFFm/S3uBVdskkDD5AKk2tFEzByJb
	94l97P6HHZA21XndIPvc1Y3HmV52uk51aYdiGAyyNfVwt4EHbUit15bLuwFlGp/OQb4DK8f3Yrs
	2b8J+4CLmjB36EU+wPVCNDgeOZyvNtTbrIe59s8OZGtg6AP2m9rjtFBmLsZ8ZYfpDH08p6D3/9e
	hcLLY1dPHNVPgVmHzbFG4Xm9hNIFOFlzZ7KyhCkT34cw1kiY966MnZo3kslhGT9INIK9eiSHhBC
	FitwSNekqu03kl4zxedJcMQV0X7NmswWN40tXKSqbMtPZZNijojSxYZJjsctVK3IDoDPwna5a8+
	3c6H4SZF4N+hQBgu5PrVQRG0UBibePsw5iA3bDo4yG4bkrcO+TEi9kHKMNqqGGPDls0hp29oEsS
	ryqO+hZMcmhEqkoRg==
X-Received: by 2002:a05:7022:6a5:b0:122:153:d161 with SMTP id a92af1059eb24-1299ba3e35fmr1920293c88.17.1773846189957;
        Wed, 18 Mar 2026 08:03:09 -0700 (PDT)
Received: from localhost (c-76-102-12-149.hsd1.ca.comcast.net. [76.102.12.149])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-129b413930esm3529158c88.13.2026.03.18.08.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:03:09 -0700 (PDT)
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
Subject: [PATCH net-next v2 02/13] wifi: cfg80211: use __rtnl_unlock in nl80211_pre_doit
Date: Wed, 18 Mar 2026 08:02:54 -0700
Message-ID: <20260318150305.123900-3-sdf@fomichev.me>
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

nl80211_pre_doit acquires rtnl_lock and then wiphy_lock, releasing
rtnl while keeping wiphy_lock held until post_doit. With the
introduction of rx_mode_wq and its flush in netdev_run_todo, calling
rtnl_unlock here creates a circular lock dependency:

  Chain exists of:
    (wq_completion)rx_mode_wq --> rtnl_mutex --> &rdev->wiphy.mtx

   Possible unsafe locking scenario:

         CPU0                    CPU1
         ----                    ----
    lock(&rdev->wiphy.mtx);
                                 lock(rtnl_mutex);
                                 lock(&rdev->wiphy.mtx);
    lock((wq_completion)rx_mode_wq);

Switch to __rtnl_unlock to skip netdev_run_todo in nl80211_pre_doit.
This seems safe because we run before the op.

Link: http://lore.kernel.org/netdev/69b5ad67.a00a0220.3b25d1.001a.GAE@google.com
Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 net/wireless/nl80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 2225f5d0b124..ce5f25d4c87e 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -18192,7 +18192,7 @@ static int nl80211_pre_doit(const struct genl_split_ops *ops,
 		__release(&rdev->wiphy.mtx);
 	}
 	if (!(internal_flags & NL80211_FLAG_NEED_RTNL))
-		rtnl_unlock();
+		__rtnl_unlock();
 
 	return 0;
 out_unlock:
-- 
2.53.0

