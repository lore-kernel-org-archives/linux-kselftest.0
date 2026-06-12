Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014FE383319
	for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 11:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781264239; cv=none; b=Oymci2877bAqf5nr71VMb6guHZ9dyO6jvugccCb7p36DhHrZnIeEwwoewZfLdN0srv95oE3yNR+iTF1dJvXhS3s4x7gdAFfzgp8JFApxcttF+AEpQb8E/U2agGNVkw4XH50D43kpPh/YZCN+yEt4zOj/Dw6G32QK96A9PmOo/A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781264239; c=relaxed/simple;
	bh=4bNEnXOnxP9R4p/TqJRZcA+o31g58k6pVxjAj3spyT4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WeS+9ut8HVJ4XsvACrvCgZNEL0PWiR+p9xolFXvutA7i2L7GiWEwdwgHaEsjlLrlUv9yRMijwC2WufE+7Jr/7jy28gYmDmafj0NDIasjCjn8YFAiuJezD8zyh7gtydS/AzzZqfd6G+eFe2tXhIpOzQmz8X063mvYI6JPoBPmHAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gXjJtrEj; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gXjJtrEj"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-491609cdd8fso2471395e9.2
        for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 04:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781264235; x=1781869035; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=j9dyxygjV/3RofubGPQY9xrYK9q7NJvG8u++ttMJ7jM=;
        b=gXjJtrEjaGEOql6CyedpqqOR5hAdC3d5xqCL+LsdpfNytEp0nHOzKcvEOQZ4gHsiPb
         olJDwgrdrPOhmxS8eKIf0dj+P3YVAOZ4HGXQiSO2fAP/7tZGAbrSQ/OSX54fASP841HU
         KIjBvbUyxguy1y9J4DO0HTFAPbrk01/cLE9CoBBuUabNDUJt1YJdc5nG6pbE6XH2BjYK
         UhLoGUUw+gq/o9IidALv4PE5jVuyckHYWridIuakHe8Dg7DVzAJVqCBnKK59u9YgHbgn
         M0DYLEIEIGcbs9bHY/ArMUTF1hK/VIQYDwVzchijqhqMCeIVT3BO2huV3LKvXNoITZR0
         czLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781264235; x=1781869035;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j9dyxygjV/3RofubGPQY9xrYK9q7NJvG8u++ttMJ7jM=;
        b=bYcmRTxj7EzbeGKBwxtm4kEuJyRD7hOpzKuDq4gYY8TG9r8Hk/J9rwsOoS9rcEMWx4
         MOf5YzWSuuXms7uMEiMFM9sN8z1By8oYzBumqT1ytA2UyKuok2RA+72B1fbkK+bGvVqO
         KOtjjOwhJAjPTbWJm8u/PmSEDrE6gZRT8G5pIj1kGrItn2dzIxfCceLgQuInPnHbMpx3
         8cCeR0CxrgqncULI94ESoUJN8NsAVQSJEFxdlcOc9TvMTxxESXFRFK9VpUzN9Cn3GTJp
         RBLgPYD/Equ38MGVkIdk1fRvyOWV1KVs01/jp5n2Y+IHARnxEFUr3jv09f5ni4SIEGzo
         W91w==
X-Forwarded-Encrypted: i=1; AFNElJ+JDBGLz7/uAckICdBWpb8J75oMTHSLCy0pshTo96P2+GgoIwvx1F74e/saUYQxwSfiOsvhqhkKwgz7QKa6q+k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1iCpO66K2NvO83/Zg5QC89GG0tl8HtZHLNpvCOUy956CGnmRP
	Es99fnfIXLXb/xHIm4daGTyF6ZcepELqCRzakK+SPmlmOy8uS010Q4S7
X-Gm-Gg: Acq92OGWeN5s73fhm1LZp5poKsx9AkHXSmFcarSB750iFcKgEwdPp6x+no9vnfAX9Bh
	JVHvXbrJGbWmWAQQ0bnZ3B/tsk91lCKkV6pxgGeav/uerLMnb7Sn29P5KfwQe5BGBMo8jMxeoZv
	LSIReLjCWsdT7qFZK9U93DHlTOuk6zAQe/ZRHKP3CrdE7gdJz4suJ7tpHY/iivBNwtUwvUbGHMG
	D6zb2FfbsMP+3wc8DkRZ/rExx46ywFj1wWIZhf58VlnJA7C7nLMNu4Ad3lsuN7r4Bho0mC8IljI
	y6YlfFUljhpJQ6RalH+lZTFmovNKTn9hhDzTuX5wGs4yr/3v3C8MW0/51Ny79kq7KzALLhRFiOE
	yb7vX1zWvm+yQTtKtHx0BlzQmBWK5gs4GBQXktQtJcdSoofWPZC6bAQoOijDhzvzAMWkdMJujV3
	jEoDTLSIWeLi8mr8Q12ccMfOJnNyJcOGMhW4B3sygCl1A66Ycf4QGrTxfMsuSEeJKPA/MyRANyn
	axRan/bsqy6ktu/auA=
X-Received: by 2002:a05:600c:8486:b0:490:a298:acf7 with SMTP id 5b1f17b1804b1-490ec4ee700mr36638215e9.17.1781264235050;
        Fri, 12 Jun 2026 04:37:15 -0700 (PDT)
Received: from [10.128.10.215] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2637ccsm4885808f8f.6.2026.06.12.04.37.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 04:37:14 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <2e528372-aba4-4621-a9a3-7ce23571ef37@gmail.com>
Date: Fri, 12 Jun 2026 12:37:11 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 01/14] kcov: add per-task dataflow tracking for
 function arguments/return values
To: Yunseong Kim <yunseong.kim@est.tech>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Kees Cook <kees@kernel.org>, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
 llvm@lists.linux.dev, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 Yeoreum Yun <yeoreum.yun@arm.com>
References: <20260611-b4-kcov-dataflow-v2-v2-0-0a261da3987c@est.tech>
 <20260611-b4-kcov-dataflow-v2-v2-1-0a261da3987c@est.tech>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260611-b4-kcov-dataflow-v2-v2-1-0a261da3987c@est.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/11/26 17:21, Yunseong Kim wrote:
> +config KCOV_DATAFLOW_RET
> +	bool "Enable KCOV dataflow: return value capture"
> +	depends on KCOV
> +	depends on DEBUG_INFO
> +	depends on $(cc-option,-fsanitize-coverage=trace-ret)
> +	help
> +	  Captures function return values via /sys/kernel/debug/kcov_dataflow.
> +	  Struct pointer returns are auto-expanded using compiler DebugInfo
> +	  metadata, recording individual field values at runtime.
> +	  Enable per-module with: KCOV_DATAFLOW_file.o := y in the Makefile.
> +	  Requires clang with -fsanitize-coverage=trace-ret support.
> +
> +config KCOV_DATAFLOW_NO_INLINE
> +	bool "Disable inlining for dataflow-instrumented files"
> +	default n
In Kconfig, when you don't specify any default explicitly, it's
implicitly 'default n'.

I think either style (implicit or explicit) is fine and both are used
throughout the kernel, but is there any reason to make it explicit only
for KCOV_DATAFLOW_NO_INLINE, and implicit for the others?

- Julian Braha
