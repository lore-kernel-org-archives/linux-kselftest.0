Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AFC1E5B9A
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 00:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771979025; cv=pass; b=cDlKx68/5tcCe19kSuPmCZcSRz45iwq0iLSzLa4oKZgYfQngFXJ3qpatkGgu7M46gI5BBcKW3MTb5u8M6jFU+HLxqReIvvI0cjVv+2vCStMPTL9q8SPlwW5EByRaHlwHVS0wBxsgd6ts5MYljqk3XYUsfCW2Hzk+Lu4Ju9hrkTk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771979025; c=relaxed/simple;
	bh=UP+6bvsRd9fjmnF9nU9A7fSAw/70nxadUZvpVE00eHE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RttT2GnS6BGSAF8dTblvJwFU325r1qXuhfhE36HU7Orv3RN+Tw68gfPQj4D2O36FN6ZfBinizN2T4azweYbM1Sps2HiRBzVEuj6Z024H55XWGJx5j0WpB4uS+OqaPyO/eAiRB8RF+jH9l2Oa9sU4XnuKLwL58d3S2XzHMC4NyeI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ajUJT+88; arc=pass smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ajUJT+88"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7d1872504cbso439264a34.0
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 16:23:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771979023; cv=none;
        d=google.com; s=arc-20240605;
        b=j5VZLbXES52L0Pj64BYZWiVW6dFAovgrZQHiMs6cex/HpdZbueB6KFqL0he9orMh/5
         jLij0HjJ2TuTrTjC7YL/4u6rp8K5v0sTEht7vO9r353e+KOJ/3A8lpqbDCBDcTsGGkVn
         +TbnC10ktOy9MROPxth/VnqGZaC+GMAsbRXue/MOvbrn5q03IDrofgKf3nGN4vGwDpaB
         j5BqWainRMSYWdp64lS3fKSBpZotRF2Tz2vfXN1MFUHBdsUJlRrCFn04nTcf4RsL7z66
         GQVYA4sZImD9HHgvx7g80RgJYc4PHZs/ZuGx/z77bDvVeG9Hbhr+YKRYMtrh6HszGdqk
         gm2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uamfHDmCrLi6nzaR6RT4ftOE05lQx2cwZblWDDjb7zk=;
        fh=9xFdj5J3WOAGbZa52UZCOpiCLSWYTrRQ6YFCFSpsw/E=;
        b=eP06VU3r+0l5HzDCk1Ir7UG5sHFANGdoipt2bA8Yr9LQVJ5e9TvvxYvtoECGYqdgUA
         J01WxgRdKFAY9YYDvgpfntOoy6cSztX7MilUuRbkPOTAZaXvAqWJ6jek85BPsssfATYM
         JZpiACu0f2Jz2Ottrrz8t/nF9KaY6xMmAJaUgN4h04TI9S9mi0rR77HLJ4VZhehK6Qia
         baOCyod/qmbSGPjM9lFy44dbmRguCr63eq8396onXVyGx9nfTsw2RQhI+a6N6ctr43xe
         JpL+RUEym7YE+qiDUoXb+awIN5B5Si26RDkjHwHjqBNWBl0drSIjfrtWGwccpho5BC/Y
         q0bg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771979023; x=1772583823; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uamfHDmCrLi6nzaR6RT4ftOE05lQx2cwZblWDDjb7zk=;
        b=ajUJT+88qRM3uzrPYG1ccBG6xWAAfKgjNwWlX4gitYDZ9xmb24H7JxhFoFUYRwKl0F
         8OGvgKPkohtJ9tGdAoAEATUCTpJ9sAk9U8g0E/byokCbA/PmSmnh0cqHPEA6b1C5qUpV
         7etRlQN6v/rm0mZiYMUEdD3yoKu+wQvsTe+tYjzXbuP7VmG7liWefQHHizglFVJCB2OT
         b6LJyhtYphEpBzCLdOXLs8NsohSdWXFac30AkBop1THg7O/QMkzc2odnr028HGCHJFWh
         2TibBFnP1WTnoyRrANvYkdgG6G2hWdqNf/cd2TYJdL5bICg8bqwnIdr26QD9YP3G4XEi
         6x9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771979023; x=1772583823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uamfHDmCrLi6nzaR6RT4ftOE05lQx2cwZblWDDjb7zk=;
        b=qurW8/tKylt35l69LXywFFmfkRufOA6ySuo0xAJP0vbk+8elHWg8NRyH9DbIy0bWbd
         Kg7cuPfKGqi0VbvQNO52SRlUjB9Js8ucgghwUVxYHLjuXyWl/TneltVzUkARQ7LI4Kj/
         btqViHwDZq8znTWeK3zeFBSS617P6lrcJCAgWtrjfSivwPc1kkCk1//Dj/2gY+EUFook
         hPwbDkTdBzYLJ7OcNdKdBiBa7xlglxpoNzEOQuTVfUyWrwtTyCp+66R1MJ4oft1p1YIu
         greQghil/zb6sBtCIXNC4kzKytkTsW+ooi9zeqZnEALDg9xEUp93+lqF4eO9EenEZtSX
         JbXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVE99I+LIh1Povdvhru+dG6cgWyd9l1LOOFL9uXeb+4EEVBoRBfBSsGuBpN6xCw55ymW6CJF8Hy1jKyvjbV2CY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq08tbeb6PdAzOOaBlPCBPp/DaDKnMGTrsk6OIcX/W8tZb6kq6
	WqDWtquODHXKBjFH7dan8cFtT4vfr96hP2Oiylg4dSdlTSJtI++Di+U195Mg676G9VFbQzCGQtG
	X8O2ZUz5JFItTwSFnDSZWlkYhlRy6OYI=
X-Gm-Gg: AZuq6aLTiz3bvRPgQT8xwCBB0YLmMrmrfkYCLA1M6HHWnIDyNREE/zhWsBpEWbmepCz
	Asevh9YYH9IG5e5rggO3VisIbLuL21Lm4UnNgwBqmjMAP5oCQDG/6u9I2ikESOh+BIrb+AGvPVN
	BnlOUNf7Zy0iTSwpOyesYeZ6pk9VNFkP6PFCpK8OkIVD1pb2wZFxjqsRbL2D2tZE4JDuljPq4ip
	Ls+qiRrgVyBHvKwOU7oHB4MPl3BKwk01N+Hp1FrUVEjydrh8afVTDB1FeSuNlNkyv38sWMlhNI3
	VXqrAvg=
X-Received: by 2002:a05:6830:82cf:b0:7d4:ba6d:e33b with SMTP id
 46e09a7af769-7d572f732e4mr1157163a34.14.1771979022917; Tue, 24 Feb 2026
 16:23:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260224164852.306583-1-ptikhomirov@virtuozzo.com> <20260224164852.306583-3-ptikhomirov@virtuozzo.com>
In-Reply-To: <20260224164852.306583-3-ptikhomirov@virtuozzo.com>
From: Andrei Vagin <avagin@gmail.com>
Date: Tue, 24 Feb 2026 16:23:31 -0800
X-Gm-Features: AaiRm51sc6PYns4iCYnbIf9VDxONZDk0EGBX4WlziIcqv7s5ocyQB1y1CIul7gs
Message-ID: <CANaxB-znXjfh5s9ro127TGONsu6PieuaJ1vB3PMVFeV4Eo8pkQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] pid: check init is created first after idr alloc
To: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, Oleg Nesterov <oleg@redhat.com>
Cc: Christian Brauner <brauner@kernel.org>, Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Jan Kara <jack@suse.cz>, Aleksa Sarai <cyphar@cyphar.com>, Andrei Vagin <avagin@google.com>, 
	Kirill Tkhai <tkhai@ya.ru>, Alexander Mikhalitsyn <alexander@mihalicyn.com>, Adrian Reber <areber@redhat.com>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 9:02=E2=80=AFAM Pavel Tikhomirov
<ptikhomirov@virtuozzo.com> wrote:
>
> This moves the condition (tid !=3D 1 && !tmp->child_reaper) to after idr
> alloc, so it not only covers that first process in pid namespace has pid
> 1 in case of clone3(set_tid) requesting wrong pid, but also if idr
> itself gives wrong pid for some reason.
>
> This could've been the case before this patch, when creating first
> process the alloc_pid()->pidfs_add_pid() code path fails, so that the
> idr->idr_next is non zero anymore and next process calling to
> alloc_pid(), will get 2 as a pid from idr_alloc_cyclic(). Effectively
> leading to init-less pid namespace, which is a bug.

I don't think this is an issue right now, as we only allow one attempt
to create the init. If that first attempt fails, free_pid will disable
further PID allocations in the target namespace.

It is a sort of off-topic, because we will definitely need this logic
with the next patch in this series.

>
> Note: This is also a preparation for the next patch in the series, which
> will introduce an ability of creating init from the task different to
> the task which had created the pid namespace. Needed to make sure that
> init is always first, even in this new case.
>
> Suggested-by: Oleg Nesterov <oleg@redhat.com>
> Signed-off-by: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
> --
> v3: Split from main commit. Merge two checks of ->child_reaper into one.
> ---
>  kernel/pid.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/kernel/pid.c b/kernel/pid.c
> index 76c2744493e2..ebf013f35cb3 100644
> --- a/kernel/pid.c
> +++ b/kernel/pid.c
> @@ -215,12 +215,6 @@ struct pid *alloc_pid(struct pid_namespace *ns, pid_=
t *arg_set_tid,
>                         retval =3D -EINVAL;
>                         if (tid < 1 || tid >=3D pid_max[ns->level - i])
>                                 goto out_abort;
> -                       /*
> -                        * Also fail if a PID !=3D 1 is requested and
> -                        * no PID 1 exists.
> -                        */
> -                       if (tid !=3D 1 && !READ_ONCE(tmp->child_reaper))
> -                               goto out_abort;
>                         retval =3D -EPERM;
>                         if (!checkpoint_restore_ns_capable(tmp->user_ns))
>                                 goto out_abort;
> @@ -296,9 +290,18 @@ struct pid *alloc_pid(struct pid_namespace *ns, pid_=
t *arg_set_tid,
>
>                 pid->numbers[i].nr =3D nr;
>                 pid->numbers[i].ns =3D tmp;
> -               tmp =3D tmp->parent;
>                 i--;
>                 retried_preload =3D false;
> +
> +               /*
> +                * PID 1 (init) must be created first.
> +                */
> +               if (!READ_ONCE(tmp->child_reaper) && nr !=3D 1) {
> +                       retval =3D -EINVAL;

According to the comment below, we should probably return ENOMEM if this
is a subsequent attempt to create the init process. In the next patch,
we may want to return EAGAIN if there is a concurrent attempt to create
the first process.

This isn't directly related to this patch, but why do we check
"ns->pid_allocated & PIDNS_ADDING" after allocating all pids?  Wouldn't
it be more reasonable to do that right after taking the pidmap_lock?

> +                       goto out_free;
> +               }
> +
> +               tmp =3D tmp->parent;
>         }
>
>         /*
> --
> 2.53.0
>
>
