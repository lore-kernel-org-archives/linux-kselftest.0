Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE173C1D7A
	for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 07:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790323133; cv=none; b=pvN8LGmv5GE5wCM4a59Be26FLdKTgsI/TfhFejQT29XhVg8pF/IX/3IPnD7S3QHHpgsJh0wArF1K249yAzBc8huTd0nY0b+eU1nysvKmWRV0p1sDXbBPx3abeJuXM4cS9H6HhDC/2OOZOsYyNIpxIwCZNVoIFSgYdee3oVilBNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790323133; c=relaxed/simple;
	bh=owvT5MkOsiDpLQIP9Fll5Zuo96WfQJpF8vjQtgKYjwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YuDgQ/QwFYlZjIY8icMC50jLOD8uW3ELR+Nh4zQREwnA6JZBx5JGPzQtxFs+n+wQ1YOmHIIlxjyZz2PUqL/kmxu+QjSBuVuVoa7eF8dObMWxXAGnWqKy8bgneN/U67W0KFpPbpd/oRnq611gPJTMVtQFZxtc2Pm+vkPPeR7Ctek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=PPA8x8C2; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="PPA8x8C2"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887ebc85eeso22015f8f.2
        for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 00:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1790323130; x=1790927930; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9n6ZKLFcFHikmLkQ5fygAPRgtfnum06DEuIZGMf2IV8=;
        b=PPA8x8C2XLa79+CsUHdNWX0I9WtnFvMaYNLFLvgRv7H10VpmHjy+vZ0d3nyw5ygb1S
         qODTZEI4R4fYUsl+wiXKXKJReVG8mPB+CgI6td5/441cENyomzIaJfM/j8axXFyUxVEb
         qZ7hORjRGGEHSNaCnGKslOzSiffUN+DmP8Ty6LUPTRdcVLuOnl1fOdQHGugI40gTtcQ1
         tGlu5X72uMFBbo8Mg1MY9viVcNE9nCBP1iLuFbIVL6zj6agscIqdZFfap73eMBZ5MxeA
         iY8ePIBGekOVWSYw1TgUV4Ujw4xpyHB6RIv2793fsbbd8tA9gxe4vI//krTNUCq2JMFD
         OUuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790323130; x=1790927930;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9n6ZKLFcFHikmLkQ5fygAPRgtfnum06DEuIZGMf2IV8=;
        b=Jpitqc34TPWdsdgdXGu13Ra+u2tqMABDj0NVzBd0po88dquhU17Va0pVbjGn/fpkJ7
         EK9LsBDabjJkXbicRtELEwGgnrHFlU8bcV89OBEUTudsucVIM2wkjRtG4j5sCDePp0Jy
         VIcX8ltt5s5c6u5JYFUtXJoMeUb1Hx/t8L3GB6RZzFm+tUaqMCcedoxIcd4pyryWD0Oj
         iXE4HoHTut5uZSYZtNoIC5CyCH00hIZHMnUKNo+QDKS+DP5jTC5jmSSk7ZGrYr0FOm7n
         gwzDYSohHIm1APCFa+yFa7sMTTi/rE4BQ3VcNRaAKZZWRDT8t8TBmzhA5xdSD2v/oUzH
         oaxg==
X-Forwarded-Encrypted: i=1; AKwUvBzWrxQ55hg5pVUopKleg2RaHoadL5KW6+rp2sHNGn0fs/3/ZePh200L2AYdqekUtpG4qbwGCn8tHc4gJCom7Wc=@vger.kernel.org
X-Gm-Message-State: AFuF++kZs+xq2b/84bTnAc5h9Xc1W0wDgfb7xtJ8yNHs7s/btCuraxyF
	vM8ZenW2A+o8TYkpFKAUGn8Ha0DvKwfzC2n0pnbZDhIcs62u3ExsXxAAZ6hKVr2s0Kg=
X-Gm-Gg: AYBFou1AbxIPzfS0bclqf+WCf6hKv8qkMlt3kOSWHPAiO3yThnNOBVx9M167EDrMVz8
	+UEswC9nl7tPYVTYHigVD7u456GcUh/LGh1N4VR7xZZePohWu8lD/azjD+MRWzygn4kIgo0J34i
	96t9r12XhdK92yorXPnnFW2Dej8s/i3sFgD6u6LKXDFJLEjlUE0tMh0MxMw6d7AxKZmX69Siyct
	lZ6vG8qs7Yoii98NsuNA6RAg2HhcxzSrYtNb8f7UsNSDRVjYLfiFFJqqF24jQE8IZdrew2OMxYP
	Cfoue/RuiYQ6HLoKB/FM1H73V/hWo0mKitRjm47e0hXVXcv1Rq2yi99dssX0lZvstFHkoLEaZSz
	tNSjAe+IIgCTa3alOGOW4bdxxvOaFOzSt4pK9pVxAvUOlk01Zg4Llt50yQdjTSL+R4x8Y7VJzus
	v7RyII0VoT/BivxhmWBCHxwMfkhkz54WhCQwzjy+YeWowFrwy1kPv0BPCS+wkxzLabxn1DNn8Xu
	+vG2ToWT+8YepnTR056b16k6jPdhctdilJB3ZvDeUBJ0ov8Xhk=
X-Received: by 2002:a05:600c:8b09:b0:49b:9241:7ff0 with SMTP id 5b1f17b1804b1-49fedce4db3mr40284195e9.0.1790323129618;
        Fri, 25 Sep 2026 00:58:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:ab7:2110:6a1d:efff:fe52:1959? ([2a01:e0a:ab7:2110:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff13b3c58sm16717205e9.0.2026.09.25.00.58.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 00:58:49 -0700 (PDT)
Message-ID: <51d27e49-afea-4416-81ef-9ff132820066@6wind.com>
Date: Fri, 25 Sep 2026 09:58:48 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH net-next v7 2/5] net: add a generation counter for dev->mc
 changes
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, David Ahern <dsahern@kernel.org>,
 Donald Hunter <donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Ido Schimmel <idosch@nvidia.com>, Jacob Keller <jacob.e.keller@intel.com>,
 Jakub Kicinski <kuba@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>,
 Nikolaos Gkarlis <nickgarlis@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>,
 Simon Horman <horms@kernel.org>, Stanislav Fomichev <sdf.kernel@gmail.com>,
 Willem de Bruijn <willemb@google.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
References: <20260924011554.3494-1-sigefriedhyy@gmail.com>
 <20260924011554.3494-3-sigefriedhyy@gmail.com>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <20260924011554.3494-3-sigefriedhyy@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 24/09/2026 à 03:15, Yuyang Huang a écrit :
> A multi-part RTM_GETMULTICAST dump of dev->mc resumes by position, so
> entries added or removed between two dump rounds can be skipped or
> repeated. The IPv4 and IPv6 dumps report that with NLM_F_DUMP_INTR by
> stamping cb->seq from a per netns generation counter combined with
> dev_base_seq, see inet_base_seq().
> 
> Add the equivalent for the device multicast lists: a per netns counter
> bumped whenever an entry is added to or removed from any dev->mc. The
> list helpers do not know which device a list belongs to, so give
> netdev_hw_addr_list an owner set for dev->mc only and bump the counter
> of dev_net(owner) where entries are created and freed. That covers the
> dev_mc_* helpers, both lists of a sync, the hardware sync helpers
> drivers call from their rx mode callbacks or their own workers and the
> reconciliation after an asynchronous rx mode update, while snapshot
> and other lists have no owner and are not tracked. It is atomic since
> the writers only hold the address lock of their own device.

For IPv4 and IPv6, the generation counter was initially used to invalidate some
caches; that's why it is global. Here, the goal is only to check the consistency
of the netlink dump. I wonder if maintaining a counter per list would not be
more straightforward.

A helper could then manage list->count and list->genid, both evolving together.
