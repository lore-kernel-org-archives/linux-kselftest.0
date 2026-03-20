Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE75175A83
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Mar 2026 01:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773969904; cv=none; b=BRGMNn9IztCM1t5W5oaYiF9JBHqLqFi90NnM7NYnjAfYC+YZK4KkEHALyTm4xGEYLebLY1sy5+6AoguDq7IIDlDIJ/YbuOhDUvGFOb+ybKpBWnHU8WRLkxLV4OtzALGRhOtPk62G42VrctKjvfVpv5tcyksAEpotFB3WX1+bHmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773969904; c=relaxed/simple;
	bh=k/3MiZh6ObBA2Gh0WgqU7rsQmjvA6q6JXhNX15TphY0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B7RkQdoQo/XlH2csnYn+XGAxS40o3CYFoMr57tY+BUEp3AfI3DJ1ueI9Fvsc8F7zDYfq1YR5ur6KxAy9aMxdu/+fQmPiRi3G7MZa6SZhuE22m2m3NTxWC7r7J6se4h1s+0cduh/BGpDJb5sLF1b5aTIsRNlp9J4MiEXkU5pRxos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2c0ecaae7dfso2572786eec.1
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 18:25:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773969903; x=1774574703;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6rpuLOskCPApojyOfZj7pXXkMzfKSIlGWmqpeqvyGp0=;
        b=gRHqDkRf2cabte2q5G6w9KO1fUuO1iuGcjIiQVTtWHMbkOT08xaGQ/GzPh4OANbOIT
         8yErZsB1FM/sfFMv3IlCmjySHOUqEVykXKZ5yP+upgLI4iMWy6vO8xp90fkPDpCOxCnR
         BeiwanQyCRnHecbm1hH8VYNgYqH8uBAxdNOIeXNRpm89j1ML7+ors0EIBnq7fnbb8ZGI
         PAF7f4bpZ5OUzgDpgnNzfIUBkqLWajTy1gY6WJD0oQtp2rIaE32+221JMCKLFeYC/eNl
         a8wPItbZsmWXIArqxOxDIPUv02kGTNoICmEVXOCkrRttm/WRm7OPLEYHDHY7lOuX6hgS
         wP/g==
X-Forwarded-Encrypted: i=1; AJvYcCXZ86VS9Czdl4p396ZP6/Th9KgCd4ig26XQtCPN2Bxz5FcOfoh8YyxNvW0e3koOHSjpyCOdwUqQlJZ57mrEfWI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXpRrEWutcwOFzrd1GWu0Ft8T9eskBdbYUhTe6gMMyNu4/j2Ql
	7GgMTZqHPdOHwqm6/vYR+HSX11mDuoeHjvXXDO+ylF3NcabFrsLNjsM=
X-Gm-Gg: ATEYQzyVfJ4v+LDyUcHkHICRgRr330dSS8V8CDp3tTa2fAD/2dvnd6YIufSEgiHk3wG
	g1NawaUBiaL5sXtyMDLIkC4oYom7HQlP6MS7Bny8Lb8WV0KgKDgaQKApuvznpz0mXuy5QEPa/Ha
	jvuUPAqyy3Df/VEFHB7iKx63VCng3NfLGYZO9nridqBYhw+Nj57wFQQQkOclOsoieZWLT0wFOjt
	hjQ3fOI12hDofp3di8uNU9ldfUURWtWK+KGsE7m9uD0r2xHDalKRNKwFGC3ejr690Qv8pcYETEl
	J2nsEMyuLsfXhTnF6+zNREb7QexN/n4Bo/v9ZyIhUi20pF6q6IVckZrg9pMPaPMiTBdfLvzGlMF
	xKncU2dez+ABltahR6deIQcMsBoms7VUzYPYkIl19eSq/fFm+g1Sotj4D1KpWMmiUj47T9WTzag
	ZrcHPLavsgF0KJipqOAmczEGTCHVhbZaS+4LgeN7qpcZfomf8roNI/TBfiMCUZaBrNyFPmSRJ1x
	kR9UfVnPyej52oKFw==
X-Received: by 2002:a05:7301:9f0c:b0:2b8:4c95:365d with SMTP id 5a478bee46e88-2c1095f54afmr757541eec.10.1773969902833;
        Thu, 19 Mar 2026 18:25:02 -0700 (PDT)
Received: from localhost (c-76-102-12-149.hsd1.ca.comcast.net. [76.102.12.149])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b35116bsm1575407eec.30.2026.03.19.18.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 18:25:02 -0700 (PDT)
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
Subject: [PATCH net-next v3 00/13] net: sleepable ndo_set_rx_mode
Date: Thu, 19 Mar 2026 18:24:48 -0700
Message-ID: <20260320012501.2033548-1-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds a new ndo_set_rx_mode_async callback that enables
drivers to handle address list updates in a sleepable context. The
current ndo_set_rx_mode is called under the netif_addr_lock spinlock
with BHs disabled, which prevents drivers from sleeping. This is
problematic for ops-locked drivers that need to sleep.

The approach:
1. Add snapshot/reconcile infrastructure for address lists
2. Introduce dev_rx_mode_work that takes snapshots under the lock,
   drops the lock, calls the driver, then reconciles changes back
3. Move promiscuity handling into the scheduled work as well
4. Convert existing ops-locked drivers to ndo_set_rx_mode_async
5. Add a warning for ops-locked drivers still using ndo_set_rx_mode
6. Add a selftest exercising the team+bridge+macvlan topology that
   triggers the addr_lock -> ops_lock ordering issue

v3:
- module_export(__rtnl_unlock) (nipa)
- s/netdev_uc_count/netdev_hw_addr_list_count/ in bnxt (Aleksandr)

v2:
- wifi: cfg80211: use __rtnl_unlock in nl80211_pre_doit (syzbot)
- simplify mlx5e_sync_netdev_addr for !uc (Cosmin)
- switch to snapshot in bnxt_cfg_rx_mode (Michael)
- add team to net/config (Jakub)

Stanislav Fomichev (13):
  net: add address list snapshot and reconciliation infrastructure
  wifi: cfg80211: use __rtnl_unlock in nl80211_pre_doit
  net: introduce ndo_set_rx_mode_async and dev_rx_mode_work
  net: move promiscuity handling into dev_rx_mode_work
  fbnic: convert to ndo_set_rx_mode_async
  mlx5: convert to ndo_set_rx_mode_async
  bnxt: convert to ndo_set_rx_mode_async
  bnxt: use snapshot in bnxt_cfg_rx_mode
  iavf: convert to ndo_set_rx_mode_async
  netdevsim: convert to ndo_set_rx_mode_async
  dummy: convert to ndo_set_rx_mode_async
  net: warn ops-locked drivers still using ndo_set_rx_mode
  selftests: net: add team_bridge_macvlan rx_mode test

 Documentation/networking/netdevices.rst       |  12 +
 drivers/net/dummy.c                           |   6 +-
 drivers/net/ethernet/broadcom/bnxt/bnxt.c     |  55 +--
 drivers/net/ethernet/intel/iavf/iavf_main.c   |  14 +-
 .../net/ethernet/mellanox/mlx5/core/en/fs.h   |   5 +-
 .../net/ethernet/mellanox/mlx5/core/en_fs.c   |  30 +-
 .../net/ethernet/mellanox/mlx5/core/en_main.c |  16 +-
 .../net/ethernet/meta/fbnic/fbnic_netdev.c    |  20 +-
 .../net/ethernet/meta/fbnic/fbnic_netdev.h    |   4 +-
 drivers/net/ethernet/meta/fbnic/fbnic_pci.c   |   4 +-
 drivers/net/ethernet/meta/fbnic/fbnic_rpc.c   |   2 +-
 drivers/net/netdevsim/netdev.c                |   8 +-
 include/linux/netdevice.h                     |  26 ++
 net/core/dev.c                                | 176 ++++++++--
 net/core/dev.h                                |   1 +
 net/core/dev_addr_lists.c                     | 110 +++++-
 net/core/dev_addr_lists_test.c                | 321 +++++++++++++++++-
 net/core/rtnetlink.c                          |   1 +
 net/wireless/core.c                           |   1 +
 net/wireless/nl80211.c                        |   2 +-
 tools/testing/selftests/net/config            |   1 +
 tools/testing/selftests/net/rtnetlink.sh      |  44 +++
 22 files changed, 765 insertions(+), 94 deletions(-)

-- 
2.53.0

