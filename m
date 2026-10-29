Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793253776;
	b=IRFhiMJVLaOwsyPG/AfPydSYkQ6bRXxxVN6Jdn6S3ZqGiq2RxxvzhiW2npLD/NURP8Ge
	 hbRk+9nNN6irCfn0gmq5nKh6Eo+W9+EfuP3h//5xHPTAX5bNqhGppfqh3UlwfOgGx/S52
	 RbhQUgjdvMi70vDI8qzByPsVIHo0XZY7xBTg437f7nhzmgGsW0GUumbfyusglH5cNjjoo
	 A/nfm5dYqg3Va4P0vpmviIHxCX16xm+ejqTxWBXRPDyXB3hFohr8YKifTPEv6b0F0CTEH
	 x0YisEssxYMg9UU4c7RjR+G7OiqaJbErry5W3GV1G1U2UPVhJ5DOmBZWP9xvy7HZHTQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793253776;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hXQbAH9F+jWXJFIK38nCMq5VZ1dNb0WqnmInbL0EisU=;
	b=ZWvmtuw9NjDW05ViNseOQrYNxab1Jm6ifMa0fqqup+Rffwp+w/iq/yOioBeMs1AE9JIh
	 a46Q64CfmOnhQFq3QD1B3fzP+dOrsSg839/LUn7IYF621NtXmI1Nw+umQ5mTqRHux8vAS
	 x+pt0lvFcx5hUOH/W43vx3DiKZkPIndoHPENUHrU6sT73tbZ+6L9lqAdJ+nViHlPT2tjr
	 uDtXYqFh0s5KXmGTySeP0lmrthqVpHGJBKLHUaJSSgGmhbppnKQairpCFkdfahI4/Ob3D
	 Ufx1T0Km7wkPZuKOnCm/uU7VqmPy3GgM4Ql3EQdPZYppGTBYmOyXi6W5IAjDAZfrUqA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=brainfault.org;
	spf=none smtp.mailfrom=brainfault.org;
	dkim=pass header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=kTE3iHoy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E472606A31D
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 06:02:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E472606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=kTE3iHoy
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48dee593f18so1136132f8f.3
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 23:02:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793253770; cv=none;
        d=google.com; s=arc-20260327;
        b=HbVrzBhg1lmfp6HAswn3fH5jJ0EQQwWsKHYS+CFVwG0jE1siqxuBVi4ind3kyBz5Bv
         L4QouhKFhfertEWlYaPMGXXgR+9esqnKN+P+iXf7Y0VZYHjXDbgL7Z7wP7M8miyGpwTb
         iEVfp4BAHEUL2OCfgzPOvJYeqnw0NWg50ydJ1rdjnePzA5Eb5Ka6X5Xos9VNYDou/LwM
         lt5OKWL9ZOaGcgG+vbpWLAG4t1DF6wNK95ksnBTJIm77MAXdpPOWFCB+kgfXaWPnnGoI
         GxwQd42uDuUtYQP9NJNZ+dfWBt6Giold4EPyldIsHumPnOZdNGjYNihaXygDbAPrR74m
         PXQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hXQbAH9F+jWXJFIK38nCMq5VZ1dNb0WqnmInbL0EisU=;
        fh=tG7vr7AfIIdno1Ak/Ou+kp1fmCxTYOOizQc8pkgSsu8=;
        b=Pnls+8hKcLZz/RZKtIFmq4YhOWnPnyvpE+cMBLRE8TZ+6ZBJmaqf1jp0bXrNr2PRTb
         utq90ajSUZQv9hNs5bGZvv3Rt6fCZr0O3UPYKch2WcVHbaFL20cV6NMhWJ1h8l67VbXq
         iMwz/FGRFI6K+eN2fh4kFRlyfUZgK3OHfY4t/2cPTz0RVl66BSSBDGSyVXwbl/yO5vB3
         AfJ5YoTLyajWtUNk3QTXoWT0Csnq7zOt+XtXxPsFIgpoQOlC5Lla6AFynO62IK6XchGb
         i6UpvT5aCbWfa0X1wednfshBcrjzKGnUGNeDYZo0FLNGj8LGq5xd2272mzz5NdTsj1GG
         n0/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1793253770; x=1793858570; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hXQbAH9F+jWXJFIK38nCMq5VZ1dNb0WqnmInbL0EisU=;
        b=kTE3iHoyaRzExfvJwjm3Qk1IPu1w1InAhorCg4ASpedHH26Fp9iDN+GvZfOxn5B5jm
         /ZDwVvV2e+qmZcFCGy1OpMlWO+VOtnOsfLuGQeWpcUlvf5nRfaDhJKKnpQIoI/oj9Vfz
         MWYHDfyF2fGlrh4TCtsSldock76axkoPHWgRCNzXM/gbmKuPG3YZTYIUn8qDBUrvgHni
         k431nr018QL7Q9tp2X8sJwy+0gYd9QghdxthVLtWpeY7WF2LgRNFtjoEL1hsu2q4RO0M
         aor4Q8PIQS+DFqv03Kyi/hfHwI/8XBJSCEd3WdGqGC+NiWzt8bDu82tumIx+Og6GTSav
         XKug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793253770; x=1793858570;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hXQbAH9F+jWXJFIK38nCMq5VZ1dNb0WqnmInbL0EisU=;
        b=TeQUKtUBgVYuNaUwdLcz6NAkfza0YalyTSaUwanJDuy7VztSZQajLxOXjskRCD+Iip
         ns9Q2IEKesFGH+qvVtyxHk+54mv9nrHYJ4QJ6l7dgmB983l1UEPXJ3GzwtD6SQUefDlQ
         +8hXaDb2KaUoIMuMToduqftBrUdAK3lZe1OgTJ7l9CQLCVcY/cSfgj833fawc0gN7QmN
         oLfuh6rEH6G8RhKd5qVDDjcdaa9xAwF4sYUnuf1sYGy1KS4mREaD3v8BKzwUnZHs4FVB
         0+5sLAdZH9RmJx5ywB8qNjGX9s9IC2Zey6q70t4LgRCWVDjoUoNClCZK9X1xUAzVe2D2
         Hf1Q==
X-Forwarded-Encrypted: i=1; AKwUvBwdiEx+a5OjMZNGSd3HkqV/f7RJkSAL/TgcsmIVSF73OObrGlEPTTkvWbrANHZAqiGhLKdsC+ekIsilwCE79aQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIq7gWyyKvJXVT3bGvFTT2mP0Lk5Ph24osWLpGDgzc/5XpSyaKk
	Pe58WP0+xKpwav6WNmtb9R7yr8dPzJ1bol62w472fHsyEW0qC1Ab6taIAJGruKurad+00N4kyuH
	M+v3NGi6RxmkBH5jjH9rhFy2plcsYfkP/yICcUzrJJw==
X-Gm-Gg: AYBFou3KVVLwTgzZmYCcycwuhdjwY5IhcdkctF5nhPPTSvMqdeP8B/mBt+1WK0l+73x
	MdlN/o5zKZLXMQ6vVtWzE/x8z960RKHB1uTTys4wHoSyypkHqfuay13E0OmfWWPSGIyJ2GabOHE
	YeWpdcmaQnmcWMdsV33ocKVotpHhiBkFOpWdc2AnIOBFPTg+I/2CIRSRtYLH2x6ys88gUTUIQ6Z
	B119lC3beU0MzDUPv57Z594JiM4ffpYp4ogGUGsJ7o5WTJbn1reWsYZn/lN1ZnXSao3bKxDcyp2
	/ggQsvtaZF30+PJ4gecb1fep77luo71nEQT+WFzotsbzPOcEASVtB4lT1t7O7rR8BMWbC0pDGmP
	imj2OWAXPkkfDMCV9aZVJdlY3DeFnXpzfoD7AWvRrHEpilFOJ7SaSCv7TjUpNZXjaiEc3j+6gSF
	bwrIfXQTQvkwXSi1ITfRKtRVW4zAa9wbb+iwgaAQPzgW6DDjIxcQ8lzX6s
X-Received: by 2002:a05:6000:41c5:b0:48d:f3f8:f910 with SMTP id
 ffacd0b85a97d-48e5d5a45c0mr10372553f8f.34.1793253769206; Wed, 28 Oct 2026
 23:02:49 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028165531.940336-1-anup.patel@oss.qualcomm.com>
 <CACnXVncwzQiUN9CO8_Ds7UQJEKzEF29vagsTFrC0WbRZXt7aLw@mail.gmail.com>
 <CAAhSdy1u4Tme=cv7pSyYeahh1BQhQOnsnWBn3D4yxTnfzrApPA@mail.gmail.com> <CACnXVndt7Rm3UqZH=T3xYjQ+1H-zPMgU29FcCOjJ2mtu=avoWg@mail.gmail.com>
In-Reply-To: <CACnXVndt7Rm3UqZH=T3xYjQ+1H-zPMgU29FcCOjJ2mtu=avoWg@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 29 Oct 2026 11:32:36 +0530
X-Gm-Features: AclHuK_p0hCRo8pr_WRUDjy07skD9Um-9_bl0z2ojXK9jzlo0dDOGwVfM7SiBGw
Message-ID: <CAAhSdy3WVmzEkG4fgTuXENcys_cWX8h6Hag_fYSkyOdu++iBBQ@mail.gmail.com>
Subject: Re: [PATCH v11 0/9] riscv: add SBI Supervisor Software Events support
To: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Cc: Paul Walmsley <pjw@kernel.org>, Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>, 
	Anup Patel <anup.patel@oss.qualcomm.com>, Yunhui Cui <cuiyunhui@bytedance.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Alexandre Ghiti <alex@ghiti.fr>, 
	Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Atish Patra <atish.patra@linux.dev>, Yuanzhu <yuanzhu@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 9:10=E2=80=AFAM Zhanpeng Zhang
<zhangzhanpeng.jasper@bytedance.com> wrote:
>
> Hi all,
>
> On 10/29/26 11:17 AM, Anup Patel wrote:
> > On Thu, Oct 29, 2026 at 8:36=E2=80=AFAM Zhanpeng Zhang
> > <zhangzhanpeng.jasper@bytedance.com> wrote:
> >>
> >> Hi Anup, Paul, Himanshu,
> >>
> >> On 10/29/26 12:55 AM, Anup Patel wrote:
> >>
> >>> [...]
> >>>
> >>> Changes in v11
> >>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>
> >>> Rebased on latest for-next branch of linux-riscv tree (commit a5ae1bf=
65cee).
> >>> Also, tested PMU driver with both PMU irqs and PMU SSE events.
> >>>
> >>
> >> Thanks for rebasing and testing the series. I was a little surprised
> >> to see v11 posted, as I am still working through Himanshu's v10 review
> >> and validating the fixes on hardware. It would have been helpful to
> >> coordinate before reposting so that those changes could be included.
> >>
> >> I guess this follows Paul's request to rebase onto riscv/for-next.
> >> However, there is one change beyond the rebase that I would like to
> >> clarify: why does patch 4 remove the scoped_guard(preempt) sections
> >> from the CPU hotplug paths? These were present in v10 RESEND, and
> >> the local helpers still retain their preemption-disabled assertions.
> >> Is there a reason this protection is no longer needed?
> >
> > Yes, this is based on discussion with Paul yesterday.
> >
> > This series is blocking the whole RAS ACPI support.
> >
> >>
> >> The changes discussed on the v10 threads are still outstanding in
> >> this posting:
> >>
> >> - Preserve TASK_TI_A0/A1/A2 across nested exceptions.
> >> - Replace the temporary GUP-based perf user-stack copy with nofault
> >>     uaccess, following the x86 approach.
> >> - Address the per-CPU initialization/preemption concern.
> >> - Split the MAINTAINERS updates into a separate patch.
> >
> > There is always going to be new updates since it will take
> > time to harden the SSE implementation. All these changes
> > can be done as separate follow-on patches.
> >
> >>
> >> Additional fixes from Sashiko review, the kernel test robot report,
> >> and our follow-up debugging are also being consolidated:
> >>
> >> - NMI-safe entry and lockdep irqflags tracking.
> >> - The unused-function warning reported by the kernel test robot.
> >> - RV32 vmalloc synchronization before nofault fixup.
> >> - Faulting-PC validation in the kprobe single-step fault path.
> >> - Per-counter STOP handling in SSE error paths.
> >> - Ordinary IRQ CPU-PM notifier ordering and IRQ cleanup tracking.
> >
> > Same comment as above, please do this as separate series.
> > No point in holding all other dependent work endlessly.
> >
>
> I agree that we should unblock the dependent work. However, I would
> not characterize addressing a known, reproduced issue as holding things
> up endlessly.
>
> >>
> >> In particular, Himanshu identified the missing preservation of
> >> TASK_TI_A0/A1/A2 across nested exceptions [1]. Following his review,
> >> I validated the fix with hardware A/B testing: removing it reproduced
> >> corruption, while the fixed kernel completed the same test sequence.
> >> This also gives us a solid basis for replacing the temporary GUP
> >> workaround with nofault uaccess.
> >>
> >> Paul, please hold off on taking this version into for-next until
> >> these fixes are included. The rebase and PMU testing are useful, but
> >> there are still outstanding correctness issues.
> >>
> >> I will consolidate the changes and post v12 against riscv/for-next,
> >> with an updated changelog and validation results. Let's coordinate
> >> the next posting to keep everything together.
> >>
> >> Thanks,
> >> Zhanpeng
> >>
> >> [1] https://lore.kernel.org/r/as79MHtNYd-VbUug@hu-himchau-blr.qualcomm=
.com/
> >
> > Regards,
> > Anup
>
> I'll post a focused v12 before this weekend with the immediate
> correctness fixes. Further improvements can follow separately.

Linux-7.4 merge window closes end-of this week so your v12
will be too late for it hence I suggest sending incremental fixes
separately.

Regards,
Anup
