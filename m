Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4993E3C60
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 17:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777917515; cv=none; b=Ye5+2+RpLonnLTJhL5+wuxJubm0yAnt+4ZNQHZeF0y24mm6FEYgDGL/AeWYhDM2cwUQPE5+hIumm4j7iv+rGEun4eFqlqurpHYe7C5uxGunegrc0d/ndvoXv8CXKsrieD9/G2rUW7WrbrUo3rZvVNV3aKhwijeV3RDEfvXdyqyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777917515; c=relaxed/simple;
	bh=kD3yc4dYnmsZzkT2YyM4BVb0HCX2pqsZW++VzilJknc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TkBfCq/3YxCu3TJpKvr9TkzLPUT0a/8TZbrD3H1nOqtNuLhZP4gAsdT/Kz0R6Bs88g10mDECGtnRFBsMeM4YajUKWmmpB7O6KnPZVQYaGnS8bOx6mceqbf+nuu6neboBWr6xVTtT3Dlg1nd5NSvOJbtNJBLE3UXaqzyObDZ68Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=RtEEUcR6; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RtEEUcR6"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-415c8a4d2e6so1924819fac.0
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 10:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777917513; x=1778522313; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GvkNuWtDFHo1rGVLS1OVrL1SOAMrPEAfIsWzXam7WRA=;
        b=RtEEUcR6y/0Q+yiA4qOB3BVrTh+awFd3q3dxqqSpYKChFpKb6XmcIztpQldT7IFMa1
         Je1k/R4NEkG+TwjXoHavQjuFlWziPVq008ulBSu+Hobci9Ejgg/IUUKBztpK3fdxUZxQ
         gq2IMLf7qY1H59yKlikYp0eJJB2oBfJAWeuKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777917513; x=1778522313;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GvkNuWtDFHo1rGVLS1OVrL1SOAMrPEAfIsWzXam7WRA=;
        b=BuPtrKkkMall3X/1CkmLuJqYxaJ2rdvKLykTPK+CGLlJ78uiCdA9kl604cX1FawqhP
         7lYCbI+yZ9PBX+wUe58mHn8fnI/+t0ocLjgfIkOwzMQw3EryhUEbdC6R/yHKm5gJTLHU
         8LWL9lL8GEKVSbt4SF36gpXJ4OxqDS0UMDJP+6friZwKXpsnG4MvXXTU2T6mFfHiAVIv
         PNRagESrE5Ji2U66u2ICd6ONaLqAj01GlZhhS0RzPj5vw9AF6eTBVkvbRd+EoFQRcH3H
         w5KA4Lgvj7zdbvJnalkhubT4UisUc8XsvE5YvHFOsAdfWY/UnQDTOnSdoASkAZvNhpfr
         OPHg==
X-Forwarded-Encrypted: i=1; AFNElJ+t7aQratMjEugeYBCJNTaVY3EgKYqrtgh6pD13HvNUnEYjv+K5cdrzVHxl2MufJMJvfGZihfuykpdMcscWDZY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsy3P7U3k8FsLtZfOMfcCDwX/EgPslAWDF3TWZ3iNe6ISRXQ6W
	9K3VeBrT9+3zvqiGfzqdZAmP/QoTbXvVmON/F6Wm/O7j7t4YzMHE015f8frZlVFnl6g=
X-Gm-Gg: AeBDieuqJmftMVtDD2ra82cbrXdWWi/j3L8M76Oj94NV8+Eg8UE+n+XMtGL7SlsjgjY
	MskohskdsmEJDFpBknVCmDfFGzAOer0uwo+MVfk3vlGcOXGimd/FCV+CmWL9GTMfbVcSLXQRhXK
	Qw3k7K7AV+EyamVOvJIT/MC1Y8cvL05EyNWyWcW1wWUku8WvpjvxeuRLPRWw1OiPAjhTXcb+jXA
	rS5u/bBiu/Q9q9zjSjKxxSYYsJlREyiUAfmmTgxW8U0ZSeXb09ouhGoMrgTlFdySFk8qxt+dxli
	hHTCe3WQGpdyRqEzCbXKbONYlfktOFm5fLc51RT/dfQANJEna7d3CnQisJmn31m96KQHS2OiIHX
	RYlWrFAio+UAnyz4nCpianIEmyZX7AHCWoNcFqwdTG3Cl7vk7aV9C4NiaTtFM2HRJ0cvA0vtCFW
	ot1VoNd7/ST1xscfBJVwVi4fURvxaeZXphMhjYGKhY5Q==
X-Received: by 2002:a05:6870:3329:b0:42c:1205:ef1 with SMTP id 586e51a60fabf-434761b92ebmr4940978fac.25.1777917512752;
        Mon, 04 May 2026 10:58:32 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43454d324a4sm11365948fac.14.2026.05.04.10.58.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 10:58:32 -0700 (PDT)
Message-ID: <234e4db0-c1be-4b91-969c-0008f058e4cb@linuxfoundation.org>
Date: Mon, 4 May 2026 11:58:31 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: kselftest: fix wrong test number in
 ksft_exit_skip
To: Sarthak Sharma <sarthak.sharma@arm.com>, shuah@kernel.org
Cc: pbonzini@redhat.com, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260427112447.147985-1-sarthak.sharma@arm.com>
 <7b424355-58bf-470f-ab5a-071ef9c5646f@linuxfoundation.org>
 <604e0c71-0517-4f5f-b127-4b58755527b9@arm.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <604e0c71-0517-4f5f-b127-4b58755527b9@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/27/26 23:10, Sarthak Sharma wrote:
> Hi Shuah!
> 
> On 4/27/26 11:14 PM, Shuah Khan wrote:
>> On 4/27/26 05:24, Sarthak Sharma wrote:
>>> ksft_exit_skip() increments ksft_xskip before printing the KTAP
>>> result. As a result, ksft_test_num() already includes the skipped
>>> test.
>>>
>>> Adding 1 to ksft_test_num() increments the printed test number
>>> again, producing an incorrect test number and wrong KTAP output.
>>>
>>> Drop the extra increment and print ksft_test_num() directly.
>>
>> I applied this patch to linux-kselftest fixes branch.
>>
>> I ran a few tests and couldn't really see the problem this patch
>> fixes with and without the patch.
>>
>> Can you send me before and after for mm or timers test runs?
> 
> Sure, this will affect the output whenever a ksft_exit_skip() is called
> after a ksft plan has been printed.
> 
> Let us look at acct_syscall test. When I run the test without root, I
> get the following output before applying the patch:
> 
> TAP version 13
> 1..1
> ok 2 # SKIP This test needs root to run!
> # 1 skipped test(s) detected. Consider enabling relevant config options
> to improve coverage.
> # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:1 error:0
> 
> where we should have observed ok 1 instead of ok 2.
> 
> When I run the test without root, after applying the patch, I get the
> corrected output:
> 
> TAP version 13
> 1..1
> ok 1 # SKIP This test needs root to run!
> # 1 skipped test(s) detected. Consider enabling relevant config options
> to improve coverage.
> # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:1 error:0
> 
> Since a lot of selftests are being formatted to give KTAP output right
> now, this patch is expected to fix a larger number of tests once that
> gets merged.
> 

Sounds good.

Thanks.
-- Shuah
