Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794948842;
	b=gr0YxTVm3LyPNlmV9bhP/X2QZtz6l7sxN08/QuWQWLpZWZ8zdkJIampLUVm5TgPsYbR/
	 fj991SLdjXBgmD8sZHQ4Q7E8QAmy7oM/p+pUTGYyY9Speu7ynJCEXgJBKRLNrr582CmZC
	 kQx3vwGbKmGRvA1Fj+MqYgTlWww9c4m0dr0fB5/5z+LjlZdm/TRA6KQEck3TI9M/PUynX
	 FrilpTPbTwj4BFbG+20x7RRRYbMV4xx0BcBF0mjQaYJ21TthcYmDd4NN5VMfTE17HrNJX
	 mWFUoPPZ2ISXwnPPMCGQy90sURd6xMjJTt8hugngoSARaPdI73M09ZGfYUXHQ96Zy6w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794948842;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lxMCjoGZWG4QAWp+HpCFavF1sxg7OOCbkVFjQuSNzhA=;
	b=HVHUq6hFTjwST0zmzbcibm030Kd5c/Yf/qbPJzv6xA6/eYO+rv0xiqJtCmkxzOD9YI/C
	 F0alArbC5K97BcOipcd+wf6GrUhXzvMVzf9D/FrwUDWHD04Oo4d/L14UWiF8GFnAbAiN4
	 YRbUKFORLCJ3fZu7k3Z1z12a+IqE0ljNdQCwm8atuSznt7ND1QQLwsmCoc94xtmJAXzAl
	 AB1LL1Pwv11WlRRm1r+dMZigEicraiTy6Q+6lVJaGZU1f9BkjFrjgzfMTjfpx0+oT15ug
	 mQ57YccoQtnBmfFks6bIY9tYAPDkkv95dX94ED3WoYS0cum2oT/bpfAqusCgE1NN7PQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=amacapital.net;
	spf=pass smtp.mailfrom=amacapital.net;
	dkim=pass header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=LslQjUmg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB80606A330
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 20:54:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FB80606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=LslQjUmg
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5c15956ce07so1244009e87.0
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 12:54:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794948840; cv=none;
        d=google.com; s=arc-20260327;
        b=jn3EBA79gjqUKoKBPKjxvoyXSfM5Y6tyC+bY5UufrNJRZMKe61KbhgU9ZOQ8zyYTMB
         7S3RwwXWnhFzlsWQ3/FuQstleWUr/a7Nny3BdMBM2+JLUTeVuAr7/tGcsfQ0wuNibrfc
         G9JJ5NwCyKmtFwu31fwHhQ2c0Pbce7p8OdCugbnuqa1Ys7/0Y4kqbj2kQWa07OoUUO4C
         XorM6xjfS7E/syZ4m453QTEtO9xXJTrONQFlUnYAStS4PoI8Leukc7VuAJxFLdXmml8x
         p0o4tGuVA6sVyJ1I5f5/rWnQPdqv2Kw0UmIjMMm7dH37Fq3bz+RDH0Pj4A2F90gAiM2w
         CQ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lxMCjoGZWG4QAWp+HpCFavF1sxg7OOCbkVFjQuSNzhA=;
        fh=PPsBS++fjzHBRb7STJgB99g2PjwoNg/ih/2XYmz+gnE=;
        b=Gscq0Qb6sDttUsX5jPBN/jhg/MSl/WEn7sGZ5QmmrY7r8efOvbyXagodTKFfDK3YUm
         Qyx5XJuZkmLBrjvepwgfcMyE3ErXKqlI9lh4u09zmnOA6gGM9Dd2CR0f2BuOG7vqv63T
         JNw/o2UuIIiILov/65Ing6+weErxP9/2pIYcS/g65QYrrHmTWDLPar+ZK3EqzenakuCW
         0MhbRYHjnMtTcZj2QYW7X3+s5lp8ehugaLuNftKE1hRVBhUUguLpzvUDMCWWVLwyleg6
         8tvNB7syny1xS+rX/Jn/hjNuh8p9sSvwL+l6aXrtrdmaekR8l1n/deFvD3kAdciKQ36S
         t1hw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20260707.gappssmtp.com; s=20260707; t=1794948840; x=1795553640; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lxMCjoGZWG4QAWp+HpCFavF1sxg7OOCbkVFjQuSNzhA=;
        b=LslQjUmgXp7ppoB5z9C6lIh34ojfvcQ8nzfZ/Bus0FFDGG0DUi+QbKakM0fZFVIykq
         5mE0e/s/CpUqdx5hmSPPf4ZqfdbbG/4eR1cdypM9sQ7xLq3NiWuooniPj3c+oOnP/Gs/
         9eulqTIqNDLgU092uHWrXSQFQOUQ0Ybq8I+KARDSFo99l3A76mmdMOP5EIWjKF4SsU8k
         CLRnBvH95KDC8joQwrmPsfza+TxJts5K4ekF1BkXcERhq9o5i5YAd+8YKoGtExZnN7ex
         +BuNP6j+NU8hBGd6crUPCUF5Rx+iT4Q8fvcxMfppbSleGXT6F0Sca+oO5jRTOaHafzSk
         UZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794948840; x=1795553640;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lxMCjoGZWG4QAWp+HpCFavF1sxg7OOCbkVFjQuSNzhA=;
        b=tWegSbfpwIzpLJARP0d9yayspFPD5pFEB5FuZkuKDp/yNtyMCDXTukWCb2KdeU5Yg3
         TyUk3VR2kMIniBZoSRqBcuMdcvCm+fxMiGG9imFt9al0dcvR8TJE8mwSiH17lxNUXU4c
         KazgwaQ1OrYcWQy47OAZePOqutksRUzveWY3GBCUc0QyFMmqNXZ0yNNA68OZWQtTZEgW
         LDS+ABLVG20IdH8F5WQoQwfnli1TPaatVL0gp4wPaXfJPoMTpi8s6rkJ2awr3hykGD7j
         D1OZGL83YIYcB9RL3YDnRjPDGCRdpg0j9s4WwG0GBUrVGsWS/ej6cuCM3BKt2U5qFcGU
         4LMg==
X-Forwarded-Encrypted: i=1; AL+hErFhSgH2ymg/vBh01SYZYLYwZIiya2Tu8m9EYbd3zZK3etZdV1nTWvc8Omb/RfW8dC7vL/Bu92hEdM+enU/dtwU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HFsWVdrbwh92QDmLBim9v7PwhmYnAitk84FCdbeKaf3fsbDmG
	QAhdMdHlRPA2mNlgPM9+9c47Im7hm/a8URMiyn4oDId2f7CnBpCQGyaY1rW5Dc55iYR6+2i/RFn
	Ke02CRe+Pui/p9IspB/g0ai09SqHAGFb1SE5ZaSLN
X-Gm-Gg: AYBFou3/K4ifrkX0mDOjzVZ+ZMCXUPPEwRe+knGSvyu1EIlER4sLoJzvL5WCrxd6MvJ
	eQ6PWC559gNUAyTLdBRFaYgEBdd+bbk+3W+OKN9oRUzBgr3eGfs7FX0MpV+ivbbS7ZK8EXJOLL0
	u2IylxnZ2GHK2O1LC3XKpCmVkXuFujlw1+e7m8RoLiRMw9DNeX+QohArWoJ8kUX0Fcbyg+px3w+
	3I+fEUOlwr4IrIK4EglhZV6+D+MRTVdAGJH/egnhjJ7xBJ+SCSg1S5PbPPlTI5rsYOl+C0BuqVl
	Y7AGS/a319m3kuyH/ME3wslqhP0YaTJ8qbVQioyQxAl3Ef39VAbFRU1ZOQpjVFBgCm6j4XX9lAb
	zldDWkS3ihTQ+dPxfBlOJUK0WfSXSMAoISg==
X-Received: by 2002:a05:6512:224e:b0:5bf:b96b:89f4 with SMTP id
 2adb3069b0e04-5c1a0f1b8e2mr1319677e87.19.1794948840370; Tue, 17 Nov 2026
 12:54:00 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117050841.3289652-1-jarkko@kernel.org> <20261117050841.3289652-8-jarkko@kernel.org>
 <CALCETrWtbUFQGDOCHkxAN9O4i29ixfL5KKF1Cqw2-CjxKwC6gQ@mail.gmail.com> <avyzFnKQrNOid25y@kernel.org>
In-Reply-To: <avyzFnKQrNOid25y@kernel.org>
From: Andy Lutomirski <luto@amacapital.net>
Date: Tue, 17 Nov 2026 12:53:48 -0800
X-Gm-Features: Aa3M54qx88-je4c1jdCxPXUBmX_p3qTxglmaltFgKplV78kiTxOHsj4XFF6xQaI
Message-ID: <CALCETrWHxjrQvRC66d1fvkZw1e8_+38BdzmjSYHmqRjXZnD8nw@mail.gmail.com>
Subject: Re: [RFC PATCH 07/13] rootns: Add rootns_enter() system call
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, 
	Ben Segall <bsegall@google.com>, Christian Brauner <brauner@kernel.org>, 
	David Hildenbrand <david@kernel.org>, David Howells <dhowells@redhat.com>, 
	Davidlohr Bueso <dave@stgolabs.net>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Ingo Molnar <mingo@redhat.com>, Jan Kara <jack@suse.cz>, Jonathan Corbet <corbet@lwn.net>, 
	Juri Lelli <juri.lelli@redhat.com>, Kees Cook <kees@kernel.org>, 
	K Prateek Nayak <kprateek.nayak@amd.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Manfred Spraul <manfred@colorfullife.com>, Mel Gorman <mgorman@suse.de>, 
	Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, Neal Gompa <neal@gompa.dev>, 
	Paul Moore <paul@paul-moore.com>, Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, 
	Peter Zijlstra <peterz@infradead.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Serge Hallyn <sergeh@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Suren Baghdasaryan <surenb@google.com>, 
	Valentin Schneider <vschneid@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Vlastimil Babka <vbabka@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 12:03=E2=80=AFPM Jarkko Sakkinen <jarkko@kernel.org=
> wrote:
>
> On Tue, Nov 17, 2026 at 09:42:26AM -0800, Andy Lutomirski wrote:
> > On Mon, Nov 16, 2026 at 9:09=E2=80=AFPM Jarkko Sakkinen <jarkko@kernel.=
org> wrote:
> > >
> > > Multithreaded userspace daemons cannot call setns(CLONE_NEWUSER) or
> > > safely mutate process-wide filesystem state in place before spawning =
a
> > > child into a target namespace set.
> > >
> > > Add the rootns_enter() system call to fork a child process directly i=
nto
> > > a rootns whose root mount has been installed. Transition the rootns f=
rom
> > > ROOTNS_READY through ROOTNS_FORKING to ROOTNS_RUNNING for the first
> > > process so it becomes PID 1, serialize concurrent entrants on waitq
> > > until bootstrap resolves, and admit subsequent callers into the runni=
ng
> > > PID namespace until teardown begins.
> > >
> > > Require CAP_SYS_ADMIN in the target user namespace, forbid credential=
 or
> > > PR_SET_NO_NEW_PRIVS privilege escalation
> >
> > Why are you disallowing this if no_new_privs?
>
> For no any good reason at all apparently: no_new_privs is inherited by
> the child and only restricts privilege gain across execve(), whereas
> user_namespace transitions are allowed under it.
>
> So yeah, it's a spurious check, and thus I'll drop it.
>
> > This isn't necessarily a showstopper, but fork() is really quite slow
> > in many cases.  It would be nice to have a more spawn-like API
> > available.  I assume it's possible to open a file in the target's
> > mountns by some sane API even without entering that mountns, as a side
> > effect of how the fsopen / move_mount mechanism works.
>
>
> If the caller retains the O_PATH fd returned by fsmount() for "/", it is
> able to open files inside the target mount tree via openat2(...,
> RESOLVE_IN_ROOT) w/o entering the mount namespace, and pass the
> resulting fd to execveat().
>
> For avoiding full fork(), there are (at least) two options:
>
> 1. A rootns flag in clone3() (e.g., CLONE_INTO_ROOTNS) and a rootns fd
>    in struct clone_args (disallowing incompatible CLONE_NEW*, CLONE_FS,
>    CLONE_THREAD, ...), and callers can pair it with CLONE_VM | CLONE_VFOR=
K.
> 2. A flags parameter in rootns_enter() (e.g., ROOTNS_ENTER_VFORK), which
>    would map directly to CLONE_VM | CLONE_VFORK.

There's also been some work on using a pidfd-like object to build and
spawn a subprocess.  Supporting that would make sense, but I don't
know to what extent these projects should block each other.

--=20
Andy Lutomirski
AMA Capital Management, LLC
