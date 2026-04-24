Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B7B3FA5C5
	for <linux-kselftest@vger.kernel.org>; Fri, 24 Apr 2026 19:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777057729; cv=pass; b=rtavt4JA0mU6XdJ7ogd1mpwNUg78uKC+v36caDNLmwFj2V1PuYXdsWiWVosutnrUntvsMR8NgzBtWnuNadxdfHf+4heGbX3CXBDvad8FgKrMilfrgPaPl0qaWM5ci1OdVEkJRvgtAuaMPRkemSGl01Sv6y9T3U8dN9Raw2CJA8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777057729; c=relaxed/simple;
	bh=RZtEXtNhHfkNb6REgZmVRn/FfCDvY0I1XuFnEkLVDpk=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nN3BXZbu/bwWVg4K1PqqspO9LBGX299naQj1eAz4MKZQh8+6qjnECkwRX89Izg23zUn9KrjFHirh1ICwYTC2chUFc10teGLBe23DDAu0FyXH+u5oAF8mvsJd/wqRyfXAnFjJa7lqga0Q0GpeEl9QVzVUTmHqCd8yd4IbXmFq8c4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Wn8Zmut6; arc=pass smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Wn8Zmut6"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5637886c92aso3342923e0c.0
        for <linux-kselftest@vger.kernel.org>; Fri, 24 Apr 2026 12:08:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777057727; cv=none;
        d=google.com; s=arc-20240605;
        b=ZgtkL19bnVURsJxTdPF87NSKiFZBCSEaLZt2pvAzu2c70nIRPawfassvucrL7DyQV3
         WO/ddRdlUAh3MBpj6QQDwPZCoK4sdGNu5ztdnDOr72hoH1jmbEOsOMXjjbfMZIKjvkR7
         17VdnXI9KPRpvwY+zfZL91pnBGLdFtyalye7yLSH6r68gB0KPUbFixrbGMYTLLTeqWik
         Ls1By+8Al7FeOoz74K7gztcVIrq5CC66X2xekDBKnO0tIzcn2xPxbeN87Ra2Wn+CYhjz
         CUOnYqGPegYyRIguYXa2gycS3XsWkzT0AyD2B/dL1NazRJ0/qU3B9InFigjkQUQwYUEd
         fJcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=RZtEXtNhHfkNb6REgZmVRn/FfCDvY0I1XuFnEkLVDpk=;
        fh=Y2WF4A2vQvYvr1+qmBBhPNh35K1Np3asBVcIORdbP60=;
        b=PI43/hLhNqqLJu2nz0fFNb+jVYE6w5yOb9r5c/u4Yobc5JUGfXl4FFcyk5XR/P2d98
         QeWrZy9NfqLgB0YSTiZ49wSzpcq9PARFa5vWzWe5TgEeha2TuSB5JZERpsrWQBGFxDub
         cyHGr1TO6uWoZKDkynfb1hXG1qdBfd4T+9dMbOQ7m20VLggB4U+htNeenALiNgt9Wbvu
         OX6tG0OKMzhmK6oPlAHTcuElk99qELzYw6AcBh7FhsvBB7vVOIty/Qna4Qwv13T3WVr4
         hM2COO331DLx8T7ub7t5h3xelj+r+e1BtMvhgtt5Mggixs5R5TGfqJfaGqPnyQ/lVtyd
         7HlA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777057727; x=1777662527; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=RZtEXtNhHfkNb6REgZmVRn/FfCDvY0I1XuFnEkLVDpk=;
        b=Wn8Zmut6TaIcmSg3y5Y5a+blYeLvO3T/F4cHcw7Y8e65aB9j3gDdqe6JDEYmFaxXsZ
         uIQGVA2a08X7iOx8+HCedIzhEYlzfqxt7TxqduTtq6glVAcYLTiwX5qcK2CUN/+nHq+4
         Jo13b3vYy8hS6wAtD1oyrYQ4hn8tPCncQFjs+VGwm7irmd1cXip0GMtJKIO+Db+OMYLQ
         eSgAOsZe9TTW14NiWWp0Y4karM6mZgVQLZQJ4E5+zz9bwtbeNA8z4rQe8troqd28vD4S
         fDYrv12KqJkch1N8sdlTMc7ddWq5+lsgB3TbbljGW6d1Er6BANNXjsQj0T96BTN9ztdB
         jvtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777057727; x=1777662527;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RZtEXtNhHfkNb6REgZmVRn/FfCDvY0I1XuFnEkLVDpk=;
        b=hdUz0DTSdnzbMuA73KDk47RalP0klaQwIAyIdOMF32p7r7KwUCzIiuhjYmImSJNP00
         6k2BPi6uJgxHl0+eJACb7fdf2GTpmxWoBLzRRDkqql0/vOwX2NOFD3qZgm0pD0mZYYWr
         qycgiAM2/BytoOMyHc7Z2vnqVhnMbwZ9S/aodniOZ6ob9k/lUHEnI91T7MFsy9hA7jX9
         47nkfx80QO9UmhiUafzHDTJHLvQk4omU2cupIcjf6CrUb3ufFMqVVygJiFFkGh1thnBj
         M/9aIRUrus8gkEIK5/8Uxb9nWQONvhRZ5qiqoGRoZSyaT5q0gm8s9pGv79Fchn7seWvI
         DB/Q==
X-Forwarded-Encrypted: i=1; AFNElJ9GPVezuvwRI4zdWK1fCE0fJmh71+o9Qg8f3gBnaOw/EV0jniWQ5f+2BVi6/orY+GZZQXVZrfSmQPQwUPJCxpI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVJsH6MQSmLT/TPK6mCSHF5nwli6ZKN14Vl4BE8zQeWfKUOukX
	oSgXtl3uuarDLk3+0dU/vLh5AULt4g/LpVKd7hvdLM24J7yBl82sXecGK8WHmOVn1Vrx+A7rYEI
	xm1FG9jWp43DCzDACMctgKjjtUwjHAycjf5FrKVUw
X-Gm-Gg: AeBDievLfB7G6Z42FGlBFDk9dRMEFvpmQSlZqGhpvSPyf2bkJHL/rMrDGLqgC9GY6m+
	Hclt3E+fWQUGoDdCv2WSBPbGNJLsQkQ1pgNAjca9WVRMBMIRNbBU042ZlsU3sVgQymgScoAcfGx
	3mkcUOhHDhCn2+WkXbGUpezhR46hINk0UMDmVm0swkwq9/JZePtBZAoavbTIzV2Odxcyj7gYTYE
	yuVS5/WVXwMiHrmXsJwYXafgg63hHqyBraqDF19kta0QoiGLj2Qhqv6PH9gbBMiZDPHGqjnMvfu
	Rq4Wklzo5RJY2a2W0A2tC3YXDhNYD+prnJ7rmmopzpXPTi3QcDdtrhXgCRdNidKTwPSMXukTm6m
	OvhTQ54EVlI9/XkA=
X-Received: by 2002:a05:6122:8b8b:b0:56c:ddbf:57e2 with SMTP id
 71dfb90a1353d-56fc6816e2amr12940121e0c.11.1777057726762; Fri, 24 Apr 2026
 12:08:46 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 24 Apr 2026 12:08:45 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 24 Apr 2026 12:08:45 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <3blpenhpvysb2ig7efegedx4v3flppl5ftnz6vhpqlatfk3ycn@vmmhs7mvjieg>
References: <20260326-gmem-inplace-conversion-v4-0-e202fe950ffd@google.com>
 <20260326-gmem-inplace-conversion-v4-10-e202fe950ffd@google.com>
 <2r4mmfiuisw26qymahnbh2oxqkkrywqev477kc4rlkcyx7tels@c7ple7kdgpo3>
 <CAEvNRgFkusZeKxGctUpTTbYjdi7nZL1ZZar-gT7XRUOCZ2xtpw@mail.gmail.com>
 <eiiecl7jvywvqb4drq7cchmcabcrdka25wxr77uavxqineeedm@rfcnhdz6xoxf> <3blpenhpvysb2ig7efegedx4v3flppl5ftnz6vhpqlatfk3ycn@vmmhs7mvjieg>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 24 Apr 2026 12:08:45 -0700
X-Gm-Features: AQROBzBye4IStJFmb-zjsEcLePEkodFuzsfbkbSYLrRwBVn_bPHs_yld_lwLStI
Message-ID: <CAEvNRgGbMhkX310CkFY_M5x-zod=BDTiuznrZ0XvFPUK7weL1A@mail.gmail.com>
Subject: Re: [PATCH RFC v4 10/44] KVM: guest_memfd: Add support for KVM_SET_MEMORY_ATTRIBUTES2
To: Michael Roth <michael.roth@amd.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jthoughton@google.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

Michael Roth <michael.roth@amd.com> writes:

Thank you for your patches!

>
> [...snip...]
>
>>
>> I also did some minor updates (prefixed with a "[squash]" tag) to advertise
>> the KVM_SET_MEMORY_ATTRIBUTES2_PRESERVED flag so it can be used by
>
> Though I'm not sure how we deal with it if SNP/TDX at some point become
> capable of using the PRESERVED flag *after* populate... but maybe that's
> too unlikely to worry about? If we wanted to address it though, we could
> have both PRESERVED and PRESERVED_BEFORE_LAUNCH so they can be
> enumerated separately from the start.
>

Not sure how likely it is, but if SNP and TDX can honor PRESERVE
semantics after populate, I think we could implement support under a new
flag like CIPHER.

CIPHER can then be used to mean "do the encryption or decryption", and
for platforms not supporting encryption, they'd stick with PRESERVE?

Should we redefine the semantics of PRESERVE to be "ensure that memory
contents don't change while guest_memfd tracking is being updated" and
avoid making a commitment on how the guest should read the memory?

The above update would be aligned with ZERO not being allowed for
conversions to private (because KVM/guest_memfd does not make guarantees
about the contract between the host and guest.

This way, all of those (ZERO, PRESERVE) will focus on KVM's interface
with the host.

This lines up for SW_PROTECTED_VMs too, since reading memory that didn't
change in the guest is the contract between SW_PROTECTED_VMs and the
host.

>> userspace for SNP/TDX in the kvm_gmem_populate() path as agreed upon
>> during PUCK.
>>
>>
>> [...snip...]
>>
