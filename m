Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2371C3BEB
	for <linux-kselftest@vger.kernel.org>; Sun, 25 Jan 2026 03:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769312255; cv=pass; b=J+iD29fyYkFyln+meTQKbO8w/V+69BSWESA3GUZnXV6MbJeUVnS+tb/xRdLAnZxRQhueUzfQzwnsgJE5od9zWCpgOkw/EKAmFda/6i8NeXSP7Eb8A/l0dcexG6eRIaeZ/kUfrsoJCjao26x6h/Y48kBt0lDc0Xniy8BWmfA1QSI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769312255; c=relaxed/simple;
	bh=KHHLDqior8B1P737y/3GiXhhM05h77Asbm7hlK7XFjA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jwvydNyeBbVCf8xeYAhU4D1XSFQH5nwpKEKdFZfnsI7jaxS1E6Klrc8rv7dkNMBCoM/kx5gsblywkg5P+GmHgCZUEjRtGL7DD5s2g7xUza+I83ZbScPS3IXdZNkNKiUjgPSL8frOlMoi12yod3YlRg73WJXy5ymvRiUgm2in/bA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KIVmaTSw; arc=pass smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KIVmaTSw"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47ff94b46afso28760985e9.1
        for <linux-kselftest@vger.kernel.org>; Sat, 24 Jan 2026 19:37:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769312251; cv=none;
        d=google.com; s=arc-20240605;
        b=HKpvCF+GcOjneC/TYXU2odFbk/PlSHQuBBBV0WM/VukiwMXJ9xjxpM3VUQJEhlIFhs
         mu+MI/cTlhrUC+bs1WOzq6MMmtZAoL7egC2tC3gb22wT5gYSF/260mbGsjtBmuPu+4RO
         ynwfFi3HgaO8ItvCnNoE5O5EY70msK/DWTaQ1IjvCSwPmq5Tmw3BHpsmsWBYAWpyUu5w
         E6a+aEkkC1BHD9bqlr2+k1x6jq+9LtPXkUaH/hWIdvsz1ruHHM+2KPxvWSV4+1DEBqCC
         a4uKnup65oaf6ozfgG6tvf6FB6qsU/GFj4RbQ3NoKBUXEk8h6Z6D2JWMxk7KmmtMHc5w
         Iciw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fPmCud2y+M6bkRgBEaGbRSzSQM5OP3Xz+/rlIQC+PcY=;
        fh=854gDQu1Mnh1f9Ea/j4p/6fGiQFfkc6rGUGMUOTMpTY=;
        b=fGRiZDBqil7o89TtXcPBD00PZfAB2uzOj4ZJJ64HUKyMaGVpiFrWGHpQViYDZOpAhj
         rxqvIVzb/yR4bDcsnuIMoJ4tdtxewojKLZmKm//7+T69YFEANXIQCgSItSBd72r7FNa0
         xT78zknF1Yng5fjkcN+pITFKBmD35Z791f+ZRyeyz6H0v8ZssiJWgfTy+k3ZcHNlRmRl
         Jpze6yHKXgHEeE0bDn6lPAY+BJK//q8KRJLuSGVTwIjPSim8qTDpTfwbfCpjbKY6u0OQ
         PgV7PZp23N2CC6OyKlek4V+d2EMFoEx+RXXAjZ1adbCOPG90xLkh71SUysecqCNt3hqi
         F+Aw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769312251; x=1769917051; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fPmCud2y+M6bkRgBEaGbRSzSQM5OP3Xz+/rlIQC+PcY=;
        b=KIVmaTSwi89Z5icph7ynQ1D5fE5N2QNKRU3sbwn93YUdSE1tsl8upkuqV40yt+X4Ab
         hTPzGKZ81R+zmqRnOsEdNZLGwoctddvj7UxJmNQpuE9ZHf6Zse6YpOUBe1nCxqlhtf+D
         htuJSBboaDBKQ/61S75Nz8aPN7PZME/OFDgqbAm2TsQg6Le9bi5N+NfHwG0wRBMixJDy
         OJlJmxOmjbyNntL8lM4SCpklG/LTdr+iZk0k3tjCa7+yDjyK0Ii9V/NqIkTZm3jXVy9f
         n562eaFcPMifGxhvUwBAkIpuvthl41dWch82pvOnYqPKx+pU1mXHE/Csj41JGGICnTTX
         uGjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769312251; x=1769917051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fPmCud2y+M6bkRgBEaGbRSzSQM5OP3Xz+/rlIQC+PcY=;
        b=c61+6clIl/fsUPMOBW1xsAEMgpjUeuhQML23CuwfG27r0nxGisgwOvtBV94GjJIfIU
         hToQeo8WjGag2yy98/lTIkT0bJNswM0NvnI6LeuGHtoHcOHJJBxQV2ZDUBfOGrNDfLhN
         hQSTEqBLAMu0dg12Z6q+iEyhjuDdkeLQlle3jH+IVJ2icrhJ7PpTscZcaTLsC35OaErZ
         cRiE10awkg9GaZULgJ+ZcRu+AeKROhkW9eiyRSUxGa3aaG8F87vHO1ZE/Z6B7F9XVzvH
         eg+B3YA7nOIZpKz+VGiHYE67kGk//hhVdaa48n/hVHQanFvf7FReSLwt1LKTI/sMLR+V
         u/qQ==
X-Forwarded-Encrypted: i=1; AJvYcCX64zQ04Ftk4hd74pA75ANC3Inf6dz0mi5dwOMS3Y+eFquCuasqhA9dYzbFxrM4eIYmDxNCJ6Jy1bcRP7GKR08=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLrvBMU4arNs/yhNoJhegnlLtXwOYDfq98fbviwzkvD7dvGycF
	MoN28Q6simWXpa+A1tW0QX4uGM111vPAb3KBNssnagzsgXOA8n0v75DxVu0PkSsVF7miqA/8O/e
	nf6JN9oGJ9eD6JoFdgP6z2kEyWtTPpwE=
X-Gm-Gg: AZuq6aKnotGec+h5if+os0dS6OJqjkPf9VRE/Fgmg7udXIJT+g+mLpR3vAQ0nf9Yp2T
	N2ENEeSBkVxf44j2kn2+P08HyBD5lb8Kx9hZiT0ls+7c0Mk51zyKRclprN6dnTXH/PMMyALpjr4
	7oeQPLHr/tS8LqTQgt9BQLt9uY6OSyuVdiXGrVIDhVvfbR2+U4o5zd+JjCTJZLfNrGq92Ncsidw
	RruVpYOaXRo+CBOdRuHuyLLkz39LNC5Fagaz4gZ3jrU1GypxCQ8ZleVgRnRFhf9DqtypwOgjW3G
	+Pw4mHIOT6FrY7+tKIl6T8dtFqkIG9rQZ2wmYIFGA+9EVNRIMbMldXADmri2ovc3oPtOWTTbujV
	46Tk0vmE5M9etdxWhmrlHeFjz
X-Received: by 2002:a05:600c:4e0a:b0:480:1c1c:47d6 with SMTP id
 5b1f17b1804b1-4805cd209b4mr8106025e9.6.1769312251203; Sat, 24 Jan 2026
 19:37:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260124132706.183681-1-changwoo@igalia.com> <20260124132706.183681-3-changwoo@igalia.com>
In-Reply-To: <20260124132706.183681-3-changwoo@igalia.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sat, 24 Jan 2026 19:37:20 -0800
X-Gm-Features: AZwV_Qj31pcX5ZPXwbOsYn_O2QL4zbHL9yGaFvSAbSLaqW3XuIfAe1fsD78xc_g
Message-ID: <CAADnVQLS4n+Mnti34aaN9_k08WLV0fj_2AM61x-oApFKwKGihQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 2/2] selftests/bpf: Add tests for execution
 context helpers
To: Changwoo Min <changwoo@igalia.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>, kernel-dev@igalia.com, 
	bpf <bpf@vger.kernel.org>, sched-ext@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 24, 2026 at 5:27=E2=80=AFAM Changwoo Min <changwoo@igalia.com> =
wrote:
>
> Add a new selftest suite `exe_ctx` to verify the accuracy of the
> bpf_in_task(), bpf_in_hardirq(), and bpf_in_serving_softirq() helpers
> introduced in bpf_experimental.h.
>
> Testing these execution contexts deterministically requires crossing
> context boundaries within a single CPU. To achieve this, the test
> implements a "Trigger-Observer" pattern using bpf_testmod:
>
> 1. Trigger: A BPF syscall program calls a new bpf_testmod kfunc
>    bpf_kfunc_trigger_ctx_check().
> 2. Task to HardIRQ: The kfunc uses irq_work_queue() to trigger a
>    self-IPI on the local CPU.
> 3. HardIRQ to SoftIRQ: The irq_work handler calls a dummy function
>    (observed by BPF fentry) and then schedules a tasklet to
>    transition into SoftIRQ context.
>
> The user-space runner ensures determinism by pinning itself to CPU 0
> before execution, forcing the entire interrupt chain to remain on a
> single core. Dummy noinline functions with compiler barriers are
> added to bpf_testmod.c to serve as stable attachment points for
> fentry programs. A retry loop is used in user-space to wait for the
> asynchronous SoftIRQ to complete.
>
> Signed-off-by: Changwoo Min <changwoo@igalia.com>

...

> +#include "vmlinux.h"
> +#include <bpf/bpf_helpers.h>
> +#include <bpf/bpf_tracing.h>
> +#include "bpf_experimental.h"
> +
> +char _license[] SEC("license") =3D "GPL";
> +
> +extern void bpf_kfunc_trigger_ctx_check(void) __ksym;
> +
> +int count_hardirq;
> +int count_softirq;
> +int count_task;
> +
> +/* Triggered via bpf_prog_test_run from user-space */
> +SEC("syscall")
> +int trigger_all_contexts(void *ctx)
> +{
> +       if (bpf_in_task())
> +               __sync_fetch_and_add(&count_task, 1);
> +
> +       /* Trigger the firing of a hardirq and softirq for test. */
> +       bpf_kfunc_trigger_ctx_check();
> +       return 0;
> +}
> +
> +/* Observer for HardIRQ */
> +SEC("fentry/bpf_testmod_test_hardirq_fn")
> +int BPF_PROG(on_hardirq)
> +{
> +       if (bpf_in_hardirq())
> +               __sync_fetch_and_add(&count_hardirq, 1);
> +       return 0;
> +}
> +
> +/* Observer for SoftIRQ */
> +SEC("fentry/bpf_testmod_test_softirq_fn")
> +int BPF_PROG(on_softirq)
> +{
> +       if (bpf_in_serving_softirq())
> +               __sync_fetch_and_add(&count_softirq, 1);
> +       return 0;
> +}
> diff --git a/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c b/tools=
/testing/selftests/bpf/test_kmods/bpf_testmod.c
> index d425034b72d3..1b04022859b7 100644
> --- a/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
> +++ b/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
> @@ -1164,6 +1164,33 @@ __bpf_kfunc int bpf_kfunc_implicit_arg(int a, stru=
ct bpf_prog_aux *aux);
>  __bpf_kfunc int bpf_kfunc_implicit_arg_legacy(int a, int b, struct bpf_p=
rog_aux *aux);
>  __bpf_kfunc int bpf_kfunc_implicit_arg_legacy_impl(int a, int b, struct =
bpf_prog_aux *aux);
>
> +/* hook targets */
> +noinline void bpf_testmod_test_hardirq_fn(void) { barrier(); }
> +noinline void bpf_testmod_test_softirq_fn(void) { barrier(); }
> +
> +/* Tasklet for SoftIRQ context */
> +static void ctx_check_tasklet_fn(struct tasklet_struct *t)
> +{
> +       bpf_testmod_test_softirq_fn();
> +}
> +
> +DECLARE_TASKLET(ctx_check_tasklet, ctx_check_tasklet_fn);
> +
> +/* IRQ Work for HardIRQ context */
> +static void ctx_check_irq_fn(struct irq_work *work)
> +{
> +       bpf_testmod_test_hardirq_fn();
> +       tasklet_schedule(&ctx_check_tasklet);
> +}
> +
> +static struct irq_work ctx_check_irq =3D IRQ_WORK_INIT_HARD(ctx_check_ir=
q_fn);

Nicely done! selftests should work in PREEMPT_RT too
though we don't enable it in bpf CI.

I was about to apply it, but the new tests fails on s390:

test_exe_ctx:FAIL:hardirq_ok unexpected hardirq_ok: actual 0 <=3D expected =
0
test_exe_ctx:FAIL:softirq_ok unexpected softirq_ok: actual 0 <=3D expected =
0

The existing bpf_in_interrupt() also works on x86 and arm64 only.
When it was introduced it came with pretty weak selftest
commit 31329b6 ("selftests/bpf: Introduce experimental bpf_in_interrupt()")
so it's not really testing anything on s390 and non-x86/arm architectures.

So just add your strong selftests to DENYLIST.s390x.
get_preempt_count() on s390 looks like this:
static __always_inline int preempt_count(void)
{
   return READ_ONCE(get_lowcore()->preempt_count) & ~PREEMPT_NEED_RESCHED;
}
but get_lowcore() needs asm.
So it's not going to be easy to make it work purely in bpf.
Let's punt it to people that care about s390.

pw-bot: cr
