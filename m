Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.217
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795678145;
	b=vPyKSjHgCmXCFMNRmmAnyssWck80BlDAbhjsFP7hBPNl/T4fUlluhHIMFYp2Oo5gpB8G
	 SRIYRWN3CwFGZC0IzIXqyU7uP8pwL9gSftd/WPZ38YitcbPddySHv5ne8Pozgg6W/IiTg
	 qa9IFllJQEHdK4TJiHdcRc/OzoMaNWUQnXeXxSzv/NaXmx2lkfYsZZm8BIDv/rNypJlzr
	 Mb609+BrS4AM+KTElVmKgf5LCH0M/yr14zHjx3bgKPqyWh95Oh8C8kd5/mH6VkpEPsKwd
	 cXuKIMNpnt4unFWAOplyYPAxwbyFo517LHyKtWdvwcBG6vuLwiC6E/2orgmRWTIa37Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795678145;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:CC:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
	bh=Slqoilb3q4EZlN+z4xYKdNmmkHqZq4WOd9FM1kAt4Fg=;
	b=n0E64yrkKh5o2WrD7gEFjkmgnyfA3XurPFP7/LC65fhs9c7CCAw/9d96qifFPncWozjC
	 QBvjS00QpkyVQcPkzxo5skWl9x5u7Pmg7TtlaiP5oYBUiVyK/wngh95Ib/pC6ouM7muae
	 GYpIjjaeXSAeQUhOFn/NlbcX3Cp9Oam4nhnoVWVOWktZ/lRxtZbUpgI8dCCVenPB5CLor
	 reNM3a6TN+Zcd6vJf+uoY3uJa+i8fBPhdqvgKPMWh0mmaSoRdtoW9Zs4xJ5cVUDQasSCl
	 QpZV0QnHSFnIt4jDwbFNxDqfokW8MlsxO1G2h2jz3e13Ni4+V4SyHSFyNRxLZdCqg+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=WQzCgywY;
	arc=none smtp.remote-ip=113.46.200.217
Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8667E606A32E;
	Thu, 26 Nov 2026 07:29:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8667E606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=WQzCgywY
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Slqoilb3q4EZlN+z4xYKdNmmkHqZq4WOd9FM1kAt4Fg=;
	b=WQzCgywYA/jx6AJHyEgRsMgSaAlyZ/nzSD3+3nwX7MqZFA21JxotVD2GhoHuFlFI6u+ZUA6Ae
	OgkRwGzlH0WEfMYxUhls2EbFvW0+SdxNkN++ZtZAqSXv13N7p0B6aaFJz7zP1W6O2QenR4eCYSl
	Xfp0JSNTB+wisVfnPZBYndM=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4jZp6X0mvrzcZxr;
	Thu, 26 Nov 2026 15:27:48 +0800 (CST)
Received: from whupemp200008.china.huawei.com (unknown [7.152.184.21])
	by mail.maildlp.com (Postfix) with ESMTPS id 3970540579;
	Thu, 26 Nov 2026 15:28:55 +0800 (CST)
Received: from [10.174.176.113] (10.174.176.113) by
 whupemp200008.china.huawei.com (7.152.184.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 26 Nov 2026 15:28:53 +0800
Message-ID: <6cde295b-4c7b-4878-8fda-3732a2ff7c7d@huawei.com>
Date: Thu, 26 Nov 2026 15:28:52 +0800
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 0/3] bonding: ignore updelay when no active links for
 broadcast mode
To: Hangbin Liu <hangbin.liu@linux.dev>, Jay Vosburgh <jv@jvosburgh.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Tonghao Zhang <tonghao@bamaicloud.com>, Nikolay
 Aleksandrov <razor@blackwall.org>, Shuah Khan <shuah@kernel.org>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>
References: <20261126-bond_broadcast_updelay-v1-0-188e5538d6ca@kylinos.cn>
Content-Language: en-US
From: "jiangjiehua (A)" <jiangjiehua1@huawei.com>
In-Reply-To: <20261126-bond_broadcast_updelay-v1-0-188e5538d6ca@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 whupemp200008.china.huawei.com (7.152.184.21)

Hi Hangbin,

On 11/26/2026 10:30 AM, Hangbin Liu wrote:
> This patchset fixes updelay handling for bonding broadcast mode (mode 3)
> to align with bonding documentation section 13.1 paragraph 4: when a
> bond has no active links, the first link that comes up must be reused
> immediately even if updelay is configured; when usable links exist,
> updelay must be honored.
> 
> Commit 45fc134bcfad ("bonding: do not set usable_slaves for broadcast
> mode") tried to fix the second half of that rule by never updating
> usable_slaves in broadcast mode. That made ignore_updelay permanently
> false, so updelay was always applied and a broadcast bond with no
> active links could not recover within the miimon window when one usable
> slave up.
> 
> We revert 45fc134bcfad to restore the enslave/release side of the
> usable_slaves updates, and add the missing bond_miimon_link_change()
> case so the snapshot also tracks link-state transitions. Both halves
> are needed:
> 
>    - revert alone: the snapshot is only rebuilt on enslave/release, so
>      batch enslave with updelay (new slaves start in BOND_LINK_BACK)
>      leaves count == 0 forever and updelay is never honored, even once
>      other slaves are usable;
>    - link_change case alone: with 45fc134bcfad applied,
>      bond_set_slave_arr() discards the refreshed array for broadcast.
> 
> A selftest is added to cover mode 3; the existing mode 1 and mode 2
> recovery-updelay tests are merged into a single script covering
> modes 1, 2 and 3.
> 
> Before revert 45fc134bcfad:
>    TEST: mode (3) bond recovery                               [FAIL]
>            No connectivity
>    TEST: mode (3) bond recovery                               [FAIL]
>            No connectivity
>    TEST: mode (3) bond recovery                               [FAIL]
>            No connectivity
> 
> After revert 45fc134bcfad:
>    TEST: mode (3) bond recovery                               [ OK ]
>    TEST: mode (3) bond recovery                               [ OK ]
>    TEST: mode (3) bond recovery                               [ OK ]
> 
> For the second patch, I use test script
>    ```
>    ip link add veth0 type veth peer name veth0p
>    ip link add veth1 type veth peer name veth1p
>    ip link set veth0p up
>    ip link set veth1p up
>    ip link add bond0 type bond mode broadcast miimon 100 updelay 1000
>    ip link set veth0 down
>    ip link set veth1 down
>    ip link set veth0 master bond0 && ip link set veth1 master bond0
>    ip link set bond0 up
>    sleep 2
>    dmesg -C
> 
>    # Test A — bullet 1: batch enslave, snapshot stuck at count == 0,
>    # updelay never honored
>    ip link set veth0p down
>    sleep 2
>    ip link set veth0p up
>    sleep 1
>    dmesg | tail -n 5
> 
>    # Test B — bullet 2: stale non-empty snapshot, recovery delayed with
>    # zero usable links
>    ip link set veth0 nomaster
>    ip link set veth1 nomaster
>    ip link set veth0 master bond0
>    sleep 2 # wait veth0 up
>    ip link set veth1 master bond0
>    sleep 2 # veth1 comes up after its own updelay; snapshot stays
>    # drop both links (bond has zero usable links after this)
>    ip link set veth0p down
>    ip link set veth1p down
>    sleep 2
>    ip link set veth0p up
>    sleep 2
>    dmesg | tail -n 5
>    ```
> 
> With revert only:
> Test A:
> [   13.190593] bond0: (slave veth0): link status definitely down, disabling slave
> [   15.165875] bond0: (slave veth0): link status up, enabling it in 0 ms
> [   15.165919] bond0: (slave veth0): link status definitely up, 10000 Mbps full duplex
> Test B:
> [   20.366724] bond0: (slave veth1): link status definitely down, disabling slave
> [   20.366957] bond0: now running without any active interface!
> [   22.341960] bond0: (slave veth0): link status up, enabling it in 1000 ms
> [   23.382194] bond0: (slave veth0): link status definitely up, 10000 Mbps full duplex
> [   23.382428] bond0: active interface up!
> 
> With the second patch
> Test A:
> [    6.208526] bond0: (slave veth0): link status definitely down, disabling slave
> [    8.184359] bond0: (slave veth0): link status up, enabling it in 1000 ms
> Test B:
> [   13.384852] bond0: (slave veth1): link status definitely down, disabling slave
> [   13.385093] bond0: now running without any active interface!
> [   15.360849] bond0: (slave veth0): link status up, enabling it in 0 ms
> 
> We can see when there is active slave, the second slave follow the
> updelay rule (Test A). When there is no active slave, the first up
> slave will be in use immediately (Test B).
> 
> Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
> ---
> Hangbin Liu (3):
>        Revert "bonding: do not set usable_slaves for broadcast mode"
>        bonding: update slave array on link change for broadcast mode
>        selftests: bonding: add recovery updelay test for broadcast mode
> 
>   drivers/net/bonding/bond_main.c                    | 14 +++----
>   .../testing/selftests/drivers/net/bonding/Makefile |  3 +-
>   .../drivers/net/bonding/mode-2-recovery-updelay.sh | 45 ----------------------
>   ...e-1-recovery-updelay.sh => recovery-updelay.sh} | 13 +++----
>   4 files changed, 12 insertions(+), 63 deletions(-)
> ---
> base-commit: 1ab3fb564f20b78615a6d88b8c90da292f29e227
> change-id: 20261126-bond_broadcast_updelay-cc4cfb6e0e37
> 
> Best regards,
> --
> Hangbin Liu <liuhangbin@kylinos.cn>

Tested on v7.4-rc4 in a virtme-ng guest. Ran recovery-updelay.sh (21/21 
OK) and the cover-letter Test A/B; both match the expected updelay behavior.

Tested-by: JiangJieHua <jiangjiehua1@huawei.com>

Thanks,
Jiehua

