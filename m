Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794002900;
	b=gN0jvU0mANu1Jg3uLJ/kyVXf/1KbhMzteD01r4k41+SbTRCWirBm9IU+e4y1738dmukh
	 6f5Y937V6GXE1zCc9RDcJ/mP5gQN2V98tOvEpXILbPXl2UkoUMGsuOhARfd91MVJsiTwi
	 YrFIy+n3PQuYaT03pQwOYYAFKJDF/W8Y/X5QvLOp7JPRUNmx0nDaKWOmctC2yNbBrHix/
	 1gaz97zdaeR672UDG8VuzcA6m6hIkuFi4fOQhydtC21+UE56IxD1mpxk1xXDa+WToy+7c
	 8KkGvM9Mu4RVTK4K4mz3c3EOIjqxYfmSVSDsjvYD5VdehvuYOqbq6m6GiEE1apk1XEQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794002900;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FqFmqkkFKN4ZfUBPlXX1uRJGzP51Rl5pjkFD5VZ5PcI=;
	b=IQ7S/84vxSbpNbEM6UfaCGTs6nFYBwg+ms3lsogKlnNn8V2JZZmkWcLknMoTYiepuYGq
	 TcL7CFUSfXulHHG7HsnRQZ00ZaIUmzK+2T3r+vc9tgHoCS7DAwRAgUj9zVzVSKsgrxXsH
	 YEgqYzeBavJjkv7meDzBoBY6cUEGz7BZtjtYhFGHf0GRFt0PxWsLeTJMSHOL8FB6CpyZH
	 Eslp1kVUVM2gT2R83hRYRN8+F/KSOfFBSSoXeh3uMVp476AUP3P2S+YxOsrrvvYQ0Y7uX
	 bIanaD6CkTK9AI0PWXYcPqPpIDnM6XGJOVxWqAmALzR5mNQ12i4Q1fCC7SgEjM5HnKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="b2/N2EGe";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA281606A32D
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 22:08:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA281606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b2/N2EGe
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e9e53d011eso7059975ad.1
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Nov 2026 14:08:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794002898; cv=none;
        d=google.com; s=arc-20260327;
        b=bT9IF3k92GX2edoBWl+/DxitlL8PwXrNqZrunTWYhli8leNRam+Or8rdwmeXZjUz3a
         x70cJreqhvo0Uzhl7nUXKyLels0zztePDPR1avw6NHmbI+5KQaFlaT96jgid/wv/GQYi
         VUSy58i0O19D/TIc989PhUb32FHF3RH5IKJuQLcwMYy1sI1Gq0tom/argsHFL/vGtU2i
         dqkYGlKUzxAY6XxyfGmvFVwhmxdWqty91ywEijkN5FJ1/yM5imA1zYHQHWNTp97stzmi
         zx5W69UmQ0cDxZms0snYHdElXGlTo3/V+NifzapDkyLtfxNOyN+/wHK5etacI7sEK9xG
         GH9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FqFmqkkFKN4ZfUBPlXX1uRJGzP51Rl5pjkFD5VZ5PcI=;
        fh=qt9b8rMBkrFmRCsygvPDEv7aSEwdKU7bee16ecz7mfc=;
        b=H7XGyw2R+sShJUr7ADj/ZkL/pFmT4arg3kkkNx+zGIdYlkObj65sRnXuxs2IIzWEFh
         D+9jEWUrGlST4ZGqRBii/OuUwMHVyjnRiR2Ws3FrVwT71niCMfoAvVH+0Oa25t6iKGY5
         xvZU0NBPTNC/5Su9wskAuSmtfuOvEeVAWPRStB44utVFJUOqhd1rll6wVm5OUfSsgwpq
         h7hK4AuGV0QDp9l0+cBmB65IhGDCs5ZvyNjCgUvn+dxW/v8saMIOYiRVzww8vhqG3P7W
         vZjjjWd7elTOJsX+bqivQ1GC9jA9Eo8mKqsg5g3qDtdMDslBzPb4Lf8T8zjd2ClUDH5e
         Keng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794002898; x=1794607698; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FqFmqkkFKN4ZfUBPlXX1uRJGzP51Rl5pjkFD5VZ5PcI=;
        b=b2/N2EGedXLlXAmGy3seM65ririhay+J1WlirQfYoIUcuzkaIkl40FHJgakuZm17yG
         nAUDoFDfOaFJ2QMk1EmeGmZdPADqd8uhJznVwiRoEa7b9qPw5NO5xVYpVn9firQ/kOPr
         Mm37HnJIN8yf1x8+h31XvbSyn7wQFbQpPyf6/L9n14w9o7d/7pNuhwTPUw9cFq2U/wtQ
         WAIKhZ8O3jGTIIm/CeEJihiD58ppPZeCsmi0UP0AXYkJFrklaGSOGsTD0bocfuGE2dJl
         7rUrLFZbQygqs4qQRSuVhMdfq3MebiGXFEAym6kvd+/cthwIi5tgaGStlIqGdBN7e4SM
         hnFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794002898; x=1794607698;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FqFmqkkFKN4ZfUBPlXX1uRJGzP51Rl5pjkFD5VZ5PcI=;
        b=h13Ma1IJTbUsyaz2HYW5PtxpBoS3KxDBwxVvkNfltFBeoaf78IMZxiqV7HspcZBEOS
         lJOdIWl4G1L3iQbENM+BxEVrNcocIdIXoaC2KBdqwlQEz1P5AfuRyD8b9u7YnEekURD5
         kCTJOtbSW0t18r9Ja3S1iYBwK/XpApHFyxJaqhKspLaFIu/hajZMgHBsap7HdkIYfvQo
         U2o8K/7EpPmseJJ2sQqN3Xlr2oiM8X0d3L87SvOr/9WVA5I2WNCmW6h2Cvve3DOlU5gM
         6503nY4AG057I0vO7j1mEgeM+ksuhQppNowqvDX2J1moKoygBno8dgovTEjrdMF6IbhB
         YryA==
X-Forwarded-Encrypted: i=1; AL+hErGkrb8NI7r/hsMKCZKCthn08hliamnnMzqfpiGb1Zqyqn/bKE75lvtfIOEdeuPyxeOK0RpjST0FwEJC9kYhACs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0046kzLOtyCaD8rAt4Z2z6LwC+oyn1wY2RlZdcXCxMH1Fp8VG
	AP6y+nboryUhoAicgou+lCmYGUgeAQJx4SQASTTHRnJXigfAtH0WFQfJ8Yq8KEEazk+ZJRFWPHN
	OLLx4tFMl+n5Kcf6LgqP0Ncp30P7q3zo=
X-Gm-Gg: AYBFou3b0v7VYTERf7Rg7UNc//9p7SNPfmL7KnE8UfTSm2rOStvtE690BeDQOdQA6tF
	UNKP15nrcwrkbA6Kwy8ouP0IGg4l4gEOeglRnHPEvv5plDbPfXIyJ6z5mzrqIj1XEUfR2ckLdDA
	i8j+dvOeGmOuaEVB3Lbv/symGWjgn9NBYJBMRkNY2nhrhzYe2BGEcxUKoL1FAL7wnoF+DucQz5g
	899iUlXyr6jWVlNScRvu80o2hylVa4rhk7Imgn9OQtS5ndrqzYb9cvmVYQZIOvEFyVLsQWB9vbT
	zSm0oCsvBrjOugWKIYlUfmLC6lP8GkRaR+x0+dtueRS0IwVNLmkO5VrzZJu+dsMdbBwR3Fy5eOJ
	EGWxDFiGFHmQw95cNWNucMI1/CBcEF8cYaTXWr9vQ413LnAWFbIqsjSxCa8PT2qPYdEMU4FtGCK
	/fP1rYoa9NEc+CZ5oD5AWGDz/ui6UVCfaNRJDP3is=
X-Received: by 2002:a17:902:cf03:b0:2e9:5eee:e087 with SMTP id
 d9443c01a7336-2ed41c0b3cemr44187095ad.43.1794002898049; Fri, 06 Nov 2026
 14:08:18 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025-b4-bpf-trampoline-preempt-v1-0-198dcdc0c6ac@sentinelone.com>
 <DMIIV9CE0PN4.309YUGIXQUZNF@gmail.com> <e3f63654-0f7c-462b-b58d-05f3164fe340@linux.dev>
 <DMM2G9OX9ACV.231CHJEPK0OHU@gmail.com> <CAPnbwjpQBR-KHwOMG2bo1uhdp22ZW_O5sUj3=vjazVu=Rdnb7A@mail.gmail.com>
 <DMN0RC27TJRM.3KUSPS9QTBV4G@gmail.com> <CAPnbwjrX-ywbcgNQSZKE2jiggEOSVCRVw9OLfaksihiVSCoqvw@mail.gmail.com>
In-Reply-To: <CAPnbwjrX-ywbcgNQSZKE2jiggEOSVCRVw9OLfaksihiVSCoqvw@mail.gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 6 Nov 2026 14:08:05 -0800
X-Gm-Features: AclHuK_HFrsL2zSNs8yVxrqbEw7XSZavKhtUuOEmL2ac3ue5Zeg2-SW1ecbr29Y
Message-ID: <CAEf4Bza0XDMTxxZeukwRXjvoOOruY49q66xBXnYnuncbeo_Oiw@mail.gmail.com>
Subject: Re: [EXT.MSG] Re: [PATCH RFC bpf-next 0/2] bpf: Do not let preemption
 cause false recursion drops in trampoline progs
To: Mike Bazov <mikeba@sentinelone.com>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, JP Kobryn <jp.kobryn@linux.dev>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

(resending as plain text, hopefully)

On Thu, Nov 5, 2026 at 3:35=E2=80=AFPM Mike Bazov <mikeba@sentinelone.com> =
wrote:
>
> On Thu Nov 5, 2026 at 5:14 AM UTC, Alexei Starovoitov wrote:
>    > Also try NO_HRTICK in /sys/kernel/debug/sched/features.
>    > That may be decent workaround for now.
>
>    The 7.0 numbers I posted were already with NO_HRTICK, and either way
>    our agent runs on customer machines, so changing scheduler settings
>    there isn't an option for us.
>
>    > hmm. you really cannot tolerate that small drop? it's tracing at the=
 end.
>
>    For security monitoring each skip is an event we never see, and the on=
e
>    we miss can be exactly the one that shows an attack. For stateful
>    protocol parsing, one skipped sendmsg/recvmsg can desync the parser fo=
r
>    the rest of that connection.
>
>    > let's try to think how per-task counter would work.
>    > I'm guessing 128 connections is 128 threads servicing them,
>    > so 200 cpus will be hammering the same per-task counter which will
>    > cause real perf loss.
>    > Gotta do better than per-task.
>    > Also it needs to be per-task + per-prog. How will it look like?
>
>    On Thu, Nov 05, 2026 at 01:26 PM Peter Zijlstra wrote:
>    > I would strongly prefer all BPF programs that attach to known
>    > preemptible sites to use a per-task recursion counter or something o=
f
>    > that sort.
>

I agree, per-cpu recursion counter doesn't work given most of BPF
programs only disable migration, not preemption (even if
non-sleepable).

>    This is what I have in mind for v2:
>
>    - Every trampoline and raw_tp run already has a run ctx on the running
>      task's stack. Add the prog pointer to it, and link the task's active
>      run ctxs through one new pointer in task_struct (other prog types
>      don't touch it), so each task has a short list of the progs it is
>      currently inside.

hm, funny how AI figured out run_ctx, but didn't figure out that we
already chain them and we do have that pointer in current->bpf_ctx...

but yes, I think this is the only practical approach for per-task
recursion check. performance-wise it should be ok as normally we
shouldn't have nested bpf program executions, so the hot path will be
quick.

>    - On entry, walk only the current task's list. If the prog is already
>      there, it's real recursion (the same task, or an irq/nmi on top of i=
t,
>      since current doesn't change there): skip it, as today. Otherwise pu=
sh
>      the entry, run the prog, and pop it on exit.
>    - A preempted task's entry stays on its own list, so another task on
>      the same cpu is no longer blocked by it.
>    - Cost: the list is empty unless the task is genuinely nested, so the
>      check is one load and one predictable branch, with no atomics and
>      nothing shared between tasks or cpus. The walk is capped (e.g. 8),
>      which also bounds nesting depth. It also works across sleep for
>      sleepable progs.
>
>    To keep the per-cpu guarantee for existing progs:

I don't think per-cpu "guarantee" was ever there. per-program/per-cpu
recursion protection only "protected" (by dropping event, effectively,
so-so tradeoff) a case when per-cpu map is used exclusively from
single BPF program. But even then, there are BPF program types (like,
I believe raw tracepoint programs) that intentionally didn't have
recursion protection.

Realistically, you have to have some allowance for having nested
per-cpu map uses, e.g., in wprof I maintain a small stack of per-cpu
values, see stack_trace_scratch and embedded atomic st_cnt counter in
[0].

That's all to say that I don't think there is a need to keep
guarantees. If per-cpu map is used naively today it works ok most of
the time, but not all of the time.

  [0] https://github.com/anakryiko/wprof/blob/master/src/wprof.bpf.c#L574

>    - Make it opt-in: a prog load flag for fentry/fexit and raw_tp progs
>      (like BPF_F_SLEEPABLE) saying the prog may run concurrently on one
>      cpu, and that it doesn't rely on per-cpu exclusivity for its own dat=
a
>      (per-cpu scratch buffers etc.).
>    - Flagged progs get no private stack. The verifier could also enforce
>      parts of the per-cpu promise if you prefer.
>    - Unflagged progs keep today's prog->active check, so existing progs
>      see no change.
>
>    What do you think?
>

I'm actually wondering if we should re-evaluate the whole per-program
recursion protection. I think this was added to prevent deadlocks
inside bpf's maps and other internals. but we have switched to
rq_spin_lock since then, so that shouldn't be a reason.

Perhaps we should just get rid of that whole per-program recursion
protection and just make sure that a) BPF program can protect itself,
if necessary (with naive per-cpu check, I did that trick in retsnoop,
[1], because it was, and probably still is, possible to attach BPF
program to kernel functions that shouldn't be attachable by BPF,
leading to all sorts of issues; but I digress), and b) just make sure
that BPF maps and other functionality doesn't get deadlocked if
another BPF program got preempted in the same code path.

I didn't do any analysis if that's already the case (for b)), but
let's discuss if this is an option at all?

  [1] https://github.com/anakryiko/retsnoop/blob/master/src/mass_attach.bpf=
.c#L229-L243

>    Mike
