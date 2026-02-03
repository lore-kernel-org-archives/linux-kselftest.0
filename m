Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150442DEA87
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Feb 2026 10:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770113817; cv=none; b=HO2MUBSsBet4tHJVkLTDaaNLjB7d6j6XEFh+Jv3Sq8n4LKrlE69PkBxRSLgN/PI1TZ/aWoIRugwyk4J+BbU3TZgWwGqkDVsFz7/CgGA1Vm+8mrkUYDxAh5/r4WMsFinTz/Udd/at6iNsDdKlQ3pBgQq2tNkXE9Qoow2RxYsVLss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770113817; c=relaxed/simple;
	bh=zzrjZPXfYdNR5ur4+DAFLb38Y57K+9PEFWBPSbmtPds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pqdIyjItju2k+8gsywnj00GSw/nF2okBWXRNSFUsnpoTxoiJfPUmPwjVaQsLJlTZ13Aw2BjNbLgxMlGnQYY7iKyQFpYGH6roFlainDwlUIcdufVcjKB0ho/Lg0/SLpou1MYlXUzA8RTOD3O+LfvU0+h88jLBSqeNHZUheHfQ8Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MGuhu8HX; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=WZorrZ5s; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MGuhu8HX";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="WZorrZ5s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770113814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HgOiGNLBCV5ZuGn9jd9GSFwjMR0aHZj7c6CyZV90AEY=;
	b=MGuhu8HXuyG6Z429aoDjYzvFlU1JTzTGQ5uoHjFD7doV7TiRmvGV2u4P5hGhAWlf2+a9oc
	8FJ0nmHLsT9v7FoXtQkKqxT+kK9MZdaGvWF660JPvtAh4Uh/5vMqR88FzqzhpkWED2Lq7/
	A9PpLxPMmRYTFW1b6ZG/SiW6SG1H9i0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-569-w-iGu8Z3PZuEwNTRYhkquQ-1; Tue, 03 Feb 2026 05:16:52 -0500
X-MC-Unique: w-iGu8Z3PZuEwNTRYhkquQ-1
X-Mimecast-MFC-AGG-ID: w-iGu8Z3PZuEwNTRYhkquQ_1770113811
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-435ab907109so3629930f8f.3
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Feb 2026 02:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770113811; x=1770718611; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HgOiGNLBCV5ZuGn9jd9GSFwjMR0aHZj7c6CyZV90AEY=;
        b=WZorrZ5sXghZyCstwYDVxGn/NNSD+stCSM7fCSmT+ZCg4OQJRIFql2rrnL55Xdj70H
         VAvxlw9E41FKVBWb0J/r37OCzbc2HUiK2h+q66/bvPUOG99Qca5voqbe+4qDFXhqyco0
         tgfEeLadXSpjD4fE3z49eoruA4VKz/hUM8ZdAzRP3EexmewG9SdZfLcagMs0TA+zY3cO
         UFwr84jXbM9Y+4MBpzS08yLeepq/8Nf7lpm1D2yFC43FlUiRjqbbH8QUutSqCdGc+jZD
         kPsxrxxtyCAfszKZRBksDTASbfFLxH/CxFYBRHzdkeSrRAVTUQn9yb/2vThgJgYKQwkq
         cPvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770113811; x=1770718611;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HgOiGNLBCV5ZuGn9jd9GSFwjMR0aHZj7c6CyZV90AEY=;
        b=RQuVnAKc+kgH5PgF9we5fmveUkHXtJH6DBCgFb1ASlLki/knPHpbNk5vo3AhUaswvE
         pCfnDuj/PUJoth9zPBnWrT5jt4IswVGWaJGXcBgKyPXi1U3DCq4M4DzykODqxrZiBcli
         lqWXtUn4CC9XlzKHPwN8H3yJaL85uL8+4s/WMlukbn3HxpkDjJvENj083gXywRe+3mSL
         /DWaZFEtPYoJ4Q6Yypcwz9j3BBvUsKH5shFNhiq4CE2/M49OG7CyZ0BFdC00Ka09ElrO
         6dYFXf4M17Y88nTFP63lPRk/WO7QjJ73JRINjWu2kjEE1GHvbePFa86dTjE7AokGWkbx
         jrDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRxOfFHR694IWyBYnQ//UcJALPLJ43c9Su5e0h8XMMU3UK1hWD/vA43jeAnrB50XfaGKMiMmPqALHKesdIOZk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/siC+MwoWdnvSFowFGZwr9xv9Fh9nZVLaoEGZadFq/+nANXZL
	3oSWv+4hYtAZNzVIrMxoshxDc2MPu9nbH/GS5TOmkQfNK7A7Cbusc8jZW63NUOkQme0Sj2pcx6K
	5Dk5Vzz1kPULi8mSA1f3EtzM+ix1BWIxMDlcirBIFIyuR5ypGBhZUUUadvjOKIP6e/XbUow==
X-Gm-Gg: AZuq6aLKJRA+1OnaJlgsx3/ZFxSfFaXS9DZ8HiRX3sgDv5WD2mtAhmOcUirMBsRYHRI
	CDVfmlI3t4pgFv23WKpCoAZCtL28Gf2nAiyExWr3EZUIl4qw2Z49KhGszkekaB/etXS52A7dFcr
	Y5vBuYEPNxuqG2QM5WIF5uy3KhWabTN0b/SBCUvz4GA9AAsr7RXY2h+t0dR+Kl/dAIm2xDrBTs8
	SIvj8fs5bOT8bVF5KO0bmTUi8fwy5gOv5dM/SYYSsL7eEFCHwPaDpUaa6MR5qaWP1PjBgGCgd3s
	y+JsnaRaU/Kw9cGC2yo/bzmhsbe440yxOZZjS007zkZhwnPv4U/8kKez+4tOH3+AQJo4UAeLng5
	MaRnLxaNroqk=
X-Received: by 2002:a05:6000:1862:b0:435:729b:c390 with SMTP id ffacd0b85a97d-435f3abb192mr22523246f8f.47.1770113811389;
        Tue, 03 Feb 2026 02:16:51 -0800 (PST)
X-Received: by 2002:a05:6000:1862:b0:435:729b:c390 with SMTP id ffacd0b85a97d-435f3abb192mr22523181f8f.47.1770113810888;
        Tue, 03 Feb 2026 02:16:50 -0800 (PST)
Received: from [192.168.88.32] ([150.228.93.21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10edfccsm48741670f8f.17.2026.02.03.02.16.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 02:16:50 -0800 (PST)
Message-ID: <ce09e17d-2b74-4bda-a8ec-352c92659a6e@redhat.com>
Date: Tue, 3 Feb 2026 11:16:45 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 4/5] selftest: netdevsim: Add devlink port
 resource test
To: Tariq Toukan <tariqt@nvidia.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>
Cc: Donald Hunter <donald.hunter@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
 Jonathan Corbet <corbet@lwn.net>, Saeed Mahameed <saeedm@nvidia.com>,
 Leon Romanovsky <leon@kernel.org>, Mark Bloch <mbloch@nvidia.com>,
 Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Gal Pressman <gal@nvidia.com>, Moshe Shemesh <moshe@nvidia.com>,
 Shay Drori <shayd@nvidia.com>, Jiri Pirko <jiri@nvidia.com>,
 Or Har-Toov <ohartoov@nvidia.com>
References: <20260203071033.1709445-1-tariqt@nvidia.com>
 <20260203071033.1709445-5-tariqt@nvidia.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260203071033.1709445-5-tariqt@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/3/26 8:10 AM, Tariq Toukan wrote:
> From: Or Har-Toov <ohartoov@nvidia.com>
> 
> Add selftest to verify port-level resource functionality using netdevsim.
> 
> Signed-off-by: Or Har-Toov <ohartoov@nvidia.com>
> Reviewed-by: Shay Drori <shayd@nvidia.com>
> Reviewed-by: Moshe Shemesh <moshe@nvidia.com>
> Signed-off-by: Tariq Toukan <tariqt@nvidia.com>
> ---
>  .../drivers/net/netdevsim/devlink.sh          | 32 ++++++++++++++++++-
>  1 file changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/drivers/net/netdevsim/devlink.sh b/tools/testing/selftests/drivers/net/netdevsim/devlink.sh
> index 1b529ccaf050..674f0e981ab0 100755
> --- a/tools/testing/selftests/drivers/net/netdevsim/devlink.sh
> +++ b/tools/testing/selftests/drivers/net/netdevsim/devlink.sh
> @@ -5,7 +5,7 @@ lib_dir=$(dirname $0)/../../../net/forwarding
>  
>  ALL_TESTS="fw_flash_test params_test  \
>  	   params_default_test regions_test reload_test \
> -	   netns_reload_test resource_test dev_info_test \
> +	   netns_reload_test resource_test port_resource_test dev_info_test \
>  	   empty_reporter_test dummy_reporter_test rate_test"
>  NUM_NETIFS=0
>  source $lib_dir/lib.sh
> @@ -856,6 +856,36 @@ rate_test()
>  	log_test "rate test"
>  }
>  
> +port_resource_test()
> +{
> +	RET=0
> +
> +	local first_port="${DL_HANDLE}/0"
> +	local name
> +	local size
> +
> +	devlink port resource show "$first_port" > /dev/null 2>&1
> +	check_err $? "Failed to show port resource for $first_port"
> +
> +	name=$(cmd_jq "devlink port resource show $first_port -j" \
> +		      ".[][][].name")
> +	[ "$name" == "max_sfs" ]
> +	check_err $? "Unexpected resource name $name (expected max_sfs)"
> +
> +	size=$(cmd_jq "devlink port resource show $first_port -j" \
> +		      ".[][][].size")
> +	[ "$size" == "20" ]
> +	check_err $? "Unexpected resource size $size (expected 20)"
> +
> +	devlink port resource show "$DL_HANDLE" > /dev/null 2>&1
> +	check_err $? "Failed to show port resources for $DL_HANDLE"
> +
> +	devlink port resource show > /dev/null 2>&1
> +	check_err $? "Failed to dump all port resources"
> +
> +	log_test "port resource test"
> +}
> +
>  setup_prepare()
>  {
>  	modprobe netdevsim

This test is failing in NIPA (adding some more context beyond the
failing test output just in case it may help):

# Error: netdevsim: Exceeded number of supported fib entries.
# Error: netdevsim: Exceeded number of supported fib entries.
# kernel answers: Operation not permitted
# TEST: resource test                                                 [ OK ]
# Command "resource" not found
# Command "resource" not found
# TEST: port resource test                                            [FAIL]
# Failed to show port resource for netdevsim/netdevsim10/0
# TEST: dev_info test                                                 [ OK ]
# TEST: empty reporter test                                           [ OK ]
# kernel answers: Success
# kernel answers: Success
# ./devlink.sh: line 614: echo: write error: Invalid argument
# Error: netdevsim: User setup the recover to fail for testing purposes.

/P

