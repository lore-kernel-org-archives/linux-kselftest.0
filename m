Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794973128;
	b=4UnKV5BhZDXrxwl98dg+29ZnSYQOCgNK8hI3v5aZHITuGkuNaF2nu3C6YsnvakdMFceF
	 6PkFk7WngSbG6T6hqjKnyeDFply89N8HwXy94siVau6FIWRPQpLkVXupbt9TPHhcEIWZC
	 so+j2UtR8l09Lsf9AQyORpKUvuzuLHu8bbaVQFSdcnmLlhYjkCmFFs4fSq0UISJO0hi98
	 pUqo1ihWGT3lr5xSl9Op677x1ZpR9wwJ6dhR4emIswHcy3xPf0El703LjAhkFwMOgGtdr
	 NtkAEODkggk76x6pxUObdXZUcNAoC6rFw/p7qU/yezyx9RITtPaDtCubymi5N8a68GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794973128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=Kvmn+xw8fMzfurQj4tJUer/fYr30jKP4x1tcbpp4Ht4=;
	b=tlwfyYLvXT0hsAaWfIHbpTfatWDRB+5pdrYT4rQeHKY6rJp5FRvv4MGfNX36yw2oVkRu
	 9BUAqySagbtSt70l0OBjkfARfDkg7m9xa6HqH1NeYwHIwxlVPyjEB85fj6b2BQuTh3eoh
	 qUzcESCmvaZPfSOYBugGtWZqQNSvT7N20bNjD40xzjCyXCYN/OE5NG3BzwqLG5ziQeOFV
	 kYLGtUnPeOzgBxhfQySkK6GouQZO7rXkomhAeSJHBEV07UqP3P/zzNAOEdGLFc4ej9F3T
	 XmHp8Z3BmP2i0k5FRdMHMvtytHgr7M0xvWVd8LJHSda7/oNsfiepRqMTX6rAqUlV2KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=IfmRfcsh;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E40606A32A
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 03:38:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5E40606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=IfmRfcsh
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-380b40319bdso950177eec.1
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 19:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794973127; x=1795577927; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Kvmn+xw8fMzfurQj4tJUer/fYr30jKP4x1tcbpp4Ht4=;
        b=IfmRfcshEf8CC2x8ZQabjNmG5gsCHR8OAyUtXOaUA4Luli9y7mZZBExDxK8bPLb6Zd
         rac2EJ4N6fEvhpBJDmWkpYnWbeIl08HM+7laGQT5cBlru06kB4cFZA9zPjBO34lNREZV
         78QFlxDIg5xGljN2NBs0N5kiQMWyWvSEK4+Dc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794973127; x=1795577927;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kvmn+xw8fMzfurQj4tJUer/fYr30jKP4x1tcbpp4Ht4=;
        b=hWY/LLoaI38XmSod4uQwCwPYR+qIUYRcA3oa7Q0ymMGpjeRp/ux7wX9bEArtM7DjnV
         AjS2CMM2VZBVbJUkdQbtBhQXxFP/5CqTkdmvgeJfRpIj6jXpg4akZCqHDUj897G5CuGH
         vhg/gAxQ7x/2ln1JybZkRrBoZJXWne5QUU9JeL+OSAb0fOK2UZaFeDreWBDz8XyaZ+uc
         Jw5dqSJuAfYqPMllQP+azy/1hxh0YAv+heL16yFNqXcKOKeMzFUdJ+uRg9ivIr7pR1Ll
         nY/ckR67h6DEs+eSq8Yo+NK7WpRE1SEyorxoaAn2GqOBQ/+BUhetg74wbyHGVIwi0iMq
         FiTw==
X-Forwarded-Encrypted: i=1; AL+hErGLdAW/qUCh/JfSHe6mRIa8R+FxoevCLZ28C62EnVxy61yOy3VSk2MmbFvPHWQDR2OznyLgYot3QVoI8V+jTZs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WrNgPnVDgfsaj6jySeN5CqNC6qvk72Yc1sb7SxB2Ewp5XATfs
	CS9c5CNmgBFs8q92JsBx1UzlU/55dSr6WJ39YMl68cO0gaKqAyapH1gBk+DWd3L3h4I=
X-Gm-Gg: AYBFou3YZWns1oNM6Pxew+8apg8R8QlVDTSe20S5SdQp18U7EAXq+nKJz82xe4UQ3L3
	X3ez1B8BOd53tH9jc3vU5EAOOpMNIpMxJXn00ucmia9aby1wXuJApxoxWpBRDkaRKzQbEIwflEg
	xdi/UII75P0ZHei8hI0aMIfty1GMU7vGIvq0WvVytjSaKHijNlDk3SShgmSn/aTw6e2/xXTZTvZ
	5SLnPfFfrRHrc0fc3EocfGrYn0glAdS95YUPrk+ri26zhEr13SdFUcdEX72P7km1s8hbnj8bx9C
	s5ywK8cavJb21Nln2WFO13WC1wt/jlvPyUjpn+BNM+FlyZ02FhUBvaICDMqlTxah0pc1z7/UnI9
	MkWmYz9ffJLjVXqqq/L2mFUHXeNkwAGkTE2nEMBP5gsXyCyOn2ps5wKdIvOIh5s+pBUCfOPAQ5d
	9WSup1UefU7pMxmrYYhBR9YedT9tBOxy5yFMUWxfqRLbgNHaV8Nc/3WzmPao0hU2gW8Bqy0TP8+
	pD04SsYNkDT4/p9qrVmS8nPdc6NKWXwI8LzNc/rAEVfkqJEnxe29EKolxCtQ99X040A0WDmW7Ya
	FE7mo1C6ykcypwyVw1UngwYLXNLoQu1yDZnVkP2w2sjpFcX5G9hZH8cQ56TX5KgsgSsEm3TylLG
	eSMXz/EsuPS/yZwDrNkl50Wr7XiXmvcM+hfQRH2m4F/+N/1PRHK4UbBobvzQncJNiR0Uxa++J3/
	x6KFpojjee5ExVc0QcLqhdBbn/dC8FnANYsrZHSxQTA9x30x82A2hEBv6aL7uaKodT
X-Received: by 2002:a05:7022:fc01:b0:1b5:1a6c:af64 with SMTP id a92af1059eb24-1b543bcd4b2mr1258863c88.17.1794973126774;
        Tue, 17 Nov 2026 19:38:46 -0800 (PST)
Received: from [172.20.0.2] ([172.56.235.113])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a63059f8sm4907822eec.9.2026.11.17.19.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 19:38:46 -0800 (PST)
Date: Tue, 17 Nov 2026 19:38:43 -0800
From: Chris Down <chris@chrisdown.name>
To: Alireza Asgari via B4 Relay <devnull+alireza.asgari.net@kernel.org>
Cc: netfilter-devel@vger.kernel.org, linux-mm@kvack.org,
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Pablo Neira Ayuso <pablo@netfilter.org>, Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>, Shuah Khan <shuah@kernel.org>,
	Tejun Heo <tj@kernel.org>, Vladimir Davydov <vdavydov.dev@gmail.com>,
	Zhang Jiao <zhangjiao2@cmss.chinamobile.com>, Song Hu <husong@kylinos.cn>,
	cgroups@vger.kernel.org, netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org, Alireza Asgari <alireza@asgari.net>
Subject: Re: [PATCH RFC nf-next 0/9] netfilter: nfqueue: account queued memory
	and reserve capacity
In-Reply-To: <20261115-b4-nfqueue-memory-accounting-v1-0-b9cc30819997@asgari.net>
References: <20261115-b4-nfqueue-memory-accounting-v1-0-b9cc30819997@asgari.net>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <av0dwzvTBXXLqWCa@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Alireza,

Alireza Asgari via B4 Relay writes:
>3. Whether the proposed bulk reservation interface is an appropriate MM
>   interface for this use, including the explicit restriction of charged
>   growth to 64-bit kernels. Is this compatibility tradeoff acceptable for
>   the initial interface?

Hmm, I don't think this needs a new interface. obj_cgroup_charge() and
obj_cgroup_uncharge() on the objcg you take at BIND already deal with root
ownership, reparenting and the kmem statistics, which is most of what patch
4 reimplements. They would just need exporting.

>4. Whether non-reclaiming reservation growth is the desired failure policy.

I don't think so. A long-running cgroup usually sits at memory.max, mostly
with page cache, so resizing the queue would fail with ENOMEM even though
most of that memory could be reclaimed.

>Increasing capacity obtains the additional reservation before publishing
>the new limit. Failure leaves the existing configuration intact. Shrinking
>preserves queued packets and retains page-rounded backing for the greater
>of the configured allowance and outstanding saved charges. Excess capacity
>is refunded as entries drain, with refund work serialized against resizing
>and coordinated with queue destruction. Refunds settle the actual memory

Keeping the charge at the larger of the limit and the bytes still queued
makes sense. Otherwise one could shrink a full queue, charge the refund to
another queue, and leave the old packets uncharged. But, unless I'm
mistaken, the excess doesn't have to come back as the queue drains.
Configuration already runs under the nfnl subsystem mutex, so if the excess
is released at the next configuration change or when the queue is
destroyed, it looks like mem_work, mem_mutex and mem_stopping can all go.

Thanks!

Chris
