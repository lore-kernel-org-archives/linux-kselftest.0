Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE37B3191C8
	for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 14:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779116392; cv=none; b=OULe80SOrNLUV4PxU/HQjHBA+zlmIZpCiz1WnvLTU/oI4ZgZ542Tf5HcJ2cUwCjADPfuhaNxFmahlNgjDh5lZPvSPtQAeOECmttlvvbMkqcfT2ue5o5cjhxaxFhJoWhMZuU+sJHKuJmIcvA0DH5hOB3Iy1IC0ttAmSfyNkzNzqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779116392; c=relaxed/simple;
	bh=q5XjFVsg+wspXS1sy3GAW2RwWv7+/Bq5enFbkQl7p2o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OWX+JyFPaqHfs6zR+nV4aO/oaA8f309bsWNlzjTVOvPBsxJ/1Bh+GCUIzbzxM3ihu9eH8/HhzAVoNIIZTNwlYm0SvGqdI/xi1eVKyqD0kFRYvUL9Cd2THubfSaS2GIFY/hXQssmfhJlOK0TJQNpvJ7Qc4v0ogBm25vkebiTbSN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=gkcBv69a; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="gkcBv69a"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488a8f97f6bso4668505e9.2
        for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 07:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1779116385; x=1779721185; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vEWJGaCfr5moVa77HgCo0qOe0dfMae5hZJol18Jq5qo=;
        b=gkcBv69aqEtaBfZIhAqzwk6MhCvg9sxndlPNwSU0oSXzwKpw2m/eYtV47Rc8+boIjq
         9TnUur6JbYwXGCbbLIhWbfGnWDTxGWv2pcnzgbp6qFGc9sXH080s5eWWgiCSP9KDqbNZ
         m7s2OcPExK77YyUpoHB42qs0YXl1wkFLg+smYHAv9Pjt7VNHy6VNsZuXPGwWcmeAAmXh
         1VJipWGgVgmX9crrW0ZYz5P0zcSt05srdJw0+l1YgPGI125eKF7lw/irOqnf0H2f+zQx
         nVBG5+9389LQfbAVWrADJUZEGp3225MzUyVzDTjyDAVkDXrzOwRXgXHpx2JoFJcl8Zg6
         /Weg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779116385; x=1779721185;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vEWJGaCfr5moVa77HgCo0qOe0dfMae5hZJol18Jq5qo=;
        b=s0CzTaCll96MGdxj3ViZ5qNiy7ul0mfz0jBnARNdDL3pblkyzmxKWHtZeE2Z5T6tqo
         pgFKR0B3ybpL+fPNn0TfP9SpYIGnVPh9vLU77LTfUNhT0S7hlVFw2K3K4Ssy4+a5eQs9
         kpGcSscAvtgFy2dRIZ2Qj48ahph61asrL67+CIkJZ/ltElciIyuJfA2mTt+oTtpcdN7C
         fGQJise+8XcyC8c8hbBjU+1oxkI8ZA1re8Hcn4rbS7QMQOsTRCCnMeeuSuCbYkhvGSEF
         syYNYw6MBP/7BkyShaJNvohpmMpynNKjPiCwrZhmAOrkIocE+I7UsXAMR25U2CexU+uk
         BrlA==
X-Forwarded-Encrypted: i=1; AFNElJ+WafcWbUGD6wDpFNRBtPCBK3kT8z81y4SdL3SV3UF29h76SH/Ap7vWmKQ8WOlpSF3cBH19YS+qshLWK4PhxdM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc0IZ4f+qMIWlDbcZD+k4ZhA9yC/RiAIFkUHqnsCqxj0bnmmJG
	Zqw0l5hkO7Xw4UmIsZSI3+k/f4MGxID1s9BR81pr5tlFXoCPKeezBgJhyut3LolXQDY=
X-Gm-Gg: Acq92OEeX6b254+1Kpn9OuFLDZ6AaMEqqjGLDYpolKjYbZlDe9mlZYEPTu70K64raY+
	XXpEYjXSvVTHSVfxxl8yp0fCw08aYPPNR7LuwMuhrFsFiXdjG/knk+i5EG++6ZqOeqwyl8DaGbJ
	N8hwQ65G6GWW8G/OwYzeVXWXilH8TIlgS20GYwwbtgQH0svONnPi9/uIQmG5lOtHJL+OWFg4O3u
	5eG+7RvIA4hjE7CxjkwVX2VYS8Yc7Ji/zHTebLdzrP6TgJizY1zMYKAQ6Yv9SCOFj1eEP0bexP+
	/hMalKLak+t1RBUMyehRfrxhRa28aocG/Nhikq6qTfkkaPe4JlBHT0D+oCYm/D4wdiC2zIW86Pn
	W5g/SHsO+jkNO00xPvusrn4FVEQi6ZZNA6XauIKWwBdNeYcwTxboeMnICDrk8+M0SSBWw30PDKn
	wtu0hkFcGL6B1XQ5cYnTol4wFjgsjva9A0KoJhi0FYjR3qc0kBGuuG43bViVRtZa2vfPli3Ltbu
	Yji
X-Received: by 2002:a05:600c:4455:b0:489:1fa8:b895 with SMTP id 5b1f17b1804b1-48fe5fcb2dfmr120670715e9.2.1779116385579;
        Mon, 18 May 2026 07:59:45 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:b41:c160:6a1d:efff:fe52:1959? ([2a01:e0a:b41:c160:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a1a22csm36952961f8f.19.2026.05.18.07.59.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 07:59:45 -0700 (PDT)
Message-ID: <b88ae398-ead3-4cca-83f3-92f29891b4a1@6wind.com>
Date: Mon, 18 May 2026 16:59:44 +0200
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
 <5d4467d5-f081-4f7e-ac3c-9134ee8ddc6e@6wind.com>
 <30599c3d-66b5-4787-9ead-53ab716ba338@ovn.org>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <30599c3d-66b5-4787-9ead-53ab716ba338@ovn.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 18/05/2026 à 15:55, Ilya Maximets a écrit :
> On 5/18/26 2:46 PM, Nicolas Dichtel wrote:
>> Le 18/05/2026 à 14:11, Ilya Maximets a écrit :
>>> On 5/18/26 8:21 AM, Jiri Benc wrote:
>>>> Hi Ilya,
>>>
>>> Hi, Jiri.  Thanks for your thoughts on the matter!
>>>
>>>>
>>>> IIRC this was added because Open vSwitch needed it. I'd expect most
>>>> users that need to deal with cross-namespace detection to just switch
>>>> to the given netns prior to issuing RTM_GETLINK; at least, that's what
>>>> I'm doing in the tools I wrote.
>>>
>>> Yeah, that's also what other projects like FRR are doing.  It's a bit
>>> of a hustle for multi-threaded applications, as AFAIK, there is no way
>>> to just move one thread into a different namespace, so if many threads
>>> are doing something with the network and you suddenly need to check
>>> something in a different namespace, you can't really do that without
>>> pausing all other threads first.  But that's a separate thing, unrelated
>>> to the series.  I'm just ranting. :) 
>> Hmm, not sure to understand. setns() is per thread (see man setns()).
> 
> Hmm, I got my wires crossed here with something else, I suppose.
> Though CAP_SYS_ADMIN requirement may be an even higher barrier.
> 
>>
>>>
>>>>
>>>> On Fri, 15 May 2026 22:19:20 +0200, Ilya Maximets wrote:
>>>>> But this doesn't work for link nsid in cross-namespace RTM_GETLINK
>>>>> requests.  For some reason the code checks if the original device
>>>>> and the link are in the same namespace and not if the querier's
>>>>> namespace is the same as the link's.  So the logic becomes:
>>>>>
>>>>> - if NSID is not reported, then the link is in the same namespace
>>>>>   as the queried device.
>>>>> - if NSID is reported, then the link is not in the same namespace
>>>>>   with the queried device.
>>>>
>>>> I'm not sure I would call this a bug; the original idea was to use
>>>> IFLA_IF_NETNSID to switch to the point of view of that netns but
>>>> without actually switching to that netns. Hence, the netnsid is
>>>> relative to the caller's netns but otherwise, you get the same reply as
>>>> you would if you switched to that netns. If you think about it that
>>>> way, the current reply is consistent.
>>>
>>> It makes some sense, but the fact that all-nsid notification and the
>>> cross-namespace RTM_GETLINK provide different IDs makes it inconsistent
>>> in my brain.  We have:
>>>
>>> 1. nsenter(target) + getlink(local) = target-to-link nsid.
>>> 2. getlink(target) = caller-to-target nsid  + caller-to-link nsid.
>>> 3. all-nsid-notiication = cmsg(caller-to-target nsid) + target-to-link nsid.
>>
>> all-nsid-notification appears before cross-getlink.
>> The goal, for all-nsid-notification, was to be able to receive netlink messages
>> of a subset of netns in one socket. So these messages are provided as-is, ie
>> like if they were sent on a netlink socket opened in the corresponding netns.
>> It's generic, there is no need to patch every subsystem.
>>
>> cross-get*() have been added later. The chosen behavior is friendlier at the
>> cost of patching every subsystem that is supported.
> 
> That's exactly my point.  If we're creating a special patch for a subsystem, we
> don't need to adhere to the exact structure of the original message, since the
> data reported changes anyway.
Sure, but only for this special path then (ie cross-get). My understanding is
that you are interested by the all-nsid-notification path.

> 
> IMO, not reporting nsid that is the same as the caller's nsid is more friendlier.
> But that's, again, just a difference in opinion at this point, I'll not insist.
The problem is changing the netlink API. As you said, a new flag would be needed
for this.

Regards,
Nicolas
