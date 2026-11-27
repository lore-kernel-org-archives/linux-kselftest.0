Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787868;
	b=3mPzH/qOk7wk5pkn6YAzx6DBgVYyNZA5Q5+gGkQ8yUIW36Kk+aDVblgTbZPKzwwAswxu
	 RvUbP29w8JhclxbPGhSAginRmCJH0dnsDE5gYpcjzw0LWuZBWs7S/VsO1sVik4/6zw5jO
	 8ak7YDJlsc4nD37v+cxMRTfC4EDYBvrlOfcPcl1GqVq2jww1t8PEmES+btKej+MnvuKa3
	 Fed27aLW6x4AQKlX3MKbg1S7atcHAIHqmUWOqNrGakIniVJ2kU9xGF7Dd1BMRM5qFeQXQ
	 pB0EinKotxcCKG96QsiaEQm6j01qQjWdgPGwRJQRXHMpoG6d7sk+n+n6RGJ5LLmY4bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787868;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Autocrypt:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=3oP3CW/xz/aHM7zel7M/7IDDZYm2mTSBClBR98IIqkA=;
	b=gIM3e028DFHAIAfKc+z0QWzWnJKPVDTKm8K+mK524WyNt9LqSMpGq7D8Hdb1sUpdbIKi
	 JDiigtYQ6Y219QkO+jXEzGEM2nX/Iro+WmvVnA6PZRsvd/ukfJzyXzcJ9kQpV1o/r1063
	 3qREFYzEomaV8/VVu+iCvBm3I2nUMOCuHcLn6L5HelIElv1iEbA3UTtn/4gl19HUpRRBG
	 Iyfc84MvDcVggkWd9wAO94/NInXauxxg0tmp4tadh4Y/ICppS/g59Qpw7o2lt3ul2xHu9
	 FNmxnmCLrfT3sRfsIYnpKoEe40WcDg3rAeShFDsb7gvu5G9OUIUzERQUEGQBcd6BG2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="h/SKOEax";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=syvQW9kB;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F3B606A31E
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 13:57:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52F3B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=h/SKOEax;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=syvQW9kB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795787867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3oP3CW/xz/aHM7zel7M/7IDDZYm2mTSBClBR98IIqkA=;
	b=h/SKOEaxCPsyyGbpY+bBx86VuXtzqlioYHh1XhMvmzqjqZmnpEUDdMPwJY60g4Fdy68//j
	xm2iLX9L6DzRY86yLcgkWx59lUdfz0RnsZiyLtZ8rIiec4SF7tksDup/eIuyU9qEYEOe7a
	wnw4HhdVj6L1iac23u2yfJB04vsoDs4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-138-Jrqy3pugP5-BtGccoHulNg-1; Fri, 27 Nov 2026 13:57:45 +0000
X-MC-Unique: Jrqy3pugP5-BtGccoHulNg-1
X-Mimecast-MFC-AGG-ID: Jrqy3pugP5-BtGccoHulNg_1795787863
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48fcb657f32so4799590f8f.2
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 05:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795787863; x=1796392663; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3oP3CW/xz/aHM7zel7M/7IDDZYm2mTSBClBR98IIqkA=;
        b=syvQW9kB0xvHhNdTXGv8tBK6tjGYn9XgLN2VtoTwWJl+sOp7HW/GUi7CBFXnrzcv+u
         w1A2UYfesPsHsioyxICWPOn2SMQxZAfCw2WPU3yFtqkbETu7HF2QHKxT+MKEvb2+Mads
         /bd4BaBFC3uUHNxcs7Lxba4Oc+XiuL7umfByHYFm9pEa66M4uoeC8kKlPbPrbKQ23DL6
         19G4C7VH0VeW6vjBHeJihqJ43fTVtEJMiTw3xWhKyesTwqVai1dqLZzJzGXlfRoongkt
         MoeI0VbicUDB41u1eoDFDASoiegU5FS8VQF3mxwuK80ti5ykY47Of9QYbjRS+QLasZt/
         tnxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795787863; x=1796392663;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3oP3CW/xz/aHM7zel7M/7IDDZYm2mTSBClBR98IIqkA=;
        b=2r07Ekk5AXg88Vzve7nI50LQEFizwe+PxE4iw/uGydOuAzo9xdn2bPlJ6AwTNQO2a+
         rH/XyHxvdSSg0+q+Kv3oH2pt+KVQFjsbnTJWGN2DWnK0gMF8KWyoi813Cnd0LSHP23eH
         Fhymr2zADlV9E/LufLXZGbFg2ZV3YDXFerU6r95Vl2v1LPs9cXUC7/oPgmBsIJY+3hXY
         V+zjUhF1e2Eu/OwgOJ7bxgSaR1F4b5baUva01YZemYbujeB1AmgQTHIdWANjESSrNMvC
         D7nGvMlMvS+qouCQiMYGwQT8XkuzfiEgjrtfOLzhZdFYk4zIdYVdUz4vm3iKg8Yx/KHF
         Iyuw==
X-Forwarded-Encrypted: i=1; AL+hErETXEiUHf3BJaz9xXwI2VnJJkORsa260vYmU6XuILEt2tl3kdKqK3oTl9vHMjPeBQwp2omluvViqlQrUus6a1U=@vger.kernel.org
X-Gm-Message-State: APuU4Z88MPfvFYEUdfAe06XQfBMLamxWZkmwjwsMK9STyACCMkgysFV8
	gjNyISxN1+jMghvRCmveiOLTEw3WFeUNkagHMvEUD+WPMW49MFpwkJc7VKyuLp328mc1g7ydQBy
	6IMWuuMTJ3uFO8TdXcLlHhcbrhNwL2dLkNSyWXjs1iHa/U4BhabYdbLo4Cq0UVoBUzmMayg==
X-Gm-Gg: AZFdTZcpiqkkBf3XEIrnjxk3kKyhPONuqMuXAmDiSfdkyjgbvm9ntl2e6ozTxEDjELF
	3/RBHE9Xn1nSdOvVi08pbC0Z8f4ZrWDHnXV577eVEbQfgXh+Hbre+bzF72PzY9MHGsCiQiQ8upt
	UDGK0aN5AeeVmTu1lEuUBpZTBNAxiNwh4cmt2rXyTU0da48UNiXhHsJ6ltZ0Clne1QLwpMyAlie
	3u6G6g7tCsMtJuAsU5YYza6NwqYxQ6+4S4VfjUtEzrbtvoGu4IGedI2r59SqR0gDd/kLUoE4LcC
	e6PtSG4SZgi31ZuFhowPlb+TxHniOkXZs0M/X6q9cerRE/iq/aX6Nj+4rLcWNk49LgzgQHYpzt/
	2lUJktM/4AomLo8XZdK4+TWzAeA3I8PxZ+e9aeTKktKDYZ11YWgsHgSDaqVLNwBjvXRZsXs7cMJ
	BG
X-Received: by 2002:a05:6000:2883:b0:4a7:a52f:a2be with SMTP id ffacd0b85a97d-4abb3678d88mr42566700f8f.13.1795787863425;
        Fri, 27 Nov 2026 05:57:43 -0800 (PST)
X-Received: by 2002:a05:6000:2883:b0:4a7:a52f:a2be with SMTP id ffacd0b85a97d-4abb3678d88mr42566654f8f.13.1795787863040;
        Fri, 27 Nov 2026 05:57:43 -0800 (PST)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.168.96.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c50sm46662344f8f.37.2026.11.27.05.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:57:42 -0800 (PST)
Message-ID: <edac7605937c5fd1a02458e171ddfa4d5e6c1a36.camel@redhat.com>
Subject: Re: [PATCH v5 3/4] rv: collect per-edge dwell time for per-cpu
 DA/HA monitors
From: Gabriele Monaco <gmonaco@redhat.com>
To: Tobias Schaffner <tobias.schaffner@siemens.com>, Steven Rostedt
	 <rostedt@goodmis.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, Randy
 Dunlap <rdunlap@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers	 <mathieu.desnoyers@efficios.com>,
 linux-trace-kernel@vger.kernel.org, 	linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 rpm@xenomai.org, jan.kiszka@siemens.com, Shuah Khan	
 <skhan@linuxfoundation.org>
Date: Fri, 27 Nov 2026 14:57:40 +0100
In-Reply-To: <20261127113609.650286-4-tobias.schaffner@siemens.com>
References: <20261127113609.650286-1-tobias.schaffner@siemens.com>
	 <20261127113609.650286-4-tobias.schaffner@siemens.com>
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

On Fri, 2026-11-27 at 12:36 +0100, Tobias Schaffner wrote:
> Hook the edge-stat facility into the DA/HA layer, so that any per-cpu
> automaton monitor also reports how long it lingers in each state.
>=20
> Account a transition as soon as its state change is committed. An HA
> constraint that rejects the transition can therefore reset the monitor
> without leaving an accounting window for nested events.
>=20
> Signed-off-by: Tobias Schaffner <tobias.schaffner@siemens.com>
> ---

Looks good to me, thanks!
I'm taking the series.

Reviewed-by: Gabriele Monaco <gmonaco@redhat.com>

> =C2=A0.../trace/rv/runtime-verification.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 30 ++++++++++++++
> =C2=A0include/linux/rv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0include/rv/da_monitor.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 40 +++++++++++++++----
> =C2=A0include/rv/edge_stat.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 5 ++-
> =C2=A0include/rv/ha_monitor.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A05 files changed, 69 insertions(+), 10 deletions(-)
>=20
> diff --git a/Documentation/trace/rv/runtime-verification.rst
> b/Documentation/trace/rv/runtime-verification.rst
> index c700dde9259c..ac16b5532e86 100644
> --- a/Documentation/trace/rv/runtime-verification.rst
> +++ b/Documentation/trace/rv/runtime-verification.rst
> @@ -229,3 +229,33 @@ For example::
> =C2=A0=C2=A0=C2=A0 nop
> =C2=A0=C2=A0=C2=A0 [panic]
> =C2=A0=C2=A0=C2=A0 printk
> +
> +**monitors/MONITOR/stats**
> +
> +Present only when the kernel is built with CONFIG_RV_EDGE_STAT=3Dy and
> *MONITOR*
> +is a per-cpu deterministic or hybrid automaton monitor. The file exists =
while
> +the monitor is enabled and reports how long the automaton dwells in each
> state
> +before leaving it, timed with local_clock() and accounted per outgoing e=
dge
> and
> +per CPU.
> +
> +- The first line is a header naming the columns.
> +- Each following line describes one edge on one CPU::
> +
> +=C2=A0=C2=A0 cpu edge label valid count sum_ns max_ns
> +
> +=C2=A0 *label* is "state:event", *valid* is 1 if the model defines the e=
dge and 0
> +=C2=A0 otherwise, *count* is the number of times the transition was comm=
itted, and
> +=C2=A0 *sum_ns* and *max_ns* are the total and worst dwell in nanosecond=
s. An
> +=C2=A0 invalid edge always reports a zero count.
> +
> +The counters are reset each time the monitor is enabled. A monitor that
> starts
> +on an event leaving its initial state does not know since when it was in=
 that
> +state, so this first transition is neither counted nor timed.
> +
> +For example::
> +
> +=C2=A0=C2=A0 # cat monitors/wip/stats
> +=C2=A0=C2=A0 # cpu edge label valid count sum_ns max_ns
> +=C2=A0=C2=A0 0 0 preemptive:preempt_disable 1 4210 95501200 183200
> +=C2=A0=C2=A0 0 1 preemptive:preempt_enable 0 0 0 0
> +=C2=A0=C2=A0 0 4 non_preemptive:preempt_enable 1 4208 3812900 42600
> diff --git a/include/linux/rv.h b/include/linux/rv.h
> index bf75cf2300ee..d83d1a98344e 100644
> --- a/include/linux/rv.h
> +++ b/include/linux/rv.h
> @@ -33,7 +33,7 @@ typedef unsigned int da_state_t;
> =C2=A0 */
> =C2=A0struct da_monitor {
> =C2=A0=09bool=09=09monitoring;
> -=09unsigned int=09curr_state;
> +=09da_state_t=09curr_state;
> =C2=A0};
> =C2=A0
> =C2=A0#ifdef CONFIG_RV_LTL_MONITOR
> diff --git a/include/rv/da_monitor.h b/include/rv/da_monitor.h
> index 6fc5ef8142ac..942b35428ccd 100644
> --- a/include/rv/da_monitor.h
> +++ b/include/rv/da_monitor.h
> @@ -17,6 +17,7 @@
> =C2=A0#include <rv/automata.h>
> =C2=A0#include <linux/rv.h>
> =C2=A0#include <rv/kunit.h>
> +#include <rv/edge_stat.h>
> =C2=A0#include <linux/stringify.h>
> =C2=A0#include <linux/bug.h>
> =C2=A0#include <linux/sched.h>
> @@ -105,6 +106,14 @@ static inline void da_monitor_reset(struct da_monito=
r
> *da_mon)
> =C2=A0=09da_monitor_reset_state(da_mon);
> =C2=A0}
> =C2=A0
> +static inline void __da_monitor_start(struct da_monitor *da_mon, da_stat=
e_t
> state)
> +{
> +=09da_mon->curr_state =3D state;
> +=09da_monitor_init_hook(da_mon);
> +=09/* Pairs with smp_load_acquire in da_monitoring(). */
> +=09smp_store_release(&da_mon->monitoring, 1);
> +}
> +
> =C2=A0/*
> =C2=A0 * da_monitor_start - start monitoring
> =C2=A0 *
> @@ -113,10 +122,18 @@ static inline void da_monitor_reset(struct da_monit=
or
> *da_mon)
> =C2=A0 */
> =C2=A0static inline void da_monitor_start(struct da_monitor *da_mon)
> =C2=A0{
> -=09da_mon->curr_state =3D model_get_initial_state();
> -=09da_monitor_init_hook(da_mon);
> -=09/* Pairs with smp_load_acquire in da_monitoring(). */
> -=09smp_store_release(&da_mon->monitoring, 1);
> +=09__da_monitor_start(da_mon,
> da_state_entered(model_get_initial_state()));
> +}
> +
> +/*
> + * da_monitor_start_unaccounted - start monitoring without accounting
> + *
> + * Like da_monitor_start(), for a monitor that has been in its initial s=
tate
> + * since an unknown time. The first transition is neither counted nor ti=
med.
> + */
> +static inline void da_monitor_start_unaccounted(struct da_monitor *da_mo=
n)
> +{
> +=09__da_monitor_start(da_mon, model_get_initial_state());
> =C2=A0}
> =C2=A0
> =C2=A0/*
> @@ -276,6 +293,11 @@ static inline void da_monitor_reset_state_all(void)
> =C2=A0 */
> =C2=A0static inline int da_monitor_init(void)
> =C2=A0{
> +=09int retval =3D rv_edge_stats_create(rv_this.root_d);
> +
> +=09if (retval)
> +=09=09return retval;
> +
> =C2=A0=09da_monitor_reset_state_all();
> =C2=A0=09return 0;
> =C2=A0}
> @@ -287,6 +309,7 @@ static inline void da_monitor_destroy(void)
> =C2=A0{
> =C2=A0=09da_monitor_reset_all();
> =C2=A0=09da_monitor_sync_hook();
> +=09rv_edge_stats_remove();
> =C2=A0}
> =C2=A0
> =C2=A0#ifndef da_implicit_guard
> @@ -689,9 +712,11 @@ static inline void da_trace_error(struct da_monitor
> *da_mon,
> =C2=A0static inline bool da_event(struct da_monitor *da_mon, enum events =
event,
> da_id_type id)
> =C2=A0{
> =C2=A0=09enum states curr_state, next_state;
> +=09da_state_t old;
> =C2=A0
> -=09curr_state =3D READ_ONCE(da_mon->curr_state);
> +=09old =3D READ_ONCE(da_mon->curr_state);
> =C2=A0=09for (int i =3D 0; i < MAX_DA_RETRY_RACING_EVENTS; i++) {
> +=09=09curr_state =3D da_state_of(old);
> =C2=A0=09=09next_state =3D model_get_next_state(curr_state, event);
> =C2=A0=09=09if (next_state =3D=3D INVALID_STATE) {
> =C2=A0=09=09=09react(curr_state, event);
> @@ -699,7 +724,8 @@ static inline bool da_event(struct da_monitor *da_mon=
,
> enum events event, da_id_
> =C2=A0=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 model_get_event_na=
me(event), id);
> =C2=A0=09=09=09return false;
> =C2=A0=09=09}
> -=09=09if (likely(try_cmpxchg(&da_mon->curr_state, &curr_state,
> next_state))) {
> +=09=09if (likely(da_state_try_commit(&da_mon->curr_state, &old,
> +=09=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 next_state, event)))=
 {
> =C2=A0=09=09=09if (!da_monitor_event_hook(da_mon, curr_state, event,
> next_state, id))
> =C2=A0=09=09=09=09return false;
> =C2=A0=09=09=09da_trace_event(da_mon,
> model_get_state_name(curr_state),
> @@ -752,7 +778,7 @@ static inline bool __da_handle_start_run_event(struct
> da_monitor *da_mon,
> =C2=A0=09if (!da_monitor_enabled())
> =C2=A0=09=09return 0;
> =C2=A0=09if (unlikely(!da_monitoring(da_mon)))
> -=09=09da_monitor_start(da_mon);
> +=09=09da_monitor_start_unaccounted(da_mon);
> =C2=A0
> =C2=A0=09__da_handle_event_common(da_mon, event, id);
> =C2=A0
> diff --git a/include/rv/edge_stat.h b/include/rv/edge_stat.h
> index 8b99e8520e1e..16c28aedabdd 100644
> --- a/include/rv/edge_stat.h
> +++ b/include/rv/edge_stat.h
> @@ -145,7 +145,10 @@ static void rv_edge_stats_remove(void)
> =C2=A0=09rv_this_stats_file =3D NULL;
> =C2=A0}
> =C2=A0
> -/* A zero timestamp marks resets, which can run on a different CPU. */
> +/*
> + * A zero timestamp marks an unknown entry time: resets can run on a
> different
> + * CPU, and da_handle_start_run_event() starts in a state entered earlie=
r.
> + */
> =C2=A0#define da_state_entered(s)=09da_state_pack((s), local_clock())
> =C2=A0
> =C2=A0static __always_inline void
> diff --git a/include/rv/ha_monitor.h b/include/rv/ha_monitor.h
> index 6e1c7fe5449a..78d1bb80aefd 100644
> --- a/include/rv/ha_monitor.h
> +++ b/include/rv/ha_monitor.h
> @@ -312,7 +312,7 @@ static inline void __ha_monitor_timer_callback(struct
> ha_monitor *ha_mon)
> =C2=A0=09if (unlikely(READ_ONCE(ha_mon_destroying)))
> =C2=A0=09=09return;
> =C2=A0=09/* Ensure consistent curr_state if we race with da_monitor_reset=
 */
> -=09curr_state =3D smp_load_acquire(&ha_mon->da_mon.curr_state);
> +=09curr_state =3D da_state_of(smp_load_acquire(&ha_mon-
> >da_mon.curr_state));
> =C2=A0=09if (unlikely(!da_monitor_handling_event(&ha_mon->da_mon)))
> =C2=A0=09=09return;
> =C2=A0
