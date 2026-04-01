Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5830223AB8D
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Apr 2026 14:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775053413; cv=pass; b=DUP8kKRIbFmcmBffx16N+5e1sx/KFo4HEvlxVJJxKzoiP/nkJbFQvjuvz6cCuc/AMNFBy6HK/YfLBlxQs93d8ImP2TVPdjU+R29nBh2R+ZxYO/7x4smy2BYGc+rhPFIDLP7t0PHmKAWQ0vXjgQfGDVEcMvITjvZfSBShtzbPePg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775053413; c=relaxed/simple;
	bh=jCAWadVZxWjFHf3Z7AAoz9vfZzBHXx1pRn0Dhndlvzs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ia3Mus1cpFyjZEV1kSjqc8L8RFH3eM5AmZKrYqstDMk8TViIWcPc8ob/6k8wG6SycbrFinuN6yVq0NrgsD/XfnZPlLNmE8t494DZuC3tp+2VDHHih6NaC1evZgY/mWq8rjv2WdLo/nHRHxY+hZxsN1xN4PW/h5ElaCoi6doLO4E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oHujUwou; arc=pass smtp.client-ip=209.85.221.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oHujUwou"
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-43cfb723698so2975417f8f.3
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Apr 2026 07:23:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775053410; cv=none;
        d=google.com; s=arc-20240605;
        b=cwdYeWxdN984xekP7s1eCEpHiA7vc4SrWkz7krs4vlvx/LI6PQOO1Lc79cRPgDtJRH
         l1pEM4BPYj0rBoDav2grstrapztPo9nwJ1GqASZiNvoIgmtjhLhpS+YFTMll5ggYh5d7
         q7Z6rl76WHo8VCNCGE7nuDN2LctKAYYyAiAehm1Pb0cOOT3BU0OLO6szkAuUh1uA54rB
         2Zk+VBFRbzDqLHbI6pdYWR+alys3z83etZzz6kVahHQwBvTYn6326RCWXn5yqq777qnb
         E22+SYaUx9RdBzhxGRf32PyJ1zww7a/B8YSTiym9nsh9f7xWDdSnOpC9n1+KTEptP8a3
         DpwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+su7u1DujUR7e0bvScKtwYqkb+UMyoruXcpy4rpqvic=;
        fh=8wBmyxhhwUgjqNhz0gfb7Zx2znZecZl2C8BIywWIzc0=;
        b=Jr0BHD1BuEx1vpXO7blTkr8mUeqnABcVMvyviy8gKFKrLhoOAZTfqPAr391IiTBuxP
         6sMAUsqB2bc/s5rZogzKvhs8Y4umbd2Y8t4gZJXv86QH5fpD3dslUBjgr4atPg/fr+bY
         NQGejSsdjj5q5VQYc75LkQBPf3JoDF6VTG1/vvm9m71I58Easz0TWL1HT7Hj2T945KMT
         71gtGZd7PtINUZI06KBZSQsYs5oc6s9XYYQpj3f+h76NTB0+gbES/tvgUlm8l7Q388ri
         62uoHubkJlNBWELmvRG2U05mwoFmRUj3klRA4XXKSixojlc7A2fT8uW7jHYj747Lbsuq
         8Tjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775053410; x=1775658210; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+su7u1DujUR7e0bvScKtwYqkb+UMyoruXcpy4rpqvic=;
        b=oHujUwoukkqvnSQZDtRjKwYXDOvtOVLSNtT+IUJtgnzziCEdSWc5/1xtmGs2AiLITS
         ezonN4aLGAHDrtUXbsbisagde34z8ETUZzPTyKZ8MBJtCeVbhws5EQrSpZgU7zjAB/A4
         jZZvatC7DkIv2jj8JQ604jH4yEVlxQfEGf8AkZRdXC0FukCXhQRbrOW5wklZMBt5EiWq
         KSdUtgtfSJdasyzVH0GUdLFQI9x3m+IPP7ushlK7FaRgEiyuzRXBbBGyrBmjpNpoVlfr
         rOxQARq/cQYBE4k8RCGopxQZRZb0cCia5Dpv8akVgIKMZsGp959CWQ7TI7S4AFCQoxHu
         j7Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775053410; x=1775658210;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+su7u1DujUR7e0bvScKtwYqkb+UMyoruXcpy4rpqvic=;
        b=SW6+uueQJzVMPgDPwyEuET5KhFFRuQT8v9iATeO+G8szefXuMcfCJkESPorrm7yULK
         WHb27heOEO9WkfraDk9SoPmuAyso7l5XTnn/9BiIGsgBe/8SvrTcJMipWoUoaljrUccP
         KVxFkoe2LMHTTrk1P4vvQjlCYI/r4JT92fpA7rTnel5afGUhiKWcI4qabCXsEd44s8NN
         idgVlioyZFgJIE1v3fBDvHaM22Cj/w3anWp49bJpOjq6eKocqg7RYo3+WIFRFqYzggm6
         x4Gn/L0RM4u2KsRMTGTrfq8sD+6/xOCXHzfH0CqLYsnzCZ+A9Pkg8s/PIc6yoESpfL0t
         GagA==
X-Forwarded-Encrypted: i=1; AJvYcCV2VDEWyHjpEpfMi9MuM3wR64EWaBzCtYEwZD+9Jw0B8t+TCJl3DKI6xYVXql93SLGGwQVLnH9N7HTe1sW5t64=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBp+glk1erdUZclkyoFdc/ysQ0DyZrYeMcgbJ8RiriaN41fMvz
	yifQ/9T/3JcFovb5TlAaago/cIAD+juvCB1MAEtP7RNA/F3yn8Hk9hwXHnLY0RWlI1+1E5ajR64
	eo1zoZBkLsf0EJsArkuDDXGgVbM94ASU=
X-Gm-Gg: ATEYQzz9Igxg6j7lyvfw8dnvDwaepQQqoud2tFOKavFxZqOG3WQFnEOk9c2iOHBHI2C
	AQGoGLPWEdmN72GRdmzd3r9Qfe4ZKIK8R+dreJTmRurX5OaB4v/oMWcTN33IkXieC07WtPZ4Lpg
	dl0pGvoZnZDDGtdkmmp1p29MBLmK/QDAqrv82tj6+WAD1pIQsG1EQUupOLt8hoQ4wqDS8Pk4qEd
	of+h1F0F5e6rlIda9OOWAA9nOUjK0jRjqHLTz0Xil/ssxaeSahDYE7/E4pbaDVA88hEaTuA4Adw
	N68y04IpMatmnvlUf8m1rieVTn4aQ+w5vKJLz5wDNnEK5tM4n+UIdHMf36I5H+VqepSWOA==
X-Received: by 2002:a05:6000:18a8:b0:43c:f90b:5663 with SMTP id
 ffacd0b85a97d-43d150d7563mr6887118f8f.37.1775053406663; Wed, 01 Apr 2026
 07:23:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331153413.2469218-1-wusamuel@google.com> <20260331153413.2469218-2-wusamuel@google.com>
 <2026040153-overpass-shanty-71a0@gregkh>
In-Reply-To: <2026040153-overpass-shanty-71a0@gregkh>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Wed, 1 Apr 2026 16:22:49 +0200
X-Gm-Features: AQROBzDH-gBJUmuMrT1i00bs7K7Gj7h7rmupTCDKMaOOIhQqh803srjDhQwcCmU
Message-ID: <CAP01T75nL2wzq+ONGNZ2AB6=A9iFDabTrXOWOwXLhqYohz2ZQQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] PM: wakeup: Add kfuncs to traverse over wakeup_sources
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Samuel Wu <wusamuel@google.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, driver-core@lists.linux.dev, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 1 Apr 2026 at 11:11, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Mar 31, 2026 at 08:34:10AM -0700, Samuel Wu wrote:
> > Iterating through wakeup sources via sysfs or debugfs can be inefficient
> > or restricted. Introduce BPF kfuncs to allow high-performance and safe
> > in-kernel traversal of the wakeup_sources list.
>
> What exactly is "inefficient"?  I think you might have some numbers in
> your 0/2 patch, but putting it in here would be best.
>
> And who is going to be calling these functions, just ebpf scripts?
>
> > The new kfuncs include:
> > - bpf_wakeup_sources_get_head() to obtain the list head.
> > - bpf_wakeup_sources_read_lock/unlock() to manage the SRCU lock.
>
> Does this mean we can stop exporting wakeup_sources_read_lock() now?
>
> > For verifier safety, the underlying SRCU index is wrapped in an opaque
> > 'struct bpf_ws_lock' pointer. This enables the use of KF_ACQUIRE and
> > KF_RELEASE flags, allowing the BPF verifier to strictly enforce paired
> > lock/unlock cycles and prevent resource leaks.
>
> But it's an index, not a lock.  Is this just a verifier thing?

It's a verifier thing. The index must be passed to SRCU unlock wrapped
by the unlock kfunc for correctness. The verifier understands such
acquire/release tracking for pointers (e.g., taking refcount and
putting it), but not for scalar values, so we need to launder it
through a pointer to an empty struct, which isn't really usable except
for passing it eventually to unlock. If the program doesn't do the
unlock, the verifier will reject it.

>
> >
> > Signed-off-by: Samuel Wu <wusamuel@google.com>
> > ---
> >  drivers/base/power/power.h  |  7 ++++
> >  drivers/base/power/wakeup.c | 72 +++++++++++++++++++++++++++++++++++--
> >  2 files changed, 77 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/base/power/power.h b/drivers/base/power/power.h
> > index 922ed457db19..8823aceeac8b 100644
> > --- a/drivers/base/power/power.h
> > +++ b/drivers/base/power/power.h
> > @@ -168,3 +168,10 @@ static inline void device_pm_init(struct device *dev)
> >       device_pm_sleep_init(dev);
> >       pm_runtime_init(dev);
> >  }
> > +
> > +#ifdef CONFIG_BPF_SYSCALL
> > +struct bpf_ws_lock { };
>
> An empty structure?  This is just an int, so you are casting an int to a
> pointer?  Can we make wakeup_sources_read_lock() actually use a
> structure instead to make this simpler?

See above.

>
> > +struct bpf_ws_lock *bpf_wakeup_sources_read_lock(void);
> > +void bpf_wakeup_sources_read_unlock(struct bpf_ws_lock *lock);
> > +void *bpf_wakeup_sources_get_head(void);
> > +#endif
> > diff --git a/drivers/base/power/wakeup.c b/drivers/base/power/wakeup.c
> > index b8e48a023bf0..8eda7d35d9cc 100644
> > --- a/drivers/base/power/wakeup.c
> > +++ b/drivers/base/power/wakeup.c
> > @@ -1168,11 +1168,79 @@ static const struct file_operations wakeup_sources_stats_fops = {
> >       .release = seq_release_private,
> >  };
> >
> > -static int __init wakeup_sources_debugfs_init(void)
> > +#ifdef CONFIG_BPF_SYSCALL
> > +#include <linux/btf.h>
> > +
> > +__bpf_kfunc_start_defs();
> > +
> > +/**
> > + * bpf_wakeup_sources_read_lock - Acquire the SRCU lock for wakeup sources
> > + *
> > + * The underlying SRCU lock returns an integer index. However, the BPF verifier
> > + * requires a pointer (PTR_TO_BTF_ID) to strictly track the state of acquired
> > + * resources using KF_ACQUIRE and KF_RELEASE semantics. We use an opaque
> > + * structure pointer (struct bpf_ws_lock *) to satisfy the verifier while
> > + * safely encoding the integer index within the pointer address itself.
> > + *
> > + * Return: An opaque pointer encoding the SRCU lock index + 1 (to avoid NULL).
> > + */
> > +__bpf_kfunc struct bpf_ws_lock *bpf_wakeup_sources_read_lock(void)
> > +{
> > +     return (struct bpf_ws_lock *)(long)(wakeup_sources_read_lock() + 1);
>
> Why are you incrementing this by 1?

I think SRCU indices can be 0, so it would appear as a NULL pointer to
the program.

>
> > +}
> > +
> > +/**
> > + * bpf_wakeup_sources_read_unlock - Release the SRCU lock for wakeup sources
> > + * @lock: The opaque pointer returned by bpf_wakeup_sources_read_lock()
> > + *
> > + * The BPF verifier guarantees that @lock is a valid, unreleased pointer from
> > + * the acquire function. We decode the pointer back into the integer SRCU index
> > + * by subtracting 1 and release the lock.
> > + */
> > +__bpf_kfunc void bpf_wakeup_sources_read_unlock(struct bpf_ws_lock *lock)
> > +{
> > +     wakeup_sources_read_unlock((int)(long)lock - 1);
>
> Why decrementing by one?
>
> So it's really an int, but you are casting it to a pointer, incrementing
> it by one to make it a "fake" pointer value (i.e. unaligned mess), and
> then when unlocking casting the pointer back to an int, and then
> decrementing the value?
>
> This feels "odd" :(

It isn't readable, though, because it's an empty struct, so I don't
think it would cause any issues in practice.

>
> [...]
