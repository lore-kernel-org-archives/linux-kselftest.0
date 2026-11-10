Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794326018;
	b=LVP5uSaLwp3NWF7VXJwkMqdDI4i0ScCuYAj+tMPxLq9o22GlUOyreEKe/labnq4LYXke
	 EkIOPaBWf0QlDiBeEUysE2lZHiuq89CnGVqZ3tZw7j5UIt8P3ZB3AsGpEx8bAi91rBYhH
	 pvTTP09sYBkqSq73qlOKI+SsrOHTpumxyDk+uXUnIl2skpO+alyEncNx/BjmUJfzj2qAs
	 z14R3Hz79Z+FTHjdwcjSSjl+F8/v9jhaoXqQQfgb4SNlQM+1kWAF4botx7puzRjqCEHie
	 JkSyPduEbqJM9gpUM0PJ+5r13aeMOWsqe4j4MrM5rql+onaHH/98t8gPCcJHU0XeTCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794326018;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Mb0MdDBCZew5k3777cm9fQD62/5KwOz3NQ1SfeT9BE8=;
	b=Ww+C05E8RRb/u0GZi9ul5Jgko8Rv7OYUHmxcSNJuN2Ud3zNOj163aYR2WLItFgRdWt0j
	 9Xu8KceK8pS86N5b1EH7Jmso0QngpZqH6eYmCNlsbWC+Njl+99jl/JBOb+7HEIgcChs8e
	 eH1ONns3J4pGM6pe4nqqwod4GUswW/1MTSzBK6fAN2eQ7KJWD9dhGM99SOM/v1eTKPyWL
	 rgopFHc6Sa6WbUa2f94XcK1rea0caZH6weifZTFjk1zW3B5resa0f6LaYiOQodmAKqLea
	 /uToe8RRcjHClFuMikLL6L1v/CS+84KZsJc0zdgs5kf7/hI7+vKPAWo7YzcAj0THzfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KdYgOstJ;
	arc=none smtp.remote-ip=209.85.210.199
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E1D606A323
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 15:53:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18E1D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KdYgOstJ
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-89e96c03cd0so2085116b3a.1
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 07:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794326016; x=1794930816; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mb0MdDBCZew5k3777cm9fQD62/5KwOz3NQ1SfeT9BE8=;
        b=KdYgOstJ7KLq1UQCYnD9H+1JdC2fwddQe0d1osd1pI5CkONyb4xd30ewS/w0DolsYJ
         knbje4zjcRXc95NT2DxIGHuvwMxO8wzqB2goyjWWKKuO21kBp2M85q2UxpXKZHBVQ+KE
         gQGPicw5TyoImAIIqGWTJcQ+yAWfiv+RkAXUWMMA5R6pZd66vTfGFHN4aVnJ9iT08lxB
         6LFkqs9sZzB4bPQCxaZFImj4SoLcVp5AEDD2ablOsfa3ZhpVdtGiYZPlb8HRE0wv1wSt
         /pdnHBlpmOYLmcaUAeGn2XjRl3F72aYJb8n0YZaS8OOQvnPs3RLVUMuj4yVD+B8tEHej
         /qTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794326016; x=1794930816;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mb0MdDBCZew5k3777cm9fQD62/5KwOz3NQ1SfeT9BE8=;
        b=y420TRGmAGki+ulXyMzBzREZ2VbK9bmkrQYaOo5thAZkcMddUFBxSng66CZVXdws5Q
         eTodWtP7z1H680J/ZfNmXTWBDinw4slQMYd+sfbQiVnq/eZY6mubVGh9LCEfL69slm/S
         5MlN1QpdLu5hGgKGElgsv6bxP/qIOnZVzhIy/kD4JD9ZgVgKn3yPwfEwBD4Ih4YXMpDx
         DAl+tFYPe3O0/b0UPSWhB7muwN8cHgONJkdZeq+qZjd92ml5BHV7ad2N16GrSuM0kRN9
         eebky0K/aIU55Lsi75Hr7UX8r9Po+Y5gXa/yOcz6KVlh4+D0WMgRTX8P8DiX87EatKJw
         jf+w==
X-Forwarded-Encrypted: i=1; AL+hErGH56OGqfFJFUial7jr8X0k9KLMKFh6kN/RxOqkT411wtvUVmTjtz17P3NExXteqZo4xS2Ur37Rhhz6wQaxPEU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XoazxbJpd/dE3OifzPxOEjBGKolQEbXITQIjBpyq5l7xtqdCV
	Y6oZ6JODnlB0l3iIcPu4sJuTRFX+O55zMmISryq57GvZyLtleDZ1F6J4oKLJWxwP/f0yFde+gAe
	FWWE2ig==
X-Received: from pfwp56.prod.google.com ([2002:a05:6a00:26f8:b0:89e:861c:6b39])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2402:b0:899:3439:c8d5
 with SMTP id d2e1a72fcca58-8ba862ccf23mr3397440b3a.14.1794326016155; Tue, 10
 Nov 2026 07:53:36 -0800 (PST)
Date: Tue, 10 Nov 2026 07:53:35 -0800
In-Reply-To: <CA+EHjTxT_9NghyLSZmOOi_oQboQw-g+6z9WxwaF=-7RdaGbMNw@mail.gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261110110724.3614412-1-fuad.tabba@linux.dev>
 <20261110110724.3614412-3-fuad.tabba@linux.dev> <avMoubwqgXbpflwM@gremlin> <CA+EHjTxT_9NghyLSZmOOi_oQboQw-g+6z9WxwaF=-7RdaGbMNw@mail.gmail.com>
Message-ID: <avM9_7aWUDJSL3Lq@seanjc-mac.roam.internal>
Subject: Re: [PATCH 2/2] KVM: selftests: Test KVM_PRE_FAULT_MEMORY against a
 full dirty ring
From: Sean Christopherson <seanjc@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, kvmarm@lists.linux.dev, 
	Wei-Lin Chang <weilin.chang@arm.com>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Tue, Nov 10, 2026, Fuad Tabba wrote:
> Hi Lorenzo,
> 
> On Tue, 10 Nov 2026 14:38:27 +0000, "Lorenzo Stoakes (ARM)"
> <ljs@kernel.org> wrote:
> > On Tue, Nov 10, 2026 at 11:07:24AM +0000, Fuad Tabba wrote:
> > > Pre-fault more populated, dirty-logged pages than the vCPU's dirty ring
> > > holds, and check that each call stops before the ring overflows, that a
> > > retry returns ENOSPC without progress, and that the harvested entries
> > > are the pages in order. A read pre-fault can map a page read-only, or
> >
> > Are we asserting an invariant that prefaulting happens in address order
> > here?  Is that explicitly presumed in the prefault API, or just how it
> > happens to pan out?
> >
> > I wonder if we might decide for whatever reason in future to do things
> > differently there. Bit nitty I know, but wonder if it's asserting an
> > implementation detail?
> 
> Yes, the API doesn't guarantee an order. I'll assert that every page
> is reported exactly once instead.
> 
> [...]
> > > diff --git a/tools/testing/selftests/kvm/pre_fault_memory_test.c b/tools/testing/selftests/kvm/pre_fault_memory_test.c
> [...]
> > > +static void test_pre_fault_dirty_ring(void)
> [...]
> > > +    /* Populate the pages, so that pre-faulting can map them writable. */
> >
> > Reviewed below, but I wonder how x86 could then read fault these?
> 
> KVM_PRE_FAULT_MEMORY is defined as a read fault, but x86 maps the page
> writable when the host page is, and marks it dirty, unless it falls
> back to access tracking (below). Populating the pages makes sure they
> aren't backed by the zero page.

Before we effectively solidify the behavior, I think we should have an explicit
discussion about the desired behavior of KVM_PRE_FAULT_MEMORY when dirty logging
is enabled.  E.g. the only reason I kept the existing behavior in my auto-prefault
series was because I couldn't think of a good reason to change it.  But we never
made a concious decision in the first place, i.e. we never considered what would
happen if prefaulting collided with dirty logging (as evidenced by this bug).
