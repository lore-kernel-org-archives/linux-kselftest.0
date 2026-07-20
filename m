Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BD22DCC01;
	Mon, 20 Jul 2026 15:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784561092; cv=none; b=KiL2/EO+NeEN5gOcp3O1DH3WcycYdAfo2RxY5m5vg2fUtX3u0zVYEWEGKx/xPm5CgJDCYxqW5YI4/+2+YK1kbBT9fsMrR5IelwBmAMQO+0mhXhiuiVAJpAQszfHrsEyCa145Zyk0NcBo556zDNhuYpw0AWY9EkQ7B8ELcckf4VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784561092; c=relaxed/simple;
	bh=ymcbTeXmDfJ6awYH8DFtK/WXkS2ETAzY7tU8WMEsN68=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Upce2JA+vceUlvmsms+aJNF8nqXgYoRvQt5MbUGOeu56+sj3nVPrwXjIZjjHt6wX4kcjST6vXmuJ264ZqyOtH9KrPIrKTuUH8PjfUnx+G6kHjAt6ycNPMJYSIJ+DlrINcAwiqD04ZHAabArUV+dFj45iDUWypXwU/YLjXfuWQCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cNO3ehi5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cNO3ehi5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 295AB1F000E9;
	Mon, 20 Jul 2026 15:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784561091;
	bh=kRxdxCpXj33EGcXAfxauYed1Qq0XyKE7iv2tK4kjXXo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=cNO3ehi5fXeWwxX+jIK3v5GoHL2cSh2FOfF9K80sWB60yUUVDhbMcRgCMmC0Vv4Mp
	 SRALUxTDWJlRqu81J7m+UlclXTMy+uR42HUhRPmPSKcBtp0BAYztKJhJAZy7+BTqm5
	 b2nV6f6DJJdFZRFLEJRTLzpWbWrKnS9ijGXFa2TjZKys1mFH7IVDz82Y3NJaUYSloW
	 +2/JlmaZZX1UEAm09Rpb3iiQuS5z7caCr2bmJZE3QMmFYIToJJadDrofPtJdHo3TdS
	 EF+PqtiuZ02a9jpU9DRZunB5/phZpV6305fFpUJhjU9BjYrUv5SW12i/MNG9WTUxTk
	 A81waEOUlqtYA==
Message-ID: <d6b07d51-7026-4759-bb99-a3bf3b9560af@kernel.org>
Date: Mon, 20 Jul 2026 17:24:45 +0200
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
 <a2032420-b4d4-4eba-9eb4-65eeeea2b63b@kernel.org>
 <f7t7bmppvpu.fsf@redhat.com>
From: Matthieu Baerts <matttbe@kernel.org>
Autocrypt: addr=matttbe@kernel.org; keydata=
 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
 lzVbFe7fduHbABmYz9cefQpO7wDE/Q==
Organization: NGI0 Core
In-Reply-To: <f7t7bmppvpu.fsf@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/07/2026 16:43, Aaron Conole wrote:
> Matthieu Baerts <matttbe@kernel.org> writes:
> 
>> Hi Aaron,
>>
>> Thank you for the review!
>>
>> On 16/07/2026 22:00, Aaron Conole wrote:
>>> Aaron Conole <aconole@redhat.com> writes:
>>>> "Matthieu Baerts (NGI0)" <matttbe@kernel.org> writes:
>>>>
>>>>> The kselftests doc mentions that a config file should be present "if a
>>>>> test needs specific kernel config options enabled". This selftest
>>>>> requires some kernel config, but no config file was provided.
>>>>>
>>>>> We could say that a sub-target could use the parent's config file, but
>>>>> the kselftests doc doesn't mention anything about that. Plus the
>>>>> net/openvswitch target is the only net target without a config file.
>>>>
>>>> We've been operating on that assumption from the openvswitch side, but
>>>> it's true that isn't explicitly documented anywhere, and I guess it
>>>> isn't officially supported in the kselftest framework.  I guess we'll
>>>> need to keep updating this config as we add tests for things like SCTP,
>>>> and others, and maybe that's a good thing like we can add a comment
>>>> describing which tests take which configs.
>>>>
>>>> The downside is for most of the OVS testing we use the NIPA scripts
>>>> and those 'inherit' the parent config, so it would be a change on our
>>>> side from the development standpoint (but probably something we should
>>>> have been doing from the beginning).
>>>>
>>>> That said, would it be worth also exploring the 'cascading
>>>> configuration' support?  It seems like a useful feature, but maybe it
>>>> should be a separate discussion.  I ask because of how OVS interacts
>>>> with the networking stack as an 'alternative bridge' so-to-speak, I do
>>>> worry about having to duplicate lots of configurations between the two
>>>> as we expand the test coverage on OVS side.
>>
>> It is not clear to me what you are using on your side, but I guess it
>> should be doable to modify some scripts to merge this new config file
>> and the net one in your case.
> 
> This doesn't seem to break the NIPA case (at least I can see the
> 'contest test' output is not SKIP, but PASS for the openvswitch.sh).

Note that currently, the net/openvswitch target on NIPA is executed on
the same runner as the net one. In other words, the config files are
merged, so at the end, my patch shouldn't change anything with the way
NIPA is currently deployed (but that could change).

> I'm not sure about the suggestion to change the script in
> tools/testing/selftests/net/openvswitch/openvswitch.sh to do a config
> merge.  It isn't out-of-tree or anything, and seems like that would
> create confusing git state (and not desirable from my end) - the
> upstream test would leave a modified, tracked file.  Was that your
> suggestion?  Or do you mean NIPA itself (but I think it already just
> uses the top-level config).

No, sorry, I thought my modification would have caused issues with other
tests on your side. Good to hear it is not.

> The config change itself looks fine to me.

Thank you!

>>>>> Here is a new config file, which is a trimmed version of the net one,
>>>>> with hopefully the minimal required kconfig on top of 'make defconfig'.
>>>>
>>>> Should this also remove the OVS configs from the upper level since there
>>>> shouldn't be OVS tests executing there (ie: CONFIG_OPENVSWITCH*)?
>>>
>>> Actually, forget this part.  The P-MTU tests in pmtu.sh use ovs to
>>> create a datapath through OVS.  So these configurations need to stay at
>>> the top level as well.
>>
>> Indeed. I don't know these tests well, but maybe this P-MTU selftest
>> should move to the net/openvswitch target?
> 
> Well, it is testing path MTU across multiple topologies, so it isn't
> really an openvswitch specific test.  Just one that happens to use
> openvswitch in one of the test cases.

OK, it is fine there then.

Note that the openvswitch test could also be moved to the 'net' one. It
looks like the sub-targets are often created when there are multiple
tests linked to one sub-subsystem, and also because the 'net' config is
quite big, and it takes time to compile all that. But I'm not pushing
for one or the other, I just wanted to be able to build all targets in
small containers :)

Cheers,
Matt
