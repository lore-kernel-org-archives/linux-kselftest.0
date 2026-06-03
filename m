Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58AA631E85B
	for <linux-kselftest@vger.kernel.org>; Wed,  3 Jun 2026 22:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780525030; cv=pass; b=Rk/c9uIJx8VcloTnuSHck/8DuWaGZ/F1kyhruReZNDTeoIYXDdoikKksDoppMtIgHcrtSdvt33WPB9NQmtzKkVMKKxETrSWA3dvuiJ7QINdNHqbV0M9GFBsZ7nZeeo4HsRwnvEKiHPqVtMzUIQROPBxuG5MGXkw6OUcp1SRoYB0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780525030; c=relaxed/simple;
	bh=gx3Oklyhw4/29KJrqtyCgK2OIzmZLnxgN7Pih2TRWig=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QFjEi7N6h8dGidyq7FjT/gvlotWZbi428GGYNFOERhTDej/Y3ckV26XI+pjFdsARKCNDZZ8kq48sdDRbywr5kYpG66QTiG7ArhpBdq1rSruUG+UQJcexubQBq61SiqXio2qMB/xU4iIAQ+xPu1RE0RA3cIlT8ajx4t0l7xW1a+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H4SYhr2u; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H4SYhr2u"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-13721dfd471so59609c88.1
        for <linux-kselftest@vger.kernel.org>; Wed, 03 Jun 2026 15:17:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780525028; cv=none;
        d=google.com; s=arc-20240605;
        b=TirDJ0v/J9d7G7kQPoCZfCPHLFmoDGLBqzy0W5wpYOnnWHPA2QQSn6rEPi1rarJiaY
         uKR9cZISCJWwRTQdZOpuINQeEGXscQbV3yQwXuyONBdNXuCOjxTqGApD01PHYqd2S+1n
         xG2xXSDfYsR5FgtP3ivFeIgvwdcGlxSuExkkLnKoUjM+eHwZ95h0M2x8FPLJQZbjb+m1
         qeYJS7wOa7Tw/6bY3mYTdDMWjkV9mDXZPkko8Ygkc4MIbvYchmzvI1r8YeNaUYxwL3MG
         z1BbTEhTC55ef2gEXnHx8eOIxIH2qxF3cqm8TDdGkR7JCy0mnssmRh0yOZxFyeWfElcz
         /F/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=V6pazkEL6DFXw7u78OwlQURha9CAXkBpjIcDT/R6oxE=;
        fh=DjwjZqbA2o9wy5+c/4zIHeDSepfyElNLs74I0nWdSKs=;
        b=JATb+wjOQI8gLC9iXuKZ60mSvFdqee+TiMVyvUiceFVYgD1VszuJ84BhR1avNfduQj
         6CR6wUAoTHNanDykcYQ3uDpuEIsuLuCpe8dcPpzCoesBYXoFZjv5QNfVg5BmO5qNk1gw
         4qiaNHKAlj/jZjSZFbzeO6tB4PbzYm5Hd4OFOak7VD6S2lF2tn9g/kswh1dyzkQQTCpl
         e63VhzG1AI4aBNC+OA1AhU/m4T1+tkmQcZPMPblmrcKLqxKVJrMiUD1jvnu3SDwpcNWM
         +OaXbHYFNBx0LdwSr8tqFIN5fa3GpfayOw9jquA1Qr5Q97pLhgqqWbxFYGe5d874HLFd
         8Z/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780525028; x=1781129828; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=V6pazkEL6DFXw7u78OwlQURha9CAXkBpjIcDT/R6oxE=;
        b=H4SYhr2uRLDPzz6f83p5O1Fer8tULbvijZOnixRCgPM2XuQ0Qqm5bkxekfoA6O8pLU
         LFu3tR/Bggkc21XKyBY+nkh/9nrbQPsTzbaDis9Q49I08+fHEMCyRwNOmUjhiA313Utc
         NV6f9RLeJJ/LzV9JePM/H9ttJjHsB65yPV+wzNZuYk0u7XXxB50nbqrZgVCv1A7RcYWb
         jA597R8xdbOAu5HX3aob4HCoogIXuiLckfzkbj70Z9O1fbigqRCZYEaYmEoGTo3Z2fZG
         IAmxnjjpD8+NzCHCQvk0aUHc/aT3L3RMJP9IrzykbUn0h5t7A4DWdciV5l04/UKpB6ng
         m23Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780525028; x=1781129828;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V6pazkEL6DFXw7u78OwlQURha9CAXkBpjIcDT/R6oxE=;
        b=N1g/PSZ6BHItG5KkVDUzBd/Z04Yd+o1BF+Jq1z75z4qNROYdu75GOwB2iQPj4S1mKW
         oJj5YspIz5lrnatBQzytNv5sypCHBkst0lQRj1/mPsCvpwED1fNJy8U8kAknOJkrnOJG
         4ARQhhvOj0UZCn8yf0nVyx0PVnrWkwDp6fk4FuvmGy42UE3P2g0NuYL6DnzUmcP/CD57
         nMJNr2WBGJbPZXdSYfzrzoGhYYpWwdGJCShTmnN1HXj6sTNWvgPvIV9G3g0pQTWwpDA3
         srSOfzeD2HklGnJX8H80SwG2DCnY3CPb2Zo4hrUPRFetSc3BQm5HscdC05hIK2aIXgjG
         eArA==
X-Forwarded-Encrypted: i=1; AFNElJ91H3cXKuqXX80tjGh28scGIY3CFVLOWy1YfiZoH36610BI5H/qQ3TYB/RVVnAphIM+j8qtNBDU2pjTm+e73ww=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDXWW5sfvQS6ycOjpmJMynuk4u2gNv9hxD8ITFe6+GCGDbDUmW
	eewOivAAQjrIYlNHy4f/W9TKcwaMiMC4SKgF8m2BETvcsb2skJbkPx98o6f2KPWiJunL4InkMx6
	yHlFm9J37rrOW8Gb4Ti0fkJYNJUKzv92Ry5hp6nYp
X-Gm-Gg: Acq92OFN108kWfZVR1Lmb9P0fUOJ3TPIjqd0LmjWcLwf1GWUw0YVWjmltk7ff8JqJMk
	ManuAHUJVQcaoJeQKaXndOhOu7uNJIT4ZP/ZAo8LJMZdFPmCQgWIVJFptUDuSkzIw2/1NONIERZ
	04lpprOhi8+JTBID6/R4kBQ14WwRl9bI5NT4PHwa2nnHAB1doHFjr8t5uKAO73DpgD+vjARrLYi
	TKmoVZ/4nVPkBtYs+nvLW5ZwzWVzOLMw72jQDzA1cvk2MqZ01HlQ/yUP5QiTwTKMTfcrvwID/KS
	fkABzbOuHUSnp7m/upSHgN1UGAwYrMn6XKMX5CYZC2syCwUDNG8X3JnwgAY0Qv/XwoRwmmr+JWq
	C8xFB
X-Received: by 2002:a05:7022:7f19:b0:137:ef27:e29d with SMTP id
 a92af1059eb24-137f6c126b1mr1478374c88.31.1780525027812; Wed, 03 Jun 2026
 15:17:07 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 3 Jun 2026 15:17:06 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 3 Jun 2026 15:17:06 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <ahmbVaCUcBrYK8qO@google.com>
References: <cover.1779080766.git.tarunsahu@google.com> <9huzwlwnbgdd.fsf@tarunix.c.googlers.com>
 <ahmbVaCUcBrYK8qO@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 3 Jun 2026 15:17:06 -0700
X-Gm-Features: AVHnY4KwIBznOQxPeeZp-k-7DNYvQD8SHlCWDjhKoWsxt_QvgGRs8hmrB0P3Bno
Message-ID: <CAEvNRgHsJbGz8k8vgCn_HSxeeQ8agEm4oBYQQ0+b3gFb-aVokg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/8] liveupdate: kvm: Guest_memfd preservation
To: Sean Christopherson <seanjc@google.com>, tarunsahu@google.com
Cc: axelrasmussen@google.com, mark.rutland@arm.com, skhawaja@google.com, 
	Mike Rapoport <rppt@kernel.org>, sagis@google.com, Jason Gunthorpe <jgg@ziepe.ca>, 
	Shuah Khan <shuah@kernel.org>, corbet@lwn.net, dmatlack@google.com, 
	Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, vannapurve@google.com, 
	Pratyush Yadav <pratyush@kernel.org>, david@redhat.com, aneesh.kumar@kernel.org, 
	vipinsh@google.com, Alexander Graf <graf@amazon.com>, David Hildenbrand <david@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, kexec@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

>>
>> [...snip...]
>>
>> we have one open Question left:
>> 1. How to check guest_memfd is fully shared.
>>
>> [...snip...]
>>
>
> Given that lack of support isn't going to be limited to _just_ guest_memfd,
> simply disallow preservation if the VM supports private memory:
>
> 	if (kvm_arch_has_private_mem(kvm))
> 		return -EOPNOTSUPP;

Makes sense. Tarun this was the other option that I was suggesting when
we discussed offline.

I think (?) it is possible to create a fully-private guest_memfd for a
non-Confidential VM, and even after conversion lands, for both
vm_memory_attributes=true and vm_memory_attributes=false.

In that case, your preservation series can still preserve memory tracked
as private by guest_memfd but not used as private, right?

I don't think anyone will use this combination before guest_memfd
write() support lands, we just need to make sure there's no kernel crash
or corruption in this case.
