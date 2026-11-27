Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795768062;
	b=bWfYHwQAYKK1N8hDH4YdQ0asGOBSxRdjDcyTWzwuqSFTha+MNy7fSi8YhNfbFoJrZH1l
	 i6izhZBuYQgzG+OgO/nPBYHi8raXElsXY5/+d/8ZBUA+qrJV/IuT9pilbMBCfyendyoSe
	 3N7+12kj24jh8NL3PIpI0mOHfeO9BPrrP9aYqJnxLTsat47huBdycNyNsGllp03hI0voj
	 107H5f6H/FSQtGWHXei8rK5UyEVXCU32YF/Huv/yaXwGtIVG98/mn94Hgr1HwGgxdA+Zx
	 ecslJ+trsWOH2WLChrgyeR4SCmgZmW0vbqpH7nkz6v0iDkFX2bI5I4LufPAbL+ABr4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795768062;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Autocrypt:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=SxaqJRgRU9lhQE08/YFU2De44zTG7wSWXgQ5bbce0Pk=;
	b=t0CW0ra2QWUyeIT3aBg0FP7S2j2g39YxNREvcoxVwmCOMZ4P/4Yx0v8YCInSx9JI8ksF
	 DZNtK8gm3XZb7oSQhfcU/DPsf2VY91ass2FTRKJyZsJAab4fhgFkDyztwsY/PjHGY6VpX
	 w+B/dJHMvEUFAcuK7TfIsDsTvd1qqQPt/HswLKWSkahuFShjhSfS61y4HEqT4OoBFHgLZ
	 EW7EEOTjvmCjyknpgNHz1dLB9cCpKJMnk3f1+dg0vqkfHV5FzBKbUpQxn3uX2y4XMRauH
	 dX/59+BkNduLZzwsDDEkAttH5NvFlr+4x9MKNn/DVC6Cxpkg8TzO3j6AXkuK6ZcHmoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EAdjWA9a;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=XViJCix4;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0D5606A321
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 08:27:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A0D5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EAdjWA9a;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=XViJCix4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795768060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=SxaqJRgRU9lhQE08/YFU2De44zTG7wSWXgQ5bbce0Pk=;
	b=EAdjWA9aPa+p5Z11ox/bI7IlIIVpIFIGYHevkGuXIyU9wrhZ2iwv1V6utsFfHzYV2e6le7
	hkP3gNbMAI30KZlgf6vwAUFl4ftnBs8joFh78c3A/Xm3uqksErpzt2V+8W7tL4XGMKcR6Y
	fNmZltIN5eQTDPDO6YzO6QQElKQOpHY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-48-9j09dSA5NISj-MfCdkvb_Q-1; Fri, 27 Nov 2026 08:27:38 +0000
X-MC-Unique: 9j09dSA5NISj-MfCdkvb_Q-1
X-Mimecast-MFC-AGG-ID: 9j09dSA5NISj-MfCdkvb_Q_1795768057
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a1f03f2e8aso68053525e9.1
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 00:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795768057; x=1796372857; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SxaqJRgRU9lhQE08/YFU2De44zTG7wSWXgQ5bbce0Pk=;
        b=XViJCix4Lit2FrWSfURaRWvQ4s8fMxUzboCDkqBYcjW1JlXA+XfTIghHWKRny9ITaa
         Bk+vXor7lIbpnk6+qwKzGVtyPsOi/tDBAMoishNEgbs8/LgKXct56hohtPDyO88pwXqK
         aLekpvvd140T1rGqyGVgDNW9E5Vwcac+33xEASa7PUirDhXzAf2ldM2fdaBA6JP95PIk
         MdOYMkiwd5xtPrhrk7z3TkFBsH505oYDb6eFkeOzNMinWpzcjYI3Lm3WO29rtkDl+tAk
         UBh/ziQTTrCLn8RJaXM0cARB2AZtHpcJqHFk8KIEdR20kYuT+zoh0+Nv+7x25bPxGL23
         5UMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795768057; x=1796372857;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SxaqJRgRU9lhQE08/YFU2De44zTG7wSWXgQ5bbce0Pk=;
        b=aexKfSXP3tQPjq3xMMQbE/osS8pt69n/X+WbRIlOS7gqEHFrjE/MZHiQCqiUDrrREQ
         m/DbdBy1xKaGozBbjyYlalp1rRhF+t4pnwQj9UGKlMUhn5rA5ZBqqNxqj2XM6tbgg2J0
         gDHGbOMaLU3gMnTUUmzLBWXac2qBwEkTzcHndBbJmvuRg/0pITI42+9+oqvOy4lV25HN
         NRFilXS4afpj8a1pDNwEoibikvkQ1SBQK/9y8S9qg4rbC+LUR181KgeUToDgYBRyPfBu
         cuKHuAoYpvSP8gfuvBRABIZ5H+eFyDUWFJGnf7l6QldvxuOMCuYYLjZE3luIzEvbYXt5
         8Nzg==
X-Forwarded-Encrypted: i=1; AL+hErFo4Pc7k3cBxPkgXcRTIwFrJRaYAE74wEGmU6PHe8rL+3HJd1vUG7aVa6/Tvo5mqK/m66FW9kXZbkwLZKvo0nI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JT6Pf9zXlPfPKSVRprDvV6yaz27NPZw4G7LrProF3o/aMSKJP
	AtjEp4uHGKUdkaOPwBESXpgkLeBZwCBF3a/aCWdpeUUgPRaojxpzeTEBR3hcXgGNfvGOLdrWsJM
	+6ws0v51pnV5FMWRxOVhJNp9aXi2eCSQeNW08rtgUYyEYPo7gatp8Q2IyrFuAU4NNT0LfCQ==
X-Gm-Gg: AZFdTZe7ZzdxxxfAdE/SRjQnbrggdBFFUvmFyeJw5LsAmA+A1e8I9iUe2TebpNLUKko
	D3+T1xaMekGORqEzJsnxukGjWC/2ZR+TRMcb4G7xTFNiX+/FraWVduft9nS2k+dZ/zkuA8XXi9o
	hDL0zzWr3UsEdkRW/jweBW9+kbpy561Da8HQ/KWIuirHzrmNjIS0PZjxyK/oQotEpdynimxiEm/
	KlznnMwPYEAb9/XzHIekkOsmZrU//VDq3RJY81gP2OD8xVf5c5MYVG7sLWge1gL7Ey4+LWeTuXy
	ouvafwJoXS+s7XOIfPtM3a7DOXKu9GRiSGk2KOaAGYJg/I+P/6wKNbbprbjS9RPItdC2X+tBMcH
	wx6GvYFkdZT+7iovTViv9fZtV0CD96bNkMeRXvxaPLyf2H/boHS4Po8+hkCfrYGqnETxrw2tApR
	Mx
X-Received: by 2002:a05:600c:3b94:b0:4bb:6f41:39be with SMTP id 5b1f17b1804b1-4bb8880ca3cmr589964465e9.15.1795768057007;
        Fri, 27 Nov 2026 00:27:37 -0800 (PST)
X-Received: by 2002:a05:600c:3b94:b0:4bb:6f41:39be with SMTP id 5b1f17b1804b1-4bb8880ca3cmr589963995e9.15.1795768056658;
        Fri, 27 Nov 2026 00:27:36 -0800 (PST)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.168.96.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bbab390cf5sm180472695e9.7.2026.11.27.00.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:27:36 -0800 (PST)
Message-ID: <6ee9fd02caec10b09c8f25913a2c0e619f5dd4e7.camel@redhat.com>
Subject: Re: [PATCH v4 3/4] rv: collect per-edge dwell time for per-cpu
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
Date: Fri, 27 Nov 2026 09:27:33 +0100
In-Reply-To: <20261127070545.64265-4-tobias.schaffner@siemens.com>
References: <20261127070545.64265-1-tobias.schaffner@siemens.com>
	 <20261127070545.64265-4-tobias.schaffner@siemens.com>
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

On Fri, 2026-11-27 at 08:05 +0100, Tobias Schaffner wrote:
> @@ -110,10 +111,11 @@ static inline void da_monitor_reset(struct da_monit=
or
> *da_mon)
> =C2=A0 *
> =C2=A0 * The monitor will ignore all events until monitoring is set to tr=
ue. This
> =C2=A0 * function needs to be called to tell the monitor to start monitor=
ing.
> + * @state is the initial state, stamped with its entry time if known.
> =C2=A0 */
> -static inline void da_monitor_start(struct da_monitor *da_mon)
> +static inline void da_monitor_start(struct da_monitor *da_mon, da_state_=
t
> state)

So the idea is that monitors using da_handle_start_run_event() would end up=
 with
a few nanoseconds more in their initial state instead of a 0. Right?
Maybe more if preemption is possible.

I don't particularly like changing the prototype of da_monitor_start(). It =
isn't
used by existing monitors, but is a public API, so I don't want to send the
message that monitors can start from any state.

We could either:
1. document this timing discrepancy and live with it
2. reset the timestamp just after da_monitor_start() (done only once)
3. create another da_monitor_start_notime() (can share code in a
__da_monitor_start())

What do you think?

Thanks,
Gabriele

> =C2=A0{
> -=09da_mon->curr_state =3D model_get_initial_state();
> +=09da_mon->curr_state =3D state;
> =C2=A0=09da_monitor_init_hook(da_mon);
> =C2=A0=09/* Pairs with smp_load_acquire in da_monitoring(). */
> =C2=A0=09smp_store_release(&da_mon->monitoring, 1);
> @@ -276,6 +278,11 @@ static inline void da_monitor_reset_state_all(void)
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
> @@ -287,6 +294,7 @@ static inline void da_monitor_destroy(void)
> =C2=A0{
> =C2=A0=09da_monitor_reset_all();
> =C2=A0=09da_monitor_sync_hook();
> +=09rv_edge_stats_remove();
> =C2=A0}
> =C2=A0
> =C2=A0#ifndef da_implicit_guard
> @@ -689,9 +697,11 @@ static inline void da_trace_error(struct da_monitor
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
> @@ -699,7 +709,8 @@ static inline bool da_event(struct da_monitor *da_mon=
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
> @@ -737,7 +748,7 @@ static inline bool __da_handle_start_event(struct
> da_monitor *da_mon,
> =C2=A0=09if (!da_monitor_enabled())
> =C2=A0=09=09return 0;
> =C2=A0=09if (unlikely(!da_monitoring(da_mon))) {
> -=09=09da_monitor_start(da_mon);
> +=09=09da_monitor_start(da_mon,
> da_state_entered(model_get_initial_state()));
> =C2=A0=09=09return 0;
> =C2=A0=09}
> =C2=A0
> @@ -751,8 +762,9 @@ static inline bool __da_handle_start_run_event(struct
> da_monitor *da_mon,
> =C2=A0{
> =C2=A0=09if (!da_monitor_enabled())
> =C2=A0=09=09return 0;
> +=09/* In the initial state since an unknown time: do not time it. */
> =C2=A0=09if (unlikely(!da_monitoring(da_mon)))
> -=09=09da_monitor_start(da_mon);
> +=09=09da_monitor_start(da_mon, model_get_initial_state());
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
