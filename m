Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96A23CF1FF
	for <linux-kselftest@vger.kernel.org>; Wed,  5 Aug 2026 17:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785951369; cv=pass; b=WSuXkoo5pH/+S9sDDAmU2z7R0QlbH19iiSiiAou324eX+u4Tj4Daxg432pK/rbawyXRr2A2tL0FeDuftQFPQemDv1LPZ0Xz0jq0jsEdHEDCvgqD+Ff1gWSBsPB5C6eQ5VhCuD0l1A/EVQp0ovmvCQICfHzpKwfiPYVR2xoBd07E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785951369; c=relaxed/simple;
	bh=Fngor6BsQe0NiKYevp1IuYbQHIiJAepZr1Z4GNaqSzY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rm/hypVMxBhud6IVNoWN3shDcDbg+KLCiwlAp1yj1jDcH/WYA5taqR5jDWxYAvF0NTYghfsKpzuztMJ1CTbuCuOy0scZdROjHfWhCaXoRX8Ucqci4i0nOVBxOmflbN0ib/L7qxbOayBj/eUimiUVPeLXCM27cvWp8DHJKcRPToo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=a90v5t/C; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="a90v5t/C"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cacef7d299so5695ad.1
        for <linux-kselftest@vger.kernel.org>; Wed, 05 Aug 2026 10:36:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785951367; cv=none;
        d=google.com; s=arc-20260327;
        b=ZXu/+KC5ocnkV9i+v0kYHmxSAKgOVw2Xoqax3HbM3x1NFRhu5OMVsfzXIfiak7pi2a
         TGFvGnQMpuidUrL/UYQYYRBxKPW3qva0WFHVv3nCRhJq8bTZU8v9etPhUzaQLh/oDNCJ
         Pxh+Rw7zi072wGlUHUWBsCtOmupFLK4p2DEO1PUHpYeLk8UoWarNvndWXdDvB+pW9+9R
         ywWHEQdUb1dHZ6pd2mNTDUZ88qkda2i79PT13EP11ujGSY5tKvz8iE5FrjqT44+I80oE
         53U1VMRwMRpmYRfPQ3O5bIeXX6rn25hIxKRulQlWBSTwSBmbKIFjiHiTkq8/8UnPRc7W
         kpEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fngor6BsQe0NiKYevp1IuYbQHIiJAepZr1Z4GNaqSzY=;
        fh=3keL5oaHXf6wb6Vx1sCu35LkO9Eln6gBYtCAzJGkTmw=;
        b=ax/iaKYQDfQD02sAt0HHz+y3JbMhuwSOx4nNpMzQ1bFWbGzXY2nm1OGuNfa13R97/O
         lvXHBkfLSPUDircTde6kN6L6tLkstud1UkEYDvrN22mPKKG8EpRp0KLpL5yg5OxVs+zQ
         zvV5g2NuiYOqsSketuIJON+9MUS1CDzTTgdN0IjF+QSUAHIlB0EZLSOOz424XmqG/2dW
         AnbDadwdYeA7+L3+MwyKAbGOo9vao/Snybn/q+RqqTFD83IMqMGbnkTS75ytOCTkjhQl
         oQVtouNZ37cW7lVPqsX8/dUrnEeqlePtEg8KHhWmPMn6TdiS90DJMSHj7Q4O3c8/6nW3
         zKHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785951367; x=1786556167; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fngor6BsQe0NiKYevp1IuYbQHIiJAepZr1Z4GNaqSzY=;
        b=a90v5t/CUbofxsaersMhuFJ7GzuVOkI84S2kVpyN6PuTmLEnIV8usfMWksdA8X/tUD
         6gLd/veV+1MqGoRZG+UJ8g0vyAjeRr8IC1te/wSPetV+7NdxfQL8nIa9yUQubH+wewXb
         +vZ4XXS27AcKB+ZXzNjxeZ5AV6rRby7VhZZYl72NuktOtGbOjR0N88fPwqT7TNpaiDwS
         Q7L1IU6XrQVkftKZ/zdQaQH3rGpVEkapTWGwMDowWR2ANcVb3lkkKVIakUjNgesvAvcT
         d8s5p1fTAdGQwiHPayvPn1g0nVNVCfM0SxfEaMAHWkkIxY3k/4/ofMZh1bYZa5E9dtP7
         XZsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785951367; x=1786556167;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fngor6BsQe0NiKYevp1IuYbQHIiJAepZr1Z4GNaqSzY=;
        b=QDV0Ea8bq4JAElpQEK8eusp3r9XJrIzzPl2aWAjYHai9Csyz2dGEZkmdycRwIIHHOs
         vMPq9pWiZjWuKd9eUc+Y3Eocw80vnkdLHNTE0XoRpIUbS1BAl86HKzw9szPJb0FITXTz
         GAoFaUm+I3TFlGwuJE/oQY2VFy4KEeG/J0egIpf9A+zAMsVMRZj00lpCaZhza+Fr7C8s
         8KyYVUS/MuIs+KlmWYXXyvTPVoaLgNwpw/6rxzl4via8UwtS894x6yl7dFgh8le7uCld
         z0Rh11Flce02c40koTzq5n1/slTRpdi0WujyBKgIp5Jyebrwwre+8mQzT9Fh7NNtvDHZ
         EMjw==
X-Forwarded-Encrypted: i=1; AHgh+Ron6VZmiNQZsbvOxVyVrUIzY1m/XsMSd7g1OZRWQuzW/SNVnnwjwYH/EaJUhdCEcsl5wUj2jPae0cLB1aLre6M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz5vJhz3L7REUhiq92KvNuWIFD9O4pBlxcqJGyh8eF+TRPOhzp
	IR0OSHLM9BUvOxWTfdy9qz95fqxpWcfs5wKI/IeQyKzGSEKHYKWkF4OoX9N9xLzzf9B5dXsnR34
	Df+h+BWzfc2oBmidh2sE1GBuemI14Yhrp/nQ5BwhS
X-Gm-Gg: AR+sD1144nKXRRhqLR+bs0qMk5zGJowUPGibVJzf0BSlLQ9HvOZ/DX8w5BevsoTbTnb
	8scmWTQcR2IVHXpVf6ypRN6KoWJVn6ua59uGF/uFzua49H8WJn8qIX/2ccGTkvxiisWXQfw6Gy5
	ANIc4wOygLSh5QUVP2byFPdGB1estEYuT7dRwskBBgBYA4MCd9wf0VtPXQQOTCbkq3KBtcMZMXd
	DdUvPPHpZEQKU70McQRygqdTOoaQo61KZ4lMfyeHdRerLKQgW5A6ppciA2MAFw1dqmnlQnhkEWA
	unmi7/bEI59Srui/a5CVP9yikLtaOMtVlDLFbfUNVEXjARKMxIwnavnAWPxflNiXTkJe5kn9eTM
	=
X-Received: by 2002:a17:903:298b:b0:2ca:cbe5:c3af with SMTP id
 d9443c01a7336-2d0f2da3bbcmr486415ad.7.1785951366548; Wed, 05 Aug 2026
 10:36:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260801131220.1367229-1-almasrymina@google.com>
 <20260801131220.1367229-2-almasrymina@google.com> <CABdmKX3Qyeho7Ru8HOzWyCrKXp=kf2H1pOUTXVR3tRWpYhKpTw@mail.gmail.com>
In-Reply-To: <CABdmKX3Qyeho7Ru8HOzWyCrKXp=kf2H1pOUTXVR3tRWpYhKpTw@mail.gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 5 Aug 2026 10:35:53 -0700
X-Gm-Features: AUfX_myIiu3RXZne4yTwiucvdtGUQZsIdfBTkTamUKmtVvsV7Of0e13iL3V01xg
Message-ID: <CAHS8izP_mxA=QxP-17cg09uF1Gc1if=jog1pM_imMKQ7Obj3qg@mail.gmail.com>
Subject: Re: [PATCH net-next v1 2/2] selftests: drv-net: ncdevmem: gracefully
 retry bind()
To: "T.J. Mercier" <tjmercier@google.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 12:21=E2=80=AFPM T.J. Mercier <tjmercier@google.com>=
 wrote:
> > In testing environments, binding to the port can transiently fail
> > following a driver reset caused by the preceding queue configuration.
> > The failing bind() is typically caused by DHCP/IPv6 DAD needing some
> > time to resolve and assign the IP address back to the interface after
> > the reset.
>
> With EADDRNOTAVAIL? Maybe loop only for that errno?
>

I did not check the actual error code returned. I could.

But is it worth maintaining an exact list of error codes to retry on
for this test code? It will be annoying for the next guy to discover
another error code that legitimately requires waiting, and then we'd
have to maintain a list of error codes to retry on. It would be worth
going through the trouble for actual kernel code, but it feels like
more trouble than it's worth for a test?

--=20
Thanks,
Mina
