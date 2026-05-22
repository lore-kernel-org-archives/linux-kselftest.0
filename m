Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D73382F1E
	for <linux-kselftest@vger.kernel.org>; Fri, 22 May 2026 07:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779434708; cv=none; b=L82srF0M4UsIK1Q7FLrsW1JUZfZLNRqtnaB087qUk5oYTOyaNkkiAxAF9IbNVJDNpjKcnVTufytJoQaWXqwcqvh677EPN4K5tqTH8K6HMdmXIVMOLR8qWkSO+Xqcs4uwTgzPeCeLwRrQaUDTY6mYb8aPuOwFUgjcpkow68cXNL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779434708; c=relaxed/simple;
	bh=iQ3tetTMi+a2kZrr5h4gIqji7vNEElI8JHrIlnprQaY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XG/Ffx5Em4AGAnRc7LVAJFA33LFypgeohP1BCEx2CJrlz9Oa1FpR7STN/ck6STOwfgqQ0CxWh1god0T/5VvRAJWa+0/3k7v7+K0LslAyNgbwcRblY9JfIsev4RCTXx9Egjpd2iclbyNZWX08s05sP8GpYClMamzxONeu4Bbojow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=Zu3HrMPh; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="Zu3HrMPh"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43d7dab87e1so910287f8f.3
        for <linux-kselftest@vger.kernel.org>; Fri, 22 May 2026 00:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1779434705; x=1780039505; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PihRExIv02FwK9YpxdWEvz/FAv5EgvHDNQzIFK5zFNI=;
        b=Zu3HrMPheO80VdFc43+KsQxmqnK+0G3vjQBDSTyU4dai6eC3lgy4se/OA9phlDPOk+
         VIh1FBhiuMTWtcB4iaQ42MjnY/n5fw3nN+u4O31rYc6hZY0rrj1YAgAC39Dsi4BOypHm
         PBhHJ2FBP6NB1VFoP2zJeSgyO39yyeQrkS1tRxWRY8URoReYvD28h65LEpLDCYimchtG
         QGb8yQch87JJP/mW68AE3aF3UZY/gXal5dif5AA0UHX1GkF2zPs2S0p6780cg3NOFJr+
         ObMyK92Tgz+RYxzgUOsXDjdnbSkuCdBxOoQaZO8U5NiZVzE94ur50EwYcizhjyTyVUkl
         6G/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779434705; x=1780039505;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PihRExIv02FwK9YpxdWEvz/FAv5EgvHDNQzIFK5zFNI=;
        b=XAEZwsSlwqWBcSaIb9GrakO6CBKdibnP6JDS4D+idSGvLHlOgbIoAtv7id/GcUv2nV
         mkejt0JtJU/C3UqV9FiKjrkPqTp55RzNijst944krEpzdt9fShlTFXzKcyqtfAH+2jxK
         bhIBsP/K7+NHJFTpplFoVbOu9tXV1UHdDQUs85le8h10kyZDUrpFg9Tj60ibJ75Sk8TW
         2hn9eyk+hI7lTxNgITdeVO6gGJGZgHMpwWjcaKD8FLeBeo2OQA0uOpsa15qcDsJ0wHw6
         mFjScBmaDk0uFZoE5l9wzCRy22+AdPggctxh176sy+WzE4Aw1QdOn4XBL1K+Xhl4Y9DQ
         GR+A==
X-Forwarded-Encrypted: i=1; AFNElJ/6AuuH45UZsj7PQS1lFojAjGI+vXiGSheky9wLGXpYm1J4e/YJBPMZrCl9awoy8J7eGYAXN/BYZ+vNThsf4g8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx/tB9VXlP9+2bZP3QDWVd8b766qqK783+5X5wvLPgBXD2/7Ok
	TaWzWVD3E/vIuCQbR2N+mTPQw6jBTMJSaxSnmNhI2/DZ7aySHVFuJCVHaAZjasHUXEc=
X-Gm-Gg: Acq92OEikVmdziNA2NiYLQ79Sg1FhIRVHDHrFDRxHKvBxwtIkwYzJvxgYKq2BXkWoy9
	Bbll0K4tFYHGpQMxIkWsTvd31sn+ifdyCsEDNvX7DujwHpAgMMwH3WYAEGUOf8/OQCkPiBhRzRL
	owSenIS7lVbA9+FPTEwh211wiceXEy9wYtuuPTbjMrQ8HYb6gCgqS0R3FwLr3GWZLAfuQjJs5Qf
	1swWuUfEgB2fvoV8gdher6g0mDlvEPEwRB2B/xo2ZqBUQaRqqeNWNSwWqIVO3QTzvW2vbvyR+Sb
	EeRuZ9y/VR/aoq1nOyLBgQmT4bk1HOUPt6ejzEBrj5/ZFGUkg+evUj4L31PnMMr51S7rTseercV
	3sBkUVpuMKxVSfKugtr+kBnuQFK5FVK/KNuJbJs95DVoRWjcbHVYxkceUBARNdqgGU8i9qcO1/g
	e2FcYe/wIazeqI+PLNRCkSgRuiwfBJFMgh5fnSy6bJjOX0VcvoqAQKqJtXNDqT2awuyHh7NIlcL
	hSvYbhTIxUSk+s=
X-Received: by 2002:a05:6000:25e1:b0:45e:89e0:ae71 with SMTP id ffacd0b85a97d-45eb38a6244mr1310137f8f.2.1779434705412;
        Fri, 22 May 2026 00:25:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:ab7:2110:6a1d:efff:fe52:1959? ([2a01:e0a:ab7:2110:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5cb76sm1678678f8f.25.2026.05.22.00.25.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 00:25:04 -0700 (PDT)
Message-ID: <76280397-a1e8-4194-b02b-76ccef2732c1@6wind.com>
Date: Fri, 22 May 2026 09:25:04 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH net v2 2/4] net: netlink: don't set nsid on local
 notifications
To: Ilya Maximets <i.maximets@ovn.org>, Jiri Benc <jbenc@redhat.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Donald Hunter <donald.hunter@gmail.com>, Shuah Khan <shuah@kernel.org>,
 Kuniyuki Iwashima <kuniyu@google.com>, Kees Cook <kees@kernel.org>,
 Adrian Moreno <amorenoz@redhat.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Matteo Perin <matteo.perin@canonical.com>
References: <20260520172317.175168-1-i.maximets@ovn.org>
 <20260520172317.175168-3-i.maximets@ovn.org>
 <bd9c0751-55ea-459e-8b22-8bd24abf235c@6wind.com>
 <20260521160036.413771e9@griffin>
 <9e7b7aab-dad4-4b72-87cd-822e67b27afe@6wind.com>
 <b8183167-9e8d-4c75-b340-bc3437a14ea0@ovn.org>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <b8183167-9e8d-4c75-b340-bc3437a14ea0@ovn.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 21/05/2026 à 18:01, Ilya Maximets a écrit :
> On 5/21/26 4:25 PM, Nicolas Dichtel wrote:
>> Le 21/05/2026 à 16:00, Jiri Benc a écrit :
>>> On Thu, 21 May 2026 14:36:12 +0200, Nicolas Dichtel wrote:
>>>> I still don't think that this is the right "fix". The app is broken. Even after
>>>> this patch, the bug could be easily triggered again by a third party.
>>>> There is nothing wrong with assigning a self-nsid. It would be a lot more robust
>>>> for the app to assign itself a self-nsid when it starts.
>>>
>>> On the other hand, does the patch break anything in practice (as
>>> opposed to in theory)? It makes live of several apps simpler, which is
>>> not a bad goal.
>> I'm not against the patch, it just look like a workaround.
>> I'm trying to understand how NETLINK_LISTEN_ALL_NSID is used (in fact, why it is
>> used if the app doesn't "understand" NSIDs).
> 
> ovs-vswitchd works with NSIDs of remote ports.  So it does understand them, it
> just doesn't expect the self-referential ones for the local namespace.
> 
> openvswitch module has a minimal support for cross-namespace operation.  Ports can
> be added to the openvswitch datapath and then moved to a different namespace (it's
> a little weird use case, but that's beyond the point here).  ovs-vswitchd learns
> new NSIDs of those ports from the openvswitch module and then it can perform a
> limited set of cross-namespace operations on them and monitor their status changes
> through notifications on an all-nsid socket.  It never learns the NSID of the
> current local namespace, because all the local ports can be directly accessed and
> openvswitch module doesn't report an NSID for them, as it's not needed for anything.
> 
> In the end, ovs-vswitchd knows all the remote NSIDs it needs to know and can
> recognize them in notifications.  But it doesn't know the NSID of it's own local
> namespace, as the openvswitch module never reports that for local ports and
> ovs-vswitchd doesn't explicitly check its own NSID.  So, local notifications with
> NSID set get treatment of a notification from some remote namespace that we do not
> care about.
> 
> We will be putting changes into ovs-vswitch to work around this issue, simply
> because it will take time for the kernel patch to propagate to distros.  But this
> code will not be useful for anything except for working around this one specific
> case and so it would be nice to get rid of it eventually.  And it would be nice
> if future applications didn't need to care about this behavior as well.  Having
> the fix in stable will speed up the process significantly.
Ok, thanks for the details.

Regards,
Nicolas
