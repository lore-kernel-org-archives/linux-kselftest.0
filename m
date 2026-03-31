Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3545389DF3
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 20:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774990312; cv=none; b=mhyf2n/+tQ6ByMLigo6AuoVY4a4A+Yn8M/lEbJZ5linO+p50c1dCzaqSuViuO9M0pWhdmmf2KGC9R29j8Vughx8rc7pf6DiEn/kRHu8VrbW4dhDkPMycc6nF4jikBIU5xCVv68tkRRQYdGT2lc6KIghSWEESa2UKQmkqLC+d9yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774990312; c=relaxed/simple;
	bh=BCBKSZPgsnAvDjCkRqWar0h4C1Ove21C+k5VGe7NiAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=InchDpvlItnDNHE0qRB0CJGQ6O8KWlFM/r7iD5g0sNfEDbw+e8257i6w1A/BrqwbJD4FnI7PcyqEfapYO19oYf0wSf9Giv4EyTEhvpe43oItcVXN394j+G1y2v3K65ghAg02bn9k80Om9eiUKhR1RczwJTkvhepboYCMcQJF1SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AVi788HZ; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AVi788HZ"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-4042fe53946so2440358fac.3
        for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 13:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1774990310; x=1775595110; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VPxujRuDJNBuq85g1+QT32s/1EHULkgoYUEENR2udqE=;
        b=AVi788HZmEjtpsq1GAzi+q7nB8LFJHTAAFPe1QmA89KPzlVLXcwBRfKM6ZVzuuOMe+
         L2BrWiNfeVV5m+qmhjnC+stDrArbDAs299HrSLeT3AkcLzeo6qRyuLv1X5eB8Eu7HhI+
         TBWvi2C5O/ICnFWqlN+4EzU9ZM0tFKpX6VDBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774990310; x=1775595110;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VPxujRuDJNBuq85g1+QT32s/1EHULkgoYUEENR2udqE=;
        b=PoFTn6MKQpuV4xGI4hacv/6cMPAr80txFdj61IeQLTlBe6ARInqlvDK33Q1+1NaZEZ
         qZXwoKs47zYeK6nGSLEOwhCk7Rj3rf4a649LuOsD7/YFL/opEPzbxpw82CS08lM9Z5IR
         B7ACok/CTbuFPdndwOzRqIX6eaau+F6lfuRhcKr+9cS2oIo8W8hR/MwYsyG78Afwuk7i
         OoDe/3HDck3c9s2iZd1Oar4yM/MLz2/mWqgeeLPrIarMBgOBIdLtCWnjBDfsPrXP+hUO
         Xv4F3Q2LgJ3PDrTklB+1fiq1ajBWYpTZpgSmvV9IUpixabCxrTP1Rg59Tm/Mpm+o4fjx
         utOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWo7uL9Xv29AcVZpx1LbZpYI/9qdEbjn3hwQfZgcwuSD+fud3ruWLrsyXDy5uHWqX4Rh+V1PPr1X1dljR3BT+w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDFJINprZyXviT2eQjh+kjjhzTsLOjFfSwyfkwd29/NeXQSoE/
	B/X9LkUF+2z57yphw4HDac3+srBPaWwj7x5zFk/dx8AjFVJ1M9/ZzwEeaEMftJinbN8=
X-Gm-Gg: ATEYQzzK8F82EydU2VFGmcmGcprN62Qm5K0FxYBbq5iJ3Z3vB/0Kpy71VnH7luVLTK7
	Sf/khyjrVbNhIWmeQe9m3Uu8n5Dtao/Puz/4MSSa5RENgi0LM4b5ImQbiRUlvxdsjHtMqJUK5XG
	uftHdRKR4tfC2Hdn5dN39d0q6KdxUwv0FHXJICJL0EM5wE8DChZgkWXRIq3qgqd3rY0z+ZGvIEO
	syeP/kFdemrEDjIcuc0JcUWk9SfiaUG0IH66ufVJnrRPYG2WGqb6J+nO266VGCBgzSUsN/FfISN
	lb8IS+AaO9oviJm80phUPNrFj4r5RP2mhPomg8GbaehtsQtiBpXIqNoKkbICNF2JF3KGEFGBchq
	9f2qA15Hg2UGj1rYwNCRcvkIy9XOq12P6SJlzneAkHP+uvRK9Cgw/aXYnWIJj0mVIJKgb7F8hJ9
	xW0hrsigaLoWPWmoPilKoe+xVSAWRWYtW747s=
X-Received: by 2002:a05:6870:9e85:b0:417:2a17:285 with SMTP id 586e51a60fabf-422cfeb90d6mr707537fac.30.1774990309601;
        Tue, 31 Mar 2026 13:51:49 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41d04c88da4sm7412825fac.12.2026.03.31.13.51.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 13:51:49 -0700 (PDT)
Message-ID: <014b54f0-c4a6-40f2-afd0-0ea3e2f796e4@linuxfoundation.org>
Date: Tue, 31 Mar 2026 14:51:48 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv3] selftests: Use ktap helpers for runner.sh
To: Hangbin Liu <liuhangbin@gmail.com>, linux-kselftest@vger.kernel.org
Cc: Shuah Khan <shuah@kernel.org>, Brendan Jackman <jackmanb@google.com>,
 netdev@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20260225010833.11301-1-liuhangbin@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260225010833.11301-1-liuhangbin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/24/26 18:08, Hangbin Liu wrote:
> Instead of manually writing ktap messages, we should use the formal
> ktap helpers in runner.sh. Brendan did some work in d9e6269e3303
> ("selftests/run_kselftest.sh: exit with error if tests fail") to make
> run_kselftest.sh exit with the correct return value. However, the output
> does not include the total results, such as how many tests passed or failed.
> 
> Let’s convert all manually printed messages in runner.sh to use the
> formal ktap helpers. Here are what I changed:
> 
>    1. Move TAP header from runner.sh to run_kselftest.sh, since run_kselftest.sh
>       is the only caller of run_many().
>    2. In run_kselftest.sh, call run_many() in main process to count the
>       pass/fail numbers.
>    3. In run_kselftest.sh, do not generate kselftest_failures_file. Just
>       use ktap_print_totals to report the result.
>    4. In runner.sh run_one(), get the return value and use ktap helpers for
>       all pass/fail reporting. This allows counting pass/fail numbers in the
>       main process.
>    5. In runner.sh run_in_netns(), also return the correct rc, so we can
>       count results during wait.
> 
> After the change, the printed result looks like:
> 
>    not ok 4 4 selftests: clone3: clone3_cap_checkpoint_restore # exit=1
>    # Totals: pass:3 fail:1 xfail:0 xpass:0 skip:0 error:0
> 
>    ]# echo $?
>    1
> 
> Tested-by: Brendan Jackman <jackmanb@google.com>
> Signed-off-by: Hangbin Liu <liuhangbin@gmail.com>
> ---
> 

Applied to linux-kselftest next for Linux 7.1-rc1

I had to fix commit description and long lines in change log.
In the future make sure to run checkpatch to catch errors
related to commit descriptions.

thanks,
-- Shuah
