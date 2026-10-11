Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284BE315D49
	for <linux-kselftest@vger.kernel.org>; Sun, 11 Oct 2026 15:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791733891; cv=pass; b=Ho0ymqAY8/PHpcM0QEQ2Pe90DgHwWAq/UI/iyGBfSTOgJ5fAlTyDoTMtUNrV7ntXN+oYG+gRk8GXN62xD3mwycKm580dJJmLafaPlxqaA1uHhbrdEd/odvC+M1xZnQ893qjKSOKnij2SeIPumvi4/vPRu5fj0y88vqeinKCg0wI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791733891; c=relaxed/simple;
	bh=IV3UF1ZbgbEHaaPEvCc2BzMnZwlILj8XNq4mL7GXZtE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G/rHDe1TS1V/BvO1rhsKmM/EcHdUlvQD6Wp42kFPwHS730gR1TdrbhRECOJd0hiUkINWmM/CWNSsAq6i16ED5VGmPSuB4WGpqFz2J8bqR05MT6z4LmtkmmpvMYMDcvGR0LMJQdicEzcxuZqDbKViqNGvDVVv/Q7eyX0W3s4Pie0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EhlTg/q1; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EhlTg/q1"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-144e1b6d52cso2872c88.1
        for <linux-kselftest@vger.kernel.org>; Sun, 11 Oct 2026 08:51:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791733889; cv=none;
        d=google.com; s=arc-20260327;
        b=csHsWB4t3l0HxsxR8FLGZXyhSomj39tpi2Ytqvi2VhSm4JDamscAXiCaNU0zmotf4L
         xdkapP0Ih8MmSP7hy6t9hJ/nnHjFDkYz8N9Ag953RAGKO2XdSZRakYo0luo2jvq2iszH
         2BqSsbKST+J2EUINZ5gZXw9eGo3Bz7ov+iXQdlwpVnZ49vJbzbY2JEFXsXQD0WCDOmS7
         N/tTFR81c3LzwxiIPHAg1IqMozdxz4o88plrefHdDMlM8DsYBOiCqdzo3Xo890bLgD7H
         z1z9WRVYajUeMjHaZJOZiylJcT4W3FWbRrq8xxgcdQrchq4Qbp49ZWdbPRm9HIm6fO6H
         q9DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PARpiAioxVcNkPOHU3+6w0RqdWPgrhBEQsd+ZWP6NEs=;
        fh=E8v1RalLGgkpBMkb4qHMzb3jZDfDlHlaQPDA8Qh579Q=;
        b=pvdxQUMw/d1tKUPXRWGkCp8LFTV9MWZw3VGu5o1I6OZ+/TjQyIWOHApqCaYonMcdvy
         BUU0Y/C/XBQVd6De1m479TuRGwyhbbLHXdGZ4yChhi3ddRvyb7tm6rhXWciXf7oglVFt
         JoEFzbqGiFILfo0+YKZfxfNYsvT3XeqDKs2OH6CeYsqbHMKnuLIVmCko8Ag77gfcMAZ9
         hAOWm3PfKH32zL3VxzsKyJboHoP7spOTxYMqqVzgRH0DzysyeGBn4fOAj4mn9APrhGP1
         oNpeMzanJgKBcZQ7O/CrKEzhDXB+VmbvoB9OE8VO4CkGbH20OdUFvC7Q32GYzAaSiFks
         DZ9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791733889; x=1792338689; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PARpiAioxVcNkPOHU3+6w0RqdWPgrhBEQsd+ZWP6NEs=;
        b=EhlTg/q1JI8aymjKR6w5G8AsCiAK462hNBGQEStU9+bv8njp/0Vjl9cY74RmLQ7eIs
         2zPLm+9r7RnXfMSMi9cZJE7V/i01PiJ+UUWl3THnXs9MgeAevQbrTdto7l3smmL+d2pN
         CbmQVWLR3im2KSzIb6YID0GGIa2J3SiN96vHWrr3eH9uIoG6Q7TesSlm4h61HWZ/46ZE
         BZlaECHRHFSGe2jQZ8Ox0au6B24Vjwhx9852w8hHfydnD4P2ndvEdKVOcH7OgpbXDgH0
         HtakzC/K7ZUlVXkdWoeHLG3/83WjWFShF8utZ0lE3w62m4KxkkzZGt8O8WRpLVqyNkPX
         fUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791733889; x=1792338689;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PARpiAioxVcNkPOHU3+6w0RqdWPgrhBEQsd+ZWP6NEs=;
        b=YnmCa3wvLFTYlI+DYNyk9jx4YY7oyYjscY80CPZLp+jaITxFH2g96IKrlmKZXAxXuS
         j1d8Y3sbCHwmw44tYmnnP/9hqtz6FT8aaIiXtr7tltT//5vVgiWcxbLeczRIO2lyPJgr
         fAqkv3wdlcKUEuPfj330pBAzX7DEwbQq8QxFfmVLzHjUZpQPL+/fFp7UjjUIGXH2FStn
         k4Hy48aYiTgDs/hmFo6M/S7jj+85ImKSD6rM8S9sCKkgGEWFmyNhsYXprwCc6gmMNmxh
         cKkaWc1bjNV+ik2th2bGRoM53hpKI6ZmsQqzsoYdXI3FKEcHsFJ1TsgyScgQOnc+gXnv
         XlaA==
X-Forwarded-Encrypted: i=1; AKwUvBwegh0K16IbNmjYBtprPQ5skDovBKCdNCvJmEgp5tV7rXSiVdLyjcXUSBCpRoKDJZ3gAOiJb3LF4PpwrKwRotE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLUfSDk38d4lN9fgOBIHrLP6Yfp7y17Dov7llgs/FBdr7f3C7F/
	gr+K2sfsrE+53Xx+E8XJQzd3PaT2QQHSpIZT33eN8p5bpPe0PM9TU7cS5A+/Q8SP7cYt7KJagLh
	Sjd9QEeo78sy4LE+UtXAo22+4txPBt/cHblFNh7AL
X-Gm-Gg: AYBFou0NhJxkcfg4NXlDh1hdwBnaZ/BpKukKi2aUuMMtHTp3UC/EZf+ne06fIGn9hlI
	jtymcN4HY9qoIehkvFZ1/TNx6ipijR5oX9z9anUmaoIawnXoFEK5DmILOOK/NmN8yfarJb71QkZ
	GO5n+kbzn7jf6k9y6dDq0hMJKbN2tanw/y9d7/lJFZ4YpqX1TD48TzgX/aH/rT7ZixSOH3IgTd+
	Zyw5QQWmEAVU44hycsLM5Q2tB+IVNVz1HpMDCE743ZfSOk+vJpeu1NQX2qhq87qJWsCN4d3lI3K
	dS9/zVwpkxoU/op3iGsW257O0WDET1g7ePUhz32x3fK8ppxfDuOzKQ==
X-Received: by 2002:a05:701b:2506:b0:146:85b9:974c with SMTP id
 a92af1059eb24-16e81b7bcb1mr124139c88.18.1791733888132; Sun, 11 Oct 2026
 08:51:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010025532.839559-2-almasrymina@google.com> <179168989611.434549.16378879758158058625@kernel.org>
In-Reply-To: <179168989611.434549.16378879758158058625@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Sun, 11 Oct 2026 08:51:12 -0700
X-Gm-Features: AclHuK930gGDDJHBRZhLwx30RqRng6RPlhHFuLPE0htp8kvWdbnGSu8mFAUgs1o
Message-ID: <CAHS8izNWaWF5-Zo=rqaUzC3joNkwoYnrxawUUVn73BJEaPSGFg@mail.gmail.com>
Subject: Re: [PATCH net v1 1/4] net: devmem: unmap dma_buf synchronously on
 queue uninstall
To: netdev-bot+sashiko@kernel.org
Cc: kuba@kernel.org, dw@davidwei.uk, asml.silence@gmail.com, 
	ap420073@gmail.com, sdf@fomichev.me, pabeni@redhat.com, kaiyuanz@google.com, 
	bobbyeshleman@meta.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, horms@kernel.org, shuah@kernel.org, 
	sumit.semwal@linaro.org, christian.koenig@amd.com, daniel@iogearbox.net, 
	razor@blackwall.org, tariqt@nvidia.com, kaifengw@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 8:38=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 4 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 2 =C2=B7 Medium: 0 =C2=B7 Low: 2
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] Incomplete fix: a binding that has already been unbound (netlink
>   socket closed) but is still alive because a TCP socket or page pool=E2=
=80=A6
> - [High] The patch unmaps and detaches the dma-buf in
>   mp_dmabuf_devmem_uninstall() as soon as bound_rxqs becomes empty.
> - [Low] The comment on struct net_devmem_dmabuf_binding::lock in
>   net/core/devmem.h still reads '/* Protect dev */'.
> - [Low] The comment on struct net_devmem_dmabuf_binding::ref in
>   net/core/devmem.h still says 'The binding undos itself and unmaps the=
=E2=80=A6

The findings look legitimate.

pw-bot: cr

--=20
Thanks,
Mina
