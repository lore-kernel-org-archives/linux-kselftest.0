Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC7D3B3BE3
	for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 22:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782340311; cv=pass; b=Y7QiLQEhkd8gDoGM2PSo896YuoUroGJWoTrrmv4fznyxomsuOp/ma+BW0Xpx2uXQvXjdmbi3adDJn422/gtelNWokQjJ4HIhEtaVDdrA7iojEA11/5gq1keBfkhZUGVX/fS+ziwu7jWIkIrutXwXIq89IJpuJo06O9hA+ASoj2A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782340311; c=relaxed/simple;
	bh=Ac4SnsNXN8rEQTk23iatkBhfXxnOeNd/KNnr5r577/A=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PHGIU/eNfPqDLnoRvIzjjrjWg84BLAedr03wdjPBDE39oeCkgYl3JBBsV4gWqULiyUh/bpFby7iizYTMIUL0hXozy+UZZTKFiIhwnc2CnrhqHEiryajBbv8qMZUqebBcARFmw6csD55MBSlQIPMpDFMp/sxlV3jIgyEEZek5QMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kXObEAmO; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kXObEAmO"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-13986d61b4fso2351253c88.0
        for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 15:31:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782340309; cv=none;
        d=google.com; s=arc-20240605;
        b=luM16BS+Rk/p2D+TbLRQDoz8zdipXdXlzIKpN3wp/3/KC5QwfaA65ROU6xKOCh30e2
         uh+xP5/3nIJJ2YgJtP6T7c0rsDp2N+y3Z5/bYTUf3RNkWUV9H6pC1+44k/WJZm8HyoOh
         kK96d49n5xKaSQHcoTgeQmFu/x7yLnGRu07seHSEsihpusOXSSdBi3Ih/koBQsjk5v+H
         y5JDS5uRkTTzI2RxFFSnlKFHaZM4D6x8RU4w/+FZruXPUela4To02rK0iTuq95ni1Zbp
         I1BghoUd6rXrtrpxK+GpNIgGkq4/7TkzbR7bTjCuIAK7MrU+Dh4IrWu6rXYJ/fzgjlz6
         cTww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=N6i/SOXitQvG69KsKOuqXfKe3MaqkPv8vgabs7K/yu4=;
        fh=gXfCNT/uRB67h6P6dfF5IM+yQ0OrNamtEqwKp1qMyw4=;
        b=aAk3UjIXtQWTzzKjY6gqKQOQiSVrzOIZP/DjTi5CHQ0GYyvksAbK3mGwwMzV4T0D5p
         0gHEZOG8i5/ov5jh+OQkoUb/yGx8r5+2qzttmJ+oDi8/35yZ+tezLeR/qlQO1eoRkFUU
         k4z8N05dfiXSehfK2lj6/Nenk4HShzRCOWyOQo4DHxEQ0zS1+g2XwXr6gMJaizdV+GRs
         aucnl6Iv6T0m1JhPNq7HhUsga6Fku0ctcDIgV4KviQLgHw7BJfYL+U+s7ZgKkC5+bub8
         HNaNe4kJP3Qy5dnv7eayoU50zkrxOsMliEJiM8SFZbcG3cz0qJKTHUawNARw69qw1nsN
         7GUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782340309; x=1782945109; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=N6i/SOXitQvG69KsKOuqXfKe3MaqkPv8vgabs7K/yu4=;
        b=kXObEAmOeWU3iGzGqynePW9vunurhr4tXDrm3kJ2Cz9dCW8c0pi4ePkiJhdBbB0r2h
         w2/+t/hVRBLgpq0dTtIQvLqCJTmnZ16KNtEGT3BG8nimWzD7EBPiMzIYkIrQ0jsf3cbH
         LqCrTgOTl+1z4VqvDpsuuODCr33rr3qU+phQFm5bVgbQMlqnrTmNVDjU7+JqzSw+vOMc
         ggWC08/3T+MlomMQSP2Eeb7JXdSZK2ox02iFGX6yqQanH03l9+ftp8gaFMwFSmIDKEaK
         ybqAQ3aBIj4bBlXeIN1nGnVP+fb4On6GNfk4+S9EYul2hXXeZBoE12ny+sl//VsX8LrI
         PiqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782340309; x=1782945109;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N6i/SOXitQvG69KsKOuqXfKe3MaqkPv8vgabs7K/yu4=;
        b=qNkxUpc1H9Gv6a8Hry5xXmD0I075Qyqr5gC/gfTQ8IZAMPdBYvMtJ8o6sesVLce22M
         qu4aEGaR38vZlER5DkCqdvXmgHvWrOjeqgncu6TWq1y1KZG7eVBZW4Q2uVry1XLaKemu
         SNbhHDMR1uDTpAef29MTUTZvtIkVy8k3G6JHf1JDquIz9dYyjs3lo973nuKgz7RBdOls
         VZ3bgVPnLT7QEt25GP0iOFIpv3RZfi/skPSscjRjHs4ucwcqj7hnssORb4IQ4YRowTMz
         6AB1OdYdozUT5HyK3hGynMg7L4B51IsGXtq4Hg0SOUnaJEGYyiiBqVp0q3rYpsOPklWm
         8M7Q==
X-Forwarded-Encrypted: i=1; AFNElJ/IFNd2LE8sVU3aGKUlumA9BJugKRyve/Guw2U82iG7CTOEbLcN0TxbmCujyQWzfvsZAGa1P4xsK49vofvCJv0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZxxECxTONrukQC2DDZq99hh6hQDUEhdvN2+kfv0t2WWVdNByd
	yH1dvLxW2yTlVksNe08TRVL5QwQ29rd53ebaPT4dc703YlD9AY1rPqcs+Su0Ac1QwWqCt+ifeC4
	R5vKcnkWlkb9bspngFPyF05lBF1EoaKTIRoJ1dB/9
X-Gm-Gg: AfdE7cltqmSFhHi48Ehke+fJhG6Za+Y5j/dSfkZ3qSEAAy+/ihY4ZzsCsFSMlXVpBJD
	Xy9+t4DS5Y66uxvQOp1/4fECoT+F7aQT7LC1Z0U8wq+oq/gbHn7UNClDuPuz6fV8aE25MT+ufgm
	W6kF2IttCIbfdISVpJAwl872OJy9V7BCn9OulX9wtwADRfquY2Hf0VYtt0mPHa/a1VHZI6hIKqv
	MMxz9nDBmzcBhtfOlECO1V1sXCFMOmC8Y4jbAD49/vamz7diRVeDX6qRgRD40sf9FnsSjiBFdA2
	8wi1e7SKNrG+o1pGANIvTG2ENeMs+04A1HqcrPm7JAWHkbZl8uaXs7e6ek31doH034f9aw==
X-Received: by 2002:a05:7022:f687:b0:136:e639:9c05 with SMTP id
 a92af1059eb24-139d0c976b8mr3775881c88.31.1782340307804; Wed, 24 Jun 2026
 15:31:47 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 15:31:46 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 15:31:46 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <CA+EHjTz3SW50EzxgXm8VysoaM21RReUVG2px_WUYU7zUwjXnpQ@mail.gmail.com>
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-22-9d2959357853@google.com> <CA+EHjTz3SW50EzxgXm8VysoaM21RReUVG2px_WUYU7zUwjXnpQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 24 Jun 2026 15:31:46 -0700
X-Gm-Features: AVVi8CdGjNdamkK1obuu8yqfMxgZ_h-GaO78YorUefDXnXrkakD9WS-D2oU1DQk
Message-ID: <CAEvNRgGnSgYBwsgTh34uTTBvah12SE55LW=7Dm7RQX2U4sA7Jw@mail.gmail.com>
Subject: Re: [PATCH v8 22/46] KVM: SEV: Make 'uaddr' parameter optional for KVM_SEV_SNP_LAUNCH_UPDATE
To: Fuad Tabba <tabba@google.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com, forkloop@google.com, pratyush@kernel.org, 
	suzuki.poulose@arm.com, aneesh.kumar@kernel.org, liam@infradead.org, 
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
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Fuad Tabba <tabba@google.com> writes:

>
> [...snip...]
>
>> diff --git a/Documentation/virt/kvm/x86/amd-memory-encryption.rst b/Documentation/virt/kvm/x86/amd-memory-encryption.rst
>> index bd04a908a8dbd..29409297f1ef0 100644
>> --- a/Documentation/virt/kvm/x86/amd-memory-encryption.rst
>> +++ b/Documentation/virt/kvm/x86/amd-memory-encryption.rst
>> @@ -503,7 +503,8 @@ secrets.
>>
>>  It is required that the GPA ranges initialized by this command have had the
>>  KVM_MEMORY_ATTRIBUTE_PRIVATE attribute set in advance. See the documentation
>> -for KVM_SET_MEMORY_ATTRIBUTES for more details on this aspect.
>> +for KVM_SET_MEMORY_ATTRIBUTES/KVM_SET_MEMORY_ATTRIBUTES2 for more details on
>> +this aspect.
>>
>>  Upon success, this command is not guaranteed to have processed the entire
>>  range requested. Instead, the ``gfn_start``, ``uaddr``, and ``len`` fields of
>> @@ -511,9 +512,13 @@ range requested. Instead, the ``gfn_start``, ``uaddr``, and ``len`` fields of
>>  remaining range that has yet to be processed. The caller should continue
>>  calling this command until those fields indicate the entire range has been
>>  processed, e.g. ``len`` is 0, ``gfn_start`` is equal to the last GFN in the
>> -range plus 1, and ``uaddr`` is the last byte of the userspace-provided source
>> -buffer address plus 1. In the case where ``type`` is KVM_SEV_SNP_PAGE_TYPE_ZERO,
>> -``uaddr`` will be ignored completely.
>> +range plus 1, and ``uaddr`` (if specified) is the last byte of the
>> +userspace-provided source buffer address plus 1.
>> +
>> +In the case where ``type`` is KVM_SEV_SNP_PAGE_TYPE_ZERO, ``uaddr`` will be
>> +ignored completely. For all other page types, ``uaddr`` is optional if in-place
>> +conversion is enable, i.e. when the destination can also be the source, and is
>
> Typo: "is enable" -> "is enabled".
>
> "when the destination can also be the source" is hard to parse without
> context. Maybe: "i.e. when the data has been written directly to
> guest_memfd while the range was in the shared state".
>
> Also, how does userspace discover whether in-place conversion is
> enabled? A cross-reference to KVM_CAP_GUEST_MEMFD_MEMORY_ATTRIBUTES
> would help here.
>

Will fix in the next revision. Thanks!

> Cheers,
> /fuad
>
>>
>> [...snip...]
>>
