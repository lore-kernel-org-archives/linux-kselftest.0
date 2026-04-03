Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53525243951;
	Fri,  3 Apr 2026 22:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775255719; cv=none; b=QhZbpOWveb4WOJSkx6g42JGEkG6brXQg6IcoDc1zCfGs8LjbH+Ze/DttkED1rTbmbylY3kLvArzN1O+wHPBAsQ7eWzvBK9hBwXdAUoG9mwuf/7zyLVtY94TkGZVqRAsk4xq8CSYUuI74D9kMkHhAmt7j0y0W7JzIFwmES/p9yrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775255719; c=relaxed/simple;
	bh=9udIDY9R4whDoJPs16e0VLhftu2Y4OQdUQcJHsczeQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IokbjWe30TfeqJhNKORJqXeAcv81Cuu1R5CDiqwYrA27mjgnCm+xBvld6XYnwjHd0IZjJgsIaJy6nk4RotYSskuVBqU8gfM4ajAu6pMhBalplv9zyKmZZlMGhogZkzM1DwDlGzI13iawJwD9z0k3NulVse+dWbMD1bbM+Fe8Jgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XE16yLMi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XE16yLMi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72642C4CEF7;
	Fri,  3 Apr 2026 22:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775255719;
	bh=9udIDY9R4whDoJPs16e0VLhftu2Y4OQdUQcJHsczeQE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XE16yLMiaioJm3hcLXIhPuNjhjxzpNgQNecjtIlZE5A98TFS4p7QtN14r5BZmPbtL
	 Dl7l+ive93YgdHVc4k9ogwuwB+6OhLGxP4hc9dtnQEIeaVLOKl7H4smlP+GVX2r4Rm
	 aM1yhahvPKGcGJNzdnZcuIutCtzU3m9LgXJnf9txPAR3UgtBrGMlp7StLU+timTzR7
	 Cw45gj6sXwB2YUirXb9VFqoBdar2xJTsjL9pOTGO07JnPUHKYXUIra8EM0rHpSraRw
	 7jOyaLyDEaZXlLMcg9VGU3u4e27myXk9NJl7KznZXO9daHSgUmTJRNa/ZqmPBgOYgI
	 ZadsqIslogUqw==
Message-ID: <7ce15a72-1b1e-46fc-999c-e80d77b72c6a@kernel.org>
Date: Fri, 3 Apr 2026 16:35:17 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH net-next 0/4] ipv4/ipv6: local address lookup scaling
Content-Language: en-US
To: hawk@kernel.org, netdev@vger.kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, ivan@cloudflare.com,
 kernel-team@cloudflare.com
References: <20260331210739.3998753-1-hawk@kernel.org>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <20260331210739.3998753-1-hawk@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/31/26 3:07 PM, hawk@kernel.org wrote:
> Benchmarks
> ----------
> 
> Performance was measured using bpftrace kprobe/kretprobe on
> __ip_dev_find inside a virtme-ng VM (4 vCPUs, veth pair, network
> namespaces, CPU-isolated host). A C benchmark tool sends unconnected
> UDP packets in a tight loop, cycling through all source addresses to
> exercise the lookup path on every sendto().
> 
> __ip_dev_find average latency (bpftrace stats, 5 rounds x 3s):
> 
>   Addrs   rhltable (ns)   hlist (ns)   Improvement
>   -----   -------------   ----------   -----------
>      20           201          200          0%

why 20 as the low end? 1 ipv4, 2 ipv6 would be most common use case. All
of the benchmarking numbers should start there.

>     100           210          218         +4%
>     500           206          234        +12%
>     700           218          237         +8%
>    1000           214          228         +6%
>    2000           231          265        +13%
>    5000           247          335        +26%
> 

