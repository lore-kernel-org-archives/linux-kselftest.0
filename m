Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794558663;
	b=5GbCXOXepuwMq1dkvRWTymveMQHA6U4dcbQE5OrYXquhK6nA8v68yoXymfLCPgMBdR13
	 qYFlQexYiUm7Nw3HU7romA77beZy/eRTu0pcPNo4PTcLcCPT1kGZbNvHXDG6B8J5G5vLx
	 qhGl6CEUl/T34e0dKguHfrkLBzIOYo3nVMLF9jgM2nVnkEHRcB7AG8R9BnyFqyBe50uwl
	 RsA9btkJxa8mXbmIp6KRVKwzbnRxy2yDetMsgGosltuO+OcmMM5KhvT3TykeSFHLmTclz
	 3RdSTd3UxlnW392HYMcOKaNo/6QmHTVB7cWtI03ojlEvcUHkvJShTTuAiYg7TNOvHTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558663;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=AE6LmlUfD0UD/MlCg2IXWoqx7xIo+3XrxhesZ8DM7Lo=;
	b=j63vlxRsEv1HOgR39nrBFu9Spsps+HROyUxJdRmjP2+lHNV9aovSnwmZYRPeBmgix/su
	 vzhNr4i8BWwgyb0jBReL/mA6S5IVKnbgiCy5UEiK6XmeNiPRh1eaNarWR6mRVtZG+nxe/
	 JfAlOfz2egWu1GJJ0X5PYxr/P8meMaNp6By1Jy4ZPskacLmgMpZcLMceGT29JPhiExc4S
	 FaoUutL2qJszXrK6aP1+erT2Vqw/j4PYg6+Oa9tC7tLTtzFRrf6y7wcnzUdyC5+Q29fsW
	 R8ucBBwVVf30rCWoplhODJU/IQ7FYOF4j6+ag6tHXN6PwpG6k5M0xTaCJfOPTL8wAzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=MgGXhDWw;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C32606B1E4
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 08:31:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28C32606B1E4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=MgGXhDWw
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8b67f25e6e1so341916b3a.0
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 00:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794558662; x=1795163462; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AE6LmlUfD0UD/MlCg2IXWoqx7xIo+3XrxhesZ8DM7Lo=;
        b=MgGXhDWwYqVoGzJV7PFTcjwzcTdpBKMUvHY8QEaDnV7SRHamPhA1DJy6yUwDGoWa45
         LpTPTHlrE4OBDNbMZwPNXtMa/IjnTaGl3MVDBT2zN2/pYU/JzboTINCcQoG5UMULzy9K
         3luLrf2LbhZuVkGhsQ3PYQ1I16vTGZllMcdco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794558662; x=1795163462;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AE6LmlUfD0UD/MlCg2IXWoqx7xIo+3XrxhesZ8DM7Lo=;
        b=IR6qIUn47igxRHtX1K1Y8Ujgx+uaRwOys5FZvILQ4l6ZlnPLlYm8hvKTmyoyWfSGRf
         FU3b3jeQx6xuP37UkPgaHl9t5cKYsrroX5kozOQ/TcW2Fjh7zsl+N9bd9Rfn+xcxNTZ7
         A3OqQbjBM3BCianfD+sCBj1b/PlqE8HXDVPYKw3GURb98HK2CA+hYFoo7GJ1C2R+Rctz
         sSw3dIHjLWMCm5OBbLpXSfZCJNM41wuB86J2Soj7w2v6Yoj8/m09OHSf1XR/aUYaDo0a
         0jGA9qKqt47S3dJCVTpuOtP4CjV4ZOmnlclbCFbuJZueuZeRCG8L+tSbzN3h3DIqhwoh
         t9lg==
X-Forwarded-Encrypted: i=1; AL+hErHNO4rW/vqH4iP5uhxC3B7uZW4cJoqkxku70hrpmZLHFmIAlR22se4OnUqePi8F0DTEQ2Udm7OUOvL4afcTSbo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HU8wgUcOvaEHxhmifoaKhSOpn7I06WuWWBfTeA4H3iys3Bsm3
	5EaTr/noBGsEZ9aZ1Po8mHImpgq6ph345TnkYRir8uOuspIYIQ5fCA/vrJ/2Wcmsh0w=
X-Gm-Gg: AYBFou0jC04o2R5yHVfyFRKuna35Jp1/k+Pn5dRPykpSJA90RV+KkeI4dmTZhJO+9yv
	H+mCwiwvhY2Xuv04KioZYc1iuYimr3fIfh+AWt8OosxfONnbIFHx93OURHKuD9fB0gmmE5Bq/rV
	cThF38hH3dVdTn/iPSydKmU8Zx8CTZHPIr0ITxnc6t0oVQcCFK+aZfieGPbo4bW+wJ/qAsmW+mD
	2bXihfybvmavM4T2/Ck1OJOdHnex1zHIZbujzvMe9j416hDJWEOmuwx9s0zAW7kmWIDgzWmSKJN
	tb9ZmmPls8lZpcLcWDuSTNN4MlkTCXcDEvtCuJWxqXCXQzA3WnBsKA5MpeCyxJ0f9DVQnopcWTM
	WTwbAgRScynugBLPB1YySddhtcB4yoqVJVXKJHPzTRTILcnobgtB/ndUCFw3Tufdn9V8dlEVaSz
	qszjitWfgPiBc/h2jUNFRypyV/RGGCaegBnbg37i5BcZ8PWOl8LJIBSvDdsxQJln6G90R/MzKFK
	I3GFiv9wg4PiVKW7HFWOzg8eCEJBRsojAIQp0W7efpf4hK1QlSIg2VXKk32bzV1V+hljSlWc5AW
	c8PZhOZ7s09QThTe4HDANCkVKGQS6D82Ee/Vte2axpGrhkQ4gnoZgHszVoi2sKgH4bshr7R6tYN
	24LNqhUvdBEDZMF7BCFeDw4KjMzD1dJ5mSCXvgkCMEvNzF6uT3WBdekNNzJpqfAfLrfwYz1SCEO
	9EVZ26dh6RbOE4O2XXuStyqITqagbNj2mUTecPg/eUskYSv36Q21vI1WAb4sQ=
X-Received: by 2002:a05:6a00:1a8d:b0:89e:a2cc:8263 with SMTP id d2e1a72fcca58-8beb21ce39emr2120292b3a.5.1794558662388;
        Fri, 13 Nov 2026 00:31:02 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bececcc9basm738703b3a.3.2026.11.13.00.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:31:01 -0800 (PST)
Date: Fri, 13 Nov 2026 00:30:59 -0800
From: Chris Down <chris@chrisdown.name>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Mike Rapoport <rppt@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, Alexander Graf <graf@amazon.com>, Baoquan He <baoquan.he@linux.dev>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, kexec@lists.infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 2/9] kho: Make bootmem reservations visible to fleet monitoring
In-Reply-To: <179443886218.2329176.10742245280418377061.b4-review@b4>
References: <cover.1794383544.git.chris@chrisdown.name> <c41c639fc5f453d60a265ba42a233f2ea5b48319.1794383544.git.chris@chrisdown.name> <179443886218.2329176.10742245280418377061.b4-review@b4>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261113003059.056dd036a6546756@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Pasha,

Pasha Tatashin writes:
>> The reservation varies with the kernel, memory size, NUMA layout and
>> command line. Our fleet collector needs the actual size from each host
>> so we can decide where to enable KHO and catch a kernel release that
>> takes those hosts over their bootmem budget.
>
>HM, that works for cold boot not for live update :-)

Yeah, that's true :-) A kernel we live update into just inherits the areas, so
we'd only see a release change the size once hosts cold boot into it. I'll say
that in the changelog in v2.

>> Today the collector would have to sum kho/out/bootmem_len in debugfs,
>> which isn't a userspace ABI. In /proc/meminfo, free bootmem contributes
>> to CmaFree, but the reservation doesn't contribute to CmaTotal. The cma
>
>Is this a different bug?

I think so, yes. Bootmem pageblocks are MIGRATE_CMA, so their free pages are
counted in NR_FREE_CMA_PAGES, but totalcma_pages only counts the areas that
mm/cma.c knows about.

zone->cma_pages is a separate problem. It only gets bootmem added by
init_cma_reserved_pageblock() in kho_init(), and on a KHO boot we return before
we get there.

I can send patches for those separately if you agree that bootmem should be
counted in both. It wouldn't give us the bootmem size though, because CmaTotal
would still include any other CMA areas.

>I have some concerns about exposing this as a stable API. What if we get
>rid of bootmem or make it resizable? We only recently renamed it from
>scratch to bootmem, and we have been exploring for way to optimize it.
>
>I would keep this exposed under /sys/kernel/debug/kho/bootmem_size for
>now, and not worry about it being stable.

That's fair. I'll move it to /sys/kernel/debug/kho/bootmem_size in v2, and we
can look at sysfs again once bootmem has settled down.

>Keeping it together with the rest of KHO code would be better.

Will do, it'll go in kexec_handover_debugfs.c next to the other bootmem files.

The kho_incoming files in 6/9 are already in kexec_handover.c, but kexec_core.c
still adds the group to /sys/kernel/kexec. Is that ok, or would you rather KHO
set that up itself as well?

Thanks!

Chris
