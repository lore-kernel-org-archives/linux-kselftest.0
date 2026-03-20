Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AAA82DCF6C
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Mar 2026 01:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773969918; cv=none; b=hIZE+HhfFTsfLAj1uUM6jHEIqSTLZ7DYWDycvP2HMilLaaOsr5EpET7Cw7pTbHdbBBe8troOLwdbeSi4AJIdmpxu4Ia72Xl48X5sLO+wEUcXks+116d2ljMHvjlHRX3c+JEahhgnNLF/F04f9USXcd/+u+7SsMvTTmZ+LXYbUHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773969918; c=relaxed/simple;
	bh=tpq4CPEg4PF7xY4vX/qaHiEsjc2ICDqk3bHyi4H6/ME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dEiS5FmhZXm95wFUHDaka/U7rrlyRzbAr7LV91ht0nJ4XWrwm1wN5pgnXJ10rI0MeBT9XjD1lDJ8KF+YPeNlmVXvynRrNbk5+NhpQUP2b00bv+eL2gEGccNViT9qNc9ZzhXcxZaF5rrOnS4lBLfdBVxLq5HH4CcbpUEvelgfKK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-127380532eeso4102447c88.1
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 18:25:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773969914; x=1774574714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZI1/cLnyDnVOs4qvF1/y00bhWF98dmH7Q3P7jVrTCz8=;
        b=Uo3bmJCxnAXy5M6c2B+OE+DDrdo15aTDUDbMaMh2fnK/n9T9LTjoXUw95T5EdwtqGA
         5lib37hMCsG6bpcd2ODhgt3ouzfPZQUNTUgCDs5AT8dE48eHeRe8FLO0X0GHcYsAGoV9
         ljnE/FgIm3I1qAv8LVdi5zVYZHbawqlYnJL41S1pZC+STP6bcmTceow73SSG9ddWw3P1
         SoepDr1O0v9lTpxcy+hoUEh413bBOm+1EZS6u6mvt4eo8+xBvomk+PewxYwk4fM+RCE4
         u2VF9n//865kqPviRirOFfCJ5lOe35vFG/5/FvVFavRWtbA7q4On9GFSRWhKulft+zL+
         Q5yA==
X-Forwarded-Encrypted: i=1; AJvYcCVMeeSH2/tKV+EE5grWqBsG7gs9AnfsSiE1VkMTEj5Hjsopk6IzVei5ldHVJ//E+X0UOUcLq9qrr9w5rjMuWEA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3enGkfX56XmqV8rGOYpKy5shcb4cyaPvHhY5CHiSDLal5DMlF
	G3s3M8N+s+dvTNXI6lN3pdLthpPiOW0yRudh7pyxkC5n3rF3H9aHZlQ=
X-Gm-Gg: ATEYQzxO1p5cHY1dvClUSa94j4UsBE2/l2ha0jfQqvtcI6WovnQ+BZ7HIzVhjvCTzIY
	UQFQubesgMdTlRgTbP1u3ZN5hZ/cAgLX235DX/OkPqIXbjn8HVxEAVKJpQ0XrEMbbQ12lch49zU
	kcQ4wJCnu1jbPLxWKo9NNjuu0AhZdempRiWc3AmyYrcOJN2ppBDu8mmSr3xWrDFqSpDMPA+N8aK
	YwjpN67aBGwf5TzygX9E+CToZ/dajO6SxdHQ5vxEFoATaBOmWeMWhbxdYUV+gFoFK/qt6OPzW93
	3BHjpWVoS9/JtvQv/ZhYDgKTLdLAR6RSCy4417HKoAl9AOuGxFYHzYC+rPNrofjh+Ya4mZB+sPe
	4TsGGymqzIM7CgNO6mmyt9Lzg1HNFn+UcbpzZXeMdeuht+765SBrkey+oRWzwElddEhIeFw03jy
	iWrMaDCoz1o7beICsrXBW3aBiUhVNOPT3reIT+SGiWBbP8SLwUypDdQcjaKSOoh3pdeLcAFWdMt
	OckUPHeH7VS74LGypKI/yldGr9L
X-Received: by 2002:a05:7022:2227:b0:128:ce44:be8f with SMTP id a92af1059eb24-12a726572c7mr659849c88.2.1773969914275;
        Thu, 19 Mar 2026 18:25:14 -0700 (PDT)
Received: from localhost (c-76-102-12-149.hsd1.ca.comcast.net. [76.102.12.149])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a733dd8c0sm761096c88.5.2026.03.19.18.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 18:25:13 -0700 (PDT)
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
Subject: [PATCH net-next v3 09/13] iavf: convert to ndo_set_rx_mode_async
Date: Thu, 19 Mar 2026 18:24:57 -0700
Message-ID: <20260320012501.2033548-10-sdf@fomichev.me>
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

Convert iavf from ndo_set_rx_mode to ndo_set_rx_mode_async.
iavf_set_rx_mode now takes explicit uc/mc list parameters and
uses __hw_addr_sync_dev on the snapshots instead of __dev_uc_sync
and __dev_mc_sync.

The iavf_configure internal caller passes the real lists directly.

Cc: Tony Nguyen <anthony.l.nguyen@intel.com>
Cc: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 drivers/net/ethernet/intel/iavf/iavf_main.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/intel/iavf/iavf_main.c b/drivers/net/ethernet/intel/iavf/iavf_main.c
index 7925ee152c76..6632d35ad0fe 100644
--- a/drivers/net/ethernet/intel/iavf/iavf_main.c
+++ b/drivers/net/ethernet/intel/iavf/iavf_main.c
@@ -1147,14 +1147,18 @@ bool iavf_promiscuous_mode_changed(struct iavf_adapter *adapter)
 /**
  * iavf_set_rx_mode - NDO callback to set the netdev filters
  * @netdev: network interface device structure
+ * @uc: snapshot of uc address list
+ * @mc: snapshot of mc address list
  **/
-static void iavf_set_rx_mode(struct net_device *netdev)
+static void iavf_set_rx_mode(struct net_device *netdev,
+			     struct netdev_hw_addr_list *uc,
+			     struct netdev_hw_addr_list *mc)
 {
 	struct iavf_adapter *adapter = netdev_priv(netdev);
 
 	spin_lock_bh(&adapter->mac_vlan_list_lock);
-	__dev_uc_sync(netdev, iavf_addr_sync, iavf_addr_unsync);
-	__dev_mc_sync(netdev, iavf_addr_sync, iavf_addr_unsync);
+	__hw_addr_sync_dev(uc, netdev, iavf_addr_sync, iavf_addr_unsync);
+	__hw_addr_sync_dev(mc, netdev, iavf_addr_sync, iavf_addr_unsync);
 	spin_unlock_bh(&adapter->mac_vlan_list_lock);
 
 	spin_lock_bh(&adapter->current_netdev_promisc_flags_lock);
@@ -1207,7 +1211,7 @@ static void iavf_configure(struct iavf_adapter *adapter)
 	struct net_device *netdev = adapter->netdev;
 	int i;
 
-	iavf_set_rx_mode(netdev);
+	iavf_set_rx_mode(netdev, &netdev->uc, &netdev->mc);
 
 	iavf_configure_tx(adapter);
 	iavf_configure_rx(adapter);
@@ -5150,7 +5154,7 @@ static const struct net_device_ops iavf_netdev_ops = {
 	.ndo_open		= iavf_open,
 	.ndo_stop		= iavf_close,
 	.ndo_start_xmit		= iavf_xmit_frame,
-	.ndo_set_rx_mode	= iavf_set_rx_mode,
+	.ndo_set_rx_mode_async	= iavf_set_rx_mode,
 	.ndo_validate_addr	= eth_validate_addr,
 	.ndo_set_mac_address	= iavf_set_mac,
 	.ndo_change_mtu		= iavf_change_mtu,
-- 
2.53.0

