Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DD23BFE2B
	for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 11:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779363661; cv=pass; b=MhZ+l9ZMFmdGI3ByNuinTfWPzQHTwyHTsgULx7cQ0ZNpC0X9y5KXMApkyNXWARhOxmP2mbMYQPgb4S6PCbbxj+8hDa2HXDBMXXhe6Kbvpx88YPgVeXVZ405/INONV8GQL02YsQ0Ud5EZ3iZ0hGQrhQ5dZQpjJZUmrFcU3UudrNg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779363661; c=relaxed/simple;
	bh=riJyyQBHmcmUr4FLiqYcGUxqo/3HIffc80/U9WyxWpk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dXfVmwSxbvWEY4MQaXty3gS1QJ4tAtd3CnEeQFLWJMse262JCnQwah1ATYJynllCsEU+cDdeSJychMsC0IGEMMjY7/DUYNuIpROvUcmioKKRtd1q9cWI6sm0Oqhw0vDhVHcxgy2t+CLo6XbCyUQAdX/p1MiO4JxDcpziHbHY1VY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Vzecz3l8; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Vzecz3l8"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-50e61648f10so581cf.1
        for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 04:40:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779363659; cv=none;
        d=google.com; s=arc-20240605;
        b=hzTGLPVrVJSFstCEICfKDKjITGbBnaqVitpSFKVr5Oodi3A4CEbid7R7ivspcocMcK
         iSeVQdgdJN5rihnB8lD2tzQNkvFuXwFkm33ldlV3NLh3SGruRDo7bmdm7ocxV/FiwqHI
         KX7MxABy24ZiP3bisr8p6FFxolalkw8H7Zc0qTRTCgrBMSn4rCnHJzW1NWBX7Z0rMLJd
         ALM+s07F5sa6noI334nXzzirfPwTkR/90r8qY8Jq+5HdHZZO2aLi9BgEKlRUWYDoAJHZ
         V4Ry3H878372Ffg9WZmqTVVsbqlYbLsp/IV3qgOvo/Res8IiuAexnz8pGIcHPz/An7tK
         2AUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/o74v8Vq3GABGlC1t1lTUtlP7/VYHfplVzyMXpW76dY=;
        fh=WEyXGEhDrWvRsZDdRwczbDYTQwuOPrUzn5ObQiEDy+8=;
        b=Y+b0YZhdsbUKxOvGZBoDlTblEKPfHVu0PW75m9uaFNEp6vOJgt6IG9HdhDOiEU/qVH
         1KtdKyyxPEHafQ8PINhO8hiZW7sc2cSNkUoE20/VxgmXoJsoOe2Mr39b6sLz+V/t04TH
         WetbMaaEE/0dMhEN9cDkQKt10MJLnZGHGFycUtLm163OoLaXUSwrK5WjOudZ1quW591i
         eybbgpq4IDlMv5cBbmDJzeoKNblOcPwm883U0DJuZK13K7vy50Ra2N13TQDwF1Y2hnky
         rhd5P0cPhG3TQfhhtkaY0C8hY4KM6bOJpNvyc746DnzTqr7rTyHyFGj/GRvwSFsYEmgw
         gdqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779363659; x=1779968459; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/o74v8Vq3GABGlC1t1lTUtlP7/VYHfplVzyMXpW76dY=;
        b=Vzecz3l8Z8HlAE4eXB8ac5yjuUr4scO3+amtVCTVTVI1ycbXZBN02VySl2SEpkBlpV
         84+FJcIY8BRpNlclBLyw9mqiqQN/V2a6iRMJBzccwJ77T9nSkvQM7fx2LUYoE1z8P31u
         5kJidmpgtJ1/c3FWli28BxVI+i95FkHphTF6ql6JZQUTdd9cTALUZc4G9k3Hl5gaYAfx
         PgsleDCtdrbGvDw3EaCfAK4+FGdrpxCrlWjmv2l4XYXIyG7YnBe8MrJgCoIwYNr78zUy
         xP8jgsnTuVuqh2rhFPLMNVb+GjHC21hAhOR8r827ZtTJsKU/TLNmO09z8SAtSMY0Xf9u
         6MEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779363659; x=1779968459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/o74v8Vq3GABGlC1t1lTUtlP7/VYHfplVzyMXpW76dY=;
        b=mfnNEyUPNVsJD7u/+E+cY0q24zJKJzcON9zLQ/k55EbdqUTpgYk1slguCNnTZ2VpwF
         dXUaA/RMcsWToNcTpqzaEH90+bO7SA7mhuBsiLoxdYitqF6y6dY4ydhij9PuaDayEEqc
         9+znh1fZvjysWfelzIc98k62eewsFr+4n1qG6FQSA7aPb0PdtW8qtmoE8f90xNoxHy1e
         qI3smCVI5ZdjB1008On+TrDC3QuTlTwsTmFS9XW2fWJnKx+hpiAo0Ax4JCv1gBmyjPMF
         8jgU6T/18cO2sXHkzZSo0dOnxDs+ywsz8nHfte8XchKvZi4bpiyxpk8Rccn5bW7omY2a
         Ke6A==
X-Forwarded-Encrypted: i=1; AFNElJ/FFhqNX6ff9EFLp+A8W/fkFBPu6luSgPm8Ho4Y/WrpU2zitTQm6+ZdDcu3QAyVWl/D8dF+r7qUNcHnFrWjqNw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc7Y4AoGFrKi1zirNOUKoeB13LpxYP90ItATWJRYyQYt6ejeuJ
	8OF5kH43qPjmCG7bz666Nltl6nxENzBtJawNg5z2CEnOPse3hMC7kP/i9x9rPKSd6P9VPpLq9cX
	PBvnwIONmUmvZ+gRL0yVyz5QPnBjQybP0vmcsa3DN
X-Gm-Gg: Acq92OHozhNh8jc7F3sYI7/PAIAWOw4rY9qb8n3U+k420A/tR/8Sqywz0Ic4vZjrnvb
	8RsCE+Ysag13N6E3BG+mHJOCsFYDEcgyc0Qhi7PFJhbxDpfszL4udFUMKP7szUf3AlH/CdELUOv
	Vxe05axldTYluumnN5081Dx3Npos/AgupGn+GvfF1UdeBIcAtqswlr0x/6XSRwczWVgYLU+ra1Z
	TJ0k0CdcUosWjWaS4zpbPPWCZaoxLkJfyXj6/TwzbVesf/DCYaPu0N5Zk3JeaVQLtR950lnt19R
	isKnrTvPiLhX0cdaLMxVq/J1TMLTorfvGZfZbB+7D2chxRBxVQ==
X-Received: by 2002:a05:622a:4cc5:b0:516:4f62:85e8 with SMTP id
 d75a77b69052e-516c552713emr8883241cf.19.1779363657940; Thu, 21 May 2026
 04:40:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515071504.2054786-2-yuyanghuang@google.com> <2e08eb1ca27a9a2f8ad29e1c24f779b579621b0a648589f7044799d91c5e00f5@mail.kernel.org>
In-Reply-To: <2e08eb1ca27a9a2f8ad29e1c24f779b579621b0a648589f7044799d91c5e00f5@mail.kernel.org>
From: Yuyang Huang <yuyanghuang@google.com>
Date: Thu, 21 May 2026 20:40:16 +0900
X-Gm-Features: AVHnY4KDqeWgH1b717hobUKU0xoHOtcJ-628JzCiilCfBkbsFuci0Aw-f-9_VXQ
Message-ID: <CADXeF1GVtFHNZJb8xwFh6aadR=H19S+kja8rF185XB5=fg0D0Q@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/2] bpf: align syscall writeback behavior with
 caller-declared size
To: bot+bpf-ci@kernel.org
Cc: davem@davemloft.net, ast@kernel.org, andrew+netdev@lunn.ch, 
	andrii@kernel.org, daniel@iogearbox.net, eddyz87@gmail.com, 
	edumazet@google.com, kuba@kernel.org, jolsa@kernel.org, 
	john.fastabend@gmail.com, memxor@gmail.com, martin.lau@linux.dev, 
	razor@blackwall.org, pabeni@redhat.com, shuah@kernel.org, horms@kernel.org, 
	song@kernel.org, sdf@fomichev.me, yonghong.song@linux.dev, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org, maze@google.com, 
	lorenzo@google.com, martin.lau@kernel.org, clm@meta.com, 
	ihor.solodrai@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>This looks like a bug fix for an out-of-bounds write vulnerability.
>Should this include a Fixes: tag to identify which commit introduced the
>unconditional copy_to_user() calls for query.revision without checking
>the user-provided buffer size?

 > Fixes: 3fe213c040b3 ("adding ci files")

I completely missed this checkpatch comment. I will add the Fixes tag
in v2 if there is a consensus that this patch is the right approach to
resolve the issue.


On Fri, May 15, 2026 at 5:14=E2=80=AFPM <bot+bpf-ci@kernel.org> wrote:
>
> >     bpf: align syscall writeback behavior with caller-declared size
> >
> >     The bpf(cmd, attr, size) syscall copies up to 'size' bytes on input=
, but
> >     several commands write outputs back to userspace unconditionally. B=
ecause
> >     copy_to_user() does not fault on adjacent mapped memory, a short us=
erspace
> >     buffer results in out-of-bounds writes, potentially overwriting adj=
acent
> >     userspace memory.
> >
> >     Address this by introducing two policies based on field type:
> >
> >     1) Mandatory fields (original ABI): Return -EINVAL in __sys_bpf() i=
f the
> >        buffer size does not cover them. This hardens the syscall front-=
gate
> >        for the following commands:
> >        - BPF_PROG_QUERY (min size: query.prog_cnt)
> >        - BPF_PROG_TEST_RUN (min size: test.duration)
> >        - BPF_*_GET_NEXT_ID (min size: next_id)
> >        - BPF_OBJ_GET_INFO_BY_FD (min size: info.info_len)
> >        - BPF_TASK_FD_QUERY (minimum size: task_fd_query.probe_addr)
> >        - BPF_MAP_*_BATCH (min size: batch.flags)
> >
> >     2) Optional fields (later revisions): Skip writeback if the buffer =
size
> >        does not cover the field. This is applied to BPF_PROG_QUERY's
> >        'query.revision'. Older userspace passing a smaller size (e.g., =
40
> >        bytes) will have the write safely skipped. This size-gating patt=
ern
> >        mirrors the existing precedent used for 'log_true_size' (verifie=
r.c)
> >        and 'btf_log_true_size' (btf.c).
> >
> >     To support this, the user-declared 'size' is plumbed from __sys_bpf=
()
> >     through the query dispatchers (cgroup, tcx, netkit) to the underlyi=
ng
> >     writeback helpers in cgroup.c and mprog.c.
> >
> >     Cc: Maciej =C5=BBenczykowski <maze@google.com>
> >     Cc: Lorenzo Colitti <lorenzo@google.com>
> >     Signed-off-by: Yuyang Huang <yuyanghuang@google.com>
> >     Link: https://lore.kernel.org/r/CANP3RGfZTXM_u=3DE_atoomPZXutoQJ02n=
OMkCCR-YBZbOm2suWA@mail.gmail.com
>
> This looks like a bug fix for an out-of-bounds write vulnerability.
> Should this include a Fixes: tag to identify which commit introduced the
> unconditional copy_to_user() calls for query.revision without checking
> the user-provided buffer size?
>
>   Fixes: 3fe213c040b3 ("adding ci files")
>
>
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a =
bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/READM=
E.md
>
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/259059=
28331
