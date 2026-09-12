Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DB91DED49;
	Sat, 12 Sep 2026 00:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789171599; cv=none; b=XEHx5BHqcXyvFwUi0sv40Pg+gh1rvwpBM4IvpnNOYoINcxcRdgi+MVilLYZO/PFTfqyjIhXj81JkjT8BubfbKnoKeM6p79/t3WzShlkTPTkR3nzzP9uBbN0j92UdtETucpnz0pd3othLILl+OT6gvn0PpUfaiy3SO3C+HRUWXgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789171599; c=relaxed/simple;
	bh=fwJnCPOAL55qU2ehrMXmpNrSCcMRgCKhj9EF2xRcnDQ=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oRBgZP94fjPEkoFncxPiSxb/pW7NmNHwWS2+NTLM8Sh+q8JS0CClcrTTb9bRRRrZtt/JTljTWvIdrCtAtleH2QnOyOFq1CXpS7b9Erucobk/4x4GfegZHthqeyi9zyBgKrscGE1brbMTe5ldbfmNMEX2BH/GFBrXXdBFN2YRF/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=koyR+Fan; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="koyR+Fan"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 428791F000FF;
	Sat, 12 Sep 2026 00:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789171597;
	bh=g+tWP8Oa+rMahqiI/QKMEI80DpiyBzMfDEzXndcSky8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=koyR+Fanyb1Cy3fKnD0Zyda9YrsTj8v7USmehBAXJM37c2sJ2V5SNv2EJ6GgPIULx
	 Nh+EdJBBPaSaGMtUVStbVzAj88d/xQzcFBhr5PpB9KawFvMxgxkozW963u1fZnvYdw
	 nVZLYaYqQ01e68Q/mK2lpC3NfUcobhLizxZiGcINjgnkSWxtC2pJN3CFhuET5VhmIL
	 9uSYhmBQVaLhnNMTjzfBeCIHSuA7RWGS8hk7OOSpP2wBvo5bhrrlZ2QQ3EOTeVyUFp
	 N6weSke21ZIU0jOT3z4nVk9XGhsK5MwoSiUKLGiir0C64UE5MiMYr8XzfieD5MSHaY
	 vDRT8AtadG+bQ==
Subject: Re: [PATCH net-next v2 3/4] netconsole: allow configuring the rate
 limit burst through configfs
From: netdev-bot+sashiko@kernel.org
To: leitao@debian.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, shuah@kernel.org, rdunlap@infradead.org,
 paulmck@kernel.org, gustavold@gmail.com, asantostc@gmail.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kernel-team@meta.com
Date: Sat, 12 Sep 2026 00:06:35 +0000
Message-ID: <178917159585.219967.569342306075085345@kernel.org>
In-Reply-To: <20260910-netcons_ratelimit-v2-3-ebf0dd91e26e@debian.org>
References: <20260910-netcons_ratelimit-v2-3-ebf0dd91e26e@debian.org>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 0 · Low: 1

- [Low] New user-visible configfs attribute `ratelimit_burst` (registered
  in netconsole_target_attrs[] at drivers/net/netconsole.c:1782,…

--

netconsole: allow configuring the rate limit burst through configfs

This adds a writable ratelimit_burst configfs attribute to each netconsole
target so the ratelimit burst (number of messages allowed per interval) can
be tuned instead of always using the ratelimit default of 10. The new
attribute is registered in netconsole_target_attrs[].

> diff --git a/drivers/net/netconsole.c b/drivers/net/netconsole.c
> index faf8f9bbc6c0c..10e02b7c3f9cb 100644
> --- a/drivers/net/netconsole.c
> +++ b/drivers/net/netconsole.c

[ ... ]

> @@ -1371,6 +1378,27 @@ static ssize_t ratelimit_interval_ms_store(struct config_item *item,
>  	return count;
>  }
>  
> +static ssize_t ratelimit_burst_store(struct config_item *item, const char *buf,
> +				     size_t count)
> +{
> +	struct netconsole_target *nt = to_target(item);
> +	unsigned int burst;
> +	ssize_t ret;
> +
> +	ret = kstrtouint(buf, 10, &burst);
> +	if (ret)
> +		return ret;
> +
> +	if (burst > INT_MAX)
> +		return -ERANGE;
> +
> +	dynamic_netconsole_mutex_lock();
> +	WRITE_ONCE(nt->ratelimit.burst, burst);
> +	dynamic_netconsole_mutex_unlock();
> +
> +	return count;
> +}
> +

[ ... ]

> @@ -1750,6 +1779,7 @@ static struct configfs_attribute *netconsole_target_attrs[] = {
>  	&attr_remote_mac,
>  	&attr_transmit_errors,
>  	&attr_ratelimit_interval_ms,
> +	&attr_ratelimit_burst,
>  	NULL,
>  };

[Severity: Low]
This isn't a bug, but should the new configfs file also be described in
Documentation/networking/netconsole.rst?

At this commit the document still enumerates the target attributes with:

	The interface exposes these parameters of a netconsole target to userspace:
	...
	transmit_errors	Number of packet send errors		(read-only)

so neither ratelimit_interval_ms nor the ratelimit_burst added here appears
in that table.

Things a reader cannot find documented for ratelimit_burst_store() /
ratelimit_burst_show(): the default value (DEFAULT_RATELIMIT_BURST, 10, as
set by netconsole_ratelimit_init()), the accepted range, what a burst of 0
means, and whether the value may be written while the target is enabled.

Note that the later patch in this series, "docs: netconsole: document rate
limit feature", adds a dedicated "Rate limiting" section covering both
ratelimit files, the burst default of 10, the zero semantics and the fact
that both knobs can be written while the target is enabled, so the only
remaining difference is that the ratelimit rows are not listed in the older
parameter table above. Was leaving them out of that table intentional?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260910-netcons_ratelimit-v2-0-ebf0dd91e26e%40debian.org
