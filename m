Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AB836D9EB;
	Mon, 11 May 2026 11:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778498112; cv=none; b=DhtYdEm2eKicuWYICW0z8CTFhz40MGHEZ2S82VHNccoP6v0SW84n6LCS2RXQ99YlJhBdC2HLvASeqizlZsE9fXw81AESOmIV06aWCuAttzJ2YH1Hf0l3s3vtDRldnn8fWCfJHHZ4syO5ZqOn+amsh+q4gJkXpdnPOT2UlVqdSfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778498112; c=relaxed/simple;
	bh=ElrPpKBp3fd+ZhRibKu8+r6dTTJfyvDO6LAP9uGzQkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=geiNLmNDR2XDthVkkVK4gPiIJPVnlAMMp97Y+fyXPCcjFI1sn0QbScsQTI46p0LCGTmQb8xjSYS+k25Omk2+7kHr3JhOOnwDBkCnoBNixu8pZl95PQ1IaD/ZhNYto8ZGpXzMej9KR4zLTBplkn8EBVcxhPOF8eVjvhckvXhPHUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nTO30HO7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nTO30HO7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D256C2BCB0;
	Mon, 11 May 2026 11:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778498111;
	bh=ElrPpKBp3fd+ZhRibKu8+r6dTTJfyvDO6LAP9uGzQkA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nTO30HO7dDn0MRGf2rxg9Diwwu+bS4xstiDZip7mvqVI8t0ip8fh8HQu4McpeHEnB
	 cCQ0rRWgLTwAC56C33HFbLMPCkxmbX4XrlEFnVQUJ12iEsEeiwSSueIOyG0x0nZKac
	 +I2EPVbMsfnijvkHQzd8zVNDz4N9GxU5KA3HIgHPYHOKy8TDVFgYFqwrUc4IaLgmgq
	 DlZ5YRVs/ZI/H4P2D0HZRJkj0i9ChaC1cOVWrpSr/WmL+hpwLPU/VQfGNlPtuF6ykb
	 F7lLI7JO1f6iIOC3e+cf9X141xeS0IL4HGYGQWgMgrlObqvFrU8NVR5cbyIv2iZqpO
	 dJSfpatJZKz6w==
Date: Mon, 11 May 2026 07:15:10 -0400
From: Sasha Levin <sashal@kernel.org>
To: Anthony Iliopoulos <ailiop@suse.com>
Cc: Florian Weimer <fw@deneb.enyo.de>, corbet@lwn.net,
	akpm@linux-foundation.org, skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH v2] killswitch: add per-function short-circuit mitigation
 primitive
Message-ID: <agG6PnVAFMsb3iiz@laps>
References: <20260508195749.1885522-1-sashal@kernel.org>
 <87ecjku6y7.fsf@mid.deneb.enyo.de>
 <af8pw54Y-Q18kSR0@laps>
 <agGweC12aloH8DBq@foo>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <agGweC12aloH8DBq@foo>

On Mon, May 11, 2026 at 12:33:28PM +0200, Anthony Iliopoulos wrote:
>On Sat, May 09, 2026 at 08:34:11AM -0400, Sasha Levin wrote:
>> On Sat, May 09, 2026 at 02:02:24PM +0200, Florian Weimer wrote:
>> > * Sasha Levin:
>> >
>> > > When a kernel (security) issue goes public, fleets stay exposed until a patched
>> > > kernel is built, distributed, and rebooted into.
>> > >
>> > > For many such issues the simplest mitigation is to stop calling the buggy
>> > > function. Killswitch provides that. An admin writes:
>> > >
>> > >     echo "engage af_alg_sendmsg -1" \
>> > >         > /sys/kernel/security/killswitch/control
>> > >
>> > > After this, af_alg_sendmsg() returns -EPERM on every call without
>> > > running its body. The mitigation takes effect immediately, and is dropped on
>> > > the next reboot -- by which point a patched kernel is hopefully in place.
>> >
>> > Do you expect this to be safe to enable in kernel lockdown mode (i.e.,
>> > with typical Secure Boot configurations in distributions)?
>>
>> Yes: under lockdown, killswitch has to be configured on the cmdline. Runtime
>> engage is gated on the new LOCKDOWN_KILLSWITCH reason.
>
>Basically this proposal allows for any function to be overridden on a
>production kernel as long as no lockdown level is enabled, which is quite
>dangerous.
>
>Assuming this is acceptable (which I am not sure it should be), then this
>is equivalent to the existing error injection code that we already have in
>the kernel (CONFIG_FAIL_FUNCTION) minus the explicit whitelisting on a per
>function basis required to permit injection.

The mechanism is the same, but I don't think reusing fail_function works for
what killswitch is trying to do.

>Given that this achieves the exact same result, then why don't we consider
>simply removing the whitelisting restriction from fail_function altogether
>and use that instead? The only thing missing then would be the boot param
>parsing and setup.

fail_function lives in debugfs, and on a typical Secure Boot distro debugfs is
itself blocked by LOCKDOWN_DEBUGFS at integrity level. Dropping the whitelist
doesn't help when the operator can't write to the file in the first place.
Killswitch is in securityfs so that engaging it can be its own lockdown
decision rather than being lumped in with everything debugfs exposes.

Fault injection in general isn't enabled on production kernels - having to
enable CONFIG_FUNCTION_ERROR_INJECTION will drag in that entire infra into
kernels that don't need it.

>This way we'll be removing a few hundred lines of code instead of adding
>more duplication, while enabling the same functionality.

I'm not even sure there would be hundreds of lines saved here...

The pieces that make killswitch what it is (cmdline parser,
LOCKDOWN_KILLSWITCH, TAINT_KILLSWITCH, audit on engage and disengage, the
module-unload notifier, etc) add up to roughly 200 lines that would move into
fail_function unchanged. I really don't think we'd end up with much of a line
delta.

That said, the kprobe and override machinery underneath both of these is fair
game for a shared helper that fail_function and killswitch both build on. We can
look at extracting that as a follow-up once killswitch lands, but it's a
separate piece of work from the policy questions in this thread.

-- 
Thanks,
Sasha
