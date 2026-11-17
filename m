Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794911014;
	b=Z7DM5s3lmw6vyGyz3sqIyYhuPHwJNgUtUZ4t0VI+rBPLlgCchQMRPYeT61axLpuOkUxp
	 tkg+bzhCYSdlwExvzecv9+aHF4Cu0tmGO0fANl/kr4f1aP1q0USF6d2+t6CzHUGQj/mBg
	 lEbpKAWQCGiVg8hx+NDv4RUeJzv8AJAmY5iXPcSBaBCeynAORezYpNnoGz46mgQysmXYT
	 nOC1SVcYjmaMMzP00CrCLCxNZTF2Tv73qKJx/i+Rodv07+Lvmb/z0y05XMVYuqZBlFDk1
	 00YwrFCxm/cRdcv+EWJprUZOL7hcu1MfW4Atc8r/Q2zwL0K0sNX2Duc19+GLsdOA3pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794911014;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=DjsejkRzYNs7HgK1jG5OP5VX/gmq6yS31WYEACSluoo=;
	b=S7x17v/WXoN44CV9OpOC/EZyGO0fFVLKNma25SMWyMfClKWURmJyKpZ2Tsp24ysmBprC
	 Sf5sn9/ALiMTX3RsBA/kGFT6utMgVhosJHkp8/FriNP35ErvpwwVWI06bHsFzvIaB+tSI
	 /t1pamVnipqn1DODDGr2B899Q9JeB7S/ZjNixENqmzNZzReW1Khg9EKA4QMDL1zbJgJbP
	 hTHkCRozbLCpQa9epdTDgpdrTyX8yhAcb1Tn7udcV9B1KqBLaTD3MlgXZ46csG+UDLx0B
	 EEmajo08eq5G2XSgIXqq+hQIjM3UbaXMgWyWLIe3gxDXKj7aaWg3+1UbfgvE4cKtAgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=etDJOiya;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=J4CIb+QY;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B721606A31C
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 10:23:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B721606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=etDJOiya;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=J4CIb+QY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794911012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DjsejkRzYNs7HgK1jG5OP5VX/gmq6yS31WYEACSluoo=;
	b=etDJOiyasiks6YIIATAsrZ9FksYaB3rxedv1Fh8ZHPAzpZ3wyyCl7QoCcWxNvkZIFeCxnH
	YOYJMwcvKA+rcXnrwxzWsn+HUGd0eGVwvEzlMiPgG1USGerduPG5m5gMS3rxB3Gs4CaRAi
	SuGgUOmw0Zd1bLXntuwEPNqEd1hLA2I=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-8FEs5eImNSud-3kmjQFRew-1; Tue, 17 Nov 2026 05:23:30 -0500
X-MC-Unique: 8FEs5eImNSud-3kmjQFRew-1
X-Mimecast-MFC-AGG-ID: 8FEs5eImNSud-3kmjQFRew_1794911009
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a359c7f47bso39228065e9.2
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 02:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794911009; x=1795515809; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DjsejkRzYNs7HgK1jG5OP5VX/gmq6yS31WYEACSluoo=;
        b=J4CIb+QYP52F5Ozz1YSRzNCLJP8GFuZ9WKhiO5qnYiSoQNpG8/9CwWGoKgL1SmKr7Y
         D+58Njqz4HR60pBqUd2n90oOsNkK1Sy2U1zMRrSeHthZntF5pEQvvXZkoh936sFct2mi
         egpCxuefUqMLqSSOvC22AgPh4pSB6LkTfX1A5qCP9dG0yKlMTFxCKZUXUiCBdEc2neDs
         mBjODN41nRz9wXqyXzjXWhRSPwROi16gisiGLAQsMpNc0WqI++yt3gNo1Y0Zy1lv82fC
         CJXCfoQQT0W5YaZJyhquybp8584U+2wQR5pRnxub3YOd7TY+EN+1Bc23h9Ta3l6apaxR
         ZRow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794911009; x=1795515809;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DjsejkRzYNs7HgK1jG5OP5VX/gmq6yS31WYEACSluoo=;
        b=xKtXSv8syja12Oyfe5cpdg+XyvUmO3pD8rKGb94n6ENhUkG6tK/ezu64BT+fhlAIiG
         6FPe1eGez8F2XvDR2leO6vlTQN6GnV6O9JjEKZS7O91898oT5bUh9RFdhp3H56MXN9lZ
         dexxbrcuTPCh1OAhiWCHblgQW9E8hICXNJmjewylGj/bgFlk+trV+GsML7IvY9fYpy93
         gxHD/60H1GxV6qRUnOsB2IVqoanfnHG/mk/AfUJXZ7TORBJgpBE0aTvzyAabXjBtBVBZ
         lHiZWnIJ1wrOOH+TuUxty4X5TOV7/G4xi0jDG0GQ1E9ByrQO0cuhzQCaLbbmnEQxveM/
         q3JA==
X-Forwarded-Encrypted: i=1; AL+hErGSJY1f7rCH6oFKIbg/AN7xQ1vDeA4+mI5w/l91NFWHlq91oh4hzjhu0vuUJKr4a7P3bRs+4kiY7D0dsFV0W+4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fIDpUexTrMGUFaYaShwIkyrqyxYa0hWNoB/5GrFbGjLb7kjqo
	CrRZk0zx/rDa8RJ7LlAFgjItdPx6Fvr9Hni+s/vkBDqkqHWqxvG8RCIMAuEcRIvWyHJhOzp0AT3
	IiiH4UPW4zLsSaNlTG2oOngy9K9S51GvzL+roG4H0c2sMRS597rGSAx5yRpYbqiIVRxRwr+1UTm
	RUjA==
X-Gm-Gg: AYBFou0ne6ksK5V2o6j80dstK5g7sCfPJj5k6+1DGZBdeGbr6/Km3cNny2AofGTPwvv
	tAXxuwhiG5MsdujM4Zr/e/UwyigRl0jBpPHduXak/NsGzjBJs5Syn6I3kxxoLmcIvclFCAoIxrL
	lnq8ejG76zLd1Sg4z2+RjalyQjoGEGWuFkcnuWpPT2ob1SQRTLYvCeuShtEUPiA4MRLCny29Ih6
	Zfkh59cTO7GQSs16kWlw2W+SnlfcnghydHkB9hmJaSI+wSXpRrKq/R+sPB0VKLDXtzzGgMGxQoX
	63GY6cbEc4FNaNByOOlWag/nbykPSAXNLhyxl0Wq9Bp0tcDZwjvEb0Hhv5qzXbqwIc1jrWh0JJ0
	0FtlCPxhLWJdfBVU7V0FPrJiD6Jyx2snRAZgB4O4xsUHYL0B5kt6zJVMqXbRT2J4zuEqi8vyd2p
	DAY3PnFkyCxqG8KCcl0aGUtz/JRWYhSq2gIXCwFpu4ueeu
X-Received: by 2002:a05:600c:6097:b0:4bb:6626:5a25 with SMTP id 5b1f17b1804b1-4bb66265d0bmr183353765e9.20.1794911009439;
        Tue, 17 Nov 2026 02:23:29 -0800 (PST)
X-Received: by 2002:a05:600c:6097:b0:4bb:6626:5a25 with SMTP id 5b1f17b1804b1-4bb66265d0bmr183353215e9.20.1794911008961;
        Tue, 17 Nov 2026 02:23:28 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78420edasm86900245e9.9.2026.11.17.02.23.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 02:23:27 -0800 (PST)
Message-ID: <09156786-c9c6-47e3-8674-816b80300a3f@redhat.com>
Date: Tue, 17 Nov 2026 11:23:25 +0100
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
Subject: Re: [PATCH net-next v4 0/5] net: devmem: size TX net_iovs from the
 dmabuf layout
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, michael.chan@broadcom.com, pavan.chebbi@broadcom.com,
 andrew+netdev@lunn.ch, edumazet@kernel.org, horms@kernel.org,
 shuah@kernel.org, almasrymina@google.com, sdf@fomichev.me,
 leitao@debian.org, dtatulea@nvidia.com, asml.silence@gmail.com,
 bobbyeshleman@meta.com, daniel@iogearbox.net, razor@blackwall.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20261111224740.2744522-1-sdf@fomichev.me>
 <1b764043-2efd-4e65-adb9-a47c0136446b@redhat.com>
 <avZC2hp_0ODMQ4SG@devvm16445.scu0.facebook.com>
 <avZZ-6GGciPC0Lti@devvm16445.scu0.facebook.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <avZZ-6GGciPC0Lti@devvm16445.scu0.facebook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 01:41, Stanislav Fomichev wrote:
> On 11/12, Stanislav Fomichev wrote:
>> On 11/12, Paolo Abeni wrote:
>>> I'm wondering if making a comparison vs MAX_SKB_FRAGS==45 would be
>>> complex and if you could do that, too.
>>
>> Originally I did not want to include bigtcp to keep it apples to apples:
>> same tso size, just 16 frags in skb vs 1 (in ideal case).
>>
>> I just tried running mlx5 with 45 frags configured and it fails to start with
>> the following error:
>> mlx5e_attach_netdev() warns "MLX5E: Max SQ WQEBBs firmware capability: 16, needed 23" and returns -EIO.
>>
>> (fwiw quick review with llm claims that mlx5 only supports up to 20 skb frags)
>>
>> What I also tried just now is `gso_max_size 524280` (on top of this series)
>> and it ups single flow throughput from 200Gbps to 240Gbps (presumably
>> by making the receiver go faster with 512K TSOs vs 64K TSOs) and halves
>> the sender softirq..
>>
>> I hope this gives you more data, not sure running with 20 frags is worth
>> it (vs 16)? LMK if you disagree or want me to run something else.

Thanks, the above is quite exhaustive :)

> Fun fact, also setting gro_max_size on the receiver gets line rate over
> single flow:
> 
> I   client.c: Connected 1:cpu 39 | 1:cpu 118
> client: == Source 2401:db00:255a:4a:bace::b
> client:   Tx389.448 Gbps (2921248849920 bytes in 60008026 usec)
> client:   Rx  0.000 Gbps (0 bytes in 60008026 usec)
> client:   TCP retrans reord rtt rttvar d_ce snd_wnd cwnd
> client:             2   125  86      2    0 15300608 10142
> client:   net CPU 39: usr: 0.03% sys: 0.06% idle:67.39% iow: 0.00% irq: 5.69% sirq:26.81%
> client:   app CPU 40: usr: 0.05% sys: 2.91% idle:95.67% iow: 0.00% irq: 0.21% sirq: 1.14%
> client: == Target 2401:db00:255a:44:bace::b
> client:   Tx  0.000 Gbps (0 bytes in 60009306 usec)
> client:   Rx389.438 Gbps (2921238435008 bytes in 60009306 usec)
> client:   TCP retrans reord rtt rttvar d_ce snd_wnd cwnd
> client:             0     0 210    122    0  999424   10
> client:   net CPU118: usr: 0.00% sys: 0.00% idle: 1.60% iow: 0.00% irq: 0.33% sirq:98.05%
> client:   app CPU119: usr: 2.75% sys:77.46% idle:18.95% iow: 0.00% irq: 0.47% sirq: 0.34%
> 
> 4200MTU, 32K rx-buf-len, this patch series, gso/gro_mas_size of 524280,
> still the default number of frags (enough on rx to fill 512K GRO with 32K
> chunks).

That looks just great!

FTR, my understanding is that Jakub wants to say his last word here, so:

Acked-by: Paolo Abeni <pabeni@redhat.com>

