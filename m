Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9489D21ABC9
	for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 02:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778465211; cv=none; b=eBWH/xcywgARqriRAcYC7NY9FBVAALSkhtBisyOBe59FqTJ8xWTdY0ZhRZFGigITFCqDKhMy/tl++FKa1r5IWg059qqowrWTizZVoTNuhqjfekNyptOdXpciqMi+XKOq92XpWdm72B37RpmvzfDlgekYxJWda6KF5XBNvMDzscI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778465211; c=relaxed/simple;
	bh=3Fgb33ulT0SoxvsyLHShMrDo4Z5bDVk0MGTDxGndSmE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eTIgm03ScPc9te71aZpbc70q+qrctEcsMlaz+FaTTt/vpT66vlu4F1EyeZHDPqVdF09Om0DUwGDkvqoHEtbgy63n5VVKDC5C356l+TZHVceC/VjZgw/Dk7hFecmqxvJgiDbC8g1QbqKFErzPRp/RJmG92hk4IQ7DU6eNA7sQcZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PIcY808h; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PIcY808h"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-2b788a98557so27638935ad.2
        for <linux-kselftest@vger.kernel.org>; Sun, 10 May 2026 19:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778465210; x=1779070010; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YUvosZ09yddchp9wYhlE3KGFQdvsqe92JMeqa7iwdSA=;
        b=PIcY808hlxYSutIPi/Z0JzKF+di0kiTYtlK6/i0G5K/69dIY16Xco46JblZ99PaZaC
         gGArtj4WSKI5E0yhFjYZOLfNDtqdtS8oAh578DWScR6olUH3qdRDkujwDDMxFLU/ENG+
         7N163rAFmWkz+1GQjh3hSTZ7ZqXTIOuuf4FjdJ6fjNy6B980sOkVFCjSMhlIGzNVUuF3
         zOcDL1WyezrxHeNyX1QK6t65F30rUrDiutAcsNpTR2aKRgF/1MV3hYjOA4zW/piOD1pV
         ub4Qi78a5WRBaPLUYBgnSip3hDMZWSXQPe/mLxS/QBvWxrxV1/n9vfjxk0WppWCSFCsU
         YXlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778465210; x=1779070010;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YUvosZ09yddchp9wYhlE3KGFQdvsqe92JMeqa7iwdSA=;
        b=qf/HKh29e010/N475zfekcMvfuXEhpsRuhcZRcwzvYTg/fPJ8Hgdxf5yAMr/rt2K/o
         KLtBCLE4YnqjZtidkSfyU6C7nsbY3llV91SQwBJ/ZnxII2EQ3m66kbHFA9GTbs7dGSNn
         g4x7idQ7bYcrDlmz7f4W+zygg/IjWQ//KBwz60ab1UPxWJJuyZIxxBYDLHTHshNXZDbQ
         ysrXiGwBTVfYv0z/+SN2id8HCLXq40tAoQgx845hRX0z1vTXZp8u9kpmPk+Ltu9Tmae5
         lRv7aowhTW5qaltE634rrHxVTYIhWR3E5NEesfR3PmaVrQQm2+dDSdcoDoWz2fds+i5k
         V9qA==
X-Forwarded-Encrypted: i=1; AFNElJ8a//emBYeCtavr7cB78o3KhJIXonDV/QRY0KRwxyFQZlOeTe4LCy7uBSRDgDAThemP/Ar9uEXAxy7W/6C3Fx4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfmvxN+VXAwvVkBqhsNfPOBobv6snLcAo1chSmtMnVxuT/yCTb
	8wzjRU1Xc2cYGKOd/6Wb6Mio0ndguDoGAfnXmTZLpaEvWpgqfDy4wd8t
X-Gm-Gg: Acq92OEme5JksPsOv79sMdTeSZI0hJgyV4Yhv3Ov7hwHFviASP35qCCukwcC7T/W+Uz
	x5x2G1HotN2vSz6bh4GF618ZvkpjG6IFzSTDbKnYQY1t4s4vUgJNv+Dyqy06J9bycaX39KZN8TS
	1Th3SNgFZVXp4jsM2P8YcnnXWFcb7O3ypiXIBC70OfmmovjxOPdWItDRzcLolel1KDfFIcAMNb7
	hPelzpCKgPpbJCf5TcKtnTbANpF+BUUvbkaqHOkAENJHj3puxqeYLTGGdz4hTxR6/0ABtr4TAxj
	TxBY841Slo1tL4CtjJ6T40/6OFdCTlQqoPz95s4gnvPirVRL7EElPtxAvOalgDBBgItKbcplRyx
	qmGtMszQzKvnKgqXMg4qX7zeq1EpkPIALNRZ7MXAcReu/kmtHGchNUc19t/3+DDVdY+GOdANiU4
	nsZfN4+F7ISJN7HSZw2tFXf7KjEW3lSPE=
X-Received: by 2002:a17:902:70ca:b0:2bc:dd58:3dc5 with SMTP id d9443c01a7336-2bcdd584272mr3255495ad.7.1778465209728;
        Sun, 10 May 2026 19:06:49 -0700 (PDT)
Received: from [10.125.112.20] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e35ba2sm89530205ad.50.2026.05.10.19.06.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 May 2026 19:06:49 -0700 (PDT)
Message-ID: <8aa6374e-7bfe-47a4-be8e-8a4ea1cc58fe@gmail.com>
Date: Mon, 11 May 2026 10:06:43 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] mm/khugepaged: fix sub-PMD MADV_COLLAPSE range
 handling
To: Lance Yang <lance.yang@linux.dev>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 shuah@kernel.org, zokeefe@google.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org
References: <20260507070558.3064142-1-chenwandun@lixiang.com>
 <20260509094732.83643-1-lance.yang@linux.dev>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <20260509094732.83643-1-lance.yang@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/9/26 17:47, Lance Yang wrote:
> Hi,
>
> scripts/get_maintainer.pl is your friend :)
> Please use it to Cc the relevant maintainers and reviewers next time.
Many thanks for your kind reminder :)
I will do it next time.

Best regards,
Wandun
>
> Cheers, Lance
>
> On Thu, May 07, 2026 at 03:05:56PM +0800, Chen Wandun wrote:
>> madvise_collapse() computes a THP-aligned window from the caller's range:
>>
>>   hstart = (start + ~HPAGE_PMD_MASK) & HPAGE_PMD_MASK  /* round up  */
>>   hend   =  end   &  HPAGE_PMD_MASK                    /* round down */
>>
>> When the caller's range is smaller than one PMD (2 MiB) and/or not
>> PMD-aligned, hstart can end up greater than hend.  In that case the
>> collapsing loop is correctly skipped, but the return value was computed
>> as ((hend - hstart) >> HPAGE_PMD_SHIFT): with hstart > hend the
>> subtraction wraps unsigned, producing a huge value, the comparison
>> "thps != 0" fires, and -EINVAL is returned instead of 0.
>>
>> A concrete example:
>>
>>   /* both cover less than one THP; both should return 0 */
>>   madvise(aligned, PAGE_SIZE, MADV_COLLAPSE);             /* OK, returns 0 */
>>   madvise(aligned + PAGE_SIZE, PAGE_SIZE, MADV_COLLAPSE); /* returns -EINVAL */
>>
>> The fix moves the hstart/hend calculation before kmalloc_obj() and
>> returns 0 early when hstart >= hend.  This also avoids the kmalloc,
>> mmgrab(), and lru_add_drain_all() calls for ranges that trivially
>> contain no PMD window.  The same effect could be achieved by only
>> guarding the final return expression, but early-return keeps the
>> no-op path free of the allocator and drain overhead.
>>
>> Patch 1 fixes the kernel bug.
>> Patch 2 adds a selftest with two cases covering the hstart == hend
>> (aligned, was already correct) and hstart > hend (unaligned, was
>> broken) scenarios.
>>
>> Chen Wandun (2):
>>   mm/khugepaged: fix spurious -EINVAL from sub-PMD MADV_COLLAPSE range
>>   selftests/mm: add MADV_COLLAPSE sub-PMD range tests
>>
>> mm/khugepaged.c                               |   9 +-
>> tools/testing/selftests/mm/.gitignore         |   1 +
>> tools/testing/selftests/mm/Makefile           |   2 +
>> .../selftests/mm/ksft_madv_collapse.sh        |   4 +
>> .../selftests/mm/madv_collapse_range.c        | 141 ++++++++++++++++++
>> tools/testing/selftests/mm/run_vmtests.sh     |   5 +
>> 6 files changed, 159 insertions(+), 3 deletions(-)
>> create mode 100755 tools/testing/selftests/mm/ksft_madv_collapse.sh
>> create mode 100644 tools/testing/selftests/mm/madv_collapse_range.c
>>
>> -- 
>> 2.43.0
>>
>>

