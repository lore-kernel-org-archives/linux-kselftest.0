Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792607514;
	b=1SPHlgVRp7sP4GaCF0loauqX3FNG56yoPaql7Gs8ZMnY8wzC55mk4jwQ6/YKCrPA475J
	 QN0ib6PY7n0mPENIqumXDi1tIlEHMMSc/YgXdv7kKfPkyysv0RQD3oPxCF9JKDMOWc3Cl
	 Pi3wAJzBgDU6k6iSTLU6BkE/glOUqa8hYocN3JZxlQRpoDkD084HkBWLv+ib3529aV/sJ
	 b7dXyJmsaWaMhA2UXkIeTS0ZGrmytDJkCO9wQsU3bs6f59FrYOrKl8+BU4U87eDcE0wbZ
	 0pVz9Ki1KZ2XZZX9A+c/hJrUvvDzqlLpOChZAV6IjhouvyJYRZ9vxyCqZUnnBtr8Tyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792607514;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=H/C92bFGslXNt0AknMrgNcyMQFOZNr/Li4FPW9jxEpg=;
	b=tfE6CQOWLEpTe3ywanDa7uzMqhIoefEep3d54/JzpXgCLiqVeUwg2pplKm3NtQvjqiiw
	 zRJWb5B9RlKOslt+RTWz1jodJxEQMm9CezAOoOL317A3oY3uGeG+p5Xa47j9m4Z1b6zns
	 Hnc7MkmNZSLBnIlQV46JKWfZ5xG9dXrKUSP5NTWa9FlPkOKiwEQvxkyCw/sKcqSKWvzgg
	 BqN3A7ZnFVwvn43xMugcxlJGICfa03WAq2Vn3vdu/GRIYczJlHSKAmE1eLIMcG2iJYFlb
	 B8R704DCNRt/r/2yOIVF5NJyXfK6Oyky1at4QNCyrVKRrujpkui4Hf5u+FeApYPdZaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b="c5ODpY/W";
	arc=none smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA60606A319
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 18:31:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EA60606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=c5ODpY/W
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6b1afdf5196so424991eaf.2
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 11:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1792607512; x=1793212312; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H/C92bFGslXNt0AknMrgNcyMQFOZNr/Li4FPW9jxEpg=;
        b=c5ODpY/W9uYSYWXI70jnDoAGs8eBtqNpE9xks9pXRR35vGNK+JHifcBRjAqEOXS10g
         iUTXz1EI/BMbkpZp02fd9CbJkCBD7ujzE47viANOF90uKW8LhCrRej+EqY+LlZheqril
         LSRlWKkK3RzaXhrzP+FQk8Ms9BuLw+Ysr4Ofg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792607512; x=1793212312;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H/C92bFGslXNt0AknMrgNcyMQFOZNr/Li4FPW9jxEpg=;
        b=cwg4b4KOxh5Ggtm2RvInidkKDXy5spweaMY56yAdh++zv5/Fv+66UFFytnB8t8GBjW
         wqSj9cPaKNTSKzVLpWyfsrLHWhcKIFcaTHHCv6MSEzvJMicEEhtXRbjOVAUAV3+ZsAEv
         BiGF+FhZSwt/sm04us7FuDWoCZrUxHbx9dYUqD6wqZopOZZSFyzkhSRbGHAmSzWGkxRZ
         ntaGQJ/IE7uI10X2vZoUaDXOrQW9UwQprLl2auTfVCgtpS0WAu8B7t8rB44xYi8h3grC
         tEX/HqbAdyVEEakCeGH3Fhmo22azIreW1rTsKXJU4HX2OQrgaJcYZEsn2f5lRuvebVkY
         KiBw==
X-Forwarded-Encrypted: i=1; AKwUvBx+0euhuWJLODIFlJoo4CFBKlmUtCgZb8MU1LZYOEW2t0LYPD4zgGK9JY/iKqWRUB4dvDfcOyAL/0TH17IqCdw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/Z2Ev+biD9T3nqZbault/Mfyarccyw1nbm1Pjv1/FD23TfTrE
	uJD1+mvCF/833pl1k2sIpvo/cz8j1QHiHKMz4loA9Bz/SlnAdo2//W8Ca0oC7sqYXlA=
X-Gm-Gg: AYBFou0RbJpK+1LrzIZkj/APW4dqoSFvClF/V0cPOK5bhAlkTHl7xjvFdRmzy+zo+Vo
	p9sou0dHsxnPXQFCEUuBGx9nLvbZodrAjt6Rx5fQOfFnL+zZ3BpTG1tS81QQczthnAahKxxpEy2
	WXogrytem7622LLgcv3dfH/4TrlyhWe644dh12cpiIl8jvCorkGEm0ei/UbWZ+SlMlbaRfYszJN
	ZqDq3pBYGAijgiHmmLQ/b91GkgNAyiKUMmzML9bDjhUoL6i1pB/QNaWqINZAZyK0QFQmlaFdtp4
	ByqQRQf3U8uRcIfV2FtJilzKGqPITJlHbcEW/UQSrvaBa3PHahBGblMFdmVrCUWRIscaYe4KMFr
	k9PPam+1czBLmh4qOv07sRTjjxuzIQCIHWrUcyXYCIxUU6ddxQNpoqyJCJy+UPy7GS6MIG3AgWb
	rFvaaD0WXi8qJ2mP0ucM34UOhQyEqivBVJJUWHWuJOiDZnYBhZDabfUh97kP+RhBa9cvYNAi1TM
	ABqkl/it69W2U4j7H07Wy2k+QAbdbBpM9/hSDWVg9yV493aVocQ5N9qaQ9wGznvU6mk8pe7J2RN
	wZj8XPtLbHc=
X-Received: by 2002:a05:6820:2088:b0:6be:139:c032 with SMTP id 006d021491bc7-7093fcba6c4mr1493986eaf.18.1792607511905;
        Wed, 21 Oct 2026 11:31:51 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70a543c313fsm448703eaf.12.2026.10.21.11.31.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 11:31:51 -0700 (PDT)
Message-ID: <96d29c1f-d797-4f83-a65a-d1763f0cf760@linuxfoundation.org>
Date: Wed, 21 Oct 2026 12:31:46 -0600
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
Subject: Re: [PATCH v5 0/2] Start removing X86_X32_ABI
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, "Maciej W. Rozycki" <macro@orcam.me.uk>,
 Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Jonathan Corbet <corbet@lwn.net>, Justin Stitt <justinstitt@google.com>,
 Nathan Chancellor <nathan@kernel.org>, Neal Gompa <neal@gompa.dev>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Sam James <sam@gentoo.org>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?=
 <linux@weissschuh.net>, Tomas Glozar <tglozar@kernel.org>,
 Willy Tarreau <w@1wt.eu>, x86@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261015-x32_removal-v5-0-2bfef9151fad@linutronix.de>
 <2fcf2983-0972-427b-ad05-b403e325ce40@linuxfoundation.org>
 <20261019103532.E7ra8pya@linutronix.de>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261019103532.E7ra8pya@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/19/26 04:35, Sebastian Andrzej Siewior wrote:
> On 2026-10-15 13:47:37 [-0600], Shuah Khan wrote:
>> For selftests:
>>
>> Acked-by: Shuah Khan <skhan@linuxfoundation.org>
> 
> Thank you.
> 
>> Do you plan to cleanup x32 checks from selftests/x86 Makefiles?
> 
> Could you please give me an example? I've been looking through
> 	tools/testing/selftests/x86
> 
> and didn't find anything Makefile + x32 related. Just
> syscall_numbering.c which has x32 bits.
> 

Take a look at x86 selftest directory. You will find sigreturn.c
and syscall_numbering.c that have references to x32 syscalls.

Makefile has handling for TARGETS_C_32BIT_ONLY.

thanks,
-- Shuah
