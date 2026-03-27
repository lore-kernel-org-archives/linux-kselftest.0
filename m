Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA11303CAE
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 15:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774624897; cv=pass; b=Wk6bfMzbgJJnOXj0iFFFKBLN7v4iAAXhajbnCgoKOsvSxHHIZrYcfAN+on2e0gjqXZjD+Usw5hzyiG9wNhi2uWNSP+hQBhFCk4LoYvjztw1D+yJhxgm9m1AwLroJOZ8AiCgkQ2V575Md10fSi6n7YHELKSCNxEXwQl+QYrvAI4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774624897; c=relaxed/simple;
	bh=i5yswZsGz0lDODJAAupC7LNuhHMMKdCTbGNRLBYDSls=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hRNnmKkAGFb0kApw1ir98f5tICkA5BYwhYXWt3z0vypUs3Mzun0OzKjckxx2GZZeMhgXv9vbFP0rtZIURv+eeIKJao2w/v6WXRQW8JJJS6DSWmteRKl/mYoYMWsBc5vfYQJq6uzAdKc2Xpqr4E/2jD/QjkZ319YAlArjeii1MHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PsaTZr72; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PsaTZr72"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439d8df7620so1608523f8f.0
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 08:21:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774624894; cv=none;
        d=google.com; s=arc-20240605;
        b=FJwEsl7LlbQR1D1/B93dL0QJxUNqHE3q+L1ymPCyGLG/Lt82hyeRICG4sEnbq0raBt
         4vArbE1KbFGlbNaBJfIbwAOlG051zUxPFEg8dhZVWyn7nsMCtGDbN7ip38JBCHdMCsHe
         vRpTQ6qezMIzaXH7565fectaySFiBb382YkdeAFS91aVb+wulyZpcmAWV/U4DlkL4F5Y
         klZv1tMdybyLBoRpW1jFK6cV15WZUUj218dj9wsj3VML1TUk38yF3q29CJwjEGMRACHr
         enP/30s5w756eAqXnE/Al7igPaypyhhlCNWED9VKFZpf/erfm3hr7LTpzw3YiVVaVkA9
         4Orw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i5yswZsGz0lDODJAAupC7LNuhHMMKdCTbGNRLBYDSls=;
        fh=5cr2CcWgEoPvuOCwpHv6iMDKVHV9YN+5/VppP/rmTo8=;
        b=RhWH6D1oCDgOPM0ZciPWvufYbmWBofl0DVVXnnG4N88YIRbkLH7H3QQ5MNXjNB9V17
         vtd2fRpLFva523yKXpDp28yeR1tiGU2Nk5gzF0+YvZOrNXQYHGV2v3t5rttmWNG693Ub
         p5VmgCgmrjajTO5W/r9aUPXPDrPqx6AEtQHos1Jx/3mDuPH1BQKGLwf4q/dvyQiorUAN
         UQLLt3NvEFkG04KdTR0chLA/s5AnAt+10f8SQ4XkFeK94qpgKlFRqEvA+JH0RK7RsvKC
         Sfp/0NL+lCwnuKtSCm8OTeo2XXVEhD+9v8YpofvD2GVRwKfk+0WCrZKrYS3bdXQ/zj5h
         x+EQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774624894; x=1775229694; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i5yswZsGz0lDODJAAupC7LNuhHMMKdCTbGNRLBYDSls=;
        b=PsaTZr72jqfnIg8r1p3r6lBVMqlSgDOW9yo6E9KM0XWSeaTZUUkVmcFVCAmNFf6+h4
         VuVslTew26UbMWj4oK/CLizA7qzwg2s3vnieR7IHbQtg9E1nGLw1xkMli2GXfuIuKcF6
         erdSZ6WyHv9I6icQ2bJC/w28+u8leACsp7gF+sOSczEdga7+/lD9lAvZudShX/y4kH3x
         EFBh6wzAApA5jIgUMA3o3/IkfMILTVuggKyd+hgO99yhUNF85DEQpLfnp2cKCpUi3kq/
         SxCPpszcKIM+5Et2j2aARI6SkJfWyMR0i8/892j/0yAJE91MU4PV8TNFRqLHGjUUd+xD
         409Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774624894; x=1775229694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i5yswZsGz0lDODJAAupC7LNuhHMMKdCTbGNRLBYDSls=;
        b=K9DhI44qQZaq7lITGFU6Faup4/isS6f+QIp4cSQ/YC9TT1OzrTZennZr5OFi0IC2Ws
         k0bP8zmqCN3q1wh43er1uaHn2hgwX4eeTbjS6bEKyaIWaHJGCNfsMkUhNb5ElyojXac1
         ugkZSobw70RdDLpmTS/i00xV/lV/S9p53KUQ1LP7r5G49d56iC5SO2pKggHr6IgBi0qT
         eYtY9yInejRKGd3+UbakeusvR+YgEYQzuWwFry1ZqpyL8QvciZIWWZMphP5QZ4nj9P6/
         3RNY51SuMEa3/d93yrxEFoO5It/gRQJDhjsS/uuOobFWd8NmxXJPq8F5S5NQvN1C8KwX
         YFXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdMvM+Z0VXI4+Qxv14BXfTDgkiSyA0p1MGY6nMjt6nQq6dbCb8+XPwByZVbIFZW5lvf5SNweK7X4U8SxZSl3w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyStJBSpBUbdkdDSI5Qnbreo2nui+VjHbnlerYMamZhiiKadCIw
	bAn985FNSBl0zkKkk+W5ll2cntA3xyPcASbdrAxkgOZpkKco/vjZF9ceEX+U7CjhqMmtQ5MiZr3
	D4EFJQS70UrhM40anerhC/nhPKhPaJDs=
X-Gm-Gg: ATEYQzx7xo5CYsnHw94JX+ylNzugCeSamDvhnDAg9ZWOsiK6TDFshUqA/1rQ+j0ZfCa
	AVfu+ONE/g+VsxWV/5h/swDlUelGuwqrr9Ij4MeG0ps+ubTDMPUYdHOFpef0KO5dx0dDAq+a3lL
	9nedkTt2/KfMxo03aG4rvfxQlwJh7ywupX+BPmPXqCu4StXE3n8YaD46tQ7qFoMV16zgOQ1WNOu
	VobDM7SUZIo6EphF/5jy2G40hDn/Fs49jVnLMte4AaLZDMTSkXdMVLSYM1QJCxmmCvMbDhYyrL6
	7s8l5OevvsokzJ2y44c9qrmekekM5J8G+3yAztnxRNhqEzO/URoaIEI3088s3n3ymMIxFzgoOHX
	uk6OR3iGQFbpl31F7plyyUZELPQ==
X-Received: by 2002:a05:6000:2c0e:b0:43b:4921:8744 with SMTP id
 ffacd0b85a97d-43b9e9fad7dmr4962672f8f.22.1774624893834; Fri, 27 Mar 2026
 08:21:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327141616.1961457-1-hayatake396@gmail.com>
 <20260327141616.1961457-2-hayatake396@gmail.com> <CAADnVQLh76CWYJCJXgOst43FcJOrPP2Y0wcwGPX71QqmiD+7pA@mail.gmail.com>
 <CADFiAcLvdjE7zwqf-hpH01jnbxtnWQNoj4+zBwK0+RU80-k9bg@mail.gmail.com>
In-Reply-To: <CADFiAcLvdjE7zwqf-hpH01jnbxtnWQNoj4+zBwK0+RU80-k9bg@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 27 Mar 2026 08:21:22 -0700
X-Gm-Features: AQROBzCwdG0uvO4VdHD9uBtUZNt_FA3sFuEBsC99hUhNBVt5CqpuCorhWeJ6Ptg
Message-ID: <CAADnVQLR6Y94wKo1G_4w0-xTPdR8ws38oGu3xfHOXxNKcqjyWA@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/2] bpf, x86: patch tail-call fentry slot on
 non-IBT JITs
To: Takeru Hayasaka <hayatake396@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, bpf <bpf@vger.kernel.org>, X86 ML <x86@kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2026 at 8:12=E2=80=AFAM Takeru Hayasaka <hayatake396@gmail.=
com> wrote:
>
> Hi Alexei
>
> Thanks, and Sorry, I sent an older changelog from while I was still
> iterating on this, and it described the issue incorrectly.
>
> My changelog made this sound like an IBT/non-IBT-specific issue, but
> that was wrong. On current kernels, fentry on tail-called programs is
> not supported in either case. Only the regular fentry patch site is
> patched; there is no tail-call landing patching in either case, so
> disabling IBT does not make it work.
>
> What this series was trying to do was add support for fentry on
> tail-called x86 programs. The non-IBT part was only about a bug in my
> initial implementation of that support, not the underlying motivation.
>
> The motivation is observability of existing tailcall-heavy BPF/XDP
> programs, where tail-called leaf programs are currently a blind spot for
> fentry-based debugging.

I get that, but I'd rather not open this can of worms.
We had enough headaches when tailcalls, fentry, subprogs are combined.
Like this set:
https://lore.kernel.org/all/20230912150442.2009-1-hffilwlqm@gmail.com/
and the followups.
