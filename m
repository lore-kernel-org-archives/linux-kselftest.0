Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC8C3E51C6
	for <linux-kselftest@vger.kernel.org>; Sun, 16 Aug 2026 23:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786921339; cv=pass; b=oieM7aVE0svFXawhJHhlNkIKVPIVKHSBaN+NuIZwvkAsQGjFvBYQMTwV+hYS6Hcd1OhmjaTq0qHvCBhV6tz21H0BnQS8I55wPwockIj1pRrzR03nXcLGRi8V8Q1zEvXUcgo6lZelI9CqPfNDxwaw2WHxXFnL33D1Od2TT+3W2WY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786921339; c=relaxed/simple;
	bh=TfZcEuGOfr1J68VSYUvGJF5oR+xbrzPMOaOCm+qrrgM=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nZhBU3R2BBBUgxt2p5r3PqZs/Nqm3GwnqzUGhC+ENND3hxSAg+zo21bqo6aerkp0Y3wJ3sQwM8aXEcMaG6LYl5MSUrBJLvPXvABQ0VBH4ftv2HyDSGu9hggqurA4nl0wL7olsR5WIb7k8wSObaqpE0YbZiagvKRdcgm0dSoKlFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nBuIbwah; arc=pass smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nBuIbwah"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so2222725a91.2
        for <linux-kselftest@vger.kernel.org>; Sun, 16 Aug 2026 16:02:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786921338; cv=none;
        d=google.com; s=arc-20260327;
        b=TwaMnYSAkbspMdRllslGcdGwGSUVzXYoLl8+ajRmqnxcLilfukkhR4qgCL0Y36Nox5
         w6NN3DeFGvJoPjczwPHDrPgFln+G1AutdbV6q3grszQKnalbxOom5bbs1/Ges1MNh4p/
         UayUhaDad+HYUcpFyWH/OCckBM2WG99ZRJ3lMWMXdxAi1xxCDtwYT7hviacij3SoG+tK
         vC8+WR2VuHXP++2EGyarsbGTe69OnvXeju605JYU3MOecwKDazkKvzgz1aMW6kApYwU0
         w1BA51i9aNxA+FAa+ukDA2r5mbiER/+nrHP7zsEHO3c+V+5iDz7gWJbquCFSk9utZCcE
         ltNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=5ZNfUxpi7veRTWLY2tYd3MK6swZzgBzgGr9g7FewAwE=;
        fh=/uegZsaB3V4hN8D7lrQKtrXHlckNUghJBSzg3UUhHVY=;
        b=Fs4TRZq+ibaf2dUhDo3e+8WSJmv3ZaHt8aKbqR9UC6CmCDsGrQH9B1Ej0Kawit+/XA
         ccO+36i7TG+KcSXIavzXYU/wY5nYFmv0UUYRVGXnB/9OWKm/FgNDNvjR3hGDRoD0jC0+
         oPssfZtGJy3iTTRhQ3kS9Oewk5lcxUV6bPwqXbWaJLz3h2nAfn77XiW+voTZDJLFMlQF
         uXeQm01q5/FOvDEbs7DjKIAerqRgwGaTdq87utjqIrItfvW/VugYLcd5e8J09QOOV6XE
         IJr1qkmPJ/fKiJE/Fl8ukK3Mph/KglAlYJZbuG8crKLbbwgmmwjLMqByVjNK4yBIzSb2
         VbJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786921338; x=1787526138; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5ZNfUxpi7veRTWLY2tYd3MK6swZzgBzgGr9g7FewAwE=;
        b=nBuIbwahTDk+YN/O6xtX38CC9NT1+mhcKHwDCSJWa4cUFpiAiCiECz8EZtYRqgGr1d
         4KCb92ZcJbRgyBMdE2fzPjjNsosPYKzH77W6rA7f79C1c3thYUJ787LVMvT8QdwFBKbt
         DXwi1TD84u/bsYwIt5li/8rpskNoaBPl3H/HHvhRfwycri1o6Qk68XYWSIHKEs3LWkMY
         SKtSRs1/7SvRKgd0aKtIM97RBwhWiLgyFr2MIstcJLVP6nCHeco0Is3LF3S1VWnWdFio
         xxAtmKuc/sw7WMPEr2xvXKPPorBjZJA+Hs2chq6IjAdW4HwUM7QsKP0tfoD7lXC6HfHk
         GSUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786921338; x=1787526138;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5ZNfUxpi7veRTWLY2tYd3MK6swZzgBzgGr9g7FewAwE=;
        b=k6I9mRUJXs5Zf+9EUXE2nv//UVHQ6QJ5XkLPYOPHYwL6bgFmFb1umMVRsAyBggXxOq
         7O6/Ve69fmmOlACXYDxbYcn72iy/cygWT6X8lLQ06qychoAYMVCXNuGgeD4Z4Kt1PTLp
         2mmEHhRw7VzbvLlZbhz8ifQGti04q/PSyLxYw7SQQw7vQHGIWVzj/AjTlHHFpsoL3Q5J
         /OWzP7RztQ6XIHG14fh76a83z+rdLRTtNL1COwPnNcZgRBuRvQlHP3o6I9VU4YtXbYqe
         eAxDgg80Zx+4k6nJDnSu+f+qIGHp3MNp7Zy0A8UJePUiQMlm1F022hAyHZetG0xwYtAl
         Ui+w==
X-Forwarded-Encrypted: i=1; AHgh+RptiAfuDTXa9z4FAxtjArj0wybEW700cWeyiWGE2uWVckJ6se/7NJtR0uzDIXwfVLpc+dxTrvQGJ6MicgClqjc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqHwMZtwLD2qvRMu9yZGXiqQfFRR4z5GrbjA2h+X+8TTXqj5xm
	NF29Kq4rLySLLwCBVBfYFs4vul68tVaTCdVTjiE4ftutlLQaGQ9rSNf26zmJeWP8jYr61+S/v3A
	NFmP0XqpWTdSNIUvDJds2lsnrIZOJJdFdFU1IYCJP
X-Gm-Gg: AR+sD11FIUUciF4MTZ3s2Lc8Th1qc/OaXC9sOIuaWQ9snO6Fhit7+K+w4YLsfaOhCYE
	aZ0K/98XmWSWF6FVpcqaZp2BUVhQdGf9RO7dW1tCDz7u9EiqSXTT7f+siRCnLoIEf2I/nk42Xk7
	nsHWEZo8TK+YLPddcA5Bf+imYa9R6Llq9KHVyqyl6SisEbLx2ivNMIv3FlashSI+6OT0l6zm8oL
	JE9AYU8SsD8bR6PS4mIpj9G3ntvvQxMriqogbbb0zKsc2jR4vplCX+fHmtSsyllPf8mIWe1tN8K
	0eqwlp7p67NfnmQBWacTxKHnRvVDLvCM0QYJoAXjHZckpBIspcAIR8+VYJ0vDJtLnY/nmPRUA7W
	eMA==
X-Received: by 2002:a17:90a:e7c8:b0:38d:adae:4866 with SMTP id
 98e67ed59e1d1-3933bd2066dmr20117316a91.21.1786921336732; Sun, 16 Aug 2026
 16:02:16 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 16 Aug 2026 16:02:15 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 16 Aug 2026 16:02:15 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <beecf36b-b0eb-4691-918f-fd39f46d5d8f@linux.intel.com>
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com>
 <20260807-gmem-inplace-conversion-v10-15-2fc18ee6d3ba@google.com> <beecf36b-b0eb-4691-918f-fd39f46d5d8f@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 16 Aug 2026 16:02:15 -0700
X-Gm-Features: AcwNN1Va1JdlpRRtXfl-rgaiOwbgkg6rBN2xjp1zNZlzVot1c-IWzDKRKQ6t494
Message-ID: <CAEvNRgGtnQfhCkrWah3jNeivbHCQqRSQEXs=uqJhBmS+GVntrA@mail.gmail.com>
Subject: Re: [PATCH v10 15/41] KVM: guest_memfd: Handle lru_add fbatch
 refcounts during conversion safety check
To: Binbin Wu <binbin.wu@linux.intel.com>
Cc: aik@amd.com, andrew.jones@linux.dev, brauner@kernel.org, 
	chao.p.peng@linux.intel.com, david@kernel.org, jmattson@google.com, 
	jthoughton@google.com, michael.roth@amd.com, oupton@kernel.org, 
	pankaj.gupta@amd.com, qperret@google.com, rick.p.edgecombe@intel.com, 
	rientjes@google.com, shivankg@amd.com, steven.price@arm.com, tabba@google.com, 
	willy@infradead.org, wyihan@google.com, yan.y.zhao@intel.com, 
	forkloop@google.com, pratyush@kernel.org, suzuki.poulose@arm.com, 
	aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Binbin Wu <binbin.wu@linux.intel.com> writes:

>
> [...snip...]
>
>> +static bool __folio_safe_for_conversion(struct folio *folio,
>> +					enum lru_cache_drained *drained)
>> +{
>> +	const int filemap_get_folios_refcount = 1;
>> +
>
> Nit:
> After adding the helper, the use of filemap_get_folios_refcount seems
> less obvious. It introduces unnecessary tight coupling with the caller,
> though it has only one caller currently.
>
> Is it better to pass the value as extra_refs, similar to what
> lru_cache_drain_for_folio() does?
>
>

David also suggested [1] something similar, please see
https://lore.kernel.org/all/4c638fc5-5a74-43d0-b5bf-d7ef893cb994@kernel.org/,

Please add on to that thread if you disagree with the suggestions!

>> +	if (folio_maybe_dma_pinned(folio) || folio_mapped(folio))
>> +		return false;
>> +
>> +	lru_cache_drain_for_folio(folio, filemap_get_folios_refcount,
>> +				  drained);
>> +
>> +	return folio_ref_count(folio) ==
>> +	       folio_nr_pages(folio) + filemap_get_folios_refcount;
>> +}
>> +
>>
>> [...snip...]
>>
