Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88881366051
	for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 07:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779261865; cv=none; b=HgQMNyQXzq6/jS3hqlRK/x+omkA/xDPhBoU5zWYKYdbp/6KZutV7inpHubZ/rFM2A8UT6cGG7Dlunz0/yU2znSSILjWiOCUU7UPCbn27bYm/I312cNqXybovBfn3PtKX7C+hbNrTnvm7d/geuDTfVg2lQ6fftHKNZUAKHG7UZZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779261865; c=relaxed/simple;
	bh=et5n/jVgSeC7CA3DhRH3wMYvqFbDTZKATIwL6wl4Hkw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FPp77c95wzh9AkgMl+4G8cdCcndSz0b8hQR+yeOwGnMUX/kY73lvJ7z92Nfq8JZthZJoGGW7b0Zw92KhCcDyGxofSY513iRhxiS+kSt+sT/V2VaPvk+AsvJcZEhfSNorZPa3FvrvxGEsDsnHcKC4u5PvuVcvLJOLHywqEbFuiqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D5OT29gg; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=sSDPT7+2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D5OT29gg";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="sSDPT7+2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779261863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=nIN5hOtVWer3WDHGGjocFJPku991/m9aF85eLbVhj2c=;
	b=D5OT29gglTmJn+0Vib8xKrE5vLx9u5s/wagViXqL236RceT0rH7/C//Zx5zqTYH5N0Dcxj
	/XlPqcJpwkIM7Rdtb77jiR5d/2Imivf6wEqCPk3g4N59yN2WNPfgoaHPUZ/fcuqRC7fMyM
	4jm3Xjdnoz3Z9A2+dAhjUnRJ2bRF2Lc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-388-4psizEy6MoCvXhXH5cOAIA-1; Wed, 20 May 2026 03:24:22 -0400
X-MC-Unique: 4psizEy6MoCvXhXH5cOAIA-1
X-Mimecast-MFC-AGG-ID: 4psizEy6MoCvXhXH5cOAIA_1779261861
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-447f2ce5556so3679709f8f.2
        for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 00:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779261861; x=1779866661; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nIN5hOtVWer3WDHGGjocFJPku991/m9aF85eLbVhj2c=;
        b=sSDPT7+2FtdTDVXfDbN1dAdUbqfw++PiwMluZuB0ZcT5HdsZtKS98etl0n63Moz+oP
         /mqyfNiF94IvuFMlMA1gNZqA5dTgiHet9JK6xSZlXqPOKHOyTBzEy3IDAw/HJhQw+ETY
         7m8mY54vXjQZA8Sc5SK5ZWKzwnmIOwx3LmJvkVPPqNcm9s7hUTvZB4tj44Wz/OQN34iC
         mosvWIdhY4/B2o1WTqbX99e6qUeKUvA1LT5CKjuxoQXy1skBi+yAHBGRTnQJjdWUv72m
         mCznHGMUz/QbfrTXg9HMyBFr7E54+etbtFu6kRIrIi7EE38tMv8x1v2lQJJVDnPogvcV
         O92w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779261861; x=1779866661;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nIN5hOtVWer3WDHGGjocFJPku991/m9aF85eLbVhj2c=;
        b=BcFk8T55h85OIu57nBj5Y5Ton9Lq5N76ikMvZeId4T8FYmK2jwqLQ0NIzMkzNtpsO6
         EbUyjgj6S8m7FH4fmphWam2q6s4xmQzo5LkqffMmQugDkv4P548/3oVzEOmR4ckmqL2B
         letr+u/h/aoCrwpnfn3Zlia9snilAUHYB9IHMCLnM9IxynWXqjZLGp2IbD35JG175rb+
         WYvRJeR82KrGvUxrU3ojz5PjoTENv0ES1iAzyxnQq7WF9LYUfHk8MHjPafpt07PJ9DYn
         qgkpeLScROg+mgnK+JZ4m1pL1Q9kHx2Xy9yS2NUonWDoQ2aZhA6eTrF40m6aUUmWi2UZ
         CHBA==
X-Forwarded-Encrypted: i=1; AFNElJ8xMoTqp6d9AIbB4qgGacb8zG7zegWyzTS5g2Xaiqg5/8l+1YGYmFkC0wryzSIuLVarxvKOXHSTABlTkmmfdVs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGMN34HPbSYZ5+61ESS34U9E4lSyc0iiqEJENCyKVVO3VrJPav
	759VNGm1I9dst3LmCCiPL5B4ldDX3dqYZBg/FvVwevhmLgB51V/t8QIKMXafNdwLmT4l1h8YRmJ
	B96FMdLQ9z0mNL3yxJBNY89c1bb3FHqpBi2GZpBq9d2bFUJVXYBH32sJi0U6h5N0a+W/3BJIDFG
	uWSBuU
X-Gm-Gg: Acq92OFgxx9iueLW2l/M1IOidRn1RG/4ZAYo8UWVhhxuVD5W6cLHJjGVIQDPqS/XRnV
	rzYevSKnocvIzKv8/FotnB5Ad/wOTYJpyRW8wdaPnNceC+XRAMvgfr1V6up13BNkbyxeD34Wcpz
	W6aGhZKVQGYVzSpBfkPUonJAsM3HnQENeHxF6lYNQ4UqBP38zjlREvlr3q11SFonxr8dQqjJ5Fo
	LODUrDhquoy5Y/OHU+gBAC3XEoklEa15zjH/ojSo3dGoJOFaMdnGD3vXssiiH+23uQPjxi+Q3nK
	q6bSykD8mISAhiJekivk8P9cj+BqpdTeqA0y5Pw0CORhkeCOWNAEFPTeNx90urGgEFriVi4n9e6
	5ZAwJfKycdAHR+LKRLeABvt9srA==
X-Received: by 2002:a05:600c:4e55:b0:488:ac01:72de with SMTP id 5b1f17b1804b1-48fe60e510bmr342909505e9.5.1779261860858;
        Wed, 20 May 2026 00:24:20 -0700 (PDT)
X-Received: by 2002:a05:600c:4e55:b0:488:ac01:72de with SMTP id 5b1f17b1804b1-48fe60e510bmr342909115e9.5.1779261860393;
        Wed, 20 May 2026 00:24:20 -0700 (PDT)
Received: from [192.168.100.100] ([82.64.211.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4dac000sm385877715e9.0.2026.05.20.00.24.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 00:24:19 -0700 (PDT)
Message-ID: <5c1de7cb-42c2-473f-8d67-0523a3c86464@redhat.com>
Date: Wed, 20 May 2026 09:24:16 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 0/2] Fix race condition between TCP_REPAIR dump and
 data receive
To: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>
Cc: Stefano Brivio <sbrivio@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>,
 Pavel Emelyanov <xemul@scylladb.com>,
 David Gibson <david@gibson.dropbear.id.au>, Jon Maloy <jmaloy@redhat.com>,
 Dmitry Safonov <dima@arista.com>, Andrei Vagin <avagin@google.com>,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neal Cardwell <ncardwell@google.com>,
 Kuniyuki Iwashima <kuniyu@google.com>, Simon Horman <horms@kernel.org>,
 Shuah Khan <shuah@kernel.org>
References: <20260518183424.3144867-1-sbrivio@redhat.com>
 <20260519190352.45c8478e@kernel.org>
 <CANn89i+DknqarcKuZxku-XvoioqkXrd3sQd3PXW5fdFZBpPxjg@mail.gmail.com>
Content-Language: en-US
From: Laurent Vivier <lvivier@redhat.com>
Autocrypt: addr=lvivier@redhat.com; keydata=
 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
In-Reply-To: <CANn89i+DknqarcKuZxku-XvoioqkXrd3sQd3PXW5fdFZBpPxjg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/20/26 06:39, Eric Dumazet wrote:
> On Tue, May 19, 2026 at 7:03 PM Jakub Kicinski <kuba@kernel.org> wrote:
>>
>> On Mon, 18 May 2026 20:34:22 +0200 Stefano Brivio wrote:
>>> Stefano Brivio (2):
>>>    tcp: Don't accept data when socket is in repair mode
>>
>> Not sure Eric is on board with this patch in the first place.
>> Sound like it's not the intended use case for REPAIR so IMO
>> it's up to TCP maintainers whether we want to support this.
>> And it's definitely not a Fix.
> 
> I am not on board. Only net-next material for sure.
> 
> While v2 is slightly better, we have the fundamental problem of adding
> stuff to TCP receive path for features that almost nobody use.
> (It took more than 13 years to finally complain about the race)
> 
> This consumes Gigawats of power on our planet (and tons of CO2), given
> the trillions of packets processed every second.
> 
> Please at least add a static key as we did in:
> 
> commit 020e71a3cf7f50c0f2c54cf2444067b76fe6d785
> Author: Eric Dumazet <edumazet@google.com>
> Date:   Mon Oct 25 09:48:24 2021 -0700
> 
>      ipv4: guard IP_MINTTL with a static key
> 
>      RFC 5082 IP_MINTTL option is rarely used on hosts.
> 
> 
> But in my original feedback I pointed that we TCP_REPAIR should
> probably only insert a TCP socket into TPC established hash table
> only when it is ready to process incoming packets.

The problem is on the source side of the migration and I think removing the socket from 
the ehash table would trigger RSTs, closing the connection on the remote side.

Thanks,
Laurent

