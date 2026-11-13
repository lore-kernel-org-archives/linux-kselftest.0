Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794558660;
	b=ofVJ9CvvuF9VaZrxfgXRyEZ+cwmEkZXbDov0P5sXwlYyFl/WPxtTGxBQdVXWwTA1+4tG
	 aHgeTVRP2R3VbuVN+eSI9GBG9Az7ydssypFtUOkw4lecLOxeNmGYxaCsd8mPNtEZInjV6
	 caLAaK13aCtblrcP3Dm1wAq8JlpyhBWs5sbPwHhXXM04xni6O0C8nqWA0prF5Zmq5T9NE
	 j8U/N+0rgDy3uWFu8s3sXdAGhtRk+f0Gw7sru+kWRyAi1A1QqUXiklDQTQa2B3+cKTpO6
	 R1z+Ci7y/fTXrjDMJhWw33IRfTqM6Gzu1rNINEFD7VIlybB04EOHdwPuUN4YwQmnOog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=f61a/DEp6A2hm2rkE7XwudvGQ0m98AaZhEeJm5iO0+E=;
	b=0xr3LwUQGybH96TOA2Sijj5vVMH8PrqQM4g7Le4RLcmhg87tbQ5YFQ2yuqF8qew4IrBs
	 XZY/jMzeyNdw+WOGGgbfsYOfUxGGL1GMOo15EpGUnfJ+amTZnekAEiYtrSgqSz2R2Wt0B
	 YSXcIZbZujp9SHa63B3yHPy9XblY0yNQmRnsToHm57NELEmwtQV6NY+GibdIgXylmp8UJ
	 5ws5R4kVZxSsTaT9hNydMxuN1B4eatidISmy3+8ipLyLLCyO+dN2QPLgHliYyvFsJ+DQV
	 N3A/Sap2KWGLFWm14S1hE9uMjMye0h46aTcSF83+60UADsHHg6BCVPxJdRz5dtXg42Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=sRaNMk2O;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B213606A33D
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 08:31:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B213606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=sRaNMk2O
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e987a2ba0cso3417125ad.3
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 00:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794558659; x=1795163459; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f61a/DEp6A2hm2rkE7XwudvGQ0m98AaZhEeJm5iO0+E=;
        b=sRaNMk2OSk/a6aWGOqOWrMugAMmZ1cinBvSaGXXuX6T5FudhFdHlZzEHowq/jIOZ4n
         Jzw04d95113kezBuy2csxHVIWCaqzTBp5Wqjaxn+c/Pl36oVol3U8iwzvNWwqzlINMwY
         dUj5skD3W8p1FyAHmxD4xgC6UJvK3jssafyMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794558659; x=1795163459;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f61a/DEp6A2hm2rkE7XwudvGQ0m98AaZhEeJm5iO0+E=;
        b=HgXbN0vjl6ow3QEBV2rI60JXHR0XuYYqbgEq0SRdqNmazjzrhK7Jc/vNl9998kyE1D
         /MMz8nxXUjlxXP9Tiyit/Z7PPny8y4GNXTubKkhHRxQ2KZGHGxC9uBsYKPEUf2GHKzjH
         2jL9SIftYYw0Dm1Hws91iJ/fwvlke6UO6165EqIb/Sz9tS25pGV5rLy6UQq4REy5gdlN
         57Sy0XMuMjth9UMNzl05TLfLj0nIPyKJO39TFXPgC+/Zwaarvh1+lLKD8Vwt2l6ecYIR
         blk/XsIDYnnvgXpYxlrFCgTeSioScO4eduNseXOYyIMfiK/Jc5RZjEOjGoXEF5ZypQEZ
         R1tA==
X-Forwarded-Encrypted: i=1; AL+hErEAyBmvuzOZjixByOTBevswAE9qQftQkCStzdF6dNqs0E93/Uvj0lxpArPcCWJLOAIU0O9gngJwGnp1X+dfB6c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/j8qrN+03Uggr4VS3EvUMkbfMZ2lkbktvarrTfoNEHnNEzKJLH
	b2ijcD+I2CpxFLWWzX9JxotO5Gij3+cCRUwyZpr81Vf8Ktig+yqX8jPCHotw0eXPmpY=
X-Gm-Gg: AYBFou2rMucuRVUj1XcwdVAazS7G/MqTrTJxE9UkMZVCG8cst0wMKW++VirfFvUuwHg
	ehDEQ4NAdJeCeBvHRjBeBcYn7JQFXCBTd9KtoUMPJfDGHFRX1O1uzZbua/SZMnsU1lzdDvIGgu8
	ClbCSP2RgC82in/1TwT2mwnVelzFCbQWjsLF3dEhLklz7hj4tt/SAhLtfIMLf2lbwBtLCd80kF2
	LmLGMz6kNVgFZ8jLosLczSwD9B97hInBShP27sVZYviBkpsWTzBhR/kUZmLX7FwVikr1GZ86VrS
	EcBWCxOvZEnPbLkxEcIX3FPkaYxAWNOMF835ILJwMUl9OVm/TTvJvFeMVRBCm7iTB7a+sLeChXD
	y2NzSfsB1WjexjXxB3j7b/aelmhdYIcDRryOBMWDQ3jyi4KsQb+9ipPT1bWgA9LGZ5jBOt+wDxT
	KoynjZZfTUtohAYDGmP9NqqvsThgQHUOCo+S2TcqfjU9Ju+46MohHRNm1kTcKYdGebsY1kDsqBr
	qJTFIwKXW9o0jxrBxID1O8UKp1B63ip9BjYNr4ufGGgPSj8iiENBfXL/bsNto5CPSB6r6M1dJ3W
	VANBXeMyYlkSgiQXg43l9Sk/wpc0IofWsYw66oiNdcYg+PqHq6B+MYgyjrx529Iim5AuSEXVczg
	KniyyPYtX8VL2v+HB6gmCWOZ4Wm4KDk1m5A1iLM/Onn5qvSyNYcrtbpaB2pKS1zwddK41wsKr9Y
	j7UwvGNRON+LkOUXcyXlQgOnIXVHQwJ3GcyDQkxNqw3f4lXvLrn0e+CA0Gryk=
X-Received: by 2002:a17:903:228e:b0:2e8:18ca:5f46 with SMTP id d9443c01a7336-2ee0da7bf97mr17781095ad.14.1794558659559;
        Fri, 13 Nov 2026 00:30:59 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f868217sm6442615ad.52.2026.11.13.00.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:30:58 -0800 (PST)
Date: Fri, 13 Nov 2026 00:30:53 -0800
From: Chris Down <chris@chrisdown.name>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Mike Rapoport <rppt@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, Breno Leitao <leitao@debian.org>, Alexander Graf <graf@amazon.com>, Baoquan He <baoquan.he@linux.dev>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, kexec@lists.infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 1/9] kho: Reclaim the metadata page left reserved after kexec
In-Reply-To: <179443616043.2329176.17166425351392983946.b4-review@b4>
References: <cover.1794383544.git.chris@chrisdown.name> <63ca64c004b296a998a3e531f8c0c4964916b70c.1794383544.git.chris@chrisdown.name> <179443616043.2329176.17166425351392983946.b4-review@b4>
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
Message-ID: <20261113003053.1c951f5a678d35e3@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Pasha,

Pasha Tatashin writes:
>> Fixes: 76aa46b9e404 ("kho: kexec-metadata: track previous kernel chain")
>
>Do we really need to apply this to stable? It behaves correctly, and
>your patch performs a minor optimization by releasing a single page back
>to the system.

No, I don't think it's worth a backport, since it's only one page per boot.
I'll drop the Fixes tag in v2.

Thanks for the review!

Chris
