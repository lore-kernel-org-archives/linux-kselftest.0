Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338C93F4DDD;
	Mon,  7 Sep 2026 12:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788785363; cv=none; b=FZm3AeIgNS4fEILMsfdxKW/wvLc8ZcwbOeEvd36dTrwyPOta+vF5vGDgAZ0fTvMxFbRdTQx12L9DqOOGWi2m956myd61w/zti6XkyLK7YzQk83kj3gyWPmqnzOYL48BqDZu3OhUl6nnU0EHzSxRMx/Hiq/HLl8tp1GM96wdQ26U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788785363; c=relaxed/simple;
	bh=l3Ra/VA5NlSvYubVz6j/otyq4/BCFwDBT3L4LH12i3I=;
	h=Message-ID:Date:MIME-Version:CC:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=jAW0Brx15V+oLbRxrSBJ5htNjv//M2MiwDDwmdXNgvC8KFMIFYcPMMMT+DxBd2iLT9Ipsbver8iOzFBCw2MK9UPdvH11W2V/nNrpiBeMLFFdTzcRSzgDETs/45azTQn9i7bTNdg9611279jtKe/seAkzRZC23tScArTu1AgVwc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=HUFrUJJG; arc=none smtp.client-ip=113.46.200.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="HUFrUJJG"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=gyQHYq6I80t/nlzkF/8Sj+KfcMcshEtpIFfJ5ePHhyo=;
	b=HUFrUJJGE6ZvJzgw25EitUVOxPkOVrNUpDeqBe+H8xKesiB6HUJGVaH/QXlDT71uIElaxaE0p
	Woxm9VOCNHNNV1MIgJ885j6hVMq9SUwQSVRv4XcokUlZ/2Z7f7/H6XVhG+Qx+iPRJyFvwmSIo4N
	RQULdNFgDcKkTi6H9sU2+aA=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4hdmn172Z2zpSvB;
	Mon,  7 Sep 2026 20:37:41 +0800 (CST)
Received: from kwepemo500018.china.huawei.com (unknown [7.202.195.199])
	by mail.maildlp.com (Postfix) with ESMTPS id D240D4057F;
	Mon,  7 Sep 2026 20:49:11 +0800 (CST)
Received: from [10.67.120.192] (10.67.120.192) by
 kwepemo500018.china.huawei.com (7.202.195.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 7 Sep 2026 20:49:10 +0800
Message-ID: <bfc0de5b-9574-4376-a968-2ea9ea1f06b0@huawei.com>
Date: Mon, 7 Sep 2026 20:49:10 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
CC: <shaojijie@huawei.com>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-net-drivers@amd.com>,
	<linux-kselftest@vger.kernel.org>, <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v2 1/6] net: fix typos in comments
To: Hemanth Selam <hemanth.selam@gmail.com>, "David S . Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Andrew Lunn
	<andrew@lunn.ch>, Sudarsana Kalluru <skalluru@marvell.com>, Manish Chopra
	<manishc@marvell.com>, Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman
	<horms@kernel.org>, Edward Cree <ecree.xilinx@gmail.com>, Shuah Khan
	<shuah@kernel.org>
References: <20260907044635.7141-1-hemanth.selam@gmail.com>
 <20260907044635.7141-2-hemanth.selam@gmail.com>
From: Jijie Shao <shaojijie@huawei.com>
In-Reply-To: <20260907044635.7141-2-hemanth.selam@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemo500018.china.huawei.com (7.202.195.199)


on 2026/9/7 12:46, Hemanth Selam wrote:
> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
>
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

For the hns and hns3 driver parts, the changes look good to me. Thanks,
Reviewed-by: Jijie Shao <shaojijie@huawei.com>

> ---
>   drivers/net/dsa/bcm_sf2_cfp.c                          |  2 +-
>   drivers/net/dsa/microchip/ksz_dcb.c                    |  2 +-

...

>   		pause_aneg_en:1,
> diff --git a/drivers/net/ethernet/hisilicon/hns/hns_dsaf_misc.c b/drivers/net/ethernet/hisilicon/hns/hns_dsaf_misc.c
> index 91391a49fcea..a59fd280a045 100644
> --- a/drivers/net/ethernet/hisilicon/hns/hns_dsaf_misc.c
> +++ b/drivers/net/ethernet/hisilicon/hns/hns_dsaf_misc.c
> @@ -591,7 +591,7 @@ static int hns_mac_config_sds_loopback(struct hns_mac_cb *mac_cb, bool en)
>   #define HILINK_ACCESS_SEL_CFG		0x40008
>   			/* hilink4 & hilink3 use the same xge training and
>   			 * xge u adaptor. There is a hilink access sel cfg
> -			 * register to select which one to be configed
> +			 * register to select which one to be configured
>   			 */
>   			if ((!HNS_DSAF_IS_DEBUG(mac_cb->dsaf_dev)) &&
>   			    (mac_cb->mac_id <= 3))
> diff --git a/drivers/net/ethernet/hisilicon/hns/hns_dsaf_ppe.c b/drivers/net/ethernet/hisilicon/hns/hns_dsaf_ppe.c
> index 5013beb4d282..408d36d85fb1 100644
> --- a/drivers/net/ethernet/hisilicon/hns/hns_dsaf_ppe.c
> +++ b/drivers/net/ethernet/hisilicon/hns/hns_dsaf_ppe.c
> @@ -139,7 +139,7 @@ static void hns_ppe_set_vlan_strip(struct hns_ppe_cb *ppe_cb, int en)
>   }
>   
>   /**
> - * hns_ppe_checksum_hw - set ppe checksum caculate
> + * hns_ppe_checksum_hw - set ppe checksum calculate
>    * @ppe_cb: ppe device
>    * @value: value
>    */
> diff --git a/drivers/net/ethernet/hisilicon/hns/hns_enet.c b/drivers/net/ethernet/hisilicon/hns/hns_enet.c
> index e905f10b894e..d819d2bb3450 100644
> --- a/drivers/net/ethernet/hisilicon/hns/hns_enet.c
> +++ b/drivers/net/ethernet/hisilicon/hns/hns_enet.c
> @@ -1230,7 +1230,7 @@ static void hns_nic_update_stats(struct net_device *netdev)
>   	h->dev->ops->update_stats(h, &netdev->stats);
>   }
>   
> -/* set mac addr if it is configed. or leave it to the AE driver */
> +/* set mac addr if it is configured. or leave it to the AE driver */
>   static void hns_init_mac_addr(struct net_device *ndev)
>   {
>   	struct hns_nic_priv *priv = netdev_priv(ndev);
> @@ -2317,7 +2317,7 @@ static int hns_nic_dev_probe(struct platform_device *pdev)
>   		ret = device_property_read_u32(dev, "port-id", &port_id);
>   		if (ret)
>   			goto out_read_prop_fail;
> -		/* for old dts, we need to caculate the port offset */
> +		/* for old dts, we need to calculate the port offset */
>   		port_id = port_id < HNS_SRV_OFFSET ? port_id + HNS_DEBUG_OFFSET
>   			: port_id - HNS_SRV_OFFSET;
>   	}
> diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
> index e6af939c1c19..bf35f55f5b8f 100644
> --- a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
> +++ b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
> @@ -10527,7 +10527,7 @@ static int hclge_get_link_diagnosis_info(struct hnae3_handle *handle,
>   }
>   
>   /* After disable sriov, VF still has some config and info need clean,
> - * which configed by PF.
> + * which configured by PF.
>    */
>   static void hclge_clear_vport_vf_info(struct hclge_vport *vport, int vfid)
>   {
> diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c
> index 00c3f2548bf6..bf533b8f46ae 100644
> --- a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c
> +++ b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c
> @@ -35,7 +35,7 @@ enum hclge_shaper_level {
>    * IR(Mbps) = -------------------------  *  CLOCK(1000Mbps)
>    *		Tick * (2 ^ IR_s)
>    *
> - * @return: 0: calculate sucessful, negative: fail
> + * @return: 0: calculate successful, negative: fail
>    */
>   static int hclge_shaper_para_calc(u32 ir, u8 shaper_level,
>   				  struct hclge_shaper_ir_para *ir_para,
> diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_main.c b/drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_main.c
> index 063a692c2b41..5d14d29b0296 100644
> --- a/drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_main.c
> +++ b/drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_main.c
> @@ -1880,7 +1880,7 @@ static void hclgevf_reset_service_task(struct hclgevf_dev *hdev)
>   		 * from PF as cmdq would be in unreliable state i.e. mailbox
>   		 * communication between PF and VF would be broken.
>   		 *
> -		 * if we are never geting into pending state it means either:
> +		 * if we are never getting into pending state it means either:
>   		 * 1. PF is not receiving our request which could be due to IMP
>   		 *    reset
>   		 * 2. PF is screwed

...

