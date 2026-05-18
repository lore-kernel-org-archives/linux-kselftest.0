Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF1947884C
	for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 12:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779108990; cv=none; b=d/M6aTOmJ/KAbiaSg3gcc0PZpCe00KH8PkGaLqE2nlrW9Ca+IXEJI4XQYT+gmIrQ3Cga1z57v+uM6NJ1NWswilX4fjd+Uy1IIDolX+S43NoTqljYhD8tf0tmKej/8KyKDiI9Hax+jzErZrcni1pYaW4NqlrMqygiRjFLs82Wtwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779108990; c=relaxed/simple;
	bh=ZAuMBx6unadbACjjupcjZEyuZSeHhtlA21qQueRbAfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gu7XBbBMpJMqlRkxJZA5YxgQWvm3wjg/cINIPFdy2MP/RA3EKIQgx+wABKsjOI22+lvHXkcior/NbscY3vVuqYR4tpzZ4qMj+W159v+RZykw0NRl8cCwFuC0QBnu22SewFt3RaWBsX0ndRkR+kEA4jhQ3Tpgo5I5XbkhATIfyAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=MzLlTkUR; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="MzLlTkUR"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4891cd5927dso2786055e9.0
        for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 05:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1779108984; x=1779713784; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0NWlYTSwdMpd9k30WRuv0VLgXhIMq511o0HjE5SQVdk=;
        b=MzLlTkUR/qQFe8Ry+d7kbnM+cnh1pI2DB6qZm+HNjGelgChWSnB0y/eI2NdwFuRbrw
         9H11PnIafcW7bPvepSeQ4//qXsyqxGKierwBTWDnbat3xhn4RA3mdnZK3SfQ98A7RgJR
         mhNT/AspgfDaf9vIM3sJXri2UlyVle2Ef6QHESdvuxGOj4U0yi4QhwM99ZCiIDkk/ApD
         vdMpRIr8U7dUNV3VTW0ruIATNuU5cKuhU1V9jDNQr6Vpf9xQBFlwS85DCDImIFK1PRrz
         GnnrIPz6iVHNz1hGj74bBDRKOV6EVJyqaUD6ci6ieHbUhrp3CT7suBck9bw+vIB95R0Z
         bwpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779108984; x=1779713784;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0NWlYTSwdMpd9k30WRuv0VLgXhIMq511o0HjE5SQVdk=;
        b=hoXyB19pLwm+dzogfuqjlKeV7G8Uiz+PJFz4/XmZ4nEcUrlWFoeIWgfOw2pQ6eE7X/
         patNmfBdN35RIFWAyKlIgyhZlgfQu9a/+WqvQX+abW3S7oDxAm2LzGWaYqvUE3d2ieAX
         zZO0HGaFKgSpwBAVXjKKvN4gOnbQM2G644PyL/U/2B9S5rj/xga47AB3usuzMgkqhUEs
         jE1skRjdRG4b6vN0FN12vOLJ0N9bjHKjDRRgC4wAi126sOyKij0kWZ8r8vKKhwANNafa
         g46pRjzac5O+gDQnuJ4JynTCMC+7L7BuLi+wjp9b/v93x8NTKP6Ya53uvpXQENjm0+Ps
         7mcw==
X-Forwarded-Encrypted: i=1; AFNElJ/VUrWTHEXvPwxc4EHRB8vn3MUWLPympYvUbW3bY8N2G5slI2XIvnykxuWBABpH6dM18Fh5HBwPFnCVBGRN3YY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyW+cKdLpZdtw8XIByPDWInOH8k0WYF6iB2fUISHOWFZAuQAqRS
	0fQ9+FRNhB/pKN95n1a8Bm0h5WP4tQ8IdXac0JldvY5Bxj6gCvw7QAX5Mm4GjvIBTpY=
X-Gm-Gg: Acq92OERayjjR8XFMaIbFIWD6ve6V42ou523/XCMtZXvPGoOq+ABNBxyu3gGBo6YSA6
	DelJ3bw9JTVMa7iZCe5LGSf0CGIAB2rxsmzGbqcPLqY3YGF2+Pa96Da7BmH3Asa+MdvBRdkMORx
	Oh3o/+TEEbQM47VlKe8ObQmUjofsXcfF8cESGKwj2PFvfd/elCpRW9mdTTLY3Nq1KADEkDJsTuR
	LDVGFApO2WPZVvRtIatwcN/tWjfXhyAHvli2fS0GUjzdRMyl/4d07hO3WcshEcdt/bgSLiaoNhn
	krJKfxrC1pqWwOLdEAjwpTydDR58RmP+dDnDYzRZkldzTIvdmYkxXtRZHDjtjIQ+99zUFNooDvK
	uOptFc7/nay6pMzsNkaq60jSwhHcMJT0tk0oKxJnjwIr/NCjNsN9YtGrYt/yD4/OAMx/iUfGekL
	w2NTLFDmCvv+xpRxgPzNH7tO6zZ+P9PQVvhfmEQkFKbNM1GxXnUNpfBxZeRYWGEn49VZFNXP7Vn
	ml3
X-Received: by 2002:a05:600c:1d0d:b0:485:c456:5e4f with SMTP id 5b1f17b1804b1-48fe59b071bmr114106455e9.0.1779108984558;
        Mon, 18 May 2026 05:56:24 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:b41:c160:6a1d:efff:fe52:1959? ([2a01:e0a:b41:c160:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe5bc94sm149189915e9.4.2026.05.18.05.56.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 05:56:24 -0700 (PDT)
Message-ID: <5d19e543-ac3b-4d32-a464-377d03cde500@6wind.com>
Date: Mon, 18 May 2026 14:56:23 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH net 3/5] net: netlink: don't set nsid on local
 notifications
To: Ilya Maximets <i.maximets@ovn.org>, netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Donald Hunter <donald.hunter@gmail.com>, Shuah Khan <shuah@kernel.org>,
 Adrian Moreno <amorenoz@redhat.com>, Jiri Benc <jbenc@redhat.com>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Matteo Perin <matteo.perin@canonical.com>
References: <20260515201937.2813983-1-i.maximets@ovn.org>
 <20260515201937.2813983-4-i.maximets@ovn.org>
 <40603dce-f801-42ad-96ec-c8c0a57e5aae@6wind.com>
 <5344852f-e920-4232-9b54-5b22f6c8a1d3@ovn.org>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <5344852f-e920-4232-9b54-5b22f6c8a1d3@ovn.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 18/05/2026 à 14:46, Ilya Maximets a écrit :

[snip]

> True and also not really.  The main problem is that ID can be allocated
> at any point in time, so the application needs to listen for NEW messages
> on the same socket that it is listening for the events that are interesting
> to it (to avoid races), if it doesn't want to make a separate GET request
> per notification or track all the IDs that were previously checked.  It's a
> non-trivial amount of code depending on the application structure.
iproute2 handles it ;-)
You certainly need to maintain a cache, but once a nsid is allocated, it never
changes until the netns is deleted.

> 
> Alternative is to always try and allocate the self-referential mapping on
> the application startup and remember it, and then check that no-id, -1 and
> the allocated one all mean 'current'.Yep.

> 
>>
>>>
>>> A search though open-source projects doesn't reveal any projects
>>> that use NETNSA_NSID_NOT_ASSIGNED and rely on metadata to contain
>>> self-referential NSIDs.  Quite the opposite, ovs-vswitchd relies
>>> on the metadata to not be present to separate local and remote
>>> events.  And the 'ip monitor' relies on the metadata to not be present
>>> to show '[nsid current]', though this is more like "print 'current'
>>> if there is nothing to print" situation, but still can be a little
>>> confusing for the user to see an ID for a local event.
>>
>> We (6WIND) are using NETLINK_LISTEN_ALL_NSID. Like iproute2, 'current' is
>> assumed if there is no nsid, else the corresponding netns is checked (which may
>> match the current netns).
> 
> OK.  It sounds like this one patch will not affect your use case than,
> which is good to know.  Thanks!
Probably not, but I didn't say this ;-)
I need to make some tests with your series.

Regards,
Nicolas
