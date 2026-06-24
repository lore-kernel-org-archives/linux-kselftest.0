Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7626630BF68
	for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 22:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782339948; cv=pass; b=QlIT+64CyS0M+TfgawVWNYNWorPCjA5/BNoGnDlJe0s7Xk0mi7+cI21xaueqiKYbK4q861rvscK7KNaylKpFs4Xb7KqkYcNkLgrcdh+r1XqeDK+sYl9BaU7qIBftpXwvvz4DSJstKyjMygyVYzxg6UzFNo/fRj+GPxwrKwfsWZo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782339948; c=relaxed/simple;
	bh=RU91htVYuTl4zBdXuu6mQj5pUyKWdyfCeWXJbQ/VXGM=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DXBSyY1ozbi3+7XxNvHXnFVV7I7IgYwFfPLQhRw1cmvkTMSaWoVG49GBRiK+vw4QYrZRzWgh+hE6QkFc9XiqAFvgvyITj/INGqk/Te3h8ncH2YVy35h63uATth1eeH/ZEmOB5G1ozFJR2NBZqHJCAweYfZlDPxJtiqYdIDJvmqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BtjRnL4N; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BtjRnL4N"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1363fe80fe8so3137622c88.0
        for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 15:25:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782339947; cv=none;
        d=google.com; s=arc-20240605;
        b=kJBNlMjD/mpO0pNxe5doEMER38l8S0Sy000GVFFLVKXMIYlSYtdXZOsp7lX4ZeQzEG
         kwu9nEAYbDev3wOcdS+R6ehUufB+JU/rWbdYtnBh3UwTAAo/TRYZ8MmO2oytGxArRBr4
         Otx9Lnf0qhyCzUBAKe40tSq4wgeJO1Kw+kOh4EGrIDD+pXRIldrZFmz/N/5hZYy5sThP
         IcbFMns0J50sbxaPEWz2bf3pEpm3mKJIjoc6s/rMCcJiS8Dw79KIOLFhbTS4qEjFWyC0
         KtBG0RNwWGtBDEYMjPRI9nj58dT4REmSwY17LW9aKIwpz2+3wqZXMoYXL4AVQiIrc5Uy
         v7dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=RU91htVYuTl4zBdXuu6mQj5pUyKWdyfCeWXJbQ/VXGM=;
        fh=1lMLAU6rfdNMbE0UWqGjhsY5k1DfSpa6aWyTiviAszc=;
        b=Tt0D70HMW2SxpM4sPurA2t5jjpmOFu+0LxezYfsDrRBImgQLT4fcV2Sb0cs5PQneyB
         +QE3HNaa0LVldqfOIAdEBZfp0bBZm0NaWckZO/krLCE2LI2dDRnGiuK1qE/hkbOKJNjB
         XCk7Y9JsopRShSDg5KbKJNasb/ReMM1YUzZO0xWy8U16jCqot97HeIve/EqFaqOTFQK0
         Vzm2/fnECdOQAzZhv5LZMneFNEZiwxN3OeiViGWIwcSOeP/AHkAZBF6fritoLvNNFUpw
         pX5o+gH7YLpGq10y614zB4N6jryEIKK/+D1dMtkCpQlu7WdktbYu5c+YtuduNMPd/JZ6
         Jb2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782339947; x=1782944747; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=RU91htVYuTl4zBdXuu6mQj5pUyKWdyfCeWXJbQ/VXGM=;
        b=BtjRnL4NLOQHm6ekPigJHihQMZyqkfwE187HWVqOiBGwwKIE1Qk3sMCQzy4rb1uZkZ
         5ZxOJRHjm7M0X/oqUhavAKyEXAjDRI0mptK4KtMIm7/ba55Q0NvWHEc+D1sEMIFaY4Ww
         gzStZLmHYB5rM2R6H07IYNdIqdirzZd0BXAZ5HjHmPdHKRZLSwz324z3ZKutOs9iOUx+
         TF15jvN2D5BytHT36+GapYNvTc/7+8N1f/dBzXSEKcDHMsLe7KLsksLCZ9I7cGIuDf5A
         bFB48Qpig/RVX5NAYFClMMPfjISEPC6Ek9oTsnV/zRWWNWchO145heeetXQaOppkHAxq
         f/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782339947; x=1782944747;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RU91htVYuTl4zBdXuu6mQj5pUyKWdyfCeWXJbQ/VXGM=;
        b=sKFJonvhOAivno2Uw2mA8dcduPwy2V9lKrCcbY0NMPVZLafQ4q2CgZ+crgaspAjBuC
         D2a6MJW47sioakalWhDeUVgaTlnDmwSXG0JmvXetqpljBp8TD3hPfTWEos6KAuOiufjE
         hbvnoDrMI0Kli37pQ5iCxPTCH6KxJhu9twgSymqSEW86Dkap/gAD5kuTDIx+d2xvufA+
         kak4Wa6UNS6iG2b4JZnGq3+yYupTHOwep9cu5g4hRq927WUGCD6pqdOcYmI3AIs5JbX0
         F85TOMdeFyPj5yyALoZxoFCOTxv90zm1rlNv+Lpi04ORwK9qfCFUe5q+Z6gzfTMc32OY
         Fp3A==
X-Forwarded-Encrypted: i=1; AFNElJ8hP3qa9s7qYCKZcCH1KBOTacDC3wexTtyOJWWyMzk3MaUftf5Erzg+xPbQB0ATti0SWL1e/hI2Tw2f5yZ8Fq0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+l6BdsJlBy4Suw9qientVcWSkfGPFgBFReN+ucG+HAWFysyvT
	gqD4M18VlA5nclKT7gsVRWtWnSKG48D1u6jcEsxGMlOAWH6JRC+LxNmHhlTxv7L6AOy1LakT+bh
	0aX/pHpdSr8hksAcigeOxNu67h28P4d202740WuV7
X-Gm-Gg: AfdE7cl6knko0oNQ5q96XlrafcLp7z50UUYAXXptOK/qwC+ebx5MNI0ievujCHeS8lg
	fxxnujTQzKlXbliDtCWm1cjOisSjwr62jzxYqpCf8alXqljPGPKo+NVIAP+EgWzAyTkeadDg36l
	JvSOx+ZTZkH0okVuA+cuU5ZnMM+CO0FA9+7h1NCSf/fko53ufc9VZtEnxAtef+HixN6mLlnsa4K
	PgyL850rtXPX+7X0zssH7oKIbfV/QOxB1E0Et8AD/jbecAsFSPmlMmSbbI7fOEUIx2Erjqzj+zB
	rXREfF++pqU/9OVG/7aF3ef3CNTVB/rNluOfvar7TCUC6HxmZV5tQapYqaMBQnSjuvOkKQ==
X-Received: by 2002:a05:7022:906:b0:137:e6a9:b998 with SMTP id
 a92af1059eb24-139d0c99607mr4114854c88.31.1782339945380; Wed, 24 Jun 2026
 15:25:45 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 15:25:44 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 15:25:44 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <ajwMYCSrPlxg-Fok@google.com>
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-18-9d2959357853@google.com> <ajwMYCSrPlxg-Fok@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 24 Jun 2026 15:25:44 -0700
X-Gm-Features: AVVi8CexQH0jh1eCpdBx_tPh-SkjHNyZ1QVX7X8uuwzX2_PG5elQvyIsXuHuijg
Message-ID: <CAEvNRgE8HZDOnexMJeim6TjmxGG1AUXFY2+HH1YyKB=aM6D-DQ@mail.gmail.com>
Subject: Re: [PATCH v8 18/46] KVM: guest_memfd: Handle lru_add fbatch
 refcounts during conversion safety check
To: Sean Christopherson <seanjc@google.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
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

Sean Christopherson <seanjc@google.com> writes:

> On Thu, Jun 18, 2026, Ackerley Tng wrote:
>> When checking if a guest_memfd folio is safe for conversion, its refcount
>> is examined. A folio may be present in a per-CPU lru_add fbatch, which
>> temporarily increases its refcount.
>
> Under what circumstances does this happen,

It happened 100% of the time in selftests. Perhaps it's because in the
selftests the pages are almost always freshly allocated and so the
lru_add fbatch isn't full yet? (and that the host isn't super busy so
lru_add fbatch doesn't get drained yet).

I've not tested without this beyond selftests.

I don't think we can depend on workloads to drain the lru_add fbatch?

> and what alternatives are there for
> userspace to work around the issue?

The thing is, the refcounts don't come with a label of who added the
refcount so we can't really return a different error for lru_add fbatch
presence. All folios get added to the lru_add fbatch even if they're
unevictable and eventually not participate in LRU.

We could make userspace try fadvise(POSIX_FADV_DONTNEED)? I think that
has other problems, and this kind of makes userspace have one more user
to guess. Userspace already needs to check if the page is pinned for
DMA, and if it's not pinned for DMA, userspace already needs to retry
because of other possible kernel users...
