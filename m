Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5253AFD04
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 16:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785430411; cv=none; b=JLNoZRHMCdZzecx9p4g7Bfut7nwflVbG8iTGQrNqah3gN7Auz9CXrwS9rYQyOJEp+EDWb/BbUT7YWrNNU4DDpcHffK9JLMEmGrky/WULfdpTWZdT7tQzarPtwD31y6HNdJs5ljDNRU2SjILWbf5SZqkrsg7kgfno5v55CAF2+co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785430411; c=relaxed/simple;
	bh=+vm/fM11RNgnSDKFXiPqjgE60RyESaMVLmVqNLybSxo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KZpxmJ3iZ/m2l4fL3MAU5vVDcg36vtBwg9b2vXibDp76cOf9hGY3VePZ6Fg7CG9mmjTaE9AVkLCWEU+hrRCdPbaTFzBFeNi9SyMujA7woD8dakRWVLCrEI5GmaaBrTMuJzPpKfxpGkA56lZSHaZ1v8ewqgDa7pvQRUL1HKVXpzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZKsC8ERq; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=uFhUl3LG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZKsC8ERq";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="uFhUl3LG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785430408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=666E0JTI4XSrUOgv2QX80bhV9mM8ZtA6RAw8TOJxm8o=;
	b=ZKsC8ERqghVqZCw8ygf15PJYzShUsE9bfaCjoU9d7K9CPxogGQZDHecly7szXFoZ3uC2bp
	XeUT7hjyW93lcmMBC4LcbVb36JUfr7hU5LOi+6NQQdfMAojLnec10FSdPAp5vBB6oD920P
	gGeqpCwd1iaHTKUvK3LyV1/QwKv4tp4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-DeTeRxgROmOBPFf-MyGbkA-1; Thu, 30 Jul 2026 12:53:27 -0400
X-MC-Unique: DeTeRxgROmOBPFf-MyGbkA-1
X-Mimecast-MFC-AGG-ID: DeTeRxgROmOBPFf-MyGbkA_1785430406
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-493bfc3b84aso12937985e9.0
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 09:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785430406; x=1786035206; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=666E0JTI4XSrUOgv2QX80bhV9mM8ZtA6RAw8TOJxm8o=;
        b=uFhUl3LGQ7LLCE9xuCBZTT0PSjuVHqsP2aN2mjzkLo+SnCMk0UzHHQgJpgUC6WxOZa
         mG7J9vMLrPWCxyYLZr1DGi+8Dgxl3gz1FrTtiWJF2L1ZiyrnnFYL7NiWsLbxseDEO63Q
         NoLwMM3L0jd3fnJRhKwWLCO025NV3ZlKOuWVe3lCefhyraGjJ4ngR4bUxjZB8sQcVe9g
         zC92s0atvv7rkA8Q0peWzFcZTIPgBQoXN71xH4XYSY7a8Qb2wBlU4RRTNpzdFpJMdF+3
         DpOeBTXVvSjSsPnCLuNwGr3Ilichf2DdFrP77h1WxrYteHB81mh5Iq/MKAZ36pdnQsrB
         HdsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785430406; x=1786035206;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=666E0JTI4XSrUOgv2QX80bhV9mM8ZtA6RAw8TOJxm8o=;
        b=M8sMbatTO2YUYQvqIBd8jM2HVtTa7QdsppMbyQ34AEbOSEL5Mey2DxvDQ17tMJnrhG
         WnMFLzYKsTgWEvNf9jXqHrYs4MnXCJ3CJYl7f1dkvI+IBtTc7zCDqX6UNXCmbaWJNger
         cLDxYo6siBDY9+yP6Hzbs4UKdbMP25Uu2uSL+FRaA2MyfoYgDxuGvjo32d1kXmeo95fE
         BUlDovCvi163Wdhmq9gu2ogV0UttHFxq2Sd+0Ef/RAMAM2MDVmhGlA/E4XXxshf4LsS8
         i4q3Ek8vGz46Q/IdrQuVLBAljra0T4vuxA472TASF9GzD2+lMqIR64o/FqNeb40+D1A0
         GKZQ==
X-Forwarded-Encrypted: i=1; AHgh+RrUCum6+J8ArpslASaLXqbUNW9Oc0mZFIZG/FJrcHDUitkFP4azr2k3hpHIN6G1FjHRqtph67/+ZqDmdx2Sp78=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSTB5Yry61ewlv8Ja3proji/AakS+wMRwHBp6C0fC3z5+lY0c7
	bacnr01fvO9w9D0xQgGkRdCXNxY1up6Q8rVQjnFYXRD+yNwZYuYjrWhxwz5aeCQIY/eJj70NQNS
	GyNWKUyXabfM24waPXMlYXWvz+TMKCGjLAh4bFOMbXD3bgTqp92qpx4XObd3LbOTe6WKwnvpU4L
	y6ew==
X-Gm-Gg: AR+sD12X4z4xa5ec2Pddxt9Fqa+LWIflA07xXx12iF5CKUXWTZmreKWonAnl7ut1k/E
	ArVPNPZtKJgnqgUvYHjbmIfdddxUrJh+5mb/zJ3fG013X3ZawUQc/r/2HMr5IElmA91NoCzXSbl
	l0Mea5RC8ZzVDhN9vc3+2H9JqYSEqecq5kpH4/UXRORr9a8h/mFhrsi/i7feQqQANGRL5ZagL+H
	hZUz8n5AmHPUs2zwTtcb2HvDHhM4szO3G+Zfwak1zlP9mq9Fmcg9/kI3QJw9shDBk8gr4V60TmL
	hgLKQ4PYIo9hNrnTqRWzbXAdsYxFe7Cd06K0uo4VS5I1WLOGR2BZSmBdzXh9MU5GLRuHOtIeLQe
	KP1At3DxT2Cl/Ra1YchmQs3iwyKOwRayk+repUSXAVofcmslW3zgQ1GsVLIhIvW9yKmNqzbM5jX
	jLDg==
X-Received: by 2002:a05:600c:6099:b0:496:c18c:f998 with SMTP id 5b1f17b1804b1-49800ea2197mr49123485e9.19.1785430406226;
        Thu, 30 Jul 2026 09:53:26 -0700 (PDT)
X-Received: by 2002:a05:600c:6099:b0:496:c18c:f998 with SMTP id 5b1f17b1804b1-49800ea2197mr49122985e9.19.1785430405750;
        Thu, 30 Jul 2026 09:53:25 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:5521:6b10:58fd:68f:7756:389d? ([2a0d:3344:5521:6b10:58fd:68f:7756:389d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-498011e4ed5sm71887185e9.1.2026.07.30.09.53.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 09:53:25 -0700 (PDT)
Message-ID: <99bfe1fe-d031-4a42-a0a8-5f39c6390788@redhat.com>
Date: Thu, 30 Jul 2026 18:53:23 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] selftests: net: Add a missing config option
To: Alice Mikityanska <alice.kernel@fastmail.im>,
 Alice Mikityanska <alice@isovalent.com>, Matthieu Baerts <matttbe@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>,
 "David S. Miller" <davem@davemloft.net>, Simon Horman <horms@kernel.org>,
 Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260723140241.132120-1-alice.kernel@fastmail.im>
 <47b580de-9d11-46c9-91c5-55eb13c00bc4@kernel.org>
 <CAD0BsJVqmQRz1yNKMMWH1MT+kgVEh=wY=LOTy_ObeTDCsrhHFg@mail.gmail.com>
 <606acc01-e22d-4e69-ad26-a8afff262b98@redhat.com>
 <349c582c-73e3-468c-91cd-ad6cc3562700@app.fastmail.com>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <349c582c-73e3-468c-91cd-ad6cc3562700@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/30/26 5:46 PM, Alice Mikityanska wrote:
> On Thu, Jul 30, 2026, at 10:46, Paolo Abeni wrote:
>> AFAICS the target packet number is independent from KSFT_MACHINE_SLOW
>> and the actual offload setting. Possibly you can tune the target value a
>> bit WRT the mentioned variables or skip entirely pkts number validation
>> in the slowest permutation (note that the self-test will still have some
>> value due to code coverage with sanitizers enabled).
> 
> Hmm, the above makes sense for the failures like this:
> 
> https://netdev-ctrl.bots.linux.dev/logview.html?f=/logs/vmksft/net-dbg/results/754376/28-big-tcp-tunnels-sh/stdout
> 
> 971 is slightly below than 1000 (even though it's typically 1600-1700 on
> the CI runners, in this configuration). Tuning the thresholds can help.
> 
> But I also see failures like this:
> 
> https://netdev-ctrl.bots.linux.dev/logview.html?f=/logs/vmksft/net-dbg/results/751124/21-big-tcp-tunnels-sh/stdout
> 
> It's a complete zero, so lowering the threshold won't help here. I could
> reproduce it on my machine, although it requires hours of retries. I'd
> like to capture the tcpdump and see what actually happens in this case.
Ah, sorry, I haven't seen such failure yet. I *think* that one deserves
a better investigation. Are you able to reproduce locally that kind of
failure? If the such event frequency is low, perhaps it makes sense to
improve the stability incrementally?

/P

