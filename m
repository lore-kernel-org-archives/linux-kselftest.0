Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793401233;
	b=iPLHBDT5r0tltc1GC1SNQBwZItlExGszjSV4XpEF38SynLcUbV31ijzV7mke8xiZxS0o
	 mOxAtoDojCC2WD4xG5J52t4M97+zGszh4xPCgCWuXGNTvJKITmgTNdW2qg8AvtBMODI9a
	 E6UL87sgy6Y6Yt1Y0u1mLXuvwXUW/6KIZdbKxZu5dQgOZyqN8QOCvbTuD6Am9dExkXVyG
	 PfOB/Ep9dsx0iDtEYYGxJ+sAtFCAl/8QooaSN4PAm2tFtz/EBpXGL76MsJEj4sJnTra7U
	 BSlzSpOuR5t/3L5x8M+TAKct6yb6CkayfhsJB7j4/rgAyglmbV/2MvpGNxkfJnifabQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793401233;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=VJF0CUXK29LO5bKdyyqKbNK4/EKb/LtfiBdeNXFNeJo=;
	b=0jtZK2pvGgcolPPM3I4nFzP0O4YdnstWJ4tcNnGUac3f/xoACCjsRbDDKxq8h6LBwlLI
	 sM7JLl3EPKaZLXjwF2PN+PwHZLOPl68kiSd+JkK95Nn2DNMt3rP+1jHTHcGoujaZJibDl
	 +C7Wte6SsZrHDyDd1q6wAfZigIe2dfrrrd5aF4y0tKyfrAxIMZLsFjzucENKJ18UNYfWv
	 v5iD4QZK5Yczr9Xo8Ne7Dd7tywyDZ9zANozOvY2tAhBhjIOu4As90Wk18I1vbcx1O7FPF
	 eTqAFODINh/5oa7cPIXMhThzs5hq3FAHOcdEmXpsA0VtStj+tAIiisBA1LqurBM+kqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gMX2HlcR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6F0606A323;
	Fri, 30 Oct 2026 23:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gMX2HlcR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A64D1F000C1;
	Fri, 30 Oct 2026 23:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793401230;
	bh=VJF0CUXK29LO5bKdyyqKbNK4/EKb/LtfiBdeNXFNeJo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=gMX2HlcRcPcjQO+WZuUs9mvbtbFdxBmsFJS0J02H8KiuT9f3ThRhaMGE/B+0OgpL/
	 R7Kp+c3zgL2Jiww6AIxWac94GC3LwPVyK3bRyG9dukPf3FpnSLnKSJfs3PfnqbNdXV
	 mTmLE72kDI/KwHlAb2wumu3NJmkKwoRh6qbU2OGHu2q5iq3P8iyqQwYZZKzSOueg/X
	 BeoHJDyWjC2nAwer3MB/c9esauUaHRz25c62JqpAfdwF6sjNTGI6i7RuwCTdJG/lXp
	 YTy63jcsehsSgYu9JXB1opIeG5Ua5pycxfXrgX181JqEV6sPTHmTDcp9tEYwbT1RMo
	 iRHVrtw9iAy8w==
Date: Fri, 30 Oct 2026 16:00:29 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Yingjie Wang <x-professor@outlook.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "davem@davemloft.net"
 <davem@davemloft.net>, "edumazet@kernel.org" <edumazet@kernel.org>,
 "pabeni@redhat.com" <pabeni@redhat.com>, "horms@kernel.org"
 <horms@kernel.org>, "shuah@kernel.org" <shuah@kernel.org>,
 "phx0fer@gmail.com" <phx0fer@gmail.com>, "wang.zhan@smartx.com"
 <wang.zhan@smartx.com>, "kuniyu@google.com" <kuniyu@google.com>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net v2 1/2] net: preserve rps_default_mask on failed
 writes
Message-ID: <20261030160029.76ee6c7f@kernel.org>
In-Reply-To: <11f9052cba649eb1efec6e9e45eb9377d46e19d1.1793286626.git.x-professor@outlook.com>
References: <cover.1793286626.git.x-professor@outlook.com>
	<11f9052cba649eb1efec6e9e45eb9377d46e19d1.1793286626.git.x-professor@outlook.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 29 Oct 2026 15:10:36 +0000 Yingjie Wang wrote:
> rps_default_mask_sysctl() passes the live per-netns mask to
> cpumask_parse(). bitmap_parse() stores chunks as it scans from right to
> left, so a later error can leave lower chunks changed.
> rps_cpumask_housekeeping() also intersects its input in place before
> returning -EINVAL when no housekeeping CPUs remain.
> 
> Consequently, a failed write changes both the value read from the sysctl
> and the default copied to RX queues created later. On a four-CPU VM,
> after setting the mask to 1, writing zz,00000003 failed with EOVERFLOW
> but changed the mask to 3. Writing a mask containing only isolated CPUs
> failed with EINVAL but changed it to 0. No kernel modification or error
> injection was needed to reproduce either case.
> 
> Parse and validate a temporary mask before taking the mutex. After both
> steps succeed, take the mutex and replace the live pointer. Readers
> access and consume the pointer while holding the same mutex, so the
> replaced mask can be freed after dropping the mutex.
> 
> The rps_default_mask selftest failed on the base kernel and passed with
> the fix. The fixed kernel also kept the mask at 1 for the overflow and
> housekeeping failure cases, while valid writes of 2 and 0 still
> succeeded.
> 
> The issue was found while fuzzing sysctl write error paths.
> 
> Fixes: 605cfa1b1090 ("net: introduce default_rps_mask netns attribute")
> Reviewed-by: Wang Zhan <wang.zhan@smartx.com>
> Tested-by: Wang Zhan <wang.zhan@smartx.com>
> Signed-off-by: Yingjie Wang <x-professor@outlook.com>

kzalloc(cpumask_size(), GFP_KERNEL) failure seems purely theoretical.
Please drop the Fixes tag and drop the selftest, and repost after the
merge window is over (https://netdev.bots.linux.dev/net-next.html)

> diff --git a/net/core/sysctl_net_core.c b/net/core/sysctl_net_core.c
> index 473c162736d69..f25281c709346 100644
> --- a/net/core/sysctl_net_core.c
> +++ b/net/core/sysctl_net_core.c
> @@ -105,34 +105,37 @@ static int rps_default_mask_sysctl(const struct ctl_table *table, int write,
>  				   void *buffer, size_t *lenp, loff_t *ppos)
>  {
>  	struct net *net = (struct net *)table->data;
> +	struct cpumask *new_mask = NULL;
>  	struct cpumask *mask;
>  	int err = 0;
>  
> -	mutex_lock(&rps_default_mask_mutex);
> -	mask = net->core.rps_default_mask;
>  	if (write) {
> -		if (!mask) {
> -			mask = kzalloc(cpumask_size(), GFP_KERNEL);
> -			net->core.rps_default_mask = mask;
> -		}
> -		err = -ENOMEM;
> -		if (!mask)
> -			goto done;
> +		new_mask = kzalloc(cpumask_size(), GFP_KERNEL);
> +		if (!new_mask)
> +			return -ENOMEM;
>  
> -		err = cpumask_parse(buffer, mask);
> +		err = cpumask_parse(buffer, new_mask);
>  		if (err)
> -			goto done;
> +			goto out;
>  
> -		err = rps_cpumask_housekeeping(mask);
> +		err = rps_cpumask_housekeeping(new_mask);
>  		if (err)
> -			goto done;
> +			goto out;
> +	}
> +
> +	mutex_lock(&rps_default_mask_mutex);
> +	mask = net->core.rps_default_mask;
> +	if (write) {
> +		net->core.rps_default_mask = new_mask;
> +		new_mask = mask;

nit: this could use

		swap(net->core.rps_default_mask, new_mask);

>  	} else {
>  		err = dump_cpumask(buffer, lenp, ppos,
>  				   mask ?: cpu_none_mask);
>  	}
>  
> -done:
>  	mutex_unlock(&rps_default_mask_mutex);
> +out:
> +	kfree(new_mask);
>  	return err;
>  }
>  
-- 
pw-bot: cr

