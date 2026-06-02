Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B358381B0F
	for <linux-kselftest@vger.kernel.org>; Tue,  2 Jun 2026 09:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780393880; cv=none; b=Rnuk4VWT5NoTgLBNdTsAxSCWL2WoKqoD0B6K67jEdTJ3oHe7CNGxUqgEq8VPwpP6cRMOvDtvQfGwsi1fAIOc/RaXNRpP8RHVehD6RXRgsktgcZrPyrN6SuTgPlMRDkB3nn7Aj++tVeHuFqpXkp7tpZ5qxqHVRac0DgPbx3SACho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780393880; c=relaxed/simple;
	bh=s90tIkVELqPNklaSpd1QLSvIpuysPB/xLBc1sF9f4iI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Egdo5jODmuyWkpvYfHO30SaGRueIbeVINfn4S4XvzbBpAzT0n6/KFc5FVbvwdidp04+qswdhnKNwTfQHvBCG1ZP6a2sMeABc6yEaKrBN8K2QO8kccCQRv2PCuGqG/okaHfio4xH+UFSO+1+ym882kQSP8O9DP048YfKGMea8IwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h5c9sE/O; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=muh7+qeS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h5c9sE/O";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="muh7+qeS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780393876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4FjL7duM8l41Z0v7GZVkKWyzIqulBaKY/N2An1qwlL4=;
	b=h5c9sE/OZjr/DwO/+Re7UZ8UeEhzp4iQsPZUG+kOkBSAtq3+3KwpYxHu7LMZ53m0XABiLv
	z25kkxDUj2UxQmN07eDdDlu8fQgse6CGwNBLuHMhpicBDS1KgOMxUtn1dWdsht9bWxTNgd
	hkECWOKdwVRLYL35rtu0BXXRCgEVgak=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-MF2jjYWLMfG1w-SIrlDUJQ-1; Tue, 02 Jun 2026 05:51:15 -0400
X-MC-Unique: MF2jjYWLMfG1w-SIrlDUJQ-1
X-Mimecast-MFC-AGG-ID: MF2jjYWLMfG1w-SIrlDUJQ_1780393874
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-490a763180bso21591495e9.0
        for <linux-kselftest@vger.kernel.org>; Tue, 02 Jun 2026 02:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780393874; x=1780998674; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4FjL7duM8l41Z0v7GZVkKWyzIqulBaKY/N2An1qwlL4=;
        b=muh7+qeSE0WgYG9GrBXdkuBhOjHlmYS2Lanh/VEPft5eWUHlPtUcj8/7rXNQpk+N0F
         VZHSer7eIHOVdTXArcgzg4AJjGjB1mMT2dlT1omBF4by7T86R15afKzdLx/TyQh3mZHI
         dbARauwo4swRth2lXAxyugNz0wOTyPlLnnE9GWCyIdu1GYk+ctYYLsK63NX/6vxPY1/E
         W/T4hSZnxIzv03uk5dZM3V9DYsIWgQeqsE10tWY/twIOX33PyXMYWaeMYJDZjVIGjupY
         lr7tjK7QotsXg+VUMm3uZR+iBNvmEZRNYRqiZwHvln3ktNZbW4lC4iL5dTOy7H6ZzzMc
         b+Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780393874; x=1780998674;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4FjL7duM8l41Z0v7GZVkKWyzIqulBaKY/N2An1qwlL4=;
        b=pntjZ2kRMBjpoQMr5YaouOGvjlRBRhZHeWF8xgk6S9Evw2pb0L5beIlhm4gMCC9Ud+
         fqoG60kiUdt+lwf/2oxsp+4YnNoPvtBDB/akrlDDFyy216Cfwuy4lPb31VyZxNS2LRyE
         ZtUBK+ZxnRbEm8bv+ZLDjJkFNtWtmVz3Xqr1JQ6DiqgFn5g1XkrATkoizZXERHVbORiq
         fZYjRerx19ZMK/IxjoDaxwRYInTPVGuku10J9SqB5V7EdkIXEGzqjC1CHenWmrMdworP
         d9wWRde4p6HGQPaWlEo7ZqIEOZpma9uXoax+fxs3a277mn1CNmRTNq0A3ViR34MSTFPA
         HrvQ==
X-Forwarded-Encrypted: i=1; AFNElJ9AbSkT2VJ93swFtmVK7nXBpzH6tO1M9BKtr+okqBMRNhh9ayjB9q9GKTULuRwY8WyCejx3mPujBmpITQwhR0w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzViV/IFBStSnWa3CvRtBSuXpQqnQOmRS37ayda6iwbHSHEoyov
	tYZNRfafkZwCOqE2sWOHtI7Z9XiM/+6EpxnXNnrvdKABImDH/8OsaQEEEtdEW244ewkgLPolqWI
	c8BnPcZ+hsBNBRvCsDoFJh3vWrJlrenxBxSsQqP10z4VlTT+XN12D02l2WJ3+5BxbBd2cCg==
X-Gm-Gg: Acq92OE588+ad4Fg/MKH4k1xWzbkF4g5LW5xjhg0XjoUahcBRWFaGqr0feXc64kRDDU
	p1xEAuvr4IlAf/oIvSYVbVz1ajn+fXA+FuDZCpE24pOnLLiVaaK8xms410Y2rCHGqeZDuG+yNz7
	+G7ZTRcisNJuKYqL73Djn903BJX0gpKHcJ1xZzXlmjjtXv7k96Xx52PXw3JqoYSGIsadACcEvuq
	qRcBjeVm2AkGRMFLfUL/SCYoW7g64NynCghbzWeWyVNpEDHKHtmF6gO9WpTuD9xCxZzH0Rga7Ny
	xUymvuyukbS/deoW1FwTgW7pxJaZ1lzwwiUZL6m/S7gun+bpH383kKKnJhgtwBGz81PWE/96uzk
	Cfk+54tG9LEM55FTsZW1ifpEiKvj+u8REIIlPGw==
X-Received: by 2002:a05:600c:c098:b0:489:1c32:210d with SMTP id 5b1f17b1804b1-490a2923cbbmr221352715e9.15.1780393873899;
        Tue, 02 Jun 2026 02:51:13 -0700 (PDT)
X-Received: by 2002:a05:600c:c098:b0:489:1c32:210d with SMTP id 5b1f17b1804b1-490a2923cbbmr221352355e9.15.1780393873517;
        Tue, 02 Jun 2026 02:51:13 -0700 (PDT)
Received: from [10.202.148.228] ([213.175.37.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e20bacsm53554265e9.6.2026.06.02.02.51.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 02:51:13 -0700 (PDT)
Message-ID: <939aae44-5901-4f2d-99c8-ad9bd5173f0f@redhat.com>
Date: Tue, 2 Jun 2026 11:51:11 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/bpf: Page out as late a possible in file_reader
To: Shung-Hsi Yu <shung-hsi.yu@suse.com>
Cc: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>, bpf@vger.kernel.org,
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Mykyta Yatsenko <yatsenko@meta.com>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260420134637.2513867-1-jmarchan@redhat.com>
 <f02fd939-85f7-414a-8b03-a9ebe56c7660@gmail.com>
 <836b0ce8-f427-434f-984b-4fc60b02c810@redhat.com> <ah6g7JSYOWGp2oAG@u94a>
Content-Language: en-US
From: Jerome Marchand <jmarchan@redhat.com>
In-Reply-To: <ah6g7JSYOWGp2oAG@u94a>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/06/2026 11:26, Shung-Hsi Yu wrote:
> On Tue, Apr 21, 2026 at 07:59:08AM +0200, Jerome Marchand wrote:
>> On 4/20/26 6:52 PM, Mykyta Yatsenko wrote:
>>> On 4/20/26 2:46 PM, Jerome Marchand wrote:
>>>> The file_reader/on_open_expect_fault fails consistently on my system.
>>>> It expects a page fault on first dynptr read of some range the exe
>>>> file of the current process because it has paged out that page range
>>>> earlier. However a lot can happen to that range (which depending on
>>>> the actual memory layout could contain text section, data section,
>>>> sections )related to dynamic linking...) between the moment it was
>>>> paged out and the moment the bpf program expected to hit a pagefault
>>>> actually run.
>>>>
>>>> A bit of instrumentation with mincore() shows that pages from that
>>>> range were accessed several times before the program is run. In
>>>> particular the call of file_reader__load() seems to fault all the
>>>> range in.
>>>>
>>>> Move the call to madvise(MADV_PAGEOUT) to just before attaching the
>>>> program to minimize the risk of having those page pulled back in from
>>>> under our feet.
>>>>
>>>> Signed-off-by: Jerome Marchand <jmarchan@redhat.com>
>>>> ---
>>>
>>> Thank you for the patch, the change looks good. Does it fail
>>> consistently on 4K page size?
>>
>> It did when I ran the test manually. On our automated testing system, it
>> failed intermittently.
> 
> On my fork of BPF CI the test was failing[1] consistently, even when
> this commit is applied. However I wasn't able to reproduce locally on my
> laptop when I ran manually.
> 
> Any hints regarding where to look and how to reproduce?

To investigate the failure I witnessed I instrumented the test with some 
calls to mincore(). You can do that to see whether madvise(PAGEOUT) 
didn't successfully paged out those pages, or if they were paged back in 
by the MM subsystem. I'm afraid that this test isn't very robust: the MM 
subsystem is the one that ultimately decides which pages are in or out 
and it might not work in the way that this test assumes.

Thanks,
Jerome

> 
> Thanks,
> Shung-Hsi
> 
> 1: https://github.com/shunghsiyu/libbpf/actions/runs/26807198259/job/79027625188
> 
> ...
> 

