Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B152C0F69
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Mar 2026 02:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773456150; cv=pass; b=lTjiHCQYCZ0RYwUaJpP2yd4kr8fmL0FGKPu+REWs4/MPNRIm1dVn3gYqvVo46HOWZm/dx/4/UocJ5cang4TAv3tiZWyiWao6Yo+7jOIttUUVxpeEzPwOk6960IP9WJoM5vj33BDg44xI0N2dFUVmISDTbd8g6y3Yg6TIRjiAQXA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773456150; c=relaxed/simple;
	bh=5efamlu/6h5TA6qznlB6+GKsMaEIxOQX+VH0GW13OvE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uMfk9MXD7iLiKp5l7sgLvr1vBQc6wvRcicbcuLhtzqk9cTBcFwaOWjCd4ouaQ0tpGHz7qvRaZaFWKvHfR88YHGv8LyK+htriM0NPOjgajvAy1PHwgFSXz7DlF/wNvcXUZ6noXQd6rirOM91Fq2Zhe1rGmJrF0hT0/8ePVCoQLuQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dBDdoy8q; arc=pass smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dBDdoy8q"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48540d21f7dso32375265e9.0
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 19:42:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773456147; cv=none;
        d=google.com; s=arc-20240605;
        b=bRNFZv1ISmEHpSY57QPI6HxU02rehgtnUXkc1DxPh3cO6kmQCQPSvVazQ1ZhwQz5QK
         rkrgpvVZuk4Cd7PsnYExUHwTS39wEA1+Gbu1egKpcC1YHaIdSlgFAGVeDAvKIlCPlBQx
         bW1uxqtUp4u2Xret+bRiOhJYjkY2mhAv5L3LWw7CwCA7bY+yencPOknV+a3FypUhdI7H
         CEopgEIXR4PLNcvc3CZr6Bt5IprDLZdWuTPE9dPOZZY7aDBvr3h4tnXHk2fNt724H8LI
         PmyePikLDPp6eqt9WjRIgsIn1JGGPCu8F+Xf7TpdYIaBvXuMIYY9Eb7OnuU9qC+q5t3L
         5Q7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oJ/4Kkexba+G7whq1UxwvFb4fZjvu7eByDNhfOE+P3I=;
        fh=u4i4Hc0yKBJ+UbqQ3tBIocYIQQBMqDP+oZTvAs/xM8o=;
        b=a8MZkFKEHiNKbarprrBdJol1wNXcQCK85lN0MnyZdlRPkmxyRcOMNTVkj5i+BcVoJO
         Z9OImjZs3sZhAmYtzNPzcGTsTl7HdgpMTOWnWiRx/8l6pbKKttOs9Y0FLxOBPTFjRNy7
         YUXQs2K9tHo53wXtRHFDfAuDNywtdwh7vT+FPxHU7jM3KT6fxrYmIKfduFFHZa+ZjcOD
         XAmrvblzYH8ar/847Dimewa3pn6KVyvnYORfE3KN6IQ2cvFr2gsYwQoBT48tUFebgdda
         yDZT3WfKtPQ0BPRtPPLkYyYa3tj76C4XHXeCyckX0IAaov69ELkCFyT1on0oMKXob5E5
         Ypwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773456147; x=1774060947; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oJ/4Kkexba+G7whq1UxwvFb4fZjvu7eByDNhfOE+P3I=;
        b=dBDdoy8q0iJvGD9DRshvqHzTKrCkIeDLjXaA0Nj/NLEXkjC4nOdWR0BRHIIV8mbth7
         NLt65FIhJ7aTQRbaAqhCa1wTrGefv77M2N4dTAATfvdLUPggaRbqavOG2FOrJXQIBqiG
         +442WlXBqZv3TCIKerGiyT0MkAwCp70g53NX23vjoXb6F4lMef0IRNmuEr0pp5r5dCHN
         tpgabsWd3UB6I5JxI3SJqk8bo37Z3kV7qd2keZRAzfZitds4geOTssjWy6DFPTDSgma1
         yVI3vRBIADufOx0RsywAWH6jUiGoPhpB+L1q47dZ6ecYwNEjc7FmdzlW/q1PZ4QBwR5Y
         H6KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773456147; x=1774060947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oJ/4Kkexba+G7whq1UxwvFb4fZjvu7eByDNhfOE+P3I=;
        b=mc7W95eNVAwPTlGZ/lBKzLHCzQxMRW2JzouKFiaHyBocUaw1zx6BtzCa/rWbITEt8L
         fupzHBT6h2GKvXiGgvr7NBv7VpFNzVCKhdTIFUbTj8m2MiisLqv0SV2uYj8a5hgMQSiF
         Gv/Enxaj/D50WyBTk+KrZYUCbjyzjjNvMAmCr+LTvlw1wz7hht58R7jGlZPzMsapFzxx
         4FT/TMnvvIf9n/E8bLSA0fVgDUB1rcjdItC0bJPvfIosjSYow1JKGdtJVkHGvXMqI719
         vR1GIqP7ojAA0WS/Mgpe3OE+orVuN0cj6cDUK8eUJycqCQQrKbgf/1zoo/ehV8cMtfSj
         sorw==
X-Forwarded-Encrypted: i=1; AJvYcCW2aR0FT3KgEdneLvXWSzYkQg+dK88AkG9C08kN8PoWUl1E64YLHWs71wJ6RQSnQOdIf23Od2unupYEsDjdNiE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7LfEeQ/lJvyrZoO1k4/ZzJM7rP2drWD/cWiUkEop8IoZrXKhn
	zfxsjzbMX6dkfVz1nu7ET7Rhc6YYTxNL1UpwH9PsUO0NGiaPlxKg1xSECkOoPPlNGiKWXMUSlOT
	tFSAwS80RftQUAObBKfds3quC92WX2W8=
X-Gm-Gg: ATEYQzyrA57o4ZaSnqrbZlKSnq1FaKGepHv2YIwmsPuoV/J+JXVbG3HhtjrJFzzn5Nx
	fD1qvvjqiklfwu6YCm+2yDGR8WjeefJRAdmDBKKUWLHGYMgR0bNaaWDvQIYxe7hNW5GTDZwEM3r
	o5yXUZAlNc9+QJXXStBlPPCZwqato9hp8MkTb5asDfNhnDW331DHuHMuvmmCD5yzTqE6+3Q7E0e
	93CGqjETJSQoIfsSAroNWcYFQobCrMYoscNXChj4hi3Uy244cS+nble9MlZnyc8irv0XN3z/Ao6
	nhiSIVXZvv8kt52mJh628fnWYS4/2qcAYVBgCVverv/UiYT1VV+j+YOVhSc6EVZzX3BDPiCq3FS
	rwg==
X-Received: by 2002:a05:600c:1d1a:b0:485:3d00:efd with SMTP id
 5b1f17b1804b1-485566cfacbmr93486995e9.7.1773456146954; Fri, 13 Mar 2026
 19:42:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313130220.18590-3-slava.imameev@crowdstrike.com> <4955a2c6a7fff7f4e383149e3b699a2af5eab965e414f3f19443b1caa97ba53e@mail.kernel.org>
In-Reply-To: <4955a2c6a7fff7f4e383149e3b699a2af5eab965e414f3f19443b1caa97ba53e@mail.kernel.org>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 13 Mar 2026 19:42:16 -0700
X-Gm-Features: AaiRm52oCGV0a1Sapwhi7UF0cUrBG8nmXyaBC9dXPLJgEdUbmwHD1ZVrTgnP0U8
Message-ID: <CAADnVQKcutn9QO4UjfcnPw+Tnv2pmHavXCa-BC083rrgP8w_ng@mail.gmail.com>
Subject: Re: [PATCH bpf-next v5 2/2] selftests/bpf: Add trampolines single and
 multi-level pointer params test coverage
To: bot+bpf-ci@kernel.org
Cc: Slava Imameev <slava.imameev@crowdstrike.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	bpf <bpf@vger.kernel.org>, Network Development <netdev@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, 
	DL Linux Open Source Team <linux-open-source@crowdstrike.com>, 
	Martin KaFai Lau <martin.lau@kernel.org>, Chris Mason <clm@meta.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 6:55=E2=80=AFAM <bot+bpf-ci@kernel.org> wrote:
>
> > diff --git a/tools/testing/selftests/bpf/progs/verifier_ctx_ptr_param.c=
 b/tools/testing/selftests/bpf/progs/verifier_ctx_ptr_param.c
> > new file mode 100644
> > index 000000000000..b507dc850543
> > --- /dev/null
> > +++ b/tools/testing/selftests/bpf/progs/verifier_ctx_ptr_param.c
>
> [ ... ]
>
> > +SEC("fentry/bpf_fentry_test_ppfile")
> > +__description("fentry/struct file***: struct file *** inferred as scal=
ar")
>
> The description says "struct file ***" (triple pointer), but
> bpf_fentry_test_ppfile() takes a struct file ** (double pointer):
>
> net/bpf/test_run.c:
>     noinline void bpf_fentry_test_ppfile(struct file **ppf)
>
> Should the description be
> "fentry/struct file**: struct file ** inferred as scalar" instead?

Pls don't ignore bot reviews...
Do you agree or not?
