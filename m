Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794501749;
	b=T1HJavLCFz0OmuHsEcD3/f7E3XToQ3urpaVI6Z0rx7wzHGExwWtSEvjsIqBjUv+gwSIK
	 nAx5AMpFE46vKETSFsIhRr8IJQTm734NmF4D7yu2r2rjnamplY7SIXhEjuE/QhOWkVkEc
	 WDHoUulV7c0UMFG2PK3dp0Z17dOUg1oXo+EJx2zOZewOwNyY8TKJ4hEWRlZB+dL+07Qy8
	 XNboqTuklX/a8+RsQOdwMzQ4cEM6CXYoaisUnccmZ4HrX/VMP1SbMsR/uUKrt02ozPZZA
	 +H+56VfFLS6B2UaypbZr7RwIfisESVH5794Y0/4C86KavhOSfHuDM94g5/XsxYR/iAw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vb58UL1JBDT0YchS0QVq3Od5hTwaDV5G0mFqoEfJZkE=;
	b=Ex6/pv4cTg6JrncoEAZjqlWWy3DdE0NfZ5J7O7nE9vlCVu3Tl58iANcnB8PxldZ9eU6x
	 n0/Vmmz3Osakj+wem3KTIKTNN96MdvCDb30TFpXDk6pqrPvcsmAHCnaaeF+tcKixm8Q0G
	 DlBeIiIsQbXmFAgwklExiJgE/OVEYTOV4gTIVIzgPoHHl0QxbOWsXdyig9fLZ70J8fnq4
	 G3fcVAPUgaNVY30KLU4/Xv33Z3SH/jccm6vx/mFaJfv6CqU8IaQzYp5Ll662w82xCc5E1
	 q49oFV95QWS8Ovnrh2ybJeqV5/cwwEmFcqu4OoyQC6F2mp7OLRDdd+XIdhi2Sg6bRhg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=etvsK4IG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61A8606A32D
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 16:42:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D61A8606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=etvsK4IG
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so2982861f8f.2
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 08:42:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794501747; cv=none;
        d=google.com; s=arc-20260327;
        b=KU17oCb0EAw2M1eXwI6GHHFFgdy1ixKugcMhBelM+d1k/OEWOOVtEzHfh3HxPrRgCP
         gAV+lGSC0sDOG7bgUyuSt63VmqC/0pAe/6pns9Qv4/NNSjnGl0xA2dujTnw1WJljFKxf
         8ikH5I9h8BAPfnc2XPW7SJzS1jrFlB+FcBzHin1VeYDbi0mYN6lZJ4+JqjytWg3oNuhJ
         xsvXMgSaIYP2oXgnZW8dpBA51X0iWwtj/ssrDGLaNuv+poTG5gMIR2JoXJ/Vpq4G1q0E
         7qMReenz1gFbZc3u+umsNG3VGHFLWWK/Wcp45Ua2dM10017QxFVQcXj6reEy4kNt1eiD
         yxpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vb58UL1JBDT0YchS0QVq3Od5hTwaDV5G0mFqoEfJZkE=;
        fh=hzFFq/o1YTw2afVVtPY5IWhm37hTtXwdW9TDhHh9dTk=;
        b=YDCoJQTV8qDQfKH72CbqiJjjS5otJ+680WszsylPXEHPuPsSHdDh850Tjawj0YldWJ
         +xalLQBLeIjYpSYJtDXhQA3nCR1kVhBs/Sg+PyZnsng6y97HP0sZ9wo0yelqQrMQrr55
         FLoX7xTO3OPEDEFgmJ9IpKh5US272hmgj+eOEI0O2di2ARddJbsdCNgCvcD4nNV+Xpmp
         Ht7s58gd8q+B2+Nvxi7DEMtrbctZljUbmjCo2BgcmaoGB9M4wU1GvscvRtXhcykRlDkM
         ZchsCk4qqZGg7NckXuaC/4/+D83t8192k8uSKv1Rj8rr5Q4958Mu+QFHBYEsicyNZF/d
         PC2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794501747; x=1795106547; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vb58UL1JBDT0YchS0QVq3Od5hTwaDV5G0mFqoEfJZkE=;
        b=etvsK4IGKtC1tmmWAGvlMBJDCobivzoekXoqFKuVsVWyGu8lShV/ecQ/M5I17JaUlL
         GIgJYMp8UmzWyFSoNcGMefWzA368T6y84Dl1UkNYt0uoWQZgdBdZG/Aiwpc7CVTIhAF/
         0JQFaTCfa2V+RNlaKbkn7+i4NAyorYBX8ybqJH3XjzPN9VMak9jeuoTXVavcz/TXTb21
         FaF8VhxNqyxbBZju9qp2Ln/N+5T7gJZ/RicqGc8poLGUIGAlMT1edOhRdpffMJ38j6/6
         qtsYNESSzPCd2ar5kLu/sN0j0+3cPO20UPb5V2eBQ/lZWth2IIrqyP4VOjINWfuUb+5N
         qDBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794501747; x=1795106547;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vb58UL1JBDT0YchS0QVq3Od5hTwaDV5G0mFqoEfJZkE=;
        b=mUrO49KbMqpeZ66sZkDIHH63K2zEeKa/k9yg7oo6UYYZZAlCW85+kKUT+bc3bapEkV
         R1DxulOKfwuST4+kZK4qghcRf7ZOS5JP9C7/5DQdV8MBByOrYAorEjSTYejVai4ws7jB
         kFoNIXPw5PytrHAbSTTzz4OYO1Vvxlw9eRblp22v1JTPxD0KRjr5PgRV0JXeOZ/HaaQD
         UT0VidBhpquc4iCJ9BGjSm0WJ3jVShZMhAhiIZHtXAHumkgbrU3W+V73E5uV1DqKzIAp
         5jWhPXybrxL4NY5MsVpsrJ00M1kzZ62ZRN+RWHMtwIhLbtu+5TNyiQKYOXQHvi40ZZMt
         V9lA==
X-Forwarded-Encrypted: i=1; AL+hErECSxM08DFM1qbgU3tcHeaJ6ELCJ/V5poczHFQd7snvKhrftA0GO6yECB+m25oVvby5GK+G8n2TGj07fGY1r6w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1LdSJbA/dQw27UjoH1G6ZjLFLTop+ArvITvXeGzBkdSUDR3Dx
	2WSTe2uuenk8igt5Tm6syfTeHi9No5sgkM/3TIkwuxeAzEUMoqSD4VyCtn5XsR+kjmYcaMATTKO
	yujr6CubyFXaSJwy+8TF/PBQJb20RS1A=
X-Gm-Gg: AYBFou0I51vIcK+fkG9qPVyLezCDh2m3pUda5mhGe6hZCqCl1L/iXK1dTMFttHQLFsm
	wipHtaqD1jtj7hmRGFXAOstCOMw6s+c3ksqEGX5JXjtfooeWC3ONdyJ+GJ2F9kTzsBIp9N6Edvu
	Wb6wajFN96DdvfsecvNwJKet23wGFyX45EhzAZwwL17p85KxxsPR5Jw6/fWNZU6maqLXAIFNBfx
	JY9/WRxL4zuMYGXz+XmE7W0SbALJ2Ws2n/Jhe0myKgVZpZVL1zIPy9lmJ6K7ac13gZ/YH/8Aof4
	C8xwfclnGMhnI+fyrcBVzLjNVQMKlo3WPcP1H4lp6BN6Pox0C7/v70qp2HWa8g2ChWdmhEXD2js
	v1fBu9d++irrM0sNKtdDTU3KAisuVfOAXbmbhgVYfvBj1897YqISOth0eo4zazol4qgImKQ==
X-Received: by 2002:a05:600c:310e:b0:4a2:c9b:9b98 with SMTP id
 5b1f17b1804b1-4ba0936d857mr116824585e9.17.1794501746962; Thu, 12 Nov 2026
 08:42:26 -0800 (PST)
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
 <20261104165504.2430480-26-kunwu.chan@gmail.com> <1c2eff9d-213b-4ea2-9905-a054c6d40d97@paulmck-laptop>
In-Reply-To: <1c2eff9d-213b-4ea2-9905-a054c6d40d97@paulmck-laptop>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Fri, 13 Nov 2026 00:42:13 +0800
X-Gm-Features: AclHuK_5dn6ii1XkN_5ubWft1GmD866Yv1veX15FudsEky0EOAdtZ7tnwYRl5R4
Message-ID: <CAN_Opa-RGS=5kTnMVsj6KE=xCLS8aB=dYSqee7DuFeQ=uvDHKA@mail.gmail.com>
Subject: Re: [PATCH 25/28] hazptr: Select TRACING for HAZPTR_TORTURE_TEST to
 enable tracepoint
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

On Wed, Nov 11, 2026 at 5:50=E2=80=AFAM Paul E. McKenney <paulmck@kernel.or=
g> wrote:
>
> On Thu, Nov 05, 2026 at 12:54:43AM +0800, Kunwu Chan wrote:
> > The hazptr torture test registers the hazptr_waiter_enqueue
> > tracepoint for its hot-address scenario; select TRACING so
> > that the register_trace_*() API is available.
> >
> > Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
>
> It is useful to run the torture tests without CONFIG_TRACING=3Dy in order
> to quickly isolate RCU bugs that tracing related.  Is there a way to do
> this so that people wanting to register tracing can do so, but so that
> it is still easy to run the tests without tracing?
>

Agreed. Only the HOTADDR and LONGHOLD scenarios need the enqueue
tracepoint; the other hazptrtorture scenarios should remain usable
without tracing.

I'll drop the select TRACING changes, make the tracepoint-dependent
scenarios conditional on CONFIG_TRACING, and enable tracing
explicitly in their scripted runs.

Thanks,
Kunwu

>                                                         Thanx, Paul
>
> > ---
> >  kernel/rcu/Kconfig.debug | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/kernel/rcu/Kconfig.debug b/kernel/rcu/Kconfig.debug
> > index b500e96ea1c1..8fc6434a05d1 100644
> > --- a/kernel/rcu/Kconfig.debug
> > +++ b/kernel/rcu/Kconfig.debug
> > @@ -27,6 +27,7 @@ config RCU_SCALE_TEST
> >       tristate "performance tests for RCU"
> >       depends on DEBUG_KERNEL
> >       select TORTURE_TEST
> > +     select TRACING
> >       default n
> >       help
> >         This option provides a kernel module that runs performance
> > @@ -42,6 +43,7 @@ config RCU_TORTURE_TEST
> >       tristate "torture tests for RCU"
> >       depends on DEBUG_KERNEL
> >       select TORTURE_TEST
> > +     select TRACING
> >       default n
> >       help
> >         This option provides a kernel module that runs torture tests
> > @@ -102,6 +104,7 @@ config RCU_REF_SCALE_TEST
> >       tristate "Scalability tests for read-side synchronization (RCU an=
d others)"
> >       depends on DEBUG_KERNEL
> >       select TORTURE_TEST
> > +     select TRACING
> >       default n
> >       help
> >         This option provides a kernel module that runs performance test=
s
> > @@ -117,6 +120,7 @@ config HAZPTR_TORTURE_TEST
> >       tristate "Torture tests for hazard pointers"
> >       depends on DEBUG_KERNEL
> >       select TORTURE_TEST
> > +     select TRACING
> >       default n
> >       help
> >         This option provides in-kernel hazard-pointer stress tests.
> > --
> > 2.43.0
> >
