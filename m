Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FEF0403E85
	for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 15:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779203749; cv=none; b=fT8VDzOuMlQu1tFVy3H+Xxv+/wC1J4rrSFOu0EFTfm/s2JNv8lpqi3tuGb/rQcasfFjK0ieX5Zrn0Bp4Zv+pdm8cHVOJOJ6AoE3dUfcKwPByRuvcybK7GIkX/xnPRguPtbiI31o9t6l5o9MVcYjX20FVRoSa8hxT1LXiAUe9vhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779203749; c=relaxed/simple;
	bh=SNNvpQQuPVQMvp44GkMMtPNiqpHye4xFnZSe12UszYw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TNBYuHJsVBOkPivR5eUMABas834/MNnw+1gnQtyykoJ97nxEMbKNTfqDoqWQm7B6AVxo2c0IeuJRuuXvqDZrc32FSqkqWB9rEYPbPcz8PeLsv+N72+T7d0TFXJG93j7y/6ff1mYgwh87aqKJhDBd7dPM2XCYTTjd4ytZ8HFsr3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=szuAxYan; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="szuAxYan"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-45297094718so2874703f8f.3
        for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 08:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779203746; x=1779808546; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BdiflLEoOIW6130918XzLUR22FM/UxzpgmqRMxrhy/I=;
        b=szuAxYanJnRbJP7a+0A3VbyKLZhktq0QsWpb/pPSV/mefNbBU5UXjjjKABMfRdeMPY
         CirvF4RxlYYYh7AWiWspkr1ZCWc49zfqmTsxg5FHwkvxRgKVapFXlNKrF7eayWH0LKEy
         EqbhjC1e0F28K1xWyRoyPg0fqtF11iLN+g1P8TvX7QMpFIohkQAsoJuea4cFvOA2THFo
         IUYrk/eZo7nybZCl1wPCW8Xf90J4SZd7MiasJKGZvH9vO0mc1Li5TZyhFboOmCJatUWS
         3urWG8r1baH8ToqNVgliwBmhE7ipiG7SNSO4W5CU9EJKzeV/J2yvZ/fgNEeLQjRHDVmI
         H6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779203746; x=1779808546;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BdiflLEoOIW6130918XzLUR22FM/UxzpgmqRMxrhy/I=;
        b=kCAGyOJWp5hlPocHrkieT+sJ8mnxt+5Q/rRz/phmUUZ1R6+FEqI9z5TKfBJVYtmxUU
         6BTnD0DWnPXaPasrmuZWncWcynq1DKm6ywuogCyyB9SJhhTObpJ0VXA+ju9vhBv+8w3/
         FZsW3kRm8AWEB8XRG7V42/eUPdixeOAmQutPiRYTXAL6XouWDTvBQNi8DVCYZcmyCvCq
         payXRXJPTskVCLQvsQ6dkydn4erfoIWyoQCEzLE9RkwkaG0OmNGZE9OAOyMT/GBmDQbZ
         XUGcI4svBHmDYPUG21sNQHOUtFLKiWuhnzkxmEnQenhZqEC0Dg0oTHxdq4r6GMBq5QWn
         eRPg==
X-Forwarded-Encrypted: i=1; AFNElJ/bUFYlCSOmQPOGCtIMpmw8gb7ltHbem+qAIhWzU8GeGW/mPl4RRCsIrA9iqz5mIt/NCydCK670yHKopYJ7MWw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIzMkFCtk610aeklOAIGfon3co8fbUm1SlbUMCZVaWQ2fBOFVW
	DzOJmA6LcX+kxESWJz4gsn74eCnMeq/O2LVbXFw53nbA4/tTDHCDLv8T
X-Gm-Gg: Acq92OGdV/lgT7x+h41kmm8tg9ZnCIPdKmx4VyKi0Vdp1X25FDLRU15vG9xF4pTTmfB
	B/sSqQ2sYcPbAi3m8sFPZetDJO3qsd6PEtsBXoM2nvNegLpYAP7bDOnEUNAMwlkOs23wIWdlNLu
	gSIg+ES+Yb1unjq242CM95lefWO7YEMD9ZtFEYN1ZgHWoRnNBdyY5JeZ0VE4O1Gj5dRd8BS5A60
	pVZZxPHFLPJhvPBKbGHpB0zDlI6FSwOUacywUqhy/Mhjtlv7mI2HAgt7rVWaCX6+TZHUSWZiwWC
	fJM71JLdvnsBG9Zy0U8bffOIe5WC2WaMnjBt78585v8xokKcg/4cqLznoi9hOCknZD0RLd39Ens
	Q7PXjQp6pd891JH2QPj7Q8B95Cx7XRgO0P2eGLIl3Anr7m/j1sO9o3rBWH3g1ZaZFIXi1BSbFKb
	XsbjU9Ksl0CUKSoPhZzPa+2Z8mdQdHjfhEhQBEQb6joEWR4/WCn6DPNzuAbkW/stjJNYE+NCXS7
	/EWVM0oZs8=
X-Received: by 2002:a05:600c:6098:b0:48f:d1b8:9ab1 with SMTP id 5b1f17b1804b1-48fe60ecc51mr346949665e9.9.1779203746282;
        Tue, 19 May 2026 08:15:46 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd1f:f500:f867:fc8a:5174:5755? ([2a01:4b00:bd1f:f500:f867:fc8a:5174:5755])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5ab3977sm363119485e9.9.2026.05.19.08.15.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 08:15:45 -0700 (PDT)
Message-ID: <c0fb85f0-38f2-4f31-81a1-6650359752e9@gmail.com>
Date: Tue, 19 May 2026 16:15:44 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 2/5] bpf: Fix concurrent regression in
 map_create()
To: Leon Hwang <leon.hwang@linux.dev>, bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kernel-patches-bot@fb.com
References: <20260518145446.6794-1-leon.hwang@linux.dev>
 <20260518145446.6794-3-leon.hwang@linux.dev>
 <261a47f4-a92b-4a61-86ca-c1de362be105@gmail.com>
 <5660e657-f2a5-4866-9881-c705bff0c970@linux.dev>
Content-Language: en-US
From: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>
In-Reply-To: <5660e657-f2a5-4866-9881-c705bff0c970@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/19/26 3:47 AM, Leon Hwang wrote:
> On 19/5/26 00:43, Mykyta Yatsenko wrote:
>>
>>
>> On 5/18/26 3:54 PM, Leon Hwang wrote:
> [...]
>>>  	/* preserve original error even if log finalization is successful */
>>>  	ret = bpf_log_attr_finalize(&attr_log, log);
>>> -	if (ret) {
>>> -		if (err >= 0)
>>> -			close_fd(err);
>>> +	if (ret && err < 0)
>>> +		/*
>>> +		 * Failed to finalize the log.
>>> +		 * Should not close_fd(err) here. Since the bpf_map_new_fd()
>>
>> nit: you can't close_fd(err) here, because err < 0? The comment overall appears to
>> explain why we are making this change right now, rather than why this works this way.
>>
> 
> Will update the comment to
> 
> 		/*
> 		 * Failed to finalize the log.
> 		 *
> 		 * Should not close_fd(err) here by
> 		 *
> 		 *  if (ret) {
> 		 *      if (err >= 0)
> 		 *              close_fd(err);
> 		 *      err = ret;
> 		 *  }
> 		 *
> 		 * Since the bpf_map_new_fd() has published the map fd,
> 		 * if a concurrent thread closes the fd, then opens new,
> 		 * unrelated file that receives the exact same fd
> 		 * number, close_fd(err) might inadvertently close the
> 		 * unrelated file.
> 		 *
> 		 * As a trade-off, override the err only when failed to
> 		 * finalize the log and failed to create map.
> 		 */
> 
> The comment is to explain the reason for overriding err.
> 
>> If map_crate() failed with error code and then log finalization failed, do we really
>> want to override error code? It sounds like map_create error is more important.
>>
> 
> In that case, there are two error codes that should be returned to user
> space. How to achieve it?
> 
> Since we should not ignore any error code of them, can we report the
> error code of __map_create() failure by adding an error attr to struct
> bpf_common_attr? Hmm, seems not a good idea.
> 
> Any idea?

I think we should do what Alexei suggests.

For example: we return ENOSPC when log is too short, regardless
of the status of the operation for BPF_PROG_LOAD (see bpf_object_load_prog()
in libbpf.c), it makes sense to do it consistently for map_create as well.

log_finalize() error always overrides map_create() error.

A precedent: We are safe from this race in bpf_prog_load(): bpf_prog_alloc_id() makes
prog exposed, only after bpf_check() succeeds, which finalizes log.
We should do similar for map_create().

> 
> Thanks,
> Leon
> 
>>> +		 * has published the map fd, if a concurrent thread closes the
>>> +		 * fd, then opens new, unrelated file that receives the exact
>>> +		 * same fd number, close_fd(err) might inadvertently close the
>>> +		 * unrelated file.
>>> +		 * As a trade-off, override the err only when failed to finalize
>>> +		 * the log and failed to create map.
>>> +		 */
>>>  		err = ret;
>>> -	}
>>>  
>>>  	kfree(log);
>>>  	return err;
>>
> 

