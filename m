Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852B636B912
	for <linux-kselftest@vger.kernel.org>; Tue,  8 Sep 2026 05:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788845176; cv=none; b=DSaJPlq7eoVG1Gt3J/MGyOHGB+DBT2kmBzAdy4OErX/FFsVrnQ5jZL0/O749BNkE2TVp+4TqM3KYLmYGfSSaERGCo/Ecl3Naf0pE3cSc37cIOTWaDR6cRhuHrtkeLTtsdkQ1vn2Ew/X9diw3kOJ3zqOozY2YOKMc9cwbBv9scvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788845176; c=relaxed/simple;
	bh=s2UvvtpfgXNv2L7fkygFiRDiDd5YrK2+Wj+lzdu6Ovk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nZwqFsn7FIyx51od7vu9+RPWtp1GJbDJBek9Cjz+oap7UJOqyWbmGXhp9O/kp56vfZ3gVGF+rpB0d/t4BcHBiiw8ik5LcxfWlPmUTlJMszC1dU3x0ALcbBc++7aDxmSZnlmrEVVFkuGBJaniVGWVKB7aNI4DIXMRhTL1Zb5sG9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B3Jg6ocm; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B3Jg6ocm"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-398e9698a70so3651355a91.0
        for <linux-kselftest@vger.kernel.org>; Mon, 07 Sep 2026 22:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788845173; x=1789449973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=okLYyER6/N2GBwBRyBPpmzsC1jZeKyrc1yuodvLQ8ts=;
        b=B3Jg6ocmRQ4IC73Xq7XATF1IeLKv0+MSJknUIAzN0kRk8ucxID6xno5R/IAF3yCM4s
         JVu3X6I5rQdfbMhJ/D8p5nMOlwsYD84rrgO28ZJKNnSPvPpQpi64HdwAYczM9ppdmvOF
         FpjmadimzdWgzGVtTcmGo5AHMeY0qrxAaSFqLZd5MCe7LPplE3SyJiyhF0z1i+rklhr3
         HI/XaAO3DrP1A2zvp3k7mjrlZbWt36C3EemBknq9l76HyiwNsIEDh1OzOhGAfoViAx2e
         jSqkNDUbktyW1O0kyjvYBQjQtN7+mbA76RXKFbY1r/33h+2ijYbrEafA1UCt0uY9K9t3
         dXHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788845173; x=1789449973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=okLYyER6/N2GBwBRyBPpmzsC1jZeKyrc1yuodvLQ8ts=;
        b=mWz/UuRi4hZ9w3LeWbhIM1Vttp+oyQodaEkPPW9E49oIAgMT4Z+9gsD6dwjWXT/gGL
         O+XQiNmzBVOhs3oNzz5ZCGUHee49cZELY8SEFGwc5WcwJ3OjpZDqn/KPTarcIGIQJ8jb
         dgynuRZcCAulhoL9+VdJXfnOzYfGuXGTPthal2gdJWl/hnXksom9mTe0jaGxTrMiFhDP
         6UEmgL9SZz6P/UZLZLLd8OBWxQyLIQdMMEBULICLVPH9X2eDfK2kIphPzQ8PI0kP93Nh
         1uTS0xqgpYgCx97F4pc8N7r5T4e0ZzoELEMXm6jBcn4Rwm9IqP5wVzYYU5/PWFwnv6zz
         Xk2w==
X-Forwarded-Encrypted: i=1; AKwUvBworfTkNoQDGZvkMq5LjnCOyB567ZwPqRUDh//nKJAGRnKRninko2i5wyyaThOFlLOp+MVwX3WuW1Qr0S6GbPo=@vger.kernel.org
X-Gm-Message-State: AFuF++kEPoFPIp08KyPhG0B+di4znkoEmw6Nbi+pD/x8oGe5KL8iLmn/
	SG3xpbKhNnBBF07s2iGTgRZIuxOibnABedXzmkYJKydon5coFk5bWM+7
X-Gm-Gg: AYBFou3rwOR+SC1BrA6tpO+pnSwO95xdLw1LJjPGrKmZfVonWDXuG7XBBqhETtNdPE2
	z1E1i5LIkKUz7S6fCyhECI/GjHieV+1rb81XwP/i4T80TnBDlEtfBnh+omHml60n/XhMV3sHuAe
	edFSRhSDEA+dZH7k3Mgr25uLGrOt9or8A1evKWGs88VNM02z/CEkSyog2RwIUDUaY9hkrpxydPp
	ziXP0yObDJWtn8e/BV1OvfS0R/YsC9OfbhcTjbIw1FuR8dfvRL2bvjSgO3etdFPGiivWP5sV4v3
	hcN4K/JwYOMZ5hBFeLG6al4mSpSYesw8ykMKyAy+4NSWRZKvzIKmcc2/nCWY72n7Di3VxUzzHM/
	nOVVSVCbpBWkALQAJK10AFpGZXVnVtO1vDIWXFrbtpHz5pIh7C2B95mSWsi6y3LRQayTGNugF30
	tUPOYLtBYXB4S1ozTTSZgoaY+tKg6ISxM5z7UWN82VlICFC3InfBsT/wEL9FIK/ODUnS2NY+xU3
	YAJAAcHapCJtg==
X-Received: by 2002:a17:90a:d2c7:b0:398:9bd1:3216 with SMTP id 98e67ed59e1d1-39b262e4e02mr39316555a91.23.1788845173328;
        Mon, 07 Sep 2026 22:26:13 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14340a69666sm11720586c88.9.2026.09.07.22.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 22:26:12 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Chris Snook <chris.snook@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	GR-Linux-NIC-Dev@marvell.com,
	Geetha sowjanya <gakula@marvell.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jian Shen <shenjian15@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	Manish Chopra <manishc@marvell.com>,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Rahul Verma <rahulv@marvell.com>,
	Ratheesh Kannoth <rkannoth@marvell.com>,
	Russell King <linux@armlinux.org.uk>,
	Shahed Shaikh <shshaikh@marvell.com>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Sudarsana Kalluru <skalluru@marvell.com>,
	Sunil Goutham <sgoutham@marvell.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v3 00/10] net: fix typos and repeated words in comments
Date: Tue,  8 Sep 2026 10:55:52 +0530
Message-ID: <20260908052602.27497-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix misspellings and repeated words in comments across the networking
code, found with scripts/checkpatch.pl using the misspelling list in
scripts/spelling.txt.  Comments only, no code changes.

Changes since v2:
 - v2 put 184 changes in a single patch.  Andrew Lunn asked for it to be
   split by vendor, which comes to 54 patches, so this is the first
   batch.  maintainer-netdev.rst asks for no more than 15 patches
   outstanding against a tree at a time and I have five in flight
   already, so this batch is 10.  The rest will follow as these are
   applied.
 - patches 1 and 2 are unchanged from v2 and carry Andrew's
   Reviewed-by.  They are resent because the v2 series was marked
   superseded, so they would otherwise be dropped on the floor.
 - dropped the sfc mcdi_pcol.h patch (v2 4/6) even though Andrew had
   reviewed it.  Edward Cree pointed out that header and the Siena copy
   are generated from the firmware definitions, so an edit here would be
   overwritten the next time they are regenerated; he has forwarded the
   typos to the firmware team instead.  The sfc changes outside pcol are
   unaffected and will come in a later batch.
 - dropped the 8390 patch, the driver is Orphan / Obsolete in
   MAINTAINERS.
 - dropped one octeontx2 hunk, in otx2_pf.c, because the comment holding
   the typo has since been rewritten upstream.  The remaining octeontx2
   typos are still fixed in the marvell patch.
 - dropped an "amount of times" to "number of times" change in qed_dev.c.
   That is a wording fix rather than a misspelling, so it does not belong
   in this series.
 - v2 6/6 (net: usb, "Medium Mode mode") is not in this batch.  Andrew
   asked me to check the data sheet for that one, and I will answer on
   that thread before resending it.
 - rebased onto net-next.

Jijie Shao's Reviewed-by is carried on the hisilicon patch only, since he
scoped it to the hns and hns3 parts.

Hemanth Selam (10):
  net: llc: fix repeated word 'all' in comment
  selftests: net: fix repeated word 'use' in comment
  net: broadcom: fix typos in comments
  net: cavium: fix typos in comments
  net: qlogic: fix typos in comments
  net: fddi: fix typos in comments
  net: marvell: fix typos in comments
  net: hisilicon: fix typos in comments
  net: atheros: fix typos in comments
  net: dec: fix typos in comments

 drivers/net/ethernet/atheros/atl1c/atl1c_hw.h             | 2 +-
 drivers/net/ethernet/atheros/atl1e/atl1e.h                | 2 +-
 drivers/net/ethernet/atheros/atl1e/atl1e_hw.c             | 2 +-
 drivers/net/ethernet/atheros/atl1e/atl1e_main.c           | 2 +-
 drivers/net/ethernet/atheros/atlx/atl1.c                  | 2 +-
 drivers/net/ethernet/atheros/atlx/atl2.c                  | 2 +-
 drivers/net/ethernet/broadcom/bcm63xx_enet.c              | 2 +-
 drivers/net/ethernet/broadcom/bcm63xx_enet.h              | 2 +-
 drivers/net/ethernet/broadcom/bcmsysport.h                | 2 +-
 drivers/net/ethernet/broadcom/bnx2x/bnx2x.h               | 4 ++--
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_dcb.c           | 4 ++--
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_hsi.h           | 2 +-
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_init_ops.h      | 2 +-
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_link.c          | 8 ++++----
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c          | 2 +-
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_reg.h           | 4 ++--
 drivers/net/ethernet/cavium/liquidio/cn66xx_device.c      | 2 +-
 drivers/net/ethernet/cavium/liquidio/lio_core.c           | 2 +-
 drivers/net/ethernet/cavium/liquidio/octeon_config.h      | 4 ++--
 drivers/net/ethernet/cavium/liquidio/octeon_iq.h          | 2 +-
 drivers/net/ethernet/cavium/liquidio/octeon_main.h        | 2 +-
 drivers/net/ethernet/cavium/liquidio/octeon_nic.h         | 2 +-
 drivers/net/ethernet/cavium/liquidio/request_manager.c    | 2 +-
 drivers/net/ethernet/cavium/thunder/nic.h                 | 2 +-
 drivers/net/ethernet/cavium/thunder/nic_main.c            | 2 +-
 drivers/net/ethernet/dec/tulip/de2104x.c                  | 2 +-
 drivers/net/ethernet/dec/tulip/interrupt.c                | 4 ++--
 drivers/net/ethernet/dec/tulip/media.c                    | 2 +-
 drivers/net/ethernet/dec/tulip/tulip.h                    | 4 ++--
 drivers/net/ethernet/dec/tulip/winbond-840.c              | 2 +-
 drivers/net/ethernet/hisilicon/hns/hns_dsaf_misc.c        | 2 +-
 drivers/net/ethernet/hisilicon/hns/hns_dsaf_ppe.c         | 2 +-
 drivers/net/ethernet/hisilicon/hns/hns_enet.c             | 4 ++--
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c   | 2 +-
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c     | 2 +-
 drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_main.c | 2 +-
 drivers/net/ethernet/marvell/mvpp2/mvpp2.h                | 2 +-
 drivers/net/ethernet/marvell/mvpp2/mvpp2_prs.c            | 8 ++++----
 drivers/net/ethernet/marvell/octeontx2/af/npc.h           | 4 ++--
 drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c       | 2 +-
 drivers/net/ethernet/marvell/octeontx2/nic/cn10k.c        | 2 +-
 drivers/net/ethernet/marvell/octeontx2/nic/otx2_dcbnl.c   | 2 +-
 drivers/net/ethernet/marvell/pxa168_eth.c                 | 4 ++--
 drivers/net/ethernet/qlogic/netxen/netxen_nic_ctx.c       | 2 +-
 drivers/net/ethernet/qlogic/qed/qed_cxt.c                 | 2 +-
 drivers/net/ethernet/qlogic/qed/qed_mcp.h                 | 2 +-
 drivers/net/ethernet/qlogic/qlcnic/qlcnic.h               | 2 +-
 drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_init.c     | 4 ++--
 drivers/net/ethernet/qlogic/qlcnic/qlcnic_ctx.c           | 2 +-
 drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c          | 4 ++--
 drivers/net/fddi/skfp/cfm.c                               | 2 +-
 drivers/net/fddi/skfp/ecm.c                               | 2 +-
 drivers/net/fddi/skfp/fplustm.c                           | 4 ++--
 drivers/net/fddi/skfp/h/hwmtm.h                           | 2 +-
 drivers/net/fddi/skfp/h/sba.h                             | 2 +-
 drivers/net/fddi/skfp/pcmplc.c                            | 2 +-
 drivers/net/fddi/skfp/rmt.c                               | 2 +-
 net/llc/llc_conn.c                                        | 2 +-
 tools/testing/selftests/net/xfrm_policy.sh                | 2 +-
 59 files changed, 77 insertions(+), 77 deletions(-)

-- 
2.48.1

