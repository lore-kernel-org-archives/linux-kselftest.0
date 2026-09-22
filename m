Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060EF522EE0;
	Tue, 22 Sep 2026 22:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790116692; cv=none; b=cK8O6qypjLXM5ooAhFxdIalOb1k81cdS5d4NJAvYFL63ShHOXO7NomvuSdFWR649AGiV+2C082swGds+gJf7zvCC4JY9MAnGVSgyOpNBgLAnRZNqQL3Q/rKormSL45PmJWLSWOGnZDm6VxbXris7Hiu8ONwjTeHXS8J3iNRgNkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790116692; c=relaxed/simple;
	bh=Kd2xmQx1B6Fhb4HfCOjX/bzyprZqy3oVCjhs0bkA+kQ=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DAOJsxXk+WijQr8ElA8o0DnXBwaR5xnCLiy2LDDtOOObk6XVz/J/CBsy8yUbmZMiHgLLGWcIEZ6qB0qEtJx2/CJKNAm9ikUB0hGPzrAieQx6GNnnGly6AC5g6LfVNLFVYcWZbQ40S9f6keWrMX1SOrxoLcCrCpLaAN/7B5jKUhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ayic1V3i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ayic1V3i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22F921F000FF;
	Tue, 22 Sep 2026 22:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790116680;
	bh=M3PZkslH3h5r4cxJsjU2sMMqI/7Ln2Gz9rJUcgdRE+s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Ayic1V3iVReHA16nFgKA3/s0vUtr8IAAyVraemrj+8WZVKAX1iCW/8ITY6RW+XD+X
	 6gg48CZb+4Tux5vwGmlYHDmNI3Romi11Bb3ONeKT0Q12DGeQG0Jq8xEvXkotVouhoc
	 HT1Du5eoPJIvEd1tghdEmfs3Dn/r/HRN5gL+vTZgz92aCCS/Be6+iGbM8fsEUvATIk
	 zw2kJoj3ym8sOyyTgH727RMheMPZT1tUoLwBSd9U3PzMrmLbFZeIo4rju9coUbHThi
	 l295RWRdnc43wxdZRjZjADgi2Kyc+oHy/FBRhnIIhg2/mzQearv2pdxjgz8Fcs1Nc0
	 Oc8jEq0sgTb4w==
Subject: Re: [PATCH net-next v3 1/2] ipv6: update NUD_FAILED neighbors from NA
 messages
From: netdev-bot+sashiko@kernel.org
To: lfqlee314@gmail.com
Cc: dsahern@kernel.org, idosch@nvidia.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 rdunlap@infradead.org, netdev@vger.kernel.org, aajith@arista.com,
 roopa@nvidia.com, jhpark1013@gmail.com, corbet@lwn.net,
 skhan@linuxfoundation.org, shuah@kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 22 Sep 2026 22:37:58 +0000
Message-ID: <179011667864.2160803.5487538537038042784@kernel.org>
In-Reply-To:
 <e5b7a4f8cbd7c436b463b3751bf283ce861fcfaa.1789734885.git.lfqlee314@gmail.com>
References:
 <e5b7a4f8cbd7c436b463b3751bf283ce861fcfaa.1789734885.git.lfqlee314@gmail.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] Claimed missing selftest coverage for the newly documented
  FAILED->STALE behaviour of accept_untracked_na: the in-tree tests…

--

ipv6: update NUD_FAILED neighbors from NA messages

This changes ndisc_recv_na() so that a neighbor entry in NUD_FAILED is
treated like an absent entry and moved to STALE when accept_untracked_na
is enabled and forwarding is on. The ip-sysctl documentation for
accept_untracked_na is updated to describe the new FAILED handling.

Link: https://lore.kernel.org/r/20260813233344.445265-1-lfqlee314@gmail.com

> diff --git a/Documentation/networking/ip-sysctl.rst b/Documentation/networking/ip-sysctl.rst
> index f7af0286341c..685c84cf543d 100644
> --- a/Documentation/networking/ip-sysctl.rst
> +++ b/Documentation/networking/ip-sysctl.rst
> @@ -3225,18 +3225,19 @@ drop_unsolicited_na - BOOLEAN
>  	Default: 0 (disabled).
>  
>  accept_untracked_na - INTEGER
> -	Define behavior for accepting neighbor advertisements from devices that
> -	are absent in the neighbor cache:
> +	Define behavior for accepting neighbor advertisements for IPv6 addresses
> +	that are absent from the neighbor cache or whose entries are in FAILED
> +	state:
>  
> -	- 0 - (default) Do not accept unsolicited and untracked neighbor
> -	  advertisements.
> +	- 0 - (default) Do not create new neighbor cache entries or update
> +	  FAILED entries from neighbor advertisements.
>  
> -	- 1 - Add a new neighbor cache entry in STALE state for routers on
> -	  receiving a neighbor advertisement (either solicited or unsolicited)
> -	  with target link-layer address option specified if no neighbor entry
> -	  is already present for the advertised IPv6 address. Without this knob,
> -	  NAs received for untracked addresses (absent in neighbor cache) are
> -	  silently ignored.
> +	- 1 - For routers, add a new neighbor cache entry or update an existing
> +	  FAILED entry to STALE upon receiving a neighbor advertisement (either
> +	  solicited or unsolicited) with the target link-layer address option
> +	  specified. Without this knob, NAs received for untracked addresses
> +	  (absent from the neighbor cache or in FAILED state) are silently
> +	  ignored.
>  
>  	  This is as per router-side behavior documented in RFC9131.
>  
> @@ -3251,9 +3252,10 @@ accept_untracked_na - INTEGER
>  	  used in conjunction with the ndisc_notify setting on the host to
>  	  satisfy this prerequisite.
>  
> -	- 2 - Extend option (1) to add a new neighbor cache entry only if the
> -	  source IP address is in the same subnet as an address configured on
> -	  the interface that received the neighbor advertisement.
> +	- 2 - Extend option (1) to add a new neighbor cache entry or update a
> +	  FAILED entry only if the source IP address is in the same subnet as
> +	  an address configured on the interface that received the neighbor
> +	  advertisement.

[ ... ]

> diff --git a/net/ipv6/ndisc.c b/net/ipv6/ndisc.c
> index 90cd5d852569..12d85d7f8234 100644
> --- a/net/ipv6/ndisc.c
> +++ b/net/ipv6/ndisc.c

[ ... ]

> @@ -1067,34 +1067,39 @@ static enum skb_drop_reason ndisc_recv_na(struct sk_buff *skb)
>  	new_state = msg->icmph.icmp6_solicited ? NUD_REACHABLE : NUD_STALE;
> -	if (!neigh && lladdr && idev && READ_ONCE(idev->cnf.forwarding)) {
> -		if (accept_untracked_na(idev, saddr)) {
> -			neigh = neigh_create(tbl, &msg->target, dev);
> -			new_state = NUD_STALE;
> +	if (!neigh || (READ_ONCE(neigh->nud_state) & NUD_FAILED)) {
> +		if (!lladdr || !idev || !READ_ONCE(idev->cnf.forwarding) ||
> +		    !accept_untracked_na(idev, saddr)) {
> +			if (neigh)
> +				neigh_release(neigh);
> +			return reason;
>  		}
> +		if (!neigh)
> +			neigh = neigh_create(tbl, &msg->target, dev);
> +		new_state = NUD_STALE;
>  	}

[Severity: Low]
This isn't a bug, but a note on test coverage for the new FAILED branch in
ndisc_recv_na().

At the time this patch is applied on its own, the in-tree selftests only
walk the "absent entry" rows of the matrix: the matrix comment in
tools/testing/selftests/net/ndisc_unsolicited_na_test.sh and verify_ndisc()
start from an empty neighbor cache, and arp_ndisc_untracked_subnets.sh does
the same for the accept=2 subnet rule. That leaves the new

	if (!neigh || (READ_ONCE(neigh->nud_state) & NUD_FAILED)) {

path, and the FAILED rows now documented for accept_untracked_na, without a
test.

This is addressed later in the same series by "selftests: net: test
untracked NA recovery of FAILED neighbors", which extends the matrix
comment in ndisc_unsolicited_na_test.sh with the six "failed" rows, adds
initial_state/same_subnet parameters to verify_ndisc() and
test_unsolicited_na_common() that seed the entry with

	ip neigh replace ${HOST_ADDR} dev ${ROUTER_INTF} nud failed extern_learn

and then adds cases for accept=1, accept=0, forwarding=0, drop=1 and both
in-prefix and out-of-prefix accept=2, checking that the lladdr is learned
for the STALE rows and absent for the rows that must stay FAILED. So the
gap exists only for this commit in isolation, not for the final state of
the series.

Would it be worth mentioning the follow-up selftest patch in this commit
message so the coverage relationship is visible when this commit is read
alone?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/cover.1789734885.git.lfqlee314%40gmail.com
