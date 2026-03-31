Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA1F4611C6
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 22:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774997032; cv=none; b=NBuK41hVt/KLRMyuV8Cv2MAOLsRN+4KdRh4vGRvlLrAe/ee5w5KobyCqV2ImdYIAOsy4to3ZIM2ltGLzo69ex+MI10y9pXLjRTfS2Dd/7rrAV1xmgP3Jwc0AcFxH1ebBytj5FAG2s27Ey27JtvkYHqGzqxERFJQpFrOUjAkNVmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774997032; c=relaxed/simple;
	bh=S+ES5LZ7FQDM+VkrFKzMsHCH8Fyi24/km08w7v9MYHA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fss7Brg22RhcKnivgCjwlu/pIoSqlPyK7JlNdo7ALW1F3APAc+Z4DzTZ/T/SMAQKFY1uGC46KZPIaNjr0M4OR1A0WWR4Y6hPgRayOj2h52UKVDFlNS8lw566D7j84PBr/BJEIIpOFv6bbqV/QIQoArrtbfTANi9ZqLlNPWpr0pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=EJ8Uw6Wn; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EJ8Uw6Wn"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-40423dbe98bso2446609fac.2
        for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 15:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1774997027; x=1775601827; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y0zFm/wafzYDhWoYf0yG73YRDkA8Xiy0LAp1YWtwYV0=;
        b=EJ8Uw6Wn8rfyYfwSqcJTDAUZa6jlUq5bJZCL3LipSFRbp4v1tozf9pjRs/4/+UllM8
         Q5Scg2YdtqIL2SyoH9zguFcrzNj7JA7vbChGFKzfWM1418QAorYTR0Fu5i2tInGwHqvo
         igDzcTbLrUGfLOsp3QcUIcNuVuEM6xTLhD3tQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774997027; x=1775601827;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y0zFm/wafzYDhWoYf0yG73YRDkA8Xiy0LAp1YWtwYV0=;
        b=ra4nz7RwO7WrLmdrXxSXBlyTilsOK/dSQgjjlTzsPzKlgI4Cei7un3N95g6xXWC25M
         Vi/TTQ7+WWLwuyqwLTV44jprubG+BekLUD2EgW7eEsDAUdymwNvObmZW8X6u9voh1hJd
         v5oV04qMEQvIoDB+bbjJ+C6fxpN97hlgFcTIlMvBB1RBVFhPYE57fMt2/A06YRA13T4p
         sskeo4AxqBkYV8FW54vRM4R2+0DSQQmDrAh3REQUmHrUicfbHTWU+HojY78OdkUx8xm3
         Xj8W54RxePehjPT1He3goJYzihdCkEVQ8BfEmAHv9OnSRefmlwB7KTtjEqEx4KQnu9rX
         n+5Q==
X-Gm-Message-State: AOJu0Yy6xna07ElUAuGCU2hkeuXID2+Ro5Qjt08ssySDkEELoN4Nk/Ol
	b7GcyIawPhfXCCgysuIGGXYbR5YwxF4PYP1rFS5NNB10PsKutu5NZu5kay9QT8vj62k=
X-Gm-Gg: ATEYQzxdkhUHAJhmLCEJcV/JPrmhUmQ2siDZRJZIr1hxJnp0d/u0HFg38JHEG0qL/+c
	ahzrT/jSU0dBh7AZbpXRT50kaiWr3+n/XEmjlvRGssT/5YsPn62qr/QC44ncvuGId9s9bR4merJ
	uPQpJgC5TzWmvWuM55OB2aZbKoJbfMqaw3nN6Er5oRTdIZwKazjBvWqWfr7cA71cVdxMx1cjOVy
	PbcvvkM6geqpQjmgTlb/j/moCABukfJg5t3DM1R9vLWCLuhwPWETvXNll1KZOiXMe3Q8NAZn4IE
	VzsEPjYB3fCOWxkuYLvFhYzUWFbdR7h74o93fEF6obGxfv9ECIFclKa1Lt3oXTjxcRa8Y1VJILh
	SLd70hyZFEuQ7xE13J8QTfIIW74cK2hZyvj2AYY/M9UE5aOb2vS8Vyat/y/uxmMmyeCJVWfdwoW
	ERq++19QUAZEMVcngnnvwvH+dja13W/Eqq/gs3yh+ON/milg==
X-Received: by 2002:a05:6871:823:b0:417:2daf:6aa1 with SMTP id 586e51a60fabf-422cff4ad74mr935250fac.37.1774997026944;
        Tue, 31 Mar 2026 15:43:46 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41d04d95bcasm8422610fac.17.2026.03.31.15.43.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 15:43:46 -0700 (PDT)
Message-ID: <b01d1156-2213-4051-9f98-60e74d18e2a6@linuxfoundation.org>
Date: Tue, 31 Mar 2026 16:43:45 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] selftests: run_kselftest.sh cleanup and fixes
To: =?UTF-8?Q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>,
 Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20260320-selftests-fixes-v1-0-79144f76be01@suse.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260320-selftests-fixes-v1-0-79144f76be01@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/20/26 12:29, Ricardo B. Marlière wrote:
> Hi Shuah,
> 
> Please consider merging the following patches. They are mostly small fixes
> to run_kselftest.sh, plus one feature: adding the option of passing a
> directory to the "-p --per-test-log" argument.
> 
> There is a small corner case spotted in tools/testing/selftests/Makefile
> regarding failing sub-targets, and also the removal of the default install
> directory for out of tree builds in the top-level Makefile.
> 
> Thank you!
> 
> Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
> ---
> Ricardo B. Marlière (6):
>        selftests/run_kselftest.sh: Remove unused $ROOT
>        selftests/run_kselftest.sh: Add missing quotes
>        selftests/run_kselftest.sh: Resolve BASE_DIR with pwd -P
>        selftests/run_kselftest.sh: Allow choosing per-test log directory
>        selftests: Preserve subtarget failures in all/install
>        kbuild: remove kselftest output in mrproper
> 
>   Makefile                                    |  1 +
>   tools/testing/selftests/Makefile            |  8 ++---
>   tools/testing/selftests/kselftest/runner.sh |  3 +-
>   tools/testing/selftests/run_kselftest.sh    | 46 +++++++++++++++++++++--------
>   4 files changed, 40 insertions(+), 18 deletions(-)

Thank you Ricardo. I applied the series to linux_kselftest next

I had to fix a minor merge conflict when I applied patch v2.
Please check to see if everything looks sane.

thanks,
-- Shuah
