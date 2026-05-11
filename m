Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936203612ED;
	Mon, 11 May 2026 16:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778517938; cv=none; b=ZYkuUB6xr/50HxoD1F+ApSODbfc20yY5gTmOrPPz+LO9GQ6xc0O7Rllqs/5hxHx2S25/UQpUggqAoYIZokN7vmeOyc1np0edCXAz57/z7dMAj4Ld5jcaBPjFVCdB10/GINKoKPlYbBPEavrMson5SfglDwbcphoIEUzUHnADi18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778517938; c=relaxed/simple;
	bh=UiJneCOtz9oqRUvg1PncqTpBxGabJwB5qcPrnZz22fE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lB8EXbRaEWUkJxNXbFWKvYHNE+cJgjjdANwA8bN00LKSJj9NF5Ssv1/2xlvPFiHXSEsqdazKyNvtgET0d+b3AL5ZML+e8afqZFb0b9Od4/Vm1mpyTnfGODFqWiozZQDEQot6+mAkuSa0gED+q2egBa02QRBIyLWlFdFlmOSZKXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RreXhgbC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RreXhgbC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08E99C2BCB0;
	Mon, 11 May 2026 16:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778517938;
	bh=UiJneCOtz9oqRUvg1PncqTpBxGabJwB5qcPrnZz22fE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RreXhgbCcbPCK0LMzyu0Tb54SEGlJbtbB06RfvBFD1UURDHsWijD568EJvW3zhezU
	 Eh0bJWIZPnpGTP15GIdKB6xU0kLmS5ONes5xURNTFK7xNqVcEbVkJBYa4HXoHwqkZp
	 E/1GRYAloQzIQI3upewInb60gB2d4/6zXmtH9vt3fZ/A60m1TVNOSCeqjRYDBjl+/Y
	 TdW5+HQUR8+gyGTs7XD+6XAMLxTVLkcRwM0SxZC2bWk1BtpYCAR3gOGVx1NqOtCre0
	 Lw9ssDawZlcyCghIGuBTY4fBIA1xFplDvyrV/6gN2tt1mr0Hc/OrHcu39Cn3aTnR93
	 045nvhMvRtIkA==
Date: Mon, 11 May 2026 12:45:36 -0400
From: Sasha Levin <sashal@kernel.org>
To: Michal Hocko <mhocko@suse.com>
Cc: Breno Leitao <leitao@debian.org>,
	Andrew Morton <akpm@linux-foundation.org>, corbet@lwn.net,
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	gregkh@linuxfoundation.org
Subject: Re: [PATCH] killswitch: add per-function short-circuit mitigation
 primitive
Message-ID: <agIHsN9tiIHnVTeV@laps>
References: <20260508135630.a380e3c187b59e4c04e6f358@linux-foundation.org>
 <af5Z2IvtS5pVorSl@laps>
 <agG_PZ3qcl6TwLnL@gmail.com>
 <agHUp8ulaWJ75WU5@tiehlicka>
 <agHcFCRVSn5ra5Kc@laps>
 <agHeZPA3eHhJHIsQ@tiehlicka>
 <agHgDgwu8H9Opzpl@laps>
 <agHm9Vj7bPPCRS1g@tiehlicka>
 <agH7_QBPLWKTZucB@laps>
 <agH_bGUTvWm2h5g4@tiehlicka>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <agH_bGUTvWm2h5g4@tiehlicka>

On Mon, May 11, 2026 at 06:10:20PM +0200, Michal Hocko wrote:
>On Mon 11-05-26 11:55:41, Sasha Levin wrote:
>> On Mon, May 11, 2026 at 04:25:57PM +0200, Michal Hocko wrote:
>> > On Mon 11-05-26 09:56:30, Sasha Levin wrote:
>> > > On Mon, May 11, 2026 at 03:49:24PM +0200, Michal Hocko wrote:
>> > > > On Mon 11-05-26 09:39:32, Sasha Levin wrote:
>> > > > > On Mon, May 11, 2026 at 03:07:51PM +0200, Michal Hocko wrote:
>> > > > > In a similar way to how they would know if a given livepatch is safe to apply -
>> > > > > ideally it would be communicated by the vendor/distro/kernel team.
>> > > >
>> > > > You have missed my point. KLP takes an extra steps to make sure patching
>> > > > a particular function is safe to modify or to put the change into the
>> > > > effect.
>> > >
>> > > Safety checks like making sure the patched function is on the stack, or did you
>> > > mean something else?
>> >
>> > Yes, exactly what LP infrastructure already provides.
>>
>> But do we actually need it here?
>
>If not then you can simply systemtap or use BPF to inject the code. In
>other words we have several ways how to runtime modify the kernel so
>before yet another interface is provided (with a non-trivial amount of
>code and very limited functionality) you should really start by
>describing why none of the existing one is fitting well.
>
>I do understand your argument that solutions based on loading a module
>might have an additional step to deal with (AFAIK you do not need to
>build your own kernel to deploy your key) is that a brohibitive
>roadblock? We also do have fault injection which is much less convenient
>because of all the existing constraines but can those be elevated?
>
>So nothing really against playing with ideas nad LLMs to generated a
>quick PoC. That is all good but for this to be considered more seriously
>I think we really need to think deeper whether the existing
>infrastructure is really not fitting and if not whether it could be
>changed to cover more usecase like the one you have mentioned here and I
>believe it is something worth thinking about.

Could you describe an existing infrastructure I can use here? Let's look at
this recent "Copy Fail" thing as an example.

I can obviously build my own kernel and enroll my own key, but 99.9% of our
users won't be doing that.

Livepatching, or manually building a module that just injects a kprobe is out
of the question as we previously agreed.

systemtap falls into the same bucket as building my own module.

BPF doesn't help because bpf_override_return() requires the target to be on the
same within_error_injection_list() whitelist as fault injection, and the CVE
targets never are. Some of our fleet doesn't even have BPF enabled either, but
that's the smaller objection.

I can't use fault injection because:

  a. It's almost never built in production/distro kernels, and I suspect this
won't change.
  b. The functions I need are not whitelisted.
  c. Even if (a) and (b) were addressed, fault injection would still need a
securityfs front-end, a cmdline parser, a module-unload notifier, a taint flag,
and audit on engage and disengage. By the time those land in fail_function and
tie into/refactor the fault injection code, the net diff is bigger than this
proposal.

In my case I can remove the module, but not if I run a distro that shipped with
CONFIG_CRYPTO_USER_API_AEAD=y (like RHEL/SUSE).

I can use "initcall_blacklist=" hack and reboot, but as things stand today,
I'll need to be rebooting few times a day.

Even if I'm okay with rebooting that often (and I really really would prefer
not to), this doesn't solve the issues of a larger fleet of servers that can't
just reboot that often.

What am I missing?

-- 
Thanks,
Sasha
