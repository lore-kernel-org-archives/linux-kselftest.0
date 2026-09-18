Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AB549739D;
	Fri, 18 Sep 2026 12:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.13.80.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789733063; cv=none; b=awnCwYkpCmq3KzQ9ikJ9dnT7AyyjfEG65sMgwf+Ad9sKlkndFx1FISYWfhh58ciXyJhr/xlNX6J+TOq5dZRyrJ435eexWeCg9FJe5DwBJRa8RjoWgp0dHwpMd43HqBkB06DCArXPp/ClhfGgT1ZAFcMMHANruhUqQ6iXnqLHsUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789733063; c=relaxed/simple;
	bh=Nb2JuZiZuEZLkeq5wgkkvPPvZ8ZSJNPBioO4Z4K26Jg=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=cdMqAFQXVqmsMbzpg6kmGfU21V58a3xPPwXbQsZeEfcAXwTPex43dZt5HVM05wc+BLUfHyoN8AwBgdO24XpocxiH9UQt14S9t+ssq9k1J608B4wsJLMq852vec6k7S5d8/JFPyx9tVL8qHA5Zypx5GLmUGLEkiYC2iT97LlWuc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de; spf=pass smtp.mailfrom=tipi-net.de; dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.b=yq74817J; arc=none smtp.client-ip=194.13.80.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.b="yq74817J"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A27D5A9002;
	Fri, 18 Sep 2026 14:04:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1789733055; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LCe4TXHQ5qFhipcx+sPoK7TKjnf78N7dSA9ERf9dnz8=;
	b=yq74817JOf704tYHosvFVpk98Jf3oAAsZNo/wQE7OG3gwMd7LLUoZ0Joph9MXDxrvxpK/7
	9OIyXjMpzPdYPAvgy3ygsqbQi1QGeKh24qr22dSal0FXPZrwV3CKqq3VJVOhU/e60/GJAQ
	KEO7xw2hHQNgH1NCXkKpzZQfUEIMsmD6ZMeJinBn0UIM6vdngIHJBvPCGNeTae67mq546x
	kAX8PZnrUmM8QkzxwERctlC+aR/0IcyZdgA1gtCV9WWBzy8+MEkRrcTd6NeiWUamRjFFMI
	wDaKwgJrpo7ZPWPfPZt1kf9aPSbvKPDRke69QSLQB8uBGgE1Q1fRHaqHdEYyKQ==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 18 Sep 2026 14:04:13 +0200
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v2 3/3] selftests: drv-net: Add VLAN test
In-Reply-To: <20260918112529.96039-4-ovidiu.panait.rb@renesas.com>
References: <20260918112529.96039-1-ovidiu.panait.rb@renesas.com>
 <20260918112529.96039-4-ovidiu.panait.rb@renesas.com>
Message-ID: <5be2136e4142427285566f01d95c1b7b@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Ovidiu

On 18.9.2026 13:25, Ovidiu Panait wrote:
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
> ---

> [...]

> +LOCAL_IP = os.environ.get("VLAN_LOCAL_V4", "198.51.100.1")
> +REMOTE_IP = os.environ.get("VLAN_REMOTE_V4", "198.51.100.2")

   LOCAL_IP = "198.51.100.1"
   REMOTE_IP = "198.51.100.2"

IMHO it would be better to use cfg.env, so net.config is honoured.

Either way the vars (eg. VLAN_LOCAL_V4 / VLAN_REMOVE_V4) should be
mentioned in README.rst? Right now it is only stated in the v2 changelog
in this commit.

> +
> +
> +def _vlan_add(base, name, proto, vid, host=None):
> +    """Create a VLAN device on top of base and bring it up."""
> +
> +    ip(f"link add link {base} name {name} type vlan proto {proto} id 
> {vid}",
> +       host=host)
> +    defer(ip, f"link del {name}", host=host)
> +    ip(f"link set {name} up", host=host)
> +
> +
> +def _vlan_setup(base, addr, outer_proto, inner_proto, host=None):
> +    """Create VLAN interfaces on base and set an IP on the innermost 
> one."""
> +
> +    _vlan_add(base, OUTER_DEV, outer_proto, OUTER_VID, host=host)
> +    if inner_proto:
> +        _vlan_add(OUTER_DEV, INNER_DEV, inner_proto, INNER_VID, 
> host=host)
> +
> +    dev = INNER_DEV if inner_proto else OUTER_DEV
> +    ip(f"addr add {addr}/24 dev {dev}", host=host)
> +
> +
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
> +
> +    _vlan_setup(cfg.ifname, LOCAL_IP, outer_proto, inner_proto)
> +    _vlan_setup(cfg.remote_ifname, REMOTE_IP, outer_proto, 
> inner_proto,

LOCAL_IP -> cfg.local_ip
REMOTE_IP -> cfg.remote_ip

> +                host=cfg.remote)
> +
> +
> +def _vlan_variants():
> +    """Generator that yields the VLAN protocols and the stripping 
> mode."""
> +
> +    yield KsftNamedVariant("8021q_hw", "802.1q", None, True)
> +    yield KsftNamedVariant("8021q_sw", "802.1q", None, False)
> +    yield KsftNamedVariant("8021ad_hw", "802.1ad", None, True)
> +    yield KsftNamedVariant("8021ad_sw", "802.1ad", None, False)
> +    yield KsftNamedVariant("qinq_hw", "802.1ad", "802.1q", True)
> +    yield KsftNamedVariant("qinq_sw", "802.1ad", "802.1q", False)
> +
> +
> +@ksft_variants(_vlan_variants())
> +def test(cfg, outer_proto, inner_proto, hw_strip):
> +    """Run a single VLAN test"""
> +
> +    _setup(cfg, outer_proto, inner_proto, hw_strip)
> +
> +    cmd(f"ping -c 1 -W 5 {REMOTE_IP}")

REMOTE_IP -> cfg.remote_ip

> +
> +
> +def main() -> None:
> +    """ Ksft boiler plate main """
> +
> +    with NetDrvEpEnv(__file__) as cfg:

cfg.local_ip = cfg.env.get("VLAN_LOCAL_V4", LOCAL_IP)
cfg.remote_ip = cfg.env.get("VLAN_REMOTE_V4", REMOTE_IP)

> +        ksft_run(cases=[test], args=(cfg, ))
> +    ksft_exit()
> +
> +
> +if __name__ == "__main__":
> +    main()

Thanks,
Nicolai
