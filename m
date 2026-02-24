Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9141237D11B
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 15:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771947538; cv=pass; b=jy4ZR9JcCWkZEcchGmOF1HHaIAIZNP8KyLAgNqeSqM5d3f26EEMeKWWe7IFtD91iJeR/Qxzy/NLlRDTxYM8sTlc4T1ZkG/262UV5S/gBoV52MtvHfFzfPzlppg/sqhGJ31fjGzwHBhje8LQpzIEqvg3MrO/cg+581LhnGIJYJyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771947538; c=relaxed/simple;
	bh=OrbCFaEI4d2vw/eFe81O5j4YA0FXnMvIcIKZaozipsM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UA6rHvhCNMj37muskadnCYy49taTtqynPmyuoBxOUupK69TY1hj3PYEukXoSMH7YhxUFluiwr4UuPAczqfKfJ3+LtUnUwK1P4cfJh7HFgxE4xVY0g7iXsqyGs77LomjYjWGR6ZcYWYYiThOWsQPhgOzXQBuVcQi8YtzPMQ8xdc0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2CT4bhlB; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2CT4bhlB"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-505d3baf1a7so12761cf.1
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 07:38:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771947535; cv=none;
        d=google.com; s=arc-20240605;
        b=HyUy+mhDwBbIeMHt5bN7e944wdL+DXZ43cDRMx0zXRhkM+A20Q/ml8hOZsQ9+rBMJ+
         o9jrFa8Q7GB2/pjWUPc1VbemU+KD5SXdwQp1ICdBDTGHUSG0VtNYyt5Koi2Iu5tp6OOw
         cygLMm/eos9WpYbbZDAjplYpqE8erWm366Ooe8T5jMcj60ORC3GPEncwJ3jZ1nC6POAc
         2yTEWrdlc4mgnSYyH7voozr68JjlEBw52VP5/bSssRB7zwf3xPM8q6hP+HT7lVHXeTrR
         MCuWE1cFVIIpns23C/Ae9lUk07P4I8Xg6IIEzcaPy96q8BtZCguBOMwMlqZ2cEMcKg71
         NbZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X8FKYJ3J0ekbbk4xcl7+J9bdYsFozs7WVni5ylJT0VM=;
        fh=PAIEl39CodRa6dxqp2IREXa5RPWJ6TflRP07Av67OYg=;
        b=eU7kjSCp76VeK3KPZV3tW8VDo8bhPS9kqPBkw1exxhjDJrYyFVUkajncakiLJi6mpO
         gJp3rsBPLTQxXEnwqS+7RXfUpPGZx0WtFJrWgALE8BX53ZfWBcpih15CrAQLow3+vdrD
         Htvp9L4XsQQFQPGyHAR28LEjsg0+GdXzTUA5/bfinVcSN4SiDX6AnTM/v98WEyVqqSL2
         J3M9noLd+nBi3y/LxdV15HfH9vKI/qBZkcSbwbpx4Sr4BJZZQ2fio8/wl2Fm2/of303j
         w2hqwxPULEEdAXnQp7Mg2hf346cpctPWJzvBuOsDlv5LwwSaeDc9fSqOE99T8rhYC9O7
         vDBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771947535; x=1772552335; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X8FKYJ3J0ekbbk4xcl7+J9bdYsFozs7WVni5ylJT0VM=;
        b=2CT4bhlBV8T8sqvNIQqH66YoK3SgZbRm9tzaCQCUtcxsuxJmIswkIZia/xp263WONw
         bSHnJqmjvBjX3JFntELD/pA72LmnwARN+1vzf8NHH7nzXVBBgOH15d030fEViTj28IhN
         GXcjZHLahxV9Kpoo8MtzEHND7SG1414BAIwIdxBh1jy7wGmZuvYtOmU8JBSRHiZxCN4T
         5urEM2+Wv5IoSja43MPdecCQpoPZTWSgCuFFO9ttTcJiys9A3i3DyjBaq1E/TQWwvxhZ
         EqIJ0FIWnyo8jmdQ+x91Z+0zZU2mqbfbfPVUXVEBcOC3QFoJ+gv1UhTvYlLHbVB5qnOk
         RGsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771947535; x=1772552335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X8FKYJ3J0ekbbk4xcl7+J9bdYsFozs7WVni5ylJT0VM=;
        b=Y4sVlK7j2RM0SsBA7k3CnSXHlG50BBJVbuGpKaUroH6PX0e17Q889Jfg2NMs7WpQQy
         5rG1tk8Ja7hBNVi8EHmB7+k3PnrekOIyxznQ2JbRff/gD3lWdGTQCi7jw7HOolLvOD+M
         BrJZPSVxs10yy4QEOnMg7v6CgJ6AziZ16ocoUo3DabRDkZucHr7s+nturoJG+LLVQnqJ
         A2Gf88rBsRJAKeDo4o1XAPa6/lOfXzQzNH0PGk0gWdvsQ8EN7tvhCJE2wDhIgOozBabk
         naj7oX5eTaT5LWlbC8EVuUhPlQAywMwQiI8ktJ6bgCvkfzVtHdMegedhibVrgcZkDDq8
         DlVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEuWqGQM2VkkBiRoPjRgwYnPfYRb4+4RSOiAf2rNIVVF4lnsj6lj0TnVmvNdZmLdOAKYx+vm2Nh8KedWuo0Zs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRyca3OklA36SE8gDEzd9gJdP4OLR1WggKWd5ItMWLByhLDUiU
	ktillptZogGjc2tfp3zBwQS9m5vNlMDq/VmTMuB8+DMH7/O5+TeE+fOJZ95pDU6CcYu9dQoYWHm
	5F6LpW4ENamja0VjGndcQNEWxLPgt2i4QM7+SqzuD
X-Gm-Gg: AZuq6aLgR2kgQodd6mNqL4movTD8WZNoLr8LXQ8vKfCXf28FIW6ij04shw8C4sJNcKH
	t+otHE3I4GG3Okf4rKGqhhgoohYgy/QUZsUu0ehFfHdhjriCtczuSLdQuz76tgjjQp5bMN87yly
	f2TDPwZSJjfTTgOPSVPzThbAz1eNG61vJIod/Yqw7/OyLaQaTlEVQPUNmS6bjt48sgrrPeewnqx
	225AuCqI/jtnWeJhruDLSeZ+6tSr1iv48FqyzmQhV1QMyND7iBdzkPfx4t5UraThr+LO/VOif5v
	11qIruM=
X-Received: by 2002:ac8:7fc9:0:b0:506:1f23:e22c with SMTP id
 d75a77b69052e-5072c945f63mr13855391cf.6.1771947534197; Tue, 24 Feb 2026
 07:38:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223200254.4104651-1-ptikhomirov@virtuozzo.com>
 <20260223200254.4104651-2-ptikhomirov@virtuozzo.com> <CAEWA0a63QxMRqCwpCUqb5iKih31LY-2zX+--SkMGcP-Y19PqpQ@mail.gmail.com>
 <4de06792-d8ea-4f2e-848d-0dfccdb64253@virtuozzo.com>
In-Reply-To: <4de06792-d8ea-4f2e-848d-0dfccdb64253@virtuozzo.com>
From: Andrei Vagin <avagin@google.com>
Date: Tue, 24 Feb 2026 10:38:41 -0500
X-Gm-Features: AaiRm52_3mgUzdXl_m6MyGgb0dC1GRQ33mHZxHL8f5gge7x-9SdxQdJcgRbqcA0
Message-ID: <CAEWA0a61jLQxULDMXLcpZn2M-cJXxzSMyCS8C4y=YkFfHAEYng@mail.gmail.com>
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

On Tue, Feb 24, 2026 at 5:38=E2=80=AFAM Pavel Tikhomirov
<ptikhomirov@virtuozzo.com> wrote:
>
>
>
> On 2/24/26 08:02, Andrei Vagin wrote:
> > On Mon, Feb 23, 2026 at 3:03=E2=80=AFPM Pavel Tikhomirov
> > <ptikhomirov@virtuozzo.com> wrote:
> >>
> >> This effectively gives us an ability to create the pid namespace init =
as
> >> a child of the process (setns-ed to the pid namespace) different to th=
e
> >> process which created the pid namespace itself.
> >>
> >> Original problem:
> >>
> >> There is a cool set_tid feature in clone3() syscall, it allows you to
> >> create process with desired pids on multiple pid namespace levels. Whi=
ch
> >> is useful to restore processes in CRIU for nested pid namespace case.
> >>
> >> In nested container case we can potentially see this kind of pid/user
> >> namespace tree:
> >>
> >>                             Process
> >>                           =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
> >>     User NS0 =E2=94=80=E2=94=80=E2=96=B6 Pid NS0 =E2=94=80=E2=94=80=E2=
=96=B6 Pid p0 =E2=94=82
> >>         =E2=94=82           =E2=94=82     =E2=94=82         =E2=94=82
> >>         =E2=96=BC           =E2=96=BC     =E2=94=82         =E2=94=82
> >>     User NS1 =E2=94=80=E2=94=80=E2=96=B6 Pid NS1 =E2=94=80=E2=94=80=E2=
=96=B6 Pid p1 =E2=94=82
> >>         =E2=94=82           =E2=94=82     =E2=94=82         =E2=94=82
> >>        ...         ...    =E2=94=82   ...   =E2=94=82
> >>         =E2=94=82           =E2=94=82     =E2=94=82         =E2=94=82
> >>         =E2=96=BC           =E2=96=BC     =E2=94=82         =E2=94=82
> >>     User NSn =E2=94=80=E2=94=80=E2=96=B6 Pid NSn =E2=94=80=E2=94=80=E2=
=96=B6 Pid pn =E2=94=82
> >>                           =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98
> >>
> >> So to create the "Process" and set pids {p0, p1, ... pn} for it on all
> >> pid namespace levels we can use clone3() syscall set_tid feature, BUT
> >> the syscall does not allow you to set pid on pid namespace levels you
> >> don't have permission to. So basically you have to be in "User NS0" wh=
en
> >> creating the "Process" to actually be able to set pids on all levels.
> >>
> >> It is ok for almost any process, but with pid namespace init this does
> >> not work, as currently we can only create pid namespace init and the p=
id
> >> namespace itself simultaneously, so to make "Pid NSn" owned by "User
> >> NSn" we have to be in the "User NSn".
> >>
> >> We can't possibly be in "User NS0" and "User NSn" at the same time,
> >> hence the problem.
> >>
> >> Alternative solution:
> >>
> >> Yes, for the case of pid namespace init we can use old and gold
> >> /proc/sys/kernel/ns_last_pid interface on the levels lower than n. But
> >> it is much more complicated and introduces tons of extra code to do. I=
t
> >> would be nice to make clone3() set_tid interface also aplicable to thi=
s
> >> corner case.
> >>
> >> Implementation:
> >>
> >> Now when anyone can setns to the pid namespace before the creation of
> >> init, and thus multiple processes can fork children to the pid
> >> namespace, we enforce that the first process created is always the ini=
t,
> >> and only allow other processes after the init sets
> >> pid_namespace->child_reaper.
> >>
> >> To avoid possible problems related to cpu/compiler optimizations aroun=
d
> >> ->child_reaper, let's use WRITE_ONCE (additional to task_list lock)
> >> everywhere we write it and use READ_ONCE everywhere we read it without
> >> explicit lock. Note: we already had READ_ONCE in nsfs_fh_to_dentry().
> >>
> >> Signed-off-by: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
> >>
> >> --
> >> v2: Use *_ONCE for ->child_reaper accesses atomicity, and avoid taking
> >> task_list lock for reading it. Rebase to master, and thus remove
> >> now excess pidns_ready variable.
> >>
> >> Note: I didn't find anything in copy_process() around setting the
> >> ->child_reaper which can influence the pid namespace, so it looks like
> >> the pid namespace is fully setup at the point when init sets
> >> ->child_reaper to receive more processes. Thus tasklist lock looks
> >> excess in pidns_for_children_get()'s ->child_reaper check and it shoul=
d
> >> be safe not to have it in the corresponding checks in alloc_pid().
> >> ---
> >>  kernel/exit.c          | 2 +-
> >>  kernel/fork.c          | 2 +-
> >>  kernel/pid.c           | 5 +++--
> >>  kernel/pid_namespace.c | 9 ---------
> >>  4 files changed, 5 insertions(+), 13 deletions(-)
> >>
> >> diff --git a/kernel/exit.c b/kernel/exit.c
> >> index 8a87021211ae..567fc3b7b0f9 100644
> >> --- a/kernel/exit.c
> >> +++ b/kernel/exit.c
> >> @@ -608,7 +608,7 @@ static struct task_struct *find_child_reaper(struc=
t task_struct *father,
> >>
> >>         reaper =3D find_alive_thread(father);
> >>         if (reaper) {
> >> -               pid_ns->child_reaper =3D reaper;
> >> +               WRITE_ONCE(pid_ns->child_reaper, reaper);
> >>                 return reaper;
> >>         }
> >>
> >> diff --git a/kernel/fork.c b/kernel/fork.c
> >> index e832da9d15a4..27d0cdbca67e 100644
> >> --- a/kernel/fork.c
> >> +++ b/kernel/fork.c
> >> @@ -2423,7 +2423,7 @@ __latent_entropy struct task_struct *copy_proces=
s(
> >>                         init_task_pid(p, PIDTYPE_SID, task_session(cur=
rent));
> >>
> >>                         if (is_child_reaper(pid)) {
> >> -                               ns_of_pid(pid)->child_reaper =3D p;
> >> +                               WRITE_ONCE(ns_of_pid(pid)->child_reape=
r, p);
> >>                                 p->signal->flags |=3D SIGNAL_UNKILLABL=
E;
> >>                         }
> >>                         p->signal->shared_pending.signal =3D delayed.s=
ignal;
> >> diff --git a/kernel/pid.c b/kernel/pid.c
> >> index 3b96571d0fe6..e6116e131d8d 100644
> >> --- a/kernel/pid.c
> >> +++ b/kernel/pid.c
> >> @@ -219,7 +219,7 @@ struct pid *alloc_pid(struct pid_namespace *ns, pi=
d_t *arg_set_tid,
> >>                          * Also fail if a PID !=3D 1 is requested and
> >>                          * no PID 1 exists.
> >>                          */
> >> -                       if (tid !=3D 1 && !tmp->child_reaper)
> >> +                       if (tid !=3D 1 && !READ_ONCE(tmp->child_reaper=
))
> >>                                 goto out_abort;
> >>                         retval =3D -EPERM;
> >>                         if (!checkpoint_restore_ns_capable(tmp->user_n=
s))
> >> @@ -247,8 +247,9 @@ struct pid *alloc_pid(struct pid_namespace *ns, pi=
d_t *arg_set_tid,
> >>                          * alreay in use. Return EEXIST in that case.
> >>                          */
> >>                         if (nr =3D=3D -ENOSPC)
> >> -
> >>                                 nr =3D -EEXIST;
> >> +               } else if (!READ_ONCE(tmp->child_reaper) && idr_get_cu=
rsor(&tmp->idr) !=3D 0) {
> >
> > I think it is better to update pid_ns_ctl_handler to prevent setting
> > ns_last_pid in a pidns
> > without init. Otherwise, figuring out why fork returns EINVAL can be tr=
icky.
>
> Hm, I think pid_ns_ctl_handler(), as it uses current active pid namespace=
 can
> only work if current is already fully (ns/pid) in the pid namespace, and =
thus
> the init is also already there. So it's implicitly protected from change
> before init creation.
>
> This check here is more for the concurrent alloc_pid() case. When one pro=
cess
> in alloc_pid() successfully allocated the pid and than, for instance, hit=
 the
> pidfs_add_pid() error and is going to free_pid(), but the pid 1 is remain=
s yet
> allocated from idr and the cursor is on 2 at the moment. At the same time=
 the
> concurrent process may get to alloc_pid(), and will see cursor on 2, it s=
hould
> not be able to create a process as this process will get pid 2 and will b=
e
> created before init.
>
> And in general (non concurrent case) it makes sense to only allow allocat=
ing 1,
> for the first process.

In this case, there is likely a race condition. Two alloc_pid() calls
can run concurrently,
where idr_get_cursor() returns 0 in both instances. Consequently, both
will attempt to
allocate PIDs, but only one will actually receive PID 1. I think this
check needs to
be moved after idr_alloc_cyclic() to verify the actual value that was alloc=
ated.


>
> >
> >> +                       nr =3D -EINVAL;
> >>                 } else {
> >>                         int pid_min =3D 1;
> >>                         /*
>
> --
> Best regards, Pavel Tikhomirov
> Senior Software Developer, Virtuozzo.
>
