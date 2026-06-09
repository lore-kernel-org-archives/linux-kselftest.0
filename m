Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE2435F5F3
	for <linux-kselftest@vger.kernel.org>; Tue,  9 Jun 2026 04:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780978983; cv=none; b=cY82cjS9ySWIsZtQ6Hb5d+Kn0CtkgBgmNGEKRtEmkbxUtp8Pz4wTFRrS10qiVAwkZFWwjDSk057jEw4c/UcMmoobVHxaleYK0DF6N7+UF+jl206GNHSMljd+vJoTdabMFEzhU87MLPX5Vu4rmfMySVH4s63qUMnJp3tGZ2LUiMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780978983; c=relaxed/simple;
	bh=XUM4jSYxsy8OZpNlA2sFeJJyi0yvHFHO/l85O3H0Cik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cL4pu6EiumNbj3o8B3RHMv0SbOHw+gZjn8P1OsDDy/v/sjkTgFQz/TvfOWjXGgsykvxtoive6i+2mNOmBB2HfEvRskzbRF/EL4JAtgxHR7ElJkZvwH6hnIJ2s3w//PQNS9IFGOb9jMIUW/ys1FCcUcRIwg+iKnD9TTktIPZEDgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=jq8A9Meb; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="jq8A9Meb"
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 861F83F8E1
	for <linux-kselftest@vger.kernel.org>; Tue,  9 Jun 2026 04:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1780978978;
	bh=o6zPecMI7bLh93KjCTX3ud9wcf4W2rIyTKOsld/Pw24=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=jq8A9MeboPF+JXR3nGbV+Q5vF7Hj2nUdUVuEghL407q4LhFzyg6o/8ziZaN5FXm+V
	 cSVf2hUN8lv3e/5LW9ZTBMyQrb/rkf+LAcpnlu69OuPLXO7WZr2tDMqeCv2OX0D9w4
	 1/4fNM6tdm403/jiP6FprHFqdVuMAUBqEuH2Xs5NZU/U1zbpwGljlbBsWvtxgR2hjt
	 Pl9CZhb7a5NyCMMor7NCzVZb7PViolCMyRNycgH83kEaNvPQCFXR+Ltl2nw8vgaZ58
	 J+8KXCTOTccmn2gN8QcBJ/TkjJmQcqzClWPf30rHOn7ZhdJHGdShK1LqsPsG5F5qtX
	 3vk/xRJKWx8/Cdfj5gj8b3Ln79pxC66ePuA3uvKSo1PsU9b4LWitLqRjCyyhYcKcF4
	 HpwEeplaAW5fFqaxVxCVqdzcFGEq8VE6pDXwNbDWeXwCeES5t+MXMS4Vdty1KcxaWb
	 6jhEdE/HMrLJOURGUYiO1EQWuf0aeTQVy3upgzNDaS4nIafLW04Yb1kj91nkNFsTFg
	 hsWtCRYYuvRViY/XsSS5UdevUvk8XAh31wy3gJpMuV7D/uXeGoK2boZyyvk/2HxT5+
	 b5j4VqiM0KA0qjBW8awONSJLgGFR5y7Y9mrZ/Bwou8cRlYrWie58IVS67nf2gAhVVe
	 yr7ZShqvaqhQSUCrQbGDOp3w=
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c857fa2706aso2225985a12.2
        for <linux-kselftest@vger.kernel.org>; Mon, 08 Jun 2026 21:22:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780978977; x=1781583777;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o6zPecMI7bLh93KjCTX3ud9wcf4W2rIyTKOsld/Pw24=;
        b=q6X5dFSGx41EndhDb3tLrE/d9prIRdmsJQI9A0vlj9Rgi+uUuSJEQBBx7Uth+7ko4u
         N7PSv09WZbUZ1LXGl3udrT2tCL3FQE7u/CaAphvEeSnLykF4WQ+aDu2RtCDknmNyItp5
         XMx/6JLggVkiq6FSxdH8lvc9+DvEva5+HIbJ4vIxKVVpiOEhJQERVzGSpCXackKWBkPY
         FVwN4sO4urX0OyHdk7zA4t+eZFsqTtKmy/6piLFQ/v4hA9lmZm71zwqhxPL3d6T5PiWX
         zA/RF7xqIsDjB+q029UKJPfIApNt0VJbC4NFlIU/Be6D7EJ5M2+XJJhn4kGfyokixns5
         T3gA==
X-Forwarded-Encrypted: i=1; AFNElJ9FSVtYGssUGuvGUQEm2ujtEsKMJWsty5/dMozN+lpVvs54eK/EEin+Zp7YG7tVmt6xqndnLE0NSQzJ9z71gTs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0WUAm21Dxe9g01QoReG8aO8ivffrO5zte1h9IWB7fPlG0v2x/
	uZ6XOOu+7prih6z+6RPBLvobuNLEjryRu5k6/Tch+XGUXfUxT0frsg7pk5/KeyJJhFWIJlZxD+S
	q+J4csdsQK5JwPHugwoBInWWHkWllY8PWa4kwcaykr3LyYJHhl0UrRWcHMZ4TImCKttZ0VqhRMy
	5qd3/3AHUgZQ==
X-Gm-Gg: Acq92OFmBkv78kvWBLsEbaIEJXnIunbRIsTQyrfjtbl3zswqtIbEuE924IxwHOxsAj1
	Dm3qJ5D9hcLZ0/kRXRYhYGhKf1q+/joCweRLQ/c5JMC8RCQxEVDbtz+kPU6c3gkqBehREpePhHR
	EH+Rghe2FOGze0HzyS1XbTy9tN7J0BYenx669I6hasTMdxMFQiOC4an5BsAwWClPNTOJ4ZBmfqZ
	xXgsgjUUS6/uzH1SR9mnvISIewFugjjgyqGyk4xchVCSaL3qNb4r4VZ0HADDMKQXyDkaPZNiDCu
	upYQ8AhHzSitfzfLPNVAYzSZggLXjo+3jjZgUvbYDMLHrIXOvn/h58bkjq6seqd36wqxgMWgKt4
	cBntqPfEoSZAvQZ33AEfeWjERKlBg3FCuLPHyEl6+1X7JejXwxVCuMMdu+X6aJpTkdYT/+ec5n2
	ofVgliKU7T2JA=
X-Received: by 2002:a05:6a00:90a7:b0:842:5634:3c1d with SMTP id d2e1a72fcca58-842b0e835d1mr17963455b3a.19.1780978976538;
        Mon, 08 Jun 2026 21:22:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:90a7:b0:842:5634:3c1d with SMTP id d2e1a72fcca58-842b0e835d1mr17963385b3a.19.1780978975763;
        Mon, 08 Jun 2026 21:22:55 -0700 (PDT)
Received: from ?IPV6:2409:8a00:48c1:ca00:75db:215a:5e30:3763? ([2409:8a00:48c1:ca00:75db:215a:5e30:3763])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828d6bc5sm18664636b3a.43.2026.06.08.21.22.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 21:22:55 -0700 (PDT)
Message-ID: <ea9d00cb-54c6-4635-aa13-e5a688375132@canonical.com>
Date: Tue, 9 Jun 2026 12:22:47 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ring-buffer: Fix event length with forced 8-byte
 alignment
To: Steven Rostedt <rostedt@goodmis.org>,
 "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: mathieu.desnoyers@efficios.com, pjw@kernel.org,
 linux-trace-kernel@vger.kernel.org, shuah@kernel.org, wangfushuai@baidu.com,
 linux-kselftest@vger.kernel.org
References: <20260607072431.125633-1-hui.wang@canonical.com>
 <20260607072431.125633-2-hui.wang@canonical.com>
 <20260608180245.09e083867a7d4d96058d7323@kernel.org>
 <20260608125254.2598ef4e@fedora>
Content-Language: en-US
From: Hui Wang <hui.wang@canonical.com>
In-Reply-To: <20260608125254.2598ef4e@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/9/26 00:52, Steven Rostedt wrote:
> On Mon, 8 Jun 2026 18:02:45 +0900
> Masami Hiramatsu (Google) <mhiramat@kernel.org> wrote:
>
>> On Sun,  7 Jun 2026 15:24:30 +0800
>> Hui Wang <hui.wang@canonical.com> wrote:
>>
>>> When RB_FORCE_8BYTE_ALIGNMENT is true, rb_calculate_event_length()
>>> reserves the space of event->array[0] for placing the data length and
>>> rb_update_event() stores the data length in event->array[0]
>>> accordingly. As a result the whole event length will add extra 4 bytes
>>> for sizeof(event.array[0]) unconditionally.
>>>
>>> But ring_buffer_event_length() only subtracts the
>>> sizeof(event->array[0]) for events larger than RB_MAX_SMALL_DATA +
>>> sizeof(event->array[0]). As a result, small events on architectures
>>> with RB_FORCE_8BYTE_ALIGNMENT=true report a data length that is 4
>>> bytes larger than expected.
>>>
>>> To fix it, add the RB_FORCE_8BYTE_ALIGNMENT as a condition to subtract
>>> the size of that length field whenever RB_FORCE_8BYTE_ALIGNMENT is
>>> true.
>>>
>>> This issue is observed in a riscv64 kernel with
>>> CONFIG_HAVE_64BIT_ALIGNED_ACCESS set to y, when we run ftrace selftest
>>> trace_marker_raw.tc, we get the weird log: for cases where the id is
>>> 1..100, the number of data field is 8*N, but once id exceeds 100, the
>>> number of data field becomes 8*N+4:
>>>   # 1 buf: 58 00 00 00 80 5e d1 63 (number of data field is 8*1)
>>>   ...
>>>   # a buf: 58 ...                  (number of data field is 8*2)
>>>   ...
>>>   # 64 buf: 58 ...                 (number of data field is 8*13)
>>>   # 65 buf: 58 ...                 (number of data field is 8*13+4)
>>>
>>> After applying this change, the number of data field keeps being 8*N+4
>>> consistently.
>>>    
>> Good catch!
>>
>> This looks good to me.
>>
>> Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> This is the patch I meant to reply to.
>
> NACK as the test is broken and not the kernel.
>
> There's a pending fix already:
>
>    https://lore.kernel.org/all/20260601023251.1916483-1-dtcccc@linux.alibaba.com/
>
>
> -- Steve

Hi Steven,

Thanks for the pointer. I reverted my two patches and applied the patch 
you referenced, but unfortunately it doesn't resolve the problem — the 
testcase still fails in my environment (riscv64 kernel with 
CONFIG_HAVE_64BIT_ALIGNED_ACCESS enabled).

 From what I can tell, that fix addresses a different problem than the 
one I'm hitting: it targets a 64K page-size issue, whereas my failure is 
caused by the 64-bit alignment requirement 
(CONFIG_HAVE_64BIT_ALIGNED_ACCESS). So I don't think they're the same 
root cause.

So can you please take a look at them again.

Thanks,

Hui.

