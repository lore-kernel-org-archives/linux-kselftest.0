Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2880740D56D
	for <linux-kselftest@vger.kernel.org>; Thu, 18 Jun 2026 01:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781744706; cv=none; b=ST6WnPblNUt+D2bXAqPP/jNl4PvHTKcdgLmsXWsTGuxcdDNYRbLIRk6rzEuJg2/MxfjtHZrrbbYvkD/AlXyENKL0/9ik5ALjKa3ZXXD5wAye4+H+vejXAvXk82IaYFwzdP7izkYMD3q1rGNZYfFAY8Gr7Lf+ENyiGQr6iI/E4Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781744706; c=relaxed/simple;
	bh=lP/UWIR6XD0RATLTWtMbingCRoKAeXTmwz1I63Z3kDQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qvsiSWU8AmmNuvktsBPDepj+ftKDckzsBSMlbmDpoli77dscFgFaMF8muuccWJE8m7m5V5myeK+G9CHFnjFChhjiF7EfWpwNnoB3cFBXn+7PIdRBNTsKBn/HA8lDf3cdogE61ITE1EH21pac12fZzEJOMNa5p8BZCkglG9zBASU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=idDDb4L7; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="idDDb4L7"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-69e4483cfe9so833318eaf.0
        for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 18:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781744704; x=1782349504; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DG4WfrI5uGpYpp/RrAn3uAACKhpvlfwH7HOXG2FaZec=;
        b=idDDb4L7ipCbnD0ibjAwix2SbZX0dI4x24YOG+7nA+mBV3LmZAuoB/nIGnUUSbBR4D
         JezRBF5y0utmz16ldF8D2PE3gbM3vCIxVWBZFwPrTEXMEAdpncJMMqmQvEdux9G4UYG+
         oCxn7H4eHCBRFF0+g5dUpB/0dAy9Bmf0Xhxw8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781744704; x=1782349504;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DG4WfrI5uGpYpp/RrAn3uAACKhpvlfwH7HOXG2FaZec=;
        b=gdB1A3qwzqxdNZLNruj/No0Ch1OmJaBbsczvtutuume0zW6S0oYIp3upE5Owojr1Ic
         vv0MDYoB9vg/VnvFdKLn0nRGTtKVEkSIcWx+UQiB5YzCFWcqNkOQG6pNqQqFPHI385tG
         soViUtsUzuUso0NwRzIRuLL7NHz5CoKABq1BFTN9uA0TBfg6qsnuQMwwSZawzg8dNXm3
         EGX0hbqbY38ePyoILJoBpbQT/tzDBjWLOgofvulmjhGWajfZC0s/o6qofAd52UzIB+E4
         /Pc6AMkz6oMFTwQWBPX8W4Mt3EKyDo8V2oVdDA8NiDqaqgcrTm1z7dK/r9DXUc/RmgA+
         JXvA==
X-Gm-Message-State: AOJu0Yzw/Ekr0E7kUOtiJCxbty85PvkmFF+7rmT1C7XIIafjIGyDaKwr
	n2gs3Q8tYc5ylDkdAXQz7q8UfVtAp3b7E9lg/JtNhXlKC9BvAyAJHZzxtbMr4SV0OPk=
X-Gm-Gg: Acq92OHzPah+qFApDFmv9GOtCz8Yho1FOU36QtYLqdfaiEjtEgEp8Xt5BjrbuZtpK6o
	LG2ekhnDaNTiyUe6HUTt+U/18zc9ZhlI6mm5MnoiCV7aZDAL/w45Z3uGe4xOKcFQ42ArTcOndMN
	NTqS+vPll0n3rTS5osBiQPr4NDGN+UjkTg+In9mrPPb0/dYwJ6xhmgc6Aojwr5bOCZGTKGm0PtR
	CHMyoZPijyK3hVaDcOsJydYUhlMm/cdJCk2SePO83yZ98E+g5okadHlcb+1FW0DPYrZJgpGGULR
	s7WGGCyRP9qpvVYk62Y7PXPauVtt2+4wwF1SCex/PDPjz7wzsUhADRgW6EbKBIxvolk9CConEAi
	YJiSEQ4Y7pJF5D6rlxVkFY9FxltucG9S5JKQImx1UKFiu0uRQUOgF5K3LfiCx567qdubu+dDOag
	780G0lXTwC1+VuIA361qLj
X-Received: by 2002:a05:6820:f022:b0:69e:98c0:a91 with SMTP id 006d021491bc7-6a0c744dbb1mr1461703eaf.36.1781744704016;
        Wed, 17 Jun 2026 18:05:04 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44308f09405sm5479598fac.12.2026.06.17.18.05.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 18:05:03 -0700 (PDT)
Message-ID: <20868e21-ea0d-42f7-921c-987625b4e471@linuxfoundation.org>
Date: Wed, 17 Jun 2026 19:05:02 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kselftest docs: remove reference to obsolete/archived
 wiki
To: Rafael Passos <rafael@rcpassos.me>, shuah@kernel.org, corbet@lwn.net
Cc: linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260617235740.74029-1-rafael@rcpassos.me>
 <865def83-a07e-4eba-b795-7da66e0e2d69@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <865def83-a07e-4eba-b795-7da66e0e2d69@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/17/26 19:03, Shuah Khan wrote:
> On 6/17/26 17:57, Rafael Passos wrote:
>> This link in the docs point to a wiki that is no longer active.
>>
>> The wiki was moved to archive.kernel.org, and there is a warning:
>> "OBSOLETE CONTENT This wiki has been archived and the content is
>> no longer updated."
>>
>> Signed-off-by: Rafael Passos <rafael@rcpassos.me>
>> ---
>>
>>   Documentation/dev-tools/kselftest.rst | 5 -----
>>   1 file changed, 5 deletions(-)
>>
>> diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-tools/kselftest.rst
>> index d7bfe320338c..64c0ec7428a2 100644
>> --- a/Documentation/dev-tools/kselftest.rst
>> +++ b/Documentation/dev-tools/kselftest.rst
>> @@ -15,11 +15,6 @@ able to run that test on an older kernel. Hence, it is important to keep
>>   code that can still test an older kernel and make sure it skips the test
>>   gracefully on newer releases.
>> -You can find additional information on Kselftest framework, how to
>> -write new tests using the framework on Kselftest wiki:
>> -
>> -https://kselftest.wiki.kernel.org/
>> -
>>   On some systems, hot-plug tests could hang forever waiting for cpu and
>>   memory to be ready to be offlined. A special hot-plug target is created
>>   to run the full range of hot-plug tests. In default mode, hot-plug tests run
> 
> 
> Looks good to me.
> 
> Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

Jon,

I can take this through kselftest tree as I usually do.

thanks,
-- Shuah
