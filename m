Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793802197;
	b=yC3I3uwaUiiGoelSDrMooLoVN5vNXkr1ckN4W9Pb32W991JRc3if8uTyBDahAaLcR7Un
	 bMKXzsCXuaZBTK6sauIiVPnY+WnEHjlhz4Rm3BZkHnS+9EVR2JN3smpTvEx3f50qsComR
	 XJHqI/QzJK1o2RaoW4NKkhLtPUxAzmlTSlmneGDRjjcJ6aMB288WCWdAp5OvM9bB12g84
	 FxTVhonpiI8iQenRhXlGzRT6g6ZAffFTln1Z9b82dYGomInD9ShqGn7p6IohmG5X05GUh
	 5tePFcK6/HDptgydi74Dn5mAUIYKhddXHZ6ZL2Hn/hvuQrFvyNf/l8YchoWzGZS9d9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793802197;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ipCVhzNjz3bkUh3HIH/dC2V084l64YZgYq8uC+CfKVA=;
	b=IRISGo2TPoz5XVoE6qg4LsVUK4PkxBTI4TqOogMW/C04ZM5mPN1ELkllSqC/dx0NAnHt
	 KYkEih2n5Xir4qgtrZ5bShhNeOzvYbY1fPdosw29TSMHAN0v2zeLYkPl/97KAULyZ5Ie5
	 OIIvokSs4bS0mcdMdG4N7Nai+DGj6omp1Z5uKxpsFM1WFbaaQXOrfmv3dT+JrdsMCQR/b
	 R7y2oIkwlHi29bovUrKoPCBNh0XFO7I84O9z1fda10IJuzKHMI1C3qt2u9yQpU6ERvJ9O
	 PHztKi7+lD+I6iRe74vdT5EZxbV9T3KRFK6AcLSb8fIAk4NZCBwkUKE19RL3iEgv8sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D19606A32D
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 14:23:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29D19606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so5478785e9.0
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 06:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793802195; x=1794406995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ipCVhzNjz3bkUh3HIH/dC2V084l64YZgYq8uC+CfKVA=;
        b=0LsVrB1RbPjDtXwX3qjLB1A3vbWVpqZ7HZf5pVQXVp4B7btdszFS1RljBh17d4QysC
         BS3cixxniLqtiMaPPHJK5cPfu73HovzOQC3aoX+YmxViTbcNeU+xrWcrtDpOK3olBzbq
         8BYj61J6NvVpkQGghxMoUWWxHaUL3v2+0S7dfFQuuTth1J1asNB7GdDfzPs5Ij5j1Fma
         CAHQ0lbRdCK0qEiS0+sQqrIdPbDnjliso64JP9yRZdlJQLMNlR49y+Q1lop64YIK2xJG
         yr/u0N5gPgEp75e1VVKhayMcmVrXJMOLfY8AaES0WpLtJCBYs28K3LQlgCNZwXYwAbjv
         QTiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793802195; x=1794406995;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ipCVhzNjz3bkUh3HIH/dC2V084l64YZgYq8uC+CfKVA=;
        b=VhpM3b+ONK74FvqDKaH1jGOnP46NL91z32WirzZcVAKQQQrlivXB8EwJkO3wuF0dka
         KqTmyZzU0cBk7eUqVI1+jM6FXDuEFZ/5wdW8YINeHKnnidYaJjlf2KG55iOe8YYGv8kZ
         iwm4NySPvzNJDYl6RSqCM62nFc2YyZIBvaLZxkKyTZap+E7MUjrPQhYRQkwFHozz1Xjz
         HFHpmKxnuJ1Uc8mcBsXxeRbLIwAHzoWPNaUqzofNS1CfPn4DYyckVp0I6y652/KsOU6q
         ithj68/ERDTeuESLV7lq7gVCpLplCL2bMbbTx++fLqa4nV2pJKHVamd8Gxjm2AToSgxp
         ASiQ==
X-Forwarded-Encrypted: i=1; AKwUvBzmZcsDVhGKpHqdRI02mH4L8y8YuPpiHjTbnby2qA4l95zSrHOuqYjg6MdXHeVEt6P5ivCQAXeQaoGLHIlVAhI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bk+l3otXHfXMrXF2CFphKRBLivihgZC0QDNv3MXq7fDPoQhmr
	joqRxyxQIDTdoQ7q+zkM7C7GcNqJGGqfoHUuGXe7ccQHzVTPjZsxsAeR
X-Gm-Gg: AYBFou3XeCrRkfRx2eHgbD6mSjkPTlsfn0riGacsBSMQbGYoYjtC/fheoWFmfGuYQEr
	aCNcBO7RsTj+bFGhKCesxlMIaXbSpTmNNg6zoJwKlFPCAiu63K5lAgdmfZg7Qz2ngyHEtfNLH9O
	ExOwk9GZFDtWhdp3lhu/KEaIcrfo6lZ/Im7O227hyb91+LdA1PbWMSojitKyg5ZSqbTfE4yWOs7
	19yNYeS1taefQ8ylrRasgOibHfsflMb8nLZcPRAwbWxn5i/ycnYEkvkB73zub/Ku4pnHHDSCFU9
	t/6bAzMUYAoJcMH6nMYROKySi5+vFFieFcv8isSGB3uQ1CEFwGgG4EG0smL+657t+gZuohxWYvA
	bqt5NwbLXcanJ62O/6U+B6rZoppa+L1MEJ5KcfXRVnOfRQaS6FWnyZIpPkRD+II83yzYJCtyy34
	88FYz0ppdz3gnerU15cA0aNdlEVASMTNJwlLcTmINk/oO5pW7lgCGWEo+9GNg5CTJ81perKEmqd
	PRBu78d8+wacQuX7Swb/4RdApFhFDdS0qoNKY+ltpd4UI3ebd7pa0F/htC6g2BeSmUqchvxqCPo
	FiZfxwpnVyq4B9uyPePoQXcoG4G6wmpcz8wLsNy8XPROx/BRbVRI/tMlYi+fBqtL
X-Received: by 2002:a05:600c:4f55:b0:4a3:d327:6ed with SMTP id 5b1f17b1804b1-4ac182dcba3mr406397685e9.17.1793802195353;
        Wed, 04 Nov 2026 06:23:15 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43c7480e3sm87089165e9.7.2026.11.04.06.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:23:09 -0800 (PST)
Date: Wed, 4 Nov 2026 14:23:07 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Samuel Wu <wusamuel@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner
 <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Andrii Nakryiko
 <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Ihor Solodrai
 <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi
 <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa
 <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH bpf-next v2 1/6] kallsyms: Add KALLSYMS_QUERY ioctl to
 /proc/kallsyms
Message-ID: <20261104142307.431fc12f@pumpkin>
In-Reply-To: <CAG2KctqdPq6NmK6rB13s2bgM7kP2w4OMMy2hdp_OFMVYYhTnZA@mail.gmail.com>
References: <20261023001603.560210-8-wusamuel@google.com>
	<20261023001603.560210-9-wusamuel@google.com>
	<20261028134012.01d52e94@pumpkin>
	<CAG2KctpGPHo-S3AEvBhK5HPUnDHfoJu6Z-r+cS1hQ4Ps=B3DmQ@mail.gmail.com>
	<20261030100215.6f8e0d4f@pumpkin>
	<CAG2KctqdPq6NmK6rB13s2bgM7kP2w4OMMy2hdp_OFMVYYhTnZA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 3 Nov 2026 17:14:26 -0800
Samuel Wu <wusamuel@google.com> wrote:

> On Fri, Oct 30, 2026 at 3:02=E2=80=AFAM David Laight
> <david.laight.linux@gmail.com> wrote:
> >
> > On Thu, 29 Oct 2026 15:05:45 -0700
> > Samuel Wu <wusamuel@google.com> wrote: =20
> [...]
> > > BY_NAME matches names exactly, like kallsyms_lookup_name(), so they
> > > would be different symbols at different addresses. Please correct me
> > > if I'm missing something here! =20
> >
> > Only that the user might really want one of the copies.
> > Sometimes there is only the copy. =20
>=20
> Good point. I'll have v3 add KALLSYMS_F_PREFIX + pos/next_pos
> pagination to cover these. A prefix query for "foo." also finds the
> copies when plain foo does not exist (expanded on this in my reply to
> Andrii's Oct 30 mail in this thread).

I'm busy rebasing my patches - they got stamped all over :-(
I should get a v3 that applies by the end of the week.

I will add a 'prefix' variant for you.
The 'next symbol matches' flag is exactly that (actually it is a
this symbol is a duplicate to avoid issues at the start of the array).
So in this case that application would always need to read
the next symbol (by name).

I think it might be more sensible (less pitfalls later on) to return
the symbol number - not that of the next one.

David
