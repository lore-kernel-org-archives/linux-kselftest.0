Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8364D27BF93
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 07:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771916577; cv=pass; b=YmXyxd3n0XI/AxmBkknYOtEPmkejJRBKYZe+QJPKM2MOQHoBI8BZ+PzPRHldaoJe5A0Uel0/IMWSnIRDP8fky38bDnzEuJK9RzGUgAEiWEeM3aYfLD3l79flOvENGTlhwRVsg3ZGzM7CvOCPG4ZDZgcaS0qwKSnIQUgnJy7u9mg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771916577; c=relaxed/simple;
	bh=rxK5MRMclQdgQ+boJd7DAL7JUa++al5ria+aZjLrTT4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YoHqdaDP5DWpKu7FaVdxEKEnRIPc4FunGIX9Ievc0N+V32FRbOliosaSP2BMX1r1GNbzReNlXhEEMCEiyBrP1oX94nj8PeqfjTKV7er2oi6zxAheybNx6nFym6VKhH9LA+wRrfRONsMkrjDSbRDe4E3T5mCXir2+vTrVLA0Amz0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D/PaqkWx; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D/PaqkWx"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5033b64256dso381191cf.0
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Feb 2026 23:02:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771916574; cv=none;
        d=google.com; s=arc-20240605;
        b=QAqXTY2q+cHHUeKY5+/GZMeLj4BYC04kJJ645GOWUGPH1yOAIwaoH7TngeM7rVVVHn
         bQ5r7nnM4DjyV9wmodyvM3FqvQT2EmlZ+qb9AkCF9I6Sk4PPF3Q9v1WAsNz8ROryDBBp
         0cVSyyLE7fc6RZlE8FsBPDSEAqRLYpq7sguSAaasqqhcVTikngve8U2Bt0C6WAx1y3ww
         bsq3mKYexB24ZxQpYIIIjcJGmsXlhljy7HN49lzWZk7cRD5JVtz5CbIUAhCg2lRivfT1
         rWWv88KIYu8fRJ24P1xORkrchU+fBuphuwBjupbLyTEv9q6pV/ueLG3od8OB9pV2sjVN
         FQ1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=frq9C2KPzidXPSU+e6IcoqTvLL5USw8xYGm0brKzosM=;
        fh=nHYVj+6W5iRQLAs19RXEpPUNhScwqx8so6FIWh0lrks=;
        b=fTsnK0RcDibDB4ctPhUen8/6ZfZ1wr/XHP/NHYYM76BQsAe6bydsmSzyzLlDdvjPAW
         G0sX7/4kTZ0/dVB5ah8WFaC8/48+4JfwWJIrpSKWsY3herqzzXFeuEWcvYMuSra1AXV/
         NqSUvVdp2mOB58HKqkS5/9C6cEbYHgK1D26ESBMBqqFtWUJck+poAUeBesqkryj//DDh
         MfBJBJikjQ0MitIRgePIW8z18eG8wjVA4sRUzAC/0r5QTIRzQfZEQDwDXNrF8Tvd/PSs
         DFY0CUstaZ7Gg/DGLmdIlbf1MHUyI2gO5s9iJrYVWz5QfV1Av1GlGrDHMxX9QQ7Dmt4v
         9eyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771916574; x=1772521374; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=frq9C2KPzidXPSU+e6IcoqTvLL5USw8xYGm0brKzosM=;
        b=D/PaqkWxdNkya05cU8RXb0AiMfObzfmUNdAc10Upgz/8WDH1iGLTbyRb5nwfOKGuFC
         4E09Ca+D/koKRIN3jaTFq9sZICsxmOrlQ/kxX+XkJLkOBtirTYZFfpjRdrMC6ckNrMOa
         FcqUAYDRKzHGMA2hHgpwnP8Htf90M7s3uvB/nIzL4cLw6j5u2qgMgrme6KZ1o1CRm/Qp
         t2rTRgs2abmXvC59N7W9oVENxAvvzqG32C/qJvdQ9VEwGA/K22bhLS93Lo0iM2edRUZr
         IIGYi2kGSygkBRSHosSzBUdgSI+RP8QOqpiQwDXvJR8oGr+Y8e4rQH/WBAiJRlrEjC4W
         yLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771916574; x=1772521374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=frq9C2KPzidXPSU+e6IcoqTvLL5USw8xYGm0brKzosM=;
        b=LkK6KyMQxm3MRoi3DbEKXgN+nf9U+8gggeGL6e5ooZlLmdy0MsAsbmlWjgx40tl1CP
         vJKMry4qP/vL5ZN4fRTCyUv07bE/VmlZRbtJkGHlRh4f3Whn7lpynFOwet1De9Eg6SRM
         pfQRT7kQriNIan3L/COAGRTkzVuYVM+LZUs3UmDDZYYDNq5gHbRA52w6sg+JVuYv6oMw
         ZRE9Q02soKzEA/RBvWmpffel0jT+jBVeV4wa5Bqe5e/bibg5XMlioZIRF7Fu2i/bNsis
         lc6vgwGw8x2wBPcJbUJwiJ6AOB7OrerjouAMYSZsHdzabj9bqZc3elxksO3+7jn5oz4p
         d7kA==
X-Forwarded-Encrypted: i=1; AJvYcCUwu6Sne6NEHm9EItJwQOt8TXIn74YU4WHcBT+3WC3F5WQOR+vAs3CVRqgRKmX4nVvxOSl1NLGDJ8qSUas8LYA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbKmBNWFneFC6Q58V1r9Q801DcN4Mfw+csNxA8fG7Q2Zx3YAdR
	5Jwxk9hFgXox1AbJfY02n2lArD8yZgytP/XOLIRFjkklZAH6+OCgCtAUxoMezH6a6ATRr+VCdJY
	goM4DK7o6YYXVZ7Igjy/9XkIJzwx9Lv2nYRinxlCU
X-Gm-Gg: AZuq6aJ4UN4HVI8kx0VemOaixHcXoP8elEB0aCfW1yQMD5sxHBpNqoGfErwjl2Aq9O5
	6wJCY6WuO/Gyh3KEscFeHlnc0puHdh8Jfy9P24GrGONsCfWO+Ka3S+xprT42JvWLTmqXrmUl+xB
	DzppCsyyyv/5shUxjjjgJmL3wpHFh5w2NIJn3sPgouAVvm2auY3x9qsC/NTfVhSnvA0znsMVbNN
	6ipOtNRF2cWmlnKSCwRzp8Hz4TUGEBT4Rv26M0WV9c4Suf6JuwUGVv02WqJrnsLfAmyysIEPm9t
	V2CtQi8=
X-Received: by 2002:ac8:5dcc:0:b0:502:f1e0:dd3b with SMTP id
 d75a77b69052e-5072df09bebmr5503351cf.7.1771916574044; Mon, 23 Feb 2026
 23:02:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223200254.4104651-1-ptikhomirov@virtuozzo.com> <20260223200254.4104651-2-ptikhomirov@virtuozzo.com>
In-Reply-To: <20260223200254.4104651-2-ptikhomirov@virtuozzo.com>
From: Andrei Vagin <avagin@google.com>
Date: Mon, 23 Feb 2026 23:02:43 -0800
X-Gm-Features: AaiRm51ZhFVywsR5m51jPKotKAiB8grG8YGfZOW5eJt7NCobjlO8q-Off9c89ts
Message-ID: <CAEWA0a63QxMRqCwpCUqb5iKih31LY-2zX+--SkMGcP-Y19PqpQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] pid_namespace: allow opening pid_for_children
 before init was created
To: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
Cc: Christian Brauner <brauner@kernel.org>, Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Jan Kara <jack@suse.cz>, Oleg Nesterov <oleg@redhat.com>, Aleksa Sarai <cyphar@cyphar.com>, 
	Kirill Tkhai <tkhai@ya.ru>, Alexander Mikhalitsyn <alexander@mihalicyn.com>, Adrian Reber <areber@redhat.com>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 23, 2026 at 3:03=E2=80=AFPM Pavel Tikhomirov
<ptikhomirov@virtuozzo.com> wrote:
>
> This effectively gives us an ability to create the pid namespace init as
> a child of the process (setns-ed to the pid namespace) different to the
> process which created the pid namespace itself.
>
> Original problem:
>
> There is a cool set_tid feature in clone3() syscall, it allows you to
> create process with desired pids on multiple pid namespace levels. Which
> is useful to restore processes in CRIU for nested pid namespace case.
>
> In nested container case we can potentially see this kind of pid/user
> namespace tree:
>
>                             Process
>                           =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
>     User NS0 =E2=94=80=E2=94=80=E2=96=B6 Pid NS0 =E2=94=80=E2=94=80=E2=96=
=B6 Pid p0 =E2=94=82
>         =E2=94=82           =E2=94=82     =E2=94=82         =E2=94=82
>         =E2=96=BC           =E2=96=BC     =E2=94=82         =E2=94=82
>     User NS1 =E2=94=80=E2=94=80=E2=96=B6 Pid NS1 =E2=94=80=E2=94=80=E2=96=
=B6 Pid p1 =E2=94=82
>         =E2=94=82           =E2=94=82     =E2=94=82         =E2=94=82
>        ...         ...    =E2=94=82   ...   =E2=94=82
>         =E2=94=82           =E2=94=82     =E2=94=82         =E2=94=82
>         =E2=96=BC           =E2=96=BC     =E2=94=82         =E2=94=82
>     User NSn =E2=94=80=E2=94=80=E2=96=B6 Pid NSn =E2=94=80=E2=94=80=E2=96=
=B6 Pid pn =E2=94=82
>                           =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98
>
> So to create the "Process" and set pids {p0, p1, ... pn} for it on all
> pid namespace levels we can use clone3() syscall set_tid feature, BUT
> the syscall does not allow you to set pid on pid namespace levels you
> don't have permission to. So basically you have to be in "User NS0" when
> creating the "Process" to actually be able to set pids on all levels.
>
> It is ok for almost any process, but with pid namespace init this does
> not work, as currently we can only create pid namespace init and the pid
> namespace itself simultaneously, so to make "Pid NSn" owned by "User
> NSn" we have to be in the "User NSn".
>
> We can't possibly be in "User NS0" and "User NSn" at the same time,
> hence the problem.
>
> Alternative solution:
>
> Yes, for the case of pid namespace init we can use old and gold
> /proc/sys/kernel/ns_last_pid interface on the levels lower than n. But
> it is much more complicated and introduces tons of extra code to do. It
> would be nice to make clone3() set_tid interface also aplicable to this
> corner case.
>
> Implementation:
>
> Now when anyone can setns to the pid namespace before the creation of
> init, and thus multiple processes can fork children to the pid
> namespace, we enforce that the first process created is always the init,
> and only allow other processes after the init sets
> pid_namespace->child_reaper.
>
> To avoid possible problems related to cpu/compiler optimizations around
> ->child_reaper, let's use WRITE_ONCE (additional to task_list lock)
> everywhere we write it and use READ_ONCE everywhere we read it without
> explicit lock. Note: we already had READ_ONCE in nsfs_fh_to_dentry().
>
> Signed-off-by: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
>
> --
> v2: Use *_ONCE for ->child_reaper accesses atomicity, and avoid taking
> task_list lock for reading it. Rebase to master, and thus remove
> now excess pidns_ready variable.
>
> Note: I didn't find anything in copy_process() around setting the
> ->child_reaper which can influence the pid namespace, so it looks like
> the pid namespace is fully setup at the point when init sets
> ->child_reaper to receive more processes. Thus tasklist lock looks
> excess in pidns_for_children_get()'s ->child_reaper check and it should
> be safe not to have it in the corresponding checks in alloc_pid().
> ---
>  kernel/exit.c          | 2 +-
>  kernel/fork.c          | 2 +-
>  kernel/pid.c           | 5 +++--
>  kernel/pid_namespace.c | 9 ---------
>  4 files changed, 5 insertions(+), 13 deletions(-)
>
> diff --git a/kernel/exit.c b/kernel/exit.c
> index 8a87021211ae..567fc3b7b0f9 100644
> --- a/kernel/exit.c
> +++ b/kernel/exit.c
> @@ -608,7 +608,7 @@ static struct task_struct *find_child_reaper(struct t=
ask_struct *father,
>
>         reaper =3D find_alive_thread(father);
>         if (reaper) {
> -               pid_ns->child_reaper =3D reaper;
> +               WRITE_ONCE(pid_ns->child_reaper, reaper);
>                 return reaper;
>         }
>
> diff --git a/kernel/fork.c b/kernel/fork.c
> index e832da9d15a4..27d0cdbca67e 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -2423,7 +2423,7 @@ __latent_entropy struct task_struct *copy_process(
>                         init_task_pid(p, PIDTYPE_SID, task_session(curren=
t));
>
>                         if (is_child_reaper(pid)) {
> -                               ns_of_pid(pid)->child_reaper =3D p;
> +                               WRITE_ONCE(ns_of_pid(pid)->child_reaper, =
p);
>                                 p->signal->flags |=3D SIGNAL_UNKILLABLE;
>                         }
>                         p->signal->shared_pending.signal =3D delayed.sign=
al;
> diff --git a/kernel/pid.c b/kernel/pid.c
> index 3b96571d0fe6..e6116e131d8d 100644
> --- a/kernel/pid.c
> +++ b/kernel/pid.c
> @@ -219,7 +219,7 @@ struct pid *alloc_pid(struct pid_namespace *ns, pid_t=
 *arg_set_tid,
>                          * Also fail if a PID !=3D 1 is requested and
>                          * no PID 1 exists.
>                          */
> -                       if (tid !=3D 1 && !tmp->child_reaper)
> +                       if (tid !=3D 1 && !READ_ONCE(tmp->child_reaper))
>                                 goto out_abort;
>                         retval =3D -EPERM;
>                         if (!checkpoint_restore_ns_capable(tmp->user_ns))
> @@ -247,8 +247,9 @@ struct pid *alloc_pid(struct pid_namespace *ns, pid_t=
 *arg_set_tid,
>                          * alreay in use. Return EEXIST in that case.
>                          */
>                         if (nr =3D=3D -ENOSPC)
> -
>                                 nr =3D -EEXIST;
> +               } else if (!READ_ONCE(tmp->child_reaper) && idr_get_curso=
r(&tmp->idr) !=3D 0) {

I think it is better to update pid_ns_ctl_handler to prevent setting
ns_last_pid in a pidns
without init. Otherwise, figuring out why fork returns EINVAL can be tricky=
.

> +                       nr =3D -EINVAL;
>                 } else {
>                         int pid_min =3D 1;
>                         /*
