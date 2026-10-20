Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792477342;
	b=zwiIn9GFzpPAyTtHK1hBNfpWCdg2GfJs2S67GhtT5pee6ztecmzK58ASaav6+1nH4gZh
	 x8u/2lwbgR5KVFjgZTYYvizrB6JzUmdVntFZQBtw2aOnaQYAAp7IBYPax6lKJ6jWmBX7h
	 jbdK1y9lKhONI6RVF1ITjugV9sDRsUfdnmxXNXwA2wTuJV/Xnm80wrQZI7ReMAmp4wLV7
	 bIM5gLnyuxAfgSmVA/FC8Gby8naMFBNdF2buhe3t5ZStEiKtxk33Y6pbb0Impw9KtpePZ
	 f+y6jO7DrtQA0BwNHKyf7qqNVsyF6acxSyI/rOdBZs2xtJzoQiPxKydlo97wwQIeGpA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792477342;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kf8/+k3Jjj7ru8eZKZwxf7K+ABa74mbZZPeMICUo+Y4=;
	b=pAWl2TmIzNNhbSm51qLClVdRxUvQ12rr+AN2iMUtj5cjxkPldo80Dcsh6VTW6SRGqKa0
	 eoTXR+dseEgblbMZh3yjWd3yrC8SIT+D4NrPMxijFfPtw7MzbHWTIIdWgxH1V9UR6BXcZ
	 +S61bwIWSICnjDe1wn9ITe6qYaRb6WS4rq9gFZPsLavhaB/rKhRw28j6I7BgqZqRxqS14
	 uZe+UK1jitkiKwHi+5G3+lpAs2dUR/q/o8uQHhUmrjaix/ZgrmCpNmbycsdCJoifybd+E
	 r3DmmDZgNA4UYZTBkIQK0oowKK3MsCJXwS51dTQNJkeGxXVheBPapuytVl68TkUgOSQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lKX2o7+H;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7FD606A31F
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 06:22:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A7FD606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lKX2o7+H
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e98798cbddso11185875ad.0
        for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 23:22:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792477341; cv=none;
        d=google.com; s=arc-20260327;
        b=nILsGZwefvakUddeZ2hwwpwv6vbLLp+8gl6YVTY3aAtGgfsT2eK6JDUIfPBLy5BQHm
         aztnUnxVYo2n+cDLJqXHDHJYCB23Nvd8y+bLjR7MhI9kOZXfvgYLkMcgd58sVVm3YdOJ
         DIVUgznsODOq5pVHV1mbuB4aBQQABtat0oZgMCBd7lghPNS6lOy4c6wr+mgYyd8YYuIE
         lm0eo5QPJ7qaPdxLLp3HPvogARV71/6IQ6pC5E8jlMU03bCWjr+qUXZevd37fzLFgVgc
         4tJQE9yfW3Oh/llrHco7/kn/oV1D/rOc6AlKB/j4xjMRTT0tz1Nzw+3iiEWtG9cX6Zzl
         1atg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kf8/+k3Jjj7ru8eZKZwxf7K+ABa74mbZZPeMICUo+Y4=;
        fh=OiBWbf01Gg/lJaXAaqPGSTEhm/2sy/xbXzhmv4vnD1M=;
        b=adY5VNDPBdql4ITMPhwXeQRR1Z8coLg2nfLffW9QSO/0LjEDtaVy5P8/SI5A1fn01D
         wx6+oC9BbzeLnOQFalUhI27NABrla3xpvBuagiZTX/Q7ST4fINQ7JE7n/8E3/dccErvF
         hVNo5YQTVgwbJcs9RM7cP49L1taZg9YVzhip9Tu/83uHOXnhuN+qI0IVT76adxnutww8
         4we3u1/Uqdms9bWfF9ZTg7xps32H93pGfnbCowFnfJUosPj+hzGI1zoYe+l8f16zk4FW
         H+TgdUeqwUfGPt3zXQr/hNHg1IVPp5ZQUA4WPB+/RpS1V8Trlk/oMQWZ87xnV4UDd176
         issA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792477341; x=1793082141; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kf8/+k3Jjj7ru8eZKZwxf7K+ABa74mbZZPeMICUo+Y4=;
        b=lKX2o7+HuD5fpQzZNTLEVq9KL1e8Mg8z16cabHaSJ/2C7LS6z3N6JJwzDTah6U7qBI
         0Lj4Nw1Z6+fnib8fx9+Q7HnXTwIWwK9PuO4Ap4RAkWDiDNOrml42b3GiPpLZ7uqQbsYm
         2CWHNx7TTHt2PQdvvmwyLu6JL14GB2SIAM3kcTBbj7gXgc9FNj5+tctXSfSLVQhuQ8Av
         Wjt1JUWa7uWleeCanSskhVMMuuU0Gpu544YbSCxqAF1tJH5nTQd2lquAcOtWdgTEpbL3
         rWxG3PRAJVitBBMaUDBkGgKW7mWpMCzCIfVJDBTZ/TtIQUwdIa9PTmGbyArlFuSM8Yai
         Zzmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792477341; x=1793082141;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kf8/+k3Jjj7ru8eZKZwxf7K+ABa74mbZZPeMICUo+Y4=;
        b=uWsl7NARXupw56Hh4RxsRN1C9FMmplHXS0iPmbVrenhA3erHD3pQpGWb/nBGgAqI/a
         cZPjpbgfD4ZZsViMo8M/7nthd6JypjcjVfLP7LXSBZDiqCGeNHb2e/NCp+2QY9GHJg6g
         2qQuGrbVGFjlWPHXxm2NEJ0VxJMtwzKpGHUsyo6Wd/LflZMjpbV8f5hFy+L59BR3fFYR
         zR+lPdW0ziBV1OoU82fZc07LdyHeOUSXIFxHt8J35DG0q0qOX9uuDKc2Lk04vZV9wZAE
         c5qszNIKsIpYLhxaLcLDUJMLxiedXE/n9hWnDyzb30D51i3Ho40hKOMcThCDfIeAw1Ey
         ornQ==
X-Forwarded-Encrypted: i=1; AKwUvByPIwmnR+n1QBXDjrdq1r17N1nIFT5sV5wOJkbRSUEy2bY6xETC4vdCinHH5ILZ89O0K1s4AZFCm2x7LuUEPEk=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3rLh2LUbRhPH7B1SvwJUyMV4Qt7iy6np7THLcOIT1Q2FfZQd2
	2k+9boufFmssBO7Zs0D2k5sowJSuP5XI7QxE7GYY6kimABK2QU3ZkjvGgELP3gMKPOY2ILO5wpZ
	dYtET/Knfjlt2341JWkCqJJQYg2bMLO0=
X-Gm-Gg: AYBFou0vTdLQsv+MzuVzJQY0uwWjxOwskaclH1aPLJPei8VffynLImxhv8p66utyP7l
	RBy9rIoesD7lS2GLar9/CPrEGqGEmiCN4pwb1NuKauPO1/6OqBAk8dGeQn5pce3OVHNpdJXcNNu
	yiZdmvbhtxJkTb0uqiHZisOWRKZhzpXQU30bt0NiiGJAbhIyQrWD++l3rZlr0CvRrQ7qCBW0AxK
	AzASteP0Hhua1Sskd2aoU0B0lQ45MW13D1EKl24DeOPcSgPpm9jWmNg5tIiS69awettzM7hBpyb
	kPN2GuEmHKhg0Rdoy0qMKv9nMI8PmWn0Po/Ev197AEoV1NDIGA1RAQU=
X-Received: by 2002:a17:902:ce81:b0:2e5:334f:f47e with SMTP id
 d9443c01a7336-2e9a69ea07fmr86514295ad.21.1792477340861; Mon, 19 Oct 2026
 23:22:20 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018-cgroup-kill-exited-leader-v1-0-c71ad94c20cc@gmail.com>
 <20261018-cgroup-kill-exited-leader-v1-1-c71ad94c20cc@gmail.com> <atYTukAn0-7CAXmp@redhat.com>
In-Reply-To: <atYTukAn0-7CAXmp@redhat.com>
From: Kirill Kolyshkin <kolyshkin@gmail.com>
Date: Mon, 19 Oct 2026 23:22:09 -0700
X-Gm-Features: AclHuK9ygSdoDJEA1JRd9ZHGPjt0wCVb9_5HzGSf6_SYCV4LA_12hP3cAjxp2vw
Message-ID: <CAGmPdrypQQnmE1iCTWS46c47P0puRsA0Z4jYnXFFnZ0Um7KJOQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] cgroup: fix cgroup.kill for exited thread group leader
To: Oleg Nesterov <oleg@redhat.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Serge Hallyn <serge@hallyn.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Christian Brauner <brauner@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, "Eric W. Biederman" <ebiederm@xmission.com>, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 5:57=E2=80=AFAM Oleg Nesterov <oleg@redhat.com> wro=
te:
>
> On 10/18, Kir Kolyshkin wrote:
> >
> > cgroup.kill does not work in case a process' thread group leader is gon=
e
> > but other threads are still running. This is because __cgroup_kill()
> > only walks the thread group leaders and sends SIGKILL to each of them
> > with send_sig(), which uses PIDTYPE_PID:
> >
> > 1. The exited leader is still listed by CSS_TASK_ITER_PROCS as long as
> >    the process has live threads, but a signal directed at a single
> >    exiting task never takes effect: complete_signal() does not look for
> >    another thread to deliver it to, and __send_signal_locked() now drop=
s
> >    it altogether.  The process keeps running.
> >
> > 2. The live threads of such a process can be migrated to another cgroup
> >    by writing any of their IDs to cgroup.procs, while the exited leader
> >    stays behind.  The destination cgroup has no thread group leader to
> >    iterate, so writing to its cgroup.kill does nothing at all.
>
> ...
>
> > Case 1 can be fixed by using do_send_sig_info(..., PIDTYPE_TGID) instea=
d
> > of send_sig(), so that the signal is taken by a live thread even if the
> > task found by the iterator is exiting. Note it was pointed out by Eric
> > in [1] while reviewing v2 of cgroup.kill patchset, and v3 was meant to
> > switch to it, but the change was only made in cgroup_post_fork(),
> > leaving __cgroup_kill() with send_sig().
> >
> > Case 2 can only be fixed by iterating over all threads, so this is what
> > the fix also does. Once a thread group is being killed, its other
> > threads are skipped since they already have a fatal signal pending.
>
> ...
>
> > --- a/kernel/cgroup/cgroup.c
> > +++ b/kernel/cgroup/cgroup.c
> > @@ -4289,7 +4289,7 @@ static void __cgroup_kill(struct cgroup *cgrp)
> >       cgrp->kill_seq++;
> >       spin_unlock_irq(&css_set_lock);
> >
> > -     css_task_iter_start(&cgrp->self, CSS_TASK_ITER_PROCS | CSS_TASK_I=
TER_THREADED, &it);
> > +     css_task_iter_start(&cgrp->self, CSS_TASK_ITER_THREADED, &it);
>
> I guess this change alone is enough to fix both problems?

Correct; my initial version only had this change, and it fixes
both issues.

>
> But even if I am right,
>
> > @@ -4299,7 +4299,7 @@ static void __cgroup_kill(struct cgroup *cgrp)
> >               if (__fatal_signal_pending(task))
> >                       continue;
> >
> > -             send_sig(SIGKILL, task, 0);
> > +             do_send_sig_info(SIGKILL, SEND_SIG_NOINFO, task, PIDTYPE_=
TGID);
>
> I agree that do_send_sig_info(PIDTYPE_TGID) makes more sense.

Indeed, I added it for "making sense" (rather than for fixing the
issue) after reading through the initial cgroup.kill patchset reviews.
Eric flagged both places in v2, but only one was fixed in v3.

>
> Acked-by: Oleg Nesterov <oleg@redhat.com>
>
>
> Either way, I am not sure about SEND_SIG_NOINFO. Perhaps __cgroup_kill()
> should use SEND_SIG_PRIV? I dunno.
>
> Oleg.
>
