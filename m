Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477531F942
	for <linux-kselftest@vger.kernel.org>; Mon,  7 Sep 2026 04:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788756407; cv=none; b=Za3VYKeenoMMaigNAZBnYbOSf9AWJ4YxpLkrx/fomh2JnXKTvYcXFsctLolSrszZcxvF3mf8/KlV77Ycy2mpUsZCp232231CVM2qwOExGMBG1PodmS4t6ulpO0biCfAXkMgm8M74iDtTgxxCfSkqVUk0jhOC7NqDy7q366WPXwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788756407; c=relaxed/simple;
	bh=kM+No/+mwCRbCgE+2r91S0pDirLJc757ykmgH52igpw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WB5p3hv7PsEmPxrAtYTem9AYC17x8LhPkMowPuUaScuNHuUp4oQr+wDYDNrQcZF88d37mv17GLVCEqnU8pp+tDFuz9ZAUSD7rL+6x7OfjshcLdbY97qul5YpESU4hsedaJHUdIkGpV6HhEJ+BNK9cVdOgPgn3ivSLfYzGm5afJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pTzAZl+C; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pTzAZl+C"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d715f4a587so45001545ad.2
        for <linux-kselftest@vger.kernel.org>; Sun, 06 Sep 2026 21:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756404; x=1789361204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zQa/bPG8yKkFKAben/fnsp6Vnq0BaJANv+XXZY1Yr1g=;
        b=pTzAZl+CGlmIcmqZYLMUz35DWWCl5Gdakk9s/2CSpeyysNZnm0kHF2pcfrhmrF14My
         isjjwkdCjvUlXRl9Fs6DnxkHiIaE8R7tTx7nPcJ/iro/EH2+qDstLM7wG41pBe5fPWLf
         jtDIUDPUs6moqQwfwWsP5yXqDe9FkFMw2nEwmesyNIw0qIhn4vjXy+T14VcbFUSgdZxz
         ea3SVt6LEQapjbJXSjUUCBZfhGC8RBlDgO/u9Hc4BrrBKpoMiAKbcddsST1IQ5vk2dPB
         /mN8l2OB5cQLd+/9ousCFJhZNXWJLeAqsl+uV/HhOvsDUAuNQQj7vrAa+y7CcuwsvgfQ
         XTLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756404; x=1789361204;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zQa/bPG8yKkFKAben/fnsp6Vnq0BaJANv+XXZY1Yr1g=;
        b=KbSRfvBHCEfYMq7ItgXkwWg3YktsOdL7+24LH9kIZPLzWQZ4GRTUDQjh7V06DWhFjm
         2PxqphOsvyiX0EBFukuHEoAaWH+hW/+ZBc9Coryde6wGleIW+LxnI0IzqEa55HRT0Jga
         mv/QoBZ9qWuLIzL3g60DyOaoEPAJbbDPJGEHHkDwidNkcGUQrv3LH4b9HqsRFpDKebjZ
         Xj/QpROs8GwvRbKhdRdQ9SCwf6G3fav89Euye16p9LSB0mGSCNES8HBeQnvSHY7JBhq0
         nfK/KrMymhONKXc/IKRmP9/m2GaSQa4lzUsWbo8AiEMWZ2P/3a+AyoJZKxf3Tk7WNgLk
         Vigg==
X-Forwarded-Encrypted: i=1; AKwUvByfuykmrE8BIgAK5fK6z19FvqzVIcaz11b2HQzdZCTr//jAtN2pfyHGLJ8zJPTFjaATCO4MWcu5+K7hcuEEx4I=@vger.kernel.org
X-Gm-Message-State: AFuF++ngZKJjZ3Ron3+jPxRiqk9CflyT1lY6NbLbV8CRWa2IzE24O6ho
	VZAT9n2lAnPZl8BvzkEumI9xYCGAOMmvKTH6/Hjh1uhwJ43A77dsKAuh
X-Gm-Gg: AYBFou0zcWxvGpPVM2qOZVhmVKJeHF75548iF3tokIaunOHH2zr3riJX84dvFlYBV/E
	9aqZRBfVj0iYzlyDERIR2XpD9eDf1uz/At7FUZa4Lp4Ui3THijRAfTXTCIHZP3h1AEE3snLrnzM
	CB8uddg6A5KQC25IZdR0qVDeEhHmEuAcy7l2fLdIQ0+75lwLQTo6IqzpDxQNUKPDpOkIis3GcfM
	qS9DZMM8jPyuRmYYL/T9Hp4x4zyoGjYVYtD3NPc8N11GP/irOpOtpWrJ3t3QnFswqjUSWDZtHcC
	K1BfR57UQ9ISSXOpdpKZEaPAlVH/hu8jD2FddPsYCivzyg5+K9ZhM3+VLHB4UcLBENFyex9TpEI
	yrLcvSNGQjJRL/cZ7N63IsX3LXRuOUGfb0/skSVxho8E9CrXc4C9nViYentA5vfkmVODspeojgB
	C2wCANfIRUqWsbYFUYr31YqbrKDuHcK0l6zSYBK/QIrBBNw/1pShhOx+9LgYUlYjXrarssW9MZ1
	yGBsqbfB0gsn1vqzl1EmgC3
X-Received: by 2002:a17:903:1b48:b0:2db:210f:c111 with SMTP id d9443c01a7336-2db210fc2cbmr220255975ad.2.1788756403514;
        Sun, 06 Sep 2026 21:46:43 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm37844565eec.16.2026.09.06.21.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:46:43 -0700 (PDT)
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
Subject: [PATCH v2 0/6] net: fix typos and repeated words in comments
Date: Mon,  7 Sep 2026 10:16:29 +0530
Message-ID: <20260907044635.7141-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is v2 of the spelling fixes for this tree.

Changes since v1:
Three patches from v1 are dropped because the fix was wrong: the doubled
word is correct English in switchdev.rst, sfc/bitfield.h and
ynl_gen_c.py.  v1 also failed to thread; this one is sent as one series.

Only comments change; no code is touched.

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
 drivers/net/ethernet/broadcom/bnx2x/bnx2x.h            |  4 ++--
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
 drivers/net/ethernet/sfc/mcdi_pcol.h                   | 10 +++++-----
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
 drivers/net/usb/asix_common.c                          |  2 +-
 drivers/net/usb/ax88179_178a.c                         |  4 ++--
 drivers/net/usb/sr9800.c                               |  2 +-
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
 net/llc/llc_conn.c                                     |  2 +-
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
 tools/testing/selftests/net/xfrm_policy.sh             |  2 +-
 146 files changed, 190 insertions(+), 190 deletions(-)

