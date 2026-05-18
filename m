Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6956E426D0B
	for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 12:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779108398; cv=none; b=c5vc1dAhhIQWijGPMdZTtyXvCtw80gRiiZ6Vz80Fp2ef0zhhsfBj99AMXhx6QZPNjG86CznB8Rest8BIyy881kbsh81/5jTi8PRqGKExeIlFqXrPhIuT+Cr2l/EXLFyhlBcnVJDJ5cbpHjqxigK2AiN3ad01Fk1HaxXd90kS7dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779108398; c=relaxed/simple;
	bh=WxfkEGBSDDZghQhEd8cunw4cIMQIp0QRK4UAokQx9ag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XAh7YWQWSeIjumRrAq3E8l6LXm0SnpzO5vtwlfx/6cE2ts9Xpwo9PW/uDTRGiTg07sHUbvK4xTCU/YNd2dT9Rf/8zTlFDhjnkM2deE6EM3o2U20ATdBl9EgZ/okV3h4DAHqaiK+HWx2wEghp46t/H3reZ4FCJw/CdQ3vAYCFUAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=a528SPgj; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="a528SPgj"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48fe6629235so2554625e9.1
        for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 05:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1779108395; x=1779713195; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XkbPTf87WHcjTkOIdvBF4Uyie2ELBq9sAWg2d8Lhc/w=;
        b=a528SPgjg5pAce01xmAki5KbGVZGe7/DMH0CNJkfn+YFCxFzVmAOheqstQ4lDHt9lS
         HajOEnY73LfIczgVvlgxIQXVG2gjgLXJrMkq6AF5Cmja0JChpwCDg8JKebbOLNPTD5f6
         qsLd3zoR3cGBroLyvD7fuQK0ew2BljCqWR1BugqWCycwrvEDIns/vOtWgtfkHywi7kC4
         G0WMIUwaXkNIN5Fn2Cr26uNDCjJwUAX+m6v2uxLrL9nnnru7ojU3LMsblNlGWf5MA7lo
         sPu0g+oSPjBvKn1HrPWWy+MFszfvjOcMo8T7e8ST141+hun1sJRhv+UaEsw7tXK0CmIe
         6/Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779108395; x=1779713195;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XkbPTf87WHcjTkOIdvBF4Uyie2ELBq9sAWg2d8Lhc/w=;
        b=Skr+oRzuATNOC+IWB7Nrzwa/AONw4n+XgcnLBJymeoLUCsDBf2sUcNLTf3Y/KhU05E
         qr2GFJO+Qn3GiiMDWoXntN4jHZUixUpKZfxtH2Uqt/YsV03BmCxiAVirJFEzk6jdOVSv
         jFfpdyyoKAcoOXgYDvwAUgwjs4FpIxeRwsoL6LA2G4/CN3Zqmtn5tMOMwUUNdmg19BrX
         lVsPpIMkrthuiLwMc6Pv7rJJdLbo6raat6DxS25e/Rt+fdoJscuafWFPR9/xta9cSak4
         zOdUBmfyDbRZBTFZUsfRvK5fOTV4pcHNAscEJjgdrhFjbNDI+CYnhYiKmRt9k8kfiDyI
         foFw==
X-Forwarded-Encrypted: i=1; AFNElJ92WNXlBlT/ev90aGRMa7snEE0wusfQv3O3RGPMAhEgUgzdzo6BC8NE61wQdREA8klnVbT5+WGW0Gj5YdJnu+U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeWvvZJFbO78DS7uXfR4cFi5f/+fhr/KgyY/mecFUiQZhpY44c
	VcP/GhpTT/BQy4VYNlLKKMsdWCBfueBpeMkUGoWU8GPEN5Jy6G7UrBweuDHAjqCECOg=
X-Gm-Gg: Acq92OFjxNZCEpS6qsQQMwYnq9D1Q8y45ma52kxMC9Nu8DZppJTV40BObSVMWviT0Z6
	Ts2LbzU1UzOAHDTCNHnzX2wAwAgpiOSgraRa+3k/zweQYZXpUJETFnwJ0yMGVXjPVyFAGOd0YhD
	akC37y89skhfnZvLeT8VKWQvjSF+Ec+JpZbrG9p5I1nDIhzeFjpupTgcSTXCO/IJA+jzP9evTWp
	u7VU5Ltwp39UdES4dQmWitabbg05NHynhDyYdXHbb4h6ycEgRJq1BuwmJbJuWLXnvqRABR8XErM
	v1W0lc6PDORKjRqI55EXVq7IxqUrDOnmKjuTY6fe/O4uPTkCy2aBU1Si5Kdji/IF6mSaNA29F+E
	oJufQZecrudUPrJJN1Romunt0OIIzS7NLq4G8snDrDY7FmME9g+AsGA3NJfMpyeQ1kMlwVQ9JR2
	itL/3PHDptLXg7AxdB9KWiejpe55z/5rQFzNTOJczBM3YbGOqVHLEN3cLKazXRQ3JFZt1jcZ72I
	GUy
X-Received: by 2002:a05:600c:4455:b0:489:1fa8:b895 with SMTP id 5b1f17b1804b1-48fe5fcb2dfmr116067445e9.2.1779108394716;
        Mon, 18 May 2026 05:46:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:b41:c160:6a1d:efff:fe52:1959? ([2a01:e0a:b41:c160:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5cab7c5sm265288175e9.12.2026.05.18.05.46.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 05:46:34 -0700 (PDT)
Message-ID: <5d4467d5-f081-4f7e-ac3c-9134ee8ddc6e@6wind.com>
Date: Mon, 18 May 2026 14:46:33 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH net 1/5] net: rtnetlink: fix link nsid reported when the
 link is local
To: Ilya Maximets <i.maximets@ovn.org>, Jiri Benc <jbenc@redhat.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Donald Hunter <donald.hunter@gmail.com>, Shuah Khan <shuah@kernel.org>,
 Adrian Moreno <amorenoz@redhat.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Matteo Perin <matteo.perin@canonical.com>
References: <20260515201937.2813983-1-i.maximets@ovn.org>
 <20260515201937.2813983-2-i.maximets@ovn.org>
 <20260518082138.37522db0@griffin>
 <8aa4e92d-0498-4335-b3b1-dabd7e507ed7@ovn.org>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <8aa4e92d-0498-4335-b3b1-dabd7e507ed7@ovn.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 18/05/2026 à 14:11, Ilya Maximets a écrit :
> On 5/18/26 8:21 AM, Jiri Benc wrote:
>> Hi Ilya,
> 
> Hi, Jiri.  Thanks for your thoughts on the matter!
> 
>>
>> IIRC this was added because Open vSwitch needed it. I'd expect most
>> users that need to deal with cross-namespace detection to just switch
>> to the given netns prior to issuing RTM_GETLINK; at least, that's what
>> I'm doing in the tools I wrote.
> 
> Yeah, that's also what other projects like FRR are doing.  It's a bit
> of a hustle for multi-threaded applications, as AFAIK, there is no way
> to just move one thread into a different namespace, so if many threads
> are doing something with the network and you suddenly need to check
> something in a different namespace, you can't really do that without
> pausing all other threads first.  But that's a separate thing, unrelated
> to the series.  I'm just ranting. :) 
Hmm, not sure to understand. setns() is per thread (see man setns()).

> 
>>
>> On Fri, 15 May 2026 22:19:20 +0200, Ilya Maximets wrote:
>>> But this doesn't work for link nsid in cross-namespace RTM_GETLINK
>>> requests.  For some reason the code checks if the original device
>>> and the link are in the same namespace and not if the querier's
>>> namespace is the same as the link's.  So the logic becomes:
>>>
>>> - if NSID is not reported, then the link is in the same namespace
>>>   as the queried device.
>>> - if NSID is reported, then the link is not in the same namespace
>>>   with the queried device.
>>
>> I'm not sure I would call this a bug; the original idea was to use
>> IFLA_IF_NETNSID to switch to the point of view of that netns but
>> without actually switching to that netns. Hence, the netnsid is
>> relative to the caller's netns but otherwise, you get the same reply as
>> you would if you switched to that netns. If you think about it that
>> way, the current reply is consistent.
> 
> It makes some sense, but the fact that all-nsid notification and the
> cross-namespace RTM_GETLINK provide different IDs makes it inconsistent
> in my brain.  We have:
> 
> 1. nsenter(target) + getlink(local) = target-to-link nsid.
> 2. getlink(target) = caller-to-target nsid  + caller-to-link nsid.
> 3. all-nsid-notiication = cmsg(caller-to-target nsid) + target-to-link nsid.

all-nsid-notification appears before cross-getlink.
The goal, for all-nsid-notification, was to be able to receive netlink messages
of a subset of netns in one socket. So these messages are provided as-is, ie
like if they were sent on a netlink socket opened in the corresponding netns.
It's generic, there is no need to patch every subsystem.

cross-get*() have been added later. The chosen behavior is friendlier at the
cost of patching every subsystem that is supported.

[snip]

> If we don't consider this behavior as a bug than I'd rather just document
> it and solidify in tests, i.e. drop the code change and update the tests
> I made in the patch 2/5 to make it clear what is the actual behavior.
> If we change the logic in the next tree only, it will not be possible for
> applications to understand what is the behavior without checking the
> kernel version or introduction of extra flags, i.e. we'd have to make the
> new behavior opt-in.  Which may be fine, I suppose, but will require
> application changes to take advantage of.
+1

Regards,
Nicolas
