Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1824C3806DD
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 08:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776759786; cv=pass; b=YENb9PGgb0a0hNVeeM4yVRVcFl6UnoJ6E1byjQ2kI8R6+eZCNxhvPclgE6bXopP1iF7DziGVKfaVqGycQrub3+6ag9iysMH1PmEfiqgwkTC+K/kG1Qj0eLIWaCpOFHfvfR3n2CoenuM9F7mKf0h7/Xccb9kwbgCXNcfcwaE65Fs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776759786; c=relaxed/simple;
	bh=YXsq+eTjp6PfgKOLcqibqNhRl00jcw3DlYSDPaUZdgo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QFxeEBnWWWs+KFt0jBa9SEjHKUKgW4SQbwqFQqDX8LqWUqURS+XSgEL3U7aB5mlymOJK3f9w4qNSXplxhD649gGa6UZAjnTLYYeA91o6LEtz1jxFsLwpNRjN4UWIBTWRWN5M/hjBShjs/Rjuq6GKW565nhMpNSzPAkBd8TahKRw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jw64UppB; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=PDpD3o7H; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jw64UppB";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="PDpD3o7H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776759783;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Ml3LPEO/Dye9BzRMaAljrqCo7J3LgoTe33jIVDxQlg=;
	b=Jw64UppBFL0ngHyIMmVGctMZX6C/25mQsSBHt9D3/u+75VXdkD6Nwf5M9A/qhbsKFNq/IS
	Dcj8MtW4SK+Mu9GAPDucgYDouUy+LnZ24YXx3B3AZosS5ZqTPJ/toWZgbtjT5g81jSeYxU
	RSdx9AYlU4m911xBLHX+5fdQTYp61tg=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-343-Lz3RqOGbM7eWqNcfUu3C0Q-1; Tue, 21 Apr 2026 04:23:02 -0400
X-MC-Unique: Lz3RqOGbM7eWqNcfUu3C0Q-1
X-Mimecast-MFC-AGG-ID: Lz3RqOGbM7eWqNcfUu3C0Q_1776759781
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-799001d77fcso79797287b3.1
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 01:23:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776759781; cv=none;
        d=google.com; s=arc-20240605;
        b=Z4pT98DlM/uyRyMUXLwmqOG7cTKMYWypgRf9SmltL9SZya+jDWWIYWVS6Zux6I6ASx
         7JbVbBiOaIK42fU8hH/CDYHQJzKNux4LXzh05STfZjldHO4HPacGfAryE48WKytIYMcN
         v7/W7KWAGtyCgcCBYbIifoQ2q/ngX0hV4Q/UADhM5udsbe0Ujqv9W4+PN1wto9tNGFr8
         W+/BuJ0mL0VXTfzAyK7KyZJw2MP3XalZCC6s2z+6vvLV/nVSzVbuihx9fharT5jWQ9/f
         Jj6uK9Z3IEVWp4DvoWknlyIHI4wYRoFVu9QdNTUsifegqdYFJNRy3/CW7s4ekf1jVktB
         0EHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1Ml3LPEO/Dye9BzRMaAljrqCo7J3LgoTe33jIVDxQlg=;
        fh=0ieX6L504Wm0rGwndRxJyZIKyNGo52GxX2T4uEL/QTk=;
        b=QCv/19SKRmzT3frJX0ib3wmQwx1QMPLV6cMg2oI9SQAvDoXNWHWFuKQ85KXeLL0Ffg
         rJhdxfIRcz3pX1XjCTBD8vGjtz8o7I50DOjfa3bWyLUV2N33mfr95SHg1KglfrSNM8bh
         vZBW3EEwMNogZmvkPykQtQK+GTLaRYrNnj03TnkX14sI/JohD9ttiBRlkiLK213B53nS
         zdRL671hCQX69tHOwSXDSONYi+s21P7Zrx+C9t2DJ9K5awa+vcQIS7o/Rravm4/7i0jq
         iMkaoRWD0+UAptZo5YoKIZqR2SS2TNYS/xuwe78hhSrBEGgaEUwTlNbeOeRFOMRHOwFV
         Wc8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776759781; x=1777364581; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Ml3LPEO/Dye9BzRMaAljrqCo7J3LgoTe33jIVDxQlg=;
        b=PDpD3o7HDo4qI23vJe7uOH52HVvl4CjbB8GFtiIJnZ0uymJkvDFSOTlcdxjDj4wyPx
         cYhEh5+mfU167/f9rk5ufpccaNHa4cN9w3yLd55rCpGmkUxNjKblZwM7HCBvfkTx7lPH
         Beqp9haHjckIbaVmTeYH2eXUF7Ody0tjeA6lWcCzOjdK2H/L+jo5KAlMGQZl+Idvvuvc
         fbV/0Fzjl5dUtBT5Qs+B3eoL3Ke9eY4AWskqbuoHGWyjmWynWcJgNbaVtsigBrbiH2ur
         YdzYxQvZIGz+rh7mwvNgitKSIdqLlvBzvNf4m+mlw79syHCnDlTZE/7sBm5u5b6XGadR
         qGzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776759781; x=1777364581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1Ml3LPEO/Dye9BzRMaAljrqCo7J3LgoTe33jIVDxQlg=;
        b=jZtzFXOAlqLp8Eshpm2kHftiQjLBDsI6g7xYyeCjkdrkLOFuNwxWDx+5U/K/EIgrt7
         JR/1f67SQv36GAeszab1bfNNfy1qwpGNGrpyRkoe/Oa3EnLaW9QoBdKmzhMI8ZDnG8SC
         QU+lXsIVb9Mazat1aiG5dL51Ol/WOf8ZWDkJ67vDd+/3HkYf0Re2hKhM6VUAEhz6ZsRQ
         bIl7/4YcTMDlUms+OC8bQbtmIG5m8tzA+AeMYmw3l0IDh83UC4jpXrx2NwKhn2r66w0t
         ivblXBwFAsDOTMv7h1Osd0VsSky4wND7Gs81g+aepnJp+H0fODXAaf2CICR9cLz+yXPG
         nGmA==
X-Forwarded-Encrypted: i=1; AFNElJ+yrhuKsOW58lZbp/wum8TpCwMJGWrh2vOK+bUxsNlQ0UPDEd6yqxdxasDLODU67AHoIfj3o6hkPMBVAmJnOtk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxj0CHOTfQAGlsECARBWfyYjd3Yh+K/g1zTW4R2bq/s7Muc2ew
	mPE7UsJpyuhNbTk16WnTOSqORp9rrqcH38iUDS5orck28u0oKLc6RXvpPihHIrhJy4z+CFnnzXF
	nvClyBrCxbHA6IQUipoVDYIxDLbJM4vaCFBO2a7yX7s72+pPJfxEyVZONNSr1aAkJsK7G2LQCti
	oz7MEcD/I0tddLjE88erVcrIyxYfI1I8pOnCHnVyq+FsyS
X-Gm-Gg: AeBDies7iU8tYFXBfRvlKXMy8xDAQ5hP9nt/JwArjdyAdCrMz61U/Sk7PI9bDyozf9t
	sPq45tCn0lTq3/pL3D1U0y0sT5wOObQNPZCiUYaIYyivQS6VBgsx7VZgiJgfDr2K5It7xanWtGT
	i+40pnkdlHGJForTGJsvU55wwDN2zkVCxJjt5PQ7vPLKRgPQeBED4qHpz8BvwcjEQVOjxuZPN8V
	1R6asdP8lII05bv
X-Received: by 2002:a05:690c:8d05:b0:7b6:f4f:f057 with SMTP id 00721157ae682-7b9ecfb3418mr143346777b3.24.1776759781352;
        Tue, 21 Apr 2026 01:23:01 -0700 (PDT)
X-Received: by 2002:a05:690c:8d05:b0:7b6:f4f:f057 with SMTP id
 00721157ae682-7b9ecfb3418mr143346527b3.24.1776759780849; Tue, 21 Apr 2026
 01:23:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420-kunit_add_support-v7-0-e8bc6e0f70de@redhat.com>
 <20260420-kunit_add_support-v7-1-e8bc6e0f70de@redhat.com> <20260420143951.GJ3102624@noisy.programming.kicks-ass.net>
In-Reply-To: <20260420143951.GJ3102624@noisy.programming.kicks-ass.net>
From: Albert Esteve <aesteve@redhat.com>
Date: Tue, 21 Apr 2026 10:22:49 +0200
X-Gm-Features: AQROBzBvB1NnJ5S-NBz1guESzMJAomEJ6rR9uRkVOxbuOYlvr_y2_fXZX03ERWQ
Message-ID: <CADSE00+RJ--ku_TBC5GkTtF1N_LEB5Poj=KvvvSK=P3uz8dbPA@mail.gmail.com>
Subject: Re: [PATCH v7 1/5] bug/kunit: Core support for suppressing warning backtraces
To: Peter Zijlstra <peterz@infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, dri-devel@lists.freedesktop.org, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	Alessandro Carminati <acarmina@redhat.com>, Guenter Roeck <linux@roeck-us.net>, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2026 at 4:40=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Mon, Apr 20, 2026 at 02:28:03PM +0200, Albert Esteve wrote:
> > From: Alessandro Carminati <acarmina@redhat.com>
> >
> > Some unit tests intentionally trigger warning backtraces by passing bad
> > parameters to kernel API functions. Such unit tests typically check the
> > return value from such calls, not the existence of the warning backtrac=
e.
> >
> > Such intentionally generated warning backtraces are neither desirable
> > nor useful for a number of reasons:
> > - They can result in overlooked real problems.
> > - A warning that suddenly starts to show up in unit tests needs to be
> >   investigated and has to be marked to be ignored, for example by
> >   adjusting filter scripts. Such filters are ad hoc because there is
> >   no real standard format for warnings. On top of that, such filter
> >   scripts would require constant maintenance.
> >
> > Solve the problem by providing a means to identify and suppress specifi=
c
> > warning backtraces while executing test code. Support suppressing multi=
ple
> > backtraces while at the same time limiting changes to generic code to t=
he
> > absolute minimum.
> >
> > Implementation details:
> > Suppression is checked at two points in the warning path:
> > - In warn_slowpath_fmt(), the check runs before any output, fully
> >   suppressing both message and backtrace.
> > - In __report_bug(), the check runs before __warn() is called,
> >   suppressing the backtrace and stack dump. Note that on this path,
> >   the WARN() format message may still appear in the kernel log since
> >   __warn_printk() runs before the trap that enters __report_bug().
>
> This is for architectures that implement __WARN_FLAGS but not
> __WARN_printf right? (which is arm64, loongarch, parisc, powerpc, riscv,
> sh, afaict). ARM64 should eventually get __WARN_printf, but other than
> that this should be fixable by moving __WARN_FLAGS() into
> __warn_printk() or so. This is the only __warn_printk() user anyway.

Right. On that path, __warn_printk() prints the message before
__WARN_FLAGS() triggers the trap into __report_bug(), so the
suppression check in __report_bug() only catches the backtrace.

Adding the suppression check to __warn_printk() as well should close
this gap, since it's the only caller in the generic __WARN_printf
path. Something like:

```
diff --git a/kernel/panic.c b/kernel/panic.c
index d7a7a679f56c4..cd73038b7c0bd 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -1108,9 +1108,14 @@ EXPORT_SYMBOL(warn_slowpath_fmt);
#else
void __warn_printk(const char *fmt, ...)
{
- bool rcu =3D warn_rcu_enter();
+ bool rcu;
va_list args;
+ if (__kunit_is_suppressed_warning())
+ return;
+
+ rcu =3D warn_rcu_enter();
+
pr_warn(CUT_HERE);
va_start(args, fmt);
```
Note that the suppression counter tracking may need a small adjustment
to avoid double-counting, since __report_bug() will still see the same
warning through the trap path, but the approach itself should be
straightforward.

>
>
> > diff --git a/include/kunit/bug.h b/include/kunit/bug.h
> > new file mode 100644
> > index 0000000000000..e52c9d21d9fe6
> > --- /dev/null
> > +++ b/include/kunit/bug.h
> > @@ -0,0 +1,56 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * KUnit helpers for backtrace suppression
> > + *
> > + * Copyright (C) 2025 Alessandro Carminati <acarmina@redhat.com>
> > + * Copyright (C) 2024 Guenter Roeck <linux@roeck-us.net>
> > + */
> > +
> > +#ifndef _KUNIT_BUG_H
> > +#define _KUNIT_BUG_H
> > +
> > +#ifndef __ASSEMBLY__
> > +
> > +#include <linux/kconfig.h>
> > +
> > +struct kunit;
> > +
> > +#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
> > +
> > +#include <linux/types.h>
> > +
> > +struct task_struct;
> > +
> > +struct __suppressed_warning {
> > +     struct list_head node;
> > +     struct task_struct *task;
> > +     int counter;
> > +};
> > +
> > +struct __suppressed_warning *
> > +__kunit_start_suppress_warning(struct kunit *test);
> > +void __kunit_end_suppress_warning(struct kunit *test,
> > +                               struct __suppressed_warning *warning);
> > +int __kunit_suppressed_warning_count(struct __suppressed_warning *warn=
ing);
> > +bool __kunit_is_suppressed_warning(void);
> > +
> > +#define KUNIT_START_SUPPRESSED_WARNING(test) \
> > +     struct __suppressed_warning *__kunit_suppress =3D \
> > +             __kunit_start_suppress_warning(test)
> > +
> > +#define KUNIT_END_SUPPRESSED_WARNING(test) \
> > +     __kunit_end_suppress_warning(test, __kunit_suppress)
>
> We have __cleanup for this?

I was unfamiliar with this attribute. I have looked into it a bit, and
it could be a good fit. I saw a good example in seqlock. I could try
to use it for the next version.

>
> > +
> > +#define KUNIT_SUPPRESSED_WARNING_COUNT() \
> > +     __kunit_suppressed_warning_count(__kunit_suppress)
> > +
> > +#else /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
> > +
> > +#define KUNIT_START_SUPPRESSED_WARNING(test)
> > +#define KUNIT_END_SUPPRESSED_WARNING(test)
> > +#define KUNIT_SUPPRESSED_WARNING_COUNT() 0
> > +static inline bool __kunit_is_suppressed_warning(void) { return false;=
 }
> > +
> > +#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
> > +#endif /* __ASSEMBLY__ */
> > +#endif /* _KUNIT_BUG_H */
>
> > diff --git a/lib/kunit/Makefile b/lib/kunit/Makefile
> > index 656f1fa35abcc..fe177ff3ebdef 100644
> > --- a/lib/kunit/Makefile
> > +++ b/lib/kunit/Makefile
> > @@ -16,8 +16,10 @@ ifeq ($(CONFIG_KUNIT_DEBUGFS),y)
> >  kunit-objs +=3D                                debugfs.o
> >  endif
> >
> > -# KUnit 'hooks' are built-in even when KUnit is built as a module.
> > -obj-$(if $(CONFIG_KUNIT),y) +=3D               hooks.o
> > +# KUnit 'hooks' and bug handling are built-in even when KUnit is built
> > +# as a module.
> > +obj-$(if $(CONFIG_KUNIT),y) +=3D               hooks.o \
> > +                                     bug.o
> >
> >  obj-$(CONFIG_KUNIT_TEST) +=3D          kunit-test.o
> >  obj-$(CONFIG_KUNIT_TEST) +=3D          platform-test.o
> > diff --git a/lib/kunit/bug.c b/lib/kunit/bug.c
> > new file mode 100644
> > index 0000000000000..356c8a5928828
> > --- /dev/null
> > +++ b/lib/kunit/bug.c
> > @@ -0,0 +1,84 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * KUnit helpers for backtrace suppression
> > + *
> > + * Copyright (C) 2025 Alessandro Carminati <acarmina@redhat.com>
> > + * Copyright (C) 2024 Guenter Roeck <linux@roeck-us.net>
> > + */
> > +
> > +#include <kunit/bug.h>
> > +#include <kunit/resource.h>
> > +#include <linux/export.h>
> > +#include <linux/rculist.h>
> > +#include <linux/sched.h>
> > +
> > +#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
> > +
> > +static LIST_HEAD(suppressed_warnings);
> > +
> > +static void __kunit_suppress_warning_remove(struct __suppressed_warnin=
g *warning)
> > +{
> > +     list_del_rcu(&warning->node);
> > +     synchronize_rcu(); /* Wait for readers to finish */
> > +}
> > +
> > +KUNIT_DEFINE_ACTION_WRAPPER(__kunit_suppress_warning_cleanup,
> > +                         __kunit_suppress_warning_remove,
> > +                         struct __suppressed_warning *);
> > +
> > +struct __suppressed_warning *
> > +__kunit_start_suppress_warning(struct kunit *test)
> > +{
> > +     struct __suppressed_warning *warning;
> > +     int ret;
> > +
> > +     warning =3D kunit_kzalloc(test, sizeof(*warning), GFP_KERNEL);
> > +     if (!warning)
> > +             return NULL;
> > +
> > +     warning->task =3D current;
> > +     list_add_rcu(&warning->node, &suppressed_warnings);
>
> What if anything serializes this global list?

I considered adding a spinlock, but since the KUnit executor runs
tests sequentially and it had not been a concern in previous versions,
I left it out to keep the changeset minimal unless someone complains.
If we want a hard guarantee, I'm happy to add the spinlock for the
next version.

>
> > +
> > +     ret =3D kunit_add_action_or_reset(test,
> > +                                     __kunit_suppress_warning_cleanup,
> > +                                     warning);
> > +     if (ret)
> > +             return NULL;
> > +
> > +     return warning;
> > +}
> > +EXPORT_SYMBOL_GPL(__kunit_start_suppress_warning);
> > +
> > +void __kunit_end_suppress_warning(struct kunit *test,
> > +                               struct __suppressed_warning *warning)
> > +{
> > +     if (!warning)
> > +             return;
> > +     kunit_release_action(test, __kunit_suppress_warning_cleanup, warn=
ing);
> > +}
> > +EXPORT_SYMBOL_GPL(__kunit_end_suppress_warning);
> > +
> > +int __kunit_suppressed_warning_count(struct __suppressed_warning *warn=
ing)
> > +{
> > +     return warning ? warning->counter : 0;
> > +}
> > +EXPORT_SYMBOL_GPL(__kunit_suppressed_warning_count);
> > +
> > +bool __kunit_is_suppressed_warning(void)
> > +{
> > +     struct __suppressed_warning *warning;
> > +
> > +     rcu_read_lock();
> > +     list_for_each_entry_rcu(warning, &suppressed_warnings, node) {
> > +             if (warning->task =3D=3D current) {
> > +                     warning->counter++;
> > +                     rcu_read_unlock();
> > +                     return true;
> > +             }
> > +     }
> > +     rcu_read_unlock();
> > +
> > +     return false;
> > +}
> > +
> > +#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
> >
> > --
> > 2.52.0
> >
>

