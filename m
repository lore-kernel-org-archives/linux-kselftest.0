Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3612B2F1FDF
	for <linux-kselftest@vger.kernel.org>; Mon,  7 Sep 2026 04:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788756416; cv=none; b=TRT5QFjZcq1a8e31rSS3guempPdMQ7kw+tcroXZA0QAVzs5a3GkR4KRmrUAfx2cq+7NEPYU/vjCXJdgq8yDiiob1bspDNdhmSxkyqxrYYkZ1RIYWhfeBlZtdX2HTw8iQ+SPYViuqB6SVG7K0Q4pvNXYAsQXqoY6PpynQd0UxU0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788756416; c=relaxed/simple;
	bh=EzirdR8QRFFvststn2l3ubPvw+4gKKZNH8XqnQ32UL8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=it+a43KCb90S03PL+zF3A16eRmCar7MVDVMHdwGuCU9GKyvmCI902igsI0/3QOxEeK7GIB9H58IgK6dNstx2jIu8HVBs1yO1FTiIgR85GczFdZcRcFU2/biSj8xprDZDunY5+n+7DO7pJt9vjvIzMtnWFrch3jp2Y3MrS0VuG0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e0E3izf/; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e0E3izf/"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-853e2610bb4so2710640b3a.0
        for <linux-kselftest@vger.kernel.org>; Sun, 06 Sep 2026 21:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756410; x=1789361210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4D4lypD0swk1cWfKERlzhAYVXcTreaXk1kumSef6qJw=;
        b=e0E3izf/9h1SrJ4IevhRuN6cNNLcHjmFjR9QF0/thMqLA/J1Di5JfZ2cmWrVbafg15
         9zRmP8TgNDoskdhklw08La/fy5tNeFIynMo8SaqSZ+jGT2pn0YVhg7xFki0o+7WjbZg7
         ybwXrbWkShhht8JEtjTtTJy8aY9uN7djdPZXMkSfLb2NlJkQW8SvjYj8Edqgh+rp6FgS
         NEVcojwpq70wYPzF2d7j9FVR4yFlgfyFqlG+0+tZI/r0oCdcDnXq+bOByPA5jn2jMxfw
         85ulUbC7hZG38u5qK5iEN7/tNjU4DOiw6Vq/j5c83wNXnqfMxVIrs7e5uPmy6WfpfVvU
         zfdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756410; x=1789361210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4D4lypD0swk1cWfKERlzhAYVXcTreaXk1kumSef6qJw=;
        b=swYoCCqdPVfX8qzCw+F8PCMnUA4MIgIf+ITsA6ahOgToYhdILaTQ6jJzZg9CKw0EKd
         Ysk8sBEeQKTPcHhoSioSKi1j9OE5Ob4iOn0b3/jOgHLlTfd/uIrgzI1OoJvHHEr6U3vt
         QOBIx8SVx+KyJozytZI+XEcFkXPamlZWuaT9Q7CdQ78NvRDkZIkR06I1nS/Sw9Woq1Bt
         fN6Q3zeePlwmJVXHNKYa2stS2JtPBrcQAjN7JfhhoVmtQJcyke8Vo1QKsfOJ6SG2Z/xi
         ErqkcWT//TQfFo7BmVtgbN4qt4B+fPwxyj97w0drix/Xs8fFbZG5jwaoDsR3lIj51ONk
         Z3Ow==
X-Forwarded-Encrypted: i=1; AKwUvBzHfWVJWQa4APwMam26n3ogyDGA4zAV2GU1UwAXgE/dVv4qPz+akG8uBczE8CIV7cyPvhp2KbBX//Z7Nos5YQ8=@vger.kernel.org
X-Gm-Message-State: AFuF++laP23FNhFPgpsAUb67NLXl4k2LKJKyrYhMvqycrPa1GVwZud1y
	4CLHSAJM+wUniC4yrd38eh+i51uUmSyo8Y0/jLc2RmH0Y7cpQuJ/F+/I
X-Gm-Gg: AYBFou2WM1ctzRm8G0nUIOKv53T45xwn9BTyWEkz3ob536OIuHFLukFYmdvymH/SNQ9
	3L5ai0gfwIpS9RRLow/Mx1pB89WItW6P3T4m6I1U9ea5a4RqD0FHfCyaMCYR5cN0wsVonH3V7Xi
	YRlljpc+wV/wxQcZTIFENNGrB5DQCc8l4kvWylxhFLPedOcAlqxMzEkft4IG933p9/5ZTDuvaB6
	IGJn8BRjfgqdg6veAhnvKzdUaLTLS1fPopStndQ7kcEWNGiDEw0/72B92midNdRmtZh916fOPYd
	HRuPVTC+ByMn3+jYptlVCA613CuVqVtamWuQXX1+qWw/wqtFmFqtmUNXM9CKfLbIIAw0S617/TR
	341lGf9hB7GU4iXx3fE/z2JsnAqgatO5ACE1dWuPcCnDl3xiFtaiX6gdQorO5aRc7zERmd9XzV8
	6py4AddHm3iDR3CdN2/HvUGE6cndTRa+q27Iw+4FI9fLyXT5/OH2KgFhs/KJECeHeh9cta4VjP0
	dhAITqkyElFAA==
X-Received: by 2002:a05:6a20:cf83:b0:3d2:ee7a:eba9 with SMTP id adf61e73a8af0-3da213cae76mr30170932637.4.1788756409525;
        Sun, 06 Sep 2026 21:46:49 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm37844565eec.16.2026.09.06.21.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:46:49 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Sudarsana Kalluru <skalluru@marvell.com>,
	Manish Chopra <manishc@marvell.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	Edward Cree <ecree.xilinx@gmail.com>,
	Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-net-drivers@amd.com,
	linux-kselftest@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 1/6] net: fix typos in comments
Date: Mon,  7 Sep 2026 10:16:30 +0530
Message-ID: <20260907044635.7141-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907044635.7141-1-hemanth.selam@gmail.com>
References: <20260907044635.7141-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/net/dsa/bcm_sf2_cfp.c                          |  2 +-
 drivers/net/dsa/microchip/ksz_dcb.c                    |  2 +-
 drivers/net/dsa/realtek/rtl8366rb.c                    |  2 +-
 drivers/net/dsa/sja1105/sja1105_tas.c                  |  2 +-
 drivers/net/ethernet/3com/typhoon.h                    |  2 +-
 drivers/net/ethernet/8390/ax88796.c                    |  2 +-
 drivers/net/ethernet/airoha/airoha_eth.c               |  2 +-
 drivers/net/ethernet/allwinner/sun4i-emac.c            |  2 +-
 drivers/net/ethernet/amazon/ena/ena_eth_com.h          |  2 +-
 drivers/net/ethernet/amd/xgbe/xgbe-dev.c               |  2 +-
 drivers/net/ethernet/apm/xgene/xgene_enet_main.c       |  2 +-
 drivers/net/ethernet/atheros/atl1c/atl1c_hw.h          |  2 +-
 drivers/net/ethernet/atheros/atl1e/atl1e.h             |  2 +-
 drivers/net/ethernet/atheros/atl1e/atl1e_hw.c          |  2 +-
 drivers/net/ethernet/atheros/atl1e/atl1e_main.c        |  2 +-
 drivers/net/ethernet/atheros/atlx/atl1.c               |  2 +-
 drivers/net/ethernet/atheros/atlx/atl2.c               |  2 +-
 drivers/net/ethernet/broadcom/bcm63xx_enet.c           |  2 +-
 drivers/net/ethernet/broadcom/bcm63xx_enet.h           |  2 +-
 drivers/net/ethernet/broadcom/bcmsysport.h             |  2 +-
 drivers/net/ethernet/broadcom/bnx2x/bnx2x.h            |  2 +-
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_dcb.c        |  4 ++--
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_hsi.h        |  2 +-
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_init_ops.h   |  2 +-
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_link.c       |  8 ++++----
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c       |  2 +-
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_reg.h        |  4 ++--
 drivers/net/ethernet/brocade/bna/bfa_ioc.c             |  4 ++--
 drivers/net/ethernet/brocade/bna/bna_enet.c            |  4 ++--
 drivers/net/ethernet/calxeda/xgmac.c                   |  2 +-
 drivers/net/ethernet/cavium/liquidio/cn66xx_device.c   |  2 +-
 drivers/net/ethernet/cavium/liquidio/lio_core.c        |  2 +-
 drivers/net/ethernet/cavium/liquidio/octeon_config.h   |  4 ++--
 drivers/net/ethernet/cavium/liquidio/octeon_iq.h       |  2 +-
 drivers/net/ethernet/cavium/liquidio/octeon_main.h     |  2 +-
 drivers/net/ethernet/cavium/liquidio/octeon_nic.h      |  2 +-
 drivers/net/ethernet/cavium/liquidio/request_manager.c |  2 +-
 drivers/net/ethernet/cavium/thunder/nic.h              |  2 +-
 drivers/net/ethernet/cavium/thunder/nic_main.c         |  2 +-
 drivers/net/ethernet/chelsio/cxgb3/sge.c               |  2 +-
 drivers/net/ethernet/chelsio/cxgb4/cxgb4_dcb.c         |  2 +-
 drivers/net/ethernet/chelsio/cxgb4/cxgb4_ethtool.c     |  2 +-
 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c             |  2 +-
 drivers/net/ethernet/chelsio/cxgb4vf/sge.c             |  2 +-
 drivers/net/ethernet/cirrus/cs89x0.c                   |  4 ++--
 drivers/net/ethernet/dec/tulip/de2104x.c               |  2 +-
 drivers/net/ethernet/dec/tulip/interrupt.c             |  4 ++--
 drivers/net/ethernet/dec/tulip/media.c                 |  2 +-
 drivers/net/ethernet/dec/tulip/tulip.h                 |  4 ++--
 drivers/net/ethernet/dec/tulip/winbond-840.c           |  2 +-
 drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c       |  2 +-
 drivers/net/ethernet/freescale/fman/fman_memac.c       |  2 +-
 drivers/net/ethernet/freescale/gianfar.c               |  2 +-
 drivers/net/ethernet/freescale/gianfar.h               |  2 +-
 drivers/net/ethernet/hisilicon/hns/hns_dsaf_misc.c     |  2 +-
 drivers/net/ethernet/hisilicon/hns/hns_dsaf_ppe.c      |  2 +-
 drivers/net/ethernet/hisilicon/hns/hns_enet.c          |  4 ++--
 .../net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c    |  2 +-
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c  |  2 +-
 .../net/ethernet/hisilicon/hns3/hns3vf/hclgevf_main.c  |  2 +-
 drivers/net/ethernet/ibm/emac/emac.h                   |  2 +-
 drivers/net/ethernet/ibm/emac/phy.h                    |  2 +-
 drivers/net/ethernet/jme.h                             |  2 +-
 drivers/net/ethernet/marvell/mvpp2/mvpp2.h             |  2 +-
 drivers/net/ethernet/marvell/mvpp2/mvpp2_prs.c         |  8 ++++----
 drivers/net/ethernet/marvell/octeontx2/af/npc.h        |  4 ++--
 drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c    |  2 +-
 drivers/net/ethernet/marvell/octeontx2/nic/cn10k.c     |  2 +-
 .../net/ethernet/marvell/octeontx2/nic/otx2_dcbnl.c    |  2 +-
 drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c   |  2 +-
 drivers/net/ethernet/marvell/pxa168_eth.c              |  4 ++--
 drivers/net/ethernet/mellanox/mlx4/eq.c                |  2 +-
 drivers/net/ethernet/mellanox/mlx5/core/en/tc/sample.c |  2 +-
 drivers/net/ethernet/mellanox/mlx5/core/lib/tout.c     |  2 +-
 drivers/net/ethernet/mellanox/mlxsw/i2c.c              |  2 +-
 drivers/net/ethernet/mellanox/mlxsw/reg.h              |  2 +-
 drivers/net/ethernet/natsemi/sonic.h                   |  2 +-
 drivers/net/ethernet/nvidia/forcedeth.c                |  4 ++--
 drivers/net/ethernet/qlogic/netxen/netxen_nic_ctx.c    |  2 +-
 drivers/net/ethernet/qlogic/qed/qed_cxt.c              |  2 +-
 drivers/net/ethernet/qlogic/qed/qed_dev.c              |  2 +-
 drivers/net/ethernet/qlogic/qed/qed_mcp.h              |  2 +-
 drivers/net/ethernet/qlogic/qlcnic/qlcnic.h            |  2 +-
 drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_init.c  |  4 ++--
 drivers/net/ethernet/qlogic/qlcnic/qlcnic_ctx.c        |  2 +-
 drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c       |  4 ++--
 drivers/net/ethernet/qualcomm/emac/emac-mac.c          |  2 +-
 drivers/net/ethernet/realtek/8139too.c                 |  2 +-
 drivers/net/ethernet/realtek/rtase/rtase_main.c        |  2 +-
 drivers/net/ethernet/seeq/sgiseeq.c                    |  2 +-
 drivers/net/ethernet/sfc/falcon/falcon.c               |  2 +-
 drivers/net/ethernet/sfc/mcdi_pcol.h                   |  8 ++++----
 drivers/net/ethernet/sfc/siena/mcdi_pcol.h             |  6 +++---
 drivers/net/ethernet/sfc/siena/ptp.c                   |  2 +-
 drivers/net/ethernet/sgi/meth.h                        |  2 +-
 drivers/net/ethernet/silan/sc92031.c                   |  6 +++---
 drivers/net/ethernet/sis/sis900.c                      |  2 +-
 drivers/net/ethernet/smsc/smsc9420.c                   |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c      |  2 +-
 drivers/net/ethernet/sun/cassini.h                     |  2 +-
 drivers/net/ethernet/synopsys/dwc-xlgmac-common.c      |  2 +-
 drivers/net/ethernet/synopsys/dwc-xlgmac-hw.c          |  2 +-
 drivers/net/ethernet/tehuti/tehuti.c                   |  8 ++++----
 drivers/net/ethernet/ti/tlan.c                         |  2 +-
 drivers/net/ethernet/toshiba/ps3_gelic_net.c           |  2 +-
 drivers/net/ethernet/toshiba/ps3_gelic_net.h           |  2 +-
 drivers/net/ethernet/toshiba/ps3_gelic_wireless.c      |  2 +-
 drivers/net/ethernet/via/via-rhine.c                   |  2 +-
 drivers/net/ethernet/via/via-velocity.c                | 10 +++++-----
 drivers/net/fddi/skfp/cfm.c                            |  2 +-
 drivers/net/fddi/skfp/ecm.c                            |  2 +-
 drivers/net/fddi/skfp/fplustm.c                        |  4 ++--
 drivers/net/fddi/skfp/h/hwmtm.h                        |  2 +-
 drivers/net/fddi/skfp/h/sba.h                          |  2 +-
 drivers/net/fddi/skfp/pcmplc.c                         |  2 +-
 drivers/net/fddi/skfp/rmt.c                            |  2 +-
 drivers/net/ipa/ipa_interrupt.h                        |  2 +-
 drivers/net/phy/bcm87xx.c                              |  2 +-
 drivers/net/phy/marvell.c                              |  2 +-
 drivers/net/ppp/ppp_generic.c                          |  4 ++--
 drivers/net/usb/ax88179_178a.c                         |  4 ++--
 drivers/net/wan/slic_ds26522.c                         |  2 +-
 drivers/s390/net/ctcm_main.c                           |  4 ++--
 drivers/s390/net/qeth_core.h                           |  2 +-
 include/net/inet_hashtables.h                          |  2 +-
 include/net/sock.h                                     |  2 +-
 net/ipv4/tcp.c                                         |  2 +-
 net/ipv4/tcp_input.c                                   |  2 +-
 net/ipv4/tcp_output.c                                  |  2 +-
 net/ipv6/calipso.c                                     |  4 ++--
 net/llc/llc_c_ac.c                                     |  2 +-
 net/netlink/af_netlink.c                               |  2 +-
 net/sctp/protocol.c                                    |  4 ++--
 net/sctp/sm_make_chunk.c                               |  4 ++--
 net/sctp/sm_sideeffect.c                               |  2 +-
 net/sctp/transport.c                                   |  2 +-
 net/sctp/ulpqueue.c                                    |  2 +-
 samples/pktgen/README.rst                              |  2 +-
 tools/testing/selftests/drivers/net/team/options.sh    |  2 +-
 .../selftests/net/arp_ndisc_untracked_subnets.sh       |  4 ++--
 tools/testing/selftests/net/forwarding/lib.sh          |  2 +-
 tools/testing/selftests/net/ip_defrag.c                |  2 +-
 142 files changed, 184 insertions(+), 184 deletions(-)

diff --git a/drivers/net/dsa/bcm_sf2_cfp.c b/drivers/net/dsa/bcm_sf2_cfp.c
index 50d3a818eb1b..62258f9cd3f5 100644
--- a/drivers/net/dsa/bcm_sf2_cfp.c
+++ b/drivers/net/dsa/bcm_sf2_cfp.c
@@ -898,7 +898,7 @@ static int bcm_sf2_cfp_rule_insert(struct dsa_switch *ds, int port,
 
 	/*
 	 * We have a small oddity where Port 6 just does not have a
-	 * valid bit here (so we substract by one).
+	 * valid bit here (so we subtract by one).
 	 */
 	queue_num = ring_cookie % SF2_NUM_EGRESS_QUEUES;
 	if (port_num >= 7)
diff --git a/drivers/net/dsa/microchip/ksz_dcb.c b/drivers/net/dsa/microchip/ksz_dcb.c
index 7131c5caac54..a0d345382ce7 100644
--- a/drivers/net/dsa/microchip/ksz_dcb.c
+++ b/drivers/net/dsa/microchip/ksz_dcb.c
@@ -227,7 +227,7 @@ int ksz_port_set_default_prio(struct dsa_switch *ds, int port, u8 prio)
  * @port: Port number for which to get the priority
  * @dscp: DSCP value for which to get the priority
  *
- * This function fetches the priority value from switch global DSCP-to-priorty
+ * This function fetches the priority value from switch global DSCP-to-priority
  * mapping table for the specified DSCP value.
  *
  * Return: The priority value for the DSCP on success, or a negative error
diff --git a/drivers/net/dsa/realtek/rtl8366rb.c b/drivers/net/dsa/realtek/rtl8366rb.c
index f11831b66de8..4aef48410f9d 100644
--- a/drivers/net/dsa/realtek/rtl8366rb.c
+++ b/drivers/net/dsa/realtek/rtl8366rb.c
@@ -363,7 +363,7 @@ static int rtl8366rb_get_mib_counter(struct realtek_priv *priv,
 		mib->offset;
 
 	/* Writing access counter address first
-	 * then ASIC will prepare 64bits counter wait for being retrived
+	 * then ASIC will prepare 64bits counter wait for being retrieved
 	 */
 	ret = regmap_write(priv->map, addr, 0); /* Write whatever */
 	if (ret)
diff --git a/drivers/net/dsa/sja1105/sja1105_tas.c b/drivers/net/dsa/sja1105/sja1105_tas.c
index e47967b12d5d..391b30b09290 100644
--- a/drivers/net/dsa/sja1105/sja1105_tas.c
+++ b/drivers/net/dsa/sja1105/sja1105_tas.c
@@ -377,7 +377,7 @@ int sja1105_init_scheduling(struct sja1105_private *priv)
  * - Collisions in the future. Events may not collide within one cycle time,
  *   but if two port schedules don't have the same periodicity (aka the cycle
  *   times aren't multiples of one another), they surely will some time in the
- *   future (actually they will collide an infinite amount of times).
+ *   future (actually they will collide an infinite number of times).
  */
 static bool
 sja1105_tas_check_conflicts(struct sja1105_private *priv, int port,
diff --git a/drivers/net/ethernet/3com/typhoon.h b/drivers/net/ethernet/3com/typhoon.h
index 38e6dcab4e94..6e3b44a0e2f9 100644
--- a/drivers/net/ethernet/3com/typhoon.h
+++ b/drivers/net/ethernet/3com/typhoon.h
@@ -19,7 +19,7 @@
 	number Y1-LM-2015-01.
 */
 
-/* All Typhoon ring positions are specificed in bytes, and point to the
+/* All Typhoon ring positions are specified in bytes, and point to the
  * first "clean" entry in the ring -- ie the next entry we use for whatever
  * purpose.
  */
diff --git a/drivers/net/ethernet/8390/ax88796.c b/drivers/net/ethernet/8390/ax88796.c
index e1695d0fbd8b..b1d63f404c7b 100644
--- a/drivers/net/ethernet/8390/ax88796.c
+++ b/drivers/net/ethernet/8390/ax88796.c
@@ -675,7 +675,7 @@ static void ax_initial_setup(struct net_device *dev, struct ei_device *ei_local)
  *
  * initialise the specified device, taking care to note the MAC
  * address it may already have (if configured), ensure
- * the device is ready to be used by lib8390.c and registerd with
+ * the device is ready to be used by lib8390.c and registered with
  * the network layer.
  */
 static int ax_init_dev(struct net_device *dev)
diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 64619e9a704d..5bb59d04d869 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -900,7 +900,7 @@ static int airoha_qdma_init_rx(struct airoha_qdma *qdma)
 		int err;
 
 		if (!(RX_DONE_INT_MASK & BIT(i))) {
-			/* rx-queue not binded to irq */
+			/* rx-queue not bound to irq */
 			continue;
 		}
 
diff --git a/drivers/net/ethernet/allwinner/sun4i-emac.c b/drivers/net/ethernet/allwinner/sun4i-emac.c
index 942454e29488..8f44b7d8c0b3 100644
--- a/drivers/net/ethernet/allwinner/sun4i-emac.c
+++ b/drivers/net/ethernet/allwinner/sun4i-emac.c
@@ -504,7 +504,7 @@ static void emac_init_device(struct net_device *dev)
 	writel(reg_val | EMAC_CTL_RESET | EMAC_CTL_TX_EN | EMAC_CTL_RX_EN,
 		db->membase + EMAC_CTL_REG);
 
-	/* enable RX/TX0/RX Hlevel interrup */
+	/* enable RX/TX0/RX Hlevel interrupt */
 	reg_val = readl(db->membase + EMAC_INT_CTL_REG);
 	reg_val |= (EMAC_INT_CTL_TX_EN | EMAC_INT_CTL_TX_ABRT_EN | EMAC_INT_CTL_RX_EN);
 	writel(reg_val, db->membase + EMAC_INT_CTL_REG);
diff --git a/drivers/net/ethernet/amazon/ena/ena_eth_com.h b/drivers/net/ethernet/amazon/ena/ena_eth_com.h
index 449bc4960ccc..db192451afff 100644
--- a/drivers/net/ethernet/amazon/ena/ena_eth_com.h
+++ b/drivers/net/ethernet/amazon/ena/ena_eth_com.h
@@ -93,7 +93,7 @@ static inline bool ena_com_sq_have_enough_space(struct ena_com_io_sq *io_sq,
 
 	/* This calculation doesn't need to be 100% accurate. So to reduce
 	 * the calculation overhead just Subtract 2 lines from the free descs
-	 * (one for the header line and one to compensate the devision
+	 * (one for the header line and one to compensate the division
 	 * down calculation.
 	 */
 	temp = required_buffers / io_sq->llq_info.descs_per_entry + 2;
diff --git a/drivers/net/ethernet/amd/xgbe/xgbe-dev.c b/drivers/net/ethernet/amd/xgbe/xgbe-dev.c
index e2e850c1b90b..ccab0d9f6f21 100644
--- a/drivers/net/ethernet/amd/xgbe/xgbe-dev.c
+++ b/drivers/net/ethernet/amd/xgbe/xgbe-dev.c
@@ -1482,7 +1482,7 @@ static void xgbe_tx_desc_init(struct xgbe_channel *channel)
 
 	DBGPR("-->tx_desc_init\n");
 
-	/* Initialze all descriptors */
+	/* Initialize all descriptors */
 	for (i = 0; i < ring->rdesc_count; i++) {
 		rdata = XGBE_GET_DESC_DATA(ring, i);
 
diff --git a/drivers/net/ethernet/apm/xgene/xgene_enet_main.c b/drivers/net/ethernet/apm/xgene/xgene_enet_main.c
index 507db46daf2b..ec3329045561 100644
--- a/drivers/net/ethernet/apm/xgene/xgene_enet_main.c
+++ b/drivers/net/ethernet/apm/xgene/xgene_enet_main.c
@@ -1770,7 +1770,7 @@ static int xgene_enet_get_resources(struct xgene_enet_pdata *pdata)
 	if (IS_ERR(pdata->clk)) {
 		if (pdata->phy_mode != PHY_INTERFACE_MODE_SGMII) {
 			/* Abort if the clock is defined but couldn't be
-			 * retrived. Always abort if the clock is missing on
+			 * retrieved. Always abort if the clock is missing on
 			 * DT system as the driver can't cope with this case.
 			 */
 			if (PTR_ERR(pdata->clk) != -ENOENT || dev->of_node)
diff --git a/drivers/net/ethernet/atheros/atl1c/atl1c_hw.h b/drivers/net/ethernet/atheros/atl1c/atl1c_hw.h
index c567c920628f..8f03bb561d44 100644
--- a/drivers/net/ethernet/atheros/atl1c/atl1c_hw.h
+++ b/drivers/net/ethernet/atheros/atl1c/atl1c_hw.h
@@ -659,7 +659,7 @@ void atl1c_post_phy_linkchg(struct atl1c_hw *hw, u16 link_speed);
 /* INT-triggle/SMB Control Register */
 #define REG_SMB_STAT_TIMER		0x15C4	/* 2us resolution */
 #define SMB_STAT_TIMER_MASK		0xFFFFFF
-#define REG_TINT_TPD_THRESH             0x15C8 /* tpd th to trig intrrupt */
+#define REG_TINT_TPD_THRESH             0x15C8 /* tpd th to trig interrupt */
 
 /* Mail box */
 #define MB_RFDX_PROD_IDX_MASK		0xFFFF
diff --git a/drivers/net/ethernet/atheros/atl1e/atl1e.h b/drivers/net/ethernet/atheros/atl1e/atl1e.h
index 9fcad783c939..6b0066f47e9e 100644
--- a/drivers/net/ethernet/atheros/atl1e/atl1e.h
+++ b/drivers/net/ethernet/atheros/atl1e/atl1e.h
@@ -381,7 +381,7 @@ struct atl1e_rx_page {
 	u8		*addr;   /* receive rage virtual address */
 	dma_addr_t	write_offset_dma;  /* the DMA address which contain the
 					      receive data offset in the page */
-	u32		*write_offset_addr; /* the virtaul address which contain
+	u32		*write_offset_addr; /* the virtual address which contain
 					     the receive data offset in the page */
 	u32		read_offset;       /* the offset where we have read */
 };
diff --git a/drivers/net/ethernet/atheros/atl1e/atl1e_hw.c b/drivers/net/ethernet/atheros/atl1e/atl1e_hw.c
index fa89bc27f62d..25d3e7469058 100644
--- a/drivers/net/ethernet/atheros/atl1e/atl1e_hw.c
+++ b/drivers/net/ethernet/atheros/atl1e/atl1e_hw.c
@@ -369,7 +369,7 @@ static int atl1e_phy_setup_autoneg_adv(struct atl1e_hw *hw)
  *
  * hw - Struct containing variables accessed by shared code
  *
- * Sets bit 15 and 12 of the MII control regiser (for F001 bug)
+ * Sets bit 15 and 12 of the MII control register (for F001 bug)
  */
 int atl1e_phy_commit(struct atl1e_hw *hw)
 {
diff --git a/drivers/net/ethernet/atheros/atl1e/atl1e_main.c b/drivers/net/ethernet/atheros/atl1e/atl1e_main.c
index 40290028580b..cc6c262868a5 100644
--- a/drivers/net/ethernet/atheros/atl1e/atl1e_main.c
+++ b/drivers/net/ethernet/atheros/atl1e/atl1e_main.c
@@ -2117,7 +2117,7 @@ static int atl1e_suspend(struct pci_dev *pdev, pm_message_t state)
 			wol_ctrl_data |= WOL_MAGIC_EN | WOL_MAGIC_PME_EN;
 
 		if (wufc & AT_WUFC_LNKC) {
-		/* if orignal link status is link, just wait for retrive link */
+		/* if original link status is link, just wait for retrieve link */
 			if (mii_bmsr_data & BMSR_LSTATUS) {
 				for (i = 0; i < AT_SUSPEND_LINK_TIMEOUT; i++) {
 					msleep(100);
diff --git a/drivers/net/ethernet/atheros/atlx/atl1.c b/drivers/net/ethernet/atheros/atlx/atl1.c
index 98a4d089270e..179d74e93efd 100644
--- a/drivers/net/ethernet/atheros/atlx/atl1.c
+++ b/drivers/net/ethernet/atheros/atlx/atl1.c
@@ -628,7 +628,7 @@ static s32 atl1_phy_leave_power_saving(struct atl1_hw *hw)
  * Resets the PHY and make all config validate
  * hw - Struct containing variables accessed by shared code
  *
- * Sets bit 15 and 12 of the MII Control regiser (for F001 bug)
+ * Sets bit 15 and 12 of the MII Control register (for F001 bug)
  */
 static s32 atl1_phy_reset(struct atl1_hw *hw)
 {
diff --git a/drivers/net/ethernet/atheros/atlx/atl2.c b/drivers/net/ethernet/atheros/atlx/atl2.c
index 5560d5cc3169..c9aca219ec9c 100644
--- a/drivers/net/ethernet/atheros/atlx/atl2.c
+++ b/drivers/net/ethernet/atheros/atlx/atl2.c
@@ -2591,7 +2591,7 @@ static s32 atl2_phy_setup_autoneg_adv(struct atl2_hw *hw)
  *
  * hw - Struct containing variables accessed by shared code
  *
- * Sets bit 15 and 12 of the MII Control regiser (for F001 bug)
+ * Sets bit 15 and 12 of the MII Control register (for F001 bug)
  */
 static s32 atl2_phy_commit(struct atl2_hw *hw)
 {
diff --git a/drivers/net/ethernet/broadcom/bcm63xx_enet.c b/drivers/net/ethernet/broadcom/bcm63xx_enet.c
index 7ef1babfeca6..f6595fdc888d 100644
--- a/drivers/net/ethernet/broadcom/bcm63xx_enet.c
+++ b/drivers/net/ethernet/broadcom/bcm63xx_enet.c
@@ -1564,7 +1564,7 @@ static int bcm_enet_set_pauseparam(struct net_device *dev,
 
 	if (priv->has_phy) {
 		if (ecmd->autoneg && (ecmd->rx_pause != ecmd->tx_pause)) {
-			/* asymetric pause mode not supported,
+			/* asymmetric pause mode not supported,
 			 * actually possible but integrated PHY has RO
 			 * asym_pause bit */
 			return -EINVAL;
diff --git a/drivers/net/ethernet/broadcom/bcm63xx_enet.h b/drivers/net/ethernet/broadcom/bcm63xx_enet.h
index 78f1830fb3cb..ba8f42cf5fb2 100644
--- a/drivers/net/ethernet/broadcom/bcm63xx_enet.h
+++ b/drivers/net/ethernet/broadcom/bcm63xx_enet.h
@@ -265,7 +265,7 @@ struct bcm_enet_priv {
 	/* number of available descriptor for tx */
 	int tx_desc_count;
 
-	/* next tx descriptor avaiable */
+	/* next tx descriptor available */
 	int tx_curr_desc;
 
 	/* next dirty tx descriptor to reclaim */
diff --git a/drivers/net/ethernet/broadcom/bcmsysport.h b/drivers/net/ethernet/broadcom/bcmsysport.h
index a34296f989f1..6f807e96dbd8 100644
--- a/drivers/net/ethernet/broadcom/bcmsysport.h
+++ b/drivers/net/ethernet/broadcom/bcmsysport.h
@@ -402,7 +402,7 @@ struct bcm_rsb {
 #define TDMA_DESC_RING_BASE(i)		(TDMA_DESC_RING_00_BASE + \
 					((i) * TDMA_DESC_RING_SIZE))
 
-/* Ring indexed register addreses */
+/* Ring indexed register addresses */
 #define TDMA_DESC_RING_HEAD_TAIL_PTR(i)	(TDMA_DESC_RING_BASE(i) + \
 					RING_HEAD_TAIL_PTR)
 #define TDMA_DESC_RING_COUNT(i)		(TDMA_DESC_RING_BASE(i) + \
diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x.h b/drivers/net/ethernet/broadcom/bnx2x/bnx2x.h
index 9580ab83d387..a2050083048b 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x.h
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x.h
@@ -666,7 +666,7 @@ struct bnx2x_fastpath {
 				 MAX_TX_DESC_CNT * NEXT_PAGE_TX_DESC_CNT)
 /* max BDs per tx packet w/o next_pages:
  * START_BD		- describes packed
- * START_BD(splitted)	- includes unpaged data segment for GSO
+ * START_BD(split)	- includes unpaged data segment for GSO
  * PARSING_BD		- for TSO and CSUM data
  * PARSING_BD2		- for encapsulation data
  * Frag BDs		- describes pages for frags
diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_dcb.c b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_dcb.c
index 9af81630c8a4..3df8a5988521 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_dcb.c
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_dcb.c
@@ -1986,7 +1986,7 @@ static void bnx2x_dcbnl_set_pg_tccfg_tx(struct net_device *netdev, int prio,
 		return;
 
 	/**
-	 * bw_pct ignored -	band-width percentage devision between user
+	 * bw_pct ignored -	band-width percentage division between user
 	 *			priorities within the same group is not
 	 *			standard and hence not supported
 	 *
@@ -2038,7 +2038,7 @@ static void bnx2x_dcbnl_get_pg_tccfg_tx(struct net_device *netdev, int prio,
 	DP(BNX2X_MSG_DCB, "prio = %d\n", prio);
 
 	/**
-	 * bw_pct ignored -	band-width percentage devision between user
+	 * bw_pct ignored -	band-width percentage division between user
 	 *			priorities within the same group is not
 	 *			standard and hence not supported
 	 *
diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_hsi.h b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_hsi.h
index 611efee75834..5297ab578a6f 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_hsi.h
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_hsi.h
@@ -2342,7 +2342,7 @@ struct shmem2_region {
 		u32 oem_i2c_data_addr;
 	};
 
-	/* 9 entires for the C2S PCP map for each inner VLAN PCP + 1 default */
+	/* 9 entries for the C2S PCP map for each inner VLAN PCP + 1 default */
 	/* For PCP values 0-3 use the map lower */
 	/* 0xFF000000 - PCP 0, 0x00FF0000 - PCP 1,
 	 * 0x0000FF00 - PCP 2, 0x000000FF PCP 3
diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_init_ops.h b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_init_ops.h
index fc7fce642666..b5004aab124d 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_init_ops.h
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_init_ops.h
@@ -582,7 +582,7 @@ static void bnx2x_init_pxp_arb(struct bnx2x *bp, int r_order,
 		REG_WR(bp, PXP2_REG_WR_CDU_MPS, val);
 	}
 
-	/* Validate number of tags suppoted by device */
+	/* Validate number of tags supported by device */
 #define PCIE_REG_PCIER_TL_HDR_FC_ST		0x2980
 	val = REG_RD(bp, PCIE_REG_PCIER_TL_HDR_FC_ST);
 	val &= 0xFF;
diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_link.c b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_link.c
index ea310057fe3a..84d002b31920 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_link.c
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_link.c
@@ -2536,7 +2536,7 @@ static int bnx2x_pbf_update(struct link_params *params, u32 flow_ctrl,
 }
 
 /**
- * bnx2x_get_emac_base - retrive emac base address
+ * bnx2x_get_emac_base - retrieve emac base address
  *
  * @bp:			driver handle
  * @mdc_mdio_access:	access type
@@ -3593,7 +3593,7 @@ static u8 bnx2x_ext_phy_resolve_fc(struct bnx2x_phy *phy,
 	u8 ret = 0;
 	vars->flow_ctrl = BNX2X_FLOW_CTRL_NONE;
 	if (phy->req_flow_ctrl != BNX2X_FLOW_CTRL_AUTO) {
-		/* Update the advertised flow-controled of LD/LP in AN */
+		/* Update the advertised flow-controlled of LD/LP in AN */
 		if (phy->req_line_speed == SPEED_AUTO_NEG)
 			bnx2x_ext_phy_update_adv_fc(phy, params, vars);
 		/* But set the flow-control result as the requested one */
@@ -3743,7 +3743,7 @@ static void bnx2x_warpcore_enable_AN_KR(struct bnx2x_phy *phy,
 		{MDIO_WC_DEVAD, MDIO_WC_REG_CL72_USERB0_CL72_TX_FIR_TAP, 0},
 	};
 	DP(NETIF_MSG_LINK, "Enable Auto Negotiation for KR\n");
-	/* Set to default registers that may be overriden by 10G force */
+	/* Set to default registers that may be overridden by 10G force */
 	for (i = 0; i < ARRAY_SIZE(reg_set); i++)
 		bnx2x_cl45_write(bp, phy, reg_set[i].devad, reg_set[i].reg,
 				 reg_set[i].val);
@@ -5425,7 +5425,7 @@ static void bnx2x_flow_ctrl_resolve(struct bnx2x_phy *phy,
 
 	/* Resolve from gp_status in case of AN complete and not sgmii */
 	if (phy->req_flow_ctrl != BNX2X_FLOW_CTRL_AUTO) {
-		/* Update the advertised flow-controled of LD/LP in AN */
+		/* Update the advertised flow-controlled of LD/LP in AN */
 		if (phy->req_line_speed == SPEED_AUTO_NEG)
 			bnx2x_update_adv_fc(phy, params, vars, gp_status);
 		/* But set the flow-control result as the requested one */
diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
index 39eb6ab5f805..277c7bd9c6e7 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
@@ -12669,7 +12669,7 @@ static int bnx2x_set_mc_list(struct bnx2x *bp)
 		if (rc)
 			return rc;
 
-		/* Override the curently configured set of mc filters */
+		/* Override the currently configured set of mc filters */
 		rc = bnx2x_config_mcast(bp, &rparam,
 					BNX2X_MCAST_CMD_SET);
 		if (rc < 0)
diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_reg.h b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_reg.h
index a018f251d198..30943f347164 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_reg.h
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_reg.h
@@ -2236,7 +2236,7 @@ extern const u32 dmae_reg_go_c[];
 /* [RW 1] Output enable for TX PAUSE signal to the MAC. */
 #define NIG_REG_P0_MAC_PAUSE_OUT_EN				 0x185b4
 /* [RW 32] Eight 4-bit configurations for specifying which COS (0-15 for
- * future expansion) each priorty is to be mapped to. Bits 3:0 specify the
+ * future expansion) each priority is to be mapped to. Bits 3:0 specify the
  * COS for priority 0. Bits 31:28 specify the COS for priority 7. The 3-bit
  * priority field is extracted from the outer-most VLAN in receive packet.
  * Only COS 0 and COS 1 are supported in E2. */
@@ -2434,7 +2434,7 @@ extern const u32 dmae_reg_go_c[];
 /* [RW 1] Output enable for TX PAUSE signal to the MAC. */
 #define NIG_REG_P1_MAC_PAUSE_OUT_EN				 0x185c8
 /* [RW 32] Eight 4-bit configurations for specifying which COS (0-15 for
- * future expansion) each priorty is to be mapped to. Bits 3:0 specify the
+ * future expansion) each priority is to be mapped to. Bits 3:0 specify the
  * COS for priority 0. Bits 31:28 specify the COS for priority 7. The 3-bit
  * priority field is extracted from the outer-most VLAN in receive packet.
  * Only COS 0 and COS 1 are supported in E2. */
diff --git a/drivers/net/ethernet/brocade/bna/bfa_ioc.c b/drivers/net/ethernet/brocade/bna/bfa_ioc.c
index 92c7639d1fc7..07ca97b56b3e 100644
--- a/drivers/net/ethernet/brocade/bna/bfa_ioc.c
+++ b/drivers/net/ethernet/brocade/bna/bfa_ioc.c
@@ -1605,7 +1605,7 @@ bfa_flash_read_start(void __iomem *pci_bar, u32 offset, u32 len,
 {
 	int status;
 
-	/* len must be mutiple of 4 and not exceeding fifo size */
+	/* len must be multiple of 4 and not exceeding fifo size */
 	if (len == 0 || len > BFA_FLASH_FIFO_SIZE || (len & 0x03) != 0)
 		return BFA_FLASH_ERR_LEN;
 
@@ -3023,7 +3023,7 @@ bfa_ioc_poll_fwinit(struct bfa_ioc *ioc)
 /*
  * FLASH DMA buffer should be big enough to hold both MFG block and
  * asic block(64k) at the same time and also should be 2k aligned to
- * avoid write segement to cross sector boundary.
+ * avoid write segment to cross sector boundary.
  */
 #define BFA_FLASH_SEG_SZ	2048
 #define BFA_FLASH_DMA_BUF_SZ	\
diff --git a/drivers/net/ethernet/brocade/bna/bna_enet.c b/drivers/net/ethernet/brocade/bna/bna_enet.c
index 883de0ac8de4..6c787c93c8f6 100644
--- a/drivers/net/ethernet/brocade/bna/bna_enet.c
+++ b/drivers/net/ethernet/brocade/bna/bna_enet.c
@@ -1877,13 +1877,13 @@ bna_res_req(struct bna_res_info *res_info)
 	res_info[BNA_RES_MEM_T_ATTR].res_u.mem_info.len =
 				ALIGN(bfa_nw_ioc_meminfo(), PAGE_SIZE);
 
-	/* Virtual memory for retreiving fw_trc */
+	/* Virtual memory for retrieving fw_trc */
 	res_info[BNA_RES_MEM_T_FWTRC].res_type = BNA_RES_T_MEM;
 	res_info[BNA_RES_MEM_T_FWTRC].res_u.mem_info.mem_type = BNA_MEM_T_KVA;
 	res_info[BNA_RES_MEM_T_FWTRC].res_u.mem_info.num = 1;
 	res_info[BNA_RES_MEM_T_FWTRC].res_u.mem_info.len = BNA_DBG_FWTRC_LEN;
 
-	/* DMA memory for retreiving stats */
+	/* DMA memory for retrieving stats */
 	res_info[BNA_RES_MEM_T_STATS].res_type = BNA_RES_T_MEM;
 	res_info[BNA_RES_MEM_T_STATS].res_u.mem_info.mem_type = BNA_MEM_T_DMA;
 	res_info[BNA_RES_MEM_T_STATS].res_u.mem_info.num = 1;
diff --git a/drivers/net/ethernet/calxeda/xgmac.c b/drivers/net/ethernet/calxeda/xgmac.c
index a2410fba6be2..4792d5c290ae 100644
--- a/drivers/net/ethernet/calxeda/xgmac.c
+++ b/drivers/net/ethernet/calxeda/xgmac.c
@@ -1117,7 +1117,7 @@ static netdev_tx_t xgmac_xmit(struct sk_buff *skb, struct net_device *dev)
 			desc_set_tx_owner(desc, desc_flags);
 	}
 
-	/* Interrupt on completition only for the latest segment */
+	/* Interrupt on completion only for the latest segment */
 	if (desc != first)
 		desc_set_tx_owner(desc, desc_flags |
 			TXDESC_LAST_SEG | irq_flag);
diff --git a/drivers/net/ethernet/cavium/liquidio/cn66xx_device.c b/drivers/net/ethernet/cavium/liquidio/cn66xx_device.c
index 93fccfec288d..d3ebbb40579e 100644
--- a/drivers/net/ethernet/cavium/liquidio/cn66xx_device.c
+++ b/drivers/net/ethernet/cavium/liquidio/cn66xx_device.c
@@ -177,7 +177,7 @@ static void lio_cn66xx_setup_pkt_ctl_regs(struct octeon_device *oct)
 
 	/* 66XX SPECIFIC */
 	if (CFG_GET_OQ_MAX_Q(cn6xxx->conf) <= 4)
-		/* Disable RING_EN if only upto 4 rings are used. */
+		/* Disable RING_EN if only up to 4 rings are used. */
 		pktctl &= ~(1 << 4);
 	else
 		pktctl |= (1 << 4);
diff --git a/drivers/net/ethernet/cavium/liquidio/lio_core.c b/drivers/net/ethernet/cavium/liquidio/lio_core.c
index 93b06d599eed..bed450bfad38 100644
--- a/drivers/net/ethernet/cavium/liquidio/lio_core.c
+++ b/drivers/net/ethernet/cavium/liquidio/lio_core.c
@@ -565,7 +565,7 @@ static int octeon_setup_droq(struct octeon_device *oct, int q_no, int num_descs,
 }
 
 /**
- * liquidio_push_packet - Routine to push packets arriving on Octeon interface upto network layer.
+ * liquidio_push_packet - Routine to push packets arriving on Octeon interface up to network layer.
  * @octeon_id:octeon device id.
  * @skbuff:   skbuff struct to be passed to network layer.
  * @len:      size of total data received.
diff --git a/drivers/net/ethernet/cavium/liquidio/octeon_config.h b/drivers/net/ethernet/cavium/liquidio/octeon_config.h
index 24c212001212..d2d64edaf3bf 100644
--- a/drivers/net/ethernet/cavium/liquidio/octeon_config.h
+++ b/drivers/net/ethernet/cavium/liquidio/octeon_config.h
@@ -254,7 +254,7 @@ struct octeon_oq_config {
 	u64 pkts_per_intr:16;
 
 	/** Interrupt Coalescing (Time Interval). Octeon will interrupt the
-	 *  host if atleast one packet was sent in the time interval specified
+	 *  host if at least one packet was sent in the time interval specified
 	 *  by this field. The driver uses time interval interrupt coalescing
 	 *  by default. The time is specified in microseconds.
 	 */
@@ -296,7 +296,7 @@ struct octeon_oq_config {
 	u64 oq_intr_pkt:16;
 
 	/** Interrupt Coalescing (Time Interval). Octeon will interrupt the
-	 *  host if atleast one packet was sent in the time interval specified
+	 *  host if at least one packet was sent in the time interval specified
 	 *  by this field. The driver uses time interval interrupt coalescing
 	 *  by default.  The time is specified in microseconds.
 	 */
diff --git a/drivers/net/ethernet/cavium/liquidio/octeon_iq.h b/drivers/net/ethernet/cavium/liquidio/octeon_iq.h
index a04f36a0e1a0..fdd7d3a77a2d 100644
--- a/drivers/net/ethernet/cavium/liquidio/octeon_iq.h
+++ b/drivers/net/ethernet/cavium/liquidio/octeon_iq.h
@@ -70,7 +70,7 @@ struct oct_iq_stats {
 
 /** The instruction (input) queue.
  *  The input queue is used to post raw (instruction) mode data or packet
- *  data to Octeon device from the host. Each input queue (upto 4) for
+ *  data to Octeon device from the host. Each input queue (up to 4) for
  *  a Octeon device has one such structure to represent it.
  */
 struct octeon_instr_queue {
diff --git a/drivers/net/ethernet/cavium/liquidio/octeon_main.h b/drivers/net/ethernet/cavium/liquidio/octeon_main.h
index 953edf0c7096..d2a52673cac5 100644
--- a/drivers/net/ethernet/cavium/liquidio/octeon_main.h
+++ b/drivers/net/ethernet/cavium/liquidio/octeon_main.h
@@ -166,7 +166,7 @@ static inline int octeon_map_pci_barx(struct octeon_device *oct,
  * errno -EINTR: user abort the command.
  * errno -ETIME: user spefified timeout value has been expired.
  * errno -EBUSY: the response of the request does not return in
- *               resonable time (LIO_SC_MAX_TMO_MS).
+ *               reasonable time (LIO_SC_MAX_TMO_MS).
  *               the sc wll be move to zombie response list by
  *               lio_process_ordered_list()
  *
diff --git a/drivers/net/ethernet/cavium/liquidio/octeon_nic.h b/drivers/net/ethernet/cavium/liquidio/octeon_nic.h
index c139fc423764..8341faaa0c24 100644
--- a/drivers/net/ethernet/cavium/liquidio/octeon_nic.h
+++ b/drivers/net/ethernet/cavium/liquidio/octeon_nic.h
@@ -277,7 +277,7 @@ int octnet_send_nic_data_pkt(struct octeon_device *oct,
 
 /** Send a NIC control packet to the device
  * @param oct - octeon device pointer
- * @param nctrl - control structure with command, timout, and callback info
+ * @param nctrl - control structure with command, timeout, and callback info
  * @returns IQ_FAILED if it failed to add to the input queue. IQ_STOP if the
  * queue should be stopped, and IQ_SEND_OK if it sent okay.
  */
diff --git a/drivers/net/ethernet/cavium/liquidio/request_manager.c b/drivers/net/ethernet/cavium/liquidio/request_manager.c
index d7cfb20eea00..a983e7f79461 100644
--- a/drivers/net/ethernet/cavium/liquidio/request_manager.c
+++ b/drivers/net/ethernet/cavium/liquidio/request_manager.c
@@ -40,7 +40,7 @@ static void  __check_db_timeout(struct octeon_device *oct, u64 iq_no);
 
 static void (*reqtype_free_fn[MAX_OCTEON_DEVICES][REQTYPE_LAST + 1]) (void *);
 
-/* Define this to return the request status comaptible to old code */
+/* Define this to return the request status compatible to old code */
 /*#define OCTEON_USE_OLD_REQ_STATUS*/
 
 /* Return 0 on success, 1 on failure */
diff --git a/drivers/net/ethernet/cavium/thunder/nic.h b/drivers/net/ethernet/cavium/thunder/nic.h
index 090d6b83982a..bb3f4fa6b995 100644
--- a/drivers/net/ethernet/cavium/thunder/nic.h
+++ b/drivers/net/ethernet/cavium/thunder/nic.h
@@ -97,7 +97,7 @@
  * This value ensures that once a packet has been "accepted"
  * for reception it will not get dropped due to non-availability
  * of CQ descriptor. An errata in HW mandates this value to be
- * atleast 0x100.
+ * at least 0x100.
  */
 #define NICPF_CQM_MIN_DROP_LEVEL       0x100
 
diff --git a/drivers/net/ethernet/cavium/thunder/nic_main.c b/drivers/net/ethernet/cavium/thunder/nic_main.c
index 0ec65ec634df..086f32b61580 100644
--- a/drivers/net/ethernet/cavium/thunder/nic_main.c
+++ b/drivers/net/ethernet/cavium/thunder/nic_main.c
@@ -595,7 +595,7 @@ static void nic_config_rss(struct nicpf *nic, struct rss_cfg_msg *cfg)
 	nic_reg_write(nic, idx_addr | (cpi_base << 3), cpi_cfg);
 }
 
-/* 4 level transmit side scheduler configutation
+/* 4 level transmit side scheduler configuration
  * for TNS bypass mode
  *
  * Sample configuration for SQ0 on 88xx
diff --git a/drivers/net/ethernet/chelsio/cxgb3/sge.c b/drivers/net/ethernet/chelsio/cxgb3/sge.c
index b59735d0e065..238e85bf3b4f 100644
--- a/drivers/net/ethernet/chelsio/cxgb3/sge.c
+++ b/drivers/net/ethernet/chelsio/cxgb3/sge.c
@@ -3273,7 +3273,7 @@ void t3_sge_stop_dma(struct adapter *adap)
 }
 
 /**
- *	t3_sge_stop - disable SGE operation completly
+ *	t3_sge_stop - disable SGE operation completely
  *	@adap: the adapter
  *
  *	Called from process context. Disables the DMA engine and any
diff --git a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_dcb.c b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_dcb.c
index 7d5204834ee2..a4903e149e5f 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_dcb.c
+++ b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_dcb.c
@@ -50,7 +50,7 @@ void cxgb4_dcb_version_init(struct net_device *dev)
 	struct port_info *pi = netdev2pinfo(dev);
 	struct port_dcb_info *dcb = &pi->dcb;
 
-	/* Any writes here are only done on kernels that exlicitly need
+	/* Any writes here are only done on kernels that explicitly need
 	 * a specific version, say < 2.6.38 which only support CEE
 	 */
 	dcb->dcb_version = FW_PORT_DCB_VER_AUTO;
diff --git a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_ethtool.c b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_ethtool.c
index 0092bc16f887..c58cb4078b97 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_ethtool.c
+++ b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_ethtool.c
@@ -1614,7 +1614,7 @@ static int set_rss_table(struct net_device *dev,
 	if (!rxfh->indir)
 		return 0;
 
-	/* Interface must be brought up atleast once */
+	/* Interface must be brought up at least once */
 	if (pi->adapter->flags & CXGB4_FULL_INIT_DONE) {
 		for (i = 0; i < pi->rss_size; i++)
 			pi->rss[i] = rxfh->indir[i];
diff --git a/drivers/net/ethernet/chelsio/cxgb4/t4_hw.c b/drivers/net/ethernet/chelsio/cxgb4/t4_hw.c
index 29d7b786e51e..f4b14bbbe512 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/t4_hw.c
+++ b/drivers/net/ethernet/chelsio/cxgb4/t4_hw.c
@@ -9825,7 +9825,7 @@ int t4_read_cim_obq(struct adapter *adap, unsigned int qid, u32 *data, size_t n)
 		     QUENUMSELECT_V(qid));
 	v = t4_read_reg(adap, CIM_QUEUE_CONFIG_CTRL_A);
 
-	addr = CIMQBASE_G(v) * 64;    /* muliple of 256 -> muliple of 4 */
+	addr = CIMQBASE_G(v) * 64;    /* multiple of 256 -> multiple of 4 */
 	nwords = CIMQSIZE_G(v) * 64;  /* same */
 	if (n > nwords)
 		n = nwords;
diff --git a/drivers/net/ethernet/chelsio/cxgb4vf/sge.c b/drivers/net/ethernet/chelsio/cxgb4vf/sge.c
index 31fab2415743..b4374ca1d653 100644
--- a/drivers/net/ethernet/chelsio/cxgb4vf/sge.c
+++ b/drivers/net/ethernet/chelsio/cxgb4vf/sge.c
@@ -2194,7 +2194,7 @@ static void __iomem *bar2_address(struct adapter *adapter,
  *	@rspq: pointer to the new rxq's Response Queue to be filled in
  *	@iqasynch: if 0, a normal rspq; if 1, an asynchronous event queue
  *	@dev: the network device associated with the new rspq
- *	@intr_dest: MSI-X vector index (overriden in MSI mode)
+ *	@intr_dest: MSI-X vector index (overridden in MSI mode)
  *	@fl: pointer to the new rxq's Free List to be filled in
  *	@hnd: the interrupt handler to invoke for the rspq
  */
diff --git a/drivers/net/ethernet/cirrus/cs89x0.c b/drivers/net/ethernet/cirrus/cs89x0.c
index fc8b1cb950a1..98c43315eb97 100644
--- a/drivers/net/ethernet/cirrus/cs89x0.c
+++ b/drivers/net/ethernet/cirrus/cs89x0.c
@@ -257,9 +257,9 @@ control_dc_dc(struct net_device *dev, int on_not_off)
 	struct net_local *lp = netdev_priv(dev);
 	unsigned int selfcontrol;
 	unsigned long timenow = jiffies;
-	/* control the DC to DC convertor in the SelfControl register.
+	/* control the DC to DC converter in the SelfControl register.
 	 * Note: This is hooked up to a general purpose pin, might not
-	 * always be a DC to DC convertor.
+	 * always be a DC to DC converter.
 	 */
 
 	selfcontrol = HCB1_ENBL; /* Enable the HCB1 bit as an output */
diff --git a/drivers/net/ethernet/dec/tulip/de2104x.c b/drivers/net/ethernet/dec/tulip/de2104x.c
index f38a10c79907..fa52e099409c 100644
--- a/drivers/net/ethernet/dec/tulip/de2104x.c
+++ b/drivers/net/ethernet/dec/tulip/de2104x.c
@@ -373,7 +373,7 @@ static void de_rx_err_acct (struct de_private *de, unsigned rx_tail,
 		  rx_tail, status, len);
 
 	if ((status & 0x38000300) != 0x0300) {
-		/* Ingore earlier buffers. */
+		/* Ignore earlier buffers. */
 		if ((status & 0xffff) != 0x7fff) {
 			netif_warn(de, rx_err, de->dev,
 				   "Oversized Ethernet frame spanned multiple buffers, status %08x!\n",
diff --git a/drivers/net/ethernet/dec/tulip/interrupt.c b/drivers/net/ethernet/dec/tulip/interrupt.c
index 0a12cb9b3ba7..8c02771b28e4 100644
--- a/drivers/net/ethernet/dec/tulip/interrupt.c
+++ b/drivers/net/ethernet/dec/tulip/interrupt.c
@@ -177,7 +177,7 @@ int tulip_poll(struct napi_struct *napi, int budget)
 			   pkt_len > 1518) {
 			       if ((status & (RxLengthOver2047 |
 					      RxWholePkt)) != RxWholePkt) {
-                                /* Ingore earlier buffers. */
+                                /* Ignore earlier buffers. */
                                        if ((status & 0xffff) != 0x7fff) {
                                                if (tulip_debug > 1)
                                                        dev_warn(&dev->dev,
@@ -408,7 +408,7 @@ static int tulip_rx(struct net_device *dev)
 		    pkt_len > 1518) {
 			if ((status & (RxLengthOver2047 |
 			     RxWholePkt))         != RxWholePkt) {
-				/* Ingore earlier buffers. */
+				/* Ignore earlier buffers. */
 				if ((status & 0xffff) != 0x7fff) {
 					if (tulip_debug > 1)
 						netdev_warn(dev,
diff --git a/drivers/net/ethernet/dec/tulip/media.c b/drivers/net/ethernet/dec/tulip/media.c
index 55d6fc99f40b..0c9694d2b38a 100644
--- a/drivers/net/ethernet/dec/tulip/media.c
+++ b/drivers/net/ethernet/dec/tulip/media.c
@@ -24,7 +24,7 @@
 
 /* Read and write the MII registers using software-generated serial
    MDIO protocol.  It is just different enough from the EEPROM protocol
-   to not share code.  The maxium data clock rate is 2.5 Mhz. */
+   to not share code.  The maximum data clock rate is 2.5 Mhz. */
 #define MDIO_SHIFT_CLK		0x10000
 #define MDIO_DATA_WRITE0	0x00000
 #define MDIO_DATA_WRITE1	0x20000
diff --git a/drivers/net/ethernet/dec/tulip/tulip.h b/drivers/net/ethernet/dec/tulip/tulip.h
index 5e010e1fa6f7..e39e5c78d4cc 100644
--- a/drivers/net/ethernet/dec/tulip/tulip.h
+++ b/drivers/net/ethernet/dec/tulip/tulip.h
@@ -250,7 +250,7 @@ enum t21143_csr6_bits {
 	csr6_ttm = (1<<22),  /* Transmit Threshold Mode, set for 10baseT, 0 for 100BaseTX */
 	csr6_sf = (1<<21),   /* Store and forward. If set ignores TR bits */
 	csr6_hbd = (1<<19),  /* Heart beat disable. Disables SQE function in 10baseT */
-	csr6_ps = (1<<18),   /* Port Select. 0 (defualt) = 10baseT, 1 = 100baseTX: can't be set */
+	csr6_ps = (1<<18),   /* Port Select. 0 (default) = 10baseT, 1 = 100baseTX: can't be set */
 	csr6_ca = (1<<17),   /* Collision Offset Enable. If set uses special algorithm in low collision situations */
 	csr6_trh = (1<<15),  /* Transmit Threshold high bit */
 	csr6_trl = (1<<14),  /* Transmit Threshold low bit */
@@ -274,7 +274,7 @@ enum t21143_csr6_bits {
 	csr6_om_int_loop = (1<<10), /* internal (FIFO) loopback flag */
 	csr6_om_ext_loop = (1<<11), /* external (PMD) loopback flag */
 	/* set both and you get (PHY) loopback */
-	csr6_fd = (1<<9),    /* Full duplex mode, disables hearbeat, no loopback */
+	csr6_fd = (1<<9),    /* Full duplex mode, disables heartbeat, no loopback */
 	csr6_pm = (1<<7),    /* Pass All Multicast */
 	csr6_pr = (1<<6),    /* Promiscuous mode */
 	csr6_sb = (1<<5),    /* Start(1)/Stop(0) backoff counter */
diff --git a/drivers/net/ethernet/dec/tulip/winbond-840.c b/drivers/net/ethernet/dec/tulip/winbond-840.c
index a5581f1d0141..be9199f55a8a 100644
--- a/drivers/net/ethernet/dec/tulip/winbond-840.c
+++ b/drivers/net/ethernet/dec/tulip/winbond-840.c
@@ -1188,7 +1188,7 @@ static int netdev_rx(struct net_device *dev)
 			break;
 		if ((status & 0x38008300) != 0x0300) {
 			if ((status & 0x38000300) != 0x0300) {
-				/* Ingore earlier buffers. */
+				/* Ignore earlier buffers. */
 				if ((status & 0xffff) != 0x7fff) {
 					dev_warn(&dev->dev,
 						 "Oversized Ethernet frame spanned multiple buffers, entry %#x status %04x!\n",
diff --git a/drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c b/drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c
index 6f1046c9cc51..27b405e93c64 100644
--- a/drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c
+++ b/drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c
@@ -1820,7 +1820,7 @@ static void dpaa2_eth_seed_pools(struct dpaa2_eth_priv *priv)
 /*
  * Drain the specified number of buffers from one of the DPNI's private buffer
  * pools.
- * @count must not exceeed DPAA2_ETH_BUFS_PER_CMD
+ * @count must not exceed DPAA2_ETH_BUFS_PER_CMD
  */
 static void dpaa2_eth_drain_bufs(struct dpaa2_eth_priv *priv, int bpid,
 				 int count)
diff --git a/drivers/net/ethernet/freescale/fman/fman_memac.c b/drivers/net/ethernet/freescale/fman/fman_memac.c
index e2d8c58deef0..c1d588337751 100644
--- a/drivers/net/ethernet/freescale/fman/fman_memac.c
+++ b/drivers/net/ethernet/freescale/fman/fman_memac.c
@@ -1311,7 +1311,7 @@ int memac_initialization(struct mac_device *mac_dev,
 
 	/* Most boards should use MLO_AN_INBAND, but existing boards don't have
 	 * a managed property. Default to MLO_AN_INBAND rather than MLO_AN_PHY.
-	 * Phylink will allow this to be overriden by a fixed link. We need to
+	 * Phylink will allow this to be overridden by a fixed link. We need to
 	 * be careful and not enable this if we are using MII or RGMII, since
 	 * those configurations modes don't use in-band autonegotiation.
 	 */
diff --git a/drivers/net/ethernet/freescale/gianfar.c b/drivers/net/ethernet/freescale/gianfar.c
index cf636fc5aafa..332881c9daed 100644
--- a/drivers/net/ethernet/freescale/gianfar.c
+++ b/drivers/net/ethernet/freescale/gianfar.c
@@ -1041,7 +1041,7 @@ static void gfar_halt(struct gfar_private *priv)
 	struct gfar __iomem *regs = priv->gfargrp[0].regs;
 	u32 tempval;
 
-	/* Dissable the Rx/Tx hw queues */
+	/* Disable the Rx/Tx hw queues */
 	gfar_write(&regs->rqueue, 0);
 	gfar_write(&regs->tqueue, 0);
 
diff --git a/drivers/net/ethernet/freescale/gianfar.h b/drivers/net/ethernet/freescale/gianfar.h
index 68b59d3202e3..9ad4d426ed1c 100644
--- a/drivers/net/ethernet/freescale/gianfar.h
+++ b/drivers/net/ethernet/freescale/gianfar.h
@@ -1176,7 +1176,7 @@ struct gfar_private {
 		extended_hash:1,
 		bd_stash_en:1,
 		rx_filer_enable:1,
-		/* Enable priorty based Tx scheduling in Hw */
+		/* Enable priority based Tx scheduling in Hw */
 		prio_sched_en:1,
 		/* Flow control flags */
 		pause_aneg_en:1,
diff --git a/drivers/net/ethernet/hisilicon/hns/hns_dsaf_misc.c b/drivers/net/ethernet/hisilicon/hns/hns_dsaf_misc.c
index 91391a49fcea..a59fd280a045 100644
--- a/drivers/net/ethernet/hisilicon/hns/hns_dsaf_misc.c
+++ b/drivers/net/ethernet/hisilicon/hns/hns_dsaf_misc.c
@@ -591,7 +591,7 @@ static int hns_mac_config_sds_loopback(struct hns_mac_cb *mac_cb, bool en)
 #define HILINK_ACCESS_SEL_CFG		0x40008
 			/* hilink4 & hilink3 use the same xge training and
 			 * xge u adaptor. There is a hilink access sel cfg
-			 * register to select which one to be configed
+			 * register to select which one to be configured
 			 */
 			if ((!HNS_DSAF_IS_DEBUG(mac_cb->dsaf_dev)) &&
 			    (mac_cb->mac_id <= 3))
diff --git a/drivers/net/ethernet/hisilicon/hns/hns_dsaf_ppe.c b/drivers/net/ethernet/hisilicon/hns/hns_dsaf_ppe.c
index 5013beb4d282..408d36d85fb1 100644
--- a/drivers/net/ethernet/hisilicon/hns/hns_dsaf_ppe.c
+++ b/drivers/net/ethernet/hisilicon/hns/hns_dsaf_ppe.c
@@ -139,7 +139,7 @@ static void hns_ppe_set_vlan_strip(struct hns_ppe_cb *ppe_cb, int en)
 }
 
 /**
- * hns_ppe_checksum_hw - set ppe checksum caculate
+ * hns_ppe_checksum_hw - set ppe checksum calculate
  * @ppe_cb: ppe device
  * @value: value
  */
diff --git a/drivers/net/ethernet/hisilicon/hns/hns_enet.c b/drivers/net/ethernet/hisilicon/hns/hns_enet.c
index e905f10b894e..d819d2bb3450 100644
--- a/drivers/net/ethernet/hisilicon/hns/hns_enet.c
+++ b/drivers/net/ethernet/hisilicon/hns/hns_enet.c
@@ -1230,7 +1230,7 @@ static void hns_nic_update_stats(struct net_device *netdev)
 	h->dev->ops->update_stats(h, &netdev->stats);
 }
 
-/* set mac addr if it is configed. or leave it to the AE driver */
+/* set mac addr if it is configured. or leave it to the AE driver */
 static void hns_init_mac_addr(struct net_device *ndev)
 {
 	struct hns_nic_priv *priv = netdev_priv(ndev);
@@ -2317,7 +2317,7 @@ static int hns_nic_dev_probe(struct platform_device *pdev)
 		ret = device_property_read_u32(dev, "port-id", &port_id);
 		if (ret)
 			goto out_read_prop_fail;
-		/* for old dts, we need to caculate the port offset */
+		/* for old dts, we need to calculate the port offset */
 		port_id = port_id < HNS_SRV_OFFSET ? port_id + HNS_DEBUG_OFFSET
 			: port_id - HNS_SRV_OFFSET;
 	}
diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
index e6af939c1c19..bf35f55f5b8f 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
@@ -10527,7 +10527,7 @@ static int hclge_get_link_diagnosis_info(struct hnae3_handle *handle,
 }
 
 /* After disable sriov, VF still has some config and info need clean,
- * which configed by PF.
+ * which configured by PF.
  */
 static void hclge_clear_vport_vf_info(struct hclge_vport *vport, int vfid)
 {
diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c
index 00c3f2548bf6..bf533b8f46ae 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c
@@ -35,7 +35,7 @@ enum hclge_shaper_level {
  * IR(Mbps) = -------------------------  *  CLOCK(1000Mbps)
  *		Tick * (2 ^ IR_s)
  *
- * @return: 0: calculate sucessful, negative: fail
+ * @return: 0: calculate successful, negative: fail
  */
 static int hclge_shaper_para_calc(u32 ir, u8 shaper_level,
 				  struct hclge_shaper_ir_para *ir_para,
diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_main.c b/drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_main.c
index 063a692c2b41..5d14d29b0296 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_main.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_main.c
@@ -1880,7 +1880,7 @@ static void hclgevf_reset_service_task(struct hclgevf_dev *hdev)
 		 * from PF as cmdq would be in unreliable state i.e. mailbox
 		 * communication between PF and VF would be broken.
 		 *
-		 * if we are never geting into pending state it means either:
+		 * if we are never getting into pending state it means either:
 		 * 1. PF is not receiving our request which could be due to IMP
 		 *    reset
 		 * 2. PF is screwed
diff --git a/drivers/net/ethernet/ibm/emac/emac.h b/drivers/net/ethernet/ibm/emac/emac.h
index 09d3ac374b2d..38b9b623fa7a 100644
--- a/drivers/net/ethernet/ibm/emac/emac.h
+++ b/drivers/net/ethernet/ibm/emac/emac.h
@@ -2,7 +2,7 @@
 /*
  * drivers/net/ethernet/ibm/emac/emac.h
  *
- * Register definitions for PowerPC 4xx on-chip ethernet contoller
+ * Register definitions for PowerPC 4xx on-chip ethernet controller
  *
  * Copyright 2007 Benjamin Herrenschmidt, IBM Corp.
  *                <benh@kernel.crashing.org>
diff --git a/drivers/net/ethernet/ibm/emac/phy.h b/drivers/net/ethernet/ibm/emac/phy.h
index 2184e8373ee5..497639202bd3 100644
--- a/drivers/net/ethernet/ibm/emac/phy.h
+++ b/drivers/net/ethernet/ibm/emac/phy.h
@@ -50,7 +50,7 @@ struct mii_phy {
 	struct mii_phy_def *def;
 	u32 advertising;	/* Ethtool ADVERTISED_* defines */
 	u32 features;		/* Copied from mii_phy_def.features
-				   or determined automaticaly */
+				   or determined automatically */
 	int address;		/* PHY address */
 	int mode;		/* PHY mode */
 	int gpcs_address;	/* GPCS PHY address */
diff --git a/drivers/net/ethernet/jme.h b/drivers/net/ethernet/jme.h
index 860494ff3714..3773b699d2e1 100644
--- a/drivers/net/ethernet/jme.h
+++ b/drivers/net/ethernet/jme.h
@@ -660,7 +660,7 @@ enum jme_rxcs_bit_masks {
 	RXCS_WAKEUP	= 0x00000040, /* Enable receive wakeup packet */
 	RXCS_MAGIC	= 0x00000020, /* Enable receive magic packet */
 	RXCS_SHORT	= 0x00000010, /* Enable receive short packet */
-	RXCS_ABORT	= 0x00000008, /* Enable receive errorr packet */
+	RXCS_ABORT	= 0x00000008, /* Enable receive error packet */
 	RXCS_QST	= 0x00000004, /* Receive queue start */
 	RXCS_SUSPEND	= 0x00000002,
 	RXCS_ENABLE	= 0x00000001,
diff --git a/drivers/net/ethernet/marvell/mvpp2/mvpp2.h b/drivers/net/ethernet/marvell/mvpp2/mvpp2.h
index 061fcd444d50..3ed5670f01c2 100644
--- a/drivers/net/ethernet/marvell/mvpp2/mvpp2.h
+++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2.h
@@ -729,7 +729,7 @@
 #define MVPP2_MAX_TXQ			8
 
 /* MVPP2_MAX_TSO_SEGS is the maximum number of fragments to allow in the GSO
- * skb. As we need a maxium of two descriptors per fragments (1 header, 1 data),
+ * skb. As we need a maximum of two descriptors per fragments (1 header, 1 data),
  * multiply this value by two to count the maximum number of skb descs needed.
  */
 #define MVPP2_MAX_TSO_SEGS		300
diff --git a/drivers/net/ethernet/marvell/mvpp2/mvpp2_prs.c b/drivers/net/ethernet/marvell/mvpp2/mvpp2_prs.c
index 93e978bdf303..ad677cfddb4d 100644
--- a/drivers/net/ethernet/marvell/mvpp2/mvpp2_prs.c
+++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2_prs.c
@@ -382,7 +382,7 @@ static int mvpp2_prs_flow_find(struct mvpp2 *priv, int flow)
 	struct mvpp2_prs_entry pe;
 	int tid;
 
-	/* Go through the all entires with MVPP2_PRS_LU_FLOWS */
+	/* Go through the all entries with MVPP2_PRS_LU_FLOWS */
 	for (tid = MVPP2_PRS_TCAM_SRAM_SIZE - 1; tid >= 0; tid--) {
 		u8 bits;
 
@@ -1212,7 +1212,7 @@ static void mvpp2_prs_mh_init(struct mvpp2 *priv)
 	mvpp2_prs_hw_write(priv, &pe);
 }
 
-/* Set default entires (place holder) for promiscuous, non-promiscuous and
+/* Set default entries (place holder) for promiscuous, non-promiscuous and
  * multicast MAC addresses
  */
 static void mvpp2_prs_mac_init(struct mvpp2 *priv)
@@ -2241,7 +2241,7 @@ mvpp2_prs_mac_da_range_find(struct mvpp2 *priv, int pmap, const u8 *da,
 	struct mvpp2_prs_entry pe;
 	int tid;
 
-	/* Go through the all entires with MVPP2_PRS_LU_MAC */
+	/* Go through the all entries with MVPP2_PRS_LU_MAC */
 	for (tid = MVPP2_PE_MAC_RANGE_START;
 	     tid <= MVPP2_PE_MAC_RANGE_END; tid++) {
 		unsigned int entry_pmap;
@@ -2539,7 +2539,7 @@ int mvpp2_prs_def_flow(struct mvpp2_port *port)
 
 	/* Such entry not exist */
 	if (tid < 0) {
-		/* Go through the all entires from last to first */
+		/* Go through the all entries from last to first */
 		tid = mvpp2_prs_tcam_first_free(port->priv,
 						MVPP2_PE_LAST_FREE_TID,
 					       MVPP2_PE_FIRST_FREE_TID);
diff --git a/drivers/net/ethernet/marvell/octeontx2/af/npc.h b/drivers/net/ethernet/marvell/octeontx2/af/npc.h
index 719b3618eeb5..309244fe8754 100644
--- a/drivers/net/ethernet/marvell/octeontx2/af/npc.h
+++ b/drivers/net/ethernet/marvell/octeontx2/af/npc.h
@@ -84,7 +84,7 @@ enum npc_kpu_lc_ltype {
 	NPC_LT_LC_CUSTOM1 = 0xF,
 };
 
-/* Don't modify Ltypes upto SCTP, otherwise it will
+/* Don't modify Ltypes up to SCTP, otherwise it will
  * effect flow tag calculation and thus RSS.
  */
 enum npc_kpu_ld_ltype {
@@ -140,7 +140,7 @@ enum npc_kpu_lg_ltype {
 	NPC_LT_LG_CUSTOM1 = 0xF,
 };
 
-/* Don't modify Ltypes upto SCTP, otherwise it will
+/* Don't modify Ltypes up to SCTP, otherwise it will
  * effect flow tag calculation and thus RSS.
  */
 enum npc_kpu_lh_ltype {
diff --git a/drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c b/drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c
index 153eb57bad06..d80d2c00bd84 100644
--- a/drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c
+++ b/drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c
@@ -4974,7 +4974,7 @@ static void rvu_nix_setup_capabilities(struct rvu *rvu, int blkaddr)
 
 	/* On OcteonTx2 DWRR quantum is directly configured into each of
 	 * the transmit scheduler queues. And PF/VF drivers were free to
-	 * config any value upto 2^24.
+	 * config any value up to 2^24.
 	 * On CN10K, HW is modified, the quantum configuration at scheduler
 	 * queues is in terms of weight. And SW needs to setup a base DWRR MTU
 	 * at NIX_AF_DWRR_RPM_MTU / NIX_AF_DWRR_SDP_MTU. HW will do
diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/cn10k.c b/drivers/net/ethernet/marvell/octeontx2/nic/cn10k.c
index 3e1bf22cba69..f98ef5431c90 100644
--- a/drivers/net/ethernet/marvell/octeontx2/nic/cn10k.c
+++ b/drivers/net/ethernet/marvell/octeontx2/nic/cn10k.c
@@ -301,7 +301,7 @@ static void cn10k_get_ingress_rate_cfg(u64 rate, u32 *rate_exp,
 	 * policer timeunit * 2^rdiv ie 2 * 2^rdiv usecs, to the token bucket.
 	 * Here policer timeunit is 2 usecs and rate is in bits per sec.
 	 * Since floating point cannot be used below algorithm uses 1000000
-	 * scale factor to support rates upto 100Gbps.
+	 * scale factor to support rates up to 100Gbps.
 	 */
 	tmp = rate * 32 * 2;
 	if (tmp < 256000000) {
diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_dcbnl.c b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_dcbnl.c
index f110dfa42360..91d346d114af 100644
--- a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_dcbnl.c
+++ b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_dcbnl.c
@@ -67,7 +67,7 @@ static int otx2_pfc_txschq_alloc_one(struct otx2_nic *pfvf, u8 prio)
 	if (!req)
 		return -ENOMEM;
 
-	/* Request one schq per level upto max level as configured
+	/* Request one schq per level up to max level as configured
 	 * link config level. These rest of the scheduler can be
 	 * same as hw.txschq_list.
 	 */
diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c
index c995f2900859..596ab7a4c080 100644
--- a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c
+++ b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c
@@ -3007,7 +3007,7 @@ int otx2_realloc_msix_vectors(struct otx2_nic *pf)
 	int num_vec, err;
 
 	/* NPA interrupts are inot registered, so alloc only
-	 * upto NIX vector offset.
+	 * up to NIX vector offset.
 	 */
 	num_vec = hw->nix_msixoff;
 	num_vec += NIX_LF_CINT_VEC_START + hw->max_queues;
diff --git a/drivers/net/ethernet/marvell/pxa168_eth.c b/drivers/net/ethernet/marvell/pxa168_eth.c
index bbbbbba63e15..2370b2ddba6b 100644
--- a/drivers/net/ethernet/marvell/pxa168_eth.c
+++ b/drivers/net/ethernet/marvell/pxa168_eth.c
@@ -514,7 +514,7 @@ static int add_del_hash_entry(struct pxa168_eth_private *pep,
 /*
  * ----------------------------------------------------------------------------
  *  Create an addressTable entry from MAC address info
- *  found in the specifed net_device struct
+ *  found in the specified net_device struct
  *
  *  Input : pointer to ethernet interface network device structure
  *  Output : N/A
@@ -806,7 +806,7 @@ static int rxq_process(struct net_device *dev, int budget)
 		stats->rx_bytes += rx_desc->byte_cnt;
 		/*
 		 * In case received a packet without first / last bits on OR
-		 * the error summary bit is on, the packets needs to be droped.
+		 * the error summary bit is on, the packets needs to be dropped.
 		 */
 		if (((cmd_sts & (RX_FIRST_DESC | RX_LAST_DESC)) !=
 		     (RX_FIRST_DESC | RX_LAST_DESC))
diff --git a/drivers/net/ethernet/mellanox/mlx4/eq.c b/drivers/net/ethernet/mellanox/mlx4/eq.c
index f1c3da04de7f..034dda0ec06b 100644
--- a/drivers/net/ethernet/mellanox/mlx4/eq.c
+++ b/drivers/net/ethernet/mellanox/mlx4/eq.c
@@ -1553,7 +1553,7 @@ void mlx4_release_eq(struct mlx4_dev *dev, int vec)
 	mutex_lock(&priv->msix_ctl.pool_lock);
 	priv->eq_table.eq[eq_vec].ref_count--;
 
-	/* once we allocated EQ, we don't release it because it might be binded
+	/* once we allocated EQ, we don't release it because it might be bound
 	 * to cpu_rmap.
 	 */
 	mutex_unlock(&priv->msix_ctl.pool_lock);
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en/tc/sample.c b/drivers/net/ethernet/mellanox/mlx5/core/en/tc/sample.c
index 89490f687a9c..402973ca8c1b 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en/tc/sample.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en/tc/sample.c
@@ -353,7 +353,7 @@ add_post_rule(struct mlx5_eswitch *esw, struct mlx5e_sample_flow *sample_flow,
 	/* Allocate default table per vport, chain and prio. Otherwise, there is
 	 * only one default table for the same sampler object. Rules with different
 	 * prio and chain may overlap. For CT sample action, per vport default
-	 * table is needed to resotre the metadata.
+	 * table is needed to restore the metadata.
 	 */
 	per_vport_tbl_attr.chain = attr->chain;
 	per_vport_tbl_attr.prio = attr->prio;
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/lib/tout.c b/drivers/net/ethernet/mellanox/mlx5/core/lib/tout.c
index d9be0d9c9a13..7bcc49e6fd43 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/lib/tout.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/lib/tout.c
@@ -67,7 +67,7 @@ static u64 tout_convert_reg_field_to_ms(u32 to_mul, u32 to_val)
 	u64 msec = to_val;
 
 	to_mul &= 0x3;
-	/* convert hours/minutes/seconds to miliseconds */
+	/* convert hours/minutes/seconds to milliseconds */
 	if (to_mul)
 		msec *= 1000 * int_pow(60, to_mul - 1);
 
diff --git a/drivers/net/ethernet/mellanox/mlxsw/i2c.c b/drivers/net/ethernet/mellanox/mlxsw/i2c.c
index 60a50222f33a..2e2539b24fe7 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/i2c.c
+++ b/drivers/net/ethernet/mellanox/mlxsw/i2c.c
@@ -670,7 +670,7 @@ static int mlxsw_i2c_probe(struct i2c_client *client)
 	 * For this purpose QUERY_FW is to be issued with opcode modifier equal
 	 * 0x01. For such command the output parameter is an immediate value.
 	 * Here QUERY_FW command is invoked for ASIC probing and for getting
-	 * local mailboxes addresses from immedate output parameters.
+	 * local mailboxes addresses from immediate output parameters.
 	 */
 
 	/* Prepare and write out Command Interface Register for transaction */
diff --git a/drivers/net/ethernet/mellanox/mlxsw/reg.h b/drivers/net/ethernet/mellanox/mlxsw/reg.h
index 01fcbd1c8d01..6de4e653cc38 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/reg.h
+++ b/drivers/net/ethernet/mellanox/mlxsw/reg.h
@@ -2709,7 +2709,7 @@ MLXSW_REG_DEFINE(pagt, MLXSW_REG_PAGT_ID, MLXSW_REG_PAGT_LEN);
  * Range 0 .. cap_max_acl_group_size (hard coded to 16 for now)
  * Total number of ACLs in all groups must be lower or equal
  * to cap_max_acl_tot_groups
- * Note: a group which is binded must not be invalidated
+ * Note: a group which is bound must not be invalidated
  * Access: Index
  */
 MLXSW_ITEM32(reg, pagt, size, 0x00, 0, 8);
diff --git a/drivers/net/ethernet/natsemi/sonic.h b/drivers/net/ethernet/natsemi/sonic.h
index a5b803eb8c8a..669501e92545 100644
--- a/drivers/net/ethernet/natsemi/sonic.h
+++ b/drivers/net/ethernet/natsemi/sonic.h
@@ -300,7 +300,7 @@ struct sonic_local {
 	int reg_offset;
 	void *descriptors;
 	/* Crud.  These areas have to be within the same 64K.  Therefore
-       we allocate a desriptors page, and point these to places within it. */
+       we allocate a descriptors page, and point these to places within it. */
 	void *cda;  /* CAM descriptor area */
 	void *tda;  /* Transmit descriptor area */
 	void *rra;  /* Receive resource area */
diff --git a/drivers/net/ethernet/nvidia/forcedeth.c b/drivers/net/ethernet/nvidia/forcedeth.c
index f0218a0eab5c..40130164dad2 100644
--- a/drivers/net/ethernet/nvidia/forcedeth.c
+++ b/drivers/net/ethernet/nvidia/forcedeth.c
@@ -794,7 +794,7 @@ struct fe_priv {
 	void __iomem *base;
 
 	/* rx specific fields.
-	 * Locking: Within irq hander or disable_irq+spin_lock(&np->lock);
+	 * Locking: Within irq handler or disable_irq+spin_lock(&np->lock);
 	 */
 	union ring_type get_rx, put_rx, last_rx;
 	struct nv_skb_map *get_rx_ctx, *put_rx_ctx;
@@ -815,7 +815,7 @@ struct fe_priv {
 	struct nv_txrx_stats __percpu *txrx_stats;
 
 	/* media detection workaround.
-	 * Locking: Within irq hander or disable_irq+spin_lock(&np->lock);
+	 * Locking: Within irq handler or disable_irq+spin_lock(&np->lock);
 	 */
 	int need_linktimer;
 	unsigned long link_timeout;
diff --git a/drivers/net/ethernet/qlogic/netxen/netxen_nic_ctx.c b/drivers/net/ethernet/qlogic/netxen/netxen_nic_ctx.c
index fef4b2b0b1f2..79d6a819bf90 100644
--- a/drivers/net/ethernet/qlogic/netxen/netxen_nic_ctx.c
+++ b/drivers/net/ethernet/qlogic/netxen/netxen_nic_ctx.c
@@ -17,7 +17,7 @@ netxen_poll_rsp(struct netxen_adapter *adapter)
 	int	timeout = 0;
 
 	do {
-		/* give atleast 1ms for firmware to respond */
+		/* give at least 1ms for firmware to respond */
 		msleep(1);
 
 		if (++timeout > NX_OS_CRB_RETRY_COUNT)
diff --git a/drivers/net/ethernet/qlogic/qed/qed_cxt.c b/drivers/net/ethernet/qlogic/qed/qed_cxt.c
index b70262e70baf..89b947f82cf0 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_cxt.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_cxt.c
@@ -561,7 +561,7 @@ int qed_cxt_cfg_ilt_compute(struct qed_hwfn *p_hwfn, u32 *line_count)
 			 *      block in the ILT client. This is later used to
 			 *      configure the CDU segment offset registers and
 			 *      results in an FL command for TIDs of this
-			 *      segement behaves as regular load commands
+			 *      segment behaves as regular load commands
 			 *      (loading TIDs from the working memory).
 			 */
 			line = p_cli->pf_blks[CDUT_SEG_BLK(i)].start_line;
diff --git a/drivers/net/ethernet/qlogic/qed/qed_dev.c b/drivers/net/ethernet/qlogic/qed/qed_dev.c
index dd75c47758e1..95befe4aee5e 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_dev.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_dev.c
@@ -305,7 +305,7 @@ void qed_db_recovery_execute(struct qed_hwfn *p_hwfn)
 	DP_NOTICE(p_hwfn, "Executing doorbell recovery. Counter was %d\n",
 		  p_hwfn->db_recovery_info.db_recovery_counter);
 
-	/* Track amount of times recovery was executed */
+	/* Track number of times recovery was executed */
 	p_hwfn->db_recovery_info.db_recovery_counter++;
 
 	/* Protect the list */
diff --git a/drivers/net/ethernet/qlogic/qed/qed_mcp.h b/drivers/net/ethernet/qlogic/qed/qed_mcp.h
index 9bd0565fe8ab..50699d600b8e 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_mcp.h
+++ b/drivers/net/ethernet/qlogic/qed/qed_mcp.h
@@ -783,7 +783,7 @@ struct qed_mcp_info {
 	u16					mfw_mb_length;
 	u32					mcp_hist;
 
-	/* Capabilties negotiated with the MFW */
+	/* Capabilities negotiated with the MFW */
 	u32					capabilities;
 
 	/* S/N for debug data mailbox commands */
diff --git a/drivers/net/ethernet/qlogic/qlcnic/qlcnic.h b/drivers/net/ethernet/qlogic/qlcnic/qlcnic.h
index d7c8fadb49de..9728d583b891 100644
--- a/drivers/net/ethernet/qlogic/qlcnic/qlcnic.h
+++ b/drivers/net/ethernet/qlogic/qlcnic/qlcnic.h
@@ -909,7 +909,7 @@ struct qlcnic_mac_vlan_list {
 
 #define QLCNIC_LRO_REQUEST_CLEANUP	4
 
-/* Capabilites received */
+/* Capabilities received */
 #define QLCNIC_FW_CAPABILITY_TSO		BIT_1
 #define QLCNIC_FW_CAPABILITY_BDG		BIT_8
 #define QLCNIC_FW_CAPABILITY_FVLANTX		BIT_9
diff --git a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_init.c b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_init.c
index 47cd9ec665ee..ff337a917243 100644
--- a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_init.c
+++ b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_init.c
@@ -1957,9 +1957,9 @@ static void qlcnic_83xx_template_end(struct qlcnic_adapter *p_dev)
 * qlcnic_83xx_exec_template_cmd
 *
 * @p_dev: adapter structure
-* @p_buff: Poiter to instruction template
+* @p_buff: Pointer to instruction template
 *
-* Template provides instructions to stop, restart and initalize firmware.
+* Template provides instructions to stop, restart and initialize firmware.
 * These instructions are abstracted as a series of read, write and
 * poll operations on hardware registers. Register information and operation
 * specifics are not exposed to the driver. Driver reads the template from
diff --git a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_ctx.c b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_ctx.c
index eb827b86ecae..1b94c42d669b 100644
--- a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_ctx.c
+++ b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_ctx.c
@@ -95,7 +95,7 @@ qlcnic_poll_rsp(struct qlcnic_adapter *adapter)
 	int timeout = 0, err = 0;
 
 	do {
-		/* give atleast 1ms for firmware to respond */
+		/* give at least 1ms for firmware to respond */
 		mdelay(1);
 
 		if (++timeout > QLCNIC_OS_CRB_RETRY_COUNT)
diff --git a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c
index ff4f7cd20c79..23ae76ca81db 100644
--- a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c
+++ b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c
@@ -640,7 +640,7 @@ static int qlcnic_max_rings(struct qlcnic_adapter *adapter, u8 ring_cnt,
 
 void qlcnic_set_tx_ring_count(struct qlcnic_adapter *adapter, u8 tx_cnt)
 {
-	/* 83xx adapter does not have max_tx_rings intialized in probe */
+	/* 83xx adapter does not have max_tx_rings initialized in probe */
 	if (adapter->max_tx_rings)
 		adapter->drv_tx_rings = qlcnic_max_rings(adapter, tx_cnt,
 							 QLCNIC_TX_QUEUE);
@@ -650,7 +650,7 @@ void qlcnic_set_tx_ring_count(struct qlcnic_adapter *adapter, u8 tx_cnt)
 
 void qlcnic_set_sds_ring_count(struct qlcnic_adapter *adapter, u8 rx_cnt)
 {
-	/* 83xx adapter does not have max_sds_rings intialized in probe */
+	/* 83xx adapter does not have max_sds_rings initialized in probe */
 	if (adapter->max_sds_rings)
 		adapter->drv_sds_rings = qlcnic_max_rings(adapter, rx_cnt,
 							  QLCNIC_RX_QUEUE);
diff --git a/drivers/net/ethernet/qualcomm/emac/emac-mac.c b/drivers/net/ethernet/qualcomm/emac/emac-mac.c
index d5c688a8d7be..a4bba0be7dc5 100644
--- a/drivers/net/ethernet/qualcomm/emac/emac-mac.c
+++ b/drivers/net/ethernet/qualcomm/emac/emac-mac.c
@@ -578,7 +578,7 @@ void emac_mac_stop(struct emac_adapter *adpt)
 	emac_reg_update32(adpt->base + EMAC_RXQ_CTRL_0, RXQ_EN, 0);
 	emac_reg_update32(adpt->base + EMAC_TXQ_CTRL_0, TXQ_EN, 0);
 	emac_reg_update32(adpt->base + EMAC_MAC_CTRL, TXEN | RXEN, 0);
-	usleep_range(1000, 1050); /* stopping mac may take upto 1msec */
+	usleep_range(1000, 1050); /* stopping mac may take up to 1msec */
 }
 
 /* Free all descriptors of given transmit queue */
diff --git a/drivers/net/ethernet/realtek/8139too.c b/drivers/net/ethernet/realtek/8139too.c
index 8241bcf76664..71eb61246254 100644
--- a/drivers/net/ethernet/realtek/8139too.c
+++ b/drivers/net/ethernet/realtek/8139too.c
@@ -1201,7 +1201,7 @@ static const char mii_2_8139_map[8] = {
 
 
 #ifdef CONFIG_8139TOO_8129
-/* Syncronize the MII management interface by shifting 32 one bits out. */
+/* Synchronize the MII management interface by shifting 32 one bits out. */
 static void mdio_sync (void __iomem *ioaddr)
 {
 	int i;
diff --git a/drivers/net/ethernet/realtek/rtase/rtase_main.c b/drivers/net/ethernet/realtek/rtase/rtase_main.c
index e3cd4f7c1380..372974ebccb5 100644
--- a/drivers/net/ethernet/realtek/rtase/rtase_main.c
+++ b/drivers/net/ethernet/realtek/rtase/rtase_main.c
@@ -937,7 +937,7 @@ static void rtase_hw_config(struct net_device *dev)
 			  RTASE_RX_MX_DMA_MASK);
 	rtase_w16(tp, RTASE_RX_CONFIG_0, reg_data16);
 
-	/* new rx descritpor */
+	/* new rx descriptor */
 	reg_data16 = rtase_r16(tp, RTASE_RX_CONFIG_1);
 	reg_data16 |= RTASE_RX_NEW_DESC_FORMAT_EN | RTASE_PCIE_NEW_FLOW;
 	u16p_replace_bits(&reg_data16, 0xF, RTASE_RX_MAX_FETCH_DESC_MASK);
diff --git a/drivers/net/ethernet/seeq/sgiseeq.c b/drivers/net/ethernet/seeq/sgiseeq.c
index 7967a0ee320b..82dff0a52a12 100644
--- a/drivers/net/ethernet/seeq/sgiseeq.c
+++ b/drivers/net/ethernet/seeq/sgiseeq.c
@@ -619,7 +619,7 @@ sgiseeq_start_xmit(struct sk_buff *skb, struct net_device *dev)
 	 *    we are changing all of the following.
 	 * 2) Do no allow the HPC to look at a new descriptor until
 	 *    we have completely set up it's state.  This means, do
-	 *    not clear HPCDMA_EOX in the current last descritptor
+	 *    not clear HPCDMA_EOX in the current last descriptor
 	 *    until the one we are adding looks consistent and could
 	 *    be processes right now.
 	 * 3) The tx interrupt code must notice when we've added a new
diff --git a/drivers/net/ethernet/sfc/falcon/falcon.c b/drivers/net/ethernet/sfc/falcon/falcon.c
index fb1d19b7c419..10cfce054de9 100644
--- a/drivers/net/ethernet/sfc/falcon/falcon.c
+++ b/drivers/net/ethernet/sfc/falcon/falcon.c
@@ -2638,7 +2638,7 @@ void falcon_start_nic_stats(struct ef4_nic *efx)
 	spin_unlock_bh(&efx->stats_lock);
 }
 
-/* We don't acutally pull stats on falcon. Wait 10ms so that
+/* We don't actually pull stats on falcon. Wait 10ms so that
  * they arrive when we call this just after start_stats
  */
 static void falcon_pull_nic_stats(struct ef4_nic *efx)
diff --git a/drivers/net/ethernet/sfc/mcdi_pcol.h b/drivers/net/ethernet/sfc/mcdi_pcol.h
index b9866e389e6d..b00e7c100566 100644
--- a/drivers/net/ethernet/sfc/mcdi_pcol.h
+++ b/drivers/net/ethernet/sfc/mcdi_pcol.h
@@ -5736,7 +5736,7 @@
 /*            Enum values, see field(s): */
 /*               MC_CMD_ETH_TECH/TECH */
 /* Pause abilities to advertise during auto-negotiation. Valid when auto-
- * negotation is enabled and MC_CMD_SET_MAC_IN/FCTL is set to
+ * negotiation is enabled and MC_CMD_SET_MAC_IN/FCTL is set to
  * MC_CMD_FCNTL_AUTO. If auto-negotiation is disabled the driver must
  * explicitly configure pause mode with MC_CMD_SET_MAC.
  */
@@ -10173,7 +10173,7 @@
  * configuration.
  */
 #define    MC_CMD_GET_FIXED_PORT_PROPERTIES_IN_LEN 4
-/* Handle to the port to from which to retreive properties */
+/* Handle to the port to from which to retrieve properties */
 #define       MC_CMD_GET_FIXED_PORT_PROPERTIES_IN_PORT_HANDLE_OFST 0
 #define       MC_CMD_GET_FIXED_PORT_PROPERTIES_IN_PORT_HANDLE_LEN 4
 
@@ -13547,7 +13547,7 @@
  * an ancestor of the current user (see MC_CMD_SET_VI_USER). Note that LL
  * queues require this to be called after allocation but before initialisation
  * of the queue. TLP options of a queue are fixed after queue is initialised,
- * with the values set to current global value or they can be overriden using
+ * with the values set to current global value or they can be overridden using
  * this command. At LL queue allocation, all overrides are cleared.
  */
 #define MC_CMD_SET_VI_TLP_PROCESSING 0xb1
@@ -21387,7 +21387,7 @@
 #define          MC_CMD_PRIVILEGE_MASK_IN_GRP_ALL_MULTICAST 0x200 /* enum */
 #define          MC_CMD_PRIVILEGE_MASK_IN_GRP_PROMISCUOUS 0x400 /* enum */
 /* enum: Allows to set the TX packets' source MAC address to any arbitrary MAC
- * adress.
+ * address.
  */
 #define          MC_CMD_PRIVILEGE_MASK_IN_GRP_MAC_SPOOFING_TX 0x800
 /* enum: Privilege that allows a Function to change the MAC address configured
diff --git a/drivers/net/ethernet/sfc/siena/mcdi_pcol.h b/drivers/net/ethernet/sfc/siena/mcdi_pcol.h
index b81b0aa460d2..4d1da698c524 100644
--- a/drivers/net/ethernet/sfc/siena/mcdi_pcol.h
+++ b/drivers/net/ethernet/sfc/siena/mcdi_pcol.h
@@ -6861,7 +6861,7 @@
 /***********************************/
 /* MC_CMD_CLP
  * Perform a CLP related operation, see SF-110495-PS for details of CLP
- * processing. This command has been extended to accomodate the requirements of
+ * processing. This command has been extended to accommodate the requirements of
  * different manufacturers which are to be found in SF-119187-TC, SF-119186-TC,
  * SF-120509-TC and SF-117282-PS.
  */
@@ -16293,7 +16293,7 @@
 
 /***********************************/
 /* MC_CMD_GET_LICENSED_V3_FEATURE_STATES
- * Query the state of an one or more licensed features. (Note that the actual
+ * Query the state of a one or more licensed features. (Note that the actual
  * state may be invalidated by the MC_CMD_LICENSING_V3 OP_UPDATE_LICENSE
  * operation or a reboot of the MC.) Used for V3 licensing (Medford)
  */
@@ -16798,7 +16798,7 @@
 #define          MC_CMD_PRIVILEGE_MASK_IN_GRP_ALL_MULTICAST 0x200 /* enum */
 #define          MC_CMD_PRIVILEGE_MASK_IN_GRP_PROMISCUOUS 0x400 /* enum */
 /* enum: Allows to set the TX packets' source MAC address to any arbitrary MAC
- * adress.
+ * address.
  */
 #define          MC_CMD_PRIVILEGE_MASK_IN_GRP_MAC_SPOOFING_TX 0x800
 /* enum: Privilege that allows a Function to change the MAC address configured
diff --git a/drivers/net/ethernet/sfc/siena/ptp.c b/drivers/net/ethernet/sfc/siena/ptp.c
index 0b723a127364..44c9f93d466d 100644
--- a/drivers/net/ethernet/sfc/siena/ptp.c
+++ b/drivers/net/ethernet/sfc/siena/ptp.c
@@ -1835,7 +1835,7 @@ static void ptp_event_failure(struct efx_nic *efx, int expected_frag_len)
 
 /* Process a completed receive event.  Put it on the event queue and
  * start worker thread.  This is required because event and their
- * correspoding packets may come in either order.
+ * corresponding packets may come in either order.
  */
 static void ptp_event_rx(struct efx_nic *efx, struct efx_ptp_data *ptp)
 {
diff --git a/drivers/net/ethernet/sgi/meth.h b/drivers/net/ethernet/sgi/meth.h
index 2ba15c263e8b..973692a3b6ca 100644
--- a/drivers/net/ethernet/sgi/meth.h
+++ b/drivers/net/ethernet/sgi/meth.h
@@ -37,7 +37,7 @@ typedef struct tx_packet_hdr {
 	u64		cat_ptr3_valid:1,	/*Concatination pointer valid flags*/
 			cat_ptr2_valid:1,
 			cat_ptr1_valid:1;
-	u64		tx_int_flag:1;		/*Generate TX intrrupt when packet has been sent*/
+	u64		tx_int_flag:1;		/*Generate TX interrupt when packet has been sent*/
 	u64		term_dma_flag:1;	/*Terminate transmit DMA on transmit abort conditions*/
 	u64		data_offset:7;		/*Starting byte offset in ring data block*/
 	u64		data_len:16;		/*Length of valid data in bytes-1*/
diff --git a/drivers/net/ethernet/silan/sc92031.c b/drivers/net/ethernet/silan/sc92031.c
index ff4197f5e46d..55f473b16d82 100644
--- a/drivers/net/ethernet/silan/sc92031.c
+++ b/drivers/net/ethernet/silan/sc92031.c
@@ -87,7 +87,7 @@ MODULE_PARM_DESC(media, "Media type (0x00 = autodetect,"
 enum  silan_registers {
    Config0    = 0x00,         // Config0
    Config1    = 0x04,         // Config1
-   RxBufWPtr  = 0x08,         // Rx buffer writer poiter
+   RxBufWPtr  = 0x08,         // Rx buffer writer pointer
    IntrStatus = 0x0C,         // Interrupt status
    IntrMask   = 0x10,         // Interrupt mask
    RxbufAddr  = 0x14,         // Rx buffer start address
@@ -109,8 +109,8 @@ enum  silan_registers {
    TimerIntr  = 0x78,         // Timer interrupt register
    PMConfig   = 0x7C,         // Power Manager configuration
    CRC0       = 0x80,         // Power Manager CRC ( Two 32bit regisers)
-   Wakeup0    = 0x88,         // power Manager wakeup( Eight 64bit regiser)
-   LSBCRC0    = 0xC8,         // power Manager LSBCRC(Two 32bit regiser)
+   Wakeup0    = 0x88,         // power Manager wakeup( Eight 64bit register)
+   LSBCRC0    = 0xC8,         // power Manager LSBCRC(Two 32bit register)
    TestD0     = 0xD0,
    TestD4     = 0xD4,
    TestD8     = 0xD8,
diff --git a/drivers/net/ethernet/sis/sis900.c b/drivers/net/ethernet/sis/sis900.c
index 6e9afd9042f7..35e1fe22806f 100644
--- a/drivers/net/ethernet/sis/sis900.c
+++ b/drivers/net/ethernet/sis/sis900.c
@@ -2394,7 +2394,7 @@ static void set_rx_mode(struct net_device *net_dev)
 		for (i = 0; i < table_entries; i++)
 			mc_filter[i] = 0xffff;
 	} else {
-		/* Accept Broadcast packet, destination address matchs our
+		/* Accept Broadcast packet, destination address matches our
 		 * MAC address, use Receive Filter to reject unwanted MCAST
 		 * packets */
 		struct netdev_hw_addr *ha;
diff --git a/drivers/net/ethernet/smsc/smsc9420.c b/drivers/net/ethernet/smsc/smsc9420.c
index 0c97211b6254..020ff5cd5690 100644
--- a/drivers/net/ethernet/smsc/smsc9420.c
+++ b/drivers/net/ethernet/smsc/smsc9420.c
@@ -563,7 +563,7 @@ static void smsc9420_stop_rx(struct smsc9420_pdata *pd)
 	smsc9420_reg_write(pd, DMAC_INTR_ENA, dma_intr_ena);
 	smsc9420_pci_flush_write(pd);
 
-	/* stop RX MAC prior to stoping DMA */
+	/* stop RX MAC prior to stopping DMA */
 	mac_cr = smsc9420_reg_read(pd, MAC_CR) & (~MAC_CR_RXEN_);
 	smsc9420_reg_write(pd, MAC_CR, mac_cr);
 	smsc9420_pci_flush_write(pd);
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index f5f9fa67ecd7..cdfdd9806e14 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -1312,7 +1312,7 @@ static int intel_eth_pci_probe(struct pci_dev *pdev,
 
 	/* Initialize all MSI vectors to invalid so that it can be set
 	 * according to platform data settings below.
-	 * Note: MSI vector takes value from 0 upto 31 (STMMAC_MSI_VEC_MAX)
+	 * Note: MSI vector takes value from 0 up to 31 (STMMAC_MSI_VEC_MAX)
 	 */
 	plat->msi_mac_vec = STMMAC_MSI_VEC_MAX;
 	plat->msi_wol_vec = STMMAC_MSI_VEC_MAX;
diff --git a/drivers/net/ethernet/sun/cassini.h b/drivers/net/ethernet/sun/cassini.h
index 0c24547a4534..e5bfdd0b7a02 100644
--- a/drivers/net/ethernet/sun/cassini.h
+++ b/drivers/net/ethernet/sun/cassini.h
@@ -704,7 +704,7 @@
 							 0x4 = load 3, 0x5 = load 4
 							 0x6 = last detect
 							 0x7 = wait req
-							 0x8 = wait req statuss 1st
+							 0x8 = wait req status 1st
 							 0x9 = load st
 							 0xa = bubble mac
 							 0xb = error */
diff --git a/drivers/net/ethernet/synopsys/dwc-xlgmac-common.c b/drivers/net/ethernet/synopsys/dwc-xlgmac-common.c
index 131786aa4d5b..f532e8b6d24f 100644
--- a/drivers/net/ethernet/synopsys/dwc-xlgmac-common.c
+++ b/drivers/net/ethernet/synopsys/dwc-xlgmac-common.c
@@ -98,7 +98,7 @@ static int xlgmac_init(struct xlgmac_pdata *pdata)
 		return ret;
 	}
 
-	/* Channel and ring params initializtion
+	/* Channel and ring params initialization
 	 *  pdata->channel_count;
 	 *  pdata->tx_ring_count;
 	 *  pdata->rx_ring_count;
diff --git a/drivers/net/ethernet/synopsys/dwc-xlgmac-hw.c b/drivers/net/ethernet/synopsys/dwc-xlgmac-hw.c
index 76eb7db80f13..1fef9f4b15c0 100644
--- a/drivers/net/ethernet/synopsys/dwc-xlgmac-hw.c
+++ b/drivers/net/ethernet/synopsys/dwc-xlgmac-hw.c
@@ -1060,7 +1060,7 @@ static void xlgmac_tx_desc_init(struct xlgmac_channel *channel)
 	int start_index = ring->cur;
 	int i;
 
-	/* Initialze all descriptors */
+	/* Initialize all descriptors */
 	for (i = 0; i < ring->dma_desc_count; i++) {
 		desc_data = XLGMAC_GET_DESC_DATA(ring, i);
 
diff --git a/drivers/net/ethernet/tehuti/tehuti.c b/drivers/net/ethernet/tehuti/tehuti.c
index 2cee1f05ac47..6c5bc4479046 100644
--- a/drivers/net/ethernet/tehuti/tehuti.c
+++ b/drivers/net/ethernet/tehuti/tehuti.c
@@ -313,7 +313,7 @@ static int bdx_poll(struct napi_struct *napi, int budget)
  * @priv: NIC private structure
  *
  * Firmware is loaded via TXD fifo, so it must be initialized first.
- * Firware must be loaded once per NIC not per PCI device provided by NIC (NIC
+ * Firmware must be loaded once per NIC not per PCI device provided by NIC (NIC
  * can have few of them). So all drivers use semaphore register to choose one
  * that will actually load FW to NIC.
  */
@@ -1184,7 +1184,7 @@ static void bdx_recycle_skb(struct bdx_priv *priv, struct rxd_desc *rxdd)
  * @budget: maximum number of packets to receive
  */
 
-/* TBD: replace memcpy func call by explicite inline asm */
+/* TBD: replace memcpy func call by explicit inline asm */
 
 static int bdx_rx_receive(struct bdx_priv *priv, struct rxd_fifo *f, int budget)
 {
@@ -1324,13 +1324,13 @@ static void print_rxfd(struct rxf_desc *rxfd)
  * 1) TX Free Fifo - TXF - holds ack descriptors for sent packets
  * 2) TX Data Fifo - TXD - holds descriptors of full buffers.
  *
- * Currently NIC supports TSO, checksuming and gather DMA
+ * Currently NIC supports TSO, checksumming and gather DMA
  * UFO and IP fragmentation is on the way
  *
  * RX SW Data Structures
  * ~~~~~~~~~~~~~~~~~~~~~
  * txdb - used to keep track of all skbs owned by SW and their dma addresses.
- * For TX case, ownership lasts from geting packet via hard_xmit and until HW
+ * For TX case, ownership lasts from getting packet via hard_xmit and until HW
  * acknowledges sent by TXF descriptors.
  * Implemented as cyclic buffer.
  * fifo - keeps info about fifo's size and location, relevant HW registers,
diff --git a/drivers/net/ethernet/ti/tlan.c b/drivers/net/ethernet/ti/tlan.c
index 274a1837025c..e5f563762eb6 100644
--- a/drivers/net/ethernet/ti/tlan.c
+++ b/drivers/net/ethernet/ti/tlan.c
@@ -1299,7 +1299,7 @@ static void tlan_set_multicast_list(struct net_device *dev)
 ThunderLAN driver interrupt vectors and table
 
 please see chap. 4, "Interrupt Handling" of the "ThunderLAN
-Programmer's Guide" for more informations on handling interrupts
+Programmer's Guide" for more information on handling interrupts
 generated by TLAN based adapters.
 
 ******************************************************************************
diff --git a/drivers/net/ethernet/toshiba/ps3_gelic_net.c b/drivers/net/ethernet/toshiba/ps3_gelic_net.c
index d35d1f3c10a1..ef4632e2adc8 100644
--- a/drivers/net/ethernet/toshiba/ps3_gelic_net.c
+++ b/drivers/net/ethernet/toshiba/ps3_gelic_net.c
@@ -1412,7 +1412,7 @@ static const struct ethtool_ops gelic_ether_ethtool_ops = {
 /**
  * gelic_net_tx_timeout_task - task scheduled by the watchdog timeout
  * function (to be called not under interrupt status)
- * @work: work is context of tx timout task
+ * @work: work is context of tx timeout task
  *
  * called as task when tx hangs, resets interface (if interface is up)
  */
diff --git a/drivers/net/ethernet/toshiba/ps3_gelic_net.h b/drivers/net/ethernet/toshiba/ps3_gelic_net.h
index c10f1984a5a1..034b1712aca8 100644
--- a/drivers/net/ethernet/toshiba/ps3_gelic_net.h
+++ b/drivers/net/ethernet/toshiba/ps3_gelic_net.h
@@ -93,7 +93,7 @@ enum gelic_descr_tx_status {
 /* RX descriptor data error bits */
 enum gelic_descr_rx_error {
 	/* bit 31 reserved */
-	GELIC_DESCR_RXALNERR	= 0x40000000, /* alignement error 10/100M */
+	GELIC_DESCR_RXALNERR	= 0x40000000, /* alignment error 10/100M */
 	GELIC_DESCR_RXOVERERR	= 0x20000000, /* oversize error */
 	GELIC_DESCR_RXRNTERR	= 0x10000000, /* Runt error */
 	GELIC_DESCR_RXIPCHKERR	= 0x08000000, /* IP checksum  error */
diff --git a/drivers/net/ethernet/toshiba/ps3_gelic_wireless.c b/drivers/net/ethernet/toshiba/ps3_gelic_wireless.c
index 88669aa53f65..6df4697025fa 100644
--- a/drivers/net/ethernet/toshiba/ps3_gelic_wireless.c
+++ b/drivers/net/ethernet/toshiba/ps3_gelic_wireless.c
@@ -556,7 +556,7 @@ static void gelic_wl_parse_ie(u8 *data, size_t len,
 
 
 /*
- * translate the scan informations from hypervisor to a
+ * translate the scan information from hypervisor to a
  * independent format
  */
 static char *gelic_wl_translate_scan(struct net_device *netdev,
diff --git a/drivers/net/ethernet/via/via-rhine.c b/drivers/net/ethernet/via/via-rhine.c
index e56ebbdd428d..69ab8c450a1d 100644
--- a/drivers/net/ethernet/via/via-rhine.c
+++ b/drivers/net/ethernet/via/via-rhine.c
@@ -225,7 +225,7 @@ The chip does not pad to minimum transmit length.
 
 /* This table drives the PCI probe routines. It's mostly boilerplate in all
    of the drivers, and will likely be provided by some future kernel.
-   Note the matching code -- the first table entry matchs all 56** cards but
+   Note the matching code -- the first table entry matches all 56** cards but
    second only the 1234 card.
 */
 
diff --git a/drivers/net/ethernet/via/via-velocity.c b/drivers/net/ethernet/via/via-velocity.c
index 6d7b6f3b4633..f9e25cf3cd0d 100644
--- a/drivers/net/ethernet/via/via-velocity.c
+++ b/drivers/net/ethernet/via/via-velocity.c
@@ -302,7 +302,7 @@ VELOCITY_PARAM(DMA_length, "DMA length");
    0: indicate the IP header won't be DWORD byte aligned.(Default) .
    1: indicate the IP header will be DWORD byte aligned.
       In some environment, the IP header should be DWORD byte aligned,
-      or the packet will be droped when we receive it. (eg: IPVS)
+      or the packet will be dropped when we receive it. (eg: IPVS)
 */
 VELOCITY_PARAM(IP_byte_align, "Enable IP header dword aligned");
 
@@ -311,7 +311,7 @@ VELOCITY_PARAM(IP_byte_align, "Enable IP header dword aligned");
 #define FLOW_CNTL_MAX   5
 
 /* flow_control[] is used for setting the flow control ability of NIC.
-   1: hardware deafult - AUTO (default). Use Hardware default value in ANAR.
+   1: hardware default - AUTO (default). Use Hardware default value in ANAR.
    2: enable TX flow control.
    3: enable RX flow control.
    4: enable RX/TX flow control.
@@ -340,10 +340,10 @@ VELOCITY_PARAM(speed_duplex, "Setting the speed and duplex mode");
 #define WOL_OPT_MIN     0
 #define WOL_OPT_MAX     7
 /* wol_opts[] is used for controlling wake on lan behavior.
-   0: Wake up if recevied a magic packet. (Default)
+   0: Wake up if received a magic packet. (Default)
    1: Wake up if link status is on/off.
-   2: Wake up if recevied an arp packet.
-   4: Wake up if recevied any unicast packet.
+   2: Wake up if received an arp packet.
+   4: Wake up if received any unicast packet.
    Those value can be sumed up to support more than one option.
 */
 VELOCITY_PARAM(wol_opts, "Wake On Lan options");
diff --git a/drivers/net/fddi/skfp/cfm.c b/drivers/net/fddi/skfp/cfm.c
index 4eea3408034b..b722a195d831 100644
--- a/drivers/net/fddi/skfp/cfm.c
+++ b/drivers/net/fddi/skfp/cfm.c
@@ -17,7 +17,7 @@
 */
 
 /*
- *	Hardware independent state machine implemantation
+ *	Hardware independent state machine implementation
  *	The following external SMT functions are referenced :
  *
  *		queue_event()
diff --git a/drivers/net/fddi/skfp/ecm.c b/drivers/net/fddi/skfp/ecm.c
index 2f5f5f26bb43..e418ab65cb61 100644
--- a/drivers/net/fddi/skfp/ecm.c
+++ b/drivers/net/fddi/skfp/ecm.c
@@ -17,7 +17,7 @@
 */
 
 /*
- * Hardware independent state machine implemantation
+ * Hardware independent state machine implementation
  * The following external SMT functions are referenced :
  *
  * 		queue_event()
diff --git a/drivers/net/fddi/skfp/fplustm.c b/drivers/net/fddi/skfp/fplustm.c
index 036062376c06..0d4201345f9b 100644
--- a/drivers/net/fddi/skfp/fplustm.c
+++ b/drivers/net/fddi/skfp/fplustm.c
@@ -150,7 +150,7 @@ static u_long read_mdr(struct s_smc *smc, unsigned int addr)
 	CHECK_NPP() ;
 	MARR(addr) ;
 	outpw(FM_A(FM_CMDREG1),FM_IRMEMWO) ;
-	CHECK_NPP() ;	/* needed for PCI to prevent from timeing violations */
+	CHECK_NPP() ;	/* needed for PCI to prevent from timing violations */
 /*	p = MDRR() ; */	/* bad read values if the workaround */
 			/* smc->hw.mc_dummy = *((short volatile far *)(addr)))*/
 			/* is used */
@@ -572,7 +572,7 @@ Note	After any ring operational change the transmit complete
 	The operating system dependent module must enable
 	the transmit complete interrupt of a queue,
 		- when it queues the first frame,
-		  because of no transmit resources are beeing
+		  because of no transmit resources are being
 		  available and
 		- when it escapes from the function llc_restart_tx
 		  while some frames are still queued.
diff --git a/drivers/net/fddi/skfp/h/hwmtm.h b/drivers/net/fddi/skfp/h/hwmtm.h
index e97db826cdd4..0ab49cc0a8bd 100644
--- a/drivers/net/fddi/skfp/h/hwmtm.h
+++ b/drivers/net/fddi/skfp/h/hwmtm.h
@@ -113,7 +113,7 @@ struct hw_modul {
 	struct	s_mbuf_pool	mbuf_pool ;
 	struct	hwm_r	r ;
 
-	union s_fp_descr volatile *descr_p ; /* points to the desriptor area */
+	union s_fp_descr volatile *descr_p ; /* points to the descriptor area */
 
 	u_short pass_SMT ;		/* pass SMT frames */
 	u_short pass_NSA ;		/* pass all NSA frames */
diff --git a/drivers/net/fddi/skfp/h/sba.h b/drivers/net/fddi/skfp/h/sba.h
index f30301fcd022..7fe99c12e201 100644
--- a/drivers/net/fddi/skfp/h/sba.h
+++ b/drivers/net/fddi/skfp/h/sba.h
@@ -94,7 +94,7 @@ struct s_sba {
 	long		msg_mib_ov ;		/* Current Overhead for this Path*/
 	long		msg_category ;		/* Category of the Allocation */
 	u_long		msg_max_t_neg ;		/* longest T_Neg acceptable */
-	u_long		msg_min_seg_siz ;	/* minimum segement size */
+	u_long		msg_min_seg_siz ;	/* minimum segment size */
 	struct smt_header	*sm ;		/* points to the rec message */
 	struct fddi_addr	*msg_alloc_addr ;	/* Allocation Address */
 
diff --git a/drivers/net/fddi/skfp/pcmplc.c b/drivers/net/fddi/skfp/pcmplc.c
index 90e8df6d9a88..745285d4d6d2 100644
--- a/drivers/net/fddi/skfp/pcmplc.c
+++ b/drivers/net/fddi/skfp/pcmplc.c
@@ -16,7 +16,7 @@
 */
 
 /*
- * Hardware independent state machine implemantation
+ * Hardware independent state machine implementation
  * The following external SMT functions are referenced :
  *
  * 		queue_event()
diff --git a/drivers/net/fddi/skfp/rmt.c b/drivers/net/fddi/skfp/rmt.c
index 314623650a84..5708124f05d2 100644
--- a/drivers/net/fddi/skfp/rmt.c
+++ b/drivers/net/fddi/skfp/rmt.c
@@ -16,7 +16,7 @@
 */
 
 /*
- * Hardware independent state machine implemantation
+ * Hardware independent state machine implementation
  * The following external SMT functions are referenced :
  *
  * 		queue_event()
diff --git a/drivers/net/ipa/ipa_interrupt.h b/drivers/net/ipa/ipa_interrupt.h
index d11c4af14fa2..362fb9eb7900 100644
--- a/drivers/net/ipa/ipa_interrupt.h
+++ b/drivers/net/ipa/ipa_interrupt.h
@@ -21,7 +21,7 @@ enum ipa_irq_id;
  * @endpoint_id:	Endpoint whose interrupt should be enabled
  *
  * Note:  The "TX" in the name is from the perspective of the IPA hardware.
- * A TX_SUSPEND interrupt arrives on an AP RX enpoint when packet data can't
+ * A TX_SUSPEND interrupt arrives on an AP RX endpoint when packet data can't
  * be delivered to the endpoint because it is suspended (or its underlying
  * channel is stopped).
  */
diff --git a/drivers/net/phy/bcm87xx.c b/drivers/net/phy/bcm87xx.c
index 299f9a8f30f4..5c39fc3a5d65 100644
--- a/drivers/net/phy/bcm87xx.c
+++ b/drivers/net/phy/bcm87xx.c
@@ -28,7 +28,7 @@
  * devid: which sub-device to use.
  * reg: the register.
  * mask: if non-zero, ANDed with existing register value.
- * value: ORed with the masked value and written to the regiser.
+ * value: ORed with the masked value and written to the register.
  *
  */
 static int bcm87xx_of_reg_init(struct phy_device *phydev)
diff --git a/drivers/net/phy/marvell.c b/drivers/net/phy/marvell.c
index f71cffa88406..fc67331a8f2c 100644
--- a/drivers/net/phy/marvell.c
+++ b/drivers/net/phy/marvell.c
@@ -526,7 +526,7 @@ static int m88e1101_config_aneg(struct phy_device *phydev)
  * reg-page: which register bank to use.
  * reg: the register.
  * mask: if non-zero, ANDed with existing register value.
- * value: ORed with the masked value and written to the regiser.
+ * value: ORed with the masked value and written to the register.
  *
  */
 static int marvell_of_reg_init(struct phy_device *phydev)
diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index 1a610a18893b..d157398da060 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -2091,7 +2091,7 @@ static int ppp_mp_explode(struct ppp *ppp, struct sk_buff *skb)
 
 		/*
 		 *check if we are on the last channel or
-		 *we exceded the length of the data to
+		 *we exceeded the length of the data to
 		 *fragment
 		 */
 		if ((nfree <= 0) || (flen > len))
@@ -3305,7 +3305,7 @@ find_compressor(int type)
 }
 
 /*
- * Miscelleneous stuff.
+ * Miscellaneous stuff.
  */
 
 static void
diff --git a/drivers/net/usb/ax88179_178a.c b/drivers/net/usb/ax88179_178a.c
index 81d8412ce8e2..4ef641644cf8 100644
--- a/drivers/net/usb/ax88179_178a.c
+++ b/drivers/net/usb/ax88179_178a.c
@@ -1392,8 +1392,8 @@ static int ax88179_rx_fixup(struct usbnet *dev, struct sk_buff *skb)
 	 *		pkt_cnt and hdr_off (offset of
 	 *		  <per-packet metadata entry 1>)
 	 *
-	 * pkt_cnt is number of entrys in the per-packet metadata.
-	 * In current firmware there is 2 entrys per packet.
+	 * pkt_cnt is number of entries in the per-packet metadata.
+	 * In current firmware there is 2 entries per packet.
 	 * The first points to the packet and the
 	 *  second is a dummy header.
 	 * This was done probably to align fields in 64-bit and
diff --git a/drivers/net/wan/slic_ds26522.c b/drivers/net/wan/slic_ds26522.c
index cbb99fc5ea9f..353e44e3113f 100644
--- a/drivers/net/wan/slic_ds26522.c
+++ b/drivers/net/wan/slic_ds26522.c
@@ -165,7 +165,7 @@ static int slic_ds26522_init_configure(struct spi_device *spi)
 	/* Perform RX/TX SRESET,Reset receiver */
 	slic_write(spi, DS26522_RMMR_ADDR, DS26522_RMMR_SFTRST);
 
-	/* Reset tranceiver */
+	/* Reset transceiver */
 	slic_write(spi, DS26522_TMMR_ADDR, DS26522_TMMR_SFTRST);
 
 	usleep_range(100, 120);
diff --git a/drivers/s390/net/ctcm_main.c b/drivers/s390/net/ctcm_main.c
index 8b0d76a47d9f..d1305f8d07f5 100644
--- a/drivers/s390/net/ctcm_main.c
+++ b/drivers/s390/net/ctcm_main.c
@@ -497,7 +497,7 @@ static int ctcm_transmit_skb(struct channel *ch, struct sk_buff *skb)
 	}
 	spin_unlock_irqrestore(&ch->collect_lock, saveflags);
 	/*
-	 * Protect skb against beeing free'd by upper
+	 * Protect skb against being free'd by upper
 	 * layers.
 	 */
 	refcount_inc(&skb->users);
@@ -688,7 +688,7 @@ static int ctcmpc_transmit_skb(struct channel *ch, struct sk_buff *skb)
 	}
 
 	/*
-	 * Protect skb against beeing free'd by upper
+	 * Protect skb against being free'd by upper
 	 * layers.
 	 */
 	refcount_inc(&skb->users);
diff --git a/drivers/s390/net/qeth_core.h b/drivers/s390/net/qeth_core.h
index 41fe8a043d61..b5fa1726617f 100644
--- a/drivers/s390/net/qeth_core.h
+++ b/drivers/s390/net/qeth_core.h
@@ -208,7 +208,7 @@ struct qeth_vnicc_info {
 /*not used unless the microcode gets patched*/
 #define QETH_PCI_TIMER_VALUE(card) 3
 
-/* priority queing */
+/* priority queuing */
 #define QETH_PRIOQ_DEFAULT QETH_NO_PRIO_QUEUEING
 #define QETH_DEFAULT_QUEUE    2
 #define QETH_NO_PRIO_QUEUEING 0
diff --git a/include/net/inet_hashtables.h b/include/net/inet_hashtables.h
index 6e2fe186d0dc..69891edcaf96 100644
--- a/include/net/inet_hashtables.h
+++ b/include/net/inet_hashtables.h
@@ -282,7 +282,7 @@ struct inet_bind_hashbucket *
 inet_bhash2_addr_any_hashbucket(const struct sock *sk, const struct net *net, int port);
 
 /* This should be called whenever a socket's sk_rcv_saddr (ipv4) or
- * sk_v6_rcv_saddr (ipv6) changes after it has been binded. The socket's
+ * sk_v6_rcv_saddr (ipv6) changes after it has been bound. The socket's
  * rcv_saddr field should already have been updated when this is called.
  */
 int inet_bhash2_update_saddr(struct sock *sk, void *saddr, int family);
diff --git a/include/net/sock.h b/include/net/sock.h
index 51185222aac2..20ee599d293e 100644
--- a/include/net/sock.h
+++ b/include/net/sock.h
@@ -2034,7 +2034,7 @@ static inline int sk_receive_skb(struct sock *sk, struct sk_buff *skb,
 
 static inline void sk_tx_queue_set(struct sock *sk, int tx_queue)
 {
-	/* sk_tx_queue_mapping accept only upto a 16-bit value */
+	/* sk_tx_queue_mapping accept only up to a 16-bit value */
 	if (WARN_ON_ONCE((unsigned short)tx_queue >= USHRT_MAX))
 		return;
 	/* Paired with READ_ONCE() in sk_tx_queue_get() and
diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index 1c867a302444..543ee76dfc47 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -1640,7 +1640,7 @@ struct sk_buff *tcp_recv_skb(struct sock *sk, u32 seq, u32 *off)
 			return skb;
 		}
 		/* This looks weird, but this can happen if TCP collapsing
-		 * splitted a fat GRO packet, while we released socket lock
+		 * split a fat GRO packet, while we released socket lock
 		 * in skb_splice_bits()
 		 */
 		tcp_eat_recv_skb(sk, skb);
diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index 0f60a1dbf927..e1e0d71b2345 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -5131,7 +5131,7 @@ void tcp_sack_compress_send_ack(struct sock *sk)
 		__sock_put(sk);
 
 	/* Since we have to send one ack finally,
-	 * substract one from tp->compressed_ack to keep
+	 * subtract one from tp->compressed_ack to keep
 	 * LINUX_MIB_TCPACKCOMPRESSED accurate.
 	 */
 	NET_ADD_STATS(sock_net(sk), LINUX_MIB_TCPACKCOMPRESSED,
diff --git a/net/ipv4/tcp_output.c b/net/ipv4/tcp_output.c
index d960e3de7d50..1079862e5b4a 100644
--- a/net/ipv4/tcp_output.c
+++ b/net/ipv4/tcp_output.c
@@ -2716,7 +2716,7 @@ static int tcp_mtu_probe(struct sock *sk)
 	interval = icsk->icsk_mtup.search_high - icsk->icsk_mtup.search_low;
 	/* When misfortune happens, we are reprobing actively,
 	 * and then reprobe timer has expired. We stick with current
-	 * probing process by not resetting search range to its orignal.
+	 * probing process by not resetting search range to its original.
 	 */
 	if (probe_size > tcp_mtu_to_mss(sk, icsk->icsk_mtup.search_high) ||
 	    interval < READ_ONCE(net->ipv4.sysctl_tcp_probe_threshold)) {
diff --git a/net/ipv6/calipso.c b/net/ipv6/calipso.c
index c6a34334e657..9c9817b7a4cb 100644
--- a/net/ipv6/calipso.c
+++ b/net/ipv6/calipso.c
@@ -43,7 +43,7 @@
 #define CALIPSO_HDR_LEN (2 + 8)
 
 /* Maximum size of the calipso option including
- * the two-byte TLV header and upto 3 bytes of
+ * the two-byte TLV header and up to 3 bytes of
  * leading pad and 7 bytes of trailing pad.
  */
 #define CALIPSO_OPT_LEN_MAX_WITH_PAD (3 + CALIPSO_OPT_LEN_MAX + 7)
@@ -712,7 +712,7 @@ static int calipso_pad_write(unsigned char *buf, unsigned int offset,
  *
  * Description:
  * Generate a CALIPSO option using the DOI definition and security attributes
- * passed to the function. This also generates upto three bytes of leading
+ * passed to the function. This also generates up to three bytes of leading
  * padding that ensures that the option is 4n + 2 aligned.  It returns the
  * number of bytes written (including any initial padding).
  */
diff --git a/net/llc/llc_c_ac.c b/net/llc/llc_c_ac.c
index 724ecd741d4c..342902a73d1c 100644
--- a/net/llc/llc_c_ac.c
+++ b/net/llc/llc_c_ac.c
@@ -1392,7 +1392,7 @@ int llc_conn_disc(struct sock *sk, struct sk_buff *skb)
 
 /**
  *	llc_conn_reset - resets connection
- *	@sk : reseting connection.
+ *	@sk : resetting connection.
  *	@skb: occurred event.
  *
  *	Stop all timers, empty all queues and reset all flags.
diff --git a/net/netlink/af_netlink.c b/net/netlink/af_netlink.c
index e6b1d9758c9c..4f2be126b2f1 100644
--- a/net/netlink/af_netlink.c
+++ b/net/netlink/af_netlink.c
@@ -2317,7 +2317,7 @@ static int netlink_dump(struct sock *sk, bool lock_taken)
 	 */
 	skb_reserve(skb, skb_tailroom(skb) - alloc_size);
 
-	/* Make sure malicious BPF programs can not read unitialized memory
+	/* Make sure malicious BPF programs can not read uninitialized memory
 	 * from skb->head -> skb->data
 	 */
 	skb_reset_network_header(skb);
diff --git a/net/sctp/protocol.c b/net/sctp/protocol.c
index 27c26e12f95d..25aa63bac2c3 100644
--- a/net/sctp/protocol.c
+++ b/net/sctp/protocol.c
@@ -411,7 +411,7 @@ static enum sctp_scope sctp_v4_scope(union sctp_addr *addr)
 }
 
 /* Returns a valid dst cache entry for the given source and destination ip
- * addresses. If an association is passed, trys to get a dst entry with a
+ * addresses. If an association is passed, tries to get a dst entry with a
  * source address that matches an address in the bind address list.
  */
 static void sctp_v4_get_dst(struct sctp_transport *t, union sctp_addr *saddr,
@@ -1564,7 +1564,7 @@ static __init int sctp_init(void)
 	}
 
 	/* Allocate and initialize the SCTP port hash table.
-	 * Note that order is initalized to start at the max sized
+	 * Note that order is initialized to start at the max sized
 	 * table we want to support.  If we can't get that many pages
 	 * reduce the order and try again
 	 */
diff --git a/net/sctp/sm_make_chunk.c b/net/sctp/sm_make_chunk.c
index 84a4c97d0f75..3dd387e10c45 100644
--- a/net/sctp/sm_make_chunk.c
+++ b/net/sctp/sm_make_chunk.c
@@ -2215,7 +2215,7 @@ static enum sctp_ierror sctp_verify_param(struct net *net,
 		if (!ep->auth_enable)
 			goto unhandled;
 
-		/* SCTP-AUTH: Secion 6.1
+		/* SCTP-AUTH: Section 6.1
 		 * If the random number is not 32 byte long the association
 		 * MUST be aborted.  The ABORT chunk SHOULD contain the error
 		 * cause 'Protocol Violation'.
@@ -2306,7 +2306,7 @@ int sctp_verify_init(struct net *net, const struct sctp_endpoint *ep,
 	}
 
 	/* There is a possibility that a parameter length was bad and
-	 * in that case we would have stoped walking the parameters.
+	 * in that case we would have stopped walking the parameters.
 	 * The current param.p would point at the bad one.
 	 * Current consensus on the mailing list is to generate a PROTOCOL
 	 * VIOLATION error.  We build the ERROR chunk here and let the normal
diff --git a/net/sctp/sm_sideeffect.c b/net/sctp/sm_sideeffect.c
index 0d99b7e8c082..b842dc543d63 100644
--- a/net/sctp/sm_sideeffect.c
+++ b/net/sctp/sm_sideeffect.c
@@ -566,7 +566,7 @@ static void sctp_do_8_2_transport_strike(struct sctp_cmd_seq *commands,
 	 * If the timer was a heartbeat, we only increment error counts
 	 * when we already have an outstanding HEARTBEAT that has not
 	 * been acknowledged.
-	 * Additionally, some tranport states inhibit error increments.
+	 * Additionally, some transport states inhibit error increments.
 	 */
 	if (!is_hb) {
 		asoc->overall_error_count++;
diff --git a/net/sctp/transport.c b/net/sctp/transport.c
index 6ea55b9fbde4..c44e033f6ffb 100644
--- a/net/sctp/transport.c
+++ b/net/sctp/transport.c
@@ -723,7 +723,7 @@ void sctp_transport_lower_cwnd(struct sctp_transport *transport,
 		 * transport address, the cwnd of the transport address
 		 * should be adjusted to max(cwnd/2, 4*MTU) per RTO.
 		 * NOTE: Although the draft recommends that this check needs
-		 * to be done every RTO interval, we do it every hearbeat
+		 * to be done every RTO interval, we do it every heartbeat
 		 * interval.
 		 */
 		transport->cwnd = max(transport->cwnd/2,
diff --git a/net/sctp/ulpqueue.c b/net/sctp/ulpqueue.c
index b05daafd369a..15bf4fc34c82 100644
--- a/net/sctp/ulpqueue.c
+++ b/net/sctp/ulpqueue.c
@@ -933,7 +933,7 @@ static void sctp_ulpq_reap_ordered(struct sctp_ulpq *ulpq, __u16 sid)
 }
 
 /* Skip over an SSN. This is used during the processing of
- * Forwared TSN chunk to skip over the abandoned ordered data
+ * Forwarded TSN chunk to skip over the abandoned ordered data
  */
 void sctp_ulpq_skip(struct sctp_ulpq *ulpq, __u16 sid, __u16 ssn)
 {
diff --git a/samples/pktgen/README.rst b/samples/pktgen/README.rst
index f4adeed5f5f0..54e8b68d910c 100644
--- a/samples/pktgen/README.rst
+++ b/samples/pktgen/README.rst
@@ -12,7 +12,7 @@ by shell source'ing.  Namely "functions.sh" and "parameters.sh".
 
 Common parameters
 -----------------
-The parameters.sh file support easy and consistant parameter parsing
+The parameters.sh file support easy and consistent parameter parsing
 across the sample scripts.  Usage example is printed on errors::
 
  Usage: ./pktgen_sample01_simple.sh [-vx] -i ethX
diff --git a/tools/testing/selftests/drivers/net/team/options.sh b/tools/testing/selftests/drivers/net/team/options.sh
index 66c0cb896dad..fdfe2a2cfe10 100755
--- a/tools/testing/selftests/drivers/net/team/options.sh
+++ b/tools/testing/selftests/drivers/net/team/options.sh
@@ -139,7 +139,7 @@ team_test_option()
         log_test "Set + Get '${option_name}' test"
 }
 
-# Test that getting a non-existant option fails.
+# Test that getting a non-existent option fails.
 # Globals:
 #   RET - Used by testing infra like `check_err`.
 #   EXIT_STATUS - Used by `log_test` for whole script exit value.
diff --git a/tools/testing/selftests/net/arp_ndisc_untracked_subnets.sh b/tools/testing/selftests/net/arp_ndisc_untracked_subnets.sh
index eef5cbf6eecc..042c3a1f954c 100755
--- a/tools/testing/selftests/net/arp_ndisc_untracked_subnets.sh
+++ b/tools/testing/selftests/net/arp_ndisc_untracked_subnets.sh
@@ -37,7 +37,7 @@ setup() {
 
 	# Set up interfaces veth0 and veth1, which are pairs in separate
 	# namespaces. veth0 is veth-router, veth1 is veth-host.
-	# first, set up the inteface's link to the namespace
+	# first, set up the interface's link to the namespace
 	# then, set the interface "up"
 	ip netns exec ${ROUTER_NS} ip link add name ${ROUTER_INTF} \
 		type veth peer name ${HOST_INTF}
@@ -71,7 +71,7 @@ setup_v6() {
 
 	# Set up interfaces veth0 and veth1, which are pairs in separate
 	# namespaces. veth0 is veth-router, veth1 is veth-host.
-	# first, set up the inteface's link to the namespace
+	# first, set up the interface's link to the namespace
 	# then, set the interface "up"
 	ip -n ${ROUTER_NS_V6} link add name ${ROUTER_INTF} \
 		type veth peer name ${HOST_INTF} netns ${HOST_NS_V6}
diff --git a/tools/testing/selftests/net/forwarding/lib.sh b/tools/testing/selftests/net/forwarding/lib.sh
index 05acd4011456..ae17be3423c0 100644
--- a/tools/testing/selftests/net/forwarding/lib.sh
+++ b/tools/testing/selftests/net/forwarding/lib.sh
@@ -114,7 +114,7 @@ netif_find_driver()
 	done
 }
 
-# Whether to find netdevice according to the driver speficied by the importer
+# Whether to find netdevice according to the driver specified by the importer
 : "${NETIF_FIND_DRIVER:=}"
 
 if [[ $NETIF_FIND_DRIVER ]]; then
diff --git a/tools/testing/selftests/net/ip_defrag.c b/tools/testing/selftests/net/ip_defrag.c
index f9ed749fd8c7..46630a489a03 100644
--- a/tools/testing/selftests/net/ip_defrag.c
+++ b/tools/testing/selftests/net/ip_defrag.c
@@ -30,7 +30,7 @@ const struct in6_addr addr6 = IN6ADDR_LOOPBACK_INIT;
 #define IP6_HLEN	(sizeof(struct ip6_hdr))
 #define UDP_HLEN	(sizeof(struct udphdr))
 
-/* IPv6 fragment header lenth. */
+/* IPv6 fragment header length. */
 #define FRAG_HLEN	8
 
 static int payload_len;
