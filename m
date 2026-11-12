Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794501639;
	b=XebbhJL8br2k6bceA9NpxzYdN6INwi73E0yY+dj2+U8y1gGrYV5dtgX5ATEAaBzfq+7n
	 Tj3NRNbEiPQyVIbJF1g0zhTtzWth/kvHi96MMVSeQqVO2gFHQtA7K17j6qPkgPRP7CX4z
	 +FYny0G6NDE3cCjGhG+r4Bi4RCjeywyxO97yZbLH4JNihqB2gZ4821QFYoknenA7k40QC
	 PG+s9KOo003eBE/34/ZulAOGcwvzwoDNTU6kmV2RjfyT1PdWciODj8gtPeDtquw7zqTaX
	 Z5Wc6A+1L/Mt2J2FGl+M7QsYUKcYm186qSCR0BBYEqKQNBW2mYRtnH6WGB8MQilNiDA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501639;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yDFWnnkId3dZbfuzfoQ+57D2DdgEpJLTTPrFOrVSKi8=;
	b=OVYFU810GTp+FgSmmC3/dO9C7McD82B97LxbVyLSr5HvR7VuqsPUvp/ybZG1xU8XMCMi
	 cpbz2VqTJ6v4YpcwABCv4Q6Sa9UERDQzs1RWcjf9NHxadBdPPx7wDAtbH6A5Kq/lUu9WO
	 0Kr23n2lAfP4muaTL072ivxmHZVK7ow+w+oHzJjWBtKNJLfl5lGoCOVbkMmFbUO19gdlq
	 4qtm0SxWRVgmIw0mY8wAJ4Jvz79IfakDcy9f/WZPc0Zh0EEE3F4qNHa2OMt8zlvwWa/YM
	 PW4B2OuUh8U0LLdBpPZybmcpP7klkd5TWSH6Dh0ZCyPRbDFhOZ9SNZ50RvzAgnHSjuw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zSTRe6bc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E87606A33F
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 16:40:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74E87606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zSTRe6bc
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-490585eddfcso3476927f8f.0
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 08:40:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794501638; cv=none;
        d=google.com; s=arc-20260327;
        b=ak0/uzDBt+6JQH9fQI4n0QlmIhyXzXnmUnWwkBWAWsKN0hBFBbcdaRwrPnJ84Z4bjX
         HICn1Oi8M9LfgiDYTwAft6FAGkWVvxNNNb3P6xC88Tl9yfu3kGsQCHP9g4WVZig7f7nB
         4qMAV9rX9+yo7tdjEh9toQkbmVVQNyiLRSk+axkrgiHTy3E6s91ZvxK0iSctI8k2MQVc
         CxIn7cuIJhKyx5Ew/AoPmE0WakwnMnppDXCkQWACHdLyvAm4UKVy4F8MootW/H+Qrisp
         JHjlyekW22BEY8P3ETOp6BhRuff8zjLhznktOreeDC09gAYksfwtubXK9/U7AEWanQ7x
         NzQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yDFWnnkId3dZbfuzfoQ+57D2DdgEpJLTTPrFOrVSKi8=;
        fh=JKr0t+U/X7xmRnogwY46F/M63DkTV33KyBN56LktX/c=;
        b=VLHevtNTQSUmRsrfc8La3msjB4VVW6Hld3edYoGf6D6OnAwLdKxRyM0GUv1UAVwzZ2
         HTaTofMDjx/ZIHXp4YKpoQcQnnD75Qsk9zTgmMDFJoHTS70mxyB7R4kW07wxSgVczJHw
         /Yzhj3TUvy7R1KE3GecW7bUHZzB6XWV7bvMVYUzhYLjNYBwIdHXGiYbbnmSjv8icUaM5
         sSQil9agN7pBlTbam9g8o5HIWTzKIN8TiRWEKS99bCnZGdKjTBzMDFrnO5mzbYDcV0vj
         iaQFVisIoO9+XcuDrlQ2Dy8QNLWX5vYGv7fsn8YxqWzDwxlSuiy13ZpUYIPZ96nKThoK
         aEJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794501638; x=1795106438; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yDFWnnkId3dZbfuzfoQ+57D2DdgEpJLTTPrFOrVSKi8=;
        b=zSTRe6bcpEP0F6lRzme7StvyYeoHX4QkB0ipadH2vg/pjnjMLNyV84pDO0l2RsL4H3
         NiX5YYkTTQo/IbG4eKCM7ptmaQ7zGd87omyitWEWk9Uc22tWQeokvwrzEQNpPng/1/q7
         6dCDIJplhjRVyLU1DCWjS7MRw508izhA0NS80M8HAyxabXNSFR8WN7lUgm3kFRC8+KaD
         1XhAMA9Ko6pvCIAMy3pI/Up75av8t8te2PBEBGEp81c2fFIvgWYmvp0hmfWL1IjpwGdM
         B9+VZv/tm6Qk1JOFPsr5Ff1pp1Irdji+Tv8WvUcoiFhNurMwnW+zyuHax8WBwILRnr8K
         jDxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794501638; x=1795106438;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yDFWnnkId3dZbfuzfoQ+57D2DdgEpJLTTPrFOrVSKi8=;
        b=VUdlLpyvOcnzTe2EG5POm+h2nmXDxEXZjciR1FHDM6ftGdCdWh+KcinOUhUG0Yr9Ki
         9N0WrdTYbM5GQ9Bo9mFQGdbeKEHUQoym6ZQ/V1uut4gSvvOxueoVNGoZ43UdMjO21rlg
         fL87nwuH89TLpfgRQxYM73Ti8WHWS5lP6NjDPPSuB7OnttvUhuw7Ni9j9pGlGTtwSG1+
         VCxTekheTvCnfsSb0K+MATY7hPRk1MU1ywsnRZftr+6dGIxXWDotyX3ps+x+nLfovN2C
         zOa/KrhBJPIFQHho7P65VdCH1hSGD3HGLFokgfWYazU5/3x5CcAzP++/lBMFml1Z5dJt
         uDqw==
X-Forwarded-Encrypted: i=1; AL+hErFExuODv9p9qgcrlCr9W+trBgbIO9NgEY3gEUYp7OAz9VDnyOqFjQNf0TVVVTfSFfdyt9Gu6EsvoDbdqUV5quw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MZ26ipDbHGaJjMEwDT65L8Sm48JL17/jiPIvA9ao8eRc6dALT
	C9sXz9gLBn/6+sH6DE2568d5VAmqxnBCe2EgTs5lODP8Aez/XyBl7Z+B265BcS9BY9I/y9CA46B
	efZRx6KSM+/G2Gh6/3mC5RxTEM1ZGmEo=
X-Gm-Gg: AYBFou2OYGjuDBy37oWlaHPQXK20v4EcJ6wcNFXB0m3UIGBnxL6wqVoqTmHJTOVX9zq
	3s6DmBahkKAqXZXX05CIvD2ywbt83jCZPIHnT4Rz6/3B+vRUB8yyVFJznkHYBeFVsc1ghO0PbW5
	9t6p7HGRxFIM695KvK/u9/JqLuKEjcPhErhygy5NetWP7PDN1mrl92LkgzleUW8uB2Q9E8/vF8t
	TP1DBZr5+6L5uu82y+nbE0XHvIaPmgbL1nne8XGWBEipCtAT5rImsM+eu2ZMsq6f2zGFEbnuWXG
	9b1QC89XGsZYqsMGQGCt7aV43X1g2W6MYU9oTxoonYAO4CmOrfMi4q6CgqcBJHR6H9pmGxnARbX
	1A9oG5zmOwAWBjovTLq/Q1F8LVUr9+4m/a/bRw929ebKbCH2URmhdFOuzajppNACBAdPhHQ==
X-Received: by 2002:a05:600c:354a:b0:4a2:1050:aff with SMTP id
 5b1f17b1804b1-4ba0939cc9cmr116023935e9.6.1794501637516; Thu, 12 Nov 2026
 08:40:37 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104165504.2430480-1-kunwu.chan@gmail.com>
 <20261104165504.2430480-24-kunwu.chan@gmail.com> <c4f84631-5805-4750-a7bb-3fd5a24bbb62@paulmck-laptop>
In-Reply-To: <c4f84631-5805-4750-a7bb-3fd5a24bbb62@paulmck-laptop>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Fri, 13 Nov 2026 00:40:24 +0800
X-Gm-Features: AclHuK9v_Y77arVgZcVVGwgCPDnh2ZgjQdSu0zI-cG-aALJ_JZ_d5zP_ayWkNKk
Message-ID: <CAN_Opa-z5mmmw-OB7bU3xuKJAHp0L4Tp8a9A7tjqiaY4s9V5+A@mail.gmail.com>
Subject: Re: [PATCH 23/28] rcuscale: Add hazptr scale type
To: paulmck@kernel.org
Cc: boqun@kernel.org, mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com, 
	corbet@lwn.net, mingo@redhat.com, frederic@kernel.org, 
	neeraj.upadhyay@kernel.org, josh@joshtriplett.org, urezki@gmail.com, 
	dave@stgolabs.net, stern@rowland.harvard.edu, parri.andrea@gmail.com, 
	will@kernel.org, dhowells@redhat.com, j.alglave@ucl.ac.uk, 
	luc.maranget@inria.fr, akiyks@gmail.com, dlustig@nvidia.com, 
	joelagnelf@nvidia.com, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	longman@redhat.com, rostedt@goodmis.org, qiang.zhang@linux.dev, 
	brads@mainlining.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, lkmm@lists.linux.dev, linux-doc@vger.kernel.org, 
	rcu@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 5:45=E2=80=AFAM Paul E. McKenney <paulmck@kernel.or=
g> wrote:
>
> On Thu, Nov 05, 2026 at 12:54:41AM +0800, Kunwu Chan wrote:
> > Add a hazptr scale type for per-writer hazptr_synchronize()
> > cost and per-reader hazptr_acquire()/hazptr_release() overhead.
> >
> > Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
> > ---
> >  kernel/rcu/rcuscale.c | 67 +++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 67 insertions(+)
> >
> > diff --git a/kernel/rcu/rcuscale.c b/kernel/rcu/rcuscale.c
> > index 5659eaebc5c0..6e3e3f296f85 100644
> > --- a/kernel/rcu/rcuscale.c
> > +++ b/kernel/rcu/rcuscale.c
> > @@ -40,6 +40,7 @@
> >  #include <linux/vmalloc.h>
> >  #include <linux/rcupdate_trace.h>
> >  #include <linux/sched/debug.h>
> > +#include <linux/hazptr.h>
> >
> >  #include "rcu.h"
> >
> > @@ -460,6 +461,71 @@ static struct rcu_scale_ops tasks_tracing_ops =3D =
{
> >
> >  #endif // #else // #ifdef CONFIG_TASKS_TRACE_RCU
> >
> > +#if IS_ENABLED(CONFIG_HAZPTR_TORTURE_TEST)
>
> Ah, maybe this is why you want hazptrtorture and rcuscale to be built
> into the same kernel.
>
> But what you really want is hazard pointers to be built in, right?
> As opposed to the torture test?  But this patch will be on top of the
> patches providing unconditional hazard-pointer support in the kernel,
> so you can just omit the above #ifdef.
>
> The reason for the CONFIG_HAZPTR_TORTURE_TEST #ifdef is that it is
> possible to build kernels that do not support Tasks Trace RCU.
>

Hi Paul,

Yes, that guard is what led me to enable hazptrtorture for the
rcuscale runs in patch 26. rcuscale only needs the hazptr core,
which is available unconditionally at this point in the series.

I'll remove the guard and add &hazptr_scale_ops directly to
scale_ops[]. This also removes the need for the torture_type=3Dnone
workaround.

Thanks,
Kunwu

>                                                         Thanx, Paul
>
> > +#define HAZPTR_SCALE_NR_OBJS 8
> > +static int hazptr_scale_obj[HAZPTR_SCALE_NR_OBJS];
> > +static atomic_t hazptr_scale_sync_idx =3D ATOMIC_INIT(0);
> > +
> > +struct hazptr_scale_state {
> > +     struct hazptr_ctx ctx;
> > +     void *addr;
> > +};
> > +static DEFINE_PER_CPU(struct hazptr_scale_state, hazptr_scale_state);
> > +
> > +static int hazptr_scale_read_lock(void)
> > +{
> > +     struct hazptr_scale_state *state =3D this_cpu_ptr(&hazptr_scale_s=
tate);
> > +     int idx =3D smp_processor_id() % HAZPTR_SCALE_NR_OBJS;
> > +     void *ptr =3D &hazptr_scale_obj[idx];
> > +
> > +     state->addr =3D hazptr_acquire(&state->ctx, &ptr);
> > +     return 0;
> > +}
> > +
> > +static void hazptr_scale_read_unlock(int idx)
> > +{
> > +     struct hazptr_scale_state *state =3D this_cpu_ptr(&hazptr_scale_s=
tate);
> > +
> > +     hazptr_release(&state->ctx, state->addr);
> > +}
> > +
> > +static unsigned long hazptr_scale_completed(void)
> > +{
> > +     return 0;
> > +}
> > +
> > +static void hazptr_scale_sync(void)
> > +{
> > +     int idx =3D atomic_fetch_inc(&hazptr_scale_sync_idx) % HAZPTR_SCA=
LE_NR_OBJS;
> > +
> > +     hazptr_synchronize(&hazptr_scale_obj[idx]);
> > +}
> > +
> > +static void hazptr_scale_sync_exp(void)
> > +{
> > +     int idx =3D atomic_fetch_inc(&hazptr_scale_sync_idx) % HAZPTR_SCA=
LE_NR_OBJS;
> > +
> > +     hazptr_synchronize(&hazptr_scale_obj[idx]);
> > +}
> > +
> > +static struct rcu_scale_ops hazptr_scale_ops =3D {
> > +     .ptype          =3D 0,
> > +     .readlock       =3D hazptr_scale_read_lock,
> > +     .readunlock     =3D hazptr_scale_read_unlock,
> > +     .get_gp_seq     =3D hazptr_scale_completed,
> > +     .gp_diff        =3D NULL,
> > +     .exp_completed  =3D hazptr_scale_completed,
> > +     .sync           =3D hazptr_scale_sync,
> > +     .exp_sync       =3D hazptr_scale_sync_exp,
> > +     .name           =3D "hazptr",
> > +};
> > +
> > +#define HAZPTR_SCALE_OPS &hazptr_scale_ops,
> > +#else
> > +#define HAZPTR_SCALE_OPS
> > +#endif
> > +
> >  static unsigned long rcuscale_seq_diff(unsigned long new, unsigned lon=
g old)
> >  {
> >       if (!cur_ops->gp_diff)
> > @@ -1140,6 +1206,7 @@ rcu_scale_init(void)
> >       static struct rcu_scale_ops *scale_ops[] =3D {
> >               &rcu_ops, &srcu_ops, &srcua_ops, &srcud_ops,
> >               TASKS_OPS TASKS_RUDE_OPS TASKS_TRACING_OPS
> > +             HAZPTR_SCALE_OPS
> >       };
> >
> >       if (!torture_init_begin(scale_type, verbose))
> > --
> > 2.43.0
> >
