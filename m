Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2BC36F901
	for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 07:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779261780; cv=none; b=na+fc8zk0czI9HEIE1vGW7hfusrJpCZfRFTrGKl6LGpuYLQszvFdZ5vTghsOrqI+zMdHRvJRaZIzPsAk+mN2s7g2p9kjn4bBk6L8cSEcf2mFpEgA1q6SXRG97Hg16gXDUF+18pYaLy9t88lotXbm9CR82Os2KH5xJmr4PNO09Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779261780; c=relaxed/simple;
	bh=y0jcLSwtJI2Japs52LRtCy+PtQOeLK5jVUJPsCYdyTQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sjDuZIQpo8TBf0ShETFCr2GXwXJz1b75oVCJ4Qj0G9IrImVKaR/2i5HAXTxvoNGHnRrmh4yFRkqt4F9Uv1/nrjnGwDxcm7TYjmYAIj7ycqd1/RKQpBzTJzi2KJ2gtMpgBpi2poe4ugETjI/DMMN1GMoGPZmkUWQxjhCSuxuLlLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=gYAL9/80; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="gYAL9/80"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48d10c981e4so5960875e9.0
        for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 00:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1779261777; x=1779866577; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zuRDqarJdWS7JEf2bJHF7uFUerb4dfY2s042IFgbB1c=;
        b=gYAL9/803BPT1wDlYJkSJuW4e4galuYRriDWX+rdxP9zAtqMpZPb4R0+IWFnQU0DpN
         cuGviGQYKgcbFZlNuyZcnxhm//bgg7ouFzU5ypuSYQWCeoV3obdf6tKcXlWkRt09k6MD
         MuqDELsLJpMFUlTuU62nm6j8n0K7NKSpPwkkFGEVe1vbpblk0WIG7y/wdGL+/SVFRnpD
         YXREJD/SGknpEdsCygerK66RmOQkUaT/KW+zXo1lHHmXL4gt1H/PPchscQSCsr+O56f2
         1hoimUtJEDZdcaFQxQTWeYlxhs6TYDgCdBDk0QH80LWQKohsa9deHfBriA952afp5TsA
         bkdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779261777; x=1779866577;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zuRDqarJdWS7JEf2bJHF7uFUerb4dfY2s042IFgbB1c=;
        b=q9/zKhyMekYKsDKnEO/dlSUkNk7M8PoAtqiFUqJ5vq9CgH2d3+ofC9ryztr1X9+erK
         huew9WFjEBHi0+HgMjxmQ6kOWqj9aHDXp4ic8GQT8re4fEH+IPVnEEFIqzlB1pXbwpnH
         9h5v/H3qZD3jWpPu2FtDnsFMzSOM9hbHu+tHj/c4XccuRz52b1+jjGRnydndMpmw4Ew4
         zmTVybdT6hKGPBe/H/5Tg3vAQIPYqJidunFqqE6Z6rGa8ntmIZIAFGhAIRB17SqyBlUk
         7alY6jNF6FZ6RwcXtraq3zmLOSOks82/L3s8UaPmWCteDBAWf2K8YGNtxokfH9THHhPY
         YLYA==
X-Forwarded-Encrypted: i=1; AFNElJ9pmnSxI3L0DROB3DhqF6vfVLlsiI3hTHARkw2IMunpc4H08U8ITlZDfbvldc1iFYytKvcwMQ1kVNeccgzoVAw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjNq2YDVBjvkmd/XhunkqAvNNID6i/BuaRpJDVKXCVPfmY2yZ5
	LUJQEq98F3yLNjk34kcmphl10ZhdvXT4GwHRh78GwBhqyz48NSkvVzWAqhomWW1t3rU=
X-Gm-Gg: Acq92OFh6zaS3ilRjI0BHYI9t5meX+N5OcjnlkvEtxsHez4a1S5z8/zjfxUii7CoqOW
	ZcsT+gMs6PmtZ2q+juhChQzJsh5VQah6SqCqCgYpg3wuWI3xnPf0XhSTk6Jj6o/q5mUwJS9Xr/v
	xSsXU2W19hpI59rS44YOXxVziPKPraPRfI0nSXr39YYfzH8zoF+SMtKfKj/mrpq94fUAzbG4vmf
	ZIYhhkZikV+jDu8R/Nc19fgftpv54zpbR1eOVe3nsAqItqXa8gDXT4TlsxYRkz4mi+B3n6yH3Gr
	uht6PmEaJWQnNA3NbYvNGKmc7IWSQz01ydhSPKieHdYihoxDfRdq76rjdWs+Xb47l3ozUPCsK07
	MsZ3xTiQrFoz6DcugkC4GIIntPD6I/HVhZRpPbmQM4h7ciSOrllacI9plPdFbD6zl+xQzyQx2h+
	gcSU9Nsd4hjPC/jzHZp6vDCuM7ezGmM8CwqHqqmPczCis4dPUYzrih0tMuLAZV09Q=
X-Received: by 2002:a05:600c:4513:b0:48a:5501:799a with SMTP id 5b1f17b1804b1-48fe664c27cmr173624035e9.5.1779261777104;
        Wed, 20 May 2026 00:22:57 -0700 (PDT)
Received: from [172.31.99.185] ([185.13.181.2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe57944c1sm412983955e9.7.2026.05.20.00.22.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 00:22:56 -0700 (PDT)
Message-ID: <c53e7ba3-d3c1-43a0-b38a-25b42091f9b8@6wind.com>
Date: Wed, 20 May 2026 09:22:56 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH 3/3 net-next v4] selftests: net: add test for IPv4 devconf
 netlink notifications
To: Fernando Fernandez Mancera <fmancera@suse.de>,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 horms@kernel.org, edumazet@google.com, dsahern@kernel.org,
 davem@davemloft.net
References: <20260510081528.5257-1-fmancera@suse.de>
 <20260510081528.5257-3-fmancera@suse.de> <20260513193544.47970cb8@kernel.org>
 <bd560c89-c71f-4ef5-a0fd-5ea096a0f767@suse.de>
 <20260514162429.366b94c9@kernel.org>
 <f528360c-18b3-46e5-8ba8-88f921203716@suse.de>
 <20260515181623.5a44140e@kernel.org>
 <f5cae72f-93c7-41d7-b7db-2b60281afb72@suse.de>
 <20260518142346.4c0903de@kernel.org>
 <54f7f213-9783-42c0-8ae8-51a6b65b7b5d@redhat.com>
 <b8b89071-6f17-4f6a-8a06-101056f780fd@6wind.com>
 <f2cd87f0-e173-4af7-9bc8-3a1f38c58c06@suse.de>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <f2cd87f0-e173-4af7-9bc8-3a1f38c58c06@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 19/05/2026 à 23:27, Fernando Fernandez Mancera a écrit :
> On 5/19/26 3:45 PM, Nicolas Dichtel wrote:
>> Le 19/05/2026 à 09:17, Paolo Abeni a écrit :
>>> On 5/18/26 11:23 PM, Jakub Kicinski wrote:
>>>> On Sat, 16 May 2026 09:02:27 +0200 Fernando Fernandez Mancera wrote:
>>>>>>> Oh sorry, I should have clarified it. ip netconf only shows/query them
>>>>>>> but it cannot set them AFAICS.
>>>>>>>
>>>>>>> Usage: ip netconf show [ dev STRING ]
>>>>>>
>>>>>> Oh, fun. anyway, you gotta find a better way. Or just give up on the
>>>>>> selftest, the YNL hack is too ugly to live
>>>>>>    
>>>>>
>>>>> Fair, let me see what I can do. Otherwise, Paolo as you requested the
>>>>> selftest, would it be acceptable for you to drop it given the situation?
>>>>> I looking for alternatives anyway :-)
>>>>
>>>> Maybe extend iproute2 ?
>>>
>>> Ideally I think extending iproute2 would be the better solution.
>>> @Fernando: perhaps you could update the self-test accordingly, adding an
>>> explicit check for the iproute subcommand. If `ip netconf set` is not
>>> available skip the test, so that iproute2 patches could land later.
>>>
>>> Does the above look feasible?
>> FWIW, netconf != devconf.
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/
>> include/uapi/linux/ip.h#n156
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/
>> include/uapi/linux/netconf.h
>>
>> The devconf API exposes all sysctl of an interface via RTM_NEWLINK /
>> IFLA_AF_SPEC / IFLA_INET_CONF. There is no event when a sysctl changes.
>> These sysctl can be set via RTM_SETLINK.
>>
>> The netconf API (RTM_NEWNETCONF) is a notification mechanism used to notify
>> users when a sysctl changes. It handles sysctl from interfaces but also from the
>> 'all' and the 'default' entries. RTM_GETNETCONF is also supported, but not
>> RTM_SETNETCONF.
>>
>> 'ip netconf' uses the netconf API.
>>
> 
> 
> I think we can reword this to.. "extend iproute2 to support setting devconf
> values"? If the naming or implementation on iproute2 is not clear now, we can
Yes.

Nicolas
