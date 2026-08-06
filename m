Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CCC386C3E
	for <linux-kselftest@vger.kernel.org>; Thu,  6 Aug 2026 17:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786036385; cv=pass; b=hH7vXr1vNjPZInaB+oiadA1ERzWIG4UcqPVtMN6O2nnBs9hqAfgtN0ukfXqR/aByE1XX6YUk+VQII020J5omObukSwNRyfYWMhnOApNGPIk2G8h+pSM5f1GmDPLXFFwH53r1HWa/iFEL/+duxk88x/k+cNohP5XewnRVzXXFMSs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786036385; c=relaxed/simple;
	bh=bXUKWDUfgbn9sVNEKtlFWPHzFvLv4UFxp+9Iiunsy00=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rlHntGvsfSIzvhdEMhH7quaav0QmwpUETTVj2KdWB79yikiqw9T31MbgXcgFtWHKWbNLQMDugzKH3MY7Fe0CtSiUei/KL7Hh3HjNFrKn3RfjQK9YErKN3qYNYU5Cz6EIuXynT7aF25y4QyNom2UgIaBeFnaM6K1i12jP+/hXgwc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N3sxl8N7; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N3sxl8N7"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-51c10e86e52so8881cf.1
        for <linux-kselftest@vger.kernel.org>; Thu, 06 Aug 2026 10:13:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786036383; cv=none;
        d=google.com; s=arc-20260327;
        b=cE8xDoBuSpjzn91PCOO441m/zYFf4ba+tExEW3xu+ngu7qr7vcXPpLbSBHdZjJa7Yv
         PKBDxrw2kg8TRn5P6qISRhoDOgG6ESm5I9ms8pkbHtRqtd0PZdeMiwV9SRpw0eQ0Y5I9
         eYnS+MZaov3yryjd7It5NFdRzwnFhFPzhYtygyAk9iV7oVGIiS4G6Qj6BsOwQKwIT+00
         GzMOSUDAuPIgDfNX3Bhr0vrIgGBqiveMaEVv8FqjSBNP/WgepgFVgtQeeZz2NhY2BcSA
         7MaTv99dJLLRJCNwd89sm8q3sQmUTW1pVVIP1Q+Dn8BPgYNpVg1cq5nxfMmUakRXumM6
         9YaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kOondB7zlLOm/USRZeEDNtNtm81Uo+XUZekrXkBxZ6g=;
        fh=yuo69Ve1CV6GGAGq8jctKiP8m1jr7rdaYVF3OlDGhuo=;
        b=aJyG8C+3/UWXLWgyAv6q8InwlsjsGnZ70cXiSv+Pw8rKuqGY+eGYgjhO32HC08IKs0
         bcwzV+GD4Mhr+wAky0rU/kvcqP/5/pu/a1xx8LU0PrS9w+EoPAKHST6qWMREvLqOzaxo
         sFS9ekS9RixOowOQPu5mGaaJUyZAEyfLZHYUnwAe+ndWgdhBNci9zMxB0wz2CgWvJt4j
         GU2zeaCtVO9BbcS+Q1BVI2e/mgLliwgIHI/YSV6y0by+EsSUm/mjNj0luAlXII8C3utW
         WI+Hnoi+yReCBvSFNcfGd//SjYIjP785AqfbYYyh0wj3UkZUtez0bM9lxlRuu0e9CRlw
         GdbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786036383; x=1786641183; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kOondB7zlLOm/USRZeEDNtNtm81Uo+XUZekrXkBxZ6g=;
        b=N3sxl8N7xUHUgOJuAtDF4ECLmULfshPvKGF9lkXQ7HCElDVHXFLjMuAY2YGW8TAfCQ
         TcNKiIVDOpNx7o/qatDeeCKXqbFxbzi+jPNpuX/KMbRkkUU4TpmJdrMsROYBbrfdbztx
         p93i2X0RvCsmESZVeiP/UafhPdFJ03oisKqs/kw4Kr+Ldynf84jGylgis4XK9zF8bWj2
         yenrLx9UJLkEH3ijWBFXBqP5VWCKNB+sVhuYklW5Ca4nRqhiRZecirnsmu2bjFRcP6pf
         6inwhgHdLykg4DnJJ13a8DsHxiLKfCIdYrnhc6Gz2Rn/uMOGTusCGVy8Jorxo1LRMwiw
         nJAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786036383; x=1786641183;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kOondB7zlLOm/USRZeEDNtNtm81Uo+XUZekrXkBxZ6g=;
        b=i0TKW3BtLNKh5753Gdu/w7fDu+b9ZdHDHr6ipZRjbzzstQEBGdLUM7SAiIuO13Bgxp
         eD02aRjNTKVDT94ABSxkL5KTKsciOTKAzyo6PGN1IEIy+b+HYtyO2t98UKYAzz6lo8Od
         mktjwNhOI334dgRbsHHDu4nwSN9gvIe/Fr6R8+JiRq8pGxY8jQNHbnlYDP4fjn/pAdfe
         OwOqpjOePJUTpWwoRZea9uJUBCvYQU8j9BQO1o3UMwRsvz9+5q1vZXk5MscIwykURCqt
         Gfns3vUFsJggmY+nLr1epZyJ9tBrSUONdXtySrR8bwjB06QzSJvVPzc5umZFgA8Tzz7G
         jQlA==
X-Forwarded-Encrypted: i=1; AHgh+RpUAKvMcBVYELdOnbp2JgBraZAI22xjBKx9rnpo2G0mgru2CkggwW947D8rnfV9u6tNulhiicyjLzqLbXfFCR8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6PgI+wjPioPWecrK5n3Q27ZQaxzniA1kTzYY5txOmCWmP8u9s
	6grzHv+nTkpii/WAQbhGaLEqbgae/Sfa1WUoWz4tBvRWSLSiID5yYr3KbXiIzwUfLwNTZ6VG/e7
	MbTTqobBrL9ODobZsRw7pJzBVwvLBGCwp3/B3k8f49mkNROmuuYVWZik2
X-Gm-Gg: AR+sD12DUfS9NrOChbjt8fu0EhLohJug8hVbhiDQvzxrzkHeP9ezwGlXsVX/AFvwO/X
	eTNww7VyyzwoqzVX7npCmKLzZwsIo7tffLny9QnG2tjFVqH9+Eq9lgZxJXqgKWLfZiZIMmZUAEe
	TXb4HnG/+CDhztI7SRxr8mpZ2pdXteGuCr8tbXxjEk9QC/Z6xgcKE6r9jCymOfUp1o7BNYz0Wml
	jmk1obG0aJXel3x6U0dYOxJPbiBEkrfGU3VwSalo4iXzVO5CsFwqh0oSnni9x00eYu5DOhL+633
	odAZA6vXPGfhqPxyuRPMIMRTWhzi+BHkMHroa7jz9suWbwElArPMSTucBFNJTQLAJvC2/Ta2qjs
	=
X-Received: by 2002:a05:622a:4885:b0:516:3f51:81cb with SMTP id
 d75a77b69052e-52cfea4c54fmr20988091cf.13.1786036381929; Thu, 06 Aug 2026
 10:13:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728083742.2359320-1-cui.tao@linux.dev> <anS3saMkFog89yxy@localhost.localdomain>
In-Reply-To: <anS3saMkFog89yxy@localhost.localdomain>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 6 Aug 2026 10:12:51 -0700
X-Gm-Features: AUfX_myBqmi3uQlB-HqUGfH-0Y4PN_2k2H_3hlPoqzbY_beS516q1vCa1M6xGG4
Message-ID: <CAJuCfpGdVuY5L8+yMXEwQ-GuTB_PNb7Vkzp9w3CQKosaeE1aLQ@mail.gmail.com>
Subject: Re: [PATCH v2] selftests/cgroup: add PSI pressure trigger and
 validation tests
To: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
Cc: Tao Cui <cui.tao@linux.dev>, Tejun Heo <tj@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ziyang Men <ziyang.meme@gmail.com>, Tao Cui <cuitao@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 6, 2026 at 9:52=E2=80=AFAM Michal Koutn=C3=BD <mkoutny@suse.com=
> wrote:
>
> Hi,
> thanks for continuing with this.

Thanks for adding these tests and sorry I was not able to review them
yet. I'll try to review them this weekend and will provide my
feedback.
Thanks,
Suren.

>
> On Tue, Jul 28, 2026 at 04:37:42PM +0800, Tao Cui <cui.tao@linux.dev> wro=
te:
> > +/* Trigger smoke test: second on same fd -> EBUSY; IRQ rejects "some".=
 */
> > +static int test_proc_triggers(const char *root)
> > +{
> > +     static const char *const resources[] =3D { "io", "memory", "cpu" =
};
> > +     int ret =3D KSFT_FAIL;
> > +     int fd =3D -1;
> > +     int i;
> > +
> > +     (void)root;
>
> WTH?
>
> > +
> > +     for (i =3D 0; i < (int)ARRAY_SIZE(resources); i++) {
>
> This (int) cast is quite uncommon, look around.
>
> > +/* Induce deterministic CPU pressure (more hogs than CPUs). */
> > +static int test_cgroup_trigger_fire(const char *root)
> > +{
> > +     char *cg =3D NULL, *cpupress =3D NULL;
> > +     int fd =3D -1, ret =3D KSFT_FAIL;
> > +     struct pollfd pfd;
> > +     long ncpus, i;
> > +     pid_t pid;
> > +
> > +     cg =3D cg_name(root, "psi_trigger_test");
> > +     if (!cg)
> > +             goto cleanup;
> > +     if (cg_create(cg))
> > +             goto cleanup;
> > +
> > +     cpupress =3D cg_control(cg, "cpu.pressure");
> > +     if (!cpupress)
> > +             goto cleanup;
> > +     fd =3D open(cpupress, O_RDWR);
> > +     if (fd < 0) {
> > +             ksft_print_msg("open cpu.pressure: %s\n", strerror(errno)=
);
> > +             goto cleanup;
> > +     }
> > +
> > +     /* 1us threshold in a 1s window: any cpu stall fires it. */
> > +     errno =3D 0;
> > +     if (write_trigger(fd, "some 1 1000000") <=3D 0) {
> > +             ksft_print_msg("arming trigger failed: %s\n", strerror(er=
rno));
> > +             goto cleanup;
> > +     }
>
> When I see this, could you increase the window size to 2000000 (so that
> it has potential to run for unprivileged users)?
>
> > +
> > +     ncpus =3D sysconf(_SC_NPROCESSORS_ONLN);
> > +     if (ncpus <=3D 0)
> > +             ncpus =3D 1;
> > +
> > +     pid =3D fork();
> > +     if (pid < 0) {
> > +             ksft_print_msg("fork: %s\n", strerror(errno));
> > +             goto cleanup;
> > +     }
> > +     if (pid =3D=3D 0) {
> > +             /* Enter the cgroup, then over-subscribe it with CPU hogs=
. */
> > +             if (cg_enter_current(cg))
> > +                     _exit(KSFT_FAIL);
> > +             for (i =3D 0; i < ncpus; i++) {
> > +                     if (fork() =3D=3D 0) {
> > +                             for (;;)
> > +                                     asm volatile("" ::: "memory");
> > +                             _exit(0);
> > +                     }
> > +             }
> > +             for (;;)
> > +                     asm volatile("" ::: "memory");  /* child is also =
a hog */
> > +             _exit(0);
> > +     }
>
> This part could be replaced with generalized hog_cpus_timed() from
> test_cpu.c (after move to cgroup_util.c).
>
> > +int main(int argc, char **argv)
> > +{
> > +     char root[PATH_MAX];
> > +     int mempress_fd;
> > +     int i;
> > +
> > +     (void)argc;
>
> What's up with this?
>
> > +
> > +     ksft_print_header();
> > +     ksft_set_plan(ARRAY_SIZE(tests));
> > +
> > +     if (cg_find_unified_root(root, sizeof(root), NULL))
> > +             ksft_exit_skip("cgroup v2 isn't mounted\n");
> > +
> > +     /* PSI must be enabled (CONFIG_PSI=3Dy, not default-disabled). */
> > +     mempress_fd =3D open("/proc/pressure/memory", O_RDONLY);
> > +     if (mempress_fd < 0)
> > +             ksft_exit_skip("PSI unavailable (CONFIG_PSI=3Dn or psi=3D=
0)\n");
> > +     close(mempress_fd);
> > +
> > +     if (cg_read_strstr(root, "cgroup.controllers", "memory"))
> > +             ksft_exit_skip("memory controller isn't available\n");
> > +     if (cg_read_strstr(root, "cgroup.subtree_control", "memory"))
> > +             if (cg_write(root, "cgroup.subtree_control", "+memory"))
> > +                     ksft_exit_skip("failed to enable memory controlle=
r\n");
>
> The memory controller is unnecessary now, right?
>
>
> Regards,
> Michal
