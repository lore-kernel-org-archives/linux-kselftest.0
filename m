Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6E543078B
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 17:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785433590; cv=pass; b=CcJ5xy3W80/9dH3psIMfL3ePQpLb/yTx3fZDnJIKrhwJLOB2abGQqHDgxkKgfgHV9c9Ilhia/2D9D0luvPzgwEfJIUKujh1DASlqxhmRCcMaLEw0F9yLFMHmmZG0rr0OR8uH46GvWVf7h3mMSw4phSPE1Cx8CJn8jIdSmSCf9NM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785433590; c=relaxed/simple;
	bh=UOih8CBVKjn02CmrfoiIHS5zm6Wg61jRZNK4KLcmhAA=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A6cn5lCQVSzzLdsOvhvoV/zmQGJU0OpvlHvZof1rPh9I5LxSPwS+an96lfTRJR5j7rlNx7staYJNryvbQ50myN9CeNx+rSQ0CNv2+vxpRDl1TVECvKD5hil7bthepBoSQdJfBP726FtWmEgVAwkdkqVC/g4FSMe8Ofzlb0xu+vY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=J1/mqrOK; arc=pass smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J1/mqrOK"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cbb85186d43so31641a12.3
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 10:46:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785433586; cv=none;
        d=google.com; s=arc-20260327;
        b=iFqwMme42k3rDczbkvGSs1+DWzcisn2ItRfCY1jjGiMMp/tHaVBkIT3xJPLQNq8+R+
         PWoR3u8LRdzjFkVBYXKrpXig2FSJOf46YFJKoRR+UDIf2yMZVQ8Ir1xOpmwZqW6J6xeN
         wKQSrSdAPIGGXn3zUYpE53wy/TtGWOVoTU0uzoZr5ZPQlhw90SqiHencY2eRa5QmUX5q
         dh5O4Yno+mOp9iUVWEdNJnrwGoo6EyousYbBOjFzsQMQyRQ0wMMCKwz5RuKxcViWhamf
         UCinQxjtgnZcJWfA5N0xmN6a0LSh+HJm5EzYNuweQ6BSPEvMhgtKCfPwVyqk1Q4nPiP0
         OYSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=UOih8CBVKjn02CmrfoiIHS5zm6Wg61jRZNK4KLcmhAA=;
        fh=k2M5+le0vr3qB4AfMXUEMpfaL7Ua8Ow45VRBol8cKiE=;
        b=b9R6IfmXBEU4CxNXI46AQIg6pQ7QnsGkmR8JK9jnLhM/GrrGL/YG4CuP6+mMJ95rcE
         BR+DgQrzJ3u6GtIeJ6Es/mnQbhU13t8gYUNG5PZFMPiKT5Z2eQtW396RlIlcZOwAX0wI
         4amZrK/mbawr9S7Tum4/T8kq5dClW4rXhJ3v+n0M0tqQerfnAA70Eq9P6aeMilM1bLwi
         /TryudHZ1bLquw7CI/4qMSZKVirDWq1yqscz2Nagu5ZAsJZsSMUv4RiV+u+ExYUKqRf5
         EzRArjdBv7KuXpdPdDfnp2/fqrX90gXqC/4GUXMetTW0ZE3HATOh/ZOsbRi+WL4Nz2nJ
         nHfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785433586; x=1786038386; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UOih8CBVKjn02CmrfoiIHS5zm6Wg61jRZNK4KLcmhAA=;
        b=J1/mqrOKozDueyOpPmCiJpfk6B8e+u5yoozZJa6XaOQjjljLb7DHPL0Bmy099pdfi4
         Z/7yelzto4GyAHhRTDywVXDxrz4AZEviushDDgcvs6rgH/JowQ7BUFYYAkIqR7WnTJPE
         Uib25zhKYq+kAtEh2XHHlqNOpXNT4fkDR1bJPyDbyB/DqYAOPazoQjfRRKr3Jpb+x4xr
         iQFPY56TbHxWUHcuyHvvjaqg1GawzvFw1zSajdUJElsK8nSsvJA+z3niIBhYr6GFNXwo
         hO1d3kIpRxiTW48kCG3R+uxUaPfNmksgLGejqeM3RxRwhAtmMuTWxvBnebPfy40LfCzz
         4PtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785433586; x=1786038386;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UOih8CBVKjn02CmrfoiIHS5zm6Wg61jRZNK4KLcmhAA=;
        b=gV/sk7DZZVVFLXjGYUxAYndP55ABEZsycYsVGpfD2Hb/jXgPfa2sa0wOo3YvQJtjb6
         2C47KmBXDrcJhUL0Br/VoV6xjbe8bGnsHPOPqHMNs261EVPD+/PwX2vZxJtyJ3mUKlyp
         vMxwqbeix5xIGd3GxHSj3LlukBy5TqPPdNnDALRgVtGX6LrE0rJln2mzJM8MvFb5pJl1
         9b9qCbGaa3i29PoqY/ZreqTjDUMkbeU6oAMJbbIYi14vPTvSgb3PNd7dxwX2vRxg6Y1h
         rPTK7QoR/wUgJR1fh9wLBnK79LdhSkEoUx1ttkL5zaIEKdyE7kp6tNbhkeEEUXy8jpYZ
         LjMA==
X-Gm-Message-State: AOJu0YwXg/DMo5R9Ffi+j76fm+H5mq/+EG0W2/+Hh+SY/HHISdw2/6a6
	2Z0SEpeQXWEbjgkh5skNUzIAO15Zhn6mEMEosehSqTREzRvH7iTjKxYo+Wqv39Yx6eDvkVGb8L0
	HuaxQJtH5jvgr0/XL3roknrjFzngfEXLnmvme1dWC
X-Gm-Gg: AR+sD10Ftn0VPwjvhGJHgXhuvw7TzkmreRFLc1TQGiIgD55vUbeQvQGx7B2xuSrYHr7
	3u1aF7WejPDsCEI/0JWNtRQSJLte0TOGikLy1EqZPcB4YpiAXXoy1Fh3BF46AWNh/p4p+fvcmKQ
	UHkx+VMhD4z/gjZVBwGBPKf0MkDw6+l1tLEOL5rMRPvNG8s37f2HYtyhPceKRJoreqr89VXBQT+
	0xtn8GPAmNSJe3BiFC5YePcjX1LwMWzG71qYR4QjNGJhY3pyhnjT2r3zq+Qc8Z4zpDYlqBGWHes
	UF3hzI+1Lrui0VGmOrByIjlMR1mc1X3W4UhMGlR6QynaiWUi0FYodomYUN+IPy17WXserAYf9Ku
	8nzRWh/gRmk6G5Szl4MhjCCERleXU7pB9LQ==
X-Received: by 2002:a05:6a21:e8b:b0:3bf:6ac8:8d29 with SMTP id
 adf61e73a8af0-3c9006bb981mr3748982637.21.1785433585760; Thu, 30 Jul 2026
 10:46:25 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 10:46:24 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 10:46:24 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260728121138.1103610-8-tarunsahu@google.com>
References: <20260728121138.1103610-1-tarunsahu@google.com> <20260728121138.1103610-8-tarunsahu@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 30 Jul 2026 10:46:24 -0700
X-Gm-Features: AUfX_mxSA02wZmCDGZHkTAv1sqG45AQrWdNvcUlNspdo9IevcZmmfeKZDjs0tR8
Message-ID: <CAEvNRgHvBTKaG4G5J=sMFGYepEnOFaeCBtjkzN6xmGtZ+o6XxA@mail.gmail.com>
Subject: Re: [PATCH v4 07/11] KVM: guest_memfd: Add support for freezing mappings
To: Tarun Sahu <tarunsahu@google.com>, fuad.tabba@linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, seanjc@google.com, dmatlack@google.com, 
	Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, david@redhat.com, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, sagis@google.com, 
	Paolo Bonzini <pbonzini@redhat.com>, Mike Rapoport <rppt@kernel.org>, Alexander Graf <graf@amazon.com>
Cc: linux-kselftest@vger.kernel.org, andre.przywara@arm.com, 
	michael.roth@amd.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	will@kernel.org, vannapurve@google.com, maz@kernel.org, fvdl@google.com, 
	kvm@vger.kernel.org, oliver.upton@linux.dev, kvmarm@lists.linux.dev, 
	alexandru.elisei@arm.com, skhawaja@google.com, aneesh.kumar@kernel.org, 
	linux-doc@vger.kernel.org, David Hildenbrand <david@kernel.org>, yan.y.zhao@intel.com, 
	kexec@lists.infradead.org, suzuki.poulose@arm.com
Content-Type: text/plain; charset="UTF-8"

Tarun Sahu <tarunsahu@google.com> writes:

> Introduce kvm_gmem_freeze() to freeze a guest_memfd inode's mapping,
> which prevents fallocate() operations and new page fault allocations
> during preservation.
>
> Use a global SRCU (`kvm_gmem_freeze_srcu`) to synchronize freeze state
> checkers without incurring per-fault locking overhead or risking per-CPU
> memory exhaustion (as per-CPU structure not counted in cgroup) from
> per-inode SRCU structures by faulty/compromised VMM.
>

I wonder if everything to do with freezing should be gated behind
CONFIG_LIVEUPDATE_GUEST_MEMFD. What do people think?

> Signed-off-by: Tarun Sahu <tarunsahu@google.com>
>
> [...snip...]
>
