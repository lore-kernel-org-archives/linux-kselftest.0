Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354D43321C2
	for <linux-kselftest@vger.kernel.org>; Fri, 19 Jun 2026 07:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781854536; cv=pass; b=kwebEYHurr+miosNV5Ne4/t7Wbu/ENRP3JIJ1OFhWSXG3ycI7y7C9ijHOjylLANyD2uAONzaLV9r8F0x9DORxqG+F9+db008uyRj85+uYDaKh083WJhlfADmC5sxRJo1bfGJ4uhKespDcPTpH7P5uhTGbxZs5ZB56+fzmCr0fz8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781854536; c=relaxed/simple;
	bh=PgpznmWTfKeHsYjsfVMp5oVfAhkgkjTmLkdMPDPvfDM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=doGzBsshsGNwOtUGg8E3V7Lva/jXFvV7LViVuwJvc8YX8b5vuUMDxMS2vt0sTc/PJEMCXx2+jX4bJKeUEJbI2apy9r6YWYmKw2wxCdqvQalbYcYAdN9WEwRQ3uXjeaOlV3Lb4BVlmJVGMLRlAWa/tH9BtMqeKVrnT7TLA7wSuMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EWnDl6Wg; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EWnDl6Wg"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-137dd497007so89409c88.1
        for <linux-kselftest@vger.kernel.org>; Fri, 19 Jun 2026 00:35:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781854534; cv=none;
        d=google.com; s=arc-20240605;
        b=UGxd3WRcQFxgM6EDi5jhPz3Wel6ZhIfwtbx6ebdJzcD7hjOycM8xnEcWkWoKHSrGcd
         ybPSgzpSANqA4egYkT57R8YJk2YbyC328yPFFRpOr4pcr90s/3t70xjetZVOrkXtDuA8
         gDhlQ8OIR3v/7eUiCQB4vKDIGRTgVnAyn1vtOXv6LCFClJLg37mCS0xiiHZ9f8XQbb9P
         UpgldqRsdmE04KTmxBjGwJ6mx9GZ+f2/sBR8DQnhfhUArCIEDJoQoNblBADmxQoV1kaa
         9XYc1MRTebFfESn9OjQ1zQUx0b68U9zzLrS3+sOq7zof3ctmOgHTXnIIZMgDQ26yeO1y
         P87w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aLf7BTX5ObBEVs+75Lc5EAILSkjjX8LL8BwTp8oMoCs=;
        fh=HzxkpuuWa2RSZJEhb1zvbKQN4vRzwa2ZdMyylCh0thY=;
        b=k+voH6lckE2Yyd9988y2OS6gGi70pXKXKG0Gv1RFBKlIMs8lWzDExGTX9e7mraogsi
         V2c2HhFDSIjeYCOb6jgq1PU26oKku+fo6TXE5j5H0VmF3wFaf+IaU/kZgfySCRhrZVmJ
         7B/SgILJShjDz1VLMBVuNiW17YvdmL2vkOwsMSVjLuHKCixiJ+2Ppssq2aJvU532JoG7
         E9kMMnJ4md7ZLsatbwE2++hZmit/bOGljuTnBXIOt/9RsCmYMRfmwJ4XCSxXswSPmLQo
         kbiD3FkcLqIWxds47tYFAKT+n5nMr44iTdfbW2zkaz22YxAcOnDxwp8lBIns1j4f93NW
         uvfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781854534; x=1782459334; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aLf7BTX5ObBEVs+75Lc5EAILSkjjX8LL8BwTp8oMoCs=;
        b=EWnDl6WgC8gGqZYk4vLFizDo+rAYsvNdSDT+Yy022lZ7Gfj7hxbbE0a0Fz08DJJgN7
         gjal7gtrCG7N19QfV38VSGkQcD1D924YqRBJZXujXxTy8ZdgMgZ1Jd738ICSXpC9Ny+2
         GewDvnVlRyYaMp6Kx/bXMrD9x4+yHOf+idAsc3ooRjhbX4vmJtno5awUdVu/llLiB26S
         oF6XYZsdtMuBoVZb1viUhNLpLAfUIqqOvG7dZcTWR/MjV5Fs2q7TcVFdWuXpxQKC8jg4
         BkPHmGjzMlKiUxkVfhm6wFxhZ90RDNbIygPmOmtOm8VQ6XRa3apThGhDHGXpS11FZ3FW
         Pi7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781854534; x=1782459334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aLf7BTX5ObBEVs+75Lc5EAILSkjjX8LL8BwTp8oMoCs=;
        b=HADUF6Hw0uIhaFxZEEkOFIh0ltY+bli19JWOcz4XuA22lCfonkfFyWCV7cXs81zmRU
         jEjhY6S2fentbPD+h9MrYl7595lVBV+U0kg/57RYFd+fRB9DDL69FzbMjwDoOECWxk7v
         5jlamx7b9JBofCVGJrunFPMWS4XdEgrSJa77j7z1BH3MeUDEiLV/rZVbixVBmCV1NK0k
         QRmo9U0/cDRd9feQPZFXvcCRE/VUvft5LPQ3FoKkvf9v9znR9RMzK01bO5PhXpCvejlg
         yrXUYtPYEvtYV3nJVhBl3djFruoMBNDyxugV35UztDmrHqslkHxEPuhA/W+74On9Hqly
         nR9A==
X-Forwarded-Encrypted: i=1; AFNElJ+1wH9sXcXLi8vpSwH2OkFcTK6fExzf9061l51THOhEe77A8+lBWgnfoVwr25hCGFy2+19cxXi7rncb0ZkTk04=@vger.kernel.org
X-Gm-Message-State: AOJu0YwatEOF8VKgQFOkT8yccErD4MrVgfDt8Mce32bTVQwOiXSl/39n
	YNiXZ896QgEjAdDv/2mnQ3OWa8KYNhkYGnz1r3ZU2PsGdU6kOm3wzFLDvnVva7EVil78JQNGEri
	c577rTczUNxSYAQoPsyvJywmSLnp9eTg=
X-Gm-Gg: AfdE7cn/SMhnue1NCPIdOui/OW6OJCUvBmetqKQvlg7uTsmv3Qw7jYQ5TcC+a1tW3Oe
	Zs1iC4qia/wmbYTcQmUcW/J3EDpAkYYs1b+QQLXK0Y8Yes+CTwVjEchCwtQxmzxPE8C3TiT4sMd
	KqeD2tSKJTRdUkdTH3mDNqflem2zKh0qEVmrr+wp9n9ai3A44d1aay1Pao8iBHYb1sQ7RInzPmu
	BMuHkj6C4e8xLpbkGimel2NSv52GTqSLK98OyTGcLG2AAwruCd3BEsmPJtvOtAM/SsItMss9Cv5
	46qQ1ztG6f6+c+yyZSpFZj/NF6upGxOQ2qsH9u/muQwlS3nL9hMhII6FlqzmfT8dhSdh7fLmfyc
	MjXlV9Y8VNuGu
X-Received: by 2002:a05:7023:c009:b0:12c:888b:aa92 with SMTP id
 a92af1059eb24-139a20ae1d2mr596735c88.1.1781854534254; Fri, 19 Jun 2026
 00:35:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260616132559.2245814-1-gary@kernel.org>
In-Reply-To: <20260616132559.2245814-1-gary@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 19 Jun 2026 09:35:21 +0200
X-Gm-Features: AVVi8Cf-IFnA-pXIxZZahtdg6We4eiWi-htBnfQzvd1mNg5ax__2Rc1VPICswns
Message-ID: <CANiq72n-QC-DGUX1Cng0FTDbDM11t9N+6rUC4QxxBQtL9ntwMg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: doctest: fix incorrect pattern in replacement
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Igor Korotin <igor.korotin@linux.dev>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rust-for-linux@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 3:27=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> The `-> Result<(), impl core::fmt::Debug>` string is generated by rustdoc
> and by adding "::" into the string it no longer finds anything, and makin=
g
> the line useless.
>
> Remove the "::" in the pattern. Omit it in the replacement too, for
> consistency with upstream rustdoc.
>
> Fixes: de7cd3e4d638 ("rust: use absolute paths in macros referencing core=
 and kernel")
> Signed-off-by: Gary Guo <gary@garyguo.net>

Applied to `rust-fixes` -- thanks!

    [ Improved comments for consistency. Reworded to drop changelog and to
      fix typo. - Miguel ]

While it doesn't happen to hurt much at the moment, the change here
was not intended and we should be able to easily backport it, so:

Cc: stable@vger.kernel.org

Cheers,
Miguel
