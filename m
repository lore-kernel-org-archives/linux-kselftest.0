Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2343137756B
	for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 18:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779217002; cv=pass; b=iQoFAKemVmotC77NzpYZjeQVBoZVxEtbwVJrVRvN3sd1BInGfl2c1F1xOmvJcUt1fv/Zp5WHBwF0E1cA49nAnYatjsFTFJAdlqeFgaYfVqSsAEIVY01h4pD7u5RnN7RhSo5Chc7CRTL2sLXtZLK+3RTOwGcpzYi4hgXukC68AUE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779217002; c=relaxed/simple;
	bh=VoJiSYHkyb93U+CpFIcSkKKZJudViTXrBB5J9PwFeQA=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pjOFLHfXIY9vo1pWTwA94t4bp1I//SrhgLWT5789DZTY9GfPDIrpQPpDEGAwOT5goYpTV1gGWAlpzBTmM//kpGWfRuwMrE3aURAl1OZ0HayluQkME3ba3CPKi/oLuXGjiltoBbfhYjxW57o/pk/vFkgikFqXfB9dRmQBVYmNUWg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K58qjznf; arc=pass smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K58qjznf"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-575267e3398so3234239e0c.1
        for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 11:56:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779217000; cv=none;
        d=google.com; s=arc-20240605;
        b=HmZ3UiucK3SizGcm8lJtS4emUeNWJ2Ofi4CyKNqG+D8C27PsVAR39p9rWN6XStkvqr
         5nDcxLLXtP3fbTcYMQa1N2SjAfOJMWXYri7Lqim83hLleIulAzIcegQWLSGW7JkjrAWg
         vS31VC1XKrZ9uTveeYUgoZ1YetwBc3JfkCWmQqLZh5T3ZqFGIri5NuAW++MWh1IM3kkH
         mkERUNufNRT9KHSOfqAjNwnfzjYtOL8qw/r5s8w0fdCmgW7CSOFLTfQl88m6hGR8Wgcy
         XvL4J4BE5YhjC5RrCyUsKmPfPFDIDRHReN3fmPpEtZ2ptkw8kz1eTLMUJxd874TD1uRo
         /APw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=ZJ1om1XG26k9c/pw0fQSTui/sos+jK8LcvkwRi0HW+8=;
        fh=sq9EFye4PmwcjYt+ThYn/yGZ20UeD6gr8tDJf8pqYo0=;
        b=iNAd2e9ThuDiHrgrr42C51glVvxFwmq3BtRkEgRMLoqy1CY6zkp07P7uVTe1H3UskD
         uZkZHOygtu/s/IllWDsKt0EI4b9Xpd+Yns8U+EhxFNtVaR797N+b/lm3JYtEWz80E1u0
         5iIUx7nDBImaUYwa4ceNqYgyCR+VfhLCxOSJPPgn1DETfukLAepR3MDLFD4kHH+bg8Sn
         qtpDvzy0jjqyD8W7FkeP+497vbGOMnw0LV3j22qQYhNnT0BGZJSfcRDmum9mvifeIdMe
         TvrFcbNQVl3MyAHrHUB3lDyn/fnS7dHVWd76sQETUQbZyofTQrKfXXfziAJoQ9cB2HeK
         oQSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779217000; x=1779821800; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZJ1om1XG26k9c/pw0fQSTui/sos+jK8LcvkwRi0HW+8=;
        b=K58qjznfIkYOiC1tPg6QfmGiKQBWgkIc8INR1T4iaB07msA9+eIMYWKbhbpbDPtjJN
         CC4LAkCx9m05s8Tt/JMHarvQRABgBeTu7voCDoZKLB6GlBq83Zq1yF0GgS80R5/RIE7x
         b6lNunUiKHyKEUIDKo9h2CCeMumE+Hxu4Fo2rxRqnIS9l6rWNnmI3iVzBwrEhuuEV5y7
         nYxyF+DJCYVrpIzX9RxLrlMQPtTn3TyYL6D2SZfzpz1/RVRfd7CJycQdkU5EW7ynD9Au
         y+k2U1BP0o4Yv+OcAzP7cjZV0k9jq3lwgNBHUiUSIgmE0aIweyE9QMMGXqA5U478nEPi
         Uokw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779217000; x=1779821800;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZJ1om1XG26k9c/pw0fQSTui/sos+jK8LcvkwRi0HW+8=;
        b=HSCD+K/Sj8KWkhd2q99mTJy43kqV/0lIiUaRLf2JkGUdxIz9GZpnybDHW+jWzBy3l1
         KXJstXJ9ZQCjJDMQtpt9MDu7F6ESGNZqasqbjbEAcFkKdWVw+QF7R/m7F0q+Bd1tMVHz
         ItKi3BXzzypM9IxBjj/BDJ4z4maQH7KR0y+4/JJ4w8Kbp/vkTFlLiTAKiBwlzHB81Jox
         iZ5folwsaXxKcb/9M26YW+6dF3YiDBZyFD1nlw0hpmV5GYLdyHb9AwWNr3Um6dmFeRc7
         7Nm/q1ShK5EVFb8tuXHde+OU40lwDsJ+c0eO5N5ykkMyjl9glY7PtbTq+zou+3P4KlFP
         BrGw==
X-Forwarded-Encrypted: i=1; AFNElJ+tYLAqcJeM4tJVsOZtEB+o6A/ZZMzNsV2kjRzNDc3BjVGu9XyLXsXdnU4l/t+y0wB291AnazX81OyQDWfN3Eo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWJPhe963IQAuSQbTMbnxAe8kOUMO42VpreqKBRhPLTRM1wt2g
	MYRfWks5JBYwRx7ZIo6eP9+WIPnvpYSGbHoeL4UyFcABBLIBf8sQskCsV7ms+Ts681kRbQBLONh
	XamXx4/AxtABwzGasqsIdrsYezgS8SqC5a5ZHnXPH
X-Gm-Gg: Acq92OGrfVW4NfnpYL7i9FKxFYeX18JpC5iaRmmmE7cNDZHjhttiKloaP4JdJj9F7Fj
	ZvSp/s++UJM1q8YLGF8D0huveiMXqUsmQpd4BKXsGUo0pz2q797t2aJbrzeYsm2Zb2PqDstjuBT
	fTtCAZQrKk96bBXBnupSKMZ6SXC1wSj4YJbpOa+Sz5hLW1EcMmzeD1XYRKivQsnG6wEz3qXk3AX
	O28k0ibnu/42kG9ib1YOFcZJf6E0QcwhT9Fm78NwNiXyG5gn+JIK8V1aOSLQUX8vNjn6YNM3cQ/
	oYH9G/owp/8H5Ir2ET0R+ffnNO9mWyeKoYcmRx19XJqBh+7pUDGId0SxQtiG4/k4SOqHIFFxdtx
	h75BT
X-Received: by 2002:a05:6122:d86:b0:575:3b1b:ef01 with SMTP id
 71dfb90a1353d-5760c0a6a7bmr12548926e0c.9.1779216999523; Tue, 19 May 2026
 11:56:39 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 19 May 2026 11:56:38 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 19 May 2026 11:56:38 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <agt5wTK5I-FvlB57@google.com>
References: <20260402041156.1377214-1-rppt@kernel.org> <20260402041156.1377214-14-rppt@kernel.org>
 <ac7oE_1j6gxf8OKT@google.com> <CAEvNRgHd4azPaMddvqnSG+Z5fmg+LWd+pz=LSB3PrJTW618dww@mail.gmail.com>
 <agt5wTK5I-FvlB57@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 19 May 2026 11:56:38 -0700
X-Gm-Features: AVHnY4LPzDj9g5FV4_YaYz9tvR_M1MnLgRQGl6BwcjJkV-QhnQjrw8WLfhjN4fQ
Message-ID: <CAEvNRgE+xXRTWHzAetYhQN-OeTHipspbfvYNzaExe89E_sRkBw@mail.gmail.com>
Subject: Re: [PATCH v4 13/15] KVM: guest_memfd: implement userfaultfd operations
To: Sean Christopherson <seanjc@google.com>
Cc: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Andrea Arcangeli <aarcange@redhat.com>, Andrei Vagin <avagin@google.com>, 
	Axel Rasmussen <axelrasmussen@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	David Hildenbrand <david@kernel.org>, Harry Yoo <harry.yoo@oracle.com>, Hugh Dickins <hughd@google.com>, 
	James Houghton <jthoughton@google.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	"Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Michal Hocko <mhocko@suse.com>, 
	Muchun Song <muchun.song@linux.dev>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Oscar Salvador <osalvador@suse.de>, Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, 
	kvm@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, tarunsahu@google.com, patelsvishal@google.com
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> On Fri, May 15, 2026, Ackerley Tng wrote:
>> Sean Christopherson <seanjc@google.com> writes:
>>
>> >
>> > [...snip...]
>> >
>> >> +#ifdef CONFIG_USERFAULTFD
>> >> +static bool kvm_gmem_can_userfault(struct vm_area_struct *vma, vm_flags_t vm_flags)
>> >> +{
>> >> +	struct inode *inode = file_inode(vma->vm_file);
>> >> +
>> >> +	/*
>> >> +	 * Only support userfaultfd for guest_memfd with INIT_SHARED flag.
>> >> +	 * This ensures the memory can be mapped to userspace.
>> >> +	 */
>>
>> Is the principle here that any memory that is allowed to be mapped to
>> userspace can be userfault-ed?
>
> Yes?  It's more the opposite though: memory that can't be SHARED and thus can't
> be mapped into userspace can't possibly support userfaultfd.  Six of one, half
> dozen of the other, but I think it's important to highlight that there's no
> judgment call being made, i.e. we aren't deciding to support only SHARED just
> because we're lazy, it's a hard requirement.

I guess this series is only intended to support some kinds of UFFD, but
IIUC technically UFFDIO_CONTINUE can be used after the private memory is
inserted (e.g. for TDX live migration).
