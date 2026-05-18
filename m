Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CED743D50F
	for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 12:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779108374; cv=none; b=MO/Xn8T4ok8cjcrxkbObo/qPMrU2VsCVuRWTYQmUDBBQOtwapwZ4fjBaMUwKQHCTkptp4LRU80kAH5d1nREelfVObyX5NM2hFPnN4WtqdRkFCMNWsjYFQ5NXNxho4rQ+zMm/oy+/Zw1pewMltS6uBVe4l4ZePGDlqQ8U5VAIMvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779108374; c=relaxed/simple;
	bh=HNipToMVLQPES3v9ywZIAvvXg732/cC5Xog8f7QEs7g=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=NfZHjJVehiVtGXhzeatf8qx9L8KkMWNnUcg8sQmzo5H7m6xEzO98W/IwnEz2Ld2vg9ZZe1Rz/wd3iA1ylk243Suc0Ep2INMxCFLZjUQVR/EF4YD1WYY8qkbFVpEOFv1vA/aGRxNMJN6T3uomd6YvguJzy6c/XlgphQoOvN5Wa70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso30498875e9.1
        for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 05:46:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779108370; x=1779713170;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:cc:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c+ZuZQzIonT11TAXzr5UYujrBBK/ltczvubhUPLEAZk=;
        b=BnDQi8/SkJoBjt0oiv5UGKk5OxWVYinaUmHp3h04EKaX3NCtMsJ19fkTKxw+BotlU/
         7dnJ9TLOb8A6W/zxOdZyV/dONnqoSKpdC3wtbyuDIUlnyWT1wPWZ94FCj9XYJUw3XvCU
         9+2n6GYgByN6BeXoStXySjVbCBo7e9uTtJdR1cqshnCmey536BGteu9WVGV13JBR1xH0
         G3+9Uhfe8TEKTQo0LkXWVZBWlaeIROxbP1NJDkKb5/q69GfEUAlUcG/RFlVne/tCGXi6
         kRmg0coEa5Z1t8SCW93dOY7W1XlvO6b80qp9x/bHLKp7NBgPSl6YH5pBgi1VZREHWplC
         uZSA==
X-Forwarded-Encrypted: i=1; AFNElJ8iZQO6gra4q0rqQ5W5hALG7C9p994dv7QgIElZE6lYi+9QdKD9oZXIOlkqfYmIO4KMLgMCjrmqGjZbnQosC9c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKVklqOuR80nOW6msWUfsIGMAVxCsVGReAR525QM/7UB0x0nNJ
	xdA/l2r53N0Voa0VaEqv91gEDOzBhiRGBOFtVJniYKuF1HgXeXwFYzVs
X-Gm-Gg: Acq92OEer/K6oH+m7iHLtTrpNqXCt1wySByJ1gfwcQPeYr6vtVU8avRUOKyBZ1izr2m
	d9WUYz/yYqNSEuEFjd4/FznZM/mIn05QelktywZ5pFMC7WyRxPi70ZVkPeRcjm4vTYl78jjX+v3
	DMmPjnV/7t1LLy9+G6qIvnP6MPBPhaNXu5ktuZoX1//ah4zYeROpkmAHxyvKJUqea+9aIJZolA/
	XOvBsfv5wvXrxZ0Prary8JqHXUURazJs0xpdrNdS2NyuIeodrFZpqqCf8ujaXXg0b4MiFPg1u2Y
	tPAQ20fXbbAokZUA0sN52EmBtKp/JWeSHPksn44DW0Cx4FzdJEfYNFe0fMM3DTfY85FRjmJG4S6
	Kxq5hhEAk5zyO4jBTsrl0gc9hDxat7VB8LgTk9NgtZOkfyhZMbVsGPyCznLgoAqRx7FPD5xZ1DN
	YlE7GpIHFHrFJbCvNv3aHDZK7lwHVH2Sq424h7ZnXGEBgZ3ozoNBpd3EIrTtNDwYb6Nw==
X-Received: by 2002:a05:600c:2d81:b0:48f:e518:d110 with SMTP id 5b1f17b1804b1-48fe651d7cemr139156235e9.32.1779108370346;
        Mon, 18 May 2026 05:46:10 -0700 (PDT)
Received: from [192.168.88.241] (89-24-32-159.nat.epc.tmcz.cz. [89.24.32.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe13a7sm38464993f8f.29.2026.05.18.05.46.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 05:46:09 -0700 (PDT)
Message-ID: <5344852f-e920-4232-9b54-5b22f6c8a1d3@ovn.org>
Date: Mon, 18 May 2026 14:46:08 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: i.maximets@ovn.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Donald Hunter <donald.hunter@gmail.com>, Shuah Khan <shuah@kernel.org>,
 Adrian Moreno <amorenoz@redhat.com>, Jiri Benc <jbenc@redhat.com>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Matteo Perin <matteo.perin@canonical.com>
Subject: Re: [PATCH net 3/5] net: netlink: don't set nsid on local
 notifications
To: nicolas.dichtel@6wind.com, netdev@vger.kernel.org
References: <20260515201937.2813983-1-i.maximets@ovn.org>
 <20260515201937.2813983-4-i.maximets@ovn.org>
 <40603dce-f801-42ad-96ec-c8c0a57e5aae@6wind.com>
Content-Language: en-US
From: Ilya Maximets <i.maximets@ovn.org>
Autocrypt: addr=i.maximets@ovn.org; keydata=
 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
In-Reply-To: <40603dce-f801-42ad-96ec-c8c0a57e5aae@6wind.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/18/26 2:14 PM, Nicolas Dichtel wrote:
> Le 15/05/2026 à 22:19, Ilya Maximets a écrit :
>> For notifications with NETLINK_LISTEN_ALL_NSID the expected behavior
>> is the following:
>>
>> - if NSID is not reported, then the event is local to the listener.
>> - if NSID is reported, then the event is remote, i.e., originated in
>>   the provided namespace that is not the same as the listener's.
>>
>> Userspace applications like ovs-vswitchd expect this behavior.  And
>> ip monitor uses this logic for printing out [nsid current] vs [nsid N].
>>
>> However, when a self-referential NSID is allocated for a namespace,
>> every local notification starts sending this ID to userspace as part
>> of NETLINK_LISTEN_ALL_NSID CMSG metadata.
>>
>> This is problematic, because the listener cannot tell if those
>> notifications are local or not anymore without making extra requests
>> to figure out if the provided NSID is local or not.  The listener
>> can also not figure out the local NSID beforehand as it can be
>> allocated at any point in time by other processes.
>>
>> The value is practically not useful, since it's the namespace's own
>> ID that the application has to obtain from other sources in order to
>> figure out if it's the same or not.  So, for the application it's
>> just an extra busy work with no benefits.  Moreover, applications
>> that do not know about this quirk may be mishandling notifications
>> with NSID set as notifications from remote namespaces while they
>> are actually local.  This is the case with ovs-vswitchd.
>>
>> Having a self-referential NSID mapping is not something that happens
>> under normal circumstances, but it can be a case in specific
>> environments.  And it can be more common with certain container
>> runtimes like LXC/LXD/Incus that unintentionally trigger allocation
>> of the self-referential NSID via cross-namespace RTM_GETLINK requests.
> It is easy to allocate a self-nsid:
> $ ip netns attach current $$
> $ ip netns set current auto
> $ ip netns list-id
> nsid 0 (iproute2 netns name: current)

That's true.  My point was that it's not something that most people do often.
Though it can surely be common on some setups.

> An application should be prepared to handle this

Yeah.  Unfortunately, documentation is not clear on when the nsid is
provided and when it isn't, so some applications do not currently handle
the self-referential case.

> (it is easy for an app to get the 'self-nsid' value).

True and also not really.  The main problem is that ID can be allocated
at any point in time, so the application needs to listen for NEW messages
on the same socket that it is listening for the events that are interesting
to it (to avoid races), if it doesn't want to make a separate GET request
per notification or track all the IDs that were previously checked.  It's a
non-trivial amount of code depending on the application structure.

Alternative is to always try and allocate the self-referential mapping on
the application startup and remember it, and then check that no-id, -1 and
the allocated one all mean 'current'.

> 
>>
>> A search though open-source projects doesn't reveal any projects
>> that use NETNSA_NSID_NOT_ASSIGNED and rely on metadata to contain
>> self-referential NSIDs.  Quite the opposite, ovs-vswitchd relies
>> on the metadata to not be present to separate local and remote
>> events.  And the 'ip monitor' relies on the metadata to not be present
>> to show '[nsid current]', though this is more like "print 'current'
>> if there is nothing to print" situation, but still can be a little
>> confusing for the user to see an ID for a local event.
> 
> We (6WIND) are using NETLINK_LISTEN_ALL_NSID. Like iproute2, 'current' is
> assumed if there is no nsid, else the corresponding netns is checked (which may
> match the current netns).

OK.  It sounds like this one patch will not affect your use case than,
which is good to know.  Thanks!

> 
>>
>> Fixes: 59324cf35aba ("netlink: allow to listen "all" netns")
>> Reported-by: Matteo Perin <matteo.perin@canonical.com>
>> Signed-off-by: Ilya Maximets <i.maximets@ovn.org>
>> ---
>>  net/netlink/af_netlink.c | 8 +++++---
>>  1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/net/netlink/af_netlink.c b/net/netlink/af_netlink.c
>> index 2aeb0680807d6..607ab4e4ac697 100644
>> --- a/net/netlink/af_netlink.c
>> +++ b/net/netlink/af_netlink.c
>> @@ -1482,9 +1482,11 @@ static void do_one_broadcast(struct sock *sk,
>>  		p->skb2 = NULL;
>>  		goto out;
>>  	}
>> -	NETLINK_CB(p->skb2).nsid = peernet2id(sock_net(sk), p->net);
>> -	if (NETLINK_CB(p->skb2).nsid != NETNSA_NSID_NOT_ASSIGNED)
>> -		NETLINK_CB(p->skb2).nsid_is_set = true;
>> +	if (!net_eq(sock_net(sk), p->net)) {
>> +		NETLINK_CB(p->skb2).nsid = peernet2id(sock_net(sk), p->net);
>> +		if (NETLINK_CB(p->skb2).nsid != NETNSA_NSID_NOT_ASSIGNED)
>> +			NETLINK_CB(p->skb2).nsid_is_set = true;
>> +	}
>>  	val = netlink_broadcast_deliver(sk, p->skb2);
>>  	if (val < 0) {
>>  		netlink_overrun(sk);
> 

