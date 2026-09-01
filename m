Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C684B469851
	for <linux-kselftest@vger.kernel.org>; Tue,  1 Sep 2026 20:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788295576; cv=none; b=uHFCw+6V3/s5Ja0HsNfJwZgzS0oH0zh9Rl5VMuPq6nAT5BWqG5u2L53EsjlvEVYSdl8n/NG5o7OqlPGbhpYrf08W9gNYMsGYiA/8ZiMROzd61TeNWlUfZ80vJ4VQ69tF8YiTtZ+mw9MV8rBDFa+mexrrB8S00bfqNQKFF9UMEy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788295576; c=relaxed/simple;
	bh=hE4+SPOGmeF19I5cgkeM4CEcAfGK4ngHuqQY73C1MbI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P1jfztv16IacxdcZb199RKw+zdjuJpbwWoABk1Ow48rtra55/hmMRCjOgiHbyzz/Lb0CxhCX0CMVXENhmxllqFVfZmgNSH90xgs1tpvX3Ktqcpc/N4L0wLBsa8Z4zBBQhzB94mvyCMirs04Dfsi4mwEQY9XtcezosDW5NfpnGTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=I5Fzug9E; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="I5Fzug9E"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D41831A1936;
	Tue,  1 Sep 2026 20:46:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A6AF06053C;
	Tue,  1 Sep 2026 20:46:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 92B6911C7923D;
	Tue,  1 Sep 2026 22:45:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788295565; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=pZM2UOlcGE150UsArFPxPN+mf8W/SUHrCqlcfGC3EK4=;
	b=I5Fzug9ERsUVFV8ucoMdE1WRTV52JlwBudAvA2F2Wx93f4CsOssv5ChVCkGdt1edKOq/AG
	9L7ZqFs0MMDLxVYgbD1DY03L0WaoiH6NPAxykI+Vah9kFjiMb6h+VkwAW9MCCQlZ/9hzsX
	Eld8rh0K6c+5FcCQPwwnjsteBTGOo1P3z4/47LWUsL/XzAwE+cAFb8SaLd1FDePCkalXjc
	H0LZQOlzIETD15qLBuQOXm/KJ1yQXTCFLs9W6ChgbEQiwqdZ0Y1nUnvxBMqKzpdSVjcl6m
	HOTGP0yYO1CDdmsSN0oxwbg0XsDMzeFMziq5lTb5e8vOTGwPFdRdWvj3qNGrxQ==
Message-ID: <20631f9a-1a2f-4ef5-a4c5-e1948e55dd78@bootlin.com>
Date: Tue, 1 Sep 2026 22:45:47 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/2] selftests: drv-net: Use cross-compilation
 environment for the io_uring check
To: Matthieu Baerts <matttbe@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, linux-kselftest@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Donald Hunter <donald.hunter@gmail.com>,
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>
References: <20260901164200.1124343-1-maxime.chevallier@bootlin.com>
 <20260901164200.1124343-3-maxime.chevallier@bootlin.com>
 <a42cdc44-efaf-44ff-9ace-f08e0c3b9856@kernel.org>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <a42cdc44-efaf-44ff-9ace-f08e0c3b9856@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Matthieu,

On 9/1/26 19:24, Matthieu Baerts wrote:
> Hi Maxime,
>> +# Set CC for the io_uring check
>> +CC := $(CROSS_COMPILE)gcc
> 
> Could we have something similar to
> tools/testing/selftests/riscv/cfi/Makefile:
> 
>   # Set CC for the io_uring check done before including lib.mk
>   ifeq ($(LLVM)$(CC),cc)
>   CC := $(CROSS_COMPILE)gcc
>   endif
> 
> WDYT?

Ah this is better indeed IMO, I'll use that in V2 then, thanks for
the tips.

Initially I considered doing a larger rework of extracting the logic
in lib.mk that sets CC to the right value base on CROSS_COMPILE, LLVM
and ARCH into a dedicated .mk file that we would include at the top,
but at that time it seemed to be too big of a rework for just the
io_uring check.

It lead to some headache about double-inclusions and relative paths lookups
that far exceeded my Makefile skills :(

Thanks for the review,

Maxime
