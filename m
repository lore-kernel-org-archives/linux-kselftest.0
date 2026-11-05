Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793913728;
	b=ILW/N+cPMaUpJKENQyQHiNJHixWl/t6fOsIgxIvXtJwadTQPo1J/Oaz4+qUxuGD7Aukz
	 T5TtoP6fZdENlSGpG0cEMposqe1rbdf5mnqdL9TvnKEzIFOcC4jS5rIH+J826RNgYbUWC
	 2OhpDUSaczv2vjfW45hZcVc1hBjbyBiIzcMFrORAxQU3yWmZDqnCVms/3FT5j7c2Q6sS/
	 OYD2RHCdl2uXRxM9fX6rqZGjSiqA/Ln71oUMAt6KzfUZiM0kY9YZ2A2TmzF8ecN/W/JnA
	 NZhTgP8wntiHXXwvkQDY1fozMlYcbwT9dfdxNS1XRuT8+QImhKUKXo+dYfJltIp8ZdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793913728;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=aBGHCZkustJPVUltaen+A6WhD/Flx68KUOj5TtSCMzI=;
	b=V++PSlBZ1HmBk157f3nXI0oEBJyhSpkU6T/0/f5Izu9L4rUC06hKA99cVpHICwniZzSi
	 aEsqN/8t/RXo04ODgBZRcUtDokKCjg9QwrNjGa04Uo0RP18t1ub9jcr0aVzrCKGKaExJm
	 pHA2x21csFADyTB0owdnpwwvY//KJF4imSbY8vz+HaqKKs9Y6XKMOzTgT2QCJMiVgSG4X
	 FOhhZWdQkgHKLaxJGvPn2BUJiiQHpmRBnGrMkizH9zvW9S4Crrz/FxqXG7Ccgr5WNTBJK
	 bS2O63d7Cw8UBLAf9E8WEYZ5S3+wcIAT6VxA5xP1RlSnZWPoqoynh4yL55EuB3LXJgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=M1zRf0uf;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FC9606A328
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 21:22:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26FC9606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=M1zRf0uf
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-8470d7d430fso9689a34.3
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 13:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1793913726; x=1794518526; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aBGHCZkustJPVUltaen+A6WhD/Flx68KUOj5TtSCMzI=;
        b=M1zRf0uf4eSX65ttB1CQosJZYv4SX0ATNjnBtizp7BgNgAmlUv4HoVyZ/BSNmEQ3DS
         +wArByDyEFOgk6/XKSsQd+s17ECPk9EKKQFsTNZw2Hm693x7uNHNKUldZ2lIAWD0bpmq
         VlYvM6A88fLa2vtc8V6TXqtLb0WlLFYbP4euI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793913726; x=1794518526;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aBGHCZkustJPVUltaen+A6WhD/Flx68KUOj5TtSCMzI=;
        b=upeuzE4fHCh1YYJmrSv1D+SjSAGAO3RZMi8k17LqgUKBksRTmx13njhJmgiNb+AKyv
         DEK5fH3JKqehTJwN3fUqdJAEBVXaPkHKqhoygGR+pMIwxhLPUd+UaM0GJReJQR3Ieugd
         vczMna9ER+H1ce7fW2BDcv5V0oshVB0550lj55jYrTpBT9kEyVw/597Biu5V5KV1FMxp
         g8eqFf+vclhVkTMWeMWLFd3QUmeMfJEdhJ6m6O3BOXSRBxLFTxqiF7DPoRzftiRJnsId
         Og6lavE8Sth7uTGZVLrFF3vXF3z4Jt7ifkiI206kZeFYWGXqjlUhOjexgOcPRU29kyEG
         5g8A==
X-Forwarded-Encrypted: i=1; AKwUvBw3fCu0Vdt2lKCLUa3czxu9HiIlV8rZaYGMlIQkWVj4Q6tkeYddnGL+AVmdcwfZRh77rj/IN06UMafNH5nFWV8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UEzl9LUzVZoaHuhjzWyNqG8QsZlr4ZVzK6bw/C+dxIsYNP5i4
	9mcElopZDfD5qRY7I2yhD3AB8j9kFNFIqNFCLXPiQxEBX50O+fLCjhKKnllY8S0G8xc=
X-Gm-Gg: AYBFou0bQrtru8PiwUeKHJZOvyfHWpDm4TNuNlE5RDk6mNK/B2+g9ihO8u5pnr1MJ83
	puYA2LbPeQ9VVO57/XitK1lAUyR+9Ddm7cL6zUd2ezZND53wEisdej9bSCmP5LckBtxQn2/y1mk
	yPQW8ANjXiPM1W2Vu4fmUwswxoz16U/gQCgnf4G3xoKtG26uNSI5PxaEoX+FznWM1q/ZBAljyOk
	1fZtGpHs09MqEH6B8Ihqa+QJ5yJXvzueulRZ6kKOrGcMyxyI8TR3aufNwvE0svxGEki6vZrn2PU
	N3mXOugxpha9vocQ5CkqoZaRjZLBM33wMLp1ZpxPo9zZMVFyZz+vHX02bMHPlrsZOeZbQHx7Abs
	+HxmpaV7ABFqhlcz2/sk/YcFkd1kD34ohxg01RogOX3ToqMKat3BvncqqQJzTmKTEGsA0T7RRRa
	XYEmfGJZrt9RCp9pwsbvvOKtO+KuFmeHHdcUYv4pISC4UofOWCVZxJAcYsxUI24bm5LcIG3HzCD
	mSRJwG+DbEHo6ncOTkHi6NY3piUiG6Ts+Xitlku46LPb/4cHZXgC/LFMiCwueA2MD3Dd4Mwk6dQ
	RaEPLiBQr1Gr6z/NL7gTrTMbsQOEVdYlKkYS6FLq3fZbzbSYdhbis0HvVxAV6Q==
X-Received: by 2002:a05:6830:438f:b0:821:94d2:83cd with SMTP id 46e09a7af769-85f1cee4f2cmr703548a34.9.1793913725956;
        Thu, 05 Nov 2026 13:22:05 -0800 (PST)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbf375dsm338315a34.13.2026.11.05.13.22.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 13:22:05 -0800 (PST)
Message-ID: <7de6d2c9-0f2d-4f7e-a2a5-30eca1b42bfd@linuxfoundation.org>
Date: Thu, 5 Nov 2026 14:22:03 -0700
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tracing/selftests: Fix false bashism in
 kprobe_non_uniq_symbol.tc
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Shuah Khan <shuah@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Linux trace kernel <linux-trace-kernel@vger.kernel.org>,
 linux-kselftest@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Sven Schnelle <svens@linux.ibm.com>, Shuah Khan <skhan@linuxfoundation.org>
References: <20261029211218.3749963a@fedora>
 <undine-1793665155348284042-31145736d231a8b5@undined.local>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <undine-1793665155348284042-31145736d231a8b5@undined.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/2/26 17:19, Masami Hiramatsu (Google) wrote:
> On Thu, 29 Oct 2026 21:12:18 -0400, Steven Rostedt <rostedt@goodmis.org> wrote:
>> From: Steven Rostedt <rostedt@goodmis.org>
>>
>> The checkbashism is giving a false positive to the kprobe test of:
>>
>>    ($"foo" should be eval_gettext "foo"):
>>    if [ "$(grep -c -E "[[:alnum:]]+ t ${SYMBOL}$" /proc/kallsyms)" -le '1' ]; then
>>
>> This is because it sees the $" at the end of the grep as a bash symbol.
>> Instead, escape the '$' with a backslash as it is within quotes and that
>> '$' is for grep to process an end of line character and not a bash
>> variable.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: d22c3e0088e85 ("selftests/ftrace: Fix unique symbol check in kprobe_non_uniq_symbol.tc")
>> Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
> 
> Oops, good catch!
> 
> Looks good to me.
> 
> Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> 
> Shuah, can you pick this?
> 

Applied to kselftest fixes branch for next rc

thanks,
-- Shuah
