Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6E73314B9
	for <linux-kselftest@vger.kernel.org>; Mon,  1 Jun 2026 06:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780293865; cv=pass; b=NcVic3LxwqdPMJGThok6VYWRQsZTSi/ikYqmgeCeqSc9kZQNjZw8cJTV8qyvcQzmu8AR6swJKsyfhooe+h1INMDXuhXHrBPHtFe4NUckJOUMU2ItmW612J73GolpTHeT+y7KX5dL53DojFGJtPglgJfwSlm4Kb5nfRx6XihjMX0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780293865; c=relaxed/simple;
	bh=loicyaSIKacT3UFMUJ19/QYRzlY6aMDV2pQS+mvBMAM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lqkBZiwyED3MKDSXDjJYfUreB+dYM37FlEndJUW+uEKQzSYkP1a+UqChNXdvCUi4nD2a6M7GvwyPvEZl2VrBml6hX1yk3KcO1+PtHXSTg4ml1SEsEqRXGgK3mkCbA6NGtYVBNeX9FICKqJCvV3sOvp/He8KMQZeWQLbxi0Su+NU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pnikqe7Q; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pnikqe7Q"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-68c76fb8009so2681529a12.0
        for <linux-kselftest@vger.kernel.org>; Sun, 31 May 2026 23:04:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780293863; cv=none;
        d=google.com; s=arc-20240605;
        b=gAS1xrjaCxI9LPof2BYIxZNtb5LFMl5ZGxYoLSqDjTRbm9HQDhdJ2JgQ2EeLTgER8h
         3TH5BDllgA+XsNuk1DgRxJ5GqAp5M1Zj30epW4IRDGcVf5fPWl/1j/fu54my1CtyQFNP
         C5KsqD6EKj6YASmj/NwxD/ZO5aVYTNMPgjQHPV7U0/rmeeMnhxZIAdW+nALWxieExG2u
         J9D02k5mAAAjCxU4COpiH5yPR1oiiR6akAIjSL5x3r7hk3wWPM9gLt7R2m2kUJ10UNSs
         F591tF+8z9xyfjHxa9j2X+bkdNhTPepxMF5c4jDTpCcv7CGIMfSp+oLQegjxKQxkeE0h
         1GnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k5U4blnuS29gnJMSouEBsqgnyTt51NshtQjYFcOoY6o=;
        fh=FPUZi8QN1y/pWqcaVpq6MCB+7iL5YwqS87PO+uy7Ff0=;
        b=GfVVFW4uL7uaXVEPblisMjrLqUZQEc0FO5CptPJU2fmMT9ZZVMxTTwJslR42jJEzKr
         2UgQrNxUoztdVYKaTvqRBDIte/FPK83lEYs7hXj0tU06R58yOxvLnWs0Ph/g8MHjjVZu
         AZbAXaZ3kzxZ4aA51ObbRIA67ybnIbzeTc3Oh8goFlPJLJdPWrtjtdfSSQpu1vwHnmi8
         XbXmH5gOnEpf1iXCT5JQB3bYo0voQ/TJqvsYhyN0UAthsowTKaTP+9EBlWPgKTDANL5j
         RGfVhxgNV9ah6J05Gh1CR2PZNHUUCrn/8LsBrJH09/kdH33JMODzLQbNoCww0fh3JGQB
         hcRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780293863; x=1780898663; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k5U4blnuS29gnJMSouEBsqgnyTt51NshtQjYFcOoY6o=;
        b=pnikqe7Qq91TAn4cU9343o72h7PtT9Atxd73kFP8xjC3Ck9tZqtIrxux0NsiqQ2n9w
         45+RGhG7vyf0yQ5mBXpZNCFPlyOtKZBBBxQTz+P6jdNYWDjMgmpUNG8OJt6HVeCC9IT4
         RhstF/lC2D6tmw3qKZE6XyU/CWu71Z/0sZZvtfedz1PMWfT6OtDbQAqZp6+x9seWPqJ/
         bKJreUMSp8TZ3tMUF/T5bO6Y1zpx8nDSLIgRHUUa0HQP8DpPN3zHiOj2eaQPsj4OZRs5
         JyXLbSiT3s5RsIddCNQmrbhFcgVvbyjmvySG4zCKVRwio2mBYk7saHnY0NNnZ4xfITzQ
         3QPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780293863; x=1780898663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k5U4blnuS29gnJMSouEBsqgnyTt51NshtQjYFcOoY6o=;
        b=A57fTSa07sDnzljiglIaLcUSoq+oqgKWF3a0XRg76+6cAfs9SVinT2dWmqZYt1EMUM
         0mAXZ+t7Djh8EeqXMQySauAApd/MOvyJB8XIeDNiFB/7wbOv3BFw9y/xcjoUhGKHThVl
         71aKPBptTF4qMYsPng1vZKXByCzQcJ+nZzvNGD8tP14Etu9osJRxf/uSdVA+msnk6h5k
         SeSn/fTUuwZHl3OprGjHopTnF8/FDZzFRkJ9+1NOxpmCSh4JT+fZTJqwGbHRu2P2u0FD
         Pt5TIvtTtR76hSdDbhy/xxondHbuhiJ/auwgbF7mz5P3Mi6PBF/RvSKt2zZCyl3ZGW/8
         +/aQ==
X-Forwarded-Encrypted: i=1; AFNElJ/qe1pO0qn27Ia6ZxF8yBbnXcbcSSyJnvR0jSBqRpX2esMRULAq0OvhSIK0tWnaqDIX5va9CnUDmPtkdnc0c2A=@vger.kernel.org
X-Gm-Message-State: AOJu0YznuI9Ns7Kv8pUzkO+70Cn407ImR9pwD5lJIIQj0CunReR//iEG
	mi8xNnmaoev0+ZfK5ea7Wphvvzk6W1TYojLcJA8IlvsU0hKcYfv5KmMk08io79aDcLl4SRQxh/N
	5HhmSVM+56+FET93gJ2i/UGFcSKyEWDg=
X-Gm-Gg: Acq92OH7QWgMFPmdphZV9Pj7U5l8+nHBrhXpwqHzrlBXTTWBMXb/oCFSjDaOJy/N85+
	7VI1JzseDrUnnBw8G4nmwtK0CFao581Iysijrg9ShtfhxqcQ+0fP/mL0GErX+xvC3FAyfnn5xd0
	l0Qkwe3PreIpySfRlNSqQ6hUThp2NUPGhHnzhmXAjy2Hy4P7G6pOauA1xXoJj+JbEdqXy/g4bUi
	GZNYjWQ9XqZ68rppvYQKNSdgfolvQb6PlLjHpmFeoL9zmcJx8vgnm/eUiN2O9tVsNF6h4M2SNjn
	NbTePxw4maNqO3/0cA4=
X-Received: by 2002:a05:6402:4510:b0:687:74de:985b with SMTP id
 4fb4d7f45d1cf-68c8c561c0fmr4537725a12.14.1780293863001; Sun, 31 May 2026
 23:04:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528062155.3988156-1-hataegu0826@gmail.com> <178027560516.3443781.11705215616764330591.git-patchwork-notify@kernel.org>
In-Reply-To: <178027560516.3443781.11705215616764330591.git-patchwork-notify@kernel.org>
From: =?UTF-8?B?7ZWY7YOc6rWs?= <hataegu0826@gmail.com>
Date: Mon, 1 Jun 2026 15:04:09 +0900
X-Gm-Features: AVHnY4LCt-nmaivQzYgUXJGt-M1rknYJfRCxdAzPDptWZgfPUztbYR3IA_6FPwE
Message-ID: <CAPa51z=boV2KH3Xkh8y0jrcENA+ZeS+5HsO=Pxdb7V2HFCVbeA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3] bpf: reject overlarge global subprog argument sizes
To: patchwork-bot+netdevbpf@kernel.org
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	yonghong.song@linux.dev, eddyz87@gmail.com, memxor@gmail.com, 
	shuah@kernel.org, john.fastabend@gmail.com, jolsa@kernel.org, 
	yatsenko@meta.com, song@kernel.org, puranjay@kernel.org, emil@etsalapatis.com, 
	martin.lau@linux.dev, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Pavan, that answers my question.

I will drop this as a security issue and will not pursue the defensive
data-path checks for bnxt_en.
Thanks for clarifying the HW completion contract.

Regards,
Taegu

2026=EB=85=84 6=EC=9B=94 1=EC=9D=BC (=EC=9B=94) =EC=98=A4=EC=A0=84 10:00, <=
patchwork-bot+netdevbpf@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Hello:
>
> This patch was applied to bpf/bpf-next.git (master)
> by Alexei Starovoitov <ast@kernel.org>:
>
> On Thu, 28 May 2026 15:21:55 +0900 you wrote:
> > Global subprogram argument checking derives generic pointer sizes from =
BTF
> > and passes the resolved size to check_mem_reg() as a u32. The access-si=
ze
> > validation path then uses a signed int, and stack pointers negate the v=
alue
> > before calling check_helper_mem_access().
> >
> > This creates a wrap when BTF describes a pointee size larger than S32_M=
AX.
> > For example, a global subprogram argument of type:
> >
> > [...]
>
> Here is the summary with links:
>   - [bpf-next,v3] bpf: reject overlarge global subprog argument sizes
>     https://git.kernel.org/bpf/bpf-next/c/de36adca6346
>
> You are awesome, thank you!
> --
> Deet-doot-dot, I am a bot.
> https://korg.docs.kernel.org/patchwork/pwbot.html
>
>
