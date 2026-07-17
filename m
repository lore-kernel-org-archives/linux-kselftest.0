Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6AF3DCDB8;
	Mon, 20 Jul 2026 10:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784544337; cv=none; b=PTqHMM8/M3G5xV+UkXDfRfC3EDTht7NGWcMssW8d9PBpyADoCcp6/RyYW6SEKnSL4t0hLIPwKVdyu7obG/crVeROEghEuzprM0Qhqf2kg14lIfjW6bDMe+zDIvvUkKHJY5PW10U7U11dpO7MVj2NhT/1sYiDXlfJlGK1RLGOh4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784544337; c=relaxed/simple;
	bh=MlxqWeiE6tsf8W9+sfld5R9phc0gq1uQlBrKlOyQpMU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m+CVKcyXlcbQum5ZQaKHLrci1vzN/ZsqIDQOa8jDNZp6xMq4CfbxY4AUUsCibl2ub/QidbcCI0Ph0ENjYHxeNBNct+G6P1hPaAlB47dnWuRep2XU5Aaoj1gZAqsJkP6KzbRrAUDKF4ZD07Sa18k+k502JwIs9gbDA8Sf7wej8Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gtfZ9DH3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gtfZ9DH3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 460361F00ACA;
	Mon, 20 Jul 2026 10:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784544326;
	bh=kAKwZoMl8zfM1IKWWXLdaShgbpyX5BEygwE8yNjgwAk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=gtfZ9DH3XL45kMOqHb5Sv3ltPyhBqebfF+2Fvwj2zIKZmYyY2ROFRqiLX46GzKv0B
	 a2jo4c4pdPSYgr+WevsD8G8v0dbgyXBoViKlRoJhD+ybBS1Y4Or2G25Q5FUtOAPC76
	 6UbkBIUsYJjx4oo0G6+FGnQPUfkTwmjcMQ15z0NJwsYM+TQASK5Wx3TtV5pVcOL2Rl
	 d0NFfg39zPS1ZLerd/K+ohFp0Cr+YNkv4DG02k1TjNq9Da9bjh/02ndiNpSe6WVAis
	 LxinjV45wcxeohqso0ZVYKNHK5EdLI29Iv2zfhSP0pSrsCRzNAvd1FfKhNPkMFK0sF
	 RbsvGxZMtfKbw==
Message-ID: <a2032420-b4d4-4eba-9eb4-65eeeea2b63b@kernel.org>
Date: Fri, 17 Jul 2026 11:39:34 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH net 2/7] selftests: openvswitch: add config file
Content-Language: fr
To: Aaron Conole <aconole@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eelco Chaudron <echaudro@redhat.com>, Ilya Maximets <i.maximets@ovn.org>,
 dev@openvswitch.org
References: <20260710-net-sft-fix-containers-v1-0-a2915c294ef5@kernel.org>
 <20260710-net-sft-fix-containers-v1-2-a2915c294ef5@kernel.org>
 <f7t5x2frlkh.fsf@redhat.com> <f7tldbar9gp.fsf@redhat.com>
From: Matthieu Baerts <matttbe@kernel.org>
Autocrypt: addr=matttbe@kernel.org; keydata=
 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
 lzVbFe7fduHbABmYz9cefQpO7wDE/Q==
Organization: NGI0 Core
In-Reply-To: <f7tldbar9gp.fsf@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Aaron,

Thank you for the review!

On 16/07/2026 22:00, Aaron Conole wrote:
> Aaron Conole <aconole@redhat.com> writes:
>> "Matthieu Baerts (NGI0)" <matttbe@kernel.org> writes:
>>
>>> The kselftests doc mentions that a config file should be present "if a
>>> test needs specific kernel config options enabled". This selftest
>>> requires some kernel config, but no config file was provided.
>>>
>>> We could say that a sub-target could use the parent's config file, but
>>> the kselftests doc doesn't mention anything about that. Plus the
>>> net/openvswitch target is the only net target without a config file.
>>
>> We've been operating on that assumption from the openvswitch side, but
>> it's true that isn't explicitly documented anywhere, and I guess it
>> isn't officially supported in the kselftest framework.  I guess we'll
>> need to keep updating this config as we add tests for things like SCTP,
>> and others, and maybe that's a good thing like we can add a comment
>> describing which tests take which configs.
>>
>> The downside is for most of the OVS testing we use the NIPA scripts
>> and those 'inherit' the parent config, so it would be a change on our
>> side from the development standpoint (but probably something we should
>> have been doing from the beginning).
>>
>> That said, would it be worth also exploring the 'cascading
>> configuration' support?  It seems like a useful feature, but maybe it
>> should be a separate discussion.  I ask because of how OVS interacts
>> with the networking stack as an 'alternative bridge' so-to-speak, I do
>> worry about having to duplicate lots of configurations between the two
>> as we expand the test coverage on OVS side.

It is not clear to me what you are using on your side, but I guess it
should be doable to modify some scripts to merge this new config file
and the net one in your case.

>>> Here is a new config file, which is a trimmed version of the net one,
>>> with hopefully the minimal required kconfig on top of 'make defconfig'.
>>
>> Should this also remove the OVS configs from the upper level since there
>> shouldn't be OVS tests executing there (ie: CONFIG_OPENVSWITCH*)?
> 
> Actually, forget this part.  The P-MTU tests in pmtu.sh use ovs to
> create a datapath through OVS.  So these configurations need to stay at
> the top level as well.

Indeed. I don't know these tests well, but maybe this P-MTU selftest
should move to the net/openvswitch target?

Cheers,
Matt
