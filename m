Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1603F8243
	for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 21:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786397349; cv=pass; b=ejJIWJ0AquEfChdpepr2ND42J4+doMYINLCnZMSFBBhxU2V2Y8nExSouqSr91iIIUio5tL25r+rd8nfenD5wJor+aksWfhXO9hRdgxmeTy4uVOGAO7lNMu0h3mT9yBM1UVnoEkqOOXXXBsj9mcK9qpiI0Q4/I2EBq0iUXci4fLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786397349; c=relaxed/simple;
	bh=wN+q38rdlKIr22xrGQOunHcrcy7dQztjwHhaozPCfDU=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rIU6BXFvQb/J6S+DZyWuAWcaEOZe6U7XFu6vMDyS3YCs4wXZBMRCiaiXkrE8LcLCfsLl5lK1inWH5oUOuQGiMDeA1M4CKksJnsKIZgX8DSFgj/fwfoatSx8fGqPpGJweTYaw5vGVgzCSTI9hljft83ZL250dwdDa1TzRpWsf1NA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sc84Gh/R; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sc84Gh/R"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cad8076b01so1837085ad.2
        for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 14:29:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786397348; cv=none;
        d=google.com; s=arc-20260327;
        b=YW63Vraqwn34P+TPagruMi4ZO/SM3bnO+FXE8Zq8me31GQ5+CYcKWaoboondYsTBR5
         g8oK0+qFyePlk574nJ0TBFNudw/kYqEwgJIPZEYy14IVQt6DIskTsTc790G1bbd9cn2/
         6UPDF4wqGlmNCcdDhTwh3KZK6+hGn3KMQelt1JOc7hCVNCiYfhcZzAgJ0CSAgHdi2Rau
         VEwKAThWekmJAB7ks5PLgXf+xpOwxGeKxYP14H0nDTgYC1RlhBRwZ2zjGX6HGaqwWsZ/
         6inslWu4FUZEDV7t1JU9AuVYafFueqGhqXKPz6kQyTjqRIw8IVtiTuLf233R6lMm3PBt
         xfiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=wN+q38rdlKIr22xrGQOunHcrcy7dQztjwHhaozPCfDU=;
        fh=Mo/k6akca8syuY8Z7nnNEL5B1YTprdbZV15GbAxyAco=;
        b=nRMxOjdkEdvZDvWFMkUJPqWJPPt1CT1aSIy7hMS5wdoAomWThtPP+uMIAVUVXleVe/
         cvWU+W6j6em7LU+A0h5s7S1hDVejaoad7TZNlDpjJrYkqvB0uNRGFR5hcjdcY9HmFugA
         TQdrlwlw04RcOyWilS6sATNdYLIteF4OmdQoqjQEgQjFVbFQuqhlFELPQZ/iLGDJLiEF
         WOdd+5sbcjXnoJnmjxh0qrgb4jVUCK3p8KiFzBU9h5YWJbx6bj+1K6E/+KC5ApuV7r4q
         LT4Qil7zBflKfI4ZKrAbOfpvk2Oam6g/E1UeXFtng0PBlzpLJZ/IPTFrHd1Kp8jJibsw
         rHHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786397348; x=1787002148; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wN+q38rdlKIr22xrGQOunHcrcy7dQztjwHhaozPCfDU=;
        b=sc84Gh/RC1fJT7FD4YKcWetEE7zL2nWKMj/1RSzjh/2nFq5aLkn/aYPRwl3ChtRsfk
         63ATih+/9geGVWmXhhQ+VEW8HK7suiKvASQfQoPC6JNmfrHvthl5vVxBr/HGNDwHzPAI
         VOWDGUeT6zemAzczPO8rRe2JltFMRTdBi1vluKQkS/cYOZfhEmbtsvSv+r5JzCk2E3RF
         Y0qS1GZZ5Wc1jhctkFQk+rjb2TTdPEZZCBneO3xv3rffcilua5vGRNfI1F9gPhpOgUJQ
         Gvf5du4fbcIrY7Tc+sByKjOs7hCsGOi09VBnQGOJccJjpbUCK2bk4SVwLf25NgGaLslQ
         lc6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786397348; x=1787002148;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wN+q38rdlKIr22xrGQOunHcrcy7dQztjwHhaozPCfDU=;
        b=oud9vJw3OzDrUABep1uCqDNfnNZOcRa+uSZ4YopuhFFhO6xYMrnzBYLzpegxKhn+4I
         L3aJeE63vJbt67fqOvj4Il807cw+QlVWs3Eb3QrQ8jo0bNTFsikct4nvP+Bj3oxyLKCR
         /t+uZdcSvT0LcAP+x0xQwLNj4uN7svpMZlMuHA0P+AvTXjOMRcO4ZqqUO3GwZXvFR6V9
         gMf1KK0SlvtoWwIdAnoPSXoHPeEeRBscxNU5i4Yfw5DVb04KjM0xKIm7YlAlHV3ADzrv
         vgaqOWAbOz1nXnuI0uX/k5BxFg2rQ9BgKcN9Vu38EIerN9gItKuBWmF6ItcgCdIMl680
         v0pg==
X-Forwarded-Encrypted: i=1; AHgh+Rp5jGb7CmorQPX9quHLLyRaY0IqmLj/JT917cQ8dwYp6I6wqWJnpFRavDi1R8JX65AK7HOv+5WmRdRLJcQ3QOE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyX1sbgWlHgrLt2THW2RFRAhDZDoJKZPXjtiMFwiNWnTMXpTa9L
	rEqARa0BZKh9GUNhikZslQKRwqg0f5l+rFl/2wIf/D3j3ujdKxibT/jKPpImgBUPoraqLxErsFK
	afrL7brHWtPl5VGWsPvgcGuOB8FBStHDVUFMcnhiC
X-Gm-Gg: AR+sD10DZWOjs2qZ4zWXyyWFPwXYXHL1h11D11Vosj9ywLIG5RRVz4dDz+P6dEKTGKd
	8D1/6LpQ7gQlmJrCmMHyE8HUZ0hf5bdYpErg0AKi3PPmQaJcLIB6mAIu4SSNDn/E98X4icLefV5
	yQjAEXKGpBMmc2sRcfRc9ZXUWx0A0HCf7k2g4QUOlEVlq3BxMopGyvkxM2cROmYPt5p92MZ4CBg
	x9lD5i3tWS25wL+b8wfvhsxG8uCIPlZ+NF+1nt9d2cjV7Wjr03CszfV1tRqMbClosWaTzxkN8It
	7uYGBRMKrG/2cb/0+D83PQ5VUbmk4S8S9wLCgr47eAqAPvT7zU26ObyH1QnYfo1MaKmLZvb8RGP
	7bsFvGrhYMBhgxrrwwUfkgryyYhEtR6maf6o=
X-Received: by 2002:a05:6a20:4321:b0:3c3:b57b:6291 with SMTP id
 adf61e73a8af0-3cb85e6689fmr49405061637.18.1786397346906; Mon, 10 Aug 2026
 14:29:06 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 14:29:05 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 14:29:05 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <aa545680-2fee-468c-ba34-cc9beb16f4cf@kernel.org>
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com>
 <20260807-gmem-inplace-conversion-v10-15-2fc18ee6d3ba@google.com> <aa545680-2fee-468c-ba34-cc9beb16f4cf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 10 Aug 2026 14:29:05 -0700
X-Gm-Features: AUfX_mxwV4sMMEn8xD5iLtETNHGAZsCJNscksNcNQT60_O-j0WNrenHXqsrVJ0k
Message-ID: <CAEvNRgFSdddvuT8ZJUPOC9BCAtBgx6Vk=UbbPZ0nTAz8M52dSQ@mail.gmail.com>
Subject: Re: [PATCH v10 15/41] KVM: guest_memfd: Handle lru_add fbatch
 refcounts during conversion safety check
To: "David Hildenbrand (Arm)" <david@kernel.org>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
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
	Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

"David Hildenbrand (Arm)" <david@kernel.org> writes:

> On 8/7/26 23:52, Ackerley Tng via B4 Relay wrote:
>> From: Ackerley Tng <ackerleytng@google.com>
>>
>> A guest_memfd folio is safe for conversion if guest_memfd holds the last
>> references on it. Any other references on the folio may indicate another
>> user, and guest_memfd cannot convert it to private if there may be an
>> existing host user.
>>
>> A folio will have extra refcounts if it is present in a per-CPU lru_add
>> fbatch. guest_memfd does not actually participate in LRU, but
>> freshly-allocated folios are still added to the lru_add fbatch for batch
>> LRU statistics processing.
>
> As discussed, what would happen if we mlocked gmem folios? In that case, they
> could also have been added to the mlock cache (which we treat like an LRU cache).
>
> But that's just a comment regarding the text here.
>
> [...]
>

To make sure I'll get the wording right, let me know what you think of
this (will replace the entire commit message for v11):

 A guest_memfd folio is safe for conversion if guest_memfd holds the last
 references on it. Any other references on the folio may indicate another
 user, and guest_memfd cannot convert it to private if there may be an
 existing host user.

 A folio will have extra refcounts if it is present in a per-CPU lru_add
 fbatch. guest_memfd does not actually participate in LRU, but
 freshly-allocated folios are still added to the lru_add fbatch for batch
 LRU statistics processing.

 A folio may also have extra refcounts if it is on the mlock fbatch.

 These two known "usages" of the folio are handled calling
 lru_cache_drain_for_folio, which drains both the lru_add and mlock
 fbatches. After draining, if the refcount is still elevated, then
 there's truly some other user of this page, and the page is not safe
 for conversion.

 If the page may be dma pinned, DMA is obviously using it and hence not safe
 for conversions. If the page is still mapped after guest_memfd tried to
 unmap it earlier in the conversion process, it is also obviously not safe
 for conversion. Exit early to avoid unnecessary draining in these 2 cases.

 Provide a drain status to only drain once ever while processing a batch of
 folios.


> --
> Cheers,
>
> David
