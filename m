Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793656869;
	b=MR65ppJKwqgVboKfL6wyrZ95WFP/FOWUgSCl2o0y/FxExog+Z9tpzknvrvsDjJ5LpELA
	 lhoLFPtzYgtiyjpKS1uTqRqHmNdxguhm805EDOrJHUlq1DfUGhqXiPP4ZyL5meCf6aPXY
	 w9BTndXl3/pVRjii31XnVoMjbYyGKOs3uAEugPWTCjxlmP63iHh5NtXEXvWZ4UE+4WoDS
	 UieCtZ61MEYN8Wv8NdV74o+57pRJUdZWlsWC+lbKd3mxeLpTnOwoaACOP0/e/Af3cYCI3
	 8usNSKfPqvn0tiKZBCIWFQPVVaoFHgEeuCuuNqPK5kzaLnq8mwOpfH5vdSNUdLw331w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793656869;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=nmYBbIk5usy6FeDyc+DCeJpHSSfN/V5GCfHKFupvluE=;
	b=dMd8DlkqQnsU7Cc12hvMoSq6yLxYRipGTDLdi29+rQuuuzvNyg5aHRHVMbBax8urDtx4
	 4YFzv2eR4AShFxeBt3SUt6yuugunazvQLk74LN1y4cSAKLabqk703j6gFdged89AZCfrW
	 jeuaAKfY5QEFIPY8vaDo9fgi6vryEEsIhMncp/tGEh4cZ/6lUdD6qcwEp+LuGHIFvCKBO
	 Emz5gMciNyxIf4JRqHyMl5CwXiefXmds4RwZVXVtKTdYcIhkxiNmZtKjVFtP/+iduGYoz
	 shf6ZvnoBNvpHNHr8w7qeuiWeV4c9mFubynDmYkUNj9TUh5QsJscPfh/hsfBp7Exn0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="JY/wmp8u";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=kxub1Oep;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BCD606A326
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 22:01:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92BCD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JY/wmp8u;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=kxub1Oep
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793656867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nmYBbIk5usy6FeDyc+DCeJpHSSfN/V5GCfHKFupvluE=;
	b=JY/wmp8uEajzUkf1vNeZ7IdqqrYGiqbB+JyZfHIwoBnRWFnXx6MxOMBQ1QPWUuN47HN3vw
	WfXsqF3y2s4CK8roeZtKzy6VSl6JCH36pHlSmbwr5v1VaCKfqJsb28FskLBuSe+4H8NHu8
	7PydJ4vC0jswAldSb+/rh1oN5K8jTB0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-382-Kvolrw9iPVSNzIZ3skoRaQ-1; Mon, 02 Nov 2026 17:01:06 -0500
X-MC-Unique: Kvolrw9iPVSNzIZ3skoRaQ-1
X-Mimecast-MFC-AGG-ID: Kvolrw9iPVSNzIZ3skoRaQ_1793656865
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48e1d839ddaso2477188f8f.3
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 14:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793656865; x=1794261665; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nmYBbIk5usy6FeDyc+DCeJpHSSfN/V5GCfHKFupvluE=;
        b=kxub1OepQwqzw4DlS3rfA1OfAXqLMScfhFOmzNrJ1pTHliNk1VVITv2fVQ/UPxKoLU
         QfvGseif6c5bt0WFIJ0q12sb2pzR4u2J4YfJgBY7U8Om8in4RhWC7yMK34FmrE+4GSz+
         5gXSOvnknqCcZQQIYxRFUSH+fmdwg/m1R0R8VfsuasglNTZRYb1vc9L4ZSq03EUkFDpQ
         EDxoO11i0GUZyyb3Z5IUsmyft32Qt8D4a3HtGkVBQt9F6v0zVqPJqQvaXlauDKBuBqnI
         GfhxNDuwUIHctovuzeuFDmtxLnWhbV/XbrnwbJ+DDZqa2/otPHbkMbnwSEawQFS4m4PK
         1XbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793656865; x=1794261665;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nmYBbIk5usy6FeDyc+DCeJpHSSfN/V5GCfHKFupvluE=;
        b=Z6ablm18bWtQd6Zi703pRFQctopz6El7aUnZVogCJfbXfLA92zIZSj/bnC9cpmjpvL
         HKA6F0MsneR4wxya5z5mscItx/dt898blxA4zNJZTTn4T5QbkW9ER5lzU8QfLkDjyTwb
         li1LwAZxZwFApNOx6Ox9kg6pNU+f/KymUF/ihs8IWIEzDARWsnjd2DarzXEjboJ8p95g
         1QLY2q5LwBkN3IxWh2mJ3wuOrIdBV5oWm7vt+ajX3mX7Pj2SwBRTcFC80rLFzwqiK63T
         Y8eIxaVYhazwTmn5sgLFU0RLpWTmh9ryPYBnJELwnknef5ivtwblb41j6wqbs2Pbuh04
         x5vQ==
X-Forwarded-Encrypted: i=1; AKwUvBwS1oHUct3jdZk6yq9T5m+xS9QiUmv+fsY91YUK4mc31hDomtGvkpF83gry3SjI6cPshQQApVtQY6cFYD/XvZE=@vger.kernel.org
X-Gm-Message-State: APuU4Z87ZyfMP8ryu7LbfwEkv6gw/PITb3R1as5DmgtP1I+aNkp2jIA1
	L6TQEGStglmXK5fhNi+2erimXa9tsaGBwnwCN/ImerqetxKP5FhOOxzmZDsFMIxUy4BvvbQKw7Y
	w1ReRFwO19t+IhwU85VbnIivjqaOzDnAUnTmm+xISoNqueoO/A8V3D6pXSluCOWizoC6bXg==
X-Gm-Gg: AYBFou2HIY1U3TIiKkh8u1TCpm1hXl3/6UdLjJP5HhVEaPvVDcH9s/VgYJ+lBYQeQm9
	gGzJ81HH/KJupXe4d/xNH/pP0zOvnTHVhBCUlM4KKsSe7jB0TtEujcjIfglQKwilq4VDf30Lss9
	tWGws4STtNnkCufIPlVvs7eWMyKlbStc2yHbn+WLBFVM+KwWh545VkC0+uF2Cx14SSNz644LjjW
	d2vNfeOpObPWyVqX5M+qAtOK3Lx8Jx4NTYPzDBEB1gKAl9ZcebRxGmqQcg+0FWHnfUk/f40tM1N
	L435iGZIAAOS0zLua8VOs5zo04ICiqJDblNmkrzcM5UTmVZVwlajuGWWCdnEhSk/wvsvLB9jq6j
	UF06c3G2P18NzbqBO42nlZDG/0c8wjuF5gd3VqOexNUITA+n/4IBQtsg/bbKktcwZsfVqNlfD88
	j83G/h8IIF50SrUJEmGip1bocZx+TYAArPxf6VovvZmzs=
X-Received: by 2002:a5d:5f41:0:b0:48e:68d5:818d with SMTP id ffacd0b85a97d-48e6e2eb83emr27445782f8f.16.1793656864958;
        Mon, 02 Nov 2026 14:01:04 -0800 (PST)
X-Received: by 2002:a5d:5f41:0:b0:48e:68d5:818d with SMTP id ffacd0b85a97d-48e6e2eb83emr27445750f8f.16.1793656864628;
        Mon, 02 Nov 2026 14:01:04 -0800 (PST)
Received: from [192.168.88.29] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71baa1b3sm20953601f8f.56.2026.11.02.14.01.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 14:01:03 -0800 (PST)
Message-ID: <f4f0fbd6-63e4-42d3-87bf-9f888a8de1a8@redhat.com>
Date: Mon, 2 Nov 2026 23:01:00 +0100
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v5 1/4] net: devmem: unmap dma_buf synchronously on
 queue uninstall
To: Mina Almasry <almasrymina@google.com>
Cc: netdev-bot+sashiko@kernel.org, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 sdf@fomichev.me, kaiyuanz@google.com, kuba@kernel.org,
 bobbyeshleman@meta.com, asml.silence@gmail.com, dw@davidwei.uk,
 ap420073@gmail.com, davem@davemloft.net, edumazet@kernel.org,
 horms@kernel.org, shuah@kernel.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, phasta@kernel.org, andrew+netdev@lunn.ch,
 sdf.kernel@gmail.com, hawk@kernel.org, ilias.apalodimas@linaro.org,
 daniel@iogearbox.net, razor@blackwall.org, tariqt@nvidia.com,
 kaifengw@google.com, dtatulea@nvidia.com
References: <20261030083539.777877-2-almasrymina@google.com>
 <179357408146.3131.2882435952119280563@kernel.org>
 <CAHS8izMt+5HBjkOOsb-FrwKoXxEBuDn=gf5p+64akYS=SAoQrQ@mail.gmail.com>
 <9afff44d-f8eb-4549-8aae-f99a53339319@redhat.com>
 <20261102185856.1824792-1-almasrymina@google.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261102185856.1824792-1-almasrymina@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/2/26 19:58, Mina Almasry wrote:
> On Mon, Nov 2, 2026 at 7:29 AM Paolo Abeni <pabeni@redhat.com> wrote:
>> On 11/2/26 00:16, Mina Almasry wrote:
>>> On Sun, Nov 1, 2026 at 3:01 PM <netdev-bot+sashiko@kernel.org> wrote:
>>>>
>>>> - [High] The dma_dev use-after-free this patch says it fixes can still
>>>>     happen for RX bindings made on a virtual device that leases queues,...
>>>>
>>>
>>> I know about the issues with leased devices. That needs a bit of a
>>> rework, which I have done locally, and would like to send out as a
>>> follow up fix.
>> Will such follow-up rework the code touched by  current patch/series?
>> how much? I'm under the impression that at least the fix for the issue
>> reported here would be quite overlapping.
>>
>> /P
> 
> I pushed the follow-up branch on top of v5 here so you can see the exact diff:
> https://github.com/mina/linux/compare/devmem-teardown-v4...devmem-lease-bind-map-dev
> (commits: https://github.com/mina/linux/commits/devmem-lease-bind-map-dev)
> 
> There is some overlap (~55 lines of v5 touched across a 6-patch +262/-99
> follow-up): it renames binding->dev/vdev to binding->map_dev/bind_dev, passes
> the net_device explicitly to net_devmem_lock_dev(), factors out
> net_devmem_close_rxqs(), and replaces the !rxq->lease / !netif_is_queue_leasee()
> skips in net_devmem_dev_unregister() and mp_dmabuf_devmem_uninstall().
> 
> I kept it separate only to keep this net fix smaller and easier to review,
> since the lease issue is pre-existing. Happy to either land v5 first and send
> those 6 patches right after, or fold them into a v6 if you prefer avoiding the
> churn.
I hoped for something smaller :)

I definitely would not fold the 2 series.

I'm wondering if this could be considered net-next material? pointing to
net-next will offer better guarantees for all the work to land in the same
release (no need to repost in such a case, I can apply this one to net-next
directly).

/P

