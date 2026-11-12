Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794496999;
	b=pX7+UGotAqe5LX4pEolKlJDKlIr5GD8jP9RptoeAIuo6oli1qIyHHKSyUJ6OqSFk56uI
	 zBme7ZOuoPaPS6/cy5zz5FUf1nGiQIipCjHgAULovBJZ/bS5pdeoYRfKZEo0iaLyk1D9t
	 TKyRoTLbj8C/gKoKaC9vBCfWU1E2wQTcgJvYvSqOgopczcYTGsNKPNJ0GDxu20mOSSJGS
	 +8njrZMrYwwXa/L4uE7p2Kx92KuJtuKHVqXmBitOPBwslYFFu6gXScXmxp56+n9vYrUuV
	 dUtOa9oRA3CL3cRU7C6Lt6UFPXh/j1OkkPW0W60RrTIlXIwj8+FpcUtN8ECU78FSH0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794496999;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/gWf9tRn8xdRTedV8zLP5Bk/WzXXZIsEniM+eU5R+pI=;
	b=uj6B+zEd1hHimoymVZA5wos1AXxPEWBZJM7v3BGt7eL16RCKpavV3VdYLz61PAvAj18a
	 A7egyzsvYwo/lnCgndD+ECD1TcjxyiuGD88MXJWR84ZK48XWdes+l+pJtCXwm9ypnocKq
	 +XhLaBbGdT7vcdOliZSnTFJ32cl8tlx/6FrzpPQr/Q1j2LLljKJ1D0QjfdtCO51i+GR3s
	 nbuXdd0rGhTS3dLXVMSOZLZCPICYQZA2jVPe8WQfXDW8Xg6K5VM1wmiU1hJsEhAgHEKwB
	 BSR5shj5S4gpoUkLotFLgWTztx8poSVccG27atCRF10u1QN7PPpeWLgQsXmU1TJ6HUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xdHySA5y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96C260A382F
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 15:23:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D96C260A382F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xdHySA5y
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a208d93758so47159925e9.3
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 07:23:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794496997; cv=none;
        d=google.com; s=arc-20260327;
        b=c/wBxi9WnhmgYytMgb+m4ISvgy4oNuf/TGVTJoW8mZ2amx1MewqnKL41ULdxRwj4X+
         +kRF1cXW73kzHl+4rRfMt9gcZUbZ4Zk7PDrd3os09yhf5hvhdKtRgChaJgxToJY9KF3d
         JxDQuQM0TLkH+Q+HB+yt0I0ZG2CQxvow1U9bcMJr3URRX8hZkQophVG1niMXD6U94hYs
         5zNLvNe2CwwYqXBoA85sKnwv5N5Fu8ZdXhgJuc8M/aAAotooa9wxjHCeFI/d+V5EHX2Z
         57VE6G6Bx5w3C+cpVCD7VHkQ+oJ0G+9jvFiir+IzCKGjy/U7ov/V5zhU6B9zjra9LKoF
         j0IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/gWf9tRn8xdRTedV8zLP5Bk/WzXXZIsEniM+eU5R+pI=;
        fh=quSB0iYBrIFdND2HsHzhtpguhaRjlZUAufwF+TkXZl0=;
        b=ILKGYg/dMnX6XZEX3UhYxeoMO5hyt+C9VYCS0mMqLtcGJ3exiqy5taeh/x+OlvEkmB
         6v4umdaIS/LVsCOgRDNcsCXZr35mDA+mE6iwY+H4hBHfI/RKO5nMjNqrBsP7Gp87S7ba
         monKe0zGZao8lV22d2S8YiqWD24FGEVctuIBhAsVO55pxvcRWEE5nNbwKcA3Xz8JysVT
         3karlxUlPBTuzSZ7S6tUVi2Pv4zi4doomaUkTNDNA24ICm1ngjgpFRmYHG4W2nPs4BSK
         NKl4Zn3okVkYuo3jGtyZK6PgI90GaeOTDdI3i8OEtzAFdbZnk69gg+vLzjy+9XkjwgJP
         2XnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794496997; x=1795101797; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/gWf9tRn8xdRTedV8zLP5Bk/WzXXZIsEniM+eU5R+pI=;
        b=xdHySA5yJr8R3v1bJTdVJvaIGdetLFfLzfjuM+o7syK/yGeAzwWzFMxbWd/Ct+6rMK
         MVANAOQwCJNG35jAUcUyz4qb96VvSdxfmtWqtOhL07JUGI5YDqKmQrWanxsYe0RUh4zA
         h/f/rDCpmTn4mbz57neFPhvuuBN/Tq6CJYzLaR1BKKzGinJoy41is6MxKy1i9f9xSrkJ
         Eh+N8FqElCwLLQdbDMED3VH/oMYEJIZfp3JDX38AozVHqv61qQEQ8tJnfedJbuyUQKf3
         2G72UmsyJWQGEErAwHvQG+tY7G0eeC/0puJ2E95E1nXfJyAsX9FNegJ6m2ZoHeIHGgXM
         AMVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794496997; x=1795101797;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/gWf9tRn8xdRTedV8zLP5Bk/WzXXZIsEniM+eU5R+pI=;
        b=sF/zKTqpUw32Xc6y1QjISa2lE2FYQy28RsADaVMZXQry+bFuIfnMIusZCMwKjcJ48Z
         BPE/l7loj2lRAtLxEvFdNe4zsVj/+EmcV9+e1Bwjlx8VwyK5SoKIkxffpMlRBw7ctk+D
         nnPk1moLNN6iVIKQBRVqfdbfpTevDDwcxupADMLrAKCKnW7/+fFaWy4Z0DJpIO2nEntr
         9+Wgj/C0+gegoA/Jy7HStj15ZTJoiCXRpaizVTmgsOyxdXOWqTxpaokfO/MSB9irHTe3
         586E7JMIcH8Hx2pSXBPm1yiSvVIchhtbH7lltO3f0ePVRPvznUtsxMhUNH2yyuo0IrRA
         0Rbw==
X-Forwarded-Encrypted: i=1; AL+hErFA12x/IstmFxKwaRlkjCwiOgol6fCplZ5im4aSkkNS0WJKmigfk6T53xuE16PX1QOFlWuMcsxeIaeYqdl7w88=@vger.kernel.org
X-Gm-Message-State: APuU4Z+b8Co7FCCXZQYOXoijgL6FVLrQn0Ei5yNClB1+ne/sI2hce4Dg
	QJJWBtJMZw3HOEdlFm1RQl8TDxJXFe5LqRciMeQRjapMzV2AcOsB0lS+WPqpgm6el5at/3OO3dY
	D0oAMtEO7plPsrRKw370PKgFoZMVhMkQ=
X-Gm-Gg: AYBFou2cuDombEwcOg5gzemVDpINbXr7AXm9iZd6nl9z8ItbsgpRIG31ASqXaLpjwHy
	HtMlM+iJ+8vguXeoQd1Q5zuejJLlWd17+5ZWeS0pqnqRPneVfGbM3Te9zA5Gfo1VbDNAZEuMWDz
	fTxB6R41XW0Rk7RjUaaXeo3H6OGsAW11Tf2XunnFbq/7tbdeQZ0Q+j02k/+Zrig3HHKds+RUDdr
	bR4s/N61Qb8i4MSYw4XA4qIv5G/hfemlg3UHraV2MtHEXXY6e0uSCIrzHRpLwHCG59CiaBuTuOW
	OXHIZ1PnehSdpMDwIuuNc+h0y4b2UpKo7LcM5tl51ii5ESDER9DM7L/tUj3WRUPLLkpjwDXPkMW
	vMbwLX5s4M+XEsAQyjOHJmENizirr9M12b+ZUEliOHOKwkioMcEQ/OWfv3Xg2ntJ3u7zA6f9VLN
	9FIg22YyNS1kX9Ok5v
X-Received: by 2002:a05:600c:1986:b0:4a1:f7f4:7ced with SMTP id
 5b1f17b1804b1-4ba0937a886mr110753845e9.17.1794496996738; Thu, 12 Nov 2026
 07:23:16 -0800 (PST)
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
 <20261104165504.2430480-27-kunwu.chan@gmail.com> <444c9bb1-fccc-44ff-8bcb-a04dd36eeecb@paulmck-laptop>
In-Reply-To: <444c9bb1-fccc-44ff-8bcb-a04dd36eeecb@paulmck-laptop>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Thu, 12 Nov 2026 23:23:05 +0800
X-Gm-Features: AclHuK-Vxw-TWlfdg2rnJncie6E1-Z5rOKezLCml8xvtMgG1OEVJSy5iWLiq3yg
Message-ID: <CAN_Opa8-macEL323Tw3JUai3ETmq0CCt93ddCZ+Xqd1RF1Q5nA@mail.gmail.com>
Subject: Re: [PATCH 26/28] hazptrtorture: Add torture_type=none clean skip for
 rcuscale coexistence
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

On Wed, Nov 11, 2026 at 5:31=E2=80=AFAM Paul E. McKenney <paulmck@kernel.or=
g> wrote:
>
> On Thu, Nov 05, 2026 at 12:54:44AM +0800, Kunwu Chan wrote:
> > When both HAZPTR_TORTURE_TEST and RCU_SCALE_TEST are built into
> > the same kernel, hazptrtorture calls torture_init_begin() first
> > and rcuscale fails with -EBUSY.  torture_type=3Dnone makes
> > hazptrtorture return early without registering, allowing the
> > rcuscale hazptr scale type to run in the same boot.
> >
> > Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
>

 Thanks Paul for the detailed reply.

> You are only supposed to build one of them into the kernel at a time,
> so the intent of the torture_init_begin() failure paths is to enforce
> this rule.  If you want to run both in the same kernel, the way to do
> that is to build both as kernel modules, then do modprobe and then rmmod
> of the first one, followed by modprobe and rmmod of the second one.
>
> So please help me out here.  Why do we need to allow both rcuscale and
> hazptrtorture to be built into the same kernel?
>

You're right. I had incorrectly made rcuscale's hazptr scale ops
depend on CONFIG_HAZPTR_TORTURE_TEST.
That led me to enable both tests in the same kernel and add
torture_type=3Dnone to keep hazptrtorture from registering.

> If your desire is simply better handling of an error condition, an
> alternative is to force either a Kconfig or build failure when more than
> one of the modules invoking torture_init_begin() is built into the same
> kernel at the same time.
>

The hazptr core is available independently, so that dependency is
unnecessary. I'll remove the guard from patch 23, leave
HAZPTR_TORTURE_TEST disabled in the rcuscale configuration, and
drop the torture_type=3Dnone workaround.

Thanks,
Kunwu

>                                                         Thanx, Paul
>
> > ---
> >  .../selftests/rcutorture/configs/rcuscale/HAZPTR    | 13 +++++++++++++
> >  .../rcutorture/configs/rcuscale/HAZPTR.boot         |  1 +
> >  2 files changed, 14 insertions(+)
> >  create mode 100644 tools/testing/selftests/rcutorture/configs/rcuscale=
/HAZPTR
> >  create mode 100644 tools/testing/selftests/rcutorture/configs/rcuscale=
/HAZPTR.boot
> >
> > diff --git a/tools/testing/selftests/rcutorture/configs/rcuscale/HAZPTR=
 b/tools/testing/selftests/rcutorture/configs/rcuscale/HAZPTR
> > new file mode 100644
> > index 000000000000..c5e9cf0184ae
> > --- /dev/null
> > +++ b/tools/testing/selftests/rcutorture/configs/rcuscale/HAZPTR
> > @@ -0,0 +1,13 @@
> > +CONFIG_SMP=3Dy
> > +CONFIG_NR_CPUS=3D128
> > +CONFIG_PREEMPT=3Dy
> > +CONFIG_HZ_PERIODIC=3Dn
> > +CONFIG_NO_HZ_IDLE=3Dy
> > +CONFIG_HOTPLUG_CPU=3Dy
> > +CONFIG_DEBUG_KERNEL=3Dy
> > +CONFIG_HAZPTR_TORTURE_TEST=3Dy
> > +CONFIG_HAZPTR_DEBUG=3Dy
> > +CONFIG_HAZPTR_STALL_DETECTOR=3Dy
> > +CONFIG_HAZPTR_STALL_TIMEOUT=3D1000
> > +CONFIG_HAZPTR_DRAIN_ASSIST=3Dy
> > +CONFIG_RCU_SCALE_TEST=3Dy
> > diff --git a/tools/testing/selftests/rcutorture/configs/rcuscale/HAZPTR=
.boot b/tools/testing/selftests/rcutorture/configs/rcuscale/HAZPTR.boot
> > new file mode 100644
> > index 000000000000..e9cca4cf453b
> > --- /dev/null
> > +++ b/tools/testing/selftests/rcutorture/configs/rcuscale/HAZPTR.boot
> > @@ -0,0 +1 @@
> > +hazptrtorture.torture_type=3Dnone
> > --
> > 2.43.0
> >
