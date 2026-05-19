Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A70A33A9EB
	for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 13:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779198334; cv=none; b=bIUrDOW640p+JR1aNiOVCj4vhWiT+53F+4smgihrjQT71aYfWkNVkWQsautsUJoCIwqXb7JYWHro7HniAeoTglgk/DZZBLwdX4tUmnqAHkqKOh34rQJlXbnn/rfpVbnEeztm/2635/x61ntMBGVIac5elzQEs5I9yBwgRjWxt1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779198334; c=relaxed/simple;
	bh=a6qFLyjgLGGhbiixDkKGZIW83Jdh1bNdjuoKqPmHSJ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HnM2/fjm8UuBdPX7MGcIZwjnwFCPVdpeC7BFvtLuEK98Uo8N31nvJ5dIMF62gNP4iIOMfqQPabegTtqXHZVifv1bS59oQv9aex1278ORYLXXl6opyctOQJlRpmf/uRaTmVkytz7h9kbnPprRKSAKz8973fd7jlzF0f5BYvoUMOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=Y2xE8nSc; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="Y2xE8nSc"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48fe7a40e51so3347045e9.0
        for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 06:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1779198331; x=1779803131; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=htvneac4XiJE8jRymOw7+602x21csPB4eaUkO/mk3sA=;
        b=Y2xE8nScV7lfMXxqPzWmD3Jiqz0vfCCEaNT/4r8N0ZZ1NYDR6fqBhniHJkyxvoaLiZ
         UXtM4XbTruR+KQceWShBIkhKyTbO+bgmjZTMllr4DqXMVJQ59TxYEnFjsex6Ekfh1Zxk
         P72A3cNrx2Iz2cO5lo6Su5Df2vQrb3/eFTB7wjCFawhBovHQ55S92fXt2Mh9J0KcIJgf
         IwiDJYYfMNv5kfPNVWsXlbIEE2GC5tafzqXN83cJc1WjV9yRlf1AWxc8UT0feMme7n3x
         60gl0tJpXKMnf9Gz0zaluG/tMYwdzEIlQa3cHm1orBdFLaUmzv1YcqhySBh7xEyavolK
         +4ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779198331; x=1779803131;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=htvneac4XiJE8jRymOw7+602x21csPB4eaUkO/mk3sA=;
        b=XMjSzRI48FWPhWbBKGyp7qkfIng3hExINkK9EWnDtLDIOs7N6TCGNLBbnVVySo/TXK
         FYZV1wDC0Dap0h2pxuFio8PN/JfsHIMaNPdD9HXg+OZG4Hj9f3p8QFLT6pxXxf0HHR4q
         RdCK+4Q13bp8T/KiCA5rq5WfdhuD0iWdIT++u35yIAhI59Q/WLYvQ9UZwmu3rlbtv9hO
         KkcZ4XG66wQf/cacBs9ZmdS6iPQ4M4BAO4+x2aJMJeoGdSgCctYFcEJHgU/73JyXvaI4
         mJzTMqYSJAdVbw+oUs7TtRpgOk/U1B3tk6LCC9blSJZCW7KKc81dTSBWscYKgQVtIHNS
         Zz5w==
X-Forwarded-Encrypted: i=1; AFNElJ9MO2eOZimICo4dacO3NJW3hON/hos+mIih3rnMu/XFY6/l2X2o81UntFVt7JUZiQttuuiYcRa4hFbO7EOKRUs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZANV7B+PhrscHsbZAfn/dPr7ec3SzNgxLsd3nv3AdD1CrUjei
	/PJihq6XKy54M8AmZWnYanOM4cN517MsErY7K4zrePvEkps2ViZ7thJ7nWio5RN/1cc=
X-Gm-Gg: Acq92OFv8nb91Qxf+yva/75aIwwsAjMsSWuxvD10wiBY1WaWkQXI/+XwZsfFCMT7i97
	fxlIfNRNplaz4tBkv+tnUDxXyT/tUuqqE0BMdXKbv45V6NUJrgQMbBjeOKhDsLNOpu6sdIJ8Mic
	VjgfLEWC97lSXFypPz6jy0rOMmq2Umw8cZxXUVQ/rM7tsqepoAaMXNxfCl1h6G7+oeBG9Jx0EU1
	Aa2xcVPRAtWdSfsat7OuR9ElRosbkJqBthdgTZEeXd/V0u66LRps7aylk08365dr+KLhUfD6zhQ
	juZhCRT2sWzF5ntyoR7D7XE9moRFjbOnzXnGTZ76LEoBMoV1Ct8C4oPdqiPmHYzy4S+n4CVIXq2
	yWOmqoAiqSa4saYWz+lIRnhfx/iiagMWM1yh5OsVGxZ2t++/om0ovo42dvbX0UWOkXVUaCIK0gN
	WWvFDBZrWViyelDGF1PnIJofWE4YnzNXICekWLighTig==
X-Received: by 2002:a05:600c:1f8c:b0:488:abe9:86 with SMTP id 5b1f17b1804b1-48fe631817cmr145344455e9.7.1779198330594;
        Tue, 19 May 2026 06:45:30 -0700 (PDT)
Received: from [172.31.99.185] ([185.13.181.2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feb00e5easm107621965e9.13.2026.05.19.06.45.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 06:45:30 -0700 (PDT)
Message-ID: <b8b89071-6f17-4f6a-8a06-101056f780fd@6wind.com>
Date: Tue, 19 May 2026 15:45:29 +0200
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
To: Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Fernando Fernandez Mancera <fmancera@suse.de>
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
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <54f7f213-9783-42c0-8ae8-51a6b65b7b5d@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 19/05/2026 à 09:17, Paolo Abeni a écrit :
> On 5/18/26 11:23 PM, Jakub Kicinski wrote:
>> On Sat, 16 May 2026 09:02:27 +0200 Fernando Fernandez Mancera wrote:
>>>>> Oh sorry, I should have clarified it. ip netconf only shows/query them
>>>>> but it cannot set them AFAICS.
>>>>>
>>>>> Usage: ip netconf show [ dev STRING ]  
>>>>
>>>> Oh, fun. anyway, you gotta find a better way. Or just give up on the
>>>> selftest, the YNL hack is too ugly to live
>>>>   
>>>
>>> Fair, let me see what I can do. Otherwise, Paolo as you requested the 
>>> selftest, would it be acceptable for you to drop it given the situation? 
>>> I looking for alternatives anyway :-)
>>
>> Maybe extend iproute2 ?
> 
> Ideally I think extending iproute2 would be the better solution.
> @Fernando: perhaps you could update the self-test accordingly, adding an
> explicit check for the iproute subcommand. If `ip netconf set` is not
> available skip the test, so that iproute2 patches could land later.
> 
> Does the above look feasible?
FWIW, netconf != devconf.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/uapi/linux/ip.h#n156
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/uapi/linux/netconf.h

The devconf API exposes all sysctl of an interface via RTM_NEWLINK /
IFLA_AF_SPEC / IFLA_INET_CONF. There is no event when a sysctl changes.
These sysctl can be set via RTM_SETLINK.

The netconf API (RTM_NEWNETCONF) is a notification mechanism used to notify
users when a sysctl changes. It handles sysctl from interfaces but also from the
'all' and the 'default' entries. RTM_GETNETCONF is also supported, but not
RTM_SETNETCONF.

'ip netconf' uses the netconf API.

Regards,
Nicolas
