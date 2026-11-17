Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794928657;
	b=YoD7bsZgSaLtQuWvzWj0LJ19JfIVCmh8rjPG01QwX+sDyj9S4DtdcsilRkTxJynqIYyr
	 1sMexJ0NcjLgvhgUnrrW82S6erO5ZtQHtK8ePko/5SUmPGg5MtZdLKs49UV4AVqd7rDVL
	 3Iowmq0q4WP+uMX5wuFWEa/aubjAGkhEoOId1wa0uL5Ri9OXTftVJs7K2zWr8tMtA6vWG
	 VD2pclYF65Z1Sf2ABpJEhz3nfxfr9UjiBBWQfKhXOPY4U284kBr5ap7n4gmTbZqdUYmtz
	 ogmc5s31UeH9zqMSV2wM9tSOmSbg3MomLghEyGOmJMM+GeMR71sanfvpV6eX1a/Nwfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794928657;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Autocrypt:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=tNBzpuk7kY7sMCyewGn6ehi2za2Xs4aSfw8c83qLZOU=;
	b=ZhQfGP4fgtqL1IzhKtn9H7jOyRYbeARtHg12uuefhRIXVqnsHoQbWVNl6hzuXwPRfh7D
	 7fzvt9TTmSKVnmXfh9pmolKWhdsHbyF5vGRoePZMO4GkSrM+LBPhmnMZaBgN9SSukHjG6
	 853HcopL3LeKxpamicHpSLnmeq9tIqFSo5BRnsrnYc3dEm6RPB/1bMHGbuz7iuOBt4+UW
	 rDFy1yRBKGE6VKOZb5qJ06uohb578+7m1weJVKDZyNmE+RtKBshxz1xGPIkFISx9lJAZY
	 E/MRb5VNQwyf3HveEB+UOFE9hcCpLB2fX7BhoKS1toeY7ninjNI+Zj5Rk2nqMJ7uO1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cK5bfQrv;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="U1GeiK/Y";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0033C606A31C
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 15:17:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0033C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cK5bfQrv;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=U1GeiK/Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794928656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=tNBzpuk7kY7sMCyewGn6ehi2za2Xs4aSfw8c83qLZOU=;
	b=cK5bfQrvuH4swQL0DLvRB01fftHb+di9z+GPG2otnLidaC2VOPj9vEo5oU5Q0iyTPMttEB
	ymW9qrx9BDFVltvOHtGVf2gAcvAoGZIPx1RPM9oYtHAfgfA2SuC2TDd+eKYiWNzBPsLTDK
	PDqAJ2e8P5XQWK8pxKzIFnCvzwSFktc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-597-lKf4ZiHtPfyDKwOZT1dHvQ-1; Tue, 17 Nov 2026 10:17:34 -0500
X-MC-Unique: lKf4ZiHtPfyDKwOZT1dHvQ-1
X-Mimecast-MFC-AGG-ID: lKf4ZiHtPfyDKwOZT1dHvQ_1794928653
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4916bd6e3baso3955774f8f.0
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 07:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794928653; x=1795533453; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tNBzpuk7kY7sMCyewGn6ehi2za2Xs4aSfw8c83qLZOU=;
        b=U1GeiK/YFcSiDcD/1DmUsEKEg0Gs/QNz+55Nyrmcbf5HxvZA+vTyHgs4h3sJ8h74Fe
         GrFQSxibf+giTuh0UroLV6zPjv/gDPt7/V54gMzjMfDU1FjgAKQQQOgZ4ixZfVnbrnDh
         STGztGNc5oGJGNan+4wpuyfulL4A5pnd5TEBFnWAvLt43RiMhLwEQWsUX6IrCK6jiR9a
         tuDBP2htmI0tIR61553K0o5sNW/p2Q0XCwa5rr6rYp+LRY3R8r+GqyqnjRPb2LzqIY6L
         QW0FxNK022dokKqS+JXhrlkNkIsgR8a5UZGnejieoLHs/YfyiRBSXKzXq716Qx3Onzel
         HazA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794928653; x=1795533453;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tNBzpuk7kY7sMCyewGn6ehi2za2Xs4aSfw8c83qLZOU=;
        b=mKLq4Ek1ykY0L2r3vYQbsrvouG9dRen28VEoAr9YZ8C2MiHLGj0ALQxRy3CmocUPm+
         Hx99z1RIAa+G+8YgscIT13vZ6FCdfQsa/uN29XZsaKiPHJ5DALMqDoI1oTyEy4sxEnvA
         FbH+RnxqbCUDZoNCcQvAqzQPqMuUgjV5offfOwnLJ46oDYzbPe297ydkMbOcI0G0LdPz
         rGpr8N618CNUIiuMFEcuzoZdprHRcSk28aUGc7fIy7xmC+XBwJPKGM8iudDlOYprRx6y
         4T7YVocZIGYKFkULUCTXetTGpayBQxFqOY/D4mJ1MxjW1AqsYpWb9ErWCagpq0Gl86Ma
         bOpQ==
X-Forwarded-Encrypted: i=1; AL+hErFh0nDWECqqlSnAa8samAt+lnn82AgzNigT/X752c5185q3V9Me3duSg1rDOoNqI2WyqCMFxrcH/c/okfvfFD4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SOZgmbEbKFeG1/RiD0wBj8xnF15P7sOe8ofbOq9B4lcNN490f
	ooXmSkL2BCHQU8ohK6o6US/f8KXBabWcaXjB4vg8lU6SS5a+Z++UhHnJGhNUEOhmm7fQ7t4vbsJ
	1zygJOgXkC8Quv3dbf4ivPKz9tQBVQCw5XQnJYqMV1Hz+05vr4eOQmsTV3i4j+09l92BT8w==
X-Gm-Gg: AZFdTZfkgSq7fVoW5qDHZT47WoVWhvL8HBUQ2VgJrCzkzvc7rv2U3WrdRy0d4iVBo/z
	PXNlcujruXSFn6fXRmqRNkakT+dQPLOLGM3ZrIfBEFiwaE4HUOeDmswGim4lA9xDVAxdCxY/gxo
	0OOO0kA1paM3V4fhZ4U+ZuhxJeXFuRN9SvFozunaqtIm96y35rZlaPmvPW+kCaWk3XO8ZDpD86u
	p96QIQ5m9t9C99xN+TNb668oFyUBLSjd71NIW++ft/B7oe7H49rjS7/kZKKCDbvd0V49172iy78
	8zMeRCWqfi+ExUvK204kD4SKZzZv+R4TWMf1pOB+UvSjbAVI44n8bypEVb1U9trlcKn+IUD6elF
	mrO6e8o6U8mzP06yaY8QnM5Ykdmv2Qyesim+ynmvF30Me0yNW/D4ylzcHlxKYK8FNfjvTj8ZY+Z
	Sshz00gCpyLi0x1BEATC4LFg+NB381Qb68Fs0=
X-Received: by 2002:a5d:6f19:0:b0:48d:facb:5937 with SMTP id ffacd0b85a97d-49c6d453a54mr27920974f8f.7.1794928653182;
        Tue, 17 Nov 2026 07:17:33 -0800 (PST)
X-Received: by 2002:a5d:6f19:0:b0:48d:facb:5937 with SMTP id ffacd0b85a97d-49c6d453a54mr27920908f8f.7.1794928652732;
        Tue, 17 Nov 2026 07:17:32 -0800 (PST)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb (43.pool85-60-233.dynamic.orange.es. [85.60.233.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d03b10fsm31817198f8f.1.2026.11.17.07.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 07:17:30 -0800 (PST)
Message-ID: <eb08b0075a686d0f1907160c4e4880ed779e02d8.camel@redhat.com>
Subject: Re: [PATCH v3 2/4] rv: add per-edge dwell-time statistics
From: Gabriele Monaco <gmonaco@redhat.com>
To: Tobias Schaffner <tobias.schaffner@siemens.com>, Steven Rostedt
	 <rostedt@goodmis.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, Randy
 Dunlap <rdunlap@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers	 <mathieu.desnoyers@efficios.com>,
 linux-trace-kernel@vger.kernel.org, 	linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 rpm@xenomai.org, jan.kiszka@siemens.com
Date: Tue, 17 Nov 2026 16:17:29 +0100
In-Reply-To: <20261020095512.863754-3-tobias.schaffner@siemens.com>
References: <20261020095512.863754-1-tobias.schaffner@siemens.com>
	 <20261020095512.863754-3-tobias.schaffner@siemens.com>
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
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, 2026-10-20 at 11:55 +0200, Tobias Schaffner wrote:
> Add CONFIG_RV_EDGE_STAT, an optional facility that records how long a
> monitor's automaton dwells in a state before leaving it and accounts that
> dwell to the edge it leaves by.
>=20
> Keep the state and its entry timestamp in one word so a transition commit=
s
> both with a single cmpxchg and nested transitions cannot charge a dwell t=
o
> the wrong edge. This requires a native 64-bit cmpxchg.
>=20
> The counters are per-CPU and lock-free, so a monitor's hot path can updat=
e
> them without disabling interrupts and without perturbing the latency bein=
g
> measured. Only the owning CPU writes them, so a reader snapshots them wit=
h
> local64_read() with no IPI and no locking on the accounting path.
>=20
> Storage is a static per-CPU array of STATE_MAX * EVENT_MAX edges per
> monitor, exposed through a per-monitor "stats" tracefs file. Report wheth=
er
> the model defines each edge, so a count on an edge that should never be
> taken is visible. Nothing uses the facility yet.
>=20
> Signed-off-by: Tobias Schaffner <tobias.schaffner@siemens.com>

I took too long to finally review this. It looks good, just a few minor
comments.

> ---
> =C2=A0include/linux/rv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 7 ++
> =C2=A0include/rv/edge_stat.h=C2=A0 | 211 ++++++++++++++++++++++++++++++++=
++++++++
> =C2=A0kernel/trace/rv/Kconfig |=C2=A0 12 +++
> =C2=A03 files changed, 230 insertions(+)
> =C2=A0create mode 100644 include/rv/edge_stat.h
>=20
> diff --git a/include/linux/rv.h b/include/linux/rv.h
> index 541ba404926a..1dc7c45f476c 100644
> --- a/include/linux/rv.h
> +++ b/include/linux/rv.h
> @@ -21,6 +21,13 @@
> =C2=A0#include <linux/list.h>
> =C2=A0#include <linux/types.h>
> =C2=A0
> +/* Edge statistics pack the state and its entry timestamp into one word.=
 */
> +#ifdef CONFIG_RV_EDGE_STAT
> +#define da_state_t=09unsigned long
> +#else
> +#define da_state_t=09unsigned int
> +#endif
> +

I presume here you are using a define instead of a typedef just to avoid
checkpatch and friends to complain. Right?

I'm not sure this is any better to be fair. Typedef is what you want here a=
nd I
would argue it's the right tool for the job.

This exact use is mentioned as an exception (b) to the no typedefs rule [1]=
.

[1] - https://www.kernel.org/doc/html/latest/process/coding-style.html#type=
defs

> =C2=A0/*
> =C2=A0 * Deterministic automaton per-object variables.
> =C2=A0 */
> diff --git a/include/rv/edge_stat.h b/include/rv/edge_stat.h
> new file mode 100644
> index 000000000000..8b99e8520e1e
> --- /dev/null
> +++ b/include/rv/edge_stat.h
> @@ -0,0 +1,211 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Per-edge dwell-time statistics for RV monitors.
> + *
> + * Copyright (C) 2026 Siemens AG
> + * Author: Tobias Schaffner <tobias.schaffner@siemens.com>
> + */
> +#ifndef _RV_EDGE_STAT_H
> +#define _RV_EDGE_STAT_H
> +
> +#include <linux/rv.h>
> +
> +#ifdef CONFIG_RV_EDGE_STAT
> +
> +#include <linux/args.h>
> +#include <linux/atomic.h>
> +#include <linux/bitfield.h>
> +#include <linux/bug.h>
> +#include <linux/compiler.h>
> +#include <linux/percpu.h>
> +#include <linux/sched/clock.h>
> +#include <linux/seq_file.h>
> +#include <linux/types.h>
> +#include <asm/local64.h>
> +#include <rv/automata.h>
> +#include "rv.h"

Including this apparently opened a can of worms and BTF infos no longer bui=
ld.
I'll send a fix separately, it isn't really related to your change.

> +
> +/*
> + * Per-CPU counters kept in local64_t so accounting is safe against inte=
rrupt
> + * and NMI nesting on the owning CPU without disabling interrupts. Only =
the
> + * owning CPU writes.
> + */
> +struct rv_edge_stat {
> +=09local64_t=09count;
> +=09local64_t=09sum_ns;
> +=09local64_t=09max_ns;
> +};
> +
> +/*
> + * State and entry timestamp share one word so a transition commits both=
 with
> + * one cmpxchg. Comparing the timestamp also detects nested transitions =
that
> + * return to the same state.
> + */
> +#define RV_STATE_BITS=09=098
> +#define RV_STATE_MASK=09=09GENMASK(RV_STATE_BITS - 1, 0)
> +#define RV_TS_MASK=09=09GENMASK(BITS_PER_LONG - 1, RV_STATE_BITS)
> +
> +#define da_state_of(w)=09=09FIELD_GET(RV_STATE_MASK, w)
> +#define da_ts_of(w)=09=09FIELD_GET(RV_TS_MASK, w)
> +#define da_state_pack(s, ts)=09(FIELD_PREP(RV_TS_MASK, ts) | \
> +=09=09=09=09 FIELD_PREP(RV_STATE_MASK, s))
> +
> +static __always_inline
> +void rv_edge_stat_account(struct rv_edge_stat *s, u64 dwell_ns)
> +{
> +=09s64 max;
> +=09int i;
> +
> +=09local64_inc(&s->count);
> +=09local64_add(dwell_ns, &s->sum_ns);
> +
> +=09/* Keep the largest dwell; bound retries if a nested update races us.
> */
> +=09max =3D local64_read(&s->max_ns);
> +=09for (i =3D 0; dwell_ns > (u64)max; i++) {
> +=09=09if (i =3D=3D MAX_DA_RETRY_RACING_EVENTS) {
> +=09=09=09WARN_ONCE(1, "rv: edge-stat max update exceeded %d
> retries\n",
> +=09=09=09=09=C2=A0 MAX_DA_RETRY_RACING_EVENTS);
> +=09=09=09break;
> +=09=09}
> +=09=09if (local64_try_cmpxchg(&s->max_ns, &max, dwell_ns))
> +=09=09=09break;
> +=09}
> +}
> +
> +static_assert(STATE_MAX <=3D (1U << RV_STATE_BITS),
> +=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "automaton has more states than the pa=
cked state word can
> hold");
> +
> +#if RV_MON_TYPE =3D=3D RV_MON_PER_CPU
> +
> +/*
> + * One edge per (state, event) pair. Static storage avoids allocation
> lifetime
> + * races. Only the owning CPU writes, so readers can snapshot counters w=
ith
> + * local64_read().
> + */
> +#define RV_THIS_NR_EDGES=09(STATE_MAX * EVENT_MAX)
> +
> +#define DA_EDGE(state, event)=09((state) * EVENT_MAX + (event))
> +#define DA_EDGE_STATE(edge)=09((edge) / EVENT_MAX)
> +#define DA_EDGE_EVENT(edge)=09((edge) % EVENT_MAX)
> +
> +#define DA_MON_EDGES=09=09CONCATENATE(da_mon_edges_, MONITOR_NAME)
> +
> +static DEFINE_PER_CPU(struct rv_edge_stat[RV_THIS_NR_EDGES], DA_MON_EDGE=
S);
> +static struct dentry *rv_this_stats_file;
> +
> +/* Called before tracepoints are registered, so memset cannot race an up=
date.
> */
> +static void rv_edge_stats_reset(void)
> +{
> +=09int cpu;
> +
> +=09for_each_possible_cpu(cpu)
> +=09=09memset(per_cpu_ptr(DA_MON_EDGES, cpu), 0,
> sizeof(DA_MON_EDGES));
> +}
> +
> +static int rv_edge_stats_show(struct seq_file *seq, void *v)
> +{
> +=09unsigned int e;
> +=09int cpu;
> +
> +=09seq_puts(seq, "# cpu edge label valid count sum_ns max_ns\n");
> +=09/* Include offline CPUs and keep output stable across CPU hotplug. */
> +=09for_each_possible_cpu(cpu) {
> +=09=09struct rv_edge_stat *edges =3D per_cpu_ptr(DA_MON_EDGES, cpu);
> +
> +=09=09for (e =3D 0; e < RV_THIS_NR_EDGES; e++) {
> +=09=09=09enum states state =3D DA_EDGE_STATE(e);
> +=09=09=09enum events event =3D DA_EDGE_EVENT(e);
> +
> +=09=09=09/* Edges the model does not define must stay at zero.
> */
> +=09=09=09seq_printf(seq, "%d %u %s:%s %d %llu %llu %llu\n",
> +=09=09=09=09=C2=A0=C2=A0 cpu, e,
> +=09=09=09=09=C2=A0=C2=A0 model_get_state_name(state),
> +=09=09=09=09=C2=A0=C2=A0 model_get_event_name(event),
> +=09=09=09=09=C2=A0=C2=A0 model_get_next_state(state, event) !=3D
> INVALID_STATE,
> +=09=09=09=09=C2=A0=C2=A0 (u64)local64_read(&edges[e].count),
> +=09=09=09=09=C2=A0=C2=A0 (u64)local64_read(&edges[e].sum_ns),
> +=09=09=09=09=C2=A0=C2=A0 (u64)local64_read(&edges[e].max_ns));
> +=09=09}
> +=09}
> +=09return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(rv_edge_stats);
> +
> +static int rv_edge_stats_create(struct dentry *parent)
> +{
> +=09rv_edge_stats_reset();
> +=09rv_this_stats_file =3D rv_create_file("stats", RV_MODE_READ, parent,
> +=09=09=09=09=09=C2=A0=C2=A0=C2=A0 NULL, &rv_edge_stats_fops);
> +=09return rv_this_stats_file ? 0 : -ENOMEM;
> +}
> +
> +static void rv_edge_stats_remove(void)
> +{
> +=09rv_remove(rv_this_stats_file);
> +=09rv_this_stats_file =3D NULL;
> +}
> +
> +/* A zero timestamp marks resets, which can run on a different CPU. */
> +#define da_state_entered(s)=09da_state_pack((s), local_clock())
> +
> +static __always_inline void
> +rv_edge_account(da_state_t old, da_state_t new, enum states curr, enum e=
vents
> ev)
> +{
> +=09struct rv_edge_stat *edges;
> +=09u64 prev =3D da_ts_of(old);
> +
> +=09if (unlikely(!prev))
> +=09=09return;
> +
> +=09edges =3D this_cpu_ptr(DA_MON_EDGES);
> +=09rv_edge_stat_account(&edges[DA_EDGE(curr, ev)],
> +=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 (da_ts_of(new) - prev) & FIELD_MAX(RV_=
TS_MASK));
> +}
> +
> +#else /* per-cpu accounting off for this monitor type */
> +
> +#define da_state_entered(s)=09((da_state_t)(s))
> +
> +static __always_inline void
> +rv_edge_account(da_state_t old, da_state_t new, enum states curr, enum e=
vents
> ev) { }
> +
> +#endif /* RV_MON_TYPE =3D=3D RV_MON_PER_CPU */
> +
> +static __always_inline bool
> +da_state_try_commit(da_state_t *word, da_state_t *old, enum states next,
> +=09=09=C2=A0=C2=A0=C2=A0 enum events event)
> +{
> +=09da_state_t prev =3D *old;
> +=09da_state_t new =3D da_state_entered(next);
> +
> +=09if (!try_cmpxchg(word, old, new))
> +=09=09return false;
> +
> +=09rv_edge_account(prev, new, da_state_of(prev), event);
> +=09return true;
> +}
> +
> +#else /* !CONFIG_RV_EDGE_STAT */
> +
> +/*
> + * Feature off: only the hooks the DA/HA layer calls are provided, as tr=
ivial
> + * pass-throughs. da_state_t is a plain state word with no packed timest=
amp.
> + */
> +#define da_state_of(w)=09=09(w)
> +#define da_state_entered(s)=09(s)
> +
> +static __always_inline bool
> +da_state_try_commit(da_state_t *word, da_state_t *old, enum states next,
> +=09=09=C2=A0=C2=A0=C2=A0 enum events event)
> +{
> +=09return try_cmpxchg(word, old, next);
> +}
> +
> +#if RV_MON_TYPE =3D=3D RV_MON_PER_CPU
> +static inline int rv_edge_stats_create(struct dentry *parent) { return 0=
; }
> +static inline void rv_edge_stats_remove(void) { }
> +#endif
> +
> +#endif /* CONFIG_RV_EDGE_STAT */
> +
> +#endif /* _RV_EDGE_STAT_H */
> diff --git a/kernel/trace/rv/Kconfig b/kernel/trace/rv/Kconfig
> index efa930f94ea4..54f7c50a74a8 100644
> --- a/kernel/trace/rv/Kconfig
> +++ b/kernel/trace/rv/Kconfig
> @@ -59,6 +59,18 @@ config RV_PER_TASK_MONITORS
> =C2=A0=09=C2=A0 This option configures the maximum number of per-task RV =
monitors
> that can run
> =C2=A0=09=C2=A0 simultaneously.
> =C2=A0
> +config RV_EDGE_STAT
> +=09bool "Per-edge dwell-time statistics"
> +=09depends on RV && 64BIT && DA_MON_EVENTS_IMPLICIT
> +=09help
> +=09=C2=A0 Record per-edge dwell-time statistics for per-cpu deterministi=
c and
> +=09=C2=A0 hybrid automaton monitors and expose them through a per-monito=
r
> +=09=C2=A0 "stats" tracefs file. This times each monitored automaton
> transition
> +=09=C2=A0 with local_clock(), so leave it off if you do not need the
> +=09=C2=A0 statistics.
> +
> +=09=C2=A0 If unsure, say N.
> +

Mostly personal preference, but I would add new configs at the end of the f=
ile
(e.g. after reactors and KUnit).

Thanks,
Gabriele

> =C2=A0source "kernel/trace/rv/monitors/wip/Kconfig"
> =C2=A0source "kernel/trace/rv/monitors/wwnr/Kconfig"
> =C2=A0

