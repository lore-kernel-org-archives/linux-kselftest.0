Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46B030DED5
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Apr 2026 17:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775065562; cv=pass; b=obBouoPzKiG2ObPbg3jOTMuN528SYXz6qk/EybeuPNKIT8IP5P70UgS3l8PxrFG8teqHD9dZ5AsqIB58OZxGj1DlQoEILzUz8hNSn7ixDFBqWMe5fpujqZfFktWGybl2EJeF68Y6ECny4MfZzXOJLilA+2I/Vsu7wR5SXAosiNA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775065562; c=relaxed/simple;
	bh=QI4ZvYmbpYFMS5F4DxWr2Qtcv3EtByJoEsfGF8Isxow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GfnnQ6Uol8OxGeUg+ifuHBqc2Gfp5RaFouwkmfOsCYj7av9jYwuiKvtQlz0QcoOZmBdoiZeB4fUgKmwDiwsGFzGXP0CYTkusVBhXxpr+tFxz6aeCwiXMS/pWJBzTddlUO3pznEFZlvUPQDaYiGzhGBz2Lk7eOw7wvw+CnFlOkq0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KuSB1yrt; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KuSB1yrt"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2bda3b4318dso5601eec.1
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Apr 2026 10:46:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775065560; cv=none;
        d=google.com; s=arc-20240605;
        b=j1P7jgljT+KrlfAEV7kfTu34secu2y1dlsAIycvE/S/Qp4Nkc9CmMxfQlKOnsKqLuH
         uiqZZ/b6kfrHpZV1o40zLeTj5xLPVb58THFDNJYrZlsoDc1lCNSC7eJUwZSRpvAJcd6Q
         0Zy48A3kgd9bGuDp3v3c5Uw6klShfW1BjMjgSfy7Jq8LqpYigLFOKVjEIeoBRXrYJ14y
         zeiT826go8LFRcriuAHmSRMVluEc1azl8siCS0b+0s0VjCBcp02sUOx2axFVIXqfmdfA
         X4UFdFtTmzDawWJHyf48gmFOHNjnRar7K39maQWBnZXPRUUidnrXJ2Ql7rEDCr/oypmD
         YYFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QI4ZvYmbpYFMS5F4DxWr2Qtcv3EtByJoEsfGF8Isxow=;
        fh=tK+Rm9HbkjGvAjauaBTAN78FG14nB3yXY2t8vnOimfw=;
        b=juFbdI1Fz3sKL4lpVpQOvgE5kxP6Xocbci6YQEeBPrjN4Fjfvaef9jUCkrgolOLb7a
         LL+ni53R/sHMMqVBB3jWOp3762Koq79XJXPz5MzymwswmyfpbJJ+GJCFu9z8fOwOh+nj
         MH5khXHcQIW4hvcKfr5V+RhPf6OlCgKO6ZKdqHchFwKUjOG3q/1WbPRrl9w+taqkzu1P
         3DNMz1kbh87cEv5TR5/43e8OwslFrnUKstdBkStcjSid5e3FvuK8IfcVLVleA6H7mNCZ
         swsIvK8Bp3IC2j+LF1wlX+XBqktzXghvL7ovu8wZ4SxYo32SamAaoAL/M4BKjDAgcLUn
         Zn3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775065560; x=1775670360; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QI4ZvYmbpYFMS5F4DxWr2Qtcv3EtByJoEsfGF8Isxow=;
        b=KuSB1yrtfd8BjsI6YjeWCq5wxXfLwBoKXUpCsrVo6QhIUPYZyH8YZscFQf+sEFQGSa
         TZa26pVuuui5NNTB3TMLCTlNQdZUd5bNv5ckyZGKLMzmdHhcy7khKoBsPqwALzvfTqMx
         Tx4YahpYBU96LprRTqv163LXmagSQ2UWTUI5fXIc45fHuZJGblCH1AeRl57i/ejTj5Mm
         qxEZ/P7i0pLCCFWwjWNVkYKtF4Ldade03b80tf2gtS6iOo6Vr4UtiKUQABYe6b0oT8sT
         YwPzJUkCLIYKqge/KqQi71RrOh4/b3n6UY1Gp9QJ2fd5NIK8vlg3P30n21TqlTrKxzN/
         SiHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775065560; x=1775670360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QI4ZvYmbpYFMS5F4DxWr2Qtcv3EtByJoEsfGF8Isxow=;
        b=dB/BQMpowC1im3Gll33xfJyk7Op9wqb4kNYjNY/nPZanseYzN65ubBCgDIkhKmmFO9
         43JstrZiAwrMGAUBdf6Ky2qbYJvGJoWm9Cv1i2FkKRq6BaO/Y6BUHt0tRQ+Jscpw4u01
         trKhy2JguDKLbDAddukN/JTQfdV3vXUmqv3fF/rJ8KHJ5xSV6bSZA27Bcwo3+fGxtgW5
         SXn8JGO/hyN8hHMsc+QbpE+3u/DfLvE4+us5ALheBNsMpXWB6cjIRWc+Xilqq3gIF5Ry
         rri4cChIhc+YSQw8k2VcceltdNvZAHoIwNnCv/XwIMugtKOIDF9Wkuwm2WxpT6WMYedu
         j4fQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKQORA4JD+s7ECyMT64slpOxV6PupIOU0vVI6zYbvvwiObubmi2efqRuQAkttWeWzwIRLjcxl8GoPwWpf0vhg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsG0CfCGM8YTr3cyF7Jy/qhC5zYfHNVCIlKO7omaGlbbXAtxMp
	/3a1LhmaENZWiR+rEKC8w4xGByUGFZ51LHGMFzSUMyxD/wciVjai9jxaZQ6uYBzhdOu824Nltgo
	oRkbOqx/BobUyNXNfWMkIxKC2u5EKo8o=
X-Gm-Gg: ATEYQzxnItUdTiQM1scx5StjERRiVtegy5k2PaYpHOQRoyftzN122lS6MtYTcxl0/bI
	x0AUhtFL05BH7/Y2GwYYstwvxNcjUtYZwnE08tfsE18PFqciE9MXV8bka0mzpivmQsR5FA3gOYR
	/T1a7sCsOKEiYZ00HtlbCwAZIPTw9ZOZhtBWA8D0SkXyRH7cdSbGVlAqtJLBsrtwQBRDYom0yIA
	yi/UOW5E8BDLeanmpE/BkkyFzH6x4udVJLTG+eFpQFEHJvlohW+5TcJd9pRZ+Kko+qx13QWzJ1p
	0x86Nz2r+lvthhehiGab5fNkPiFNPSxse5AB6lBwiCFbTGk73/dZQXXC7o816gExeCfObPUaYPo
	pe2FqZw9t/fVlNgz57/qNB3BLV8K7OHIJ4w==
X-Received: by 2002:a05:7301:2c05:b0:2c6:7f49:a840 with SMTP id
 5a478bee46e88-2c930798a4dmr1033595eec.1.1775065559731; Wed, 01 Apr 2026
 10:45:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-13-ojeda@kernel.org>
 <DHHVSX66206Y.3E7I9QUNTCJ8I@garyguo.net>
In-Reply-To: <DHHVSX66206Y.3E7I9QUNTCJ8I@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 1 Apr 2026 19:45:44 +0200
X-Gm-Features: AQROBzDasvNfwm3irNcxLclKgLrVzocIHNQudR_c4deB-93-CSbalwIa-aYY_TU
Message-ID: <CANiq72=8eVKk0gqyvgWM_-VSsRZY1s2e7gx9AbAg+q0dRRYO=Q@mail.gmail.com>
Subject: Re: [PATCH 12/33] rust: macros: update `extract_if` MSRV TODO comment
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2026 at 4:18=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> When I write the comment the intention is to enable the unstable feature =
and
> switch.

Yeah, that is what I meant as the alternative in the commit message.

I am OK with either.

(By the way, I wondered why you mentioned 1.85 in the comment, I guess
it was supposed to be 1.86 instead originally, i.e. "above" as in >
1.86)

Cheers,
Miguel
