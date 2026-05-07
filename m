Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8EF3F9F36;
	Thu,  7 May 2026 13:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778161255; cv=none; b=CFQ+4XgTS+iNbr/+13Ru5IRN0TbZ7AqoGyALpJMUmSp8Pg/QAYbcs70wswW4SAb0szdKYC9+PhctyHIZ4WJUjzKdCgH/PPq/5tJPQaxmrOrY7QRR0cVycqVZSjZbEKkxEM/YjBKBBelKxvrBzupG5UpPuKwkNr5khrIlL9ZfWF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778161255; c=relaxed/simple;
	bh=0FHyVkyi+oT3tdJ6Ve/Ey5ZbOMLeo98h5Ctga3Reg1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nv2LvSWh25Rmh9CimGGxdir/VOgpzPDnSIFuE4hB/0hqkzoNOPqlH8erSoQ97nmdrfu7JCgCsrjaA6ZjC4Z1m8v5UZpBB6fTqWt/JBCYCofhk4fAfRyku2IU1VHcpRr6H3Tl3AMvGDychcmO3Gl9hZ0uXQ2s1wFprGSx5PEABXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pA/I/viA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pA/I/viA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24B8BC2BCB2;
	Thu,  7 May 2026 13:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778161255;
	bh=0FHyVkyi+oT3tdJ6Ve/Ey5ZbOMLeo98h5Ctga3Reg1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pA/I/viA6Rh3l7mRfHWkAEDcYUZI4dprk8ie6mmkl8AWSvuBUpwFEpVqt3lb6Asn3
	 lFbIEFYTtCfHQACKJkvCUsktCD/N5uLniwd3A4E54DoHtHjew7MEdA9Ta2QAKQVP1U
	 M3gn3lkkbHwpoy6HjQ4DUi2YV0K7EDwBdF2WT95mpEkYSVslhEZGvFXySmeYLLoRLL
	 x14a2KqHuNfSIprdjFioyM2qD1qi1sfj+DQ0tCjoF67Yl6kykAVtMJmHXkLGYOySbA
	 YgcT8y7WeJn0eM6zuI/BUSZtRulpIE/yUrDvVwuFMdtqR3t6T+HTBIywXCpwxJKxv3
	 7Ku/dRwhnfXRQ==
Date: Thu, 7 May 2026 09:40:44 -0400
From: Sasha Levin <sashal@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: corbet@lwn.net, akpm@linux-foundation.org, skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] killswitch: add per-function short-circuit mitigation
 primitive
Message-ID: <afyWXIsqqgMpxVIb@laps>
References: <20260507070547.2268452-1-sashal@kernel.org>
 <2026050739-football-dreamy-351f@gregkh>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <2026050739-football-dreamy-351f@gregkh>

On Thu, May 07, 2026 at 12:47:43PM +0200, Greg KH wrote:
>On Thu, May 07, 2026 at 03:05:45AM -0400, Sasha Levin wrote:
>> When a (security) issue goes public, fleets stay exposed until a patched kernel
>> is built, distributed, and rebooted into.
>>
>> For many such issues the simplest mitigation is to stop calling the buggy
>> function. Killswitch provides that. An admin writes:
>>
>>     echo "engage af_alg_sendmsg -1" \
>>         > /sys/kernel/security/killswitch/control
>>
>> After this, af_alg_sendmsg() returns -EPERM on every call without
>> running its body. The mitigation takes effect immediately, and is dropped on
>> the next reboot.
>>
>> A lot of recent kernel issues sit in code paths most installs only have enabled
>> to support a relative minority of users: AF_ALG, ksmbd, nf_tables, vsock, ax25,
>> and friends.
>>
>> For most users, the cost of "this socket family stops working for the day" is
>> much smaller than the cost of running a known vulnerable kernel until the fix
>> land.
>>
>> Assisted-by: Claude:claude-opus-4-7
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>
>This is kind of funny, but understandable.  Odds are a distro would want
>to pick this up so that they can enable this for when their kernel
>updates do not get out to users quick enough.

I figure that even if the new kernel does go out in a timely manner, there are
still days (weeks? months?) between when a new kernel is available and when the
user reboots.

Might as well try and improve their chances of survival during that period :)

>One question:
>
>> +struct ks_attr {
>> +	struct list_head	list;
>> +	struct kprobe		kp;
>> +	atomic_long_t		retval;
>
>Why is this an atomic value?  Shouldn't it be whatever the userspace
>return type is?

The return register is `long` on every arch.

While testing this, I added the ability to modify the return value after we
create a killswitch, and figured that it could be a useful thing to keep in the
code.

But then I got worried about a race between a user changing the return value of
the killswitch and some program trying to execute the code, and getting some
combination of the old and the new return value.

Is that a real concern? I'm not sure - but making this atomic was cheap enough.

>> +	/* false once disengaged; per-fn file ops then return -EIDRM. */
>> +	bool			engaged;
>> +	unsigned long __percpu	*hits;
>> +	struct dentry		*dir;
>> +	/* engaged_list holds one ref; each open per-fn fd holds one. */
>> +	refcount_t		refcnt;
>
>Why is a refcnt needed?  Why not use a kref instead?

Ugh... no good reason, I can switch to a kref.

-- 
Thanks,
Sasha
