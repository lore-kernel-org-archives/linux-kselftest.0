Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792462481;
	b=rFadhYyLUw7uEd/m1xKQnYge93LXCfViYrl7VPZQmBZH91ZDNZGFSauboCw/CpqYeNih
	 ZFh/fY+hbzI0Fj6NpfaHE84aEjVSCK5loGXz6y5ieH+hqAd/DSYGftOq5w2HnDC1kdujX
	 9CqUDoz8Q0Pgby87LRrX4+nDtk0jORbItCyJUTyAY0xJJdGqH27Q7Fo6M/frw/vxXuRpy
	 Pse9bmaHBeo8e58DX/rqOrSHXpga++n3BkX814WONDaKpH96/+RA7LOon/1c0GbmoI0nS
	 U8SPKp4qmywkfUgw+s8p8hS08iiuNPIb/Ox3kekdPtEnU3OdIgO1X9JZFyMtE1aCWkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792462481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=5Iwx53FddK31aCeF3yTsYcRGG3DAdKI2xVbjXFtQkwA=;
	b=rCcjOQpGA1cEUGURROGC6r36gDikFv7lhY7blpqjRMZSI7WgvRxOpzIb/1EreERKJRwK
	 dyUcVNXp1OwNlI4uJ2RqWeJVuFUru6fEv21ANsW2nk4vZGwYsxr7tjSqWEyYqQINUNZdA
	 FmTOa50sy1Vk9BkQeq7ji/HrHRSqbr4SuTWsnG6Gk2z71ND6y7dsmfAegLYk3I1hEB6k/
	 WdJuRN8nuc6tmdR5vE+XKOZ0fhJr2OG/YqE4CdGqlElNEQfXpyqgCvevWleVhiEonl2YO
	 7K5NHS3T3VvnalgWMPgfpw5kIX27eeR7HA2AS7zN5dGX0ndS0DtE27VInlV/d0Vc7QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oBihJ65C;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C9B606A319
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 02:14:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3C9B606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oBihJ65C
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso1668620f8f.1
        for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 19:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792462479; x=1793067279; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5Iwx53FddK31aCeF3yTsYcRGG3DAdKI2xVbjXFtQkwA=;
        b=oBihJ65CMLYBqYHD9hPzlwUnnU21Djjlk+0ywA8lRRGdNyRHqBkmkB2lVi7j7VuJ1l
         MPwAaFfom20siTmykpM4ACL2ty3lpQ6vyWJJmpPI8ZNX5UWUMWNCT76IcffFNMOUGFTk
         ORdK+O3A4W904mNRG0BhTfAQ3NjS8YqXkkKvnV12Bxd9kRss/cY1Tv6b9jyxrJCeHjml
         1UVPVfEtj0r/j8yx2gjVcG3pxob+11ZYhiUZjgUj33HkXufAXfebmxat2Oeiaf2Mav0z
         Vvwv6t7UGKyBpY9zHG+AYKsyBiV69wdVVX/+3Y2olVz6L5eDY0ngAgoqozcmxhtarnNO
         JaXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792462479; x=1793067279;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Iwx53FddK31aCeF3yTsYcRGG3DAdKI2xVbjXFtQkwA=;
        b=iuQkDCYqH/iuUg1AXiM1t0vK296pzrz8ztktEPVTZEdTl2YTnHGHIAf1u3b+TJe/73
         Mb33H7WOlBUbSyNbk1RocCzuvsEY/YC2fNTGPeKp9r50HJhfyWsONyuUpdVoj0FY6V5i
         jp+MP+Jb1+mf/Nry7kXIcyKPpsOK9i0TXWSY65m5O7RG1aNfcVhh+sYzu7ZoOIh4CFwr
         8uDEfOqe2qIt2SbzklSCHy6TeysNo4oF3TUQv61IRRBjdUT5bjimnhZaleu+351ngNOp
         8guvm1CckCmtmQ/M0VJryqiylaXXomvi6KofdBQXA5ps7+F08n+Y5JI4kA0lV6SU6xtZ
         /egw==
X-Forwarded-Encrypted: i=1; AKwUvByN6x1vjhrtsREB84sJ4ZFDWk6F3KELg/R3n7XY4LrawiiW1Ljp5qhoffk8IN0hgyDkcH+tBEk2kZ1nOsCn3D0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4rm9DQfD0/bFyLmCMI6pT/p9yhy3yNBZUDsucria0V8oOYwU+
	yHtUm7tmbyrnhppfE85p+TuPCBbHbD/iNrQQeajX/u1IFGmzM2+Hr3GN
X-Gm-Gg: AYBFou0Pvnq4jE7iI+I6RpRvpHgFPaNVO/U5yThppjUwj6VkFboKMrwiZWYv9jYQ6SV
	xWbA8HE6DvM0s72k3hgluzhY/fwEQS7NjRYSLU9O502QUBOQlaUfp2WsmtTrRDMxtDlf7vnSdX7
	ZmpWRYewG69GkpLKxG8LlS5GUpzLuDrXeR/1jcBijj7O13iGS0asHKxJeLJRfZVXXnNc8Vz+4u1
	I3gAVRtE4xTXPBUg9Y88GWRxTX01xd0TniBpVbgRWYRMjEsoWZ7y3y/bMWUXrv85/NjXtGAC3qv
	/GHP+6JMOFP43QxorUjioWOZhx0xoc7OgKua9b8OMWRNktSGTrNPmU+CyH9HSKUKRwcnAZNOiGh
	M3EIH0YSJlNhkCiSvHFKq8Fy9kWUlfzJw7RHn8LS7rae2ZH+yKe3Is3sf8Hi9VR9is9ZmymioHO
	pLs+ODyU1++XGklFYdHIDCttBtR/mu/uRzwN1aUKW/dVopx6TWMZFVtLkGkz9LdAiSrC0Lnwt0+
	ENjF2Lapd41O8Eo3yBpf1yBALgIJnwpwWaLtqfnBDAbrhtnZLVpbVH3gVNFh9fxMdoKMXYuGx/o
	eUs40THy0S+ESwf8vxwq0ocyiz4tHJakfZZ/NVBNxzJq4ZJqiSGXL2s/39MgXyWex2CIhmiqVKp
	CVGJM3tcTzA==
X-Received: by 2002:a05:6000:491d:b0:488:5852:6ee3 with SMTP id ffacd0b85a97d-48e07bc2f43mr19882172f8f.34.1792462478968;
        Mon, 19 Oct 2026 19:14:38 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-9c92-6501-cda9-90cd-4e49-75d9.310.pool.telefonica.de. [2a02:3100:9c92:6501:cda9:90cd:4e49:75d9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d8208b1sm2879816f8f.33.2026.10.19.19.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 19:14:38 -0700 (PDT)
Date: Tue, 20 Oct 2026 04:14:36 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Harry Yoo <harry@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, David Hildenbrand <david@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	David Stevens <stevensd@google.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Shuah Khan <shuah@kernel.org>, Amery Hung <ameryhung@gmail.com>, 
	Swaraj Gaikwad <swarajgaikwad1925@gmail.com>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, linux-rt-devel@lists.linux.dev, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, cgroups@vger.kernel.org
Subject: Re: [RFC PATCH v2 0/3] locking, mm: Add atomic allocator trylocks on
 RT
Message-ID: <atbOS2rs94fB2red@gmail.com>
References: <20261005070625.8871-1-kmehltretter@gmail.com>
 <asZ8jmWNoGk5tYce@thinkpad>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asZ8jmWNoGk5tYce@thinkpad>

On Wed, Oct 07, 2026 at 07:15:29PM +0100, Harry Yoo wrote:
> On Mon, Oct 05, 2026 at 09:06:22AM +0200, Karl Mehltretter wrote:
> > On PREEMPT_RT, a BPF task-storage program attached to sched_waking
> > can deadlock when kmalloc_nolock() obtains an rtmutex-backed allocator
> > spinlock while try_to_wake_up() holds p->pi_lock. Releasing the allocator
> > lock can enter priority-inheritance or wakeup code and re-enter scheduler
> > locking.
> > 
> > The first RFC [1] rejected every non-preemptible caller. That prevents the
> > deadlock, but it also rejects BPF arena allocation and faults under the
> > arena's ordinary raw lock.
> > 
> > This RFC instead adds an atomic owner state for bounded PREEMPT_RT spinlock
> > trylocks. Atomic acquisition succeeds only from the completely free state.
> 
> Please don't skip discussion stage and jump into submitting a very
> intrusive change across locking and mm, assisted by LLM? :/
> 
> I don't think attempts to tackle this problem will make progress without
> discussing and getting buy-in from (PREEMPT_RT) locking folks.
> 

Sebastian, Peter, Thomas, did you have a chance to look at the locking
direction here?

Thanks,
Karl
