Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794847989;
	b=fLwZjQCpQVf9PJ5/cH9VtcsYrfYCsmdaYbtc6pEYXvPeDRh9gR/mDFvzmbcgQ7BJ/DTl
	 F6KHwVluUxJeqGEl0NSDGXEm/azDkB8kXVVK4gbCeLw9AA9p5wB+UcosaCpAoB31REzRb
	 P6e0NqKWqjubqB24Ct5+9Gq4MTmyELGCUnNGZshSfsSnaE4tHBZhvXm/o1Wi/4pdXTWRM
	 h3RyllTwrg1uf/5ZKEffKs283JyYEMqwSVAAGgQ4tNkARrbV9fTUnGNv4Z6SrTFxs7jXn
	 uQblfOVOt7BqAxOv49mpSyYHIqqpD2grv/B1Fm90w3ulnctL7NiUkpUafsLh0TGZ2XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794847989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=VP7DDRUVGo0CSGEb63lpwJNrvx2CbLF1KeHf8Yfc8UE=;
	b=vu+GUe8IYj/zzXyz+VqsznlEkoa8OT2EM6BvPFipuqjeus/+LYr/M9I7eXYDoss0Yhla
	 hvNrC+LlGRsMcHGkwb7pn9C7oKQAQAXGW2o9VPJJL2/+/qOv33NmsyinN+PCU+A7x2epq
	 tAR7PSRtBL7Rrz/NGrqmbBDe8xn6rlYGLBdYhoNJdigdoBofqGKZ6t8iCUrTP9w3taMQA
	 6C+kE6aD/XWogAL3ady8px9pboyy6KOy3bqp4a0Z5z6ZYUOwl5uL3gvikNp32PxdhEShn
	 +1l34Jm1pSncnZ04pKJE28EBPo92J3z2zxhHxck7Y5tQ/WgyJzRIkxrOkdjnq8WEpcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kO1v+Rjy;
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DE4606A336
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 16:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01DE4606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kO1v+Rjy
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-702fd86d674so3116198eaf.2
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 08:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794847988; x=1795452788; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VP7DDRUVGo0CSGEb63lpwJNrvx2CbLF1KeHf8Yfc8UE=;
        b=kO1v+RjyMfd21G8uhXlXTTkqKgCjH/ix++kmmJggawFoXgugqK7ReQqC1OPmsj6Iqc
         11GPg6D/LlalUK7pGLh2QA246PjCafW41IJadGMdiVoRY3TxSGhy4YFCQac+ly/huFrV
         1dYRgv29eM2V68PzGAhfgkK/xUFb8w6uxGuvQWLt8VF+wDlH4ugShPdSPPOaO6bZLC/L
         lABUmpeZ97Ef8JJ/n1arkomSCSSUvKXI61T1KCL2Z5TvXtkDXMV6+E9Ds+YQPOscOuZs
         yJg5mZ/p8xxr3EVr43fu4z1US+Kjg8VtpakAdmyWsT1nKOJTzfmpd8AdnElIxOJN650k
         Ze+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794847988; x=1795452788;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VP7DDRUVGo0CSGEb63lpwJNrvx2CbLF1KeHf8Yfc8UE=;
        b=vLf1qL3aotniC8jxOE/buOmHYO0JNc/oNLcII/J6ecPqmyGTeyZIc+qDSxoxfY4Evd
         eDm6aK4tjavzmTogdxKNijefUCkjac8PMlNwpc2rOYiwoC3jIO+baSB3sXomY4KuGNc2
         MdChG7j+bwH2E7cXxiDfXKkEP0XdrDcNKVRG9Cpk7vIgtU/ciprWZCl9WpVRqqc44zGK
         St3/3ZQq/ZUqd42AyT4DZqvu/g1Sh9ZBk2zjV/ZwrZ/SFnYIisyJJAteMyWUbweAUXGJ
         GfJkvmfXk2ZOeZFZMw78VUsQuvROP3n6AXzhmKZSdExZZMqUGEehTwDozPQry36zH4I9
         cP/g==
X-Forwarded-Encrypted: i=1; AL+hErHY7okuoIYt1jKWOOxR1huDWwVsVxerWlm9nF/7bQZJDhChtzmENNhP+TL3zM9uuzoHX46QWKq1HEW5BPnYvrk=@vger.kernel.org
X-Gm-Message-State: APuU4Z82T4h0XY3jgs6s/RMBWwTTSog+T6twc5YgKj0upRx4Kxb1KZoe
	JfM/XHAqTgxiUkZX03ZxA5TAHvjxNwujkt0cudU1fug5lHxwkHM8/dcd
X-Gm-Gg: AYBFou3w2Vxqia1QmUmCJH1nvOjJGoMGgNC8T/+3EHn0BbuifEHkU4ipnqzuvbKgBev
	G7JhZ/7/071t5QeRICJf0a/rxuyf/iqq6vbn8odE0Ybk1bD5yZ8YrrzRNu4+MF3aty4Bpge6qFR
	7vNN6Fo6HizWenLn4LbhRExeeFdjnPDMtX7h5obZS5tRgmKR8HQtpN2/5MBycRQDqPEXE9lc7eP
	M2KdEoC213dxxh9eD6imSU1mwvezmvzC8fs2zJyU9nsmUq4Kc896rhCq+B0YBW5+7+MKVbCUfRX
	DcSkU9LEw8SEEqhjjokE9oeRk4nO9D2SutYXwN3xjr0gRdXgI8mFRB5uktP4wTg2orjMEYkEvzL
	MpEXSTCzjs1UOPI95m/bvtsd3HTER+JMwzSqHZZ6mCQuVidff6Fr45KGSYFJqsSrfYaJeRWqF8o
	8AnDRxE/w5vkQelRBFxv4jySgJ539y/qOCMvBVL+D7IotZuXwnsxqNXvy8jYuLDBEZPfZG0Y0Rc
	IGf6p08K3dAfUSaXcPiZZTxowVCrGZV814sJql0BjjEXCzbXvG9k74sMkDCaNLiuUvwN7lkBp2f
	C8K9Iv5mKUSF18NelR2mcatGtoD7eihDwXUs+QgTHBh08b1e565BFZFDUhMl4w==
X-Received: by 2002:a05:6820:f02a:b0:715:2424:b6c7 with SMTP id 006d021491bc7-71ab4cf88a2mr7713750eaf.2.1794847987690;
        Mon, 16 Nov 2026 08:53:07 -0800 (PST)
Received: from ?IPV6:2620:10d:c085:21e8::1224? ([2620:10d:c090:400::5:1080])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm9069522eaf.6.2026.11.16.08.53.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 08:53:07 -0800 (PST)
Message-ID: <8239025c-66d0-4a63-89f0-acb97bc99456@gmail.com>
Date: Mon, 16 Nov 2026 08:53:05 -0800
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
Subject: Re: [PATCH net v3] selftests: drv-net: pause: Avoid cleanup failures
 for unsupported link settings
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 maxime.chevallier@bootlin.com, linux-kselftest@vger.kernel.org,
 hmohsin@meta.com
References: <20261113022717.1914724-1-mohsin.bashr@gmail.com>
 <179479615614.3136.17810537023382462405@kernel.org>
Content-Language: en-US
From: Mohsin Bashir <mohsin.bashr@gmail.com>
In-Reply-To: <179479615614.3136.17810537023382462405@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/15/26 6:29 PM, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] The patch removes the unconditional restore of the pre-test
>    link state from pause_setup(), and pause_test_support() does not…
> 
> --
> 
> selftests: drv-net: pause: Avoid cleanup failures for unsupported link settings
> 
> This patch changes pause.py so that link-setting restores are queued only
> after a link-setting request has succeeded. Devices that cannot change link
> settings therefore no longer fail during cleanup. If no link configuration
> change is accepted, pause_test_support() falls back to checking forced MAC
> pause on the current link, and pause_autoneg_link_autoneg() now queues its
> own autoneg-on restores.
> 
>> diff --git a/tools/testing/selftests/drivers/net/hw/pause.py b/tools/testing/selftests/drivers/net/hw/pause.py
>> index ca4a55e59c30f..c3398c7452e01 100755
>> --- a/tools/testing/selftests/drivers/net/hw/pause.py
>> +++ b/tools/testing/selftests/drivers/net/hw/pause.py
>> @@ -402,16 +402,13 @@ def pause_setup(cfg):
>>       if "auto-negotiation" not in link:
>>           raise KsftSkipEx(f"{cfg.ifname} doesn't report its link modes")
>>   
>> -    if link["auto-negotiation"]:
>> -        defer(cmd, f"ethtool -s {cfg.ifname} autoneg on")
>> -    elif "speed" in link and "duplex" in link:
>> -        defer(cmd, f"ethtool -s {cfg.ifname} autoneg off speed {link['speed']} "
>> -                   f"duplex {link['duplex'].lower()}")
>> -
>>       # Local interface admin up, link aneg on
>>       ip(f"link set {cfg.ifname} up")
>>       if link["supports-auto-negotiation"] and not link["auto-negotiation"]:
>>           ethtool(f"-s {cfg.ifname} autoneg on")
>> +        if "speed" in link and "duplex" in link:
>> +            defer(cmd, f"ethtool -s {cfg.ifname} autoneg off speed {link['speed']} "
>> +                       f"duplex {link['duplex'].lower()}")
> 
> [ ... ]
> 
>> @@ -470,9 +463,12 @@ def pause_test_support(cfg, pauseparams):
>>   
>>       forced = forced_link_settings(cfg)
>>       _, supported = get_local_pause_supported(cfg)
>> +    link_config_tested = False
>>   
>>       # We check that what we can configure in the pause params matches what we
>> -    # support under various contditions : Link aneg on/off, pause aneg on/off
>> +    # support under various conditions: link aneg on/off, and pause aneg
>> +    # on/off. If no link configuration change is supported, fall back to
>> +    # checking forced MAC pause on the current link.
>>       ret, _ = ethtool_ret(f"-s {cfg.ifname} autoneg on", is_get = False)
>>       if ret != 0:
>>           ksft_pr("link autoneg on refused, not tested")
>> @@ -481,18 +477,23 @@ def pause_test_support(cfg, pauseparams):
>>                                  "link autoneg on")
>>           expect_pauseparams_set(cfg, pauseparams, True, supported,
>>                                  "link autoneg on")
>> +        link_config_tested = True
>>   
>>       if not forced:
>>           ksft_pr("link speed unknown, the forced link is not tested")
>> -        return
>> -
>> -    ret, _ = ethtool_ret(f"-s {cfg.ifname} autoneg off {forced}", is_get = False)
>> -    if ret != 0:
>> -        ksft_pr(f"link autoneg off {forced} refused, not tested")
>> -        return
>> -
>> -    expect_pauseparams_set(cfg, pauseparams, False, supported, "link autoneg off")
>> -    expect_pauseparams_set(cfg, pauseparams, True, supported, "link autoneg off")
>> +    else:
>> +        ret, _ = ethtool_ret(f"-s {cfg.ifname} autoneg off {forced}", is_get = False)
>> +        if ret != 0:
>> +            ksft_pr(f"link autoneg off {forced} refused, not tested")
>> +        else:
>> +            if link_config_tested:
>> +                defer(cmd, f"ethtool -s {cfg.ifname} autoneg on")
> 
> [Severity: Medium]
> Could this leave the local interface autonegotiating when it started with
> a forced link?
> 
> pause_setup() now queues a restore only when it enables autoneg itself,
> which happens when supports-auto-negotiation is true and auto-negotiation
> is false. If the port starts forced and reports
> supports-auto-negotiation: false, pause_setup() queues nothing.
> 
> pause_test_support() then sends:
> 
>      ret, _ = ethtool_ret(f"-s {cfg.ifname} autoneg on", is_get = False)
> 
> If that succeeds, no restore is queued for it. The ethtool netlink core
> does not check the Autoneg supported bit. In net/ethtool/linkmodes.c,
> ethnl_update_linkmodes() only does:
> 
>      ethnl_update_u8(&lsettings->autoneg, tb[ETHTOOL_A_LINKMODES_AUTONEG], mod);
> 
> The change is then passed to ->set_link_ksettings(), so the driver alone
> decides whether to accept it.
> 
> If the driver accepts it and the later autoneg off {forced} request also
> succeeds, the only restore queued is the hardcoded autoneg on above.
> Cleanup then leaves the link in autoneg mode.
> 
> Before this patch, pause_setup() queued "autoneg off speed X duplex Y"
> first. That restore ran last and put back the original forced settings.
> 
> The commit message says:
> 
>    Fix this by queuing link-setting restores only after a link-setting
>    request has succeeded.
> 
> The first autoneg on request in pause_test_support() can succeed and
> change the link, but no restore is queued for it. This only happens with a
> driver that accepts enabling autoneg without advertising Autoneg support.
> 
> Should pause_test_support() restore the link state it saw before the test
> instead of a fixed autoneg on?
> 

Thanks for the review. AFAIU this case is only possible if the driver's 
behavior is inconsistent. The case would require driver to report that 
it does not support autoneg and still accept AUTONEG_ENABLE. IMHO 
pause_test_support() is not expected to validate ksetting 
inconsistencies in a driver. I'd leave it up to the maintainers to 
decide if it needs a respin.

>> +            expect_pauseparams_set(cfg, pauseparams, False, supported, "link autoneg off")
>> +            expect_pauseparams_set(cfg, pauseparams, True, supported, "link autoneg off")
>> +            link_config_tested = True
>> +
>> +    if not link_config_tested:
>> +        expect_pauseparams_set(cfg, pauseparams, False, supported, "current link")
> 
> [ ... ]
> 

