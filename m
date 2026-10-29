Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793281794;
	b=xsg7hQbvvXfpYjs6GAdqRVO5c0KpQ+SxT9fGAnDKqtVXJm35ZRhyfZCVgMWY7hH/zB+e
	 ha8F78b7vuD0T5B252XlWITGu4wntracQdPp7yCAUqfrufnsmGBmphoJ6XvVWp8+fXNqS
	 PLKHpWxHzMyGcWlWfLpbJwputdsrMxB+3xoEeV97Gwb4G44pHAlrYlrW/qo4W+xHsMHZz
	 KjmhTi0tj5ebK1MCW2DRS+ysafHx7nvLxC1dplK1Lc6HAbakDVtxFEoEIa6p9tgu0xnej
	 jNk5Yam+dhzKl/e1SOdQdlXUqYTds8c6fMiu7WUnBc3N+2IIJeQgc2PP2rtK0Uub7Bw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281794;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=jdEzrVvS7er6a3IlsJnCTgJPsgC3VSLy9Xk054XJvXM=;
	b=k4IyQT9/llzRPUuXElMwZNgT1xBfNkh36dpH9Cn5jJ68pNj7i6CpzGdayAhj7MqWlRVl
	 lqohoBeOwHG2Bf+8KB2Zfvnrd9zNyyvb07rNqHo2uYYj9flWd4OtOvZkLlRCef8J308Kh
	 5Rk0jEdX1W3NE+GD/xMwyrfBVYt8eCZeKEj6ZSyZOpOQWVpDh5MgDIaCL9WcrorIYJhuO
	 KbwMYmeYSnlSPuk8w/CjZMQq0TmcvksuZTIC5acC0sWoy7dX7CVDC74pET/rxxJLDI8mu
	 6Bkrq6EeRWjSYHWAgftrWeUx29TVEH0rLk2Aqe0Rez19kU93jjqNkxYIp7Jij11gz3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CWV5z5FO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68A5606A31D
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 13:49:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D68A5606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CWV5z5FO
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-53665358476so23455561cf.2
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 06:49:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793281788; cv=none;
        d=google.com; s=arc-20260327;
        b=Hn45iMny2++QX090NtmMafgDED1VYt5u8w1u7ET6TMJjcDCJbtVRXEkl9g52VD3Ll7
         enSskvnMr0RbUT1TsJfuZpVJkt9oF6veWfKCkTgiLXOCuOmZXmkAQ1f1nF8Ly2IlU8fZ
         NwxdLhrjV8Rjs9dMUGJDs80UaGRnDGpy8Ku943GRYb5l76L+kW4MHtPWB1D/ZbgY5iEl
         GiVttvtY7wdpOwRvD9K6m786ZSNlT/kRFa1Uz3Nmw0vdanWzBS1reoiTi9EhIJaUDsT9
         71FKFsR402cwLYt6S4DhtrqDR+x8wMjMsgkLLKPQLEgAdl+WWhWJ+JyrxutmjuUZScLK
         Fn6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=jdEzrVvS7er6a3IlsJnCTgJPsgC3VSLy9Xk054XJvXM=;
        fh=/oN+3Q8WfPj5xi/GN4NGElYsZluJjYa6O4L485VJqgw=;
        b=rPeXkhlfu630XW/Kzn8eLATDvIK4xhmMvjaoOiVIhqX7WjgnPaiHQ0bpTpvSraYDH6
         NpUztES35KpPT0q/TKEN4baLLUgEmswLn8tlKg/y0Lt1KFyYphqB6y60T+6xu+HtxJ2M
         mwAtEF82nuByU1zGHYATgE4ZjHfDQsd1aPfB1/KLTc/dWAgL8pjVY1EnsFr1GSq7Q82X
         vaGSXbI1MCgU5zj51ipoXKz2rfNkr/mSMAj/K4baAgdRAzao603Qn26JpCseXWjXrZBe
         wMgexINotHZI+0wbRK7Hc9WhRt6t2WFM2RNYMIc8SiThv7V5WdxGNxXHBy2X+UxpfnGc
         e3hQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793281788; x=1793886588; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jdEzrVvS7er6a3IlsJnCTgJPsgC3VSLy9Xk054XJvXM=;
        b=CWV5z5FOFmpz4/rZ0iBri3mEORYKdK5sUx0gxqPpGl+YHGOu40V1Z38jQpOQUFOts/
         82omxjEaspaZos0w8KXHBORshZZby/eQ15qwX4XUUo66p7blyjSzhhfz6J61T8K8VFAp
         PYRwll0MS5PwVyzP9oBWRU8WWQfwwEZkwyXv2Q438LrNcnBfYfrmIIZRblAU8FxYFNi2
         eWf0wonUPZQrsS66KS0Ir3jpxQAVDQvZjtLYUgsfqO0un1Zn8EPDfO+qfsiqW7W03PbE
         ZGmqVlOk3J0X4W2qO+ho79HwxDtxeXBlee43H9SrG7LH6UlqmWkRzQxJBwqN4ry/WXzF
         KTSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793281788; x=1793886588;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jdEzrVvS7er6a3IlsJnCTgJPsgC3VSLy9Xk054XJvXM=;
        b=fpW7ZJEwwFgChV7civBv+cJWAHU+4yDGJHUPhpefwS4NrrVjYRrShpDy2mcMQRtTwv
         n5yAJnF0f/bW2Gqv+wW7timCyQ02hn9JQDjLaiSZNkXszthtzy2kiTZCEVeyIJwlql8r
         cCUMuoJ2u0gvsFhRaEqzxUO29v9g7ojT2DkdVUkJW/5KJRf6kFCYBWEccNFfDnHws804
         t/+N2TTRI/pAsvnlicqr+gWRMZ39oH5B1ukwEQNGjDlB0j07exGoz84OVpagc9wMeH9M
         tV2f9SRm+qHbbHk5y206wu2RVihC/gfaDIHm9cRqItmGClAPm1UmD2Ood0IKgSxhFOP3
         RjNQ==
X-Forwarded-Encrypted: i=1; AKwUvBziXiGJY9S7ONfdLFF4HEHRwYxx3p+qu4UAfXEgH5HIrjJRLNt81iPcwZWSmQtisg8ZFo3V8KSJ5DbrCg+UE+I=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqnH3TEnOIKQ6rpvz5U634liy6b52gR3f9iM9zNLQYZnSZvBWt
	AMa0hcnhAHWBw9Cg5/G1RW2U5/+ING1rJ3qi80jYl8gthqSK7tsHA4vfcpNRkoBCzCgYNbDQs5s
	QR4If2meIdZUwQA0E0ITZiRpJhwOogtwYl1az6dS8
X-Gm-Gg: AYBFou27MdC9IubiuSFvCuhYems8cyP+AtUfFlDKubEMYcHmcSjTVdoJSrGT+zNtSeR
	lb07PQky7Wv6I/dR5gJmJonTNh88mCvWpRTjBrpkiz9+8j8a7fB2UJZSS1C0pR+NLfI4dvbWhcT
	OOyTNxQp5XHs8+TAdRz4+3+q+VRS/Fec0QXjnwjxlG3zVYbGjg+ShT8DKOGVHuC5HJAmhqBgygE
	SjPAd6bU0scSsB0EwI38/Z0gzcvSaZ7+XLmqH69doYlfq0R86Yxwp41Lnibd1g65iqr1s1VEFM5
	TPmhb3rBj72TNv6aSrA87BRQVz9XiaPwU+CaqFXygYsmjt3El7PR7AwfgpeVMs6wsIS3l6qTmZ0
	6JUb1qPv3veblyw8118G+aYrGTKuzrJ8qdnPlQpzLiFxDd9mDinIDzi4PCVCX3Qsojw==
X-Received: by 2002:a05:622a:394:b0:536:702c:f8e4 with SMTP id
 d75a77b69052e-53fcc9c38e1mr83446311cf.49.1793281786016; Thu, 29 Oct 2026
 06:49:46 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Oct 2026 06:49:45 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20261023172347.88443-1-griffoul@gmail.com>
References: <20261022-gmem-alternative-providers-v2-0-5dd1dc6c660a@google.com>
 <20261022-gmem-alternative-providers-v2-31-5dd1dc6c660a@google.com> <20261023172347.88443-1-griffoul@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 29 Oct 2026 06:49:44 -0700
X-Gm-Features: AclHuK98-PJmC38q62LJKPyoT2Xn1t02jBqXVrJ0iSGV7iV-HBBvt2AVL4ugH5Y
Message-ID: <CAEvNRgEsGrhrRk2DcbrMNY3zWko_eXP3-FA1dGRSGYphQtBpXQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2 31/50] KVM: guest_memfd: Support getting PFNs for
 stage 2 from providers
To: Fred Griffoul <griffoul@gmail.com>
Cc: Alex Williamson <alex@shazbot.org>, Alexander Graf <graf@amazon.de>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Alexey Kardashevskiy <aik@amd.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
	Ashish Kalra <ashish.kalra@amd.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Baolu Lu <baolu.lu@linux.intel.com>, Bill Wendling <morbo@google.com>, 
	Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Christian Brauner <brauner@kernel.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Connor Williamson <connordw@amazon.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Dave Jiang <dave.jiang@intel.com>, David Hildenbrand <david@kernel.org>, 
	David Rientjes <rientjes@google.com>, David Woodhouse <dwmw2@infradead.org>, 
	Erdem Aktas <erdemaktas@google.com>, Frank van der Linden <fvdl@google.com>, 
	Gregory Price <gourry@gourry.net>, "H. Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>, 
	Ingo Molnar <mingo@redhat.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	James Houghton <jthoughton@google.com>, Jan Kara <jack@suse.cz>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Jianxiong Gao <jxgao@google.com>, Joerg Roedel <joro@8bytes.org>, Joey Gouly <joey.gouly@arm.com>, 
	John Starks <John.Starks@microsoft.com>, Jonathan Corbet <corbet@lwn.net>, 
	Justin Stitt <justinstitt@google.com>, Kevin Tian <kevin.tian@intel.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, Marc Zyngier <maz@kernel.org>, Michael Roth <michael.roth@amd.com>, 
	Mike Rapoport <rppt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nicolin Chen <nicolinc@nvidia.com>, 
	Oliver Upton <oupton@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Robin Murphy <robin.murphy@arm.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
	Steffen Eiden <seiden@linux.ibm.com>, Steven Price <steven.price@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Tarun Sahu <tarunsahu@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Tycho Andersen <tycho@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>, Xu Yilun <yilun.xu@linux.intel.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Zenghui Yu <yuzenghui@huawei.com>, x86@kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, Fuad Tabba <fuad.tabba@linux.dev>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Fred Griffoul <griffoul@gmail.com> writes:

>> +	int (*get_pfn)(void *provider, pgoff_t index, unsigned long *pfn,
>> +		       int *max_order);
>
> Should get_pfn() also return attributes of the frame? Only the provider
> knows them, and every mapping of the frame has to follow them. Two
> examples:
>

I agree with you on this, we need to let the provider tell guest_memfd
(and IOMMU) more about the PFN being returned.

> - Read only. A provider may lend a page that the guest can read but not
>   write. I know you dropped this from the sample to keep things simple,
>   but without it guest_memfd maps every frame writable, and there is no
>   other way to make a guest_memfd page read only.
>

I guess read-only would be the equivalent of !VM_WRITE in the VMA world,
yes I think that should be supported.

Other than read-only VFIO would need something like "cacheable" so KVM
knows to map MMIO as uncacheable.

> - Aliased. The frame is also reachable somewhere else, e.g. a ring
>   shared with a device. Such a frame must not become private; see my
>   reply to 34/50.
>

Are we defining "aliased" as something that will never change once
the provider considers the memory in-use by guest_memfd?

Actually, I guess the question applies to read-only-ness as well.

I hope we can say these attributes will never change once the memory is
considered in-use by guest_memfd. Otherwise, I think we'd need

+ Some equivalent for folio_lock() to at least hold these attributes
  constant until the mapping happens
+ Perhaps some other callback like .can_convert_private() for the
  provider to dynamically query.

I'd rather aliased be something along the lines of
"cannot_convert_private" (a concept closer to how guest_memfd should
handle the information).


Glad that we're converging, thank you for doing the rebase!

> A u32 of flags, with 0 for today's behaviour, would cover both and
> leave room for more later.
>
> Fred
