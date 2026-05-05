Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6A61FBC8C
	for <linux-kselftest@vger.kernel.org>; Tue,  5 May 2026 12:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777985171; cv=none; b=gH9y2HPRWp419p+NNkfV1lshbx0LCxHua2CydwXQM5bANiWgtoBPu3+x+z9Zs9GdRBq9VbUYr37O3KHcEtSZ0Nz6EqGv2Vug+U1Fg40THjqSmaCrv3Wdaji9DejOCQCi90uPMKVvSBj9O86QV8BRR71spB+h2vZYS6K0BcQSdAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777985171; c=relaxed/simple;
	bh=Q8btijusTbcegc0sKqIbzuRppMLBoN9sS7wsw7/34N0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cuBy+csocKgkd6nNKNGvIxrbdQmy3Y+PbuMHBJDX/7eiB59pHD6u8W6cnB56ABtAqOYeYc7bONaIgydPrPO5wGdB2rQPrig0Apay+u7zz7ncKiYkvNTTLVSeR2sgWToTmGnBu1vmyp/5/Rfp3qbQexPg7dHePC7IoALJCqZF+9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=BNWWAMYI; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="BNWWAMYI"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4836d9d54f6so7614825e9.1
        for <linux-kselftest@vger.kernel.org>; Tue, 05 May 2026 05:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1777985168; x=1778589968; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Dkf1zWYJ45ADlq6jCOSU1ASv+G9aemZGPgQNzFaPIQE=;
        b=BNWWAMYIFXoZX12qpQ7hLsVwU/KcJXp19soexbGq8VNA+U4upV1g8m0c2SNjQYCPHW
         +dgibYTK/dqM2+IjiYAk0vowleUFnXhLNGzHwNmki3yE6ESJl+Qv7ZP/iJFYsbgzRHqY
         +CgVi780LOmi8EThXIVBtoPX2DR/htxZav0WSx1MU2f6ycsQqttCO5660VDDlXggrGGl
         VAjjGlHH11G5lEGuIVFWe/TRJ+7K4vMuu+QdFYAmy31m7pWymZr6Ak/yOvBtr+9FOD/y
         Uet31M+4s3wx1ekAW3VFP/UrX5l2XjQQFJK68W0+JDllR/Lqw6o77731VeXRIbMmuzkh
         tC5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777985168; x=1778589968;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dkf1zWYJ45ADlq6jCOSU1ASv+G9aemZGPgQNzFaPIQE=;
        b=Ix5JmNYtGCmqWSpkGfPO+HVQmAYEvsdh3zctOOYWM1s2IhTDQPM1PxJ+GGz5p9rl78
         i/Ob5ygxu5V3hS2VHf3oA5bbz5tlF//wwxuMK92ukYvt+yxSgnfgjvPxWRYXgxmLqjrC
         uyrbIkNvRKkTOKh3IRb+TQNA+c2hnsGHYuFij2MpCVhZOiQG0mcRwmwer5YmAwki50OM
         xOP4zAzvcq7loeLIBRLOWXzUAjF2wJVc2/MX63KZZzXO9dpGO83XzwVsiVqfvUDaKmIo
         524zodAeJvFw31NgBczsqeT42HyFthKp1MUT8jn+z1E+61LDaCIxyUt/ojat2UgXYWpG
         V87A==
X-Gm-Message-State: AOJu0Yy0g+4o4Mr1znaVyAnR4XR2jvk72PmerXqwfObPeY3kE1/dxhWA
	ekRj+0f8ZKImB/CDAnSfcfDA5Gu0gtvSzd8DyMhEtWUaKgaE5ClVffmt0G1GpZKKYeI=
X-Gm-Gg: AeBDieusV2aD+CF+09q9FSiRL92CJ4fiENOv4sInxfYCUo8jNX4LrfZyViN7QquGXx3
	0FSoGms+aMaAraxutRjMx0FiuaDy0JAld63M3khfdG9gnEZkM+bKxQIl8ocYo35YreTBBLPWiSC
	3RQJvNyWJr1QMhgSBYxZ1IIfzPEp2ezAp0JGqCODgUJKhLJfqceib56vXkhlGz1wwgciKKdKaOt
	G6lvg7mVBrzmnixMsS2+43GQoVusDzaZr2SDXoN6yKCG+mgRW4HfyM/Js6vCncP2bf6dcy9kaNo
	/uzQxBys5cYHjNjICZ09igJXOICdTrBTAD2fPmG6uwyhax1vmC3Yvxbw6g+HHKjHDw845Cu6sic
	AjWLV2tb/8/cUR2xB9CD9Xce8x6qVt7YsEpbRadYUTY7bKXDpsmstxLAU0wKd7qApqGZF5yldiK
	uCpQMDLualYTkI9HWA942hIu3+2udSz+bhkOC6FhP6N4eyTKLwjaS2CwFmHDQDXZB0xu+H3cQOc
	wLTFfEwgNMmCYI=
X-Received: by 2002:a05:600c:8b27:b0:48d:1021:e5d1 with SMTP id 5b1f17b1804b1-48d1021e782mr58724545e9.3.1777985167877;
        Tue, 05 May 2026 05:46:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:b41:c160:6a1d:efff:fe52:1959? ([2a01:e0a:b41:c160:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb694fcsm372520405e9.3.2026.05.05.05.46.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 05:46:07 -0700 (PDT)
Message-ID: <7efb0d25-aa70-4e0e-b97b-d1dce52b1672@6wind.com>
Date: Tue, 5 May 2026 14:46:06 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH 1/3 net-next v3] ipv4: centralize devconf sysctl handling
To: Fernando Fernandez Mancera <fmancera@suse.de>, netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org, horms@kernel.org, pabeni@redhat.com,
 kuba@kernel.org, edumazet@google.com, davem@davemloft.net,
 idosch@nvidia.com, dsahern@kernel.org
References: <20260504123143.6284-1-fmancera@suse.de>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <20260504123143.6284-1-fmancera@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 04/05/2026 à 14:31, Fernando Fernandez Mancera a écrit :
> The logic for handling IPv4 devconf sysctls is scattered. Notification
> and cache flushes are managed in devinet_conf_proc(), while a separate
> ipv4_doint_and_flush() function and DEVINET_SYSCTL_FLUSHING_ENTRY macro
> is used for properties that solely require a cache flush.
> 
> This patch refactors the sysctl handling by introducing a centralized
> helper, devinet_conf_post_set(). This new function evaluates the changed
> attribute and handles all necessary operations like triggering netlink
> notifications. It returns a boolean indicating whether a routing cache
> flush is required.
> 
> Note that the boolean is necessary as this function will be re-used for
> netlink IPv4 devconf handling where the cache flushing must wait until
> all the attributes have been processed.
> 
> Finally, this is introducing a small change in behavior for
> IPV4_DEVCONF_ROUTE_LOCALNET. As commit d0daebc3d622 ("ipv4: Add
> interface option to enable routing of 127.0.0.0/8") intended, the cache
> flush should only be performed when ROUTE_LOCALNET changes from 1 to 0.
> Unfortunately, this was not true because while implementing it the
> DEVINET_SYSCTL_FLUSHING_ENTRY was used for the attribute, making the
> code related to it on devinet_conf_proc() dead.
> 
> IPV4_DEVCONF_FORWARDING is still being handled separately as it requires
> more operations.
> 
> Signed-off-by: Fernando Fernandez Mancera <fmancera@suse.de>

Reviewed-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
