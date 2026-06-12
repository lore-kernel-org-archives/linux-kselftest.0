Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2BF39891D
	for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 05:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781242398; cv=none; b=fHE3PaM81/qwlKNKRjrHjnfnd1LD5WyotyUSYFgl1dX5p6rZCSbaWD4OvqUH6qfpxbgHeuIf5Pkv768U8fAsy/Y5fUPeZnvv/EuXB3FLaQOlIAgo6sAOpyjj1vpQRK7YkkS2gSrwGvaj1VOgLbYRjF7BfaHrIZp2T5X4yviYJpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781242398; c=relaxed/simple;
	bh=gyO4yHbIAMjiPtBQwTa2B2S2U6Vb6Yrl9s0Wmca/MH8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=THYu8Xjaj0HvvFOTWG/AcqdxUruzVs/m61+LlyUkQkNZLlGfg0P6LGnwbg/r5bn3Bamt1KLc84mWRzqgtb3fZm3xjt4fgi1Djtt/ZeC0yreRd3d0OkBAVz4S+NMOftn6ZyfjySdGmx7/TzGcWWGST//Ke8GR42gXMoCYxTehndM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kSYOoa8B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kSYOoa8B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73CF21F0155B
	for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 05:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781242395;
	bh=2l8kIq2/UFRCGpa+urzjDJSmWjROejf4fms+rncNuAk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kSYOoa8BE+A9f5MDgAd5MbxBI5KtkTsakU2+pbpOsTHh3gkTa0cLJRGP5Bp14eBZu
	 WtviW+bTqbdlBPX9H1vzmrWmNRM7+RGHXEwq1b2Q2DdeYoZCc0lPFcoZ9v5IHJ/iIK
	 gHgBSoD6t7R9rHxgbgQZgw03+9Tte1AtRNGhmvYKqxBZ1fhtgRIqG4KB53Da8Zv1f7
	 JFBBM7xt7XT2c/cQp5dQB/vpxm9iLumHmfOzi7QRzG0qtwch+IGbpHf4zqRHcGagpc
	 egvwXDXr6D/94toxDhlxODUqbfHdsm1IH/YgjRLFE++D2uLVtJrMIGPH4VlxQ4NH3Z
	 U6M2AeYRyt0uA==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aa5f11deb2so559207e87.3
        for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 22:33:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8CAiI2Fsxzyf7QztK55+8HqaWdjXekDawGKF+AWugGEAbQoyvS3suzpwfUcKxZQ3dtx9ss1iRJWfspIngrhRI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSyswzr7rDVH9dvK9poR8kwdNU4Qf31fe2RSZ5OzmVaU6rgqKi
	nDhuDirWzUV5BNMpTKrOwRs2OvXoWpJrORTBYQvwlV07vKVpx7Hoky5xnstH/6I55nmPrgonUIr
	KWlQRg7jsA57DAAIH+3XJUcI7gND2R8g=
X-Received: by 2002:a05:6512:2512:b0:5aa:638c:f2fa with SMTP id
 2adb3069b0e04-5ad2db1dd0bmr385219e87.2.1781242394189; Thu, 11 Jun 2026
 22:33:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611-bpf-ringbuf-callback-v1-1-c32b6cb6ce40@kernel.org> <09d6933ac4873b9888f07593530c7fba6b3e525a643b90c16b113c09617fe2e3@mail.kernel.org>
In-Reply-To: <09d6933ac4873b9888f07593530c7fba6b3e525a643b90c16b113c09617fe2e3@mail.kernel.org>
From: Tamir Duberstein <tamird@kernel.org>
Date: Thu, 11 Jun 2026 22:32:37 -0700
X-Gmail-Original-Message-ID: <CAJ-ks9nS_v2n_Z-PntomGOQz_5T50ve=xCS-qfodTUjUbmNpag@mail.gmail.com>
X-Gm-Features: AVVi8CdDPVcyF6jCJa32VX8AmiHWMiLq0f8vtmMvzZBX9WIOhtMmqLfyc_xpahw
Message-ID: <CAJ-ks9nS_v2n_Z-PntomGOQz_5T50ve=xCS-qfodTUjUbmNpag@mail.gmail.com>
Subject: Re: [PATCH] libbpf: Allow callbacks at consumption time
To: bot+bpf-ci@kernel.org
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, 
	memxor@gmail.com, martin.lau@linux.dev, song@kernel.org, 
	yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com, 
	shuah@kernel.org, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, martin.lau@kernel.org, clm@meta.com, 
	ihor.solodrai@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 10:03=E2=80=AFPM <bot+bpf-ci@kernel.org> wrote:
>
> >     libbpf: Allow callbacks at consumption time
> >
> >     Ring buffer callbacks and contexts are fixed when each ring is adde=
d to
> >     a manager. Callers that drain records into per-operation state, suc=
h as
> >     a bounded destination buffer, must therefore keep mutable dispatch =
state
> >     alive for the lifetime of the manager or rebuild it for each operat=
ion.
> >
> >     Add bounded manager and per-ring consumption APIs that take a callb=
ack
> >     and context for one operation. The supplied callback overrides the
> >     configured callback without changing it. This also allows managers =
used
> >     only through the new APIs to be created without a setup-time callba=
ck.
> >
> >     Make zero-record requests return without invoking callbacks so all
> >     bounded consumption APIs preserve their bound.
> >
> >     Signed-off-by: Tamir Duberstein <tamird@kernel.org>
>
> Part of this change looks like a bug fix.  The early return added to
> ringbuf_process_ring():
>
>         if (n =3D=3D 0)
>                 return 0;
>
> makes a request for zero records return without consuming or dispatching
> anything.  Before this, the cnt >=3D n limit was only checked after the
> sample callback ran, so an n =3D=3D 0 request still consumed and dispatch=
ed
> one record and violated the requested bound.
>
> That bound-violation behavior came in with the bounded consumption APIs
> ring_buffer__consume_n() / ring__consume_n() and the n parameter on
> ringbuf_process_ring().  Should this carry:
>
>   Fixes: 4d22ea94ea33 ("libbpf: Add ring__consume_n / ring_buffer__consum=
e_n")

Thanks. My clanker flagged the same. I will extract this fix into a
separate patch in v2.
