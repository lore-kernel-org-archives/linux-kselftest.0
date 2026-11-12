Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794499534;
	b=WRdthLneL73RXhgA/RPn60tULWxaYZq9Fjtbaai3DOHUicCilJ1Z6hteWJZBVZ+hdBjZ
	 JG9G9WvHwRNLZCCSOS+1INNoOqdgNzCSkrsyzHs6RBKj/PoqUiC4OeGrO2+KGAhcg2xYG
	 L9vQlr4esjH2oh3mz/qUAbOxasO3GDOn9wRJPkUDm+Zx4pCe6ZC9VwD1zsxwWBKXcyyQB
	 /cU8Gy7DmXz4h2R1O3DniJPI7PUy9XFtsMK6HzUNPRp/l3YlRbg9WeuSLulLWBTl63v6d
	 c2dEUxEW6cKzIjGowoS7VhbDMRJz8SbjhjpgpnvTFzSg4tq8AxaehqmNQ/dqSitRddQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794499534;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Im1WacHSUV4tAGVpgqmNrHFk27h4swfyz0z4hfrjjiM=;
	b=faF2kixmqZ0lhJbzMs73H2e6Gyp+oN3JbQBNRvbQB0U+lNsqvlfcnx910hH4AQrDLN1b
	 hjFJtwTWa7k27r+qBRKpTOG/yhPb/FlMMfOFboQd1PbJWpHNkYyc8hNS4kBj6DghAvqKq
	 qg2z2GCKwPr5zZb0sxwv0C4cmepzMOaaqKGrNJRckX8nCmp9k0Gs4At0/c6BUaFA1SMUl
	 +NqonfQZzMHbOA5qSLF7611prmch9KJo+anZsBlRnx1Wrz8qgl6UHjJYd64tqSokyFPXe
	 RCKJtI/OQQnwAD4yngKDfXScAnZqjIEdnGhO3lkFS/qTxv8zVUktsfU24xmHFvm3Yyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TY3Km2W2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DBE606A32A
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 16:05:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17DBE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TY3Km2W2
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so26575765e9.1
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 08:05:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794499532; cv=none;
        d=google.com; s=arc-20260327;
        b=mwpn51tCCGqjkotR8o6d0JhxeVQj2Bqb1wso7hbloHu3ad7EifUo6Tk8nS2vLyFfUw
         Gr9JxYKDYd50/OeyTAAxGJdOrVFp928y1+6AzuK9aOQ/uwTXex2V/K9DNlsDeUUuiXi4
         N2KoAJqLFYq72F6NoIBa8q0lkmWcQCyC4Y0VfVg9F1FdArnu3oQkvLM+OVAFka5bCfKR
         BUoZgVbqXZLACEHKMyA/Skl0768KsGXZo/ZeGiZIGw8hn+BKRFbRXzrFkUmglI1Ppqdj
         +7ZqyY/hGhvUcFtnKOAS2rWt1hex8FeTgVPvM3iX+q9KHFb7sEDvgJhMdg/im9w3hONw
         KAAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Im1WacHSUV4tAGVpgqmNrHFk27h4swfyz0z4hfrjjiM=;
        fh=sUPG85kVSDStPJ1OdfabmPyC3aezXdBFr37mujKCeKs=;
        b=H6BrP6fvzNNx03sEaGtbrpdFVDSZLgano4hksY28UwroLvQosYMB1JRSXpp6zlV3j7
         iYUQo8xff3+oIjHpjRJy0hKTfUVmzQm/xjuP8uo3tK3prXBvQfeBEoJecvnHLE3++Ou/
         4ZV4+zqQGYajKXPCEe84szK8eDEdVSgyhtxXIviaKpUEm1huOEyFaCxF228N2SmzVHqC
         mlRyzBcmnx8OIhJm2PepafvkC3N6H/NRpDjhQjAFYhhRJnLM1I+/D+KQqRgXX/aLHyQV
         9hAOGiLi5S86lny5Dc9diTab2G7CWTrsmmuHLIYVTKcGkzJ2A3ym+FXRpScTs65Kq2DU
         vgjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794499532; x=1795104332; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Im1WacHSUV4tAGVpgqmNrHFk27h4swfyz0z4hfrjjiM=;
        b=TY3Km2W25/azQ3zti6acRLhwYI4LNSpChmboJAj4won/2PRfYJkSS298uN7jkmEzLd
         sZh0Rb2XB76z+MSJRenuDYozQMSfwA9xZf8V0UKU8W+LbpMGKNPzkhZtL6u5bxl/m1Q6
         xzc0uDhAbfJG7cu47VFGDaotIlQ0rFPfMRIrg6g81ZOTmeFdX4tjcfrHkoR/TfGH/lCa
         /1TatjvkK0q5GsCf9IPGbaDNJeQ17YE4Edo9b0ulJekkTp1ZcFTB9hpCcNxshleKGw5u
         o3CCMDi9Wx3nQKKf43CGKUy6JzgZpCxvbyj+7iGI0JaKnK8jewQGmpPZOYz6qS0K4dFU
         ivoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794499532; x=1795104332;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Im1WacHSUV4tAGVpgqmNrHFk27h4swfyz0z4hfrjjiM=;
        b=L5c8pHXihSDhH1jqEvYUH7oNAeeo3mxUOAZDHtgtSaWcNXJ5Ync46ogBpUI8MOLK7p
         JQ6Jxf//Jnf2AiecbPc36kPxtEhv6AxsqezTg58LE/FtENOfYxTZXbpPRX+x2zMS3qDM
         eIU8l9o8N8HXj+1d5qOaHBmMdNE9gLDmkfm10Gff2WTeXuKirugwy+qkQdnZpOISqdG2
         Pa2uEOqthGKR6fppACdYtIYyal9R+6TCTQwxnKKPjYEsMlidk/sgNaT17gjd+Z5Nr2r8
         1dDRSNr17eODLglJiBj7VV8yrP4IUppShpSPzTNsEgPQHIbyX1K1by8Mc2mNgqFKkbUF
         vryA==
X-Forwarded-Encrypted: i=1; AL+hErHCTCcjDXwgQGGruflEIFyJNeiUvQk1BxmbHNsmTz3JoGvckMItQ0B4EAUjDdPMNfuQwAJ3cwEzIMzuMJIHmtY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hfMI25nLkeC2nwCfxF1WY++NpDm18+l5AlvGn3KXrrhi1az60
	16rlGCcAKs2DSmWg9aOhFN13K3NdHkQCzqN7chYpNedQDzGuZ3BbQqOEoFEzvajbIUerfEpH68Z
	jqLKRCDXr0zCa4oOmg0Er653zmzPLf2w=
X-Gm-Gg: AYBFou0bwEWOJgwtCMZdxIHGZq2mDtC9J83BWKjKuQQxwdKLNk0YYDv4jeZnywgL5Fu
	okO+QGJHMWblJ2/cnIYCTpJbO8lviMQSAM2G16u3JgTIFS2L9uHey14HPOloS1owZGWskfSmSGz
	D2gcLvm/xsNPEXP4fckStE0O2mr5X5VF5I5PyuGII5tE5i9iSsre0jMqXsKacQCHcq+18C/ankR
	NbX1tgB450JFNc4iaA+iydm6u9TcDgKyk4FuP99y+yrsHM7X7nClggNJ4GGIMhpKEzyQLYWHPs/
	hlV0VCqZDLd3lKLGBNpYN2xAS8606txBl66jxPicQyU7BvJY/Db+cerBHX6aqz4zp4Do8hDonLm
	6N9s5LD2EHCDgLodDoT6wPh4x7Qd322Xw7TWge7D/jgJI2pkxkXCKaC95ALey9PQrNq2vGg==
X-Received: by 2002:a05:600c:3144:b0:4a1:a45a:88f with SMTP id
 5b1f17b1804b1-4ba0939ccc5mr113980935e9.20.1794499532112; Thu, 12 Nov 2026
 08:05:32 -0800 (PST)
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
 <20261104165504.2430480-9-kunwu.chan@gmail.com> <3433f88a-027a-4f70-be5b-2c35f9318fd4@paulmck-laptop>
In-Reply-To: <3433f88a-027a-4f70-be5b-2c35f9318fd4@paulmck-laptop>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Fri, 13 Nov 2026 00:05:20 +0800
X-Gm-Features: AclHuK8xdCr_GIOWnwsADKv_-qsCDHnNK6PLsB5r8AjwlSaUjiXIHJvwzGzBDkI
Message-ID: <CAN_Opa_SW3_2uMYudKJcJpeMHaitpvZPnyqxoQTmajx6aW6Q7Q@mail.gmail.com>
Subject: Re: [PATCH 08/28] hazptrtorture: Add slowpath and lockdep scenarios
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

On Wed, Nov 11, 2026 at 5:41=E2=80=AFAM Paul E. McKenney <paulmck@kernel.or=
g> wrote:
>
> On Thu, Nov 05, 2026 at 12:54:26AM +0800, Kunwu Chan wrote:
> > Add SLOWPATH and LOCKDEP configs: SLOWPATH enables
> > CONFIG_HAZPTR_ACQUIRE_FORCE_SLOWPATH for slow-path stress; LOCKDEP
> > combines PROVE_LOCKING with wq_churn=3D1 so each alloc_workqueue/
> > destroy_workqueue pair exercises the lockdep hazptr paths.
> >
> > Suggested-by: Boqun Feng <boqun@kernel.org>
>
> Could the --kconfigs and --bootargs kvm.sh parameters be used here
> as well?  My concern is the proliferation of almost-identical scenario
> files.

Hi Paul,

Agreed. I added the configs to keep the forced-slowpath and
lockdep-churn cases explicit and repeatable. I'll drop the
separate scenario files and retain both as scripted PREEMPT runs
using --kconfig and --bootargs.

The wq_churn workload itself will remain in this patch.

Thanks,
Kunwu

>
>                                                         Thanx, Paul
>
> > Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
> > ---
> >  kernel/rcu/hazptrtorture.c                    | 48 ++++++++++++++++++-
> >  .../rcutorture/configs/hazptr/LOCKDEP         | 16 +++++++
> >  .../rcutorture/configs/hazptr/LOCKDEP.boot    |  1 +
> >  .../rcutorture/configs/hazptr/SLOWPATH        | 16 +++++++
> >  4 files changed, 79 insertions(+), 2 deletions(-)
> >  create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/L=
OCKDEP
> >  create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/L=
OCKDEP.boot
> >  create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/S=
LOWPATH
> >
> > diff --git a/kernel/rcu/hazptrtorture.c b/kernel/rcu/hazptrtorture.c
> > index c8b7c208775b..fe09280d063c 100644
> > --- a/kernel/rcu/hazptrtorture.c
> > +++ b/kernel/rcu/hazptrtorture.c
> > @@ -23,6 +23,7 @@
> >  #include <linux/torture.h>
> >  #include <linux/hazptr.h>
> >  #include <linux/rcupdate.h>
> > +#include <linux/workqueue.h>
> >
> >  #include "rcu.h"
> >
> > @@ -51,6 +52,8 @@ torture_param(int, shutdown_secs, 0, "Shutdown time (=
s), <=3D zero to disable.");
> >  torture_param(int, stat_interval, 60, "Number of seconds between stats=
 printk()s");
> >  torture_param(int, stutter, 5, "Number of seconds to run/halt test");
> >  torture_param(int, verbose, 1, "Enable verbose debugging printk()s");
> > +torture_param(bool, wq_churn, false,
> > +           "Churn workqueues to exercise lockdep dynamic keys");
> >
> >  static char *torture_type =3D "hazptr";
> >  module_param(torture_type, charp, 0444);
> > @@ -62,6 +65,7 @@ static struct task_struct *preempt_task;
> >  static struct task_struct **reader_tasks;
> >  static struct task_struct *do_pending_task;
> >  static struct task_struct *stats_task;
> > +static struct task_struct *wq_churn_task;
> >
> >  #define HAZPTR_TORTURE_PIPE_LEN 10
> >
> > @@ -83,6 +87,7 @@ static atomic_t n_hazptr_torture_alloc;
> >  static atomic_t n_hazptr_torture_alloc_fail;
> >  static atomic_t n_hazptr_torture_free;
> >  static atomic_t n_hazptr_torture_error;
> > +static atomic_t n_hazptr_torture_wq_churn;
> >  static DEFINE_PER_CPU(atomic_long_t, hazptr_torture_acquires);
> >  static DEFINE_PER_CPU(atomic_long_t, hazptr_torture_releases);
> >  static DEFINE_PER_CPU(atomic_long_t, hazptr_torture_acquires_irq);
> > @@ -668,13 +673,14 @@ hazptr_torture_stats_print(void)
> >               atomic_read(&n_hazptr_torture_alloc_fail),
> >               atomic_read(&n_hazptr_torture_free));
> >       torture_onoff_stats();
> > -     pr_cont("acq: %lld rel: %lld acqirq: %lld relirq: %lld reldefer: =
%lld relundefer %lld\n",
> > +     pr_cont("acq: %lld rel: %lld acqirq: %lld relirq: %lld reldefer: =
%lld relundefer %lld wqchurn: %d\n",
> >               torture_sum_pcpu_atomic_long(&hazptr_torture_acquires),
> >               torture_sum_pcpu_atomic_long(&hazptr_torture_releases),
> >               torture_sum_pcpu_atomic_long(&hazptr_torture_acquires_irq=
),
> >               torture_sum_pcpu_atomic_long(&hazptr_torture_releases_irq=
),
> >               torture_sum_pcpu_atomic_long(&hazptr_torture_releases_def=
er),
> > -             torture_sum_pcpu_atomic_long(&hazptr_torture_releases_und=
efer));
> > +             torture_sum_pcpu_atomic_long(&hazptr_torture_releases_und=
efer),
> > +             atomic_read(&n_hazptr_torture_wq_churn));
> >
> >       pr_alert("%s%s ", torture_type, TORTURE_FLAG);
> >       if (i > 1) {
> > @@ -788,6 +794,38 @@ static int hazptr_torture_preempt(void *unused)
> >       return 0;
> >  }
> >
> > +static void hazptr_torture_wq_churn_fn(struct work_struct *work)
> > +{
> > +}
> > +
> > +/*
> > + * Repeatedly create and destroy workqueues.  Each workqueue creation
> > + * registers a lockdep dynamic key and each destruction unregisters it=
,
> > + * which exercises both is_dynamic_key() and lockdep_unregister_key().
> > + */
> > +static int hazptr_torture_wq_churn(void *unused)
> > +{
> > +     VERBOSE_TOROUT_STRING("hazptr_torture_wq_churn task started");
> > +     do {
> > +             struct workqueue_struct *wq;
> > +             struct work_struct churn_work;
> > +
> > +             wq =3D alloc_workqueue("hazptr-torture-churn", WQ_PERCPU,=
 1);
> > +             if (!wq) {
> > +                     torture_hrtimeout_ms(10, 10, NULL);
> > +                     continue;
> > +             }
> > +             INIT_WORK(&churn_work, hazptr_torture_wq_churn_fn);
> > +             queue_work(wq, &churn_work);
> > +             flush_work(&churn_work);
> > +             destroy_workqueue(wq);
> > +             atomic_inc(&n_hazptr_torture_wq_churn);
> > +             stutter_wait("hazptr_torture_wq_churn");
> > +     } while (!torture_must_stop());
> > +     torture_kthread_stopping("hazptr_torture_wq_churn");
> > +     return 0;
> > +}
> > +
> >  static void
> >  hazptr_torture_cleanup(void)
> >  {
> > @@ -880,6 +918,7 @@ static int __init hazptr_torture_init(void)
> >       atomic_set(&n_hazptr_torture_alloc_fail, 0);
> >       atomic_set(&n_hazptr_torture_free, 0);
> >       atomic_set(&n_hazptr_torture_error, 0);
> > +     atomic_set(&n_hazptr_torture_wq_churn, 0);
> >       for (i =3D 0; i < HAZPTR_TORTURE_PIPE_LEN + 1; i++)
> >               atomic_set(&hazptr_torture_wcount[i], 0);
> >       for_each_possible_cpu(cpu) {
> > @@ -960,6 +999,11 @@ static int __init hazptr_torture_init(void)
> >               if (torture_init_error(firsterr))
> >                       goto unwind;
> >       }
> > +     if (wq_churn) {
> > +             firsterr =3D torture_create_kthread(hazptr_torture_wq_chu=
rn, NULL, wq_churn_task);
> > +             if (torture_init_error(firsterr))
> > +                     goto unwind;
> > +     }
> >
> >       torture_init_end();
> >       return 0;
> > diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/LOCKDEP =
b/tools/testing/selftests/rcutorture/configs/hazptr/LOCKDEP
> > new file mode 100644
> > index 000000000000..f0ff29925a54
> > --- /dev/null
> > +++ b/tools/testing/selftests/rcutorture/configs/hazptr/LOCKDEP
> > @@ -0,0 +1,16 @@
> > +CONFIG_SMP=3Dy
> > +CONFIG_NR_CPUS=3D16
> > +CONFIG_PREEMPT_NONE=3Dn
> > +CONFIG_PREEMPT_VOLUNTARY=3Dn
> > +CONFIG_PREEMPT=3Dy
> > +CONFIG_HZ_PERIODIC=3Dn
> > +CONFIG_NO_HZ_IDLE=3Dy
> > +CONFIG_NO_HZ_FULL=3Dn
> > +CONFIG_HOTPLUG_CPU=3Dy
> > +CONFIG_SUSPEND=3Dn
> > +CONFIG_HIBERNATION=3Dn
> > +CONFIG_DEBUG_LOCK_ALLOC=3Dy
> > +CONFIG_PROVE_LOCKING=3Dy
> > +CONFIG_DEBUG_OBJECTS_RCU_HEAD=3Dn
> > +CONFIG_DEBUG_KERNEL=3Dy
> > +CONFIG_HAZPTR_DEBUG=3Dy
> > diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/LOCKDEP.=
boot b/tools/testing/selftests/rcutorture/configs/hazptr/LOCKDEP.boot
> > new file mode 100644
> > index 000000000000..7b16720214bd
> > --- /dev/null
> > +++ b/tools/testing/selftests/rcutorture/configs/hazptr/LOCKDEP.boot
> > @@ -0,0 +1 @@
> > +hazptrtorture.wq_churn=3D1
> > diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/SLOWPATH=
 b/tools/testing/selftests/rcutorture/configs/hazptr/SLOWPATH
> > new file mode 100644
> > index 000000000000..4d13028ca84c
> > --- /dev/null
> > +++ b/tools/testing/selftests/rcutorture/configs/hazptr/SLOWPATH
> > @@ -0,0 +1,16 @@
> > +CONFIG_SMP=3Dy
> > +CONFIG_NR_CPUS=3D16
> > +CONFIG_PREEMPT_NONE=3Dn
> > +CONFIG_PREEMPT_VOLUNTARY=3Dn
> > +CONFIG_PREEMPT=3Dy
> > +CONFIG_HZ_PERIODIC=3Dn
> > +CONFIG_NO_HZ_IDLE=3Dy
> > +CONFIG_NO_HZ_FULL=3Dn
> > +CONFIG_HOTPLUG_CPU=3Dy
> > +CONFIG_SUSPEND=3Dn
> > +CONFIG_HIBERNATION=3Dn
> > +CONFIG_PROVE_LOCKING=3Dn
> > +CONFIG_DEBUG_OBJECTS_RCU_HEAD=3Dn
> > +CONFIG_DEBUG_KERNEL=3Dy
> > +CONFIG_HAZPTR_DEBUG=3Dy
> > +CONFIG_HAZPTR_ACQUIRE_FORCE_SLOWPATH=3Dy
> > --
> > 2.43.0
> >
