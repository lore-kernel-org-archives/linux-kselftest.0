Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCD737DAA9
	for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 15:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778598405; cv=pass; b=krH9I6XHQJkh/CnaF0sYhguAIVIWfFnvtKI9FYzix1D8aR9mRRhd+JNHq6H8DYcExBNNAQhFFKIsEbTrzjXd8cGOTt3GbNkLHPon6iiXJY6X0eRzt93f1VYTqaO92T7CQGVnDUjMVRdNHd52a622PomaI9WWnAM9rvZd6xJ3440=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778598405; c=relaxed/simple;
	bh=gcNBDheFBgH8XihHbSk3EkYFkn6fIMIdXTND3WNAdzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VkN3T/P3qcopdZH4NnS3cuovpP/FuxopmrhFQxZ+8K6ei7Ibq2z6arr0qSkD/Ze9azF8zDhOHvNd6KqBIhlpHs28O43ghdJs/C4ifaSH67S/N8+BUCvkR3fukcgE3jMx5L/GAizF7m1nuTHAkeZX6+rXtEytGnWrgNlTgAGorrg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sbEReKWp; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sbEReKWp"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-515548f390fso7521cf.0
        for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 08:06:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778598402; cv=none;
        d=google.com; s=arc-20240605;
        b=h7XNTIXTnGeLHRHrs9WNLlwOeTEeyA+80tjg0Cg0oLMXt3CyMXHm62CcxhkTWHDYCz
         ksf236wZKTnBg6MWjL+oH/VvadF6GQzgxqHOFTkYw7tCr4lHa9kqNme7lvR+iqB6P+co
         6ALItrIjX2/Hb+p5tqKfhOksevZEXAGQiJkCjPCfsIHtBD+Zhg1jBfR+SCDRtv4ZaP1Y
         YGzJ7nDPV/YhFH5kL3NXss1bdBBG0VPl3HPfupXJrR5ZQF1ZD41fG+0xVrPMUzVyIkGS
         w50DwiW3uDg2+Ujb1sk4JRg1z3yK7E+gZ1vME78fUznQ/qVLeCQ+WDW3KhD7ETwAcPrx
         RSgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=K3beaZW1jplvB3FYWIrdXKEVFakjYTyE58XRCIOhPFc=;
        fh=bO4EyZlAn2oMJZftkw/VMr7mkeENA/ab7XnjS1LX93E=;
        b=ZzKC++EVzLa9xquhXq+Q2pa4+uDLrLnzBkfA+qDTG5kFWWz9oEFXZyr/MMw5FP14sQ
         3rv2jegmKXGXa53TftqFW31B/CxWiHntXKDLAYNlurI79kpSG3+j+qndCeIbQfkcBQ99
         CJrkIalttogovHmPF1mNR1q89Z9E3wP8xahX0hhiFQN7X4o5JWTsQDXLqrtEsugQX6f8
         O9i1Bw+GSUGyqtgYdNI8g+AF02YR8OdhV0o+LA72Nv8KBTlfTuxaZDxFSvas370eiWlt
         VbeCgYtGKVJOp7/IuWSkS5nuPAnk41/I0Kx7eziA0Ifi4hP2cA+sw/79slXg9sAHpqXl
         3BUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778598402; x=1779203202; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K3beaZW1jplvB3FYWIrdXKEVFakjYTyE58XRCIOhPFc=;
        b=sbEReKWpiei+zg1mTeU9/7uDaNr6TIm45Qzum7v7WyBfs+YfRv0NQ9KBHh2mLeaWN8
         gUNue+wVp/+IFw9po3NWR/ne2YMl1uLhbh5rKcoWUC/CF/h7FdrnZ05l3q1X8nUlp6/Q
         2HvbKG31gQKc+OtaTiPz7WFwblKYDRtyu8R7WGH9rWTWoen0aLHvqfxFJQ9i6ox8+Lwx
         rEBJhtX4X4A3fKVB5IPQ7SmcFt4gdhWFJaR90W0J8ghATgUshrH2LjnqwywEvabbi942
         Yt86Og4k10NaScTR612B6Gin28N9BVof0tvuBhkh3FZR+CQzTl0tmkvO9buPjkA/BSxE
         gA0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778598402; x=1779203202;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K3beaZW1jplvB3FYWIrdXKEVFakjYTyE58XRCIOhPFc=;
        b=nvF6ENFueWznxTEHSksVHg3kGo2VBpJN8fYpb6y2EhZXxAHs/5PKDlZi/aJ9t6hAbR
         odqsjgYu0nX/s+U4ObVguqrYlJ7q2H7ceMHuGJLqQk5vyFzBaRRDc7v/sJa/kACusqp4
         lOGlm3l9Ukn3laNNJQ1lI8KHI+XQCmQo/+ZDohAUBiVAPm5H3uoCdgd+oKCwAtT61Hlg
         uoBtdjSKSNyLSlTiqUMzUPV9pQqwnA9JEEecsQzR6hkI95n3d50Jkr59Ln41btBaiFaJ
         ZIUTGLu2nKoMm9/Hq4JrSAXO19j0Gx3M+tI/22ckig6cMMXhkQGdBl71gOcNeYQR4aYX
         l6Qw==
X-Forwarded-Encrypted: i=1; AFNElJ+Cl20GqMZj7iq8BB4p5Lg1bXWOSJEDHvefBE/roCECSuTgoUZ/Vhv1N3KZ89J8lNrX+hWvpMcsTXh8nXgvJ8M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRYr9ywtYkYYgsl9c45sDw3XBY2sHi9crH1rmUj5OJPdVCxHEu
	wjQsqNYvC5I8oHn5+flRtMFcgnAfZaWLj6b30V6CMBApvPAHRQrYLxnxDohPyiWfp1PJu1BApZj
	nQCQzg82z0UyOvIrBuNO7zg9N/5sq7da0Ky5/VsSY
X-Gm-Gg: Acq92OGiVa782lrzRoHkCJXdg5DIQTMYJgsgD9YXYI9/WWRcgDV1UxZA/cnjvrvHngB
	Jga1GCzZd3Zrsaq0n92o3hXXF97PYYKotv6wJn6mBWLm4DmPJHCcbAWfKmX1O68c7f0sX960F3y
	jRts4LdksUKzKXYYdcImlTQn+2r6sdS6+l80OSpk8ysxAXRyJgVun+4nubWDELX20Gf0csKVpXT
	YwAvf14Lc1Wd2xp2sr5xpWqxz7rUw8lvSDKwcE6+z6cCRNCRycJF45kZx8Iqjl6kNlq4SKzODbZ
	Z6gZB+5wv424WVsOzCwO2/EEQWcz3CGroB3lKLphg/5BNYtn
X-Received: by 2002:a05:622a:a9d3:20b0:4f3:5475:6b10 with SMTP id
 d75a77b69052e-514d454198bmr12180171cf.8.1778598401986; Tue, 12 May 2026
 08:06:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511113759.610924-1-tabba@google.com> <20260511113759.610924-3-tabba@google.com>
 <agHugdIrptaXZW-2@google.com> <CA+EHjTw1z7ROF7u0fKqxDGao7S1kELxNWtyWhLoPQx5uwVfuWQ@mail.gmail.com>
 <agI7M7rZ_NZJyjhj@google.com> <CA+EHjTxDvkDGyd-uyAqW7ErVxcKnUBpCYAgmnYfCdh+CCSq=3g@mail.gmail.com>
 <agMqc7Zub3fqToxp@google.com>
In-Reply-To: <agMqc7Zub3fqToxp@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 12 May 2026 16:06:05 +0100
X-Gm-Features: AVHnY4IZcdb2DMJvh3qvpivj5i9gaNVVhOQykEAmW1saq1LKEVextu79Cahx9XY
Message-ID: <CA+EHjTwrfGnBa5UXdLgV2FPga7=HM0wCZ9F7nL6PjHurh2kP+w@mail.gmail.com>
Subject: Re: [PATCH 2/2] KVM: selftests: Fix FD double-close in kvm_vm_release()
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Will Deacon <will@kernel.org>, 
	Ackerley Tng <ackerleytng@google.com>, David Matlack <dmatlack@google.com>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 May 2026 at 14:30, Sean Christopherson <seanjc@google.com> wrote:
>
> On Tue, May 12, 2026, Fuad Tabba wrote:
> > On Mon, 11 May 2026 at 21:25, Sean Christopherson <seanjc@google.com> wrote:
> > > > I used kvm_vm_release() because it's the only public API that closes
> > > > vm->fd to trigger kernel-side destruction.  But the existing callers
> > > > follow it with vm_recreate_with_one_vcpu(), so the "release + later
> > > > kvm_vm_free()" path isn't exercised today.
> > > >
> > > > I see three ways to make this clean:
> > > >   a) This patch: kvm_vm_release() becomes idempotent for its three
> > > >      FDs, matching the kvm_stats_release() idiom it already invokes.
> > > >   b) Leave kvm_vm_release() as-is and add a dedicated helper, e.g.
> > > >      kvm_vm_destroy_kernel(), that closes vm->fd to trigger kernel
> > > >      destruction while leaving the kvm_vm struct intact for
> > > >      post-destruction inspection.  kvm_vm_free() learns to handle the
> > > >      half-released state.
> > > >   c) Something else entirely, e.g., the test should manage vm->fd
> > > >      directly and not rely on library helpers for this pattern.
> > >
> > >     d) Fully kill the VM; validate the semantics with an explict mmap().
> > >
> > > The entire point of the test you are writing is to verfiy that a guest_memfd VMA
> > > doesn't somehow cause KVM to leak state.  So, make that obvious instead of abusing
> > > APIs that kinda sorta do what you want, but not really.
> > >
> > >         mem = kvm_mmap(region->mmap_size, PROT_READ | PROT_WRITE, MAP_SHARED,
> > >                        region->guest_memfd);
> > >
> > >         ...
> > >
> > >         kvm_vm_free(vm);
> > >
> > >         TEST_ASSERT(is_zero(mem, ...));
> >
> > The test isn't about guest_memfd.  The pKVM support that just landed
> > via Will's series [1]
>
> Landed where?  Is pKVM actually going upstream with anonymous memory?  I thought
> the inability to protect against page faults in the untrusted kernel was a
> non-starter?
>
> > kvm_mmap() + kvm_vm_free() + is_zero() doesn't translate here.  The only
> > host view of the donated pages is the memslot mmap, and kvm_vm_free()
> > munmaps it on the way out, so inspection has to happen between
> > kernel-side destruction and userspace free.  kvm_vm_release() is the
> > only library primitive that does that today.
> >
> > What do you suggest?
>
> Manually allocate the memory and expose it to the guest via
> vm_set_user_memory_region2() vm_set_user_memory_region().
>

That works for this test and is cleaner.  I'll restructure: mmap the
backing in the test, vm_set_user_memory_region2() it in, then
kvm_vm_free() -> is_zero() through the test-owned VMA -> munmap().
That drops the motivation for the kvm_vm_release() fd-guard patch
in this series; happy to drop it, or to keep it as a standalone
"match the kvm_stats_release() idiom" cleanup, whichever you prefer.

Thanks,
/fuad
