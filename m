Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA7C280318
	for <linux-kselftest@vger.kernel.org>; Tue, 26 May 2026 01:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779758775; cv=pass; b=NF1VUu2JLLpbXWPgqzSVz4pIDU5wHDD/fiA/SmVTLlc2cToN6vAvPaNm2hzhnmOZXnr2roK8ahVDIILRnxZzDhG1Z6Uhs7hIth8KwA2/SCB5oOuSahs6KDdlySf5acYRW7pIRn8XrwkEG84SfsAG+RSTvuDm2GZyuxjTplfCztk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779758775; c=relaxed/simple;
	bh=StCyX4oEVm6yn7zVwa/jNqBnSc317Z4ItII+7dTQNSY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hf3aHytJoNxf+IecVX6HO2cLYnJTP1eM3zkmZ4+aN8Mxd0tgK2o4/0BFbLgIUz399zxVJa9mIoVVfcl/gy/crJLNmu8ZwTQ7n2xNZt0jQYAZn9iGdSmI9gjEzzIjhEU45IVY1D+oU5Wjl94W/0x56Y6xXCYR97MJljEdBIuluJs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Yfo3q9PU; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Yfo3q9PU"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2bc7b311e77so45620855ad.0
        for <linux-kselftest@vger.kernel.org>; Mon, 25 May 2026 18:26:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779758773; cv=none;
        d=google.com; s=arc-20240605;
        b=N+6K1YVIzwpCPYTVg73mjL7vAlVrFy1spK3oZyf5FZJIDVBDpWxuuXz8LmOROK/1gQ
         nfZP6BGrLZrdq9vIHVjzL2JqmS9nGidhyBeVHfhS8VJcqSnkpwyui1Mm7N7MV2GGzMPY
         H1/ia12QjY1VrhEBej/vG6XbnjzuBKmGpYNYbd/N/M8k7TRVs+1p07h47TRjOP4uz+7C
         cyr12UwUkAfekCOyNZF+wE8EG/byfU6LnAX6PYEm9wcquOapvIT+LQTJLHuOO5Gn925v
         Nn0z+tEeeOxdoFpIDlLTur0V2THyIz5hKR9vLJkS0CPkOMVhPKS/MWjNC1jHHuvQpKrr
         0gNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2qdPJNFPW2LhyE3W42bqV/trKHEPq69pfkp+pc5DfJo=;
        fh=z1wBxMIH/cIugVDyunINCf0oVmPQ7UlQpLbrMFAmwjU=;
        b=VgTCwD2w6N4HrTiQedTl5oFJrOp2zzLfmOY5wJbFxSFZ4LYkpVFYItMJ8eS2lswKk5
         4qs/clO9hd6tIycw6iZnxB3fpBNcc03SibmRZK78+fsKSj+KipyJLPblVGtWq3y7n+cg
         hRA5c5gaf6+f7zdDhgEveHzHpF/jkR0CcjURWIfUbmanuewmNxdejHzOYdhXPChxTRR9
         9GIKPEdz40NC0O9qyaecv9pq5202Ree1LL8AiVCIt5b3eQFOIWY3EjnCX/y5Uyp+6bkG
         3J8OkCnBeSK0Wz2tZDRx4pSAzJJuKDWO40cQEMasck96X8gsHZpu8saNxBhcLmwyTKtq
         0iQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779758773; x=1780363573; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2qdPJNFPW2LhyE3W42bqV/trKHEPq69pfkp+pc5DfJo=;
        b=Yfo3q9PUzeCv4CWoqyaRs21V8DtOqxWz/LDhkZdecsu6zHqm9UE4Fftk55kHCt0+e0
         7AFcnhWg1TVa96TZS1sRhB+pTgcwVB6NwsMeCGDgpZNzLa4Lri81Agtzes4kwHnXEWhV
         xX8hqY/5mt/ZqO87JmUEiuHy/rYuGiwIe1UJtL5W4kMUQiTNPkntGxM0mtDl36tmjxH+
         Z6Dfq+O+iVkr7Wi0w6pgWEvbkT3Jti+BMIbEXZYq2ZJqyRLwESodf3wfeEJK4Sa1OStd
         CzLb9hF0DD0YAQN9tRxDG3u6P6b1oH+eDfJEw2QUcW68AteIc1V50OGU8cmCghyYlgsJ
         to3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779758773; x=1780363573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2qdPJNFPW2LhyE3W42bqV/trKHEPq69pfkp+pc5DfJo=;
        b=E7ZhNrh9aQHYVLWzqcRPotATKJnDJHRUXn33aD4XMycxweLYAaZcQTtJ1fBrBYT3DM
         lwM47SxTmM4QD4naELo7icytNTsfU+N7MIZhyTolEF9s1yxsG3PWD4G8RXJn+aurz2FI
         t3UGp4xdPd6yFtaX8IXGhJmTEWQhRu0EpEQXfRyyyZoHFr0imjFXOMrkGudQL2Rq6sK3
         AWWFmIaU1/GlE4eBZwvQV4q7a9Kv5BYdB3eASNauCt3N5IiryBusaN5B2yB69Uu1djaT
         tpDF81iRxF38csgLbf5M7eNryoHK2f1waJXQW/jlDSLxYTB4Sveq5E//zBgsxvuSvRFI
         vEng==
X-Forwarded-Encrypted: i=1; AFNElJ9wSOkXXmRC4m49KCQ92hfCFHmGaXX3bR9M1JkakqCLyj9Vk+5rnaLmMqmSDTAQlIRmnMWFMNgUVY6j26laMqc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/+m8yK+10Yn5bOEBC7lVhjD064c0avpDbaI/u2wiBEJtFrcI3
	IaxF10LdVP3YigerOUFgtbH+LQYaklMblZGbtmTWFwkuP15APLaQGCzaoQY2aN/+sHZn7rqgoPC
	/Jtq10n9Zacc13MTT1ZYMsxJASJ8UdUDU4O2xjUZ4j4aMgG5B7yIaVlamKFI=
X-Gm-Gg: Acq92OFla0XoWQaeMQZsxUbia4naBjhFI9eC6PovDZc/axZrwArBbQgShq9dXhMmWY/
	N/Br0dkUHVDjPuzJf5WIffTlDuacotu+mYUyGp3/dt2G7qqpcu4JseUawRgYfvrw/ZPIn34GYOn
	tCjcSyo/kAsTRU5mkFlcdsFpTh45OPK/Qs5Y+J6YQp/j1NIZsrETGSnPOdCL867ieCsxrMgpdP9
	TTcaWDbQdwxu5J5z6JW0aP1m3jjyV2Ojol6OhGxThxm2bl8bMQdJen+j6DT1/4sMt6T+j4F4y/G
	ItrWrsGleSShwanLbD95MUXFApcf5JTiQCxSqJmhReuF0u4R
X-Received: by 2002:a17:903:1a0d:b0:2b0:91e6:bc18 with SMTP id
 d9443c01a7336-2beb0878549mr142370945ad.14.1779758772442; Mon, 25 May 2026
 18:26:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260525092002.3762888-1-wakel@google.com> <20260525092002.3762888-2-wakel@google.com>
 <5ae41797-83ef-4896-b67f-0ec6f957de67@igalia.com>
In-Reply-To: <5ae41797-83ef-4896-b67f-0ec6f957de67@igalia.com>
From: Wake Liu <wakel@google.com>
Date: Tue, 26 May 2026 09:25:36 +0800
X-Gm-Features: AVHnY4Jxw_ntVkT6Qblzo7x3Iqq7BcSyNendxl2kM9ZOWSYhh9GVs_M3IFB3HCs
Message-ID: <CAOcRiAEOi+jTNh0C2AcRU6cCgsfpxD6b=u0P97Tkpf8On0U7xQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] selftests/futex: Migrate futex_wait to harness
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: Shuah Khan <shuah@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
	linux-kselftest@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, 
	Davidlohr Bueso <dave@stgolabs.net>, Carlos Llamas <cmllamas@google.com>, linux-kernel@vger.kernel.org, 
	kernel-dev@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2026 at 2:51=E2=80=AFAM Andr=C3=A9 Almeida <andrealmeid@iga=
lia.com> wrote:
>
> Em 25/05/2026 06:20, Wake Liu escreveu:
> > Migrate futex_wait test to the kselftest harness framework,
> > removing mixed legacy ksft_* API usages and ensuring proper thread join=
ing.
> >
>
> Why is this patchset not part of the same series that you just sent?
>

The overall scope of migrating all the remaining futex functional
tests to the harness is quite large (I still have 2 series planned for
requeue tests, just not finish yet lol).

To keep the review process manageable and incremental, I prefer
splitting them into smaller, logically grouped topic-based series
(e.g., wait-related vs. requeue-related).

> > Signed-off-by: Wake Liu <wakel@google.com>
> > ---
> >   .../selftests/futex/functional/futex_wait.c   | 125 +++++++++++------=
-
> >   1 file changed, 77 insertions(+), 48 deletions(-)
> >
> > diff --git a/tools/testing/selftests/futex/functional/futex_wait.c b/to=
ols/testing/selftests/futex/functional/futex_wait.c
> > index 7b8879409007..ed4b040600b8 100644
> > --- a/tools/testing/selftests/futex/functional/futex_wait.c
> > +++ b/tools/testing/selftests/futex/functional/futex_wait.c
> > @@ -9,6 +9,7 @@
> >   #include <sys/shm.h>
> >   #include <sys/mman.h>
> >   #include <fcntl.h>
> > +#include <stdlib.h>
> >
> >   #include "futextest.h"
> >   #include "kselftest_harness.h"
> > @@ -19,125 +20,153 @@
> >
> >   void *futex;
> >
> > +struct waiter_args {
> > +     struct __test_metadata *_metadata;
> > +     unsigned int flags;
> > +};
> > +
> >   static void *waiterfn(void *arg)
> >   {
> > +     struct waiter_args *args =3D (struct waiter_args *)arg;
> > +     struct __test_metadata *_metadata =3D args->_metadata;
>
> As much as I like the benefits of being able to properly use the harness
> macros in threads, I fell like we are touching private structs here. Are
> they safe to be used concurrently? If a child thread an the main thread
> fails, does that counts as two fails?
>
> Perhaps we should have a look to create a kselftest wrapper for
> pthread_create().
>

Regarding concurrency safety: _metadata is allocated via MAP_SHARED in
the harness, so it is shared across forks. For pthread threads, they
share the same address space, so they naturally access the exact same
_metadata pointer.

While concurrently writing to _metadata->exit_code on failure is
technically a data race under the C standard, practically it is a
simple write of a constant value (KSFT_FAIL), which is robust enough
for test scenarios. Stdio logging (TH_LOG) is also thread-safe in
glibc (flockfile is used internally).

If a child thread and the main thread both fail, it will still
register as a single test failure since they both set
_metadata->exit_code =3D KSFT_FAIL.

A kselftest wrapper for pthread_create() would indeed be a great
addition to the harness for cleaner thread management in the future!


> >       struct timespec to;
> > -     unsigned int flags =3D 0;
> > -
> > -     if (arg)
> > -             flags =3D *((unsigned int *) arg);
> > +     int res;
> >
> >       to.tv_sec =3D 0;
> >       to.tv_nsec =3D timeout_ns;
> >
> > -     if (futex_wait(futex, 0, &to, flags))
> > -             printf("waiter failed errno %d\n", errno);
> > +     res =3D futex_wait(futex, 0, &to, args->flags);
> > +     if (res) {
> > +             EXPECT_EQ(res, 0)
>
> I have changed it to ASSERT_EQ(res, -1) just to see what happens when a
> child thread fails, but the test still reported PASSED: 3 / 3

I believe you might have hit a logical skip in the conditional check here:

if (res) {
      ASSERT_EQ(res, -1);
  }
Since futex_wait succeeds in the normal path (returning 0), the "if
(res)" condition evaluates to false, and the block is skipped
entirely. This is why your amended assertion was never evaluated, and
the test reported PASSED.

If you place the assertion outside the conditional block (e.g.,
immediately after futex_wait) or force a failure on success (res =3D=3D
0), it will correctly trigger a SIGABRT via abort() inside the child
thread, terminating the entire test process and reporting a FAILURE in
the harness.


--=20
Best Regards,
Wake Liu
