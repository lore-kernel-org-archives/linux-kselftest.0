Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCBB3DAAA0
	for <linux-kselftest@vger.kernel.org>; Thu, 27 Aug 2026 08:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787818717; cv=none; b=fLMFr06VRX1WH2nwBshaQLWLh6+XWOf0BD7pVZW/Q98G1hzvS/SHffswI9sv+I3KBW0EZ7zqwJ9bWhhCiZVdPSBAgd+0dDDXYrgnl0P2+P1LbSSMtOypAr7GvKSFpBOEkNSH+0sb0V6Niic3z19iT3du+6C1rBAOMhUAluFaUes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787818717; c=relaxed/simple;
	bh=+f0CNIxvIeYqfF1de6wzqTeVVwJY0SE8+kB5zidrYPs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E8jABeCOxU4TEDhRTNUEE40lS7tc2/4agutPh/lnZpw5KubH3vSG2kEdk66StUJOtZLwXUZYy1e96W26TajpGKQzUgAzT7WMBQbu4pKIBwmGGbCxaSqGWmkPVrGpmH85lcN+TcCV8//sEMnLprIwbgAUxsn+ZKar7ThV6+X05KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SpNESQ4F; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=nelvHdPG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SpNESQ4F";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="nelvHdPG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787818714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+f0CNIxvIeYqfF1de6wzqTeVVwJY0SE8+kB5zidrYPs=;
	b=SpNESQ4FTm0EOCkcTScKpjgxHbINKZ1pXZZV44lgUh61g5nAKOSgoBr/RyjZk2E3sRNTjx
	1s5UeCKc+PH4lkXZYsq1BfGuNV/PHnsOjg05qZnD2xf4xri92Ci39heDRDgJR14Gj+l/O9
	1THOh23VDpltV14mfpNhJHntUtEYhBA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-505-RES2ct4LOSC1U5aAgqXqHQ-1; Thu, 27 Aug 2026 04:18:33 -0400
X-MC-Unique: RES2ct4LOSC1U5aAgqXqHQ-1
X-Mimecast-MFC-AGG-ID: RES2ct4LOSC1U5aAgqXqHQ_1787818712
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-6a5d682e372so683294a12.0
        for <linux-kselftest@vger.kernel.org>; Thu, 27 Aug 2026 01:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787818712; x=1788423512; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+f0CNIxvIeYqfF1de6wzqTeVVwJY0SE8+kB5zidrYPs=;
        b=nelvHdPGlJWXIIvwOO9kj7VIqc32UmQzJLT3u+kihyYkPXBKoYyxcsy0x1mDxCbSV6
         EJ4XNcseB5oVXfqHRJqVAtDB1OzmGjEQgKyiZ87mPJA+q+zgTpyKNBSiOa40YOnfSlkG
         dxJ7XO7MDTwMET1rA1g0k2FRXThb+RGG6OayMD+aZzCpjKF6bcxsTJvFi1ecX1Gcz5Uw
         sKO/8AtLI+qVCvJTRSoDs7y4CFhaPwqz0ccc4R9Mw2kP8x8WnJHhvYjndoycgWYtXHpU
         wZ9+E9SlMpbixmR3ZGPvR8EzY8XjxjqzpWuikV8LAFbU58zswwKsgEKHpFVDox9cOIpi
         VeeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787818712; x=1788423512;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+f0CNIxvIeYqfF1de6wzqTeVVwJY0SE8+kB5zidrYPs=;
        b=ZyIS6hMUXBAD3ljXk3ZomrTv8cFXBnqWwVq0xjca0BlecntG3KZsizUO1h6Xbf05p+
         RsKU5tBd8j5sd62WnykKUO0157EJnNaDTklQTxN3YNIobZrraV+wILQaL3hXdG1vA2M7
         Fat4I9g9s4FhzoZBhAnYWOYt1Si626l0or3RZmVec2ddrm802rveVyYQ/gIWqjzTLyLv
         sviadzn/t//6DP+KMDUM40TD/YE0Q0iSWTW+8uxh1zp9uC2hWFuLa2m/gPvhcW/gp/U8
         xB+7VOnZLApHrM+y8YyvsDC2Gh87Tu4fbnRyMzH1/AWsqDItN4t/Ifn5+eYQ1GZAAGsc
         hJqQ==
X-Forwarded-Encrypted: i=1; AHgh+RqQYWQu9VvrLYadE6PzO0+b+Tzba+wnBvRUx8kLVcaykFtyGH8iP7qhn/+wnsZPbeNrVt1TRQyr5ME7wBngXCk=@vger.kernel.org
X-Gm-Message-State: AFuF++mSlf2lmomMUB4PxEhQYIvgzYorIdqxEfiZEUajS/KPjUYHn+6h
	L8md7YfOcnNI5AieFOiGBQCrLx7tPyaBQ+XQ09DQUnXxp6G2gV3G0fJ4NMbcx1mjAmqIYMDhw9i
	8tp0ofjetc66mDw6czvRFsf7ifqZ+8RWm0XZUhC3LyNfUwt1DdL4vOnyEU2bDUDyXzKp8TQ==
X-Gm-Gg: AR+sD11mHZeCmlKYidSf7daa/CLaPZnBHdRZuUzP4Ww5gDxYF0WGmO81bGoWfpPiqON
	2tPMHgNWQfnYdSfHTS88Zeq3PZuCWQiWWWEXKydpmGpViXGWKq8jdK9/mno1luMY5TRJ0k0zgiY
	FBTzzGQWziKxX6lKjzMly2+9vw+NyFDXOX4jrcGaf8+2+06G5h4+T04qK8gvcVaF3xCDSyEQFqQ
	hVSxh+CQUgXGOYH96wZwMdXBiQApH8mu+ihvYw/sdMcvabL3iEt8fNzze4CoD8Ry/EORQLTznrC
	pGNY6UCuL3BtvMK98UcyWwKUaJ0OQ1QIomn6RBM2G+0YU1wxbna4LTpI/s4o2kLff1mEcEJszGj
	1orJ9QwAIpq15rIJVYsUJyv6xNqJHR5Wsb6m25gqzasTBdjji0OX8XE6rzkSds6CTi7jp7Q==
X-Received: by 2002:a17:907:c084:b0:c24:6382:2648 with SMTP id a640c23a62f3a-c2535f4bc77mr425514966b.5.1787818711798;
        Thu, 27 Aug 2026 01:18:31 -0700 (PDT)
X-Received: by 2002:a17:907:c084:b0:c24:6382:2648 with SMTP id a640c23a62f3a-c2535f4bc77mr425510966b.5.1787818711265;
        Thu, 27 Aug 2026 01:18:31 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb (212-8-243-115.hosted-by-worldstream.net. [212.8.243.115])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c254ab6e16csm4939666b.11.2026.08.27.01.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 01:18:30 -0700 (PDT)
Message-ID: <40084ae4b7139fc20543a8989cdc349cf9b6bcdb.camel@redhat.com>
Subject: Re: [RFC 0/3] rv: per-edge dwell-time statistics for per-cpu
 monitors
From: Gabriele Monaco <gmonaco@redhat.com>
To: Tobias Schaffner <tobias.schaffner@siemens.com>, Steven Rostedt
	 <rostedt@goodmis.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>,  Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Jan Kiszka	
 <jan.kiszka@siemens.com>, Philippe Gerum <rpm@xenomai.org>, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 27 Aug 2026 10:18:29 +0200
In-Reply-To: <20260827072400.45734-1-tobias.schaffner@siemens.com>
References: <20260827072400.45734-1-tobias.schaffner@siemens.com>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0BrZXJuZWwub3JnPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmjKX2MCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfIQuAD+JulczTN6l7oJjyroySU55Fbjdvo52xiYYlMjPG7dCTsBAMFI7dSL5zg98I+8
 cXY1J7kyNsY6/dcipqBM4RMaxXsOtCRHYWJyaWVsZSBNb25hY28gPGdtb25hY29AcmVkaGF0LmNvb
 T6InAQTFgoARAIbAwUJBaOagAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBMrKEfgLgd0WcK
 eo9u9KbElYeE3yBQJoymCyAhkBAAoJEO9KbElYeE3yjX4BAJ/ETNnlHn8OjZPT77xGmal9kbT1bC1
 7DfrYVISWV2Y1AP9HdAMhWNAvtCtN2S1beYjNybuK6IzWYcFfeOV+OBWRDQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-08-27 at 09:23 +0200, Tobias Schaffner wrote:
> Hi Steven, Gabriele,
>=20
> I am using the RV system for a downstream project called EVL (aka Xenomai=
4).
> It is a small co-kernel system, small enough that I can model the whole
> co-kernel with RV instead of just a fragment of it.

Hi Tobias,

Haven't heard about Xenomai in a while.. That sounds very interesting.

Since it's something out-of-tree you likely don't want to submit monitors
upstream, but if you can trigger BPF events from your co-kernel you may wan=
t to
have a look at RV BPF monitors, which I'm likely going to submit in a coupl=
e of
days.

Otherwise we can always get out-of-tree monitors as modules, currently not
supported just out of a missing use-case.

> The patches in this series add a per-monitor "stats" file that exposes ho=
w
> often an edge has been visited and the dwell time in the prior state for
> per-cpu monitors.

The idea crossed my mind a few times, good you came up with an implementati=
on!

> This allows me to not only check if the model is correct but also to see =
if
> all paths are exercised by my stress tooling and to decompose the latency=
 of
> the co-kernel's wakeup path.

Your first need (see if all paths are exercised) doesn't really require the=
 stat
to be per-monitor-instance (i.e. per-cpu) right?
You could have a global accumulator matrix, at least for count and sum wher=
e you
can be atomic. This could extend the feature to other types of monitors.

Just brainstorming here though.

> I think that some of the upstream monitors like e.g. the sts monitor coul=
d
> also
> profit from this.
>=20
> As an example, here is the sts monitor on a StarFive VisionFive2 running =
an rt
> kernel (isolcpus=3D2-3), after enabling it and generating some scheduler =
load.
> Only the edges the automaton actually takes are non-zero:
>=20
> =C2=A0 # cat monitors/sched/sts/stats
> =C2=A0 # cpu edge label count max_ns sum_ns
> =C2=A0 0 0 can_sched:irq_disable 367732 3998500 14773091250
> =C2=A0 0 4 can_sched:schedule_entry 40282 398750 45510750
> =C2=A0 0 7 cant_sched:irq_enable 367732 32500 532791750
> =C2=A0 0 8 cant_sched:irq_entry 26188 6250 38357250
> =C2=A0 0 13 disable_to_switch:irq_enable 4933 12500 12275000
> =C2=A0 0 14 disable_to_switch:irq_entry 31 2250 35250
> =C2=A0 0 15 disable_to_switch:sched_switch 35373 26750 111615750
> =C2=A0 0 18 enable_to_exit:irq_disable 373 3250 649750
> =C2=A0 0 19 enable_to_exit:irq_enable 373 20000 1676250
> =C2=A0 0 20 enable_to_exit:irq_entry 309 4750 420000
> =C2=A0 0 23 enable_to_exit:schedule_exit 40298 3000 37335000
> =C2=A0 0 25 in_irq:irq_enable 31 12250 140750
> =C2=A0 0 30 scheduling:irq_disable 40337 18000 45449500
> =C2=A0 0 37 switching:irq_enable 35373 9250 72471000
> =C2=A0 [ cpus 1-2 omitted ]
> =C2=A0 3 0 can_sched:irq_disable 567 3983750 300860250
> =C2=A0 3 4 can_sched:schedule_entry 150 1500 171000
> =C2=A0 3 7 cant_sched:irq_enable 567 21500 1777500
> =C2=A0 3 8 cant_sched:irq_entry 76 6500 164750
> =C2=A0 3 15 disable_to_switch:sched_switch 150 4250 413750
> =C2=A0 3 23 enable_to_exit:schedule_exit 150 1500 147750
> =C2=A0 3 30 scheduling:irq_disable 150 1500 166000
> =C2=A0 3 37 switching:irq_enable 150 3750 277000
>=20
> The sts model splits the schedule->switch path into separate states, so t=
he
> per-edge dwell decomposes the scheduler's interrupts-off window: on cpu0 =
the
> prep phase (disable_to_switch, irqs off until the switch) tops out at 26.=
8us
> and the switch itself (switching:irq_enable) at 9.3us, over 35k switches.=
 The
> counts also line up with the model, e.g. every irq_disable in can_sched h=
as a
> matching irq_enable in cant_sched (367732 =3D=3D 367732). The isolated cp=
us 2-3
> take almost no switches (150 on cpu3, versus 35k on cpu0) and their worst=
 case
> is tighter still (~4us), so the same file also makes the effect of cpu
> isolation visible per cpu.
>=20
> The changes are gated by CONFIG_RV_EDGE_STAT and dormant until a monitor =
is
> enabled, so existing setups are unaffected. When enabled, each accepted
> transition adds one local_clock() and a few lock-free local64_t updates. =
With
> the config off there is no code on the hot path at all.
>=20
> I focused on per-cpu monitors as a first step. Per-task and per-object
> monitors would have to aggregate entities that share a cpu, which is hard=
er
> to get right, so I left them out for now.

As said before, I haven't really played with an implementation but I think
atomic types may help here.

> What is your opinion on this? Do you think this is worth getting upstream=
ed?

I will have a look at your patches but it's definitely something I'd want.

Thanks,
Gabriele

>=20
> Thanks for taking a look,
> Tobias
>=20
> Tobias Schaffner (3):
> =C2=A0 rv: add per-edge dwell-time statistics primitive
> =C2=A0 rv: add per-monitor edge-stat facility and stats file
> =C2=A0 rv: collect per-edge dwell time for per-cpu DA/HA monitors
>=20
> =C2=A0.../trace/rv/runtime-verification.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 24 ++++
> =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0 1 +
> =C2=A0include/linux/rv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 18 +++
> =C2=A0include/linux/rv_edge_stat.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 60 =
+++++++++
> =C2=A0include/rv/da_monitor.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 53 ++++++++
> =C2=A0kernel/trace/rv/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 11 ++
> =C2=A0kernel/trace/rv/rv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 116 +++++++++++++++++-
> =C2=A0tools/testing/selftests/verification/config=C2=A0=C2=A0 |=C2=A0=C2=
=A0 1 +
> =C2=A0.../verification/test.d/rv_edge_stats.tc=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 32 +++++
> =C2=A09 files changed, 315 insertions(+), 1 deletion(-)
> =C2=A0create mode 100644 include/linux/rv_edge_stat.h
> =C2=A0create mode 100644
> tools/testing/selftests/verification/test.d/rv_edge_stats.tc

