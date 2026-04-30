Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82CA3B7767
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 21:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777584085; cv=none; b=oqkUfbrL03Q3WQi1UkFAt7seG4ZI3eejZELPuyLdIYFx43W0/FXrsLKnQY3G8Zr9apk6PeJilPQ9XXDt731+Lh43u4t1cM3KzgBfCfC5uWxMpG0O8hVmnuaaI9Osef4A9BFA14D9eDWNlU33rmVkmlGex549VMetLfb8tHQRtF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777584085; c=relaxed/simple;
	bh=spLgIvn0NH4l49cxYbH/NFY98s5AJjP+mD6xfK1Zc/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O3DHDWnfk3utJGsmglFGGlOiKpy7ndtfgO8+GvHOE4EAVAhYyhBhNdrUnlzohREUDjyCIfCdlslJfcVOi9bRJpUV/EPOofh5LyJvuUiOTpD5PXdSeAc/C5jYJRq8s+dj4l+AH2FIW+iT+BxUpTAR4oo9/bKJuFxpImHENfOw9r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=EQ5vaj7q; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EQ5vaj7q"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7d4be94eeacso1435487a34.2
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 14:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777584081; x=1778188881; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DKXekugmcxOxqshMkbgYf6EhJCvVkmbBw/dLn2Qsiy4=;
        b=EQ5vaj7qNtZJYwb8PX/VlqcsLbduLOqcf/d5kyqO+DilIaeQrrgVHZUFkAhZJxzSwN
         Q3MNtD8eAmn+abIkCmSWR/5nDomY8YEFGd2Vhwz2iHXFoihJuTT67ITxeajn8YSF4VQn
         Vo1QliIJ9c9LGo5z7mpWSJ/6TPRnuFRH4z0YY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777584081; x=1778188881;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DKXekugmcxOxqshMkbgYf6EhJCvVkmbBw/dLn2Qsiy4=;
        b=gxVstwgQE8ObRHdJW8nKN8wTGnzTkg34A3o9TXoVz7h6S7MpeAbpbjECUoPrpFIOG0
         T1OACHQX67hAucV9gzYUJpIuhzj5809i8xissILUJMb5EZYmgZUd3LBAK7P+s22W+auW
         5ooUIwfz+KDcmLt+rhTz8WtAszJA14upCN6KUPd90w2GLEEFiEXAwo5Rx5wBqCsY+B1q
         2RDjxI+01qdfdGnJrXCnzHaHZ/lUEfv7j82beuzUXX/XOO5H0LJnUDmMVSKcxmuna2U+
         +DwnWqCQB/w6GKyZREJjolnkYG1kgmk2uRXzsVg9+Qwgf0DINUgNGv5o1FOK5zxHTcUi
         F7+Q==
X-Forwarded-Encrypted: i=1; AFNElJ9W3+UhQdmLLpK8trrDF3S6eORqDBaNIpGaErEmokNm+EPJL40xJz3y4JBE2BOuRxeZeOYDeODIiUoev5Fjyyc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeXOZAVmQMNu7hBQ6aHKBFE/zbT2iVowrKCfj1c9zqS9e/s41B
	/aZ0YGV+Jrw+nCBp54o2ianG4umTitd1ikPLWV+ApXRG/uXdmhGxnt7EUsfklhagFKU=
X-Gm-Gg: AeBDiesySm/bdt5KZ/47ALnDpYOSuo+DdXhq+kNI1ih2Wnt+/oMaU96UaN4CFbynxlI
	Nrkz6wbXnzVFhO34RN/+s6tlWwkfkMPUtKWqb7aI02jgiUP91h3XKMc6Yhm/m04kUaAthPyWS4t
	stpSMsjvwyDGdPjSyzZkPvUYN0aw94/mMO1LjM3Oct/Svn+Tk/PmU7m+iheUGt3VNk33Uu7hMpr
	w7WjQhabwVQz53p8kwn/dr+lzyPB4TnFhfZX8298q1AtN99zC4S9RgZf+YHm+VB8C+qBKa08x3K
	Wcf1JfyJ9dn+TwUuP9gjgrL+BHnFaopUbaGeaeb66vooRKHwUpjZmtykCcclto6JFdPjcpJUPB2
	X9JG+62HOWgBMNbS8d2O0z9k9rOYKYoRDWX+a/9DnSX0uKbGTpUQgaepqBt4KGnTbjSn451MW1U
	vTYRzrWO6n5sKWMfo4UgjkXG+yErA5+cgYANoMfQHTjg==
X-Received: by 2002:a05:6830:2b22:b0:7d9:7209:4378 with SMTP id 46e09a7af769-7deba2a151cmr2957885a34.17.1777584081679;
        Thu, 30 Apr 2026 14:21:21 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7decac8ef53sm713592a34.21.2026.04.30.14.21.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 14:21:21 -0700 (PDT)
Message-ID: <f5357277-bb09-4a3e-a722-24c4af4925c3@linuxfoundation.org>
Date: Thu, 30 Apr 2026 15:21:20 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] selftests: runner: Avoid spurious warning about
 missing failures file
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Yohei Kojima <yk@y-koj.net>, Shuah Khan <shuah@kernel.org>,
 Brendan Jackman <jackmanb@google.com>, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260224-kselftest-fix-failures-file-v2-1-2bfb8f5cb6a8@linutronix.de>
 <ader8C3F2uOY7ro6@desktop.y-koj.net>
 <4915db6e-5bcf-4f70-b510-693f5d5b8678@linuxfoundation.org>
 <f4a213da-7016-4d87-a93f-ea205ab05aae@linuxfoundation.org>
 <20260429131021-f3cf0fba-0944-4a58-a69c-34df628c42d7@linutronix.de>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260429131021-f3cf0fba-0944-4a58-a69c-34df628c42d7@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/29/26 05:12, Thomas Weißschuh wrote:
> On Mon, Apr 27, 2026 at 10:20:43AM -0600, Shuah Khan wrote:
>> On 4/22/26 08:51, Shuah Khan wrote:
>>> On 4/9/26 07:38, Yohei Kojima wrote:
>>>> On Tue, Feb 24, 2026 at 04:37:56PM +0100, Thomas Weißschuh wrote:
>>>>> When runner.sh is *not* executed via run_kselftest.sh, the variable
>>>>> $kselftest_failures_file does not exist. This triggers a harmless but
>>>>> annyoing warning from runner.sh if a test fails:
>>>>>
>>>>> tools/testing/selftests/kselftest/runner.sh: line 50: : No such file or directory
>>>>>
>>>>> Silence the spurious warning.
>>>>>
>>>>> Fixes: d9e6269e3303 ("selftests/run_kselftest.sh: exit with error if tests fail")
>>>>> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
>>>>> Reviewed-By: Brendan Jackman <jackmanb@google.com>
>>>>
>>>> Hi all,
>>>>
>>>> It seems this patch hasn't been picked up yet, although it already got
>>>> reviewed by Brendan. This bug is also mentioned by a netdev maintainer
>>>> and several developers [1], so I think it would be nice to have this
>>>> patch merged.
>>>>
>>>> [1]: https://lore.kernel.org/lkml/20260112135326.7ce71119@kernel.org/
>>>>
>>>> I confirmed that it still applies to 7.0-rc7. I also tested it by adding
>>>> a failing test to net and namespaces selftests, and confirmed that the
>>>> error disappeared.
>>>>
>>>> Tested-by: Yohei Kojima <yk@y-koj.net>
>>>>
>>>
>>> Sorry for the delay.
>>>
>>> It disappeared in my Inbox - I will pick this up for Linux 7.1-rc2
>>
>> Please rebase on Linux 7.1-rc1 and send it to me?
> 
> This actually doesn't seem to be necessary anymore since commit 2964f6b816c2
> ("selftests: Use ktap helpers for runner.sh"). So let's drop it.
> 
> 


Thanks for confirming.

-- Shuah

