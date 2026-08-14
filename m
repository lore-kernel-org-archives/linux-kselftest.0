Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4B147CA73
	for <linux-kselftest@vger.kernel.org>; Fri, 14 Aug 2026 16:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786723279; cv=none; b=WjxhcRnDiaDMIQrgzwG7STfA1i3Zrzdfyesq/vE/HLITe0Sj2gdGCWKHaW9arDqadbrXM6c+TZfbwECpMrhc/J0dtsCVnmu+ikSGYO0KzDLRnYhiwnT8pSQEDJ9Pba2nrWcgWjgMW/iJUoRqToSqbDodKsmQPqZyG7WYcRBAkrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786723279; c=relaxed/simple;
	bh=rNrfs0FaNXburJEgTHw7yDZJVZHaYPI+pNh+AnbzYaY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QccrEdO2KiRc32fj50j9Vkv9zPYVy4aIPcSa22OlSadQ39CEgzFdVUHZ2KFVAqvHmtK8NtCn/SfUy6nCvHftpcDsm4BpCCpr7GsLRLe6WALETO+ijYGy3MuiJs1eKB5fhoj8BO6vGc2HPaNCoTRN6Pd2E17tCxQwaOW/NL6tnQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk; spf=none smtp.mailfrom=davidwei.uk; dkim=pass (2048-bit key) header.d=davidwei-uk.20251104.gappssmtp.com header.i=@davidwei-uk.20251104.gappssmtp.com header.b=DAPt418w; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=davidwei-uk.20251104.gappssmtp.com header.i=@davidwei-uk.20251104.gappssmtp.com header.b="DAPt418w"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7f3b01b8996so82406a34.3
        for <linux-kselftest@vger.kernel.org>; Fri, 14 Aug 2026 09:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=davidwei-uk.20251104.gappssmtp.com; s=20251104; t=1786723276; x=1787328076; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ph8e2S17sO79823wRzPrB7sqtzbti3Wq3iGZ04xqZ/s=;
        b=DAPt418wgy7CdjFTGWgpSSKKgG1sh7aJDX+45wyNF6sp/g3sLwPpItIBBHjfX+QA4S
         mX3WpOBq7An5amf20NEwrGzsshYHrLhnIjk9QO/SMBUy3F/hzvVCYIv6R0QowyQvyRBx
         evCiEXv7Ojw/7ivv0wPUAaI/AvQc9AM7/jw9f/2b/IBo/0hRYkLPzQMyoDADs5lNzDZW
         8e4VhhwzD8RtCA1psczzHd888N7Z2yYQwnGXhsGIIRE7HhVkHdpIu63Kw/qcsjtSgqox
         MDvhYZB6ZviB0jn2o9nBcssq9E8FH93h4tZAOhVokjJavbjlfStp+yKA4Lmw9rRlCSvp
         E+sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786723276; x=1787328076;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ph8e2S17sO79823wRzPrB7sqtzbti3Wq3iGZ04xqZ/s=;
        b=hbdywqgSTaaM+bjlw62oS/A6WrVgTfuv/mTaqflMR/6NZ/wGSvQ0Es/MHmQzA2o8JH
         IsARKzwoO6n3A9uiqbUXzU6/U7u+ISsUddS9QdInBPlub8Ip1rwdxoc6CZfwIg+4YZFR
         5DoOkE0lVnMhO2nehZu5iCL/D8/AlttrgmlwX/oO6rxoylXTrHru/RA/YS0owaumpoV+
         sqymhzN1TJ69mI8o6vdg3g6/ruTxjdx7luxxc5Z0WXUPaOXBYD9P8Aixv4of1IZnnZ4y
         oVQVkE4GDVmiAjksAdbaAmm/7R52T91cO+jGRvgBiMCTV9Q5C/9qxa0eNWYuclvy+/UX
         7CVQ==
X-Forwarded-Encrypted: i=1; AHgh+RoiMt77sNJfw3Ir0knHD0r3GSHZUW2ZuMTcbvD2MACXr3534zduCelB7XwklfhhpswINlMICl3jO7rZzzDKpGA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzOxsbPBw+P6GWTppMjuRLUPTO3vLtRuzxYFlrosu5hEQTAsU6
	MsWWJl+3lDnPVoIfA8hJWNjlYplhzPEsaJUe2y5rY+0JlfAfPKOTTLvF2r/d1wjypxw=
X-Gm-Gg: AR+sD10ZpiGSD0fuN6wVaGUzdstD++sge7tYmEx4wtSgNxKCfFsh8gBy0TdveP97xgw
	cMHoVehHQfczvKHHZJstQZOmbmy+3xL9i+NVnBrXX/aT4QoxUg0jGa4gxaB49iLPFX9J9fwi2jr
	umAzlUfxlD2fesvWq4eNrrdTl2w87Q4t9ou0QKlIgYxhkvw6//oWXJ+HjvAcrbGTYD5wVJRgfHG
	6Y1qDvWNpPpfbsAJiLYIm9VueoxayiuZYl3bWZVAz6PfC4qFh3JQp6mv18J8wLXhaMEf6xF5IcB
	GtefzJ9FcdmzaSuL/49SVY4dXwkgttzBZ9IZfF6HRzeOnfT8jJpg/yiN1/rtYtM4gRuv07eakyc
	Ax1wU6eZC5Xc7JVn5YI6xgOsUgojdXe3IVqrYdUqqVfUj/ZzJeUnnxpv0Ab8OddJwUMFc5OX1Ur
	JzKOyF1PMXYtRV2MExcQ7oAhvlRAD1TnF2pu5b5Y31dXPKNWo+bfbBlReF0SiM8W+daWR6h5Ie3
	FNAHsfKUbougZkI/8Mak71nBO6+3rsmbxNfr2wv7Hvsi/lVa5bZ4zYjfKuxFbPWv0HDfDE2Hg==
X-Received: by 2002:a05:6830:3809:b0:7e6:e8cd:bb7e with SMTP id 46e09a7af769-7f3de3c0a92mr5950094a34.4.1786723276137;
        Fri, 14 Aug 2026 09:01:16 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1156:1:c8f:b917:4342:fa09? ([2620:10d:c090:500::4:a11e])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f3e849474bsm1162324a34.2.2026.08.14.09.01.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 09:01:15 -0700 (PDT)
Message-ID: <a6dd543a-1622-400e-b389-2cb50923e7f1@davidwei.uk>
Date: Fri, 14 Aug 2026 09:01:13 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 6/6] selftests: net: add rss_multiqueue test
 variant to iou-zcrx
To: Juanlu Herrero <juanlu@fastmail.com>, netdev@vger.kernel.org
Cc: io-uring@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, kuba@kernel.org, asml.silence@gmail.com,
 pabeni@redhat.com, shuah@kernel.org
References: <20260814012348.46958-1-juanlu@fastmail.com>
 <20260814012348.46958-7-juanlu@fastmail.com>
Content-Language: en-US
From: David Wei <dw@davidwei.uk>
In-Reply-To: <20260814012348.46958-7-juanlu@fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-08-13 18:23, Juanlu Herrero wrote:
> Add a rss_multiqueue Python test variant that exercises multi-queue
> zero-copy receive on a single listening socket.
> 
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Juanlu Herrero <juanlu@fastmail.com>
> ---
>   .../selftests/drivers/net/hw/iou-zcrx.py      | 50 ++++++++++++++++++-
>   1 file changed, 48 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/drivers/net/hw/iou-zcrx.py b/tools/testing/selftests/drivers/net/hw/iou-zcrx.py
> index b7a225fe4beae..c833535d8a03c 100755
> --- a/tools/testing/selftests/drivers/net/hw/iou-zcrx.py
> +++ b/tools/testing/selftests/drivers/net/hw/iou-zcrx.py
> @@ -30,6 +30,13 @@ def create_rss_ctx(cfg):
>       return int(values)
>   
>   
> +def create_rss_ctx_multi(cfg, start, count):
> +    """Create an RSS context spanning count queues from start, return its ID."""
> +    output = ethtool(f"-X {cfg.ifname} context new start {start} equal {count}").stdout
> +    values = re.search(r'New RSS context is (\d+)', output).group(1)
> +    return int(values)
> +
> +
>   def set_flow_rule(cfg):
>       output = ethtool(f"-N {cfg.ifname} flow-type tcp6 dst-port {cfg.port} action {cfg.target}").stdout
>       values = re.search(r'ID (\d+)', output).group(1)
> @@ -127,17 +134,56 @@ def _require_ntuple(cfg):
>           defer(ethtool, f"-K {cfg.ifname} ntuple-filters off")
>   
>   
> +def rss_multiqueue(cfg):
> +    """Steer the test flow to a multi-queue RSS context for multi-thread zcrx."""
> +    channels = cfg.ethnl.channels_get({'header': {'dev-index': cfg.ifindex}})
> +    channels = channels['combined-count']
> +    if channels < 3:
> +        raise KsftSkipEx('Test requires NETIF with at least 3 combined channels')
> +
> +    rings = cfg.ethnl.rings_get({'header': {'dev-index': cfg.ifindex}})
> +    rx_rings = rings['rx']
> +    hds_thresh = rings.get('hds-thresh', 0)
> +
> +    cfg.ethnl.rings_set({'header': {'dev-index': cfg.ifindex},
> +                         'tcp-data-split': 'enabled',
> +                         'hds-thresh': 0,
> +                         'rx': 64})
> +    defer(cfg.ethnl.rings_set, {'header': {'dev-index': cfg.ifindex},
> +                                'tcp-data-split': 'unknown',
> +                                'hds-thresh': hds_thresh,
> +                                'rx': rx_rings})
> +    defer(mp_clear_wait, cfg)
> +
> +    cfg.num_threads = 2
> +    cfg.target = channels - cfg.num_threads
> +    ethtool(f"-X {cfg.ifname} equal {cfg.target}")
> +    defer(ethtool, f"-X {cfg.ifname} default")
> +
> +    rss_ctx_id = create_rss_ctx_multi(cfg, cfg.target, cfg.num_threads)
> +    defer(ethtool, f"-X {cfg.ifname} delete context {rss_ctx_id}")
> +
> +    flow_rule_id = set_flow_rule_rss(cfg, rss_ctx_id)
> +    defer(ethtool, f"-N {cfg.ifname} delete {flow_rule_id}")
> +
> +
>   @ksft_variants([
>       KsftNamedVariant("single", single),
>       KsftNamedVariant("rss", rss),
> +    KsftNamedVariant("rss_multiqueue", rss_multiqueue),
>   ])
>   def test_zcrx(cfg, setup) -> None:
>       cfg.require_ipver('6')
>       _require_ntuple(cfg)
>   
> +    cfg.num_threads = 1
> +
>       setup(cfg)
> -    rx_cmd = f"{cfg.bin_local} -s -p {cfg.port} -i {cfg.ifname} -q {cfg.target}"
> -    tx_cmd = f"{cfg.bin_remote} -c -h {cfg.addr_v['6']} -p {cfg.port} -l 12840"
> +
> +    rx_cmd = (f"{cfg.bin_local} -s -p {cfg.port} -i {cfg.ifname} "
> +              f"-q {cfg.target} -t {cfg.num_threads}")
> +    tx_cmd = (f"{cfg.bin_remote} -c -h {cfg.addr_v['6']} -p {cfg.port} "
> +              f"-l 12840 -t {cfg.num_threads}")
>       with bkg(rx_cmd, exit_wait=True):
>           wait_port_listen(cfg.port, proto="tcp")
>           cmd(tx_cmd, host=cfg.remote)

Reviewed-by: David Wei <dw@davidwei.uk>
