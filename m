Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E298B155757;
	Sat, 12 Sep 2026 00:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789171597; cv=none; b=AYDr+yqG7s+56wFRMYPBRZ3CrpiXKESHX6q0gJ0J9KFeVXKHe95BgQlXWsnU1nXmDWQltVoQjNCzVYdEbNter1Uht5pF3/apJXoLvC3dGsVVotSZ4Xw8YeZJMVEQPqDrm2mbvgGAT2jG5A1o4Z6Gmo1bEI7V74KMROhkrkX0LqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789171597; c=relaxed/simple;
	bh=+9rVoXwUo+loUHrhwKfl0SEBUpgESIgxidYGJ0ZXby8=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UBnHviEbwo9lGWavK3/TxX8f1iS9pJB9u6qlT/+Ct8iNKdrycQ1l0sdKZjCrvDjgmguAXYYBbxkvbtCSrHolZ8dF2gEpDKtP+ADP11ckVankj73QgwiCK1PsI8lOrRDnQAz4FNMxIR7u9lkDUiA0rdkgSyns4vV5YJgZRLJ+TCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C3YmBauX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C3YmBauX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F9F31F00893;
	Sat, 12 Sep 2026 00:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789171595;
	bh=Bh9F4i1rKKtOqP2EXCs5yBnvymPMLaFceRkIA4Xahac=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=C3YmBauXc2c9pCT9EBPrvHQjyd0Tve5y5IprKcC8oIjkzCy7xNUaVBx9oZUD0Wp3E
	 QZ5OSy0HcuAcTXiH8kWRl2iGebWSoXjf/+PcJn6X1FQ+bDIO8omKX+tkvL8ehnlJMY
	 y35A5WmCrVcGTKnDG57Au0z8iCdxBoX55L8Ry2ObV8lV5AT6kB+apHkIf2+akWdK0Q
	 0M1ShImi1ov12zUIqYagBEaMY7bxLGkVBTL0FAEGhGDDmc87hiYoS5h72QeY7EWDeE
	 wnId+H+RZknw/qFEC0Duc2Z2uIqdrIco4Kws34M9slK1IkdfZc8Rd9mSlIJIldx+Ya
	 3qF469kGldsAQ==
Subject: Re: [PATCH net-next v2 2/4] netconsole: allow configuring the rate
 limit interval through configfs
From: netdev-bot+sashiko@kernel.org
To: leitao@debian.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, shuah@kernel.org, rdunlap@infradead.org,
 paulmck@kernel.org, gustavold@gmail.com, asantostc@gmail.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kernel-team@meta.com
Date: Sat, 12 Sep 2026 00:06:34 +0000
Message-ID: <178917159410.219967.17501693079389453463@kernel.org>
In-Reply-To: <20260910-netcons_ratelimit-v2-2-ebf0dd91e26e@debian.org>
References: <20260910-netcons_ratelimit-v2-2-ebf0dd91e26e@debian.org>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 0 · Low: 3

- [Low] DISCARDED (resolved later in the series).
- [Low] DISCARDED (documented as an intentional exception later in the
  series).
- [Low] Wrong range bound in ratelimit_interval_ms_store()
  (drivers/net/netconsole.c:1363-1365): the user value is converted…

--

netconsole: allow configuring the rate limit interval through configfs

This exposes the per-target token bucket interval as a new configfs
attribute, ratelimit_interval_ms.  The value is converted from
milliseconds to jiffies on store and back to milliseconds on show, and
defaults to zero so a target remains unlimited unless configured.

> diff --git a/drivers/net/netconsole.c b/drivers/net/netconsole.c
> index 13292c3f818e9..faf8f9bbc6c0c 100644
> --- a/drivers/net/netconsole.c
> +++ b/drivers/net/netconsole.c
> @@ -945,6 +945,14 @@ static ssize_t transmit_errors_show(struct config_item *item, char *buf)
>  	return sysfs_emit(buf, "%llu\n", xmit_drop_count + enomem_count);
>  }
>  
> +static ssize_t ratelimit_interval_ms_show(struct config_item *item, char *buf)
> +{
> +	struct netconsole_target *nt = to_target(item);
> +
> +	return sysfs_emit(buf, "%u\n",
> +			  jiffies_to_msecs(READ_ONCE(nt->ratelimit.interval)));
> +}
> +

[ ... ]

> @@ -1340,6 +1348,29 @@ static ssize_t remote_mac_store(struct config_item *item, const char *buf,
>  	return ret;
>  }
>  
> +static ssize_t ratelimit_interval_ms_store(struct config_item *item,
> +					   const char *buf, size_t count)
> +{
> +	struct netconsole_target *nt = to_target(item);
> +	unsigned int interval;
> +	unsigned long jifs;
> +	ssize_t ret;
> +
> +	ret = kstrtouint(buf, 10, &interval);
> +	if (ret)
> +		return ret;
> +
> +	jifs = msecs_to_jiffies(interval);
> +	if (jifs > INT_MAX)
> +		return -ERANGE;

[Severity: Low]

Can the "jifs > INT_MAX" test in ratelimit_interval_ms_store() ever fire on
a 32-bit kernel?

msecs_to_jiffies() saturates before the comparison happens:

kernel/time/time.c:__msecs_to_jiffies() {
	if ((int)m < 0)
		return MAX_JIFFY_OFFSET;
	return _msecs_to_jiffies(m);
}

and MAX_JIFFY_OFFSET is defined as:

include/linux/jiffies.h:
	#define MAX_JIFFY_OFFSET ((LONG_MAX >> 1)-1)

On 32-bit that is 1073741822, which is smaller than INT_MAX (2147483647).
For every supported HZ <= 1000 the non-saturating path returns at most
"interval" itself, so on 32-bit the check looks like dead code.

The visible effect is that the same write behaves differently per
architecture.  With CONFIG_NETCONSOLE_DYNAMIC on 32-bit:

	echo 3000000000 > /sys/kernel/config/netconsole/<t>/ratelimit_interval_ms

kstrtouint() accepts the value, __msecs_to_jiffies() takes the "(int)m < 0"
branch and returns MAX_JIFFY_OFFSET, the range check passes, and
WRITE_ONCE() stores 1073741822 into nt->ratelimit.interval.  The write
returns success, while the identical write on a 64-bit kernel returns
-ERANGE.

Would checking MAX_JIFFY_OFFSET, or validating "interval" before the
conversion, express the intent better here?

> +
> +	dynamic_netconsole_mutex_lock();
> +	WRITE_ONCE(nt->ratelimit.interval, jifs);
> +	dynamic_netconsole_mutex_unlock();
> +
> +	return count;
> +}
> +

[Severity: Low]

Following on from the clamping above, can the read-back in
ratelimit_interval_ms_show() wrap on 32-bit?

include/linux/jiffies.h:
	static inline unsigned int jiffies_to_msecs(const unsigned long j)
	{
		return (MSEC_PER_SEC / HZ) * j;
	}

That multiplication is done in 32-bit arithmetic.  With HZ=100 and the
stored value 1073741822 from the example above, the attribute prints
2147483628 rather than 10737418220, so the value read back is unrelated to
what was written.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260910-netcons_ratelimit-v2-0-ebf0dd91e26e%40debian.org
