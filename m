Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613CF4432F6
	for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 06:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790318544; cv=pass; b=e6SKb1ehsjC18uhgTPxSY1QOjgFrIiQT5FkZr09tMlYCYKWsfFVI1O+p9KWBcqBH9k1o+5uNCNr0pcmeb0DLRrpG9S6RFZo1qYk+pmI+INR8JoP3f6ZJPNY2Ti0AcdAsIc1cfouB/m3mnNSn+wMl90jTEuMMbw5sFFeYT5h2uN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790318544; c=relaxed/simple;
	bh=PIlXHAeNurzh/y2B+H0FitUxNrKxWKb3mLvgkGiI3zk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L+rF638rm9nJujK5Z8ham1km8vSWopIItZOuOS1AFpd6uCjfkg5sZhHKYOpuwp9ZeN800C83mrTzWUelsQ8a8jkBqiW3xXdrzo9M6fKKKAokUDmj0xrRswvhoBMz4MEzrkuYQ75H5Y2lhTqT7dxOpTqpu5R2+oPvcSChskaHPwA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ua0NHD76; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ua0NHD76"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6aa13d8d9d0so6831a12.0
        for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 23:42:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790318540; cv=none;
        d=google.com; s=arc-20260327;
        b=qRBSrKYhgXAjHzuW/m7T2/LtfYQbGkHnHSIMwQDGmyImAYlf5tx1zOJmIh831n2/mi
         PxB6G/DjUSvNMStinTaAOZiIw4rC4HWLEvXAf6gosfaZSzKu2gMXiBOf/Jmy7d6o62X0
         HeArVqZF21aqFdmEUU1FbFtE5+YnyiMMp3uj9rQkubwUrNWAlMCXRoAfMIPa75npRdSB
         ggxObn0v21i5HV+o4xmDDcRM89Oj6mi/ZpQNDFGvPcL74GwrA5LeYO/3mAzI4roB7VNR
         jpz7Gi9inh/WnBKi1mPGpZB+pDgL3n3mmzsXGI4e29B4XCipOWpVGttao7T8iN6Id2AZ
         P34Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U931IUFkMVd98OtvL0P43sJytu2CWHhy0Gubri2GWP8=;
        fh=ElxRwlNW/PvSrQtWUXjAkfNlc4tpq/MzhOOeoiASCbQ=;
        b=lH/GTJ986WX7GKXKMoYF7ByDM/57bczcgUqD9O2qic8C6kWRRShivCABVBxlulySat
         ukA7aOM+TUTuUUXSwYGG1Ojp5YOyUZ9gPWEWfGdFWgLbaZMG9fgYsdXHDcGhn8d9fbc9
         U6NNkC96+5XxGPId5lRcePpYLDVlYSciWZw7amLpYLwTpPm2txAe5TC68nbnxg/GV7UD
         TkMRRaZ4Pxdeh3u0Blwma+xEOhVuBHPJSC2szTwEZa2USWb82AzYIw0Gk2LmRLnuBGd/
         LV/dcQI7JJAzeaOSYB3jsUXEIiCuTgKBO5I6Y07DiPva59gTTvNmhhDaApH4juKkMcDE
         KQoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790318540; x=1790923340; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U931IUFkMVd98OtvL0P43sJytu2CWHhy0Gubri2GWP8=;
        b=ua0NHD763Klybd6sOAhy6Zrkh90RyVqAwPpOOTWSbJNQQMoCY0etb1ln7bjuhdmErJ
         6Qp0Jr6BkEni5ttUluyDnlbXphc/SRJK0CrDmi/ZNxcApRXbcMasxDOJFZvJA9XS5VqT
         rxH6frhGT3DtFMA8QbE5fAMc9vtXUK+M4Y+aOTmRgZwHqh+fAvt4gWFlk8ufCWC8G0od
         DsMNNRrCPDyOSwbxYm38BJSPOitaeFCX68Re4W/UMNBQ0TBvYpDzJdbYIoHFWzXRVUFU
         rhDY1xV/7706WnhQiU8+SQZkn6Qh6je215QbDkj/DuihwCcQojPaCtqZf2NkKfyeQXGY
         rXgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790318540; x=1790923340;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U931IUFkMVd98OtvL0P43sJytu2CWHhy0Gubri2GWP8=;
        b=l6dW6/PqlQYa/HlJrVTN8K8J0ytm4t5t2cTDNC2mD3T4I5bJ+H7kCvBstqJA1UOaCp
         //dXE5BvYhmQntexodxHtp/AiIhoOvn84Paah09Fp2HyV4VrtS6CYWvRM39664QHnw4t
         JzvdtkWbc6daqdjRKbqHUjqY+MMcFBE/F7dzY8RoA06sK7X8wJMvkO8CgtgrNfzpP0W7
         fdadgbxsp/oEIw+T8g4Y/6zwCQmiZEj2w14qdXqzLBw86hYknMEoU5pzLQ9D+nmLaZjh
         KBjt5Mejc3zh8y8JQ5CaC78T9y++KUvJm0qwRMJkz4brrPxultKuZNV+TukfvRechc9h
         zhiQ==
X-Forwarded-Encrypted: i=1; AKwUvBwh4CdR4PgO2PIFy0Sy9Jn0a1Wv2lE2cPr53mLCvxvWwnqx7VU1OobzRAqojEZkqWgcvAgO4TsAosOVIcYn8jM=@vger.kernel.org
X-Gm-Message-State: AFuF++lLpOfeVguH78nyTPFckuxtEeNBOeNH4f+VAvONwZrsHZAIf4iH
	kvccyrKiX52en9t0HiMYfPklZPtVr+U8e30zbMdRYi2z5JSx1Y29CXWOz7TYqN+HBQckJJPy5jo
	EbMAl50HYskj2ggRHNsWNnk1ReNIyyjRX7TqpgBov
X-Gm-Gg: AYBFou18YW/Fz45ZpbowNu10gxg9kMQOMbRufm7kjSvSTnnPezGVNDgGAhwdTqdhkov
	+S/vNKEdCVnPJqgruPpbI7XFPrCJCLzKr98pAKw4grT5zyWmpJGTijtD5GQpY/qftd9aF81bWD9
	+YHHXkGMtH1Rk3QnGi/ASRCgaQ1K5H94KoTY+Q5iy/gl1+SPodBLgyfOLTpDmTRU0vxTaHK5DAm
	Pmmc/Fhna3L6fDQFi0SjfFzC5MrsSAkS4gjlJwLRz2IleX0PT54fWZQ1VWLPEHbnqvVsTWHSQao
	twW8KkjUSnbsYS1IASpW1U/TPlr2oSA3zOx5JHIZO2Gv/PzSkkEccg==
X-Received: by 2002:a05:6402:38c:b0:6aa:b663:4801 with SMTP id
 4fb4d7f45d1cf-6aaea0fb6d8mr14030a12.15.1790318539859; Thu, 24 Sep 2026
 23:42:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902040725.877155-1-cui.tao@linux.dev> <aphkAGKpg3dgFc6c@localhost.localdomain>
 <8c816b23-d394-4389-94ab-7fec889b1300@linux.dev>
In-Reply-To: <8c816b23-d394-4389-94ab-7fec889b1300@linux.dev>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 24 Sep 2026 23:42:06 -0700
X-Gm-Features: AclHuK-5vOY-egLSEE_bH_0i2hCHj7p-HnkJlCAYVNPv8oCs54l4oqzVV9WylcQ
Message-ID: <CAJuCfpEFmV9hE4dT2B_KTEaZfPe-tfkwJmYhgRRRFm-LqiwUrQ@mail.gmail.com>
Subject: Re: [PATCH v5] selftests/cgroup: add PSI pressure trigger and
 validation tests
To: Tao Cui <cui.tao@linux.dev>
Cc: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, Shuah Khan <shuah@kernel.org>, 
	cgroups@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ziyang Men <ziyang.meme@gmail.com>, 
	Tao Cui <cuitao@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 12:24=E2=80=AFAM Tao Cui <cui.tao@linux.dev> wrote:
>
> Hello Michal, Suren,
>
> =E5=9C=A8 2026/9/3 02:47, Michal Koutn=C3=BD =E5=86=99=E9=81=93:
> > Hello Tao.
> >
> > On Wed, Sep 02, 2026 at 12:07:25PM +0800, Tao Cui <cui.tao@linux.dev> w=
rote:
> >> +/* PSI triggers are written with a trailing NUL the kernel parser exp=
ects. */
> >> +static ssize_t write_trigger(int fd, const char *trigger)
> >> +{
> >> +    return write(fd, trigger, strlen(trigger) + 1);
> >> +}
> >
> > Hyrum's law. It all works for me: NUL, \n or just write(2) the exact
> > length of the string.
> > For conventionality, I'd prefer the simple literals and plain strlen() =
+
> > 0. (I reckon cg_write() cannot be used because of FD access.)
> >
>
> Your Hyrum's law point made me look at the parser, and I'm glad it
> did, because the behavior is more subtle than "all of them work".
> psi_write() does
>
>         buf[buf_size - 1] =3D '\0';
>
> i.e. it overwrites the last byte of whatever was written. With a plain
> strlen()-sized write that eats the last digit: "some 150000 2000000"
> silently arms a 200000us window when privileged, and fails with EINVAL
> for unprivileged users (200000 is not a multiple of the 2s minimum). I
> reproduced both on 7.0.0-28 here. I suspect your runs succeeded
> because a truncated window still makes a valid trigger for root, so
> nothing looked off.
>
> I went with your \n variant instead: the newline gets clobbered, the
> payload stays intact, and it is the conventional procfile form. So the
> reliance on the undocumented NUL is gone, even though not quite via
> strlen()+0.
>
> Two follow-ups this suggests, if there is interest (I'm not pushing
> either within this series):
>
> - psi.rst says nothing about the terminator while sysfs documents its
>   (append, not clobber) behavior explicitly; a sentence in psi.rst
>   would at least make the convention discoverable.
> - kernfs and sysfs both append the NUL after the written data, so the
>   user bytes survive. psi_write() could do the same with
>   buf_size =3D min(nbytes, sizeof(buf) - 1) and buf[buf_size] =3D '\0'.
>   Terminator-terminated writes keep their exact meaning, and a bare
>   strlen() write would parse in full instead of losing its last digit.
>   That would be the more principled fix, but it is a behavior change
>   for unterminated writes, so it needs a call from the PSI maintainers.

Yeah, I was expecting a NUL-terminated string with the NUL included
when we write, like shown in the psi.rst code example:

write(fds.fd, trig, strlen(trig) + 1)

but I agree that this might be unconventional.
I guess we could check if buf[buf_size - 1] is already '\0' then do
nothing (keeps current users happy) and otherwise we append the NUL at
the end. That way both write(fds.fd, trig, strlen(trig) + 1) and
write(fds.fd, trig, strlen(trig) + 0) would work. Would you agree or
did I miss anything?

>
> >> +
> >> +static int pressure_open(const char *resource)
> >> +{
> >> +    char path[PATH_MAX];
> >> +    int fd;
> >> +
> >> +    snprintf(path, sizeof(path), "/proc/pressure/%s", resource);
> >> +    fd =3D open(path, O_RDWR);
> >> +    if (fd < 0)
> >> +            ksft_perror(path);
> >
> > This outputs:
> > | # /proc/pressure/irq: No such file or directory (2)
> > | #      SKIP      /proc/pressure/irq unavailable
> >
> > I.e. similar message is printed twice.
> > Since strace is a companion of cgroup selftests, I'd keep this helper
> > silent.
> >
>
> Agreed, the helper is silent now. The duplicate was my own doing: I
> added the print in v5 on Suren's v4 request (it replaced a raw
> fprintf) without noticing the SKIP message right below it already
> carries the reason, so removing it satisfies both comments.
>
> >> +    return fd;
> >> +}
> >> +
> >> +FIXTURE(psi)
> >> +{
> >> +    char root[PATH_MAX];
> >> +    char *cg;
> >> +};
> >> +
> >> +FIXTURE_SETUP(psi)
> >> +{
> >> +    int psi_fd;
> >> +
> >> +    if (cg_find_unified_root(self->root, sizeof(self->root), NULL))
> >> +            SKIP(return, "cgroup v2 isn't mounted");
> >> +
> >> +    /* PSI must be enabled (CONFIG_PSI=3Dy, not disabled on the cmdli=
ne). */
> >> +    psi_fd =3D open("/proc/pressure/memory", O_RDONLY);
> >> +    if (psi_fd < 0)
> >> +            SKIP(return, "PSI unavailable (CONFIG_PSI=3Dn or psi=3D0)=
");
> >> +    close(psi_fd);
> >> +
> >> +    self->cg =3D cg_name(self->root, "psi_trigger_test");
> >> +    if (!self->cg)
> >> +            SKIP(return, "failed to allocate cgroup name");
> >> +    if (cg_create(self->cg))
> >> +            SKIP(return, "failed to create cgroup: %s", strerror(errn=
o));
> >
> > Why are these two SKIPs (not failures)?
> >
>
> You're right, they are not environment problems. They are ASSERTs in
> FIXTURE_SETUP() now, so a run without privileges fails loudly instead
> of vanishing into skips.
>
> >> +TEST_F(psi, cgroup_trigger_fire)
> >> +{
> >> +    char *cpupress;
> >> +    struct pollfd pfd =3D { .events =3D POLLPRI };
> >> +    long ncpus;
> >> +    int fd;
> >> +    int i;
> >> +
> >> +    cpupress =3D cg_control(self->cg, "cpu.pressure");
> >> +    ASSERT_NE(NULL, cpupress);
> >> +    fd =3D open(cpupress, O_RDWR);
> >> +    free(cpupress);
> >> +    ASSERT_GE(fd, 0);
> >> +    pfd.fd =3D fd;
> >> +
> >> +    /*
> >> +     * 1usec threshold over a 2s window: any CPU stall fires it. The =
2s
> >> +     * window is the smallest unprivileged users are allowed to arm.
> >> +     */
> >> +    ASSERT_GT(write_trigger(fd, "some 1 2000000"), 0);
> >
> > The selftest rarely can be run as unprivileged user (even test cgroup
> > creation needs privileges), so this comment is irrelevant. (But it's
> > fine to test with that value.)
> >
>
> Dropped.
>
> > On the more abstract level -- I was playing with this and thinking abou=
t
> > a value that'd test both sides, i.e. false triggers as well as false
> > non-triggers. I'd find that to be the half of the window and the number
> > of tasks should be then (3*ncpus + 1) / 2.
> > Or perhaps test two thresholds, one tiny like you did and one maximum
> > (whole window) with same amount tasks but expect trigger, no trigger
> > respectively.
> >
>
> I tried both of your variants before picking one. The half-window
> threshold with (3*ncpus+1)/2 hogs fired reliably, and the two-threshold
> variant also held up on the negative side: with the threshold equal to
> the whole window, ncpus+1 hogs never fired it (measured cpu.pressure
> "some" stays around 2-17% under that oversubscription, so the margin
> is comfortable rather than borderline). I kept the existing tiny-
> threshold test and added cgroup_trigger_no_fire for the whole-window
> side, which matches your second variant and keeps the hog setup shared.
>
> >
> >> +
> >> +    ncpus =3D sysconf(_SC_NPROCESSORS_ONLN);
> >> +    if (ncpus =3D=3D -1)
> >> +            TH_LOG("sysconf(_SC_NPROCESSORS_ONLN): %s", strerror(errn=
o));
> >> +    ASSERT_NE(-1, ncpus);
> >
> > Same as messages from pressure_open() above. Simply assert.
> >
> >> +
> >> +    /* ncpus+1 hogs guarantee CPU contention inside the cgroup. */
> >> +    for (i =3D 0; i < ncpus + 1; i++)
> >> +            ASSERT_GE(cg_run_nowait(self->cg, hog_cpu, NULL), 0);
> >> +
> >> +    ASSERT_EQ(1, poll(&pfd, 1, PSI_POLL_TIMEOUT_MS));
> >> +    ASSERT_NE(0, pfd.revents & POLLPRI);
> >> +    close(fd);
> >> +}
> >> +
> >> +TEST_HARNESS_MAIN
> >
> > All in all, this looks so much better than the initial version, well
> > done. Just a few polishing touches.
> >
>
> All 7 tests pass on a 2-CPU and a 16-CPU machine.
>
> Thank you both, this series learned a lot from you: Suren walked me
> through the harness conversion and the reporting details, and you kept
> the semantics honest, which is what surfaced the parser behavior. The
> test is in a much better shape than what I started with, and the
> parser finding above came out of your push on both directions of the
> trigger.
>
> Thanks
> Tao
>
> > Michal
>
