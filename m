Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03488409E1B
	for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 12:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779107214; cv=none; b=pWM5MI5gd9E4QcbcsqLGqhBcD5EDhWm1SL5m1aANcF2bC/7I0DdR8193SoUZun9xHCXyHPlpON27qt1imbB/KSMOT4vGwnovbZSkqJqieH1aQp3cP5CPblIg1UXCKs1vZIeHmU7+TBAEOHH3RifJIA5rIWpYOgb7099sTigM4N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779107214; c=relaxed/simple;
	bh=aSTIccs+v3BOXNzJps3pGcZ+OSMa6U+1upRu9QgbhdM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GVXXSb03rqwq/MZzxPkk4cgWoKZ5G+ilXEdy1JiYQOSyJs7QK+l46Y3lQ1dBXilww8uiSKNv1e+Dkyu6nf+JCJQ5EPfG6hC8YXT6Xy0rwmp5hQpG3gV7hGpyPVmBB+Ey789kMRD4vEKLBT6EOhTPjpY6Ox1ti3QQaBp8OqVJReo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=ATutRfXn; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="ATutRfXn"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488ac04e13dso2578815e9.1
        for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 05:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1779107211; x=1779712011; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=K7f4p9DDizh5dEM+ARpNcE58XjtZwhJ/w+0XvXwelXk=;
        b=ATutRfXnY+gIvP820ugX6IERpTKx8wkYMtdmDpqClNp1jpIz9cazMnQ/0394O45yV7
         5UHgs0yl6y6DAIW2zlEMFhCJX6r/wpI9Ju16EmFYmZnKuDg5OiM2an9iN+66Wp62whKV
         WL3H1fp6jAAlVk56ZAEyOoYHdjcsRTo9ApEGofBYGN9zY08/203ZDnvfGV9zDhv4ODGC
         kee1dUSUzG7tdtlaX4pqYgZkzBoCx9P/9h8mV9R/MK49EkBMd6c+DMrkUKn5G3wCeqc3
         7XUzH3EFmjeK+9VqzsvplyjUIFthwRGctUbORHBHTcxFN7J8Qmsp4yMaBqRo+xrSk2Jb
         no+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779107211; x=1779712011;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K7f4p9DDizh5dEM+ARpNcE58XjtZwhJ/w+0XvXwelXk=;
        b=gWBaio2eL0rrGTMy8qW2POOPp/vQyv35XavGHGbXm0FXVSQDHgcvJiivWGlyNcJUR8
         j+sl/IV0ZW1WEpe7kgE6qxPxK3s2ClMxX8S2eAU588dyPu7Mw9V9W3HUp9L7wEwJz9Qk
         lKitgLp050hTVW+bmn4xz8y99tUyN68QDIySQ26dJPbjURoxxjvghVeV+sPuGPLhqEGb
         EWZ6rWeOsBsLwzsdGcvXM+ft5+MDZY91hq1RuNK+PAeqovz0/td5H8jPg4yFDO7666+r
         btkrBolk84aQPQXwbsgkrnefvk3uie77bbffcbxinGWpPuoclG+dhO8M2tFUL0hVCPI4
         +avw==
X-Forwarded-Encrypted: i=1; AFNElJ9F+8FThLQnxD9L7iFjaMQKp0WGl9spt6/0qYBX5DYZVK9uAmFMAzoQ3aVjeZPjlJZIBSfljmuSdZfWvcvVDhE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNXkMxUGBIakqERIRqs4CeArbzD7Sz7uG0nFBXGucp9WT58LJg
	mTM8mI045eR1+vSNKCI5lYgNYz0AvGDXeKodCI67TgQO1Jbfj6kTKts65zcgpgh0bhQ=
X-Gm-Gg: Acq92OFyPBGOE6AjbzUiIDEXBIMirHY0Sfea4uR3FO3Sx7wYiKVa9e4v2eDEZtF7e7I
	cYN1+HZnf9UESZNSMrMe8/I8Y9VgZoYfwEZ/XkrnmwR5of03o2d47sMrosmUixDCyjelM1p0on0
	thKTyLXmFujCHCUNQ+SYBTuCse3MPpV9g6BQG+c/NozHfxesHzVkqkf+oYOa9PkxuOVHj9Vy7MU
	n1vJLOzD+UMf4vuCAZsOonqamqWdfm7PWBabgKU+V1APYQiXgPhsXsEQQwC8x0d24wKyBs5gHPl
	dqYIHcxEoYb/yW2RYevFF41/pH0pdwlJDJQENbBbfI84rRiJb9U4pisD9yATiJqw1VZJ21Nzw/o
	zzR/DDjgt3PUFqJI+Pmy7AxOmOxpA/3kFc152gOWtMM8mEfZCT0jgrJ9kPn5JA8SdJ6u1sOwkZl
	iQDmhtSGtTtupjJg20eB9btYQgaPJUoN5xm7C5yhrhOUE1jIFcIwWq4emxMNffebS6+o6j0jyJ6
	wzv
X-Received: by 2002:a05:600c:3b07:b0:48e:6db5:76e6 with SMTP id 5b1f17b1804b1-48fe63099c6mr122267235e9.2.1779107211132;
        Mon, 18 May 2026 05:26:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:b41:c160:6a1d:efff:fe52:1959? ([2a01:e0a:b41:c160:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5cab818sm261195405e9.14.2026.05.18.05.26.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 05:26:50 -0700 (PDT)
Message-ID: <596094fa-4e41-4ffe-9261-47089ff92f74@6wind.com>
Date: Mon, 18 May 2026 14:26:50 +0200
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
To: Jiri Benc <jbenc@redhat.com>, Ilya Maximets <i.maximets@ovn.org>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Donald Hunter <donald.hunter@gmail.com>, Shuah Khan <shuah@kernel.org>,
 Adrian Moreno <amorenoz@redhat.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Matteo Perin <matteo.perin@canonical.com>
References: <20260515201937.2813983-1-i.maximets@ovn.org>
 <20260515201937.2813983-2-i.maximets@ovn.org>
 <20260518082138.37522db0@griffin>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <20260518082138.37522db0@griffin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 18/05/2026 à 08:21, Jiri Benc a écrit :
> Hi Ilya,
> 
> IIRC this was added because Open vSwitch needed it. I'd expect most
> users that need to deal with cross-namespace detection to just switch
> to the given netns prior to issuing RTM_GETLINK; at least, that's what
> I'm doing in the tools I wrote.
> 
> On Fri, 15 May 2026 22:19:20 +0200, Ilya Maximets wrote:
>> But this doesn't work for link nsid in cross-namespace RTM_GETLINK
>> requests.  For some reason the code checks if the original device
>> and the link are in the same namespace and not if the querier's
>> namespace is the same as the link's.  So the logic becomes:
>>
>> - if NSID is not reported, then the link is in the same namespace
>>   as the queried device.
>> - if NSID is reported, then the link is not in the same namespace
>>   with the queried device.

I don't agree. The expected behavior is to have a IFLA_LINK_NETNSID if the link
part is not in the same netns as the netdev, see d37512a277df ("rtnl: add link
netns id to interface messages")

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d37512a277df

> 
> I'm not sure I would call this a bug; the original idea was to use
> IFLA_IF_NETNSID to switch to the point of view of that netns but
> without actually switching to that netns. Hence, the netnsid is
> relative to the caller's netns but otherwise, you get the same reply as
> you would if you switched to that netns. If you think about it that
> way, the current reply is consistent.
+1

> 
> I agree the side effects of the self-referential netnsid are
> unfortunate. But that's an orthogonal problem merely uncovered by
> IFLA_IF_NETNSID, since, as you correctly note, such netnsid can be
> created also by other means. This is (AFAICS correctly) fixed by patch
> 3/5.
As said in my other reply, getting the self-nsid of a netns isn't complex. An
application should be prepared to handle this.

> 
> So, I would argue both the old and the proposed behavior are valid.
> I agree that from the point of view you're presenting the proposed
> behavior is easier to use. Double so since you're arguing from the Open
> vSwitch POV.
> 
>> 4. A seemingly read-only RTM_GETLINK request for a different namespace
>>    allocates a self-referential nsid for the current namespace, which
>>    is a little unexpected.
> 
> I, however, don't agree with this argument. RTM_GETLINK has always
> allocated netnsids, even long before the patch adding IFLA_IF_NETNSID.
> There's nothing special here. You might call the netnsid allocation
> unexpected but it's been part of this since the very beginning.
+1

> 
>> A research across open-source projects doesn't show any projects that
>> rely on the things that are being changed.  I couldn't find any
>> project that uses the reported LINK_NSID with cross-namespace requests.
>> And no projects that use cross-namespace requests seem to even parse
>> the reported LINK_NSID.
We (6WIND) are using this behavior. It's part of the netlink API.

Regards,
Nicolas
