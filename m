Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D202BE7DD
	for <linux-kselftest@vger.kernel.org>; Sun, 10 May 2026 12:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778414581; cv=pass; b=OXq1Q+mnNW6zgR6WziIr89rfyUI38SyNgILHgU6qxqs56u51N7abPjDyKShoRXY20oPS1btLv9Tiw53a90qDkP87Mwpc/YR8YdNnejQyWs0hFlA605J3yMMNkUhcvvJNtGM1ZmXrPqQWpgNYDddr1/ZWKVAoSecybxerB79KutE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778414581; c=relaxed/simple;
	bh=bH+A1pcJNHbsEm31+G4EJAAN3LgMlSAJINOZTIByCpo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L6hB01BFQWpOurtcTts+PIn1qcCIaYNAA4O3qvGaz8YykNzlC0i0VSgq/eMCjb5lUQ9L+AgmBMGLKS0vCSpzHcY08goJfavajXzG6xI0vp0MGd+LNSH/8VdaxUEMgHrOY7lTQdVE4vLPCw6ng123WUIpzqXCEVsXY2ZHtbxKOGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fO0pJrO8; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fO0pJrO8"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ba6838e76f2so441196866b.2
        for <linux-kselftest@vger.kernel.org>; Sun, 10 May 2026 05:02:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778414578; cv=none;
        d=google.com; s=arc-20240605;
        b=jcEsRYWD/HHy/DZNcBz+f7zBExzyFJCw4PB1tPLJSXFjZmDZ9D9AaZ+tBARPu08Xe2
         MOjvj/s+eT7tMYWFcJuc1yXyi/5AO6IBleLi1uuwW3yY1CTtORrZWRphirlb2AYzTIy/
         Tg6a13W+q20afvdbeBYNFEEQcYAyyAWAT8DRlsb3yVSrRW1UYoG9+Va5EPOkOQIlY61r
         YgEtwFc5E/GMHm8LQfgw6HCxWA8WvSm1Pd2KsdB02hudm/iDKVbw5vMGtEg+zxxwqrUo
         TPup29nS8Y6kDLYCO1Y7Qf7pisPu641Ft1uxeJy7o9/3d0YS4P6BmqZTpaPmMnLOleM5
         lYmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Vmli1MjJU1iPg6tCzc8RsiqsXAYEqteoIsuCG5nm0hc=;
        fh=mC2syfBs+t4vNKU5ioHdlpLXUz4dVcziaV44tTCktgM=;
        b=DZ9EZVTYriu+340RXqG8gTRiePxB7TBwYDC3yxgsaZ57+aB1nr0QIy1Q+GKMnhRPtN
         0/UVxM/DI/weglF+xlsEBwcBc4AXh5BDT13A2LFtF+BU/q8pUHANXWZOB3r3ihlEjI7k
         nJMlnyx6AIFxA5Jt7REiFStishmQvEH0YtWupbD51p/oKQjuFD2jPdT+KLeHhU4mfZK1
         I39vHl+4bPqBaBI3sl8Ncx9wYnqY/U4lNIQpVT6EsQqw3coiKxcWap2EHEWZVIBelGIK
         YO9zP6PfOkbGVYLEfQInyFygqRxwIdJlVW984leT87jdiZg8o80phuYPpZvBA08JX8uh
         0/XA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778414578; x=1779019378; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Vmli1MjJU1iPg6tCzc8RsiqsXAYEqteoIsuCG5nm0hc=;
        b=fO0pJrO8ujKdOeYAdQyNU3+8Vm0rnTWHF7763Kct16qI84G4j3Xzo+XVwJpN7NKMrf
         TO6g7oBiNUrXU8H7Se7tTM+BqJOXbOjlXEqZNun8vGKTwQ81pbfnbptOYIzsFbzGBnZw
         9Zv+wa8pOf7abXoV7MVJBpuZUvzyZ5FiuAzUmfoLJP4/d1vePAl/P8PzPOz8ZE558CSy
         XJpeM1BY8r/J/GELM8VoXH+PCF+iXh2sU2AfRAdaoYkrfqMNFTKQvZLsCfFk2uTbVm6H
         FBBg+mkzWMzvkt/QD8YWa/Wlnccoc5A9xc8cUXVirru3X7G/0uydm7yWkQPGz0WfmTvm
         Wyiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778414578; x=1779019378;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vmli1MjJU1iPg6tCzc8RsiqsXAYEqteoIsuCG5nm0hc=;
        b=bg9PE7r86Z6rpHvHanybs7hkPJDklSF4iOWVM4OEOafZieFBpylS78n615SF4Glq8L
         m+JrnfOZEmCvlx76hW46VFXv7gu75sdDwN09FUhTv5TbncxA0pUA+tw6vL5V3AJUSmJx
         wCP/naZ6h4rwcy/uf07Z4zcv6ulU0YxCyBa79+Rnw1lgAX91xuVsNqGkyo9Mir9QcQTb
         AQFbjpMt2KirxB3rEH0fuYvB9jzLZQvPijmk7JjPL25ZP6H2KqLLmHN6DnOKXwv8oQvZ
         OBlrmaI+nFaFtJse3yQxuCFR2JvFsfvqqxk/BiUy2jGh7pmeUuu4CKge/UP0UWh4usA7
         vnag==
X-Forwarded-Encrypted: i=1; AFNElJ9gfIcTZwxzHrPtAhauK+V4slRV+zNPNJ9I9GilduTmKXUWpFtwBeEj8pURodMQkitdWQOkvu80crTxLLBZYD4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5STNzHTR3ywYgO5qcOJJqERrdh7b1wSG47ws/hin0gkyqbYUy
	WiVWmEZqqezl0O6QXzvVblbvRn2fJC3hPTqdVqPfQtahNuHeA2EMh6jysoYpO05V7tK5IYR1SMc
	ZYhzuqUBBD2SLmGAnFl7iOoqtGu+LpFM=
X-Gm-Gg: Acq92OFmP9QXCKQcsIKYnXReEbDVObxnPLZIRWOMTnNEHXsmPrBI7ioAbcTXi0nvwoM
	uOz76QhabwhZ6A5YvEWtrgGRQYKRUtYd5K+HIUGV0F6viaLDvJlLHec49z0WARzbaDKoY1/I/UV
	mgLCLVH93uRKuwyf9gyRVDAPCEQwGt+F1MGYUC++GdLm7+Xm+oudSRIHcoC3xTkd2xNMfxtaGn9
	2CmZEYxcLMjDnZtqe1nlGV1aHnHQc34m2t8LG9M8MtWBw8TuzUjcQJ1ObzXT+iH4MTRPskDgIFG
	p4eku2AC1QIM5+xdOGwXyKozby8YxaV0z/Fey/+Hcg==
X-Received: by 2002:a17:906:eec6:b0:bc3:ae9a:15 with SMTP id
 a640c23a62f3a-bc56b94225bmr1059279966b.9.1778414578150; Sun, 10 May 2026
 05:02:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505-seg6-mobile-v2-0-9e8022bdfdb6@gmail.com>
 <20260504163915.4a8b028e@kernel.org> <CAGCJULP83NnaX6HAqwb3umDXsxN8LH48_gPpJ_3gG8_xA96QNQ@mail.gmail.com>
 <20260504182833.344d7b33@kernel.org> <20260508033210.5149db4fc3977d33937e6942@uniroma2.it>
 <CAGCJULP_dTSjXQqyOYXckkmtd-HAPo4UT2V0WQofOZaJYLgENw@mail.gmail.com>
In-Reply-To: <CAGCJULP_dTSjXQqyOYXckkmtd-HAPo4UT2V0WQofOZaJYLgENw@mail.gmail.com>
From: Yuya Kusakabe <yuya.kusakabe@gmail.com>
Date: Sun, 10 May 2026 21:02:46 +0900
X-Gm-Features: AVHnY4IcF3vmMhSO8SdPuE7-fCfzpzAXRJRVY1ZnbUg0Ri8QL_dBkXa2fNxxouU
Message-ID: <CAGCJULMSMrcWmQUZ-RoWB8uAivZ2DZdefED7nShMpUNBzPBLFQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] seg6: add SRv6 Mobile User Plane (RFC 9433) behaviors
To: Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Justin Iurman <justin.iurman@gmail.com>, 
	stefano.salsano@uniroma2.it
Content-Type: text/plain; charset="UTF-8"

On Fri, May 8, 2026 at 10:32 AM Andrea Mayer <andrea.mayer@uniroma2.it> wrote:
> just a heads-up: I am going through the series (kernel and iproute2)
> and will send detailed comments within the next few days. It is a
> substantial addition so I want to take the time to review it properly.

Quick note from my side before you spend more time on patch 4/7:

While preparing v3 I noticed that v2's patch 4/7 ("End.M.GTP6.D")
implements RFC 9433 Section 6.4 (D.Di) by mistake -- it shares the
SRH-augmenting builder with patch 5/7 and preserves the original
outer DA in segments[0].  Per Section 6.3 it should push the SR
Policy verbatim and write Args.Mob.Session into segments[0].
Already fixed in the local v3 branch.

Feel free to skip the End.M.GTP6.D-specific comments on v2 patch
4/7; patch 5/7 (D.Di) is unaffected.  Per Jakub's guidance I will
hold the v3 repost until your review lands.

Thanks,
Yuya
