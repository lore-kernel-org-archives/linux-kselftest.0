Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F760421F1F
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 16:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774973740; cv=none; b=CQOTG+Be2HdvgtM5KSAdXnfx0pqc+Dps9HQWbzB0RAA6uxDJs9+KqZWCNj3z4zWsi56i2eEWgC+6f8RjB4FY6A0bThCCOJ2CMqxChdcMktj7B9nqIvYs3ULhow3XEflOyPIqJLx0iZs0BON+yYWBEA8NXOqzfJHjFhI1EZIaCkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774973740; c=relaxed/simple;
	bh=hKEMFqZfvgYOMO1YrT/7Y7rOFl5qkcvC8gepax7N8Xo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FE5ccVfyrqrx4Ec4Qj25SK2xnVAYXVq22KbuzUE3hxQwjjSlHXwvZUDTCPLkFs6g/Q9xBxrQfzhWTMU/lOcznzemJTQ29XrUjXLUY1agHGmKEKpMay34wYDEKLOSXAJNoaCeLQsFaDLQ9AUsB94+QEZySjXsNVxOHsuVpE+27l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=LHShZf+M; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="LHShZf+M"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43d0292ae5aso161741f8f.0
        for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 09:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1774973732; x=1775578532; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xWJoAs4lXlq756+zLnymiNe5wTpOT6F6tvNtftPeNbM=;
        b=LHShZf+MiYc0Zvm1c2Bt9GVk9oIqswt4l0xdgVpxpP8h2BklEr5ub2i2J8g5GGbK0I
         GC2xKmeZmKC3PramCc8KRyDJ4qIgxf4ZOK1OChYVjnb3G5vq3NaJgsyazT9rCd0MJ2v0
         ms6PTR2ZwP7LpX83t172o15EWpWzAXHRKGmh0Jgi3aKLkfAo1rLHbI5BCglolycwPP86
         7kPsmm0FguAvDWKpB63Q1DihSWELi+Oe9liqzVw0yzHhIxNQOlVSubIYjWUSzdfq5Y5C
         9CKUh3wlXFJX0xcF49Jncq0b1EketWE1y9fLg7Gtt9Dkx1YRwL23XYBP0qQDAJjAXw90
         4epA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774973732; x=1775578532;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xWJoAs4lXlq756+zLnymiNe5wTpOT6F6tvNtftPeNbM=;
        b=JgQn+XKbx8cKbDXqIVR9sKJ+20j0+GwkAGZvsn3zeHJ90YaOoGzlyTU9ismsTM4DdR
         kzbUzBlvqIzAs4FqbM7PXlg3tNdvkuuGgOMGsVCYy7oC5Xq32t0wQgcj5kIaOdC/yXA4
         HXnp38E9Jb7exCESmWUZvkpVnU3bQ2+l91/MrMU27YYFtZvTutLm/tokdLlNDwiCrQII
         bo4aTMqB/TKuVuTZX//nbam3AOctG4S42J/Ltmzq6lbDB8Sg1HR4qo/Wqtn6hGl+zkLy
         pxKLWDR8uRmr3n8oXEw912cqZ9YXx4fKuGr6rTQ/AENHzruSsFMD4C0mKPVw7psqoA7H
         FrEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUM353ccAMj+Zx910ktje8KVuE3VGJUWiT3NADUtysyILKFkL8e7Z8p1bOutdMZLqzVfinMM4XIoOxyGiypGDU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8/3qHGcpEzUaRPPFaqiGLT7NN5EKZZTnE/rH1r1RBX5ZiEIJl
	lD9CrWIns3+0E6kUvT2JYyQ9gjipsLIpd1WnvhrFujBAZLcEOHfBCqGyOgUOct8qMI8=
X-Gm-Gg: ATEYQzymZaBX8RvNbZSgSzA1jE/k8drDCS7EXltBPdM9Jv9Y93HnrGbdVbmJOGWm3LX
	Hzv2s854YVIHexwVcf0h6HiyenAMhBdqcvyr3GNCtX8kMSGoiej7KFcHpjwPGHgRY2hQpy85WIc
	hQ4ApP2VHnj2OIj9Ey04UhxTVWwM5hjiTpFNao/5MaqId2o0r/JN4XXnNWRvVDtGtBRJwnrEFAD
	/bsaov2GemoI4oT9jMTkuQArgJARJr9wziNYd7/x+4nfPi3WKfW3zHMez/qaZNjvCAVL3oVmZDk
	FM23vf9ieFa+MzMaVVQehdJYAr3/QcxjNS43i0J+fgmt+VAto/fCnVvX/Nfr5SSiQvoRlr71+zB
	BOJEOfPj/2TANkynxSsVqD3DOpAndBAJZMUH6RQQoNl6kptU7JpUA3w2YZGTWVwOcKE1y9O+xbe
	XVGntE/XHuEeJlDP+gjcuthJclUYq6lbSvxAD567IBzPF3ZEPxboK4GrWGlYQhXchBhrWXK1gcL
	OdR
X-Received: by 2002:a05:600c:4755:b0:486:f7fd:9d7d with SMTP id 5b1f17b1804b1-48727f2ce17mr148692005e9.3.1774973731968;
        Tue, 31 Mar 2026 09:15:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:b41:c160:6a1d:efff:fe52:1959? ([2a01:e0a:b41:c160:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21e26basm26421086f8f.3.2026.03.31.09.15.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 09:15:31 -0700 (PDT)
Message-ID: <b6ec7b55-d883-45fd-a227-db8fb29e48f2@6wind.com>
Date: Tue, 31 Mar 2026 18:15:31 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH net 2/2] selftests: seg6: add test for dst_cache isolation
 in seg6 lwtunnel
To: Andrea Mayer <andrea.mayer@uniroma2.it>, netdev@vger.kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, dsahern@kernel.org,
 david.lebrun@uclouvain.be, stefano.salsano@uniroma2.it,
 paolo.lungaroni@uniroma2.it, linux-kernel@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org
References: <20260331110755.25042-1-andrea.mayer@uniroma2.it>
 <20260331110755.25042-3-andrea.mayer@uniroma2.it>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <20260331110755.25042-3-andrea.mayer@uniroma2.it>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 31/03/2026 à 13:07, Andrea Mayer a écrit :
> Add a selftest that verifies the dst_cache in seg6 lwtunnel is not
> shared between the input (forwarding) and output (locally generated)
> paths.
> 
> The test creates three namespaces (ns_src, ns_router, ns_dst)
> connected in a line. An SRv6 encap route on ns_router encapsulates
> traffic destined to cafe::1 with SID fc00::100. The SID is
> reachable only for forwarded traffic (from ns_src) via an ip rule
> matching the ingress interface (iif veth-r0 lookup 100), and
> blackholed in the main table.
> 
> The test verifies that:
> 
>   1. A packet generated locally on ns_router does not reach
>      ns_dst with an empty cache, since the SID is blackholed;
>   2. A forwarded packet from ns_src populates the input cache
>      from table 100 and reaches ns_dst;
>   3. A packet generated locally on ns_router still does not
>      reach ns_dst after the input cache is populated,
>      confirming the output path does not reuse the input
>      cache entry.
> 
> Both the forwarded and local packets are pinned to the same CPU
> with taskset, since dst_cache is per-cpu.
> 
> Cc: Shuah Khan <shuah@kernel.org>
> Cc: linux-kselftest@vger.kernel.org
> Signed-off-by: Andrea Mayer <andrea.mayer@uniroma2.it>
> ---

[snip]

> +test_cache_isolation()
> +{
> +	RET=0
> +
> +	# local ping with empty cache: must fail (SID is blackholed)
> +	if ip netns exec "${NS_RTR}" taskset -c 0 \
> +			ping6 -c 1 -W 2 "${DEST}" &>/dev/null; then
> +		echo "SKIP: local ping succeeded with empty cache"
Nit: maybe the same message as the forwarding case:
"SKIP: local ping succeeded, topology broken"

> +		exit "${ksft_skip}"
> +	fi
> +
> +	# forward from ns_src to populate the input cache
> +	if ! ip netns exec "${NS_SRC}" taskset -c 0 \
> +			ping6 -c 1 -W 2 "${DEST}" &>/dev/null; then
> +		echo "SKIP: forwarded ping failed, topology broken"
> +		exit "${ksft_skip}"
> +	fi
> +
[snip]

After that:
Reviewed-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
