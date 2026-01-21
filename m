Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67CC3ACEEC
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 17:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769016388; cv=pass; b=upuWdlfXWrd1/nz+JdKcqTq0KJ3VigQbUeOQEN4F72IjK0HtfrIBFH+aFAJRxSc5Z3tu6WDyZhLW3aYJfZaCkzzJbO7XdJgBVgJASZn5qwxegEmijsWF/iKMSuelV9/lu0Sp87Oqht+urIl4YwASJxDPWZjR2lzjdQy1adcF/zE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769016388; c=relaxed/simple;
	bh=s6nK+J8VoFgC7sF4ENH8AjRgotLPT+tJYq56JSxtM+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I7q6L8fwjIzM6XZ1oaHptxh6+ArTSJMnh/DWCemkSi3en9xsB4WjGg4JNLGdjnEhNr4Umgl2saCO7FnAdYXA2+J+lwPb0rU+rRJpMU2UKd2p9Qe2/Pac45WVt8gnl2fRZ6WJBSaZ6wDlj783gp49jv+8zNpl3yYRP8SwrNz0Vvs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MNaUo9xp; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MNaUo9xp"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-435a517be33so52149f8f.0
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 09:26:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769016385; cv=none;
        d=google.com; s=arc-20240605;
        b=XO3cuVA0n/vU/D8DhBTIBqOUhELRZGj+It2/BMrlT78foc0Afe5ouZ2KJA13JDPRic
         yOSVZ+9ywpn4wnOwCQYlzFzcSYkTENU0XLtAIbyAhR9rdcc5Bn1zDZ4wL0th1dz70MVO
         bOhYlPLTLns5xCUMQQxOZ+qbRy7fVcJyOSbXpC05SD3vr1X31+NCWXN3/ycH7DhX4TJO
         mW6CW+u+0yihUhg6kjv6IB/xprLT8OED12x9hBoyAWGyIJEhblZtlrIHqzFu6+zZi2ek
         4R4nO/bBKFJ8730klsaJaONhVVP14qKM61H0wEGmEsZbNAyZAQsi/0CUUBsoneP3dWDr
         Pf9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jMaTi4cf3sv6GoY2q4sRfmpeePaW8ECxRIDqOj4Udtc=;
        fh=KI5xae+ukW42uao4RQcEtpWTCf6zqWeKY6GhKIZyf3s=;
        b=ai/UEnLxS6+qlN9vZU464CdHaQOB0ZBdFrX3VBv8+CcrBG9ibvTKI9IbuiW23g+FMu
         KOCG8wyMUsTwCmaAKneiqEp8g/fEmy+a6f9qoBZEg/XCZ2B7fdgTS71jaOeNmMl5KKPg
         7QZATD8VDumUkFh9z0TspsqnoXOBMGQL8PsW2iOGo/UOPxgO5LaAFKKhwPpYDl3QhaLa
         4jPTS+FgLOa/PLMW4HkrT++WTl47Hn7xB0VZSnQic78bu0HDGm5Nwh6WoKZ1ExLgUwV+
         6lF7qQ2dKhSUIVbEZ10CLZ5WyltRG0eEDJDvqNHpiQEqBujQYg1t32nYDkd8e4tafQkx
         hegA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769016385; x=1769621185; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jMaTi4cf3sv6GoY2q4sRfmpeePaW8ECxRIDqOj4Udtc=;
        b=MNaUo9xpG61R37mAJnvytH3YCDQgYASCrtkekJP8xM+rXyWZAqsuiw4SgAc88BybvP
         lpUt5ZOjFP22eLAsyuBPBOUoNPx8RG+lXPq4ruD4xcj6Be3LCcsTSzQeouIPOht3jbnb
         1p43PqbcHev46EBmgCIB1EzAwDSiUJrbQZV2DVa7bdpMbI/UgJWLY4RwskiBeAVNCNJH
         FdJuB4Wh53bt3ZZeUOH904LEXrh0TjeBoxvVYMMRkbDKroDGqg5qaEx0Qu06AiNlj9rC
         8Af06Jkw/hYdBYQf5PV2+cWiYvuuCr6op4xjRok97upm+Puj826rX0hP0lpHjCe8SLTp
         +NoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769016385; x=1769621185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jMaTi4cf3sv6GoY2q4sRfmpeePaW8ECxRIDqOj4Udtc=;
        b=HtD8zWuiMMLT7Ufq8RQ5Xj30skbsjSO9YPal1ppJX7kepORjZKwDSU9pVniWt/ytpx
         uehtYCO4S1ER/7/b6KJ6WA/wSHvLxIqHI5RjbckmKSQwmuPXjNwyX5c0txXmgSVILq3O
         I9+vwDIP2Zm8MFeC4459ZTPOHJ5l3+40Rf6eTKMOqDv4kK8MP5mppnmtp5LWu5ppXSP2
         LDCeCMJUIgxXRDcWC6/PQNM4I7V70yZ2cas9eiXhpsRJxPfRVpj1HMBx9NgnyAsyZzly
         M8CIdZvDLa9IfvfYy0WShUvnjyIu5P0MxMm1F0YdV5/oKL/PT5dcqjjzV6XzUecXh3hv
         MJHg==
X-Forwarded-Encrypted: i=1; AJvYcCWSusoV5bHio/5xx0BUfyk8ceQWCQl4Y/9p0LP9iteM1PQgsjZsJY2/4gr31tPGUkdPgE7UAut+s5Hqa+Ipg2A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwF2LGGF4iVpQYYSqrqzxMx61x8xHreoen5Ll2q3Jhp5t8Boc/E
	MiIGAqMiV4ErETbfLdoV6dDwJ704N6aIuCx8//uYKqnBBvLzQ1APgGZyNf9K8Nk1czdXFAvp4cN
	j+lawE+MWeOuhXOM5FC1szZK1IBY0bmc=
X-Gm-Gg: AZuq6aKpTYhTFZzvHOGUdlflJEis//LdGICc6Jur1KIISYY2Ya1oT1c7G8fQjsexyrL
	9gPwH+sTdWni1cK3LI0WVXkuwH8LDMuI5drQLGfvUj3euOjPnP8iapplCwVZ/dqxCj7QlJlgU27
	Z4CyiTHTtY8uivCQLE9J2sh0up71j+tboWbhapU0/Gc8U6QIW3b/BLhL0Bx1fyF22bpYf1IVChm
	viB3XvMT2hrLS1P5g4lEBGy7NBPb6hdCc/uU8HqYlCFSqqHYDdki8nwL8Nz4cjHj+yof8p8AQAE
	7TpGW9yRTr1Q6VPacnOljYDPmxrhU+UXZVSDMfLbWetPVi4x9uuglN0QefhKYDLCO8tihQ==
X-Received: by 2002:a05:6000:2502:b0:430:f58d:40da with SMTP id
 ffacd0b85a97d-4356a02491emr26853046f8f.10.1769016385090; Wed, 21 Jan 2026
 09:26:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121-bpftool-tests-v2-0-64edb47e91ae@bootlin.com> <20260121-bpftool-tests-v2-1-64edb47e91ae@bootlin.com>
In-Reply-To: <20260121-bpftool-tests-v2-1-64edb47e91ae@bootlin.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 21 Jan 2026 09:26:12 -0800
X-Gm-Features: AZwV_QinuMDi78LsKHGOUoOqDGqF2DuFQVsGJc44x21qk4t4r9EpKfs6RWIXC7I
Message-ID: <CAADnVQK0kxfjkORv8=a8W8peiBTtpzB91FCh=6X+N0iA+OCzJA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/4] selftests/bpf: reorder test_progs sources alphabetically
To: =?UTF-8?Q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
Cc: Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>, Quentin Monnet <qmo@kernel.org>, 
	ebpf@linuxfoundation.org, Bastien Curutchet <bastien.curutchet@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, LKML <linux-kernel@vger.kernel.org>, 
	bpf <bpf@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 7:18=E2=80=AFAM Alexis Lothor=C3=A9 (eBPF Foundatio=
n)
<alexis.lothore@bootlin.com> wrote:
>
> Update test_progs sources listing to make those sorted alphabetically
...

> -TRUNNER_EXTRA_SOURCES :=3D test_progs.c          \
> -                        cgroup_helpers.c       \
> -                        trace_helpers.c        \
> -                        network_helpers.c      \
> -                        testing_helpers.c      \
> -                        btf_helpers.c          \
> -                        cap_helpers.c          \
> -                        unpriv_helpers.c       \
> -                        netlink_helpers.c      \
> -                        jit_disasm_helpers.c   \
> -                        io_helpers.c           \
> -                        test_loader.c          \
> -                        xsk.c                  \
> -                        disasm.c               \
> -                        disasm_helpers.c       \
> -                        json_writer.c          \
> +TRUNNER_EXTRA_SOURCES :=3D btf_helpers.c                 \
> +                        cap_helpers.c                  \
> +                        cgroup_helpers.c               \


no need. Even if we sort it now it will not stick.
Files might get renamed, new files added to the end, etc.
Just add whatever you need to the end.

Also see that there is a merge conflict. Pls respin.
