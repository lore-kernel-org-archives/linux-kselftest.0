Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792684551;
	b=Qxw0z7swpnD0uVYqWyURkJ/dmOJdCaW8JMPYCeT3lEVUlocyfMr5SCas3NyzK3F6eGRd
	 CGdvKTlZYNN/6AfRD8z4yTuuGZJ0S7hLT1EqSHvN+5tjag36wFUvJJp5Kd5pRl6JkdKQ7
	 ULzmqcZsBAqA/8X55Q4Qqg0+HTWYt17giMq9VeMqMdyQbddlq0KvoxhOT8g8ayjVnroe+
	 CbQqLCub8eL8tWrtxJaUMxVv0Kt/a1U0RQLpkEP2jHMe+zDuMORMxbC5p8BoaHg9gM7ee
	 oBdqZvUYLguNhQfpdPwmgsGStwveqqEAo6P7b8Cnxz4WdEypD6DS5RFiV/LoU9GDD6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792684551;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ciug3N5x7fEBixrt4fajqgnJmaStQZXNWPKtQxH/3yg=;
	b=zAPPbwqjgBJjggY940cWpvvJCVqRTVMK4saguYTkQo1kfLM2IXMB2nyxVLZAjnWOCBNg
	 YYm/wcaS491CoofpxwKy3QikcQ16BbdK3ajixQdHe271goSYLf7VGJ5GWX+KETIu6Uaa2
	 2OaH1BO1I4Uo7bML9XWquAMUp+XmIcQrc7vpRkuGrvCCTxyL019wx1c2bJ3uJR02tU01g
	 2wW6dNtfEWuoM5mTaY8B8i8ulEfP0FGg3Ncpd8kY8V+LfmYXBGzOPiib6fH9KqpjVWBE8
	 cJ8Lsj9m/ga2LTAyq6Mfh4ynyjEWfWTRaF2fzkakRxfm7hVNcocHoCUGIyhhkbXROlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=HFWH0hx5;
	arc=none smtp.remote-ip=209.85.167.172
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB43606A33A
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 15:55:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECB43606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=HFWH0hx5
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4f488ba6e90so7400b6e.3
        for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 08:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1792684549; x=1793289349; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ciug3N5x7fEBixrt4fajqgnJmaStQZXNWPKtQxH/3yg=;
        b=HFWH0hx5y+wdTJQlnogKEctFr4zCv4HmD5icgMk+CmZFvs5XHMCcYOkL5/c6C9cu/4
         tAsiT11qmocMmcN7N86vmb8mYy8SMkbj3g3RQ7G8o4n89/tn2yY9nj6gPf7Bt1usSz+J
         MEdyceMEcnvHeLMDEvCuVYGSABR64YW6+PuEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792684549; x=1793289349;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ciug3N5x7fEBixrt4fajqgnJmaStQZXNWPKtQxH/3yg=;
        b=qUqXG0eJppQQn0MzOtoL9UZjep43E+t8qvGyvwObWKFN28PKvnTDDJJXlwXijABCIO
         lCbxVp4wx0g9BpRBeG63df+A8bLhShky173Mz/ntS4VHGfYkwjHDFpyt/zxFjZmEh7GR
         0xgSBLUbFMTEyLZ2TjHvh32ahGjn0wWTXNXkaclZ4gpiqO2YqdSzXRLyjEdBWPCLedvF
         jbgo/wzXii34c23G2JUZ9hNyOw7+9qO2tmK4mSKXVpy9TlAJzEt2X4mEdygWYSLpo3Up
         z2UyB956YwikzhnjJC8diEBHtL7KiMALxfFEsrnJ3xAGXlLzoCJVN2DZy1T0NwpVkz3j
         eOcg==
X-Forwarded-Encrypted: i=1; AKwUvBzVeZTTez3SpQzkDZRuzNbFMQoxG8z0ie1nAxIPRSHxpY4p3G9vc+gxzElKJU1CJ9By0n0GmlLjI6XaGid+2sE=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1m7bsDrkLAEQhGrlP6fyv/pAAYQqdirji4xbvQmE9y/fUOJNT
	TeooWffee08GfnsoZ0LMPFnKJ3og7Z4B/imsldMkGnvFFs6EhbnAPzBQANIJF25Y7kYU8bSuwvW
	bkeSs5Zc=
X-Gm-Gg: AYBFou0spaE6X6pOdcH894s/tx/ziOxeuw7PH8g8tbe/Dv53d88VMDVyl4yIn0KaKEr
	uxv2P4N/HhjhGazWZoAx2Cf+yB1lxd4lLDWgVJTzChCnfUoi55DmvVUmpc3t/5AMsQZ77RTOZtO
	qt4jM/BCNJ5K51N99VZk1DO6ScQJVsJncy4WJ56v7Sr9Rdn56LBQ92sUEaNsQkdCuibrnY2VGAh
	99p0bWb9GXHmIEgiPrBYcwULAQVa5RCnML/HDrC+38jdWchBDFmkgynZcm1PuiHsbYuUzASXJuU
	SZpDMM912iIZ/l2OwERZ8mmpqM2wuqmShUHVok7k88twN8DyNY9Zhiq4bCrEo+xfXaQFr0FQqZw
	bOWxKvxeWe2eUTEdWeyOrfflF8TJvPlc62CcqWgtNaV/qkcPfp9xppCMGyhlH3CJ1o4Yb1dRcW6
	00CFUKBh56hPcK0UwO+cLKHgMUvExp8sFBTsoNP1Zc6rOQlI4LZGN5k9WV8GZzoU7NzjVkgYN5v
	vM7a4qAF0DnGKImgAMyuaTDY1C/ncIEdbLwnZ1vhpbJ1Oesa5wnTEpdoIeniheF
X-Received: by 2002:a05:6808:250d:b0:4b9:a88b:888b with SMTP id 5614622812f47-5535ae2721fmr3901944b6e.33.1792684548890;
        Thu, 22 Oct 2026 08:55:48 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-552b400ba34sm4819851b6e.4.2026.10.22.08.55.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 08:55:46 -0700 (PDT)
Message-ID: <271a7031-aa67-467a-be40-9b08efe3fae6@linuxfoundation.org>
Date: Thu, 22 Oct 2026 09:55:43 -0600
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
 <96d29c1f-d797-4f83-a65a-d1763f0cf760@linuxfoundation.org>
 <20261022150624.THzKWu9_@linutronix.de>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261022150624.THzKWu9_@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/26 09:06, Sebastian Andrzej Siewior wrote:
> On 2026-10-21 12:31:46 [-0600], Shuah Khan wrote:
>> On 10/19/26 04:35, Sebastian Andrzej Siewior wrote:
>>> On 2026-10-15 13:47:37 [-0600], Shuah Khan wrote:
>>>> For selftests:
>>>>
>>>> Acked-by: Shuah Khan <skhan@linuxfoundation.org>
>>>
>>> Thank you.
>>>
>>>> Do you plan to cleanup x32 checks from selftests/x86 Makefiles?
>>>
>>> Could you please give me an example? I've been looking through
>>> 	tools/testing/selftests/x86
>>>
>>> and didn't find anything Makefile + x32 related. Just
>>> syscall_numbering.c which has x32 bits.
>>>
>>
>> Take a look at x86 selftest directory. You will find sigreturn.c
>> and syscall_numbering.c that have references to x32 syscalls.
>>
>> Makefile has handling for TARGETS_C_32BIT_ONLY.
> 
> Okay. If x32 marked as broken it does not hurt to the selftests as-is,
> right?
> I think sigreturn.c can stay as-is except for the comment referring to
> x32.

Right the comment needs cleaning up.

> syscall_numbering.c has plenty of x32 bits and I would go and remove
> them once start removing the x32 bits. The reason for 1/2 in this series
> is that the nolibc selftests expect x32 to be working on x86-64.

Perfect.

> 
> But this isn't the case here afaik. Now that I test it run into
>     https://lore.kernel.org/all/20261022142425.3Wx-RrU5@linutronix.de/
> 
> so the test is currently broken.

Probably. I haven't investigated.

> 
> Did I understand you properly?

Yes. My objective is to get these items on your list to take a
look and address whichever you see fit and we accomplished it. :)

thanks,
-- Shuah
