Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DA94F4755
	for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 09:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791970910; cv=pass; b=h94XKY659UH5IFJtllSDuqLM1Utr8HlZLKwCC/yhp2bQaC/R/LNnOXF2edBFYBfkAp38WF6+vAQX9eozvx6Rdqk4hVRsUe650mp6E4FPpz1oJnESVpSjS0PEp7F08DDF0p0ydYkE6lDVIMmJPULFc9MWS0qaBSVf37qYW36MSQ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791970910; c=relaxed/simple;
	bh=FynELwXkhKh2itHTcxydPaQuuhTlrVIIDBXZCdEL7HU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lj+3MLr+rYg9jSNy4HOhFoLlWMGizTypNOrkaxWWgNjzF0iAUzciFqy/YyG2/VhyR+m5rFSDnHwQ0WHzL6+rWvEapOpn0Rg5nDjNrfRc0NwCpXG0gB2Xmjl7Tb80WPeWCmQn3fF6fTtDl0yOc14KVAyds5Z5QSRgW/4Bg0Ny9Eg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nI4KvZc3; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nI4KvZc3"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48c45111bebso2331560f8f.0
        for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 02:41:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791970906; cv=none;
        d=google.com; s=arc-20260327;
        b=FFm2N2X1q51Cb6EqQc+HBykK3/pUShhHgorYtF9R35y1Z0UnvCJrWQvM6s/IwtbHtf
         8bUK15/+08tU9GrD4V8szif8/jHbhp7AcZrnI2fdquZPFIo525ndv7zNkurLG2m4b7lu
         nsY7KVn+DOUpJKSkG1qD5MOEn69ytdR4i/p3gI/BFdq2hc9xHzS5S9lR1o/KP6j9tUi0
         /qjxltTyfqRJu+Pau6K8kYQElwUJWpUcmUJ/Y6ZQGY8IYHywvmSUnH45ZM03YFXCAIxB
         miFi/Rg6ZTiagmtcKa6yZE4JHCXhCA4Xu4dBBbTcmsTVjRkWcVslwRc15IoPYFHCIi3E
         tSwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2p4Z2JkR9dHbrsrZ95OJ/nzHuSiRvbg2M5uH9KBvC8s=;
        fh=7wu4FG+2iGOlSZjCFuLMMyKw6GY05JJXq9vYgR+ML9I=;
        b=kgoQIIMsF0yIvZCI/tasp3VwPOB18ldkXDYNUElnRHwVW1Vsiw5Uh4Z2BR+dqWGXqU
         sx+o4zV1Pc1Pi78NjdWo4TIrA9Hd2LbsKYJQjEJQaQsj9TANUN8lvtzMXm0wtUOjDouB
         LX/hQ00z+sgV8+hdLasRHypSHCDIe0+wJBTyzlB25KakVdecjuTG7duYS9SCRKOLvlwa
         ALDU9GiWOqV8q5F9clunLdae4URLrm0ciEejOlD0KVUjTac5LjWbcztXfC+HWgvJVvmu
         WSR5IbB1gCApkUSYVPDivifwP1Iqq4Fz2P8bIMf5gXgh6c9hzFeG1qiI0vk0Nw3Tb7vC
         nVqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791970906; x=1792575706; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2p4Z2JkR9dHbrsrZ95OJ/nzHuSiRvbg2M5uH9KBvC8s=;
        b=nI4KvZc3UF7lDtCjY94ErSR/gv9Ha9fkIxXGjizSvz2KW/vVVuIU2ruicqulB+rPQw
         PvrFLuJjMr31E2kxT9K3AEAxl1kxuTVT27w64xRehKhyGXczTHUTIi/WfL142hGQ71pF
         rfTBKdLja3xVatX9YwsOGwlHhpQWRrczEs2d6tTENUWu3DnCBl37dtZsSl4AaBXUTI3D
         LSKvDeD8cfSbdd+g8BEqIftq/ti8ev+YWqM5TY4EHUGEHW/A2/F7BbCCLBJw+nHrYKmm
         Ie1wDPIh0YDzbGURNh9ONxxSDdRZUzhV8mnTaUBqoaVkEb3p1xF41j1Dl+mVpjkKh/Mj
         6iew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791970906; x=1792575706;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2p4Z2JkR9dHbrsrZ95OJ/nzHuSiRvbg2M5uH9KBvC8s=;
        b=WB34GDQqrESv7rUafseaK+WHyR41bQifDCYk4Ei0uyoINfTN3jTD0bGWcdOceuwRNl
         HV9s+1zH3HQvxrHQt9EkZ2GmZHl5CLzcWThibvDjelQyvomSu+eIEfQRaEMhKDbOZjWZ
         elHYLTKq2srPzDtVGWjdWkZAwk88fo+hfrOvOfEPjLQCk8VEQCEfhspIFhO/INRdeM+l
         T4wilRBslMHHRCt5jRK4dUSLMXXxQ3rj09U4b5kXLsoUCPDUHcDgzxcVExlQGvR+ALIa
         Uqg+ZupGaSilAshU/TTbJlsMDu0an7CvLpKOONEkNfuEWqdFRTDPtBOYjtu+0UFH22ti
         LDpg==
X-Forwarded-Encrypted: i=1; AKwUvByRYgMk31EPhuOwHnifgU280uO94vrTAtShYCTpyz4BI6QFeCqanIge4luFMIhdZ4MB9Ev4QFurT1pdMETSQz0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKzrs+F2bQh5OnMFsi7GP2m6JYYWofjYggn8/8dilTlXJmIrLly
	Q5/dkkqaq5nMVdIuM7bso8x12XuEXNLkgZ/DqIBFBv+gLeUveVt67mf6xWpDkasOS9p5dtCYjl2
	VJci2vaDrzPhyUdDjSkg2IEowB2nIZqA=
X-Gm-Gg: AYBFou2JtezUboFeg1KBqbhpoXC7d1F3pdi1sIdCo+vVNnpMoA8eOdq2I2C12IetXH1
	chb9FQxAEt5YW9pyJNW1HfEVTaHYFahVZZBd3ru12q6e930mVg2m7C2WBikJJ+OEfnqAm+XIAiS
	guNe2vWg2aL/f5QTxZC4gsmHc1RKfYEGZDI2yyZVsqDOF23bej8qzcSon7bFpcXdeeKWCRuYx0y
	TuRq6PmfiYwtMvuZCAw3QYp1mR3lHZtAE+AlL8U12a4CwQ3UlmOdfVl27VWAvg8iWWi28a8njW5
	5iYxku4TbR3sgPNwrTFaFFEMqtOnWhTe1LpE2m41oCy7Ei+Lp4cJeAhF
X-Received: by 2002:a05:600c:3e8c:b0:49e:6861:50f7 with SMTP id
 5b1f17b1804b1-4a18e49d251mr279042395e9.5.1791970906575; Wed, 14 Oct 2026
 02:41:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009160010.1829642-1-kunwu.chan@gmail.com>
 <20261009160010.1829642-2-kunwu.chan@gmail.com> <20261012104208.GQ4121339@noisy.programming.kicks-ass.net>
In-Reply-To: <20261012104208.GQ4121339@noisy.programming.kicks-ass.net>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Wed, 14 Oct 2026 17:41:33 +0800
X-Gm-Features: AclHuK8EhRdW1XB1lFhOOYtmbgRqEKuTBOCJoFE4a7nuDqVAjVQ67OjCxQHb4BE
Message-ID: <CAN_Opa9S2ObHYqa+w5Tqh8PFPRijo=iUZDk97aCYmNZT_75yVQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] perf/core: add AUX buffer ownership for kernel events
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, acme@kernel.org, namhyung@kernel.org, sj@kernel.org, 
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
	irogers@google.com, adrian.hunter@intel.com, james.clark@linaro.org, 
	akpm@linux-foundation.org, lianux.mm@gmail.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 6:42=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Fri, Oct 09, 2026 at 11:59:48PM +0800, Kunwu Chan wrote:
> > Add an in-kernel AUX owner reference and setup/release helpers for
> > kernel-created perf events that need an AUX buffer without a userspace
> > mmap.  The setup path validates that the event is a kernel event with
> > no parent, rejects non-power-of-two page counts and negative watermark
> > values, allocates the perf buffer and AUX pages, records the kernel
> > owner, and attaches the buffer under the same lock.
> >
> > perf_event_release_aux() stops AUX writers, frees AUX storage, and
> > detaches the buffer, in that order, matching the AUX teardown ordering
> > of perf_mmap_close(): perf_pmu_output_stop() walks event->rb->event_lis=
t
> > and rb_free_aux() must run while the buffer is still referenced by the
> > event.  The single event->rb reference is dropped by
> > ring_buffer_attach(event, NULL) itself, so the release path does not
> > put it again.
> >
> > Both functions run under event->mmap_mutex, the lock that already
> > serialises ring-buffer attach/detach transitions for an event:
> > perf_mmap(), perf_mmap_close(), _perf_event_set_output() and
> > _free_event() all hold it around ring_buffer_attach().  Concurrent
> > perf_event_release_aux() callers therefore go through the same
> > serialisation point, and a second release call, or a release of a
> > buffer this API does not own, is a no-op.
> >
> > Keep aux_mmap_count dedicated to userspace mappings.
> > perf_aux_output_begin() accepts a writer while either a userspace or ke=
rnel
> > owner remains, preserving the existing teardown ordering.
> >
>
> > diff --git a/kernel/events/internal.h b/kernel/events/internal.h
> > index c03c4f2eea57..760b7659ad87 100644
> > --- a/kernel/events/internal.h
> > +++ b/kernel/events/internal.h
> > @@ -48,6 +48,12 @@ struct perf_buffer {
> >       int                             aux_nr_pages;
> >       int                             aux_overwrite;
> >       refcount_t                      aux_mmap_count;
> > +     /*
> > +      * In-kernel AUX owner reference, set by perf_event_setup_aux():
> > +      * admits writers and ties the AUX teardown to
> > +      * perf_event_release_aux() when no userspace mmap holds the buff=
er.
> > +      */
> > +     refcount_t                      aux_kernel_count;
> >       unsigned long                   aux_mmap_locked;
> >       void                            (*free_aux)(void *);
> >       refcount_t                      aux_refcount;
>
> This doesn't make sense to me. If the even is a kernel event, then there
> cannot be mmap users, so adding another refcount is just for giggles?

Hi Peter,

I added `aux_kernel_count` to keep `aux_mmap_count`
specific to userspace mappings. The two paths have different
teardown responsibilities: `perf_mmap_close()` handles mmap
cleanup, while `perf_event_release_aux()` stops AUX output,
frees the AUX pages and detaches the buffer for a kernel
consumer.

`perf_aux_output_begin()` checks both counts so writers are
admitted while either owner remains.

Would you suggest a simpler approach here?

Thanks,
Kunwu
