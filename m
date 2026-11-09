Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794258805;
	b=VZPZZuSmTtC/fWvovQAlqDctAZR1fHKbzDKXD5Nz7kostz5r7AfKgx9fsy7H9rCqi8WA
	 ISNvX0Z9+6rx8ckVCpMQdiG8YJwNfb2t6czIa/XPs8g79LmGjH8A3xdSh1oqA2OXZ4Q0K
	 +I+AIpTIQHe1j5ygyzzGniq1e1vJgqtcvoqc9Tze7eLFydQpp7EdR53slohV6DEXYdQC6
	 xY3vgHeKQynObp+rXAyshe9TIaxjda3RxaF1ejRHlBYRRVe6uxZonEoGJ1y/2vqo5iSui
	 wa+BQiV2vIleoXRJ3UGF+GeTlfhKL0t+5xxK8iNpkLNT0ucplF5iwOJ5jcIB12hMM2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794258805;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=5ZNPQys28VTRtmsp1eXTTI33dx/ut9Rp+BrA0JVtHoQ=;
	b=L/u31bcBlsrnBPns0Se+S6tT1OsIUfmlCJBItBVde66xgWdxpoeFaFi5DzYKkMnMEaoB
	 s6jyUKJmP5gL+MEmPEd307na9YdpA86ngFuahL6rKNNqZa9n4qyQvmjFRMScg46onRSDj
	 rzcxJaCHKoPjg2nJXAGODnxrxZj7CCKcuOQ/Hk3sOCV8wwtQibev2m03BUK+einXYMG3J
	 kACwXREImbjYc9uz4B5qSaK48s1HJVgO6BSdQWHpKr4n8etwVBH1cTDvT11cWySZOhWEf
	 3wnkU3K6whIq/2xW+1N35cNzLH730SthewllDy3lw+bQztjVsHjkctEfLwJZdAXnTDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ENqfNuuA;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39F4606A31C
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 21:13:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E39F4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ENqfNuuA
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso2624362eec.0
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 13:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794258804; x=1794863604; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5ZNPQys28VTRtmsp1eXTTI33dx/ut9Rp+BrA0JVtHoQ=;
        b=ENqfNuuAFxyDL2IDpZPlk/BWUNs84NuuaWn4CO+fnEOfULkSa8HbTJ4U+kZwlqlZ3C
         wXY+JQ6xnUn4dYwEHrWpxzbXVd231h1DooLE27d0RTcwHx95glBTJSNtdhHinDKbZl9o
         +6ul5n/BABoey2/7NoIYpdVeUvS5PEV2wm6nikcO4AJsBHiLk5vPtXo6cr9pWUMENIRJ
         WOlOTx1Uze0G3Rv1m4ykEJELQXJLBISMV3810gx+PUTE6Q2hsv3qcs5xKbUpj1b12Y+P
         NT/VgKXLG68HuF5ExMEpgF3fua0t2jPUMi2jnId3PXwjxP8erBbaMIVebdf0ClaIRRaO
         ttnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794258804; x=1794863604;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5ZNPQys28VTRtmsp1eXTTI33dx/ut9Rp+BrA0JVtHoQ=;
        b=VxJRLK0R4+Dywj0W92tEy/qnD7ZwH4T4wpqC28BurDgpsAznthExXH9MCxoKR6R7tR
         GXOZOmgQV+tXSn20/bZoH6X3SgZBAqm7v0ktND2/7ZMcbH4hBLMtAdaMNqSRJORjAK1G
         dZpDtEY5iOenywsiWrBHGFjSN4HxAElqmmN/Z7NuDpI2Se+JQetaGLWF4cHAsBghZF6x
         bygLX2YRyN/vZFQsqZWnD/a1VaIrT2UyuEeft3b7vgaoUM7GAZ+fxQzPtBhopHGsEjXz
         LJB6MYkMkx6SNAAkcPf/IXl1VnoCavQJsdCwFoWsTFRzgNnJt8yHhY74rCpobIp19krI
         8vKA==
X-Forwarded-Encrypted: i=1; AL+hErEXSGZ4nSFR6YiZLDwQirrdvWlGIO8sr3tUIzWdFGkW9oPKVv//yslW42V+we0pMpGzCANXAKZkDghJ9iBtctI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7RkOAuwDbS44fu7PVPFR/0oArogeNRSCOSgvuqGXtuui2y6DK
	nFOo59Z+oj4pbV9gT/4zHqhNbBPjOq2kL1VNaiEfJej25U6+gCFvabWm
X-Gm-Gg: AYBFou1Q8maAlr6bLj4eYxga2bRVBJy6Pelc+dDQD6zHpPJ0RkCxk6+f/vO/jBewBIe
	vXOUkgpss2jVomUY6l8QRdFptZXtd+TIuYPR814lnvSfGaTS6O0mDVmqvSjNzxpp3JYr+to994d
	7x1fHtdclHfK+RMfLnGl4XZST8fOsR9lHUue+mTOJc9tZAHKsG6wm7jlfOOqVJBViPk4JWohj5I
	ffkQyW51l2Ou2H3F2aGZUPOezrxNbsUd/H8rRx/bq8sQzsmw1BMFoRnSV0baTwklLpInowS0iXk
	1dJQ/oyBR0U4rgFCr8w2efRGOY43Njs0MyLR4xJGAys85TOQFOhl6g8cX54GNUcNdYVqVlIdgKc
	kf5Gh1j3oE3LVGvO8KNEJTQEYeVDaLAoUb5MREOQ9FhIEGPiyJYG6m8tKCv15GWTyX21PXKqA+U
	MktNcRjOofYPYW2y5obHtIq3BH2Gt74YoOG7eCQ6U0SmD7yYWf5dY6kMlcIfCNWMK7c2CtldBJQ
	hIDQjrBjZcjbCksrTb1x2Ilp0HAPjwbdXXaJKhT9oGuo6KK9ETc1iFJNqF21ps/wR2VTQDuaxNX
	UxeFnJ2X6h4B+yJiiPtCZny1gg1wRbRZlhj0q33pac0Oz4Z40cnObklIsoQbZ0bQ4z2VIs5hGj1
	eYm9Aex8E/Xq+qRo=
X-Received: by 2002:a05:7301:6788:b0:36f:83e7:fb7b with SMTP id 5a478bee46e88-375202187famr859550eec.40.1794258803833;
        Mon, 09 Nov 2026 13:13:23 -0800 (PST)
Received: from ?IPV6:2a03:83e0:1151:15:c24:4ad9:f660:1904? ([2620:10d:c090:500::5:5de1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e76e2sm931984eec.24.2026.11.09.13.13.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 13:13:23 -0800 (PST)
Message-ID: <754d48b0-943c-471e-9e10-f8f23d35994d@gmail.com>
Date: Mon, 9 Nov 2026 13:13:22 -0800
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
Subject: Re: [PATCH net-next 3/3] selftests: drv-net: hds: restore HDS
 settings in ioctl_set_xdp
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, andrew+netdev@lunn.ch, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20261106031208.465456-4-dimitri.daskalakis1@gmail.com>
 <179424805404.994134.17832090759573772957@kernel.org>
Content-Language: en-US
From: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
In-Reply-To: <179424805404.994134.17832090759573772957@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/9/26 1:14 PM, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 1
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] The fix is incomplete: two sibling tests in
>   tools/testing/selftests/drivers/net/hds.py still change tcp-data-split…
> - [Low] The patch has no Fixes: tag.
> 
> --
> 
> selftests: drv-net: hds: restore HDS settings in ioctl_set_xdp
> 
> This patch makes ioctl_set_xdp() in the drv-net hds.py selftest call
> _defer_reset_hds() before it sets tcp-data-split to "unknown". The
> original HDS configuration is then restored when the test finishes, the
> same way set_xdp() already does it.
> 
>> diff --git a/tools/testing/selftests/drivers/net/hds.py b/tools/testing/selftests/drivers/net/hds.py
>> index 7f052c3196039..a1ea195743b56 100755
>> --- a/tools/testing/selftests/drivers/net/hds.py
>> +++ b/tools/testing/selftests/drivers/net/hds.py
>> @@ -254,6 +254,7 @@ def ioctl_set_xdp(cfg, netnl) -> None:
>>      """
>>      mode = _get_hds_mode(cfg, netnl)
>>      if mode == 'enabled':
>> +        _defer_reset_hds(cfg, netnl)
>>          netnl.rings_set({'header': {'dev-index': cfg.ifindex},
>>                           'tcp-data-split': 'unknown'})
> 
> [Severity: Medium]
> Is this fix complete? Two sibling tests in hds.py still change
> tcp-data-split, and they defer only a fixed reset to "unknown" instead of
> going through _defer_reset_hds():
> 
> tools/testing/selftests/drivers/net/hds.py:enabled_set_xdp() {
>     ...
>     netnl.rings_set({'header': {'dev-index': cfg.ifindex},
>                      'tcp-data-split': 'enabled'})
> 
>     defer(netnl.rings_set, {'header': {'dev-index': cfg.ifindex},
>                             'tcp-data-split': 'unknown'})
>     ...
> }
> 
> ioctl_enabled_set_xdp() uses the same pattern.
> 
> When "unknown" does not bring back the saved value, _hds_reset() falls
> back to setting that value explicitly:
> 
>         if cur.get('tcp-data-split') == rings['tcp-data-split']:
>             del arg['tcp-data-split']
>         else:
>             # Try the explicit setting
>             arg['tcp-data-split'] = rings['tcp-data-split']
> 
> The fixed resets have no such fallback. If the operator set "enabled" or
> "disabled" explicitly, and the driver reports a different value under
> "unknown", that setting is lost.
> 
> Here is the test order in main():
> 
>                   set_xdp,
>                   enabled_set_xdp,
>                   ioctl,
>                   ioctl_set_xdp,
>                   ioctl_enabled_set_xdp],
> 
> In a default full run, enabled_set_xdp() has already left the device at
> "unknown" before ioctl_set_xdp() starts. The new _defer_reset_hds() call
> therefore only saves that already-reset state. ioctl_enabled_set_xdp()
> runs last and leaves the device at "unknown" again.
> 
> Doesn't that mean this change only has a visible effect when
> ioctl_set_xdp is run by itself with -t?
> 
> The previous patch in this series, "selftests: drv-net: hds: perturb
> settings via ioctl in ioctl_enabled_set_xdp", edited
> ioctl_enabled_set_xdp() but kept its fixed "unknown" reset.
> 
> Could enabled_set_xdp() and ioctl_enabled_set_xdp() also call
> _defer_reset_hds(cfg, netnl) before they set 'enabled'?
> 

It's true that there is no visible effect unless the test is run standalone
or with a non-default config, but the point of the patch was to bring this
in line with set_xdp().

I'd leave the fixed "unknown" resets as is. _defer_reset_hds() handles some
additional scenarios, but as in my reply on patch 1, netlink reports state
rather than config, so no reset can cover all cases.

> [Severity: Low]
> Should this patch carry a Fixes: tag? Commit ee3ae27721fb
> ("selftests: drv-net: hds: restore hds settings") added _defer_reset_hds()
> to set_xdp() and the set_hds_* tests, but not to ioctl_set_xdp().
> Something like:
> 
> Fixes: ee3ae27721fb ("selftests: drv-net: hds: restore hds settings")
> 
> The test itself was added by 29b036be1b0b ("selftests: drv-net: test XDP,
> HDS auto and the ioctl path"), which would also be a reasonable target.
> 

This change is not critical enough for a Fixes tag.
