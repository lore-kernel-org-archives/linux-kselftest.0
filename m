Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794257999;
	b=vRjnKNnUE5ZiHX0ok+MBF6JXlYVef08j8S/GOrOrRhB4a/5UaEcXKV15aTE5+K/XhCI+
	 alOKH/bppZV93WjvwNL6Y4woI7nPEiXSwMDmE5Z+iedJ5ET176uSvP47qlnyeKQC4YnrY
	 UUqI0bvDrTFRx2IGLp0SDElNVlSLIm7/vokA7LrwO9irgmizZnYvusJvVvAuKmZfYjOTA
	 lp4tr2mmxBHkAQsJ+rooBoVuUoqlfHmgVgxcW01Bf2rAkmx6Zw04rJXFOdgvKD9MtjTXH
	 SwyYxrHcAQHPHfCUxIJFpUSoa4uqdX0T9zUYdQtyZLIeTgq6HXWYETZbfc9CoToBkHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794257999;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=oF/gfE30dMXc9IOZaLbHhTubdGZyqdfEDEejk3ikt7o=;
	b=Vul2CGDmX3wuHUZj/0rJgGEW2thCV9zgIRzLXRDhVev6TmZ4CzA2T3Km33kWckMj6qDl
	 nQedk9B08ldBED4XU9uaMf2ErTNlc8fvQuq1En7b8FwktWgDYBCVxsyqMboCrueMQxEcZ
	 Af0HvsoLINy39DoCpGNvj46FBEfBYizdrLoISCLz7B20bbbQNTndKIHNflbmFuLB7dNO1
	 9egfgbF2LIwcb/a3Chqp3UxM2nWo0LyeY0f2s7b1638cq3WJz7vNclK1PYztHbixIWry1
	 xfEpqeDg9JdtTVOkjD93QAWNZkdhgIg2YF3x6DsoVX6dfI1AAQyqlOTdgEd5BqSkcyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wqJGJpMn;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C03606A31C
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 20:59:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4C03606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wqJGJpMn
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36fb88ea38cso1641861eec.1
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 12:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794257998; x=1794862798; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oF/gfE30dMXc9IOZaLbHhTubdGZyqdfEDEejk3ikt7o=;
        b=wqJGJpMnhHbFB1KeugM8sLLQe3eyRfs/1VXtFeZMS9zvrNmCSfULmk97THATUvYt+U
         jLui5yYlepy5SQpn/W70aNTi2L25r78cw/Cpn8COofRJKoOsman46lACtGeTOH7bVc+y
         H1YcLtMr1wRNZMfs87zT1SmPup+h3b15CT4Zdcmd+FsaPwEWDz7cYBZOK/qNKx0yFviW
         Y69Lowe1nXtfa/u+DKbtDGqTgMrznHx7UlIefA2jPgPMxsbkKan1dJrFArEOC0Vn+QIR
         u6rctY6j0G4Ex2T75B6GVtU5T4oPxQ5YgnZ42J73GxxeJOWfJtS4WuBGJtxbChXkz9IT
         sPfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794257998; x=1794862798;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oF/gfE30dMXc9IOZaLbHhTubdGZyqdfEDEejk3ikt7o=;
        b=yNjkqHpK1EadJp8GbZyt35jYE1MZZldhgqms/pIdURm/ogO3DvicXcjTPLpefZ5jBY
         xq0MAiT+sD9HedqJUkN8iEGOeJ8IlrwG2AtUWNQ8Eted5AvxPNkp+yuVDtefIgcLXd+q
         YAMc/4XMzaJ/k+kFIS5QYYJZcs09tPkMh/Fv7oo0+cpFyYTlf2x433x06jYtMX1QFGEu
         NYiNPdSnNxB9OKKdqSj0Tzxjr0+hCAGxTBMydGZh5ZnGYiYlsz+hbjN3HQ7ER9MzJyzx
         5A1l/dwfjChfLKkMkG/d2TLna1LK3d/HyGBI8+IDGrpfDpyFcmlhZW3sfgkZb1/+q+zn
         AXSA==
X-Forwarded-Encrypted: i=1; AL+hErHNw+9uO4YNtP5IMte7ywKxcpikgcGhh4NAtfaarlrdDokbbe23g5Csg3a64PSWorCXmsWESg3OChLfIl3DSIg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LQ6PUNDPTBvk/5SQDLjcSLAj4eVf4WNfRNephfoHvrod7n+5f
	frh4pTK64uDeCBT50fLXsQr+GBDOrwedeXCgmbYqRqajVSdQclJQRq8u
X-Gm-Gg: AYBFou3uDVp8m6rooZgr+0tloDEjFcOWs690UrdEQIN4LzBWEKU70mae2KW9XygMLaC
	kahUkdygqZDNbMu4i7k7+lNel682PAsSVwft2UO2jqdxHkJE4t6/knnw3HemnRCWwOYoAWufes6
	FZLnDeA8ZsW1PIoMXYQIrkNNo8tK9PzAPSqO0aB3We0ZPTe49ZfdU1/ditJ32xQnrPe8VXIFqUT
	abQFton42pAI/v9hZey2TSAKFk2ZOL0WaTg09btpNkKhes6sDYT4cdrV6YNuyk9gLFB7cb+Ihi5
	FpZBEFpVTSi5zM3E1ydFhtmUV3J2fnFWpePAUT1yklzImdMJmDvw1dZ1T10KGR6PV/JOQ0w4McU
	V22CeKgWJ0r13EwdEKZFLnsNiLr15qKNQNxI53cLFqL2+I7Usx5VFH0Sab5Yc6uf8k/At7EFyja
	MwJZ8Me+rce46HLhEvJTYp1pDgX8SX3y9SH0fDIr3zJi7xlbLAeExlMEwgYskigJVX3MzoJ3C7K
	DtTlLt0LrXiAbKKgDpGM5JADEorQzRuvy0z42RgAz6qJu5pQLcyHtwt3orwhIUc7dcX1QJNjV5I
	BvRAJGRJ1kqOw7KQazbM7smIVPRp4vkk9rr4/G0nLaeJ7mCc1sHXLZ8dnzVvEFaMk3H7wPtnm/y
	U0ss3yS8acrXGh/WNFTJ67dgvMcvoTg7cfowk
X-Received: by 2002:a05:7022:ea47:20b0:184:40db:6bb9 with SMTP id a92af1059eb24-1b3b5e1676fmr903499c88.8.1794257997532;
        Mon, 09 Nov 2026 12:59:57 -0800 (PST)
Received: from ?IPV6:2a03:83e0:1151:15:c24:4ad9:f660:1904? ([2620:10d:c090:500::5:5de1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b4b90csm1235562c88.14.2026.11.09.12.59.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 12:59:57 -0800 (PST)
Message-ID: <5357120d-51e3-487b-9611-6c1800348bc7@gmail.com>
Date: Mon, 9 Nov 2026 12:59:56 -0800
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
Subject: Re: [PATCH net-next 1/3] selftests: drv-net: hds: always restore
 tcp-data-split to auto
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, andrew+netdev@lunn.ch, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20261106031208.465456-2-dimitri.daskalakis1@gmail.com>
 <179424805285.994134.5389999211002090081@kernel.org>
Content-Language: en-US
From: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
In-Reply-To: <179424805285.994134.5389999211002090081@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/9/26 1:14 PM, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 1 · Medium: 1 · Low: 1
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [High] The new guard in _hds_reset()
>   (tools/testing/selftests/drivers/net/hds.py:68) is `if 'tcp-data-…
> - [Medium] _hds_reset() now writes tcp-data-split='unknown' whenever the
>   attribute was in the baseline snapshot.
> - [Low] The commit message does not match the code or the tree: (1) The
>   subject says 'always restore tcp-data-split to auto', but _hds_reset()…
> 
> --
> 
> selftests: drv-net: hds: always restore tcp-data-split to auto
> 
> This changes _hds_reset() in the hds.py selftest so that tcp-data-split is
> reset to "unknown" whenever the attribute was in the saved ring snapshot.
> Before, the reset only happened when the reported value had changed. The
> reason given is that bnxt and mlx5 report the current HDS state rather than
> the configured value.
> 
>> selftests: drv-net: hds: always restore tcp-data-split to auto
> 
> [Severity: Low]
> The subject says "always", but the reset only runs when the baseline
> snapshot contained the attribute:
> 
>     if 'tcp-data-split' in rings:
> 
> The body's "when it was reported" qualifier is the case that leaves mlx5
> unrestored in this tree (see the _hds_reset() comment below).
> 

The last sentence of the patch phrases it clearly,
"Always reset tcp-data-split to "unknown" when it was reported". If this
needs a re-spin I could amend the commit message, but this issue does not
justify a re-spin.

>> mlx5 will report enabled or disabled based on whether
>> SHAMPO is active, and an explicit "disabled" keeps HW-GRO off.
> 
> Is this describing a pending mlx5 change? In this tree
> mlx5e_ethtool_get_ringparam() never sets kernel_param->tcp_data_split. That
> means this selftest change seems to depend on a driver patch that isn't
> named.
> 
> Could the dependency be stated, so the patches get ordered correctly?

This is a pending change, I've held off on sending v4 until this series
gets merged
https://lore.kernel.org/all/20261009025137.2631215-1-dimitri.daskalakis1@gmail.com/

> 
> Should this also have a Fixes: tag? The conditional reset came in with:
> 
> Fixes: ee3ae27721fb ("selftests: drv-net: hds: restore hds settings")
> 
> and the leak already happens without the mlx5 change. On netdevsim,
> nsim_get_ringparam() reports ENABLED when hds_config is UNKNOWN:
> 
> drivers/net/netdevsim/ethtool.c:nsim_get_ringparam() {
>     ...
> 	if (dev->cfg->hds_config == ETHTOOL_TCP_DATA_SPLIT_UNKNOWN)
> 		kernel_ring->tcp_data_split = ETHTOOL_TCP_DATA_SPLIT_ENABLED;
>     ...
> }
> 
> So after set_hds_enable, the old code sees cur == rings and skips the
> reset, which leaves hds_config at ENABLED. bnxt_get_ringparam() reports the
> BNXT_FLAG_AGG_RINGS state, so the same leak happens there whenever TPA keeps
> the agg rings on.
> 

This selftest behavior is not severe enough to warrant a Fixes tag IMO. I
was unaware that netdevsim had this issue, but called out the existing bnxt
behavior.

>> diff --git a/tools/testing/selftests/drivers/net/hds.py b/tools/testing/selftests/drivers/net/hds.py
>> index 606e26d75951f..af34dc9ce7499 100755
>> --- a/tools/testing/selftests/drivers/net/hds.py
>> +++ b/tools/testing/selftests/drivers/net/hds.py
>> @@ -65,13 +65,13 @@ def _hds_reset(cfg, netnl, rings) -> None:
>>      cur = netnl.rings_get({'header': {'dev-index': cfg.ifindex}})
>>  
>>      arg = {'header': {'dev-index': cfg.ifindex}}
>> -    if cur.get('tcp-data-split') != rings.get('tcp-data-split'):
>> +    if 'tcp-data-split' in rings:
> 
> [Severity: High]
> Does this new check skip the restore in the exact mlx5 case the commit
> message describes?
> 
> In this tree mlx5e_ethtool_get_ringparam() never sets
> kernel_param->tcp_data_split. So rings_prepare_data() reports
> dev->cfg->hds_config, which defaults to ETHTOOL_TCP_DATA_SPLIT_UNKNOWN (0).
> rings_fill_reply() only emits the attribute when the value is non-zero:
> 
> net/ethtool/rings.c:rings_fill_reply() {
>     ...
> 	    (kr->tcp_data_split &&
> 	     (nla_put_u8(skb, ETHTOOL_A_RINGS_TCP_DATA_SPLIT,
>     ...
> }
> 
> That leaves the snapshot taken in _defer_reset_hds() without a
> 'tcp-data-split' key. mlx5 does report 'hds-thresh', so _defer_reset_hds()
> still registers _hds_reset().
> 
> After set_hds_disable, hds_config is DISABLED. In the cleanup the new check
> is false and hds-thresh is unchanged. len(arg) is 1, so rings_set is never
> called and the device stays explicitly "disabled".
> 
> After set_hds_enable it stays "enabled", and mlx5e_fix_features() then
> forces HW-GRO on:
> 
> 	if (cfg && cfg->hds_config == ETHTOOL_TCP_DATA_SPLIT_ENABLED &&
> 	    !(features & NETIF_F_GRO_HW)) {
> 
> The old condition did send "unknown" in this case, since cur 'disabled'
> differs from rings None. It then hit a KeyError on cur['tcp-data-split'].
> With this patch the restore is silently skipped instead.
> 
> The fix only works if mlx5 always reports tcp-data-split, and that driver
> change isn't in this tree. Would something like this cover both cases?
> 
>     if 'tcp-data-split' in rings or 'tcp-data-split' in cur:
> 
> The later comparison would also use .get() on both sides, so that a
> missing attribute means "unknown".
> 

The reset is currently failing with a KeyError since mlx5 does not report
the attribute. I will send v4 of a patch to report tcp-data-split in mlx5
after this series is merged. Without this change, mlx5 will get left with
tcp-data-split disabled, and the HW-GRO tests can end up failing.

>>          # Try to reset to "unknown" first, we don't know if the setting
>>          # was the default or user chose it. Default seems more likely.
>>          arg['tcp-data-split'] = "unknown"
>>          netnl.rings_set(arg)
>>          cur = netnl.rings_get({'header': {'dev-index': cfg.ifindex}})
>> -        if cur['tcp-data-split'] == rings['tcp-data-split']:
>> +        if cur.get('tcp-data-split') == rings['tcp-data-split']:
>>              del arg['tcp-data-split']
> 
> [Severity: Medium]
> Can this replace an explicit tcp-data-split=enabled, set before the test
> ran, with UNKNOWN?
> 
> With the new check, "unknown" is written for every test that calls
> _defer_reset_hds(). That includes the tests that only touch hds-thresh
> (set_hds_thresh_random, set_hds_thresh_zero, set_hds_thresh_max,
> set_hds_thresh_gt) and tests that skip early. Whether to keep "unknown" is
> then decided by comparing reported values, which can match even when the
> configured values differ.
> 
> On netdevsim, nsim_get_ringparam() reports ENABLED for both UNKNOWN and an
> explicit ENABLED. Say hds_config was ENABLED before the test:
> 
>   - ethnl_set_rings() commits hds_config = UNKNOWN
>   - the re-read returns 'enabled', which matches the snapshot
>   - the del runs, and the device is left at UNKNOWN
> 
> On bnxt, writing UNKNOWN clears the flag in bnxt_set_ringparam():
> 
> 		else if (tcp_data_split == ETHTOOL_TCP_DATA_SPLIT_UNKNOWN)
> 			bp->flags &= ~BNXT_FLAG_HDS;
> 
> If TPA keeps the agg rings active, bnxt_get_ringparam() still reports
> ENABLED, so the explicit HDS setting is dropped.
> 
> Before this patch, cur == rings in those tests, so tcp-data-split was never
> written. Memory-provider binding requires an explicit ENABLED:
> 
> net/core/netdev_rx_queue.c:
> 	if (dev->cfg->hds_config != ETHTOOL_TCP_DATA_SPLIT_ENABLED) {
> 		NL_SET_ERR_MSG(extack, "tcp-data-split is disabled");
> 		return -EINVAL;
> 
> After running hds.py, a devmem or io_uring zcrx setup that had explicitly
> enabled HDS would no longer be able to bind.
> 

This only matters if a user explicitly changes tcp-data-split before the
test. Resetting to "unknown" is the common behavior across selftests
that modify tcp-data-split. It's not possible to get this fully right from
the information netlink gives us, since GET reports state, not config.
