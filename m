Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6145C3E63BA;
	Fri,  8 May 2026 16:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778256832; cv=none; b=KRhuvQGtsT6Z1YO4DYJ/i0nLjfLvRgGSEhS0TgwgQrMGZomvQ9Iu64bbHFKY63cnKvCsh/iYp4Nh8nAqiZpBxCzX5QR9zSrdKb+QqiZ46UONn6A5Fogs2mftcNi0W0zGDTe5KiYwBQZTKdhHY1fhh2G53Aa8/mRckY6tKSa/kGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778256832; c=relaxed/simple;
	bh=EfKpSzPlmDhnHrj66KMeaKjnbqtdxjqOaV6980bqwuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dQ0myI2ic64Q4qtMwqe+AGCFBAHs9KJZqY1aSdh46W8/yUOw5c3KpRpRfKg6GMQpyeGrITYio7klpIfPybxxeLJ3mpJK5mEMwouksklhe78bEgwZS9zOgyvJXImPXTOb2eJvZojf9WlY+Azp3YQ8Yp7Rrf0zYHImmbXQBWBHAgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=olHxizBk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="olHxizBk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2D24C2BCC7;
	Fri,  8 May 2026 16:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778256832;
	bh=EfKpSzPlmDhnHrj66KMeaKjnbqtdxjqOaV6980bqwuI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=olHxizBkhgCbEY1Pf3vxiVVzQR/IgeaSzfq7F00VsFV5X6k2QmtYRKPT8xK/lKez8
	 ofFrrjeNr1C2DQUqsGWGRg3sE41QA5O6eNKL1AcAuSPJLAVDMWueHYy6PVLta1oxbb
	 idxua5qK+u5aeSp9sTA/UzEwWCLrKn2LYXbS+5ug8V0RWk7q57L7gnmzNVVh/2Nkpy
	 nSUB8A7ZmS4oW6tAbaOYPpiagimsFlqp+WLrVjCXnE+QKNpmwWHUrOsVpMF/rM9tze
	 ThSM/Rj3bIR/R+HnN8yKpFyWGEWCepy+H+xB98iSrhAypn3VBKPKm2qBUleoVr/Kgs
	 wC1vCDdjEPpOA==
Date: Fri, 8 May 2026 12:13:50 -0400
From: Sasha Levin <sashal@kernel.org>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Joshua Peisach <jpeisach@ubuntu.com>, corbet@lwn.net,
	akpm@linux-foundation.org, skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH] killswitch: add per-function short-circuit mitigation
 primitive
Message-ID: <af4LvqtLu-yeor-v@laps>
References: <20260507070547.2268452-1-sashal@kernel.org>
 <DIDEQIFQF1EW.11CESAK4JL4PR@ubuntu.com>
 <af4Fwxndqv2knLov@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <af4Fwxndqv2knLov@localhost.localdomain>

On Fri, May 08, 2026 at 11:48:19AM -0400, Mathieu Desnoyers wrote:
>On 08-May-2026 11:40:54 AM, Joshua Peisach wrote:
>> On Thu May 7, 2026 at 3:05 AM EDT, Sasha Levin wrote:
>> >
>> > For many such issues the simplest mitigation is to stop calling the buggy
>> > function. Killswitch provides that. An admin writes:
>> >
>> >     echo "engage af_alg_sendmsg -1" \
>> >         > /sys/kernel/security/killswitch/control
>> >
>> > After this, af_alg_sendmsg() returns -EPERM on every call without
>> > running its body. The mitigation takes effect immediately, and is dropped on
>> > the next reboot.
>> >
>> > A lot of recent kernel issues sit in code paths most installs only have enabled
>> > to support a relative minority of users: AF_ALG, ksmbd, nf_tables, vsock, ax25,
>> > and friends.
>> >
>> > For most users, the cost of "this socket family stops working for the day" is
>> > much smaller than the cost of running a known vulnerable kernel until the fix
>> > land.
>>
>> I like the concept - but is there any way to ensure that important functions
>> like malloc aren't being patched? Or some way to make sure that what is being
>> patched will not kill the entire kernel?
>>
>> I know this probably boils down to "operator has to use it correctly", but just
>> wondering if this was considered.

So I thought about it, and realized it would be very difficult to decide on
this list of functions, and even more difficult to keep it maintained over time
(functions get added, removed, refactored, ...).

>I like the idea too, it should help prevent a few devops burnouts in the
>coming weeks.
>
>One possible approach to prevent "footgun" type of killswitch use would
>be to first apply a statistics collection killswitch handler that does
>not change the behavior: it checks whether the target function is
>invoked at all on the system for a given period of time. Then it applies
>the killswitch if it was not invoked during that period. Overall
>sequence:
>
>- pre-soak killswitch for e.g. 30s, checking whether the function is
>  invoked at all. (period would be user-configurable)
>- if no calls were detected, engage killswitch, else report failure to
>  the user.
>
>This should prevent footguns such as trying to killswitch fork, malloc
>or other core functions which are inherently required.

Why not just use our good old tracing infra? Set tracepoints where ever you
want, collect any data you might need, and engage the killswitch when you're
happy with the data you have?

It feels a bit weird adding something like this into killswitch.

-- 
Thanks,
Sasha
