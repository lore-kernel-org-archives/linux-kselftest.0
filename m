Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794325068;
	b=02oI63nIh6ALdrjcd5vUt3go9nfJYrs/r/HB00xY/otJZ2oVUqgSNQ0Wspgg0Qf63pFP
	 A30MhAVnvo+fFecwuTqFSmEx0Zwm78VrvX5Qq0dAXHCNLzvHctL8tQxE1Vp6qY/eNXqgh
	 A4glOUhc9uK6ZpcPyqWMR1S2DD4iej9BR0Mu7QnYhMKkKOQTnphq47sv2mcMAQNoX0ui7
	 09G0ipyev5ytkqBLULPHZPkGyGqh9Fs8Pp9XprzLzqGg47jQZqW5aUc/SkUiUdQmu/f6R
	 5zvwzCHKs6OrQNlcaC32rEI0IU7RYLxuEOyo//7LS004vd3jNdRId4yIVlA23u75RrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794325068;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=ogFCUAuBZLZXOutM4r4leQllES0UKlFJyoU3ZQqHWYw=;
	b=f4XP0P5d2Aqlf+sA83oVMguq665YD+4B+QT9985x96E5ewiFRmvBEqiX5M9uWSlvCgKw
	 XW8P1KVmdRyGHOK0jl/jbgudDLugUzfE7W/3SvuiUT009cWZBbsL6qKwrexnOpBoLNHtd
	 yMLpkwjWuQkxx2wt80gi+Yovwx8po02n1D8fjADtkY0JwHsFxqXu+ClbdeitjgsP1VQlO
	 UEV4hVkLqLMtPjYhNAZnsCg/Rw1leeRrNcSqM0wzTnROp2HHcQkTCm51L806RWPeqd6Q5
	 v5XVHzCdMNRh61BbvMxcHXd9fO4bLKtnPSTdSuz7/MiiVEVPRg5CFVWKeB/ff1NRq+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="T+RyF/xi";
	arc=none smtp.remote-ip=95.215.58.77
Received: from mta1.migadu.com (out-77.mta1.migadu.com [95.215.58.77])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38944606A321
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 15:37:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38944606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=T+RyF/xi
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=OU2BxWs+fl9KwiOZrZ7MCmCnoYNRzpKdLi98U8rTU+I=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794325065; v=1; x=1794929865;
 b=T+RyF/xiJNfitUzGToNwwGoS2vfVxbBbQKNi7GBQFiaZ+2liDWYIAeCr+sM6TqBw1A+9vTm+
 SNS+tkTzEc4o+SYY9SQFlzS1UApU51m5udn1Fan+K/hCVThKJDN3zvoCvfw7AcWdHVM1VBwC+lT
 wz9MDmTMy//pfyhozofEk9dE=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a21efa71d5fdd01b;
	Tue, 10 Nov 2026 15:37:45 +0000
X-Mizu-Trace-ID: a21efa71d5fdd01b
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5c144eb2f43so5262e87.1
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 07:37:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE2aehgN8WvXJrsTG0dNFvLNL9Z81WYcX30D2oSyICKzByjZtI8SAqD+uHmKKRrVLLeMlStJx3xi5J1xdYe5wo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9j0QJ7LSnoH6+xV6VolkNqnhbOc0mrX/gTNSvmreZOFFLHtFXO
	HUfZxplAGFweihPcib/B3v7r3USOFhV8spAclhuwXPxHJCr23nVdosKUkjIbVig7OknQ221HHqu
	4kIlBl4IGoh+WfiRaitbHhh1cKSP3mbZCB4Sk1uZB
X-Received: by 2002:a05:6512:1052:b0:5c0:7c6e:4559 with SMTP id
 2adb3069b0e04-5c157db2ba2mr143661e87.9.1794325062152; Tue, 10 Nov 2026
 07:37:42 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110110724.3614412-1-fuad.tabba@linux.dev>
 <20261110110724.3614412-3-fuad.tabba@linux.dev> <avMoubwqgXbpflwM@gremlin>
In-Reply-To: <avMoubwqgXbpflwM@gremlin>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 10 Nov 2026 15:37:05 +0000
X-Gmail-Original-Message-ID: <CA+EHjTxT_9NghyLSZmOOi_oQboQw-g+6z9WxwaF=-7RdaGbMNw@mail.gmail.com>
X-Gm-Features: AclHuK9GxiFUgfn5RkRxiSl8D-ZsDGIbAcDrgyXgHWZ0Aza6Wilt0GEOkKm-eWo
Message-ID: <CA+EHjTxT_9NghyLSZmOOi_oQboQw-g+6z9WxwaF=-7RdaGbMNw@mail.gmail.com>
Subject: Re: [PATCH 2/2] KVM: selftests: Test KVM_PRE_FAULT_MEMORY against a
 full dirty ring
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, kvmarm@lists.linux.dev, 
	Wei-Lin Chang <weilin.chang@arm.com>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Lorenzo,

On Tue, 10 Nov 2026 14:38:27 +0000, "Lorenzo Stoakes (ARM)"
<ljs@kernel.org> wrote:
> On Tue, Nov 10, 2026 at 11:07:24AM +0000, Fuad Tabba wrote:
> > Pre-fault more populated, dirty-logged pages than the vCPU's dirty ring
> > holds, and check that each call stops before the ring overflows, that a
> > retry returns ENOSPC without progress, and that the harvested entries
> > are the pages in order. A read pre-fault can map a page read-only, or
>
> Are we asserting an invariant that prefaulting happens in address order
> here?  Is that explicitly presumed in the prefault API, or just how it
> happens to pan out?
>
> I wonder if we might decide for whatever reason in future to do things
> differently there. Bit nitty I know, but wonder if it's asserting an
> implementation detail?

Yes, the API doesn't guarantee an order. I'll assert that every page
is reported exactly once instead.

[...]
> > diff --git a/tools/testing/selftests/kvm/pre_fault_memory_test.c b/tools/testing/selftests/kvm/pre_fault_memory_test.c
[...]
> > +static void test_pre_fault_dirty_ring(void)
[...]
> > +    /* Populate the pages, so that pre-faulting can map them writable. */
>
> Reviewed below, but I wonder how x86 could then read fault these?

KVM_PRE_FAULT_MEMORY is defined as a read fault, but x86 maps the page
writable when the host page is, and marks it dirty, unless it falls
back to access tracking (below). Populating the pages makes sure they
aren't backed by the zero page.

[...]
> > +    while (range.size) {
>
> NIT: n could be scoped to this block instead.

Will do.

[...]
> > +        for (n = 0; ; n++) {
>
> Could this loop forever if cur->flags always == KVM_DIRTY_GFN_F_DIRTY? Or
> is that guaranteed not to be the case?

It can't. Every harvested entry is set to KVM_DIRTY_GFN_F_RESET and
stays that way until KVM_RESET_DIRTY_RINGS, which runs after the loop,
so one pass stops after at most a full ring.

> > +            cur = &gfns[fetch % entries];
> > +            if (smp_load_acquire(&cur->flags) != KVM_DIRTY_GFN_F_DIRTY)
>
> Is this and the below release paired with equivalent stuff in the dirty ring code?

Yes, the acquire pairs with the smp_wmb() in kvm_dirty_ring_push()
ahead of the flag store, and the release with the smp_load_acquire()
in kvm_dirty_gfn_harvested(). dirty_log_test does the same.

[...]
> > +        /* A read pre-fault can map a page read-only, or access-tracked on x86. */
>
> Hmm under what circumstances would that happen? Is there no way to ensure pages
> are dirtied by prefaulting? I imagine not though!

No, it's up to the architecture. arm64 maps a read fault read-only
while the slot is logged with a bitmap, and x86 with EPT but no A/D
bits maps it access-tracked. Neither pushes anything to the ring.

> > +        if (!n && !harvested && !range.size) {
>
> Hmm, so !n && (harvested || range_size) will pass this, but then you assert
> n immediately below, so it seems like n is an unconditional requirement.
>
> So I wonder whether this should just be !n in this conditional or maybe the
> assert afterwards should be dropped?

The skip is for when pre-faulting dirties nothing at all: the first
call maps the whole range without pushing a single entry, so there's
nothing to test. Any other empty harvest is a bug, which the assert
reports, so I'd rather keep both as they are.

Cheers,
/fuad
