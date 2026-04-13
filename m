Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A5E30ACE6
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Apr 2026 16:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776097351; cv=none; b=AzpzBBSpHML4VsXffiDqv4qku+Gh23MAc8rCxdNr+t8gbABiY3vc4Ho1t+xPKBQ9I1BpUoXPfzq2zQnP7u6MHb7ecuhCDwI+xmpN7oIXzQRwQ+VnLcxk/fzgYCooaMdWN+S/6ZGhEz4SBXMsToxsxWQLegdSwXCm57/encVyxAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776097351; c=relaxed/simple;
	bh=cWWAlxzEb2WUqi12qkJyJ8vSS8DHl2cHg8dCUkKVNXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZqvGYJSaaJFPqJ/nwlmGoooQPXw3Kal07+jr9WBhykfNPUQq863aiWe1umfITmH0H4nyj4TqOUsKRiRF0PMUhL0HFzDLafPSeShF+wZLzmzSuwqQXpjtWXV0QbhArGYE+gZebw0B9VOwaYsFBQzCo5a4v5SZJxvVji/z3CqgCp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SiGUPv6U; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SiGUPv6U"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso44264385e9.1
        for <linux-kselftest@vger.kernel.org>; Mon, 13 Apr 2026 09:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776097348; x=1776702148; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z7I+NYatTSR9xEcW4oWgYSH4uZ38/JA1eqYfnnbc+3g=;
        b=SiGUPv6UdVKz6v5klWG0rvYmsuN9vnRmD6xEx3dHBa95irsDYZrTH6gpBOqr/X7sYc
         zvlbfDGiu0x1NaCOcXRRzSR5DGd6W/hOdfIkSPWZXHCSbCcoj1I8EgcfkROt5MuU0v8r
         n7Wf+wZEmZJxU3o24knSforkYsQhJjTv87u7diXsERAZJcP1AHoE2TcFspmxcWHyM/4b
         5OPGDOvQd2+lf1wYlofZv/Ywoq+4//GdHlmk9Zmsv9zAng35VVvjrxEWoNjsI1vTG6+8
         vsCyYc9iP6976lcHWrP/htGkS8++79XdIi+/jV3VUYpmcMVO86C03iELV2JoeMgA0XBS
         kLjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776097348; x=1776702148;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z7I+NYatTSR9xEcW4oWgYSH4uZ38/JA1eqYfnnbc+3g=;
        b=cRW9mFnq2XBO9/ppb4XO4ySWgHS5CSUlfLg687M8WzPh9lTZSwdt9cxVavUXzrhOAs
         XcF60i6I0psmrsYxe6+aHa6qeShX8QI1WvZfHjimm4ttuUXeSU6ZbIB72+TpEtwOZz8r
         DlY9s0DdptkcZ+avnFJrUZlNJXnnnOGMGW2gNWlPtTshKsCpwzJTM6s8tpIQwVnX0Cpj
         XrGTJPP15iMNBcSCWbBRlGS26S8GyhKri9/AWmcFMLk8JX5Fy9y6uuF72zXjP8aTCWAT
         KpC6gOhb8u8jsYKUQQ+pBdu2BJ7jrZYhJrILgY7ixBfsse7WOpG9XI5/KufVcIIrqR9i
         rIvw==
X-Gm-Message-State: AOJu0YySv98sHcWgF4HleyErgiAI8Iasvqqzjt1FWvhMU13PGgYQINb1
	e9Ip0EHjZ1YmwAqt0642mvafWwlxFOc+DH7zKa//VzYsUxI2ZEFN6G15FLmBWzpUAQo=
X-Gm-Gg: AeBDietqPmryUnZg+kMfYTOy5oDWL0f4yqjrPrZA1qvSYHzFw1RKFQ3lvxZoaTT5bHt
	iBBeuoP8YJ7ZSzsOzsLyG0DOoVhRXFk9lotGAuBdxUsvT5xjqWhap7/jgfO5jCuiB080XS60YGA
	Y66nW93pTb34D51eBIKEaHIXdYHV5M/u/rKcQIjQU2HC+tuC/mfv5LsihMhDcYadOGWo82zjF43
	WAXMajz7okUzXjMc+5hXMdxrPthXYuNruS1rL2KJKo5tZ/YTUdHMHt8f+GRL5ifa1nZmnWyqdH/
	qM7oS+wL0RaR0seakbKBignIkgAzodKqTbumanfsCWCXbcdkm807+TMM0qd3IVsPyggK1wtV3Fg
	XAWMIOFjAq/jgzHERcQPzpFFVtUJw9ZQpRXTo4Lcp+tjvq0tyXz3ZpQN543AiAvqwWzK65uCobY
	L6vF+A+FOgeOijMsMmqUt8/XOkg+EqGlHXTIoRVA0gOSpGGmHChVFeReYr+9s=
X-Received: by 2002:a05:600d:d:b0:487:2439:b7c8 with SMTP id 5b1f17b1804b1-488d67eb7a7mr146945065e9.1.1776097347595;
        Mon, 13 Apr 2026 09:22:27 -0700 (PDT)
Received: from ?IPV6:2804:7f0:b765:e41:ce28:aaff:fe86:149c? ([2804:7f0:b765:e41:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c345b5b9dsm13289779c88.7.2026.04.13.09.22.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 09:22:26 -0700 (PDT)
Message-ID: <e412d411-6eda-4206-befc-1e59782b21ce@suse.com>
Date: Mon, 13 Apr 2026 13:22:22 -0300
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] kbuild: remove kselftest output in mrproper
To: Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org
References: <20260320-selftests-fixes-v1-0-79144f76be01@suse.com>
 <20260320-selftests-fixes-v1-6-79144f76be01@suse.com>
 <0db1075e-4273-4504-9c3e-1a9f35d37998@linuxfoundation.org>
 <227fd478-581e-462b-9579-afc5028abced@suse.com>
 <7287249f-3afb-487e-adec-8cf08ae7b1ad@linuxfoundation.org>
Content-Language: en-US
From: =?UTF-8?Q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
In-Reply-To: <7287249f-3afb-487e-adec-8cf08ae7b1ad@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 4/13/26 12:58 PM, Shuah Khan wrote:
> On 4/11/26 06:49, Ricardo B. Marlière wrote:
>> On 4/10/26 4:19 PM, Shuah Khan wrote:
>>> On 3/20/26 12:29, Ricardo B. Marlière wrote:
>>>> Selftests built with O= store generated files by default under
>>>> $(objtree)/kselftest. Those files are not removed by mrproper 
>>>> today, so
>>>> stale generated artifacts can survive across builds and be reused
>>>> unexpectedly.
>>>>
>>>> Add kselftest to MRPROPER_FILES, so that the default kselftest output
>>>> directory as part of mrproper target.
>>>
>>> Does this change remove kselftest build objects in-tree builds?
>>> It didn't for me - also there is kselftest directory under
>>> tools/selftests that has several scripts.
>>>
>>> Can you test this for in-tree builds - I would like this work
>>> for both.
>>>
>>> I dropped this from my next for now. This can go through kbuild
>>> tree.
>>
>> OK! But please also drop 
>> https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git/commit/?h=next&id=33880424308df3c2e39fa88ea74f051205ebb7b4
>>
>
> I can do that - you didn't mention the reasons why you want me to drop
> this one. Do other patches in this series depend on this one?

Others are fine. The problem with this one is this:


-    ($dryrun cd "$collection" && $dryrun run_many $tests)
+    ($dryrun cd "$collection" && $dryrun run_many "$tests")


but run_many expects word splitting.

>
> thanks,
> -- Shuah
