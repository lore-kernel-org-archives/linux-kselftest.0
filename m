Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA3517A30A;
	Sat, 12 Sep 2026 00:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789171608; cv=none; b=boG9ETN4g155kVRUMPYM3PXq2/Xr0Q2UMCR6mHyn4aYldmEjeZzu9KNPtQjLlftBJSCnnl7dlY2J/HQR6ljD9qL8EbuLsJkRTeG7fUqDvNqdVHMO7kxjgECrPzviCq1/ll5RljsO9LA9YTfc4rnanff+epliCDZo9mkJe3okTcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789171608; c=relaxed/simple;
	bh=aXdry1Tw/jbwgYVVpWSngyOsu/4T760wu4+ofnar4SM=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QoRVyGW8nziFALv/KMViZ4eRl/vyEVfAGJOolBZ1sNEwVwV9OF9kW4CytfgYQpHAdvG6LvLjK+sxvoBegBmKXEa5+Pf3JhwKb/XILbei6pugwOweA9Vgw88IzC17jLjl5lUGTB/4cQT8Lpe6S4zvRcdKByhorzbTcYgvadEQGd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BF7WdzkL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BF7WdzkL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAEFA1F00893;
	Sat, 12 Sep 2026 00:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789171598;
	bh=mruIyFzVoimo5daY+R9nJaIG9nvHu2dmrkb9GSy4tQk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=BF7WdzkLMZ8e7ZICbIACYnPKblVirxe57uPrHna8CliuuNmHM0flQezPg3NU9X88u
	 dPgj5A2cCfBDW+6C2fu0nJIZaL8+fMnDdamm7Le7rb7OVoNZUJbhHpQMERAdPvizqO
	 JotYtmCpZqxWSZuv6MlThEtRQTMqUdvarXtomM5KDU7V83SQYR+odMV7o29AtrBS5N
	 HFqEvsFFZzoL8ZVeHtNIZqIh+xp8ekQI0Ww4l4wj36ePSvsHl/6YzLMaRh/SWxI4rp
	 FIkSG9UyqGAl/v04GhoK4rm03BkdoDQUnth/JzE/6BsthB+YTokz6m4EYnV1gEgYxp
	 8ZH2cSVgPvU7g==
Subject:
 Re: [PATCH net-next v2 4/4] docs: netconsole: document rate limit feature
From: netdev-bot+sashiko@kernel.org
To: leitao@debian.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, shuah@kernel.org, rdunlap@infradead.org,
 paulmck@kernel.org, gustavold@gmail.com, asantostc@gmail.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kernel-team@meta.com
Date: Sat, 12 Sep 2026 00:06:37 +0000
Message-ID: <178917159736.219967.7715665577446693206@kernel.org>
In-Reply-To: <20260910-netcons_ratelimit-v2-4-ebf0dd91e26e@debian.org>
References: <20260910-netcons_ratelimit-v2-4-ebf0dd91e26e@debian.org>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 1 · Low: 1

- [Medium] The live-update path for the two rate-limit knobs does not
  reset the token bucket, so the behaviour advertised by the new…
- [Low] Documentation/networking/netconsole.rst: the canonical configfs
  inventory for a netconsole target ("The interface exposes these…

--

docs: netconsole: document rate limit feature

This adds a "Rate limiting" section to the netconsole documentation
describing the per-target token bucket and the two configfs files that
drive it, ratelimit_interval_ms and ratelimit_burst.  It also notes that
messages dropped by the bucket never get a message ID assigned.

> diff --git a/Documentation/networking/netconsole.rst b/Documentation/networking/netconsole.rst
> index 4ab5d7b05cf10..a9ccf79834656 100644
> --- a/Documentation/networking/netconsole.rst
> +++ b/Documentation/networking/netconsole.rst
> @@ -177,6 +177,41 @@ You can modify these targets in runtime by creating the following targets::
>   cat cmdline1/remote_ip
>   10.0.0.3
>
> +Rate limiting
> +-------------
> +
> +Netconsole hands every console message to every enabled target, so a host that
> +logs continuously can saturate the receiving agent. Each target carries a token
> +bucket that drops messages once the configured rate is exceeded, controlled by
> +two files in the target directory:
> +
> +        ===================== ================================================
> +        ratelimit_interval_ms Length of the accounting interval, in
> +                              milliseconds. Zero, the default, sends
> +                              everything.
> +        ratelimit_burst       Messages allowed per interval. Defaults to
> +                              10; zero drops every message once an
> +                              interval is set.
> +        ===================== ================================================
> +
> +Unlike most target parameters, both knobs can be written while the target is
> +enabled, which is when a flooding target most likely needs them.

[Severity: Low]
Should the target parameter table earlier in this file be extended too?
That table is introduced with "The interface exposes these parameters of a
netconsole target to userspace" and it does list read-only siblings such as
transmit_errors, but it gains no entry for ratelimit_interval_ms or
ratelimit_burst, even though netconsole_target_attrs[] in
drivers/net/netconsole.c registers them right next to attr_transmit_errors.

The sentence directly under that table also seems to conflict with the new
paragraph above:

  The "enabled" attribute is also used to control whether the parameters of
  a target can be updated or not -- you can modify the parameters of only
  disabled targets (i.e. if "enabled" is 0).

Neither ratelimit_interval_ms_store() nor ratelimit_burst_store() has the
nt->state == STATE_ENABLED test that, for example, remote_port_store() uses
before returning -EINVAL with "target (%s) is enabled, disable to update
parameters".  Would it be worth qualifying that blanket rule so the document
does not describe the same ABI in two contradictory ways?

> +
> +The limit is applied per message, not per packet, so a message big enough to be
> +split into several `ncfrag` packets is either sent whole or not at all.
> +
> +Crash output bypasses the bucket. While an oops, BUG() or panic() is in
> +progress every message is sent, whatever the limit says, so a small burst
> +cannot cost you part of a crash dump.
> +
> +A drop leaves nothing on the wire. On an extended target it shows up as a gap
> +in the sequence number the header carries; a basic target has no such marker.
> +
> +Capping a target at 500 messages a minute::
> +
> +  echo 60000 > ratelimit_interval_ms
> +  echo 500 > ratelimit_burst

[Severity: Medium]
Does this two-step example behave as described on the flooding target the
section is aimed at?

ratelimit_interval_ms_store() and ratelimit_burst_store() in
drivers/net/netconsole.c only publish the new values:

  dynamic_netconsole_mutex_lock();
  WRITE_ONCE(nt->ratelimit.interval, jifs);
  dynamic_netconsole_mutex_unlock();

  dynamic_netconsole_mutex_lock();
  WRITE_ONCE(nt->ratelimit.burst, burst);
  dynamic_netconsole_mutex_unlock();

In lib/ratelimit.c, ___ratelimit() re-seeds the live allowance from
rs->burst only on first use or once the interval has expired:

  if (!(rs->flags & RATELIMIT_INITIALIZED)) {
          rs->begin = jiffies;
          rs->flags |= RATELIMIT_INITIALIZED;
          atomic_set(&rs->rs_n_left, rs->burst);
  }

  if (time_is_before_jiffies(rs->begin + interval)) {
          ...
          atomic_set(&rs->rs_n_left, rs->burst);

So after the first echo starts a 60 s interval with the default burst of 10,
a flooding target drains those 10 tokens before the second shell command
runs.  Once burst=500 is stored, rs_n_left stays at 0 and every message is
dropped for the rest of the 60 s interval, while cat ratelimit_burst reports
500.  Lowering the burst mid-interval leaves the larger allowance spendable,
and the next interval is still measured from the old rs->begin.

Should the stores go through ratelimit_state_reset_interval() in
include/linux/ratelimit.h, which takes rs->lock, clears
RATELIMIT_INITIALIZED, does atomic_set(&rs->rs_n_left, rs->burst) and resets
the missed counter?  Otherwise, should this section say that a change only
takes effect at the next interval boundary?

There is also the plain load of rs->burst in the two atomic_set() calls in
___ratelimit(), which run under rs->lock.  The configfs writers hold only
dynamic_netconsole_mutex, which the console write path
netconsole_write() -> netconsole_ratelimited() -> __ratelimit() never takes,
so the locksets do not intersect.  Is that concurrent plain read against
WRITE_ONCE() something KCSAN would flag?

>
>  Append User Data
>  ----------------

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260910-netcons_ratelimit-v2-0-ebf0dd91e26e%40debian.org
