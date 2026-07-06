Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFC83F9F48
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Jul 2026 16:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783356487; cv=pass; b=GWoN0krsHo8k2c6YPqspp8a3kdswtpU1BVY907rrn94HyGn/Zaet8WYQLUTioHYc8hcfMRTd/NJWuJSIortyJfeWOPKdVasXKcIwFCaW+NRTWZwMYGCqPmcE2toF/zEvoRDOrcEzGfKojkSBE2HI5U2To15OhH6SLpuWqd2qZxY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783356487; c=relaxed/simple;
	bh=4PHgPVZZ8sj1dNJeoG46xQkWSVN7vyFHtfclac+X7d8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LzGKe9MjhKwO5qPqadMCNjN0J9jmcCd+Lmog7Gt5JtEw+N/gC3inknxH9J0CIrq2NFv+taXqDLiyaRKDARgZx9R2f5mQeQEoBtIUxBWBo10cex/gP2ipUkOp9p9EcorESEHxPCpQ0wmnRMjDyUaIyeZLqxV0MT4Z2mbfEZyf1M8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QRs9Isus; arc=pass smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QRs9Isus"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-4877a7b451dso2096683b6e.0
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Jul 2026 09:48:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783356485; cv=none;
        d=google.com; s=arc-20260327;
        b=leNkvIXn+FhsdZLbuuV2MWKbkNvNISi19rnuqJgy2Dt5nSwZRke2cTjA8Xvii0aMXp
         W7DLrY1xM9ntTrI6onhb1GgdQiOoM3mQk7fyInMm8LBDGbXdsRl1HRoq85N9LDPx5/2L
         gcAsKaqnaK8qvl/hDUJ+XPLNZQ8j21JtVnXGFopc4lAJVf7aY4SBOazjwRSElNpDcjvW
         RMybsSzR6IuItzxe24eqYLAaxKX+67OPdgm+OYWq0FDq4Yi+aJ8KdumG5LTILdhP2nHA
         qjdTURWPg78hS1FNRnm0zrNSnsMbA57ZtjQHBYU56+CIdgx2qQXsX52PmASXNmT+f0cZ
         KkOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zarcUzp/fr15vy/Sk3GURs8seOzb+QEYuzaIJK/NbMg=;
        fh=Qf30w0STVsOAgeO+Tmv5x6FEAnGxKjBs734k1VOwjJU=;
        b=SLKgnOWMBmpKQZsRslley+qXXzVlAHG0/7n23GDdhLtkGP7UhRqrBCmSpS0tD7L2bH
         3fwukcdPnb0Tkgm10F4Bru3XMpeJNBnXdE77KXKkQMtEDFdKGAeYT5lWlW5KQuU6T5Q7
         L3zXJBLTBJDRKG1aRs3qG9i1Ylu7JH/zCTFSJ7+k4iY0cXP+SxBs0ig93ElnL3a0L60i
         Tgquzv+eY0Bu/DYNa5dhjnhFkTjbz4oKvEqAQxx3mGh2VL5dEA5Kh3UxV/5OhJrgkagW
         397NLQWcMuNoq0xUrpLUKso+IgG3yb9/eM2/f9ApEiZS/FKTi10lpneyQ9mNYs00ecmZ
         P0nw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783356485; x=1783961285; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zarcUzp/fr15vy/Sk3GURs8seOzb+QEYuzaIJK/NbMg=;
        b=QRs9IsusX5DhA8Fd92WNEEu0twzkgeu7adQ4L0B48QaxF5lhvnETBtPKGecRnsD26P
         BpcR+Pm21HPu01zaJmapxUjXUAo3obsi3sTKTdTo8YiICcNyGWKSN4aixwe07otdh30D
         ZkPK+gJ12HwCZDJ3Ke5gtu6eFhnkln4t0IeszGtowVMM9daifpVNZ0dBkatP0cU35sit
         vcIprt9D4S4fx8Zk40MVGZEJRr8vw3t3quQDn+8vNx7EMGI6WiYPOJeXUHl40+1qGo8M
         LVKlQxvnn8ewtU3LU2iXfIfqKOyQ3rmLo9jYBTUlZ7W/Kys2BdtdwTkyOIiQzNnpjn5N
         2xAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783356485; x=1783961285;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zarcUzp/fr15vy/Sk3GURs8seOzb+QEYuzaIJK/NbMg=;
        b=HfZW9+vVKk43MJk2jneiTOTfaCgc0Q4DmRB6eMO0rMzG+mGX7dfUySjRqPhIzpmh4v
         PnzrY2OsRQRFihDxe+7uReSc2gMejK0OULLQmNpyz3Zg02GnS3309Jn++XmFIbhMb6rL
         G2D2MEr51NQN4uPJn1Jo0FJZMM9D3X9b9Tx7ahndDjWRtJC++KRbz0bAt/PYHqZS0rUI
         y9/rs1lMok7xZtP6HozQN81j5biXAD2iPKWtr/AZ5OT+zqHv3iLKar47Z3f7OFi4++gX
         mdEQS/EdfP40k+UpYKQ4ytpScvlHoNKyp2uTDo8Lp8u0w4vwWFt/1oOwHjOmnbKoNkgx
         b81A==
X-Forwarded-Encrypted: i=1; AFNElJ/kND0kok1Sm7MVF0bEJCVDTF2g7JT1giFSXSK1hJMwxoLf7P0sMudTCXNgZxmJDp4R0kPYDjiXVLL0/QNVjis=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTXE0lgYF7sTX00Solw8q7n980A9uqOPdvzJxM3zIYQgHVBZlf
	ktMNYgOSqezhxO6DEtTdA73dV9CBc09McdJcJJErj/qE3q/kNGXehhpBcEXlU/1KLvgAeSS0VhG
	giyv1iNIG+SHIvkd62ASd5/luWU2NkEw=
X-Gm-Gg: AfdE7ckVrcZrgC6hd3zIULgfwHeu4TFU3qYuuINfnHSSxjE4TfS2Sh5Ixi9hgPGwXq7
	HAvPAEsPtgD0GwCLtNtCHQEWbtBiyaQMhFn8nbEYsFXfz9S4ccbDIBQ02/AxMHY5NG3m72ED5ev
	A2fiTlczrmG7FGx4UBeonp9Wp7cSYQ64zPqQIqyQS0uAVD+W0sWaOqwIZWC+8kEcugnMN3Ngfkm
	Z0d+311QjoFYhtaPeRyNTiN0oV3bz+VtUMzPEVuoNKkJnwhFY43UMHirWkw5dQPNiO5MA==
X-Received: by 2002:a05:6808:3986:b0:497:df42:1df4 with SMTP id
 5614622812f47-49fdb9341bemr1075973b6e.9.1783356484621; Mon, 06 Jul 2026
 09:48:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260704-kochkunst-hauswand-blass-7226e9443a9f@brauner>
 <20260704211409.1978485-1-farid.m.zakaria@gmail.com> <20260706-uhren-raubbau-sinnkrise-e40a8337414b@brauner>
In-Reply-To: <20260706-uhren-raubbau-sinnkrise-e40a8337414b@brauner>
From: Farid Zakaria <farid.m.zakaria@gmail.com>
Date: Mon, 6 Jul 2026 09:47:53 -0700
X-Gm-Features: AVVi8CezoZXmxdx0EVJgscHRgUSuI56V3d2lgnD3ARstqF0mvBDKn_k51tgqOEc
Message-ID: <CACCo2jm5=xrQNfak=TdO=2oh0DC5pe+atj=UfuTa8Y9s8GVkqg@mail.gmail.com>
Subject: Re: [RFC PATCH] fs: binfmt_misc: introduce eBPF-based matching and
 interpreter selection
To: Christian Brauner <brauner@kernel.org>
Cc: david.laight.linux@gmail.com, jack@suse.cz, jannh@google.com, 
	kees@kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, mail@johnericson.me, 
	shuah@kernel.org, viro@zeniv.linux.org.uk, Gemini <assistant@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 9:01=E2=80=AFAM Christian Brauner <brauner@kernel.or=
g> wrote:
>
> > Historically binfmt_misc has only matched binaries by magic bytes or fi=
le
> > extension, and always redirects a match to a fixed interpreter recorded=
 in
> > the registration. This is insufficient when the match requires parsing =
the
> > binary header (e.g. inspecting ELF program headers) or when the interpr=
eter
> > must be computed per-binary rather than hard-coded.
> >
> > Introduce a new 'B' (BPF) handler type. A pinned SOCKET_FILTER program =
is
> > registered in place of the magic/mask, and no interpreter is recorded:
> >
> >   echo ':name:B:<bpf_pinned_path>::::<flags>' \
> >       > /proc/sys/fs/binfmt_misc/register
> >
> > When a binary is executed, binfmt_misc runs the program with the
> > BINPRM_BUF_SIZE file-header buffer as context. Returning 1 selects the
> > handler; returning 0 falls through to the remaining handlers.
> >
> > Unlike magic/extension handlers, a 'B' handler carries no interpreter o=
f its
> > own: the program chooses it via a new helper, bpf_binprm_set_interp(). =
This
> > lets the program compute the interpreter path however it sees fit (for =
example
> > relative to the binary). A 'B' handler is therefore a strict superset o=
f the
> > existing magic handlers -- any of them can be expressed as a program th=
at
> > matches on the header and sets a fixed interpreter.
> >
> > bpf_binprm_set_interp() is exposed to SOCKET_FILTER programs and stashe=
s the
> > chosen path on a per-CPU area that binfmt_misc reads back immediately a=
fter
> > the run under migrate_disable(); only a match that set an interpreter
> > allocates.
> >
> > Signed-off-by: Farid Zakaria <farid.m.zakaria@gmail.com>
>
> Ignoring the blatant bpf abuse here I think this is quite workable. So
> this can be turned into an actual design and patch imho...

Glad to see you think this proposal is in the right direction.
Just for my edification, when you say "balatant bpf abuse", you mean
how it abuses the socket bpf type?
If so, do you have any guidance on a new type or should I just take a
stab at it.

For the proper RFC patch unbastardized with tests, should I start a
new thread or is
the convention to keep attaching it to this same thread?

>
> Note that binfmt_misc is namespaced and can be mounted inside of user
> namespace + mount namespaces fwiw. So a container mounting binfmt_misc
> (a fresh instance - few do) would escape that bpf program. On the other
> hand it would allow to register a custom bpf program per container if
> needed...

That makes sense -- but you will need CAP_BPF etc.. to load the new
programs though
if inside a userns.

>
> --
> Christian Brauner <brauner@kernel.org>
