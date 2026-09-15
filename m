Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3020A21C173;
	Tue, 15 Sep 2026 08:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.13.80.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789460174; cv=none; b=Pjkdhxdoq/pElzaFd3UeZ5lewJnNvMKwM+Sfje9/ukqUcSkSyOezJLY8jc8tbl3OCp4FasS2YIHMphd3qTgfm3yP5swKamCig7zDA4rcfp5oDo2MExoFV5KKX7shG58EdyBsTrUIRjYFW+aOx0r4sVET0kIJ5GuVooVeEsgY8es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789460174; c=relaxed/simple;
	bh=KK3epFEJIZvBiKL0GnFmvRR596hNeaW3d3VO1KIRJiA=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=hvyutjzPB+g4TkNtWvzFsjjx3gEScy2GjMcgCP8iHY3beejZwBjDihlEJVrnW6h+mq783/9XyBn/ySympPNY11MdE0ljtm7MBx+/sa+wpSCWGw9hEq3RewzEsNP8sE2dS9ULX87jDwd/bXuyUCwVf4Q5b/tkvs/2TLkHvN1N9S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de; spf=pass smtp.mailfrom=tipi-net.de; dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.b=pijrW107; arc=none smtp.client-ip=194.13.80.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.b="pijrW107"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B2F42A47BC;
	Tue, 15 Sep 2026 10:16:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1789460168; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UWfZD0ncUW0ItxAIq9SE2xIusb6qLhUzEXxsMlCILUU=;
	b=pijrW107OkWL2Homrrkn0XhV1JPT70vA+JjfxqxntJSEKMmV1x1BugJ/dH2Thxr3sKNNl/
	Nbk/KbfPJ5vN+eCgFKUimi8d5rln3R3LURQT6IkDtlne/qnyj+mP+IxOK/KC3Oh4orppi0
	6hB92wx/s9cxbQXyTcvxjEH9EpBFoGH46BMcFuvuFMAA1Oqg3kiMB9KeV08voHSBKVK6wu
	tPzkMx1mzp+bF9KAU3FzNpW5kV/zNhBFWyr/iCWL+iFJIxrKaxATO2Fv9FqyZj0hi7tRQS
	9uMYKljgm/s5punLBxzakAVCg8Qt3bFucA3vrOt6UBo/5CpAdR3/r5APz7zlsw==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 15 Sep 2026 10:16:06 +0200
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next 2/2] selftests: drv-net: Add VLAN test
In-Reply-To: <20260913143926.77366-3-ovidiu.panait.rb@renesas.com>
References: <20260913143926.77366-1-ovidiu.panait.rb@renesas.com>
 <20260913143926.77366-3-ovidiu.panait.rb@renesas.com>
Message-ID: <62229b50d8cafb952fa234d46bc78782@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Ovidiu

On 13.9.2026 16:39, Ovidiu Panait wrote:
> Add a test that validates ping traffic over VLAN interfaces. It aims
> to catch drivers which mishandle hardware VLAN tag stripping, in
> particular QinQ.
> 
> Three VLAN configurations are covered, each with hardware RX VLAN
> stripping enabled and disabled (via the rx-vlan-offload and
> rx-vlan-stag-hw-parse features):
> - a single 802.1q VLAN interface
> - a single 802.1ad VLAN interface
> - an 802.1q VLAN stacked on top of an 802.1ad interface
> 
> The "hw" test variants enable the RX VLAN stripping features supported
> by the device (rx-vlan-offload and rx-vlan-stag-hw-parse), the "sw"
> test variants disable all of them. A test is xfailed if the requested
> configuration is not possible.
> 
> VLAN insertion offloads are not tested for now.
> 
> NETIF=end0 LOCAL_V4=172.16.0.2 REMOTE_V4=172.16.0.3 \
> REMOTE_TYPE=ssh REMOTE_ARGS=root@172.16.0.3 \
> run_kselftest.sh -t drivers/net/hw:vlan.py
>  TAP version 13
>  1..1
>  # timeout set to 0
>  # selftests: drivers/net/hw: vlan.py
>  # # Interface: end0, driver: st_gmac
>  # TAP version 13
>  # 1..6
>  # ok 1 vlan.test.8021q_hw
>  # ok 2 vlan.test.8021q_sw
>  # ok 3 vlan.test.8021ad_hw
>  # ok 4 vlan.test.8021ad_sw
>  # ok 5 vlan.test.qinq_hw
>  # ok 6 vlan.test.qinq_sw
>  # # Totals: pass:6 fail:0 xfail:0 xpass:0 skip:0 error:0
>  ok 1 selftests: drivers/net/hw: vlan.py
>  # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
> 
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

> [...]

> +def _setup(cfg, outer_proto, inner_proto, hw_strip):
> +    """Configure VLAN stripping and create the VLAN interfaces."""
> +
> +    names = ["rx-vlan-offload"]
> +    if outer_proto == "802.1ad":
> +        names.append("rx-vlan-stag-hw-parse")
> +
> +    feat = ethtool(f"-k {cfg.ifname}", json=True)[0]
> +    feats = {}
> +    for name in names:
> +        # hw: skip the features the device does not support
> +        # sw: request all of them off
> +        if hw_strip and feat[name]["fixed"] and not 
> feat[name]["active"]:
> +            continue
> +        feats[name] = hw_strip
> +
> +    if hw_strip and not feats:
> +        raise KsftXfailEx("Device does not support RX VLAN stripping")
> +
> +    set_ethtool_feat(cfg.ifname, feat, feats)

If a driver refuses to set the feature, set_ethtool_feat() would not 
fail
and the test would be false positive.

I did a quick search and at least intel iavf could run into this:

    drivers/net/ethernet/intel/iavf/iavf_main.c:iavf_fix_strip_features() 
{
         [...]
         if ((netdev->features & NETIF_F_RXFCS) && is_vlan_strip) {
                 requested_features &= ~vlan_strip;
         [...]
    }

IMHO the test should check if the feature actually got enabled. This
could be wrapped in set_ethtool_feat() or be checked afterwards. I would
lean towards the first one.

> [...]

Thanks,
Nicolai
