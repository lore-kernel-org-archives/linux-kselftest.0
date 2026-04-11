Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F352E1E98FF
	for <linux-kselftest@vger.kernel.org>; Sat, 11 Apr 2026 12:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775911781; cv=none; b=Gq7qmB2oWCAKB88YO8JrGOAD2t3P9D/k5bkJW/+EU69/vQCVqWMH+ElNHlAM68I3ikEu/SI2dULedxqo5I4FFS/ETAheHK9ah7Ks5YZyO82m8eLRUd+jIaOpPVtARnKuoX9uKLQqJdVv0LJhy3GvGkzVK+jsvtUYHxiPFeAVrH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775911781; c=relaxed/simple;
	bh=Bmgif21JILxtKROQRrvBMcxSwdIEucVmx9w+2fEqPrs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UmnmUxpyHsoxPwgBzsMpiueezXXPUfgYSpX57WWKRAnitKtZEVmggI6qWj+nEGo+soPHzq+Fk1rGwDRDq0NXnj3qZvrjnoQTOT+Mj+qwKg0iNC79FIKqF02qXxKQ3YPFbO0/6YaCppD2WyXigGxTWieWajI9IMOn0ESCcBvEi2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=GgR3QN9v; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="GgR3QN9v"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488c2690057so27948365e9.0
        for <linux-kselftest@vger.kernel.org>; Sat, 11 Apr 2026 05:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775911777; x=1776516577; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OY+pUT3bAKsfuyssDABe7DVX4rqXH9Z4jNHxto2UUNc=;
        b=GgR3QN9vPbErrAH5zrJ75nWsmZRez/SC7JYJsX1tQrhG2WhPz4FEZDyJEVsZgF+wQn
         OYxwhUYTN1mDadGztLmGpNOR7Vu2jheneI+IgwkEMUMx4FuWEm6Bn9uOXTX3jjK+5tJN
         bZie7XiKMtt9MLleLpRweBPFlt7REeHMmaY7o5EZ7u1ueuCJpgM6caw1SO8ZUj1rvC+L
         kUUfkib8CJdgeHDtJRTpnvj8VjVo3GAZrLjGeLT/+/+huM8aRVUxcInkr6AgyJpzyLen
         9wCwFsgflGytgYgxSNQ25GrgZSsPBZ/zKz+1sYgF6xxQxOQSQ8lxTh3NaZ2w1EmjcG3U
         E7/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775911777; x=1776516577;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OY+pUT3bAKsfuyssDABe7DVX4rqXH9Z4jNHxto2UUNc=;
        b=O1mJdMs+44tc72SEPedDAhYKxLgV+Txjv5ZBFpdLn9SuLkm5l/DXyDpcFLlcOAJvt+
         aRQB71Wcb8RdlszvKeJQsP2Oobk8FRH01/YC8/BCoklssCrVxbT8QfppRV/47POMURCP
         WvEjJHaWepVtZSLlv6F1kgmtbuVTNmVf3RcjfnoLGdzBqGglDVDFD8FB+72kERovSQrd
         yk0sHTqBanDkgXf9w2fmWIncWxCkQ34Dh9ijky92BA5QpOI/vWATJimVS5YnbscMwps1
         2rz2w14k7is7HfUAUp5P2SsfstE49CXr+CXMA3/VsToqQbqojIuIVFDA7ivXOxEeUu47
         iw+g==
X-Gm-Message-State: AOJu0YwvJLfbBEr4Cw/wfa+hvia1o5KVuiN4hAPazjnvZwVPCpAYvE34
	U/cHLyzqJwDWeTDk7i05WBQVqCUftAVRH83o2J++KblDT6X1uxEN3wZRDxrqsU6BMQg=
X-Gm-Gg: AeBDievBZ50IwbOmlu1ljStlYztKlWub+o0yF5lOlMKyE5XaSuQ/NxB0F7RfL38s9nc
	Ho6pidXWda6FA/Ovqm1NkOzdzSTUi2fWnSIhmS5h4eneAtjHlRTLBOIMtCp/EEAjM/mz1XjIjT6
	uKokNM+FrLAOYFGTEzUx6bQnUQpY8lglTyCr1yaUAfDevaJZlR46yUtTRm9v+O/vOS0HsEJ4KgK
	Y/ZMYN14MKpgnl3mkfMRG41casQPp6N48OTQ/PMQWXx9ua4KBZUDSDDCcSRwerUeXsmlLlc+r+M
	ZlVqWnpUeYRnxjzytdaHJ09zWF7+TNa/HPjoC0XrTaIg2n8k6ueOadt6HnkPK4qOC/+K/zH0b/d
	ehfQQ/Zkg0N5AELTRgv9+f9+SYgxxiglGHV19odktHazvi3vMG6WARyiWcnBLp9XgQWtOhTPAuA
	/k6LCCBvArwxj/cuw5aKpL2pjbh+Jz/aRVJyL4Gr8i0iU8tfOD20uxS4az+g==
X-Received: by 2002:a05:600d:1:b0:488:8bdd:cfcc with SMTP id 5b1f17b1804b1-488d6772785mr78952175e9.0.1775911777328;
        Sat, 11 Apr 2026 05:49:37 -0700 (PDT)
Received: from ?IPV6:2804:7f0:b765:285:ce28:aaff:fe86:149c? ([2804:7f0:b765:285:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-954bf112822sm3314511241.7.2026.04.11.05.49.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Apr 2026 05:49:35 -0700 (PDT)
Message-ID: <227fd478-581e-462b-9579-afc5028abced@suse.com>
Date: Sat, 11 Apr 2026 09:49:31 -0300
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
Content-Language: en-US
From: =?UTF-8?Q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
In-Reply-To: <0db1075e-4273-4504-9c3e-1a9f35d37998@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/10/26 4:19 PM, Shuah Khan wrote:
> On 3/20/26 12:29, Ricardo B. Marlière wrote:
>> Selftests built with O= store generated files by default under
>> $(objtree)/kselftest. Those files are not removed by mrproper today, so
>> stale generated artifacts can survive across builds and be reused
>> unexpectedly.
>>
>> Add kselftest to MRPROPER_FILES, so that the default kselftest output
>> directory as part of mrproper target.
>
> Does this change remove kselftest build objects in-tree builds?
> It didn't for me - also there is kselftest directory under
> tools/selftests that has several scripts.
>
> Can you test this for in-tree builds - I would like this work
> for both.
>
> I dropped this from my next for now. This can go through kbuild
> tree.

OK! But please also drop 
https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git/commit/?h=next&id=33880424308df3c2e39fa88ea74f051205ebb7b4

Thanks!

>
>>
>> Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
>> ---
>>   Makefile | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Makefile b/Makefile
>> index c9b7bee102e8..91e6ec790a0f 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -1662,6 +1662,7 @@ MRPROPER_FILES += include/config 
>> include/generated          \
>>             debian snap tar-install PKGBUILD pacman \
>>             .config .config.old .version \
>>             Module.symvers \
>> +          kselftest \
>>             certs/signing_key.pem \
>>             certs/x509.genkey \
>>             vmlinux-gdb.py \
>>
>
> thanks,
> -- Shuah
