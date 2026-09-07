Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EE84BCAA9;
	Mon,  7 Sep 2026 12:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788785549; cv=none; b=tG3/qb/bZFkvRUjimLY1JTNVjtdAfpOjUmagYU1R+DLD3N6rNQeN48HwrPtjf3yYd3f/jExg+pAL3Cpl9nRCOZGA3NbeG67grOLFmnPkweG8QVEf/apr/wEd2IEszz23eoHGT7Sn37NLwbTPpeYSym9xhrZQ1WrEiWxdc6uqnIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788785549; c=relaxed/simple;
	bh=x8b7N9jqfDk77DldP5fChz2gndYQavocBAogp1SVOLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uftWreUEHDPRQoqcl2SdGwp0Cm7Os3c1leVgqPE4iYnABBJBLIYjXVVMrmqjIczQS/tThl4xS1HAv/S7LZZTRQ7hN3vW7rdJx7bpX92f9t9miOLBGEc8cCXtz92PMVBTPd0EbNlWGgADcen14xeq2aOiK94aDPTC64bKaP6vdI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=mfJAnWbd; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="mfJAnWbd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ripSjHDdp3XrP9PDd5/ms7sEI5CQitY+Sd0KNfUlUvg=; b=mfJAnWbd01mYqQuT06W19DFHyM
	7nUOhAl/0IERfO2ss1DRPwYzITrBYDj0TVgRqSw7T4IfTYFh69BilY1Wks2aGNyGtzfXj0PtkIcRX
	iXMGcAb/Ln7Uezc94gkHHrvxFlU90Iqujwm67Mcpk9jpMonAe85fndZyj/DsOsPK24lM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x3Ypc-003WG6-Pg; Mon, 07 Sep 2026 14:52:16 +0200
Date: Mon, 7 Sep 2026 14:52:16 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Sudarsana Kalluru <skalluru@marvell.com>,
	Manish Chopra <manishc@marvell.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	Edward Cree <ecree.xilinx@gmail.com>, Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-net-drivers@amd.com, linux-kselftest@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 1/6] net: fix typos in comments
Message-ID: <8f289b56-0d4f-470f-a0ba-bdd6b4ee524f@lunn.ch>
References: <20260907044635.7141-1-hemanth.selam@gmail.com>
 <20260907044635.7141-2-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907044635.7141-2-hemanth.selam@gmail.com>

On Mon, Sep 07, 2026 at 10:16:30AM +0530, Hemanth Selam wrote:
> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
>  drivers/net/dsa/bcm_sf2_cfp.c                          |  2 +-
>  drivers/net/dsa/microchip/ksz_dcb.c                    |  2 +-
>  drivers/net/dsa/realtek/rtl8366rb.c                    |  2 +-
>  drivers/net/dsa/sja1105/sja1105_tas.c                  |  2 +-
>  drivers/net/ethernet/3com/typhoon.h                    |  2 +-
>  drivers/net/ethernet/8390/ax88796.c                    |  2 +-
>  drivers/net/ethernet/airoha/airoha_eth.c               |  2 +-
>  drivers/net/ethernet/allwinner/sun4i-emac.c            |  2 +-
>  drivers/net/ethernet/amazon/ena/ena_eth_com.h          |  2 +-
>  drivers/net/ethernet/amd/xgbe/xgbe-dev.c               |  2 +-
>  drivers/net/ethernet/apm/xgene/xgene_enet_main.c       |  2 +-
>  drivers/net/ethernet/atheros/atl1c/atl1c_hw.h          |  2 +-
>  drivers/net/ethernet/atheros/atl1e/atl1e.h             |  2 +-
>  drivers/net/ethernet/atheros/atl1e/atl1e_hw.c          |  2 +-
>  drivers/net/ethernet/atheros/atl1e/atl1e_main.c        |  2 +-
>  drivers/net/ethernet/atheros/atlx/atl1.c               |  2 +-
>  drivers/net/ethernet/atheros/atlx/atl2.c               |  2 +-
>  drivers/net/ethernet/broadcom/bcm63xx_enet.c           |  2 +-
>  drivers/net/ethernet/broadcom/bcm63xx_enet.h           |  2 +-
>  drivers/net/ethernet/broadcom/bcmsysport.h             |  2 +-
>  drivers/net/ethernet/broadcom/bnx2x/bnx2x.h            |  2 +-
>  drivers/net/ethernet/broadcom/bnx2x/bnx2x_dcb.c        |  4 ++--
>  drivers/net/ethernet/broadcom/bnx2x/bnx2x_hsi.h        |  2 +-
>  drivers/net/ethernet/broadcom/bnx2x/bnx2x_init_ops.h   |  2 +-
>  drivers/net/ethernet/broadcom/bnx2x/bnx2x_link.c       |  8 ++++----
>  drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c       |  2 +-
>  drivers/net/ethernet/broadcom/bnx2x/bnx2x_reg.h        |  4 ++--
>  drivers/net/ethernet/brocade/bna/bfa_ioc.c             |  4 ++--
>  drivers/net/ethernet/brocade/bna/bna_enet.c            |  4 ++--
>  drivers/net/ethernet/calxeda/xgmac.c                   |  2 +-
>  drivers/net/ethernet/cavium/liquidio/cn66xx_device.c   |  2 +-
>  drivers/net/ethernet/cavium/liquidio/lio_core.c        |  2 +-
>  drivers/net/ethernet/cavium/liquidio/octeon_config.h   |  4 ++--
>  drivers/net/ethernet/cavium/liquidio/octeon_iq.h       |  2 +-
>  drivers/net/ethernet/cavium/liquidio/octeon_main.h     |  2 +-
>  drivers/net/ethernet/cavium/liquidio/octeon_nic.h      |  2 +-
>  drivers/net/ethernet/cavium/liquidio/request_manager.c |  2 +-
>  drivers/net/ethernet/cavium/thunder/nic.h              |  2 +-
>  drivers/net/ethernet/cavium/thunder/nic_main.c         |  2 +-
>  drivers/net/ethernet/chelsio/cxgb3/sge.c               |  2 +-
>  drivers/net/ethernet/chelsio/cxgb4/cxgb4_dcb.c         |  2 +-
>  drivers/net/ethernet/chelsio/cxgb4/cxgb4_ethtool.c     |  2 +-
>  drivers/net/ethernet/chelsio/cxgb4/t4_hw.c             |  2 +-
>  drivers/net/ethernet/chelsio/cxgb4vf/sge.c             |  2 +-
>  drivers/net/ethernet/cirrus/cs89x0.c                   |  4 ++--
>  drivers/net/ethernet/dec/tulip/de2104x.c               |  2 +-
>  drivers/net/ethernet/dec/tulip/interrupt.c             |  4 ++--
>  drivers/net/ethernet/dec/tulip/media.c                 |  2 +-
>  drivers/net/ethernet/dec/tulip/tulip.h                 |  4 ++--
>  drivers/net/ethernet/dec/tulip/winbond-840.c           |  2 +-
>  drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c       |  2 +-
>  drivers/net/ethernet/freescale/fman/fman_memac.c       |  2 +-
>  drivers/net/ethernet/freescale/gianfar.c               |  2 +-
>  drivers/net/ethernet/freescale/gianfar.h               |  2 +-
>  drivers/net/ethernet/hisilicon/hns/hns_dsaf_misc.c     |  2 +-
>  drivers/net/ethernet/hisilicon/hns/hns_dsaf_ppe.c      |  2 +-
>  drivers/net/ethernet/hisilicon/hns/hns_enet.c          |  4 ++--
>  .../net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c    |  2 +-
>  drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c  |  2 +-
>  .../net/ethernet/hisilicon/hns3/hns3vf/hclgevf_main.c  |  2 +-
>  drivers/net/ethernet/ibm/emac/emac.h                   |  2 +-
>  drivers/net/ethernet/ibm/emac/phy.h                    |  2 +-
>  drivers/net/ethernet/jme.h                             |  2 +-
>  drivers/net/ethernet/marvell/mvpp2/mvpp2.h             |  2 +-
>  drivers/net/ethernet/marvell/mvpp2/mvpp2_prs.c         |  8 ++++----
>  drivers/net/ethernet/marvell/octeontx2/af/npc.h        |  4 ++--
>  drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c    |  2 +-
>  drivers/net/ethernet/marvell/octeontx2/nic/cn10k.c     |  2 +-
>  .../net/ethernet/marvell/octeontx2/nic/otx2_dcbnl.c    |  2 +-
>  drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c   |  2 +-
>  drivers/net/ethernet/marvell/pxa168_eth.c              |  4 ++--
>  drivers/net/ethernet/mellanox/mlx4/eq.c                |  2 +-
>  drivers/net/ethernet/mellanox/mlx5/core/en/tc/sample.c |  2 +-
>  drivers/net/ethernet/mellanox/mlx5/core/lib/tout.c     |  2 +-
>  drivers/net/ethernet/mellanox/mlxsw/i2c.c              |  2 +-
>  drivers/net/ethernet/mellanox/mlxsw/reg.h              |  2 +-
>  drivers/net/ethernet/natsemi/sonic.h                   |  2 +-
>  drivers/net/ethernet/nvidia/forcedeth.c                |  4 ++--
>  drivers/net/ethernet/qlogic/netxen/netxen_nic_ctx.c    |  2 +-
>  drivers/net/ethernet/qlogic/qed/qed_cxt.c              |  2 +-
>  drivers/net/ethernet/qlogic/qed/qed_dev.c              |  2 +-
>  drivers/net/ethernet/qlogic/qed/qed_mcp.h              |  2 +-
>  drivers/net/ethernet/qlogic/qlcnic/qlcnic.h            |  2 +-
>  drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_init.c  |  4 ++--
>  drivers/net/ethernet/qlogic/qlcnic/qlcnic_ctx.c        |  2 +-
>  drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c       |  4 ++--
>  drivers/net/ethernet/qualcomm/emac/emac-mac.c          |  2 +-
>  drivers/net/ethernet/realtek/8139too.c                 |  2 +-
>  drivers/net/ethernet/realtek/rtase/rtase_main.c        |  2 +-
>  drivers/net/ethernet/seeq/sgiseeq.c                    |  2 +-
>  drivers/net/ethernet/sfc/falcon/falcon.c               |  2 +-
>  drivers/net/ethernet/sfc/mcdi_pcol.h                   |  8 ++++----
>  drivers/net/ethernet/sfc/siena/mcdi_pcol.h             |  6 +++---
>  drivers/net/ethernet/sfc/siena/ptp.c                   |  2 +-
>  drivers/net/ethernet/sgi/meth.h                        |  2 +-
>  drivers/net/ethernet/silan/sc92031.c                   |  6 +++---
>  drivers/net/ethernet/sis/sis900.c                      |  2 +-
>  drivers/net/ethernet/smsc/smsc9420.c                   |  2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c      |  2 +-
>  drivers/net/ethernet/sun/cassini.h                     |  2 +-
>  drivers/net/ethernet/synopsys/dwc-xlgmac-common.c      |  2 +-
>  drivers/net/ethernet/synopsys/dwc-xlgmac-hw.c          |  2 +-
>  drivers/net/ethernet/tehuti/tehuti.c                   |  8 ++++----
>  drivers/net/ethernet/ti/tlan.c                         |  2 +-
>  drivers/net/ethernet/toshiba/ps3_gelic_net.c           |  2 +-
>  drivers/net/ethernet/toshiba/ps3_gelic_net.h           |  2 +-
>  drivers/net/ethernet/toshiba/ps3_gelic_wireless.c      |  2 +-
>  drivers/net/ethernet/via/via-rhine.c                   |  2 +-
>  drivers/net/ethernet/via/via-velocity.c                | 10 +++++-----
>  drivers/net/fddi/skfp/cfm.c                            |  2 +-
>  drivers/net/fddi/skfp/ecm.c                            |  2 +-
>  drivers/net/fddi/skfp/fplustm.c                        |  4 ++--
>  drivers/net/fddi/skfp/h/hwmtm.h                        |  2 +-
>  drivers/net/fddi/skfp/h/sba.h                          |  2 +-
>  drivers/net/fddi/skfp/pcmplc.c                         |  2 +-
>  drivers/net/fddi/skfp/rmt.c                            |  2 +-
>  drivers/net/ipa/ipa_interrupt.h                        |  2 +-
>  drivers/net/phy/bcm87xx.c                              |  2 +-
>  drivers/net/phy/marvell.c                              |  2 +-
>  drivers/net/ppp/ppp_generic.c                          |  4 ++--
>  drivers/net/usb/ax88179_178a.c                         |  4 ++--
>  drivers/net/wan/slic_ds26522.c                         |  2 +-
>  drivers/s390/net/ctcm_main.c                           |  4 ++--
>  drivers/s390/net/qeth_core.h                           |  2 +-
>  include/net/inet_hashtables.h                          |  2 +-
>  include/net/sock.h                                     |  2 +-
>  net/ipv4/tcp.c                                         |  2 +-
>  net/ipv4/tcp_input.c                                   |  2 +-
>  net/ipv4/tcp_output.c                                  |  2 +-
>  net/ipv6/calipso.c                                     |  4 ++--
>  net/llc/llc_c_ac.c                                     |  2 +-
>  net/netlink/af_netlink.c                               |  2 +-
>  net/sctp/protocol.c                                    |  4 ++--
>  net/sctp/sm_make_chunk.c                               |  4 ++--
>  net/sctp/sm_sideeffect.c                               |  2 +-
>  net/sctp/transport.c                                   |  2 +-
>  net/sctp/ulpqueue.c                                    |  2 +-
>  samples/pktgen/README.rst                              |  2 +-
>  tools/testing/selftests/drivers/net/team/options.sh    |  2 +-
>  .../selftests/net/arp_ndisc_untracked_subnets.sh       |  4 ++--
>  tools/testing/selftests/net/forwarding/lib.sh          |  2 +-
>  tools/testing/selftests/net/ip_defrag.c                |  2 +-
>  142 files changed, 184 insertions(+), 184 deletions(-)

It takes me a surprising amount of time to review each change. 184
changes is too many to review at once. Please split this patch by
vendor.


    Andrew

---
pw-bot: cr
