Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794499284;
	b=llAqqzQ6kjyk4Yn6xg6jHWsoMKRZirZrvm8UJyxgbGs3Tb7Fa2J7edD/hLxbCx2bgxc6
	 /HGvwQseAdqnLpZQHo4lQ9d2ZTy20BLkmkuwa/fQsrFHZiS8fDnKv9MLtaT+825LltdRh
	 7gGrPhvRi96KY+uqkem57nD5Qv63ZFJ/GKlsETIOi9ylGqzgxtCiMo0KPTRMZMjVGQDS/
	 4KRcaTtUmr6RNSHkRhMek9SUpDE9bCrVLscd8e+XOPxYvPBpEcWjFjzPOkXSYz4oZR4e8
	 scoxJdkApQMV0MUPtJQcylG5nueHSPCDgv5tNiaJubr8gxiOdhSw1gFGplV/ugtoELQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794499284;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=K30WU9LcDm9KOHnUzmPG5F9Q3grxCVKpIQuAPTV3Oio=;
	b=ryzZx2jAaDcGnw5RNF2Y9ncGrbeJZiiMzFBjkoAfEt/eu7b/Bo7PHwd5L1+ds0rs55G1
	 9gfDxfty2BiltchFSM+37L2xvDtRLZ8Je7JNWSe7kUQLzWNOQhzXyJEIZRxm0E5ihoPfS
	 a6Cf5MIYw1W0O5ytDiZYLzWAE+T0NYbM9JKBWtiPzNA6BgTuHWy6p5JvdPumfJgGVuOrm
	 TQRVF5BsFgYWEwJNhjXQNk1VZy5lIolSNV11KfZWBG0pF3beyXM/p9o7ihmljLG3IwED3
	 RMnF5ZFSjH9CJYKrQ843KcGfN+E7T7k2FgIZaPdsmlH4TjF07amirQ2I+jMWHQC+Mqw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=asQ6Kkgb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28145606A32A
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 16:01:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28145606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=asQ6Kkgb
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so47074695e9.2
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 08:01:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794499283; cv=none;
        d=google.com; s=arc-20260327;
        b=DhuV51r2bNBbjb7w77un1OU9uHmmCwYfxWNGpkNrABMt1c+6fTPAz+KX7LAI/CpiEt
         Nu/2cST+ba1fNA8r+8tOTVkE6xnJttaxxwwEwD2cq/taCPYUkGZnil6DSFk1vncVkj0Q
         DUSydnLLcVr6Ln6bD8qJUmgoFfd0Piv+++cH3dpiI5CK1+tp8HV/LaWimyPItkOAmbg9
         zRvy/QwHOg9hRsosHdDzinoZt1bgCzCltaLE/nQ+ZDGYM8vVFwn2CedvvDRPd87GTRWe
         qnWAdyHS+q3lPH/sCnGKnEV7LvUqXi0ctMe486aV3ZRcLD3fDR2VHUobGUyy6HTO2af6
         3M9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K30WU9LcDm9KOHnUzmPG5F9Q3grxCVKpIQuAPTV3Oio=;
        fh=eoCTrw8PpQHsezTka3DGsCFg1qOJRRrvKaiBgtFn+Rg=;
        b=rt6CFVX6GRAvIe0XtxlY8DkQFgbbGn4rLqsni9ohMIZicBKKOChdbEw3pBGqwIvqnK
         XsJGZUnHvDRnb8o4Rt8mJsr5vZ/t6q41fEA7CXkOvcUR8raXOZYOA3wUh7GbafzI/S7z
         kTGP6K2Xo0D7MoO2l3QnNn/7cNtg0PFyy44scoCxTvmzHwWh+C0XuRJzkFKp8zeR9thL
         GmzxlzlhHFNGcPMQJBHFGNz2i0fbr49zzVDALWR+oqeilsh7wxfAELsJ8T9WittvSnfu
         9YF5gH1FazHj6i1AnEyb0Y0k20m5AClHsqc68bySkwBGpPxGIGiZ3XZH2iyVg16mJhDm
         Q/wQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794499282; x=1795104082; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K30WU9LcDm9KOHnUzmPG5F9Q3grxCVKpIQuAPTV3Oio=;
        b=asQ6KkgboxQr2Mix4uFXV97OZ4yQDaOEh9XXJvisPx2EPGhn5J8mcUoEZGV1Qeagb0
         Ai7PxqX8tEH8mdpe/wwT65dwo+YA6B9kehSmgtkDDpS13Hr62CAOHX7C5QdKM+IGnSfI
         QkCMfS34Um5jNw5/L/5hM0f9cN8RySssd5TviZczWCdI7osE4Z8oZQAb9qD794opBVCq
         gpAzdC2ceN0QkqGe+vB6SzZyXV84S/smCWXulY4TtzR5YGtNMSBL48Is2CzXKFW2QfGf
         6O0jxlFZn87zP3M5OnX6S5Pxeu/cFTk/Et89FxtMSHEkDVN1+uecNnARomY1gctIsF1O
         qqgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794499282; x=1795104082;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K30WU9LcDm9KOHnUzmPG5F9Q3grxCVKpIQuAPTV3Oio=;
        b=xlzJHfOS0+3tvsWpqxtoROH30mUH2Sth718n+Xjt/LYhkElbEa59Ml7VAjCcsEdXvZ
         qaaesqFTM14iixODnfmfLzoJVpH5aHJ2iUws1sQvlMcZT1b4yBlpj0oZ2GVtJV1IDPlp
         BkXvmmDQIQwqUa+mvIJOYsrBNjFZjfkrL6PFc4TdKtvM8GLJ48hJg0H+J/YkJrFsjUXg
         9hNDz6zZZ4Gtbomjm7Qbwx+9BsRF0r4cTpsTI9Lo+WdZ+7oZ2n74/9NnMcdT+W6f4hLq
         IyMn6f7UHo8xmeKeOouNT4y440n21PohnTfQWL6He3xx9LRM4l0nPHQzYhhGlg5LIcyQ
         xk1g==
X-Forwarded-Encrypted: i=1; AL+hErGZODYE1q7teMbL6EUS6XQm+U605Oxj9q1B5D7tiUAeBu/Zwb/57Nfp0+SsMDcmj2tbkh3Wq5N5QfUzrZCTkMI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/y7tVTPj6XSjJc24OIDuPTLoK0OEhPSeXcZmNFm17AkfxaSjJR
	ri0GpzYf1Ne7DDGslX1AyLRFBkCpfKdX8pZD0ccHhzQSvqhyusZ+HdE+/MSmgV8EhT2eAI8QPpL
	uc9s25NTKwK7DzUiXLQaXx4lrzHpXAa8=
X-Gm-Gg: AYBFou31s0QC/ocX2QnE12fQdVFl74nvb/eLrM4qcbsrn+jMB2STyj3TofCR3cInDTe
	A26e/yG0ZyOXe4w5R5WPKX2zYJr5qJMAd5qbsfp61Mn+ZOUhy017uiTZHZey5SHh+aCNnR6eljF
	P57jNCim5amCR+lV6KezSYSnjcCDyFWX24prZl+zLbRe4arRc9McTTqEuxnDvO7yj9oDRjqnd9c
	yBHO9EUjnqIMvtrzgzRGRc8RdO8E0xtSKV12ShD/+y450VXiBTiBe3on4ZR7IW1KXKha6TWZyUb
	0IUAOvvOP5ylSifV2EV+E4GTuT76RQBHCPNmFPkUkJ2i1BsxVbtwUS8bcrwiueFiOLaoa6d/ad7
	92TWuqdG9eOIRzdnN+v6yqtif9L0336wKG2l41dJ8pKShhdKxwL9azmBSwOkbnVnGOI+oXw==
X-Received: by 2002:a05:600c:1d29:b0:4a6:42cc:bf65 with SMTP id
 5b1f17b1804b1-4ba0938182bmr115084735e9.17.1794499282029; Thu, 12 Nov 2026
 08:01:22 -0800 (PST)
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
 <20261104165504.2430480-10-kunwu.chan@gmail.com> <381033ae-d65e-44de-bbe7-69f707405f40@paulmck-laptop>
In-Reply-To: <381033ae-d65e-44de-bbe7-69f707405f40@paulmck-laptop>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Fri, 13 Nov 2026 00:01:10 +0800
X-Gm-Features: AclHuK_r0z0qzRgTWpnMwVZyYzYAfYE6f8hG1Sg9QutknQhxmorMBRwJwam3dq4
Message-ID: <CAN_Opa9F9prFRqta5KwCHoQHrmsOEB4_m2tst0+0VY+fh5o2cg@mail.gmail.com>
Subject: Re: [PATCH 09/28] hazptrtorture: Add READERS4 and READERS0 torture configs
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

On Wed, Nov 11, 2026 at 5:37=E2=80=AFAM Paul E. McKenney <paulmck@kernel.or=
g> wrote:
>
> On Thu, Nov 05, 2026 at 12:54:27AM +0800, Kunwu Chan wrote:
> > Add READERS4 and READERS0 configs to cover reader-active and
> > reader-free synchronize paths.
> >
> > Both use the PREEMPT baseline and hazptr-stack torture type,
> > with four readers for READERS4 and no readers for READERS0.
> >
> > Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
>
> For these, why not just add '--bootargs "hazptrtorture.nreaders=3D0"'
> to the kvm.sh command line, for example in torture.sh?  Ditto for the
> four-readers case.
>
Hi Paul,

Agreed. I wanted to keep the zero- and four-reader cases as
explicit, repeatable tests. I'll drop the separate configs and
retain them as scripted PREEMPT runs, passing nreaders=3D0 or 4
and torture_type=3Dhazptr-stack through --bootargs.

Thanks,
Kunwu

>                                                         Thanx, Paul
>
> > Acked-by: Bradley Morgan <brads@mainlining.org>
> > ---
> >  .../selftests/rcutorture/configs/hazptr/READERS0 | 16 ++++++++++++++++
> >  .../rcutorture/configs/hazptr/READERS0.boot      |  2 ++
> >  .../selftests/rcutorture/configs/hazptr/READERS4 | 16 ++++++++++++++++
> >  .../rcutorture/configs/hazptr/READERS4.boot      |  2 ++
> >  4 files changed, 36 insertions(+)
> >  create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/R=
EADERS0
> >  create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/R=
EADERS0.boot
> >  create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/R=
EADERS4
> >  create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/R=
EADERS4.boot
> >
> > diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/READERS0=
 b/tools/testing/selftests/rcutorture/configs/hazptr/READERS0
> > new file mode 100644
> > index 000000000000..c5b12f3bef74
> > --- /dev/null
> > +++ b/tools/testing/selftests/rcutorture/configs/hazptr/READERS0
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
> > +CONFIG_DEBUG_LOCK_ALLOC=3Dn
> > +CONFIG_PROVE_LOCKING=3Dn
> > +CONFIG_DEBUG_OBJECTS_RCU_HEAD=3Dn
> > +CONFIG_DEBUG_KERNEL=3Dy
> > +CONFIG_HAZPTR_DEBUG=3Dy
> > diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/READERS0=
.boot b/tools/testing/selftests/rcutorture/configs/hazptr/READERS0.boot
> > new file mode 100644
> > index 000000000000..f5564c218902
> > --- /dev/null
> > +++ b/tools/testing/selftests/rcutorture/configs/hazptr/READERS0.boot
> > @@ -0,0 +1,2 @@
> > +hazptrtorture.nreaders=3D0
> > +hazptrtorture.torture_type=3Dhazptr-stack
> > diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/READERS4=
 b/tools/testing/selftests/rcutorture/configs/hazptr/READERS4
> > new file mode 100644
> > index 000000000000..c5b12f3bef74
> > --- /dev/null
> > +++ b/tools/testing/selftests/rcutorture/configs/hazptr/READERS4
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
> > +CONFIG_DEBUG_LOCK_ALLOC=3Dn
> > +CONFIG_PROVE_LOCKING=3Dn
> > +CONFIG_DEBUG_OBJECTS_RCU_HEAD=3Dn
> > +CONFIG_DEBUG_KERNEL=3Dy
> > +CONFIG_HAZPTR_DEBUG=3Dy
> > diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/READERS4=
.boot b/tools/testing/selftests/rcutorture/configs/hazptr/READERS4.boot
> > new file mode 100644
> > index 000000000000..0d0df3f7dca4
> > --- /dev/null
> > +++ b/tools/testing/selftests/rcutorture/configs/hazptr/READERS4.boot
> > @@ -0,0 +1,2 @@
> > +hazptrtorture.nreaders=3D4
> > +hazptrtorture.torture_type=3Dhazptr-stack
> > --
> > 2.43.0
> >
