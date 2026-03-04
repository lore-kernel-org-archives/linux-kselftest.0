Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FA0333441;
	Wed,  4 Mar 2026 15:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772637721; cv=none; b=XpUleBdLU7Zpph+wMCCB8VWBWstzjpgqqC87drr5+TEahnCzni2GP07vsGdco2MxUwqTUtdjTIwvp8o1s+SgLXFICwFlv5W1l1ZIQs2PNIcumywAlaQ35C/5KRhMMaDyvJkxhYkqlZzfolN46uDQqAv37t7gGPNhG/b4A4NDZ0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772637721; c=relaxed/simple;
	bh=kTu8CJ1qHsUtnK4g50QhfvjQwtH2+08U07yo0LS22nQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cML8NZ+bTqPhdWKOWCphyqOJWnIyVH6Xe/8JC9puwrPv2WLiEOf7biqnri2kWJ/GmO9dPEsdhEkL3K3lKhQiVAA4imkb0n6vMdVCT+q8fH1WUQ405bucsg0RawQCnGliOFrkb2TA7FiOSBBaUMcPZmVDDsgAe8+LMr62NvJ9cb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dzBZ7T2H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dzBZ7T2H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3320C4CEF7;
	Wed,  4 Mar 2026 15:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772637721;
	bh=kTu8CJ1qHsUtnK4g50QhfvjQwtH2+08U07yo0LS22nQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dzBZ7T2Hn/+RnOHiQsA/d+pgTe8aPvfcmX/0YilYy1nlkif6Mz6MKr/Gblc/mk6BQ
	 y/qDLaYsuu6d8/imoTsM3lRleXuehvgOugNkPJtYyYvdCzNBSGe2dmERu5hENmybri
	 4HoTlgM5RiULOwKEv2uli+hW+z4aimSyHxZ54A2barMi640zjKc0O2z+pZwsqUmMXW
	 NPRXg5rKp0bCz6Jms26NtBhLkJiJyKJJMA3V0dqpd8Jv0b1CluOOfuP3V5xaEk5tCQ
	 Ewc4MvYmCOrea6SoYENwI3kTOg8fiscfBU8lz++gn97z4MAiun66w/n0fIyiQxkwaV
	 DK7W9iNYVf4og==
Message-ID: <2148b03c-bd94-4de1-94f3-0978a8dc74b7@kernel.org>
Date: Wed, 4 Mar 2026 08:22:00 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v4 2/2] selftests: net: add test for IPv4 route with
 loopback IPv6 nexthop
Content-Language: en-US
To: Jiayuan Chen <jiayuan.chen@linux.dev>, netdev@vger.kernel.org,
 idosch@nvidia.com
Cc: jiayuan.chen@shopee.com, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260304113817.294966-1-jiayuan.chen@linux.dev>
 <20260304113817.294966-3-jiayuan.chen@linux.dev>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <20260304113817.294966-3-jiayuan.chen@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/4/26 4:38 AM, Jiayuan Chen wrote:
> From: Jiayuan Chen <jiayuan.chen@shopee.com>
> 
> Add a regression test for a kernel panic that occurs when an IPv4 route
> references an IPv6 nexthop object created on the loopback device.
> 
> The test creates an IPv6 nexthop on lo, binds an IPv4 route to it, then
> triggers a route lookup via ping to verify the kernel does not crash.
> 
>   ./fib_nexthops.sh
>   Tests passed: 249
>   Tests failed:   0
> 
> Reviewed-by: Ido Schimmel <idosch@nvidia.com>
> Signed-off-by: Jiayuan Chen <jiayuan.chen@shopee.com>
> ---
>  tools/testing/selftests/net/fib_nexthops.sh | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/tools/testing/selftests/net/fib_nexthops.sh b/tools/testing/selftests/net/fib_nexthops.sh
> index 21026b667667..6eb7f95e70e1 100755
> --- a/tools/testing/selftests/net/fib_nexthops.sh
> +++ b/tools/testing/selftests/net/fib_nexthops.sh
> @@ -1672,6 +1672,17 @@ ipv4_withv6_fcnal()
>  
>  	run_cmd "$IP ro replace 172.16.101.1/32 via inet6 2001:db8:50::1 dev veth1"
>  	log_test $? 2 "IPv4 route with invalid IPv6 gateway"
> +
> +	# Test IPv4 route with loopback IPv6 nexthop
> +	# Regression test: loopback IPv6 nexthop was misclassified as reject
> +	# route, skipping nhc_pcpu_rth_output allocation, causing panic when
> +	# an IPv4 route references it and triggers __mkroute_output().
> +	run_cmd "$IP -6 nexthop add id 20 dev lo"
> +	run_cmd "$IP ro add 172.20.20.0/24 nhid 20"
> +	run_cmd "ip netns exec $me ping -c1 -W1 172.20.20.1"
> +	log_test $? 1 "IPv4 route with loopback IPv6 nexthop (no crash)"
> +	run_cmd "$IP ro del 172.20.20.0/24"
> +	run_cmd "$IP nexthop del id 20"
>  }
>  
>  ipv4_fcnal_runtime()


Reviewed-by: David Ahern <dsahern@kernel.org>

