Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793304091;
	b=FTG32LqhEEAdpoouXzWz/IxGofoWiEk2ukpasdJR73ksmJ9nVIMPejfXp760SUOA/Us1
	 03v2uhCrqKi3z02Pann6/zmgCQbMTYtcCgyTkez7s/WX0B+GeuRLf1RYc625dQ1krInYx
	 8S3KHOCDD1tAIp6YNLlk7+HZzLEq2Jgs26lds8BY86fG0lXplcXLItvfyguVYbA4LHDNn
	 rdtfMPhtHegSXV5lOMM+Cz6oyva9PNB7HajEriRG4wNODTfgP76pNdhOY0iqkUroYrL5Q
	 5RcC05Q8E356xuKgFxY6QkmZGXtsJV4M9QPggIu2Vqhtr/9Kkvqfhd6M36Rc9PJCqdw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793304091;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=41rEEZJHQ1b0lZW5NZ/hL5Z21i+HuFKPEi+1JbBpXGc=;
	b=4NudUCELvHmmYuGRqaGpWocCQGFhZ+r/5eAhPu0fHDSBPzFM3AVAkZ5QTvYeQ7/SnY8t
	 UjEs5GLewN0fGVwVSgMORTcT95rmkgkUI0irabRRRyF9fC0HGifaeAcP2f79iPM5ybqoX
	 QVfC+pW2dc3l6SJbM67zKWdOnUlts2jp7k9qvcfGrvIKvqYlebWoY3g2w6W4DmOeL8uGx
	 jRe+FJ/hLqrSCeVM8N4FO7ytTkqZ2ePhcX4fi5N8toaXlZiXZeGzk1r0Ju3u/KqCZaRal
	 lsL73bD9Fw6NBHY89jw00NOvRvHBdiDxYTlO5SpuDz3HyEjGbgwTpUYulCW1qYdrfdg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WzkVwYzI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.178
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED34606A31C
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 20:01:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DED34606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WzkVwYzI
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-943e8d35f74so217237885a.0
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 13:01:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793304090; cv=none;
        d=google.com; s=arc-20260327;
        b=hE5UgzAg5AO2gER+LQ6C1TTUISRukJSTItMwdLZoCjYRIBiGHY0y+qQZKn+kXlLAiO
         2nBpUKz63Ak+Lg8KHd4GSI0vP4ljwT8sBcpZnjWUBgYObWJqIsD3vexSz7PK3HQXK2nB
         AZ+j94FQOKCbX+ZUzVfi0ChxunsHXSgb8+GQq/xf+WZJoWnhIvAFhCvkIHuYsCGSKT8t
         4fcn8CjgGm2h4EV6+qN7+22W/BPhwvpcnaW9Bkrf08NMY9Z038bIH5hbAbPGx/g0pnJ1
         7EWYGJch4qZaVYbxOkHONjpokEDF1YY2VVtHBPa2T0y3lbrCtIw927JotVqu40UYVkyb
         tRhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=41rEEZJHQ1b0lZW5NZ/hL5Z21i+HuFKPEi+1JbBpXGc=;
        fh=x+RZrjC5kEXM4XG6wTaiJh32S/x1VXBG05ooXitlyGo=;
        b=dgRrycQ0iM5gU3+xBkh428jWSHQqblHURyl2O6DzLYT1cH9hYkUrdLTr605ztTn0xK
         ZeRgmthc/u/rP6bJepOLQ7Yotsu3x9dbJYFLQKfnMvz8ISD7I6WUsKTOY0VyFbZlKfVC
         sxUq2vPDW97i+5cdVnc4pn/687pbukWbBg6P5yGOUol4DRfpUez3vCCMw9C50b9qakqT
         iKz46nNsewwxNMDOKHCOTWiZ7uei0NHHkDmHtIIELIbCt2kwxUyzKtDsRyvzmCZUeay1
         7JcxJ1yi67BqXukRnA8K1rkUWWgFhe7Qkpjk9zcWQO8qzlNQh+ExBnogGgU8OtmXbq7U
         WaTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793304090; x=1793908890; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=41rEEZJHQ1b0lZW5NZ/hL5Z21i+HuFKPEi+1JbBpXGc=;
        b=WzkVwYzIEvlUD4jouGSIwB6FRlfF8hxTgPyyNpqGmkTWIQg0Ole0rsRJIpCMSLmcYo
         xny2WIjTKOduGBsjO3M3Hy3Y5Gpxav5pAEQ+dey/WDXOYqqnfW/4s9rt/5qtlD0o1JQD
         qgNWqEb/ESz1VmMIS/1NOS99QXo6xUINV4qKkkXEUdhm9m1VegHsAvLzUItKmZOIN1QJ
         iIqXI//Wxc9ozlcrU7fWVky9rHoQfM3GQHS/Ns3ot/06EY6+UkCJJuj9LxgFC9LLrk2R
         hMe7EXKbU+My2iqLUjxXv7+wewDozb/5zzK2zqO63rDc2gOPzlMplP5cO5XTnsm8pZwT
         JcEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793304090; x=1793908890;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=41rEEZJHQ1b0lZW5NZ/hL5Z21i+HuFKPEi+1JbBpXGc=;
        b=iZWSFhfID1VJnmwIoqG3PHKS/rTRCbApIVx4sF5HyFYpOjes1eBM7JbK3qceA34Lv0
         r5dlcwLureoge5Hb3yP9yTk4Jz/ADUykg/aF34EyU8rTnB5JOg5AfzBHaFd30Dp8xCtv
         sbDbF4cC0q1DvHCraUpWo1tf9HTzcQtZZdIGAG/9rfT7IbIO8xzMfOxWo3ZvZzJx4c4d
         MMkQfGtiYdb86kRTWJibxIFD9tlmuTqYy+dOWaL5GGr+BEsM1O++E1iHOyPUxsFQEcra
         9CSLsXBO2edOR26UIV9w8y3aNs+wbyQ89AgcUGhOaD3d0qBr3Qpg5D9Ts7O6qsxgzGVa
         vA2w==
X-Forwarded-Encrypted: i=1; AKwUvByDMY9V8W8d4zRw1WfC0mdM+UalMHDGe79fhTKub1am7DV7jy6Q8LuvlD3eYFVJ1nzHGzAHEBeKLA5O3k0Bnd0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/ID6VX+QwVc5+ubI5Lybhzach54hh98azuK5wnk+gENcGdF3L
	bTKzkl9aZjSjGkO1cnogkdSBbgOT1zGgv+1QFRJfI0A3WGN8kcuZtx4YgzVS2KFdWrz6THLZdYW
	2X/9jcJMkfxzfd6mhxYnvus07uj/QgMxRrzvUj8Gi
X-Gm-Gg: AYBFou2C2duPT8TChnw1xXzKdTBgKWFUPe7DCBHzcqB6bD2bUatlLYSVuk+2BJyISvi
	rBAAkgBInY9EyEm2GzTks2h9POMf1duODiAjolytfvvb0TUnnH7gdsUAXdJZTVXhAcevLuo7uj9
	sXom8QOHNGUnGBEikjnAYilc0NgF4O2PLn9Jp8gjV8mAE0bbHvO/8gawOme2S8uNJhjOLdsOygk
	x4Hb3gC/Gcj12eB0PO/AGVa3+gba/unY1VmxykoT6E6kgJfDwfoiemDgtJNyTLYEEMQU8Yt+OYa
	zY8aV0DPa3tQB+tMtn4/68VEJ2+QvSIbx3qcTqjVHZFi7LbtDS7BvJjmgVYVOgTIyhrtfA6DRni
	Re452S3zzSWHxvYvfJJpAs1UM/Y8QeWjA8Lzm+MB8hJr4yxdGpmgKN8muR7AmKhIjiD/Ddhk7rv
	4ia9RbmUJb+TYNVfgr9CuhiSY=
X-Received: by 2002:a05:620a:439b:b0:93c:b6db:8c with SMTP id
 af79cd13be357-94421400aaemr54046085a.0.1793304088692; Thu, 29 Oct 2026
 13:01:28 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Oct 2026 13:01:27 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20261026064424.3003536-1-gongtao@google.com>
References: <20261026064424.3003536-1-gongtao@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 29 Oct 2026 13:01:27 -0700
X-Gm-Features: AclHuK8yWAvbtrHc6IRHr91-GPti5braQ_xMkumtHHr_gZTK1th84mOiXH74nIU
Message-ID: <CAEvNRgFtgAFg_nBLXwvXv69zrCQDKRSvLC6DwYPAw30N+BEoeg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 0/5] KVM: guest_memfd: Add KVM_LINK_GUEST_MEMFD ioctl
To: Tao Gong <gongtao@google.com>, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: David Hildenbrand <david@kernel.org>, Ryan Afranji <afranji@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, Sagi Shahar <sagis@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, aneesh.kumar@kernel.org, 
	Fred Griffoul <fgriffo@amazon.co.uk>, David Woodhouse <dwmw2@infradead.org>, 
	Jacob Pan <jacob.pan@linux.microsoft.com>, John Hubbard <jhubbard@nvidia.com>, 
	pankaj.gupta@amd.com, "Alain Gefflaut (HE/HIM)" <agefflaut@microsoft.com>, michael.roth@amd.com, 
	Samiullah Khawaja <skhawaja@google.com>, suzuki.poulose@arm.com
Content-Type: text/plain; charset="UTF-8"

Tao Gong <gongtao@google.com> writes:

Adding a few more people to Cc after today's discussion at guest_memfd
biweekly.

Sean mentioned the link ioctl as the line of sight to sharing memory,
would like people's thoughts on this. Captured some of today's
discussion below.

> [...snip...]
>
> Use cases
> ---------
>
> 1. Intra-host migration of VMs with private memory, where the
>    destination VM takes over the source VM's guest memory in place:
>
>    a. Userspace passes the source VM's guest_memfd fd to the destination
>       VM, e.g. over a Unix socket.
>    b. The destination VM calls KVM_LINK_GUEST_MEMFD to get a new fd for
>       the same inode, bound to the destination VM.
>    c. The destination VM binds the new fd to its memslots with
>       KVM_SET_USER_MEMORY_REGION2, at the same offsets as the source.
>    d. The remaining VM state is moved with KVM_CAP_VM_MOVE_ENC_CONTEXT_FROM
>       (SEV only today; generalized by the follow-up series) and the
>       destination VM is run as normal.
>
>    Linking does not revoke the source VM's access; the source simply
>    stops using the memory, so every private page keeps a single owner.
>
> 2. Sharing guest memory between non-confidential VMs. Both VMs bind the
>    same inode at the same time, each through its own file, and the
>    memory keeps its guest_memfd properties: neither VMM needs a
>    userspace mapping of it, and inode-level operations such as a hole
>    punch apply to every linked VM.
>
>    A related use raised in discussion is Nitro Enclaves-style memory
>    donation, where a guest gives part of its memory to a sibling VM on
>    the same host ("nesting without real nesting").
>

We discussed Fred's "aliased" attribute that was going to be passed to
guest_memfd through .get_pfn(). "aliased" was going to indicate that
this memory is shared between two users of the same memory range.

> Alternatives considered
> -----------------------
>
> [...snip...]
>
> * Keeping the memory and its attributes in a "memory provider" and
>   creating two independent guest_memfd instances on top of it. The
>   guest_memfd inode already plays that role today (page cache,
>   attributes and the list of files), so linking gets the same result
>   without a new abstraction. If guest_memfd grows a provider layer,
>   linking could be expressed on top of it.
>

Sean pointed out that we need to take into account that at some point
there CoCo protected memory might need sharing, where protected
indicates protected for a given guest (and let encryption be orthogonal
to protection).

Then, we'd need to know which struct kvm the memory belongs to, to
determine whether to share or not, and for that, guest_memfd would be
the natural choke point that understands memory, which kvm owns it, and
shared/private state, and hence memory sharing should be handled via
guest_memfd rather than directly through the provider.

>
>
> [...snip...]
>
