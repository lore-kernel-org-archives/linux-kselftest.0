Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AC73E6DFC
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Mar 2026 14:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773757977; cv=none; b=tkmd8lf5JY6x8sAeg2KGjjPyWX7NeM8ozW8/YsBZATSHh+eS1UlzopXiV8sBdr0CK9obO9EQAPuN0Xx/7GuvCAKxQ0wheSavwYqgwZkTLt22dW7ZW8A6Kmj5tfNPOtXVx44FIjlkPqEeQfKJjLFsDfvAX8rJfJAeCPTktOFr8k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773757977; c=relaxed/simple;
	bh=UQhy86RBpO6F0poicol7tkVEH4GfMsaYZqbSFAbiD4Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V491LMESK62SwiCEBG+KfpfH9WqOAQ1ze3kkkGc1+uTC+s+JC35SSm9GbsHU83xK+HvRa3RCUy8vbYsjiMpq+C6weINyOGBaYWk+RqXnuJB+c/xm4RxNrSMqq9cArXfC1NAbmtEPLZlfq/4uvMNvJowjpdASbHAMoksSfNnb6gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M2Z7fOOM; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=XiT1UNJF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M2Z7fOOM";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="XiT1UNJF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773757975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8D9W6spqw8VAUPjpA4QQ9ebhqahz4Vs6fKnlo8CL3p4=;
	b=M2Z7fOOM8XnULD51FCiiBNLLIH36XnojRLkaJjksG6PmbFiNxwI+cynxaqbY174AV3HC1w
	sAEHvxTm3dQpscqsYR6kUv0YMw4oqtWdt52JYMBxyRkT+SX+erHkDZI6R14ir4vgZ9EhMa
	sb8Tovmdjg2JQXp8Kr152RRwbptzh+w=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-_bF5jTz0PryLofcv5wZkJw-1; Tue, 17 Mar 2026 10:32:53 -0400
X-MC-Unique: _bF5jTz0PryLofcv5wZkJw-1
X-Mimecast-MFC-AGG-ID: _bF5jTz0PryLofcv5wZkJw_1773757973
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-485c45885e6so6202305e9.0
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Mar 2026 07:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773757973; x=1774362773; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8D9W6spqw8VAUPjpA4QQ9ebhqahz4Vs6fKnlo8CL3p4=;
        b=XiT1UNJFzzskFxTK0dcbGVaZI4HEWDpMR7HX9Z9q8Q0Z0qOplHMN0F6cEzbPN0g8zb
         sb3mA4Kwhuz/OKHZV9VfDbtpJvjZKyQ2U5uBQZl38is1cUNQAWPL76buj3pLsz6mxMG7
         bVdLaTD2XIEIe4gnkz2C5SHfGxV0P2xu3bZkc/XbxQ5w/CmmcafJoZAzh6BFkBKR3O6p
         ZJlN7lsZm+KDQ4/8t/lvRb9L1cLnWf9oobSYmpOvf1i4ovKkeAUOq3jz9xeoF2TZHbib
         azLtIsnrZ3nocur5FfsP3UZTu9U2moxBFunHZ4vNNdeCVrxW5YO6FlrI5nHvB2jW2mnZ
         xJzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773757973; x=1774362773;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8D9W6spqw8VAUPjpA4QQ9ebhqahz4Vs6fKnlo8CL3p4=;
        b=QCFPQreetOEkSbIdYtSTCkbCAwlQZgzkLqwzz/Qvvs6/Rljwom112FmBkBK3/iWygq
         o0+ApHIPuT0rvpSvBrmJXXkTGLQjduY9Krb66gKEm7LHC2h6hKwwvTPopdIZrkT3T5pB
         R/0dy4mP8wNSS7Gk1bnEAiF6SbIwPO5zrJ+23QdSY9fnCtqinT2KRORdyak8S1QWjdUA
         WKPYV6JoDTX0PNLXQiJsRucA48v7lTQfSedVDdY4Io/AzV3ElpKNPFW2/REOErQobNg0
         spLy5hXx/5zJCeCHRr2/CBMzara/s9Ki/2lO9GaJK3z0PLVigud7FwFb6oxw2zcysitm
         o3qQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxxsUegcskWUfkiUMsfWjPmfKJ8D2WhT9uXFbQmmCHUo5wQATO7/BTrFG6+rbzoiNjQd8D4r4Djw9vtYvs22k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv9hB5VkKl9HuavG7fdacmpzfCz7GdZ/NsUlaiwPU+ckCFNV6D
	DRfC6f2u5jUT3d1AJF/xTp6o/jYDGH8nhW9wDuSxNUPg6I9nyEJSju2d675RT1OJEJvdbTDNrnI
	EJ5x3v2FScym4P1xDrFxwlru00aJJChz646EV1cN8LhqcHZqYDjuQXaGrz4/EC3Z56nIuIQ==
X-Gm-Gg: ATEYQzwav09e8yitxssTWA7UcWjg/BeN6+Eqck84LJ+30VJ3d5eL+8jO9oNMK6QUpOA
	yqSR16SFZ1TPllB3DG+pBArohvCmAjluR0o29O1E2IiUmKt15W8VSoHVSicV2xDhfCb/P8gilp7
	q+IO2TNJT9W6v5sJrZQNcmADyEboWxgA+/KUH/V/cphuEoWKMUhB/dpDazljYpdXMpoIbFKOOuf
	6iIOT17MWVhi6HZT8lJefX7XN4Q1Kt6qkSH82AX5q4e+PaDe3lYS6lN3NyaPuQTBioD4G8rDKs2
	M1Qsyqb4poHd5D9P4jSw8XusFwORWbvEjQ0/loDJr83LjsQAzkf6SvwE36JzpJestNhWDdf052L
	qH0Me85IZzbyeXbp3BXaeoC2mmllO3laOgVK2uQN2NDL/4JvOaDEn8Ss=
X-Received: by 2002:a05:600c:4e08:b0:485:3eba:ab96 with SMTP id 5b1f17b1804b1-485566ca967mr277855575e9.3.1773757972518;
        Tue, 17 Mar 2026 07:32:52 -0700 (PDT)
X-Received: by 2002:a05:600c:4e08:b0:485:3eba:ab96 with SMTP id 5b1f17b1804b1-485566ca967mr277854775e9.3.1773757971893;
        Tue, 17 Mar 2026 07:32:51 -0700 (PDT)
Received: from [192.168.88.32] ([216.128.11.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4855777bd37sm191300515e9.3.2026.03.17.07.32.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 07:32:51 -0700 (PDT)
Message-ID: <f5edbbfc-9d42-4911-9dac-e2597db7a2bc@redhat.com>
Date: Tue, 17 Mar 2026 15:32:48 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 5/6] selftests: net: move common xdp.py
 functions into lib
To: Mohsin Bashir <mohsin.bashr@gmail.com>,
 Chris J Arges <carges@cloudflare.com>, Joe Damato <joe@dama.to>,
 Jakub Kicinski <kuba@kernel.org>, Andy Gospodarek <gospo@broadcom.com>,
 Michael Chan <michael.chan@broadcom.com>,
 Pavan Chebbi <pavan.chebbi@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Stanislav Fomichev <sdf@fomichev.me>, Shuah Khan <shuah@kernel.org>,
 Simon Horman <horms@kernel.org>, Willem de Bruijn <willemb@google.com>,
 David Wei <dw@davidwei.uk>, Daniel Zahka <daniel.zahka@gmail.com>,
 Carolina Jubran <cjubran@nvidia.com>,
 Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>,
 Nimrod Oren <noren@nvidia.com>, Gal Pressman <gal@nvidia.com>
Cc: Petr Machata <petrm@nvidia.com>, Cosmin Ratiu <cratiu@nvidia.com>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260313223029.454755-1-carges@cloudflare.com>
 <20260313223029.454755-6-carges@cloudflare.com>
 <f790d4e9-7f17-4878-860f-8d21c4c9c307@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <f790d4e9-7f17-4878-860f-8d21c4c9c307@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/17/26 7:48 AM, Mohsin Bashir wrote:
>> +def format_hex_bytes(value):
>> +    """
>> +    Helper function that converts an integer into a formatted hexadecimal byte string.
>> +
>> +    Args:
>> +        value: An integer representing the number to be converted.
>> +
>> +    Returns:
>> +        A string representing hexadecimal equivalent of value, with bytes separated by spaces.
>> +    """
>> +    hex_str = value.to_bytes(4, byteorder='little', signed=True)
>> +    return ' '.join(f'{byte:02x}' for byte in hex_str)
>> +
>> +
> 
> Since format_hex_bytes is not exported in __init__.py, Should it be 
> prefixed with _ to indicate it is private?

I agree such cleanup would make sense.

/{

