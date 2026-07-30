Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC103815E8
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 07:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785397569; cv=none; b=Aeq61cEebyTDT1EZ3/2g56ZyHL7O29AAPWsRd6YpMNU6TngauPyNBPS8SCnkNndXQbjtb+8qJDFvO3WwFO5vkxnCamVxnIzqOx9PWOzrCC+h4pojjY8F0mtDntkTPJ2NU+iPRewkQpUZumfCrMTNiynuZa4r1GkfUp3LD1zXQVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785397569; c=relaxed/simple;
	bh=PfBPNOtpFdbuSDIVqBy0MnRsviWeGKooezDpGmkPdOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DcrJyc6sM5eF6BH7SZ/4no7nJISv7UQKz8GCL6uUN6yngnrDfngGttb2+Sw5gkUoKp6xWcOFUgMzcOv/Q+6dSWHXs+TVSgHsY51fNWpASUMpZMhZKhaODYl57mNfaUOQXfH91mpyP0qvFMaCBGH4qycSrguV7c35y/Ybfgcshns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iymaUKGj; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=CJ6pbIxT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iymaUKGj";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="CJ6pbIxT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785397566;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wEu4Whn6/VhWgzbr5zcc31fQM8Ixy+oar4j+cn9O7Gg=;
	b=iymaUKGjCtw4SDRRXt9PuTm7mJ1w1WxeNcS9/caM246+mb8hCC/hVVDxkRrZaOpWQoTE3J
	HfrSyM9Y4kwqoiyZG5xy6Bq0aB4R7dm8woC8kZaLYO3ja3NPJnMJbe+Tk4eiNnE6h6YI9F
	TAUx/l5mqn3uorOMj6D4s//Q0MN+Et0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-192-JQ7m93sdM9m6MxQVuBV_KA-1; Thu, 30 Jul 2026 03:46:04 -0400
X-MC-Unique: JQ7m93sdM9m6MxQVuBV_KA-1
X-Mimecast-MFC-AGG-ID: JQ7m93sdM9m6MxQVuBV_KA_1785397563
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-47f835ac1aeso1273853f8f.3
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 00:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785397563; x=1786002363; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wEu4Whn6/VhWgzbr5zcc31fQM8Ixy+oar4j+cn9O7Gg=;
        b=CJ6pbIxTcCcow7X1FK0dDkFAnzF0Wt38SY1Gb/AjBnkhu+yS6r4MkFHXQrMMKQfYFw
         EfE13iAo42CFlIKdLzt2ralZtkq8Sfugo18AfrKZyB4Azbbb5EMl8vXkSBprCxTmii6A
         dXs8Va7rzSUzBTJIxkeRy7/rs2/TIJs7VOOF3Oq+NPNUe9VRgPyi59/Uavzhu6ucNOaV
         0OTIo5Ivc/xJySgktFt0tcZMqjsITncZQIxLtdyfEEHisTJRwV6UfUsS36Mozftn/vvE
         ta0Az8FtBjVQeq4LNnNoBAGHxtARP6fdI53btgSj8X4yTYDK/8WFj14M3TK7ymuGyz0V
         VBqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785397563; x=1786002363;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wEu4Whn6/VhWgzbr5zcc31fQM8Ixy+oar4j+cn9O7Gg=;
        b=p34ub1VWNG9pHwY2eODgMBrgKVVxvqUJpxCpoCetjs3Toy5LO0SuKcrAt78ihKJSwq
         AFjJXDQAosVbazXDuH9ZX2i/1Bvy3trnVyCa8S+QzwIruJG7oT4m5g+N1RCJsYiCyqC7
         oozLQQ9kCFG+BYuz5xQP0n04Z04idqGT2CI6oKtqyPduRHBgcgcPgOEjTGxaanTAmhVE
         ig7q5sPWb0Cphw9soHMm14fyIIizokbQA4Yn3Z5v55j/Rz0pd9g/EQMT4L1Ao3CsICSj
         yEU92ScKfK7qLbt+6u+IqFao7FRPr+HCsO62O0f4M6IyuExQ6nltKbq6h/Es5wsHPL3r
         4+XQ==
X-Forwarded-Encrypted: i=1; AHgh+RqUzWEOJK2PSLSwIsrCTWv8LYUD0dZCBT2gKiFLaPSA8pswp4tn9ANs4RqIW4VvLK4TPK5rnLIX6GfqUQVmL+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWZ+fPstRTbicyO1JD120SHviquz2t37cFIa8bVgJhFHreAKgV
	SNffBm4BJlAVJzrjCW5nbSsijPZVttMkUYxwELYiHUBOdLOEh7PRFOwYE55yb68RDxeNC3FROZC
	7HtHqBohagCF260ZXu0mPTXsZnkRN6mU6GWKed7DxcUny80kjOU/rLR5cvi9IXIrNISjKsSQZYk
	zAGw==
X-Gm-Gg: AR+sD11n6I3cQYoa4CDfdNJoOxiVzfE/RSsMgLEr7DKFT/HuLHxNWHpX8vIi5zvQm0w
	tzzHjLxTyjF2WSwrICc0IpRxSD8wKZ47qwB++/Hf1wvovT33yG+5iDdPYuzNFD99a9u29+SFkBM
	Xk356f/8I2iDxjgz7aE7CXi0CIAHtjy5+wA9jTCdgtgB3XaW9003ZYtF+rv8jEFvh9WuXSSUCgE
	FjMjQbOtlf7LvwbjJeG+LA/3sKMYHY1xIE4jHQXCSyTSg5HmgjZqcfUjieF2SQevvLfPNc95wlT
	DgupuysAhiK6ErInkhzTXsAc13T0CMp82Cfi17/7u3YBdzawEb3Nj6baeCzHNVyTbfzTmgt8fLy
	NIB79jkacLQlXpWI7u52+4eOiufLFMc1wg1gurGLqUxzTNub41YtNBjMEqBaWSVBlLc6Sl0d3E1
	bIpw==
X-Received: by 2002:a05:6000:2302:b0:47f:5a97:2a5d with SMTP id ffacd0b85a97d-47fc822e563mr1779822f8f.11.1785397563517;
        Thu, 30 Jul 2026 00:46:03 -0700 (PDT)
X-Received: by 2002:a05:6000:2302:b0:47f:5a97:2a5d with SMTP id ffacd0b85a97d-47fc822e563mr1779780f8f.11.1785397563114;
        Thu, 30 Jul 2026 00:46:03 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:5521:6b10:58fd:68f:7756:389d? ([2a0d:3344:5521:6b10:58fd:68f:7756:389d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc88d6e5bsm4070850f8f.3.2026.07.30.00.46.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 00:46:02 -0700 (PDT)
Message-ID: <606acc01-e22d-4e69-ad26-a8afff262b98@redhat.com>
Date: Thu, 30 Jul 2026 09:46:01 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] selftests: net: Add a missing config option
To: Alice Mikityanska <alice@isovalent.com>,
 Matthieu Baerts <matttbe@kernel.org>
Cc: Alice Mikityanska <alice.kernel@fastmail.im>,
 Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>,
 "David S. Miller" <davem@davemloft.net>, Simon Horman <horms@kernel.org>,
 Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260723140241.132120-1-alice.kernel@fastmail.im>
 <47b580de-9d11-46c9-91c5-55eb13c00bc4@kernel.org>
 <CAD0BsJVqmQRz1yNKMMWH1MT+kgVEh=wY=LOTy_ObeTDCsrhHFg@mail.gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CAD0BsJVqmQRz1yNKMMWH1MT+kgVEh=wY=LOTy_ObeTDCsrhHFg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/29/26 10:44 PM, Alice Mikityanska wrote:
> On Mon, 27 Jul 2026 at 12:09, Matthieu Baerts <matttbe@kernel.org> wrote:
>> On 23/07/2026 16:02, Alice Mikityanska wrote:
>>> From: Alice Mikityanska <alice@isovalent.com>
>>>
>>> Commit 5cb53743e1ff ("selftests: net: Add a test for BIG TCP in UDP
>>> tunnels") used iptables match comment, which was missed from the CI
>>> kernel config. Add the missing config option.
>>
>> It helps, the CI can now run this test!
>>
>> Reviewed-by: Matthieu Baerts <matttbe@kernel.org>
>>
>>
>> But I think another follow-up patch is required, because this test is
>> flaky when using a debug kernel config:
>>
>>
>> https://netdev.bots.linux.dev/flakes.html?min-flip=0&tn-needle=big-tcp-tunnels-sh
>>
>> Maybe because wait_local_port_listen() is required after having called
>> netserver?
> 
> The issue is hard to reproduce on my machine, but I could reproduce it
> in ~12 hours of non-stop testing in a loop. It reproduces even with
> wait_local_port_listen, so it must be something else. The log above
> (and my repro attempts) shows that it fails in a non-first test, but
> netserver starts only once, before the first test. If the failure was
> due to netserver not being ready, it would fail in the first test.
> I'll keep investigating.
I *think* this kind of flakes are sort of expected for 'performance'
related tests when running on debug kernel: the environment can be
painful slow, and few failed iterations I saw has csum offload disabled
- even lower expected tput.

AFAICS the target packet number is independent from KSFT_MACHINE_SLOW
and the actual offload setting. Possibly you can tune the target value a
bit WRT the mentioned variables or skip entirely pkts number validation
in the slowest permutation (note that the self-test will still have some
value due to code coverage with sanitizers enabled).

/p

