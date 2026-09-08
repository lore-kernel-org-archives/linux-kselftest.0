Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AAF51993A
	for <linux-kselftest@vger.kernel.org>; Tue,  8 Sep 2026 23:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788909703; cv=pass; b=BecUbC8j5Mx6ee4nkLFNV8Dk8qAioE1p8f52Y3RvOtlqtzD5/tb4Zk9BlxI5HPfaz4iWgz3Dq2JmGuoo0A+IclrgmpTp0N91gACDnDgmppmLLQ/tfitbLvZTk1ttKX9FYmjm1bm54nbqKY/x9LIHdaX3ac/0WdHlHLw6hc6AsCY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788909703; c=relaxed/simple;
	bh=2w9Vu2z44X0Z4L1kBT3EHawgFCel5XoCWx4dtZIXYo0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tbmBir3WBdc2EUiPi5OT+sCBKH75PANaW4GdpXUlrXOkNP1mYPnfiynJL0xYFu7i2nFrfcjQoJSZCLsRcF66HLvIHx972vDV/RV/DfzPbK/YDvLHhJfzedmaG05LrFF92hLR2xgpdoSlIvgqQFA8DwoAHkWEXa7LqVaSXMX6GlY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hkq1QJT7; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hkq1QJT7"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d6fe26ef1cso52483965ad.2
        for <linux-kselftest@vger.kernel.org>; Tue, 08 Sep 2026 16:21:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788909701; cv=none;
        d=google.com; s=arc-20260327;
        b=EnJoX3HR+OXG7SHVnnK7ThCp18SDqJQ0DS0CjSYQr84WR+OY3NH7s2yVrJjIjwW7g5
         5JfoizyHR2pOsi3d0KP96h/szFikrk5RGRDcpCqpZc6rKqs7F3YvKu5P6S8nZQgN5CQi
         Jd4/+JHT4PZppNGO4LZ9Kdfd2dJRUWl+ZBicihhtQh5Bk/QCQ4s+zQK5vC4AEnQslqUS
         wC0JiJ0TWKouHNPAV7vn4raoAvzn8EuO76cxoHhFGfcCWPBtlyFDsLWQ5HhGCAiW0DB2
         iLfYiZAfUmqTGAbbn4gD06xJAieJof9s2vwYHyAVlQJkGMDVC4zeV9GIQdMkzg0tQA1Y
         hdyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N40Ys2WwREbdlf0UPMXpzQZmUrGcTgSJ9kBHkYNCAm8=;
        fh=7fP4JCZM+MvBBCfRGpLCu3IXchgEQd0ui88FhKchFqk=;
        b=pR6DyPHtY44P06PLsKDe2tfYPXj7PdCELGWo3hbw5ICtX2ogwDKxC/mEbdwpCgqCZ6
         d9nugFBhxqtauE9bs0tx8X7fF4xBSLrCUb4bY2Cx2RtiGUT7QSBU9SybXXEAWBq6ocYP
         S/bWP8GLfvHk4boAQCEfUG3fStNflUmAQUCsZz+a7etaIGkp42Xrm0tZBRBmM2Zu7rUZ
         Zt9i+ioVwvtH7ATPYIkMcIXyFj8h3JZiIF7idUX4tuTmGMJw23GfJnS7PIZHrEHslAak
         OTlm+iMk18McSAnFo9fg+s7z6+93wuRz1Aq4zA0GcCjvf9QqsPjVafxJGV18Bq2EV5sB
         NUjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788909701; x=1789514501; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N40Ys2WwREbdlf0UPMXpzQZmUrGcTgSJ9kBHkYNCAm8=;
        b=Hkq1QJT7aD2gS/kN+6+wiIolAdUiQCrVzoLUPWZlpYMRNz3/FxgNHmYhAPiZLmBygJ
         2ELmOjRjFLo0ffk+q/kjnbMC+VffmQLlBTj8vl4xveW94uYK7HG1ZjF3v0mbTW9Ed2pV
         XxYzXufrNGxuIfNA/dIZHX+e6ACW+U3UBfusy2ihqS2U2B37OprhCJxC5cYR2D54JtN3
         ETArIWgVNNue5PiMnlbRviiD2ygZrhU3myVVVElA5lD9p5T28BbrflzRlyYZMwaB0dKz
         N6Za3CMK5fs4UrXKy3mVyxZrioZHD5qwA2XokhT/cOPBkQKBcWI8WU7qWUv3hmaZCQ/7
         C99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788909701; x=1789514501;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N40Ys2WwREbdlf0UPMXpzQZmUrGcTgSJ9kBHkYNCAm8=;
        b=GBBr048A+Zbu8ooTI+8NhO4WS7oQK/6US46Hkl1058zz74pK9IxqiYH4ebRlOcnm6Z
         oy6Kt+9aCqUdHUvJ8h4Cm8XSzbkZh6z7I/unVoBMvTBjCQzHUvdB/T2GtmW2rw9lLH9Z
         jDpy9vzBKlNirfptcWHhD1UgHlp0fetBmuIa4dl4U6+DOh/QUO1BIkhaG+WgOtEmbho3
         yimyp3UHSp4JvYxm6Zv28OBhwEqmpFrfQ9dO1KtdScFsC4HDUPZuKc7hVt6L98nFGIAD
         +Fx2zs9JoKlEQtoMDhsNk4fNPeSw2mduyJ4xPlMPrtYfwlYUO7SNFJ0gYo8CXGKg5nsV
         x5Bw==
X-Forwarded-Encrypted: i=1; AKwUvBzfId2YfeQw8YlscayI5jzGJetsgXTzAyZO4aVQd97qKdAP1GoXaUuGWbbchfMzov8LI/J/da44sTPocswGCXM=@vger.kernel.org
X-Gm-Message-State: AFuF++lpwqzkOGqj6w9VoFWOKMrA92MTZNL8conxpBTj8PEgIfxPi2aJ
	DNqCVuUAq9qWbcz90NEjEMdT4QZVcHRsjrp1fDikBGixEeH2GLyUh5/ECreqpJaxmuDGTFEjrxI
	lC5kVYQRhIIDAf0yXvfzrDZenEEepG0k=
X-Gm-Gg: AYBFou3AC1ZhhDxFeIyiLkxgjMw5JDCDuXB5NjEJbXgTmM3Jrabjo0MTSH03r6yeDp4
	Lrtm1MDcT/IQImXLtq698cpVXF5kuNrlWneUb4gHBmPHbDQLuSqgv/muIxqNRvFtOQgMA6nOYwh
	/dQLeh3bBbCvN0jfr0AgrBB2o+JUZ4CIsZxYFap/LkZ07n+F+HS0mOVa3TV7/FhNL3Ulemr024c
	SLUnmcZ7G4zuzkVTA+GM8ZuBd9CGpbnpZA+n6B+cunVlEc2zeWCgvhrX0TZF2VJZ5SVBup6o6Y3
	HzPanbtDSbK+zE+3mRxpi+Jboimj+g31H6Yunpv7K32uFjg65TjCtU5raMBiGLt09T8SfpHFJWx
	FbHLJV0izkqvONp0f9g6smNled0wX1qrxMpR+P99abw==
X-Received: by 2002:a17:90b:57cd:b0:38e:bfe:81e9 with SMTP id
 98e67ed59e1d1-39b260fead0mr46769801a91.1.1788909701068; Tue, 08 Sep 2026
 16:21:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902150439.692725-1-adi.sharma@zohomail.in>
In-Reply-To: <20260902150439.692725-1-adi.sharma@zohomail.in>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 8 Sep 2026 16:21:25 -0700
X-Gm-Features: AcwNN1W3DRslezF3q8zGwmwdk3AYLdNuGHbMfUGJVA0I4K_g62wgy-gg8bf3BtQ
Message-ID: <CAEf4BzZSWKeEV0-i65Nr4zKmB3uKZu7cqtHc3NrphFV=Z9--qw@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/2] bpf: Only check nmi_uaccess_okay() when
 signalling current
To: Aditya Sharma <adi.sharma@zohomail.in>
Cc: bpf@vger.kernel.org, ast@kernel.org, daniel@iogearbox.net, 
	andrii@kernel.org, martin.lau@linux.dev, yonghong.song@linux.dev, 
	eddyz87@gmail.com, song@kernel.org, jolsa@kernel.org, kpsingh@kernel.org, 
	shuah@kernel.org, puranjay@kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 8:05=E2=80=AFAM Aditya Sharma <adi.sharma@zohomail.i=
n> wrote:
>
> nmi_uaccess_okay() takes no task argument and is a statement about
> current. When commit 6280cf718db0 ("bpf: Implement bpf_send_signal_task()
> kfunc") made the PF_KTHREAD/PF_EXITING and is_global_init() test the
> supplied task, nmi_uaccess_okay() was left testing current.
>
> As a result bpf_send_signal_task() returns -EPERM whenever the
> calling context happens to be a kernel thread, regardless of which task
> the signal is aimed at. The same call with the same target succeeds or
> fails depending only on what the CPU was running:
>
>   bpf_send_signal_task() from tp_btf/workqueue_execute_start : -EPERM
>   bpf_send_signal_task() from tp_btf/sys_enter               : 0
>
> This was originally hit from a bpf_timer callback, where the failure
> is intermittent because a softirq runs on whichever task it
> interrupted. The rejection is x86-only, as nmi_uaccess_okay() is
> defined as true in include/asm-generic/tlb.h elsewhere.
>
> Only apply the check when the signal is sent to current, where the
> predicate is meaningful. bpf_send_signal() and bpf_send_signal_thread()
> assign task =3D current, so their behaviour is unchanged.
>
> Fixes: 6280cf718db0 ("bpf: Implement bpf_send_signal_task() kfunc")
> Suggested-by: Yonghong Song <yonghong.song@linux.dev>
> Link: https://lore.kernel.org/bpf/20260819124324.43162-1-adi.sharma@zohom=
ail.in/T/#u
>
> Signed-off-by: Aditya Sharma <adi.sharma@zohomail.in>
> ---
>  kernel/trace/bpf_trace.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/trace/bpf_trace.c b/kernel/trace/bpf_trace.c
> index 29260951aa87..f7a41f222599 100644
> --- a/kernel/trace/bpf_trace.c
> +++ b/kernel/trace/bpf_trace.c
> @@ -871,7 +871,10 @@ static int bpf_send_signal_common(u32 sig, enum pid_=
type type, struct task_struc
>          */
>         if (unlikely(task->flags & (PF_KTHREAD | PF_EXITING)))
>                 return -EPERM;
> -       if (unlikely(!nmi_uaccess_okay()))
> +       /* Since nmi_uaccess_okay() is only for the current
> +        * task, check if task is current.
> +        */
> +       if (task =3D=3D current && unlikely(!nmi_uaccess_okay()))
>                 return -EPERM;

I think we should just drop nmi_uaccess_okay() check altogether.
Unless there is some technical reason why **for current task only** we
can't send signals, there is no good reason to have this.

let's just drop, it seems like just a copy/paste from some user memory
probing logic, which shouldn't apply for signals.

pw-bot: cr

>         /* Task should not be pid=3D1 to avoid kernel panic. */
>         if (unlikely(is_global_init(task)))
>
> base-commit: d761934c9483ecde93fe99d8705282f716dfee50
> --
> 2.34.1
>
