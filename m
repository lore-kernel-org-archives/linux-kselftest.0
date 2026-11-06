Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793932912;
	b=SpPrtPIU8J4iSxxDmvBaQcsYe10RUj6kuRIBtBZ14dk336QL/wzaGg00M76ZPGdiGRo4
	 JEf9gpQ9k+3nihJW3s9o7k7PVknK6vrKAQMU74K2ZijzEFOpoD1xRCpEx0MYnb4dGpSRY
	 /ZV4bkgozUkjNarURfya9Gy1uqnviCJOzkj7whFP/51Cd0r3fqATDOtbWJDJ/JpusxU6M
	 3RyVInVbAhvRAZ0RnOp5IO+xyzdNkMzV8YDvMCaO1oFHZTRaBw+TRtiZcG6igPG4VzaN8
	 bdhg4QSIyJGziGVOYyhVXTV1jnrm1pzPk8ywSTscDjLLQ00Py/cb7HdVlp92hhn4hxQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793932912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rXPT9ftSD1W4Pls/uGVHMwPU27w36zSFUh8Oy468MZ0=;
	b=gdN5f7sI+nwyTLeNRb9Bcc8jtyjHk6x3tcBOxLBFcjymizgD/IPXGxKoDkFmm3EzGAtw
	 h2DMd1OVcz09mXpdU1yCfTt7OarIIJwO5yZylnh9yX0kRLV/xeEiWxG+DZNVgpP3hklpr
	 d5DwOJOMEQQOXq9HFTAZXQMaA67Ob3qefMsTaMqVcQGASYMQKNO5TuiDQ6qJau1q0zmR1
	 CzYiso/wPOf6yVwGGDc5HoTlW2v9H2cgUvfRZZoZ6owT0Taqy3y2KER7q6ikhYosrzLSN
	 +d87tI/3BGv3SqVv+5SwkJrRraK0piDlvK7xFyRUZF3zjR1qX9+SF2jMcw/e8ToBorw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NRSk5lqN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BAB1606A329
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 02:41:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BAB1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NRSk5lqN
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso156141f8f.2
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 18:41:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793932910; cv=none;
        d=google.com; s=arc-20260327;
        b=eA0FUy8vS3yuOvNw4XBshdaMPQS2FWDhtoq/knk/rOR2PhtX9q/BpGAfToF36pfMes
         rg5jNpyK/mCUO8LghHGkZQVUAS2mytru7fHhsqDnTX2Upw1Xg2TUrHXaCRCR1fjq9dwy
         Pv0sSX5LRZWcxx/pf6mRRErcM0tIj0Uh0X3yci5556b4OBHDzHggJeZheG/kVk2TPByX
         aPDZlxJVCJTBR3mDKOf35XLB6LfeqJ0xXRSI68ANIA4TPK297m43VJFTOwUfHkKmjw4m
         2I6UzEsvW2OVUqAkxNmiFVS5jC2TeCkSwBb3qrz0+ZFC39hqNeWR4WbWewYP3Yv3bIMK
         65Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rXPT9ftSD1W4Pls/uGVHMwPU27w36zSFUh8Oy468MZ0=;
        fh=E4dT9KkoKG97RjPt+1k+qesG0EQdbS0+SQGdUOCHEBU=;
        b=rCDQMDD/kaY6icaRFWfXgB62q4b51k0xREYfBeja0tQeFb9TUFFeBiL7YoPtcl1WNh
         CpcCCdikYT+gLkm/dF6rcGZ0pOO7Ws4j1zndzyWghqAJQXf0LGM09b8Ta+DTgfIcLraA
         U7Y1PhlYVTnBLTNWNpGK3WNfpi7EvW069yJxar79JLnzX6O/wHTaTVaDrlROi1relAuq
         OpSZWvZWQRI3DjQ3W8v5G7IgDGhVyc7gK7qq3BH3xCdrdtzBn1wsdYlcC1os6VxsvQds
         rAjbabNlRjlAqJw24foLT0WbexO8PqNYh5mY//p/MxMGcjelBQYIR41U/ekceBr7RZNl
         w8Qg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793932910; x=1794537710; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rXPT9ftSD1W4Pls/uGVHMwPU27w36zSFUh8Oy468MZ0=;
        b=NRSk5lqNe80aQecN8piJscSed2+4dtCYF9cGKNuDh3/Ps2IsTNKGDK0qxR3Ll2RHQN
         wJSBtjwUVLEnQYuobMm18u8tV1W6vuW7HlIVYLU1QhRckCEwhKSJneuJ15I/923U8H+1
         5zCzKUBMJDwAercoUth0AkAAHtDsSQVIcusHk1QTTZVyHXmlR3/KDCgdjbcIMkPKfBVn
         0vVsedn4fTjRLwtQKkjKzph/kJhi0E+M5N8jRlNrTsYUf/u4mYkOBxz8xg/SIbK9XgXv
         3HzEyd2rUKbDT9HV6yzVwcHhcwlj3kLSDIMfLFb6nBw5ePVFDceVrelnSpGWxmV+zcWq
         fwrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793932910; x=1794537710;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rXPT9ftSD1W4Pls/uGVHMwPU27w36zSFUh8Oy468MZ0=;
        b=p58Tgd7w8DaNR614w8DHLF3P504vU6nB7bRuptnu6pu3s4VVqF159RQQwZN+mlM3di
         y+HKbqKRh8VIFZqSuARq6MGmQTfS0sLJA08Uu9kKJUmOt8gzAWSm7RWzFkOGlYzrpxZC
         OXEON4xKkKWpJKWW83EC7YhornT0HIcyTUoaRCd+K608lbaphBwAfgK0MfzAyfsF7/vy
         /mW3kUxavw8HVuOGOEr32m/2USjkaFiLDYYpyO0auJN4BXJNwIPWD05i3xMidnZ5o51L
         ZPonPMvn8UQNzn9Us5O3i3Gm7S+7HU9ixTZ6IQ/qdGSEs4OFH/LGaJ0dZwMnBUBhWKj7
         J5kw==
X-Forwarded-Encrypted: i=1; AKwUvBxSrljI7TSUqwdRhucD9LW8UDPIXESt+XZ5EE79v0TdP9lsbQWUDnotw5vhM/wV2aM6nxC144NTANOS6ymnBTs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SBvmNu0Jba+VjS8d093HVymMWk26YsOoHil8gCo7jGPm34hAl
	F+/m7Hi4NFdVLx4II/3NQyd+/PTOfQzHT7qRNU3VxW5/nvAbo9u2+I5vbS3bBKwDuVT3i6iPnko
	9tb4ukcmg1Ir603CFeoLEg8823S6O11k=
X-Gm-Gg: AYBFou3sxBmSqm55PC4Seii377WPl417bpgInN7TCmtWPHZhtjO8q/Yrk47kRkHYsCo
	PQIiinDlJELddwSC98K7URraSCDcNkWJaNPLHu/dBRdnMPvDevSXrz1L6N0kcw1kKHaxK6z0zSh
	H8L9FXo7XuRCLTbcb9oehqxed6hiSQOGP0/ZIGZsh1ZFm5m1NUjY2WOmKNnNe/8EbRDDN/cg0TW
	hSA/RMhCjuw7e07mZxV2JuujbM4AxQclOhxK3sUu848+gkE0aYueOe4DpXllHur5PT5bQAO1WVQ
	V9M6bDtsHUm8IGQGBx57gS+DGy4Q5jOCEAoT5sB6hjZl6zZ0H89sAfhUoL5/Q+/eDULhzFExsrG
	0U3B555W8JkdyUa68pY8VyMxHYSk7ZMBoZzIEFGImxjUFoeDbd81c4jKbmCs=
X-Received: by 2002:a05:600c:4f13:b0:4a1:d8fc:8165 with SMTP id
 5b1f17b1804b1-4b6de1c645dmr14873335e9.20.1793932909304; Thu, 05 Nov 2026
 18:41:49 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261009160010.1829642-1-kunwu.chan@gmail.com>
 <20261009160010.1829642-2-kunwu.chan@gmail.com> <20261012104208.GQ4121339@noisy.programming.kicks-ass.net>
 <CAN_Opa9S2ObHYqa+w5Tqh8PFPRijo=iUZDk97aCYmNZT_75yVQ@mail.gmail.com>
In-Reply-To: <CAN_Opa9S2ObHYqa+w5Tqh8PFPRijo=iUZDk97aCYmNZT_75yVQ@mail.gmail.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Fri, 6 Nov 2026 10:41:37 +0800
X-Gm-Features: AclHuK8qaZa9j-EaRF6SECEA-dJP4xeAumfQIepVXAc0Je3LqIVzsucrbjhA_sM
Message-ID: <CAN_Opa96ww9yOwDVOERLkrByxMU6Dha9f5=i2vFjAWSr4hvUYg@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] perf/core: add AUX buffer ownership for kernel events
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, acme@kernel.org, namhyung@kernel.org, sj@kernel.org, 
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
	irogers@google.com, adrian.hunter@intel.com, james.clark@linaro.org, 
	akpm@linux-foundation.org, lianux.mm@gmail.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, wangkefeng.wang@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 5:41=E2=80=AFPM KunWu Chan <kunwu.chan@gmail.com> w=
rote:
>
> On Mon, Oct 12, 2026 at 6:42=E2=80=AFPM Peter Zijlstra <peterz@infradead.=
org> wrote:
> >
> > On Fri, Oct 09, 2026 at 11:59:48PM +0800, Kunwu Chan wrote:
> > > Add an in-kernel AUX owner reference and setup/release helpers for
> > > kernel-created perf events that need an AUX buffer without a userspac=
e
> > > mmap.  The setup path validates that the event is a kernel event with
> > > no parent, rejects non-power-of-two page counts and negative watermar=
k
> > > values, allocates the perf buffer and AUX pages, records the kernel
> > > owner, and attaches the buffer under the same lock.
> > >
> > > perf_event_release_aux() stops AUX writers, frees AUX storage, and
> > > detaches the buffer, in that order, matching the AUX teardown orderin=
g
> > > of perf_mmap_close(): perf_pmu_output_stop() walks event->rb->event_l=
ist
> > > and rb_free_aux() must run while the buffer is still referenced by th=
e
> > > event.  The single event->rb reference is dropped by
> > > ring_buffer_attach(event, NULL) itself, so the release path does not
> > > put it again.
> > >
> > > Both functions run under event->mmap_mutex, the lock that already
> > > serialises ring-buffer attach/detach transitions for an event:
> > > perf_mmap(), perf_mmap_close(), _perf_event_set_output() and
> > > _free_event() all hold it around ring_buffer_attach().  Concurrent
> > > perf_event_release_aux() callers therefore go through the same
> > > serialisation point, and a second release call, or a release of a
> > > buffer this API does not own, is a no-op.
> > >
> > > Keep aux_mmap_count dedicated to userspace mappings.
> > > perf_aux_output_begin() accepts a writer while either a userspace or =
kernel
> > > owner remains, preserving the existing teardown ordering.
> > >
> >
> > > diff --git a/kernel/events/internal.h b/kernel/events/internal.h
> > > index c03c4f2eea57..760b7659ad87 100644
> > > --- a/kernel/events/internal.h
> > > +++ b/kernel/events/internal.h
> > > @@ -48,6 +48,12 @@ struct perf_buffer {
> > >       int                             aux_nr_pages;
> > >       int                             aux_overwrite;
> > >       refcount_t                      aux_mmap_count;
> > > +     /*
> > > +      * In-kernel AUX owner reference, set by perf_event_setup_aux()=
:
> > > +      * admits writers and ties the AUX teardown to
> > > +      * perf_event_release_aux() when no userspace mmap holds the bu=
ffer.
> > > +      */
> > > +     refcount_t                      aux_kernel_count;
> > >       unsigned long                   aux_mmap_locked;
> > >       void                            (*free_aux)(void *);
> > >       refcount_t                      aux_refcount;
> >
> > This doesn't make sense to me. If the even is a kernel event, then ther=
e
> > cannot be mmap users, so adding another refcount is just for giggles?
>
> Hi Peter,
>
> I added `aux_kernel_count` to keep `aux_mmap_count`
> specific to userspace mappings. The two paths have different
> teardown responsibilities: `perf_mmap_close()` handles mmap
> cleanup, while `perf_event_release_aux()` stops AUX output,
> frees the AUX pages and detaches the buffer for a kernel
> consumer.
>
> `perf_aux_output_begin()` checks both counts so writers are
> admitted while either owner remains.
>
> Would you suggest a simpler approach here?
>
> Thanks,
> Kunwu

Gentle ping.

On your aux_kernel_count question: the separate count
is for teardown, not admission control.

When aux_mmap_count reaches zero, perf_mmap_close() subtracts from
mmap_user->locked_vm and vma->vm_mm->pinned_vm before calling
rb_free_aux().
A kernel owner has neither of these accounting requirements.

Reusing the count would therefore require either branching in
perf_mmap_close() on owner type, or duplicating the teardown in
release_aux().
Keeping separate counts lets each side handle its
own teardown without needing to know about the other.

If you'd prefer a single count with teardown selected by owner type,
I'm happy to rework it.

Thanks,
Kunwu
