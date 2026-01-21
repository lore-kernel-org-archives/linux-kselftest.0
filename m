Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C578024A07C
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 01:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768959160; cv=pass; b=SvO5P8WiFzWW5t31v6MFc1d8Rfit4UYuuZP4Yk/QIdDLap6vk8we0ueeXhxyVT3qb+mUbg15dfU+Aw46/ZxRgAyW81FbvlRQtbdFeEJ3gmE3I+gHp1nY9/rtEo+kUB+erh12J9S/95JlJUtz46tnzaF/GxBu9xGHPhUxqeaODkg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768959160; c=relaxed/simple;
	bh=ShWRak8oUy88OSaopaw+aLPDpDo1ZpJd6cDyp++LarM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GN70VH7b+4ngI7DgOm0wWs8AtsUArj+tCnqvWUv3IFpm+z47tTevnpJGC2IkQxXYEeiDHHI7qdzd7f+Z25rKvx4sW8hyQpYupiSOPcfp/0D94YQmhTPJt7VAyyom2WDBtqGyGGjuTCDSsWxRFUWoM9rh0qwm1iBjzQlJbIf1WoE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=A5BCDI+7; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="A5BCDI+7"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-65815ec51d3so377842a12.2
        for <linux-kselftest@vger.kernel.org>; Tue, 20 Jan 2026 17:32:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768959152; cv=none;
        d=google.com; s=arc-20240605;
        b=ZjJVV15G+rkZ3wH1IF2Scd+J5qmGoCYrVrZZrM3y8UhYvfkAoKJ1F0HEGXSzqD8ZoI
         huxweZ7w+CkI10+M1UXIQhv4dOmegf+6qiSCIPPdUyj/sQVQhoxqbny+8apklX1r3Ez+
         /6myQLZ7H+6J9XIrlYGzuEkURJn+by3140D0FaNVJeCPP6wMQv2ngyKqZxI9TI6p5KTv
         E7u3HiK181YUahqChFMjAwkp4Vr0WbC2I2zGf3JzAOGCg1nDI+gnlzhL9v+y9iYjTSf6
         kMlNF6hTH7d7zB3h8fvLiLExW4XEWzTI9xJUXJVJzw2I601yftAI0cSGEy20pP5kmEaN
         a17Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=phhznUg1me3aMCDh6RtpPgdrBfYLQTkKfqDDafoKBZI=;
        fh=Qqy6lZz0yUAIVN4xglQmmrWsQb6lPtseqj0+PMDEeXI=;
        b=VCLx/mwGFWcD6l89ofMTf84zpWtPLMxATIxczgCa44tPCN0rou3Id383XPi/ftPkzy
         M6pUD6oF7IKNerSWlUPcqpWKbv3t6pDdIi1aScyK9aMCs8ROseD4pSpGeJgPrxGYTqpn
         IwnzAXPIxQZSgVU9NHG6tV5pT0n+6Q1bWDeko6Cdw/snf9stJMvDC9i9R6bHtrHYMK3T
         a+HG6qESHpMJ3ajZx9kjtyzRN8TbJpLm9kwlLToPbg0rfLV6ej1gcvIMgUS4Sd0q0Uf/
         HF7iONrbHiwB3nR74OwkY/93IinO3n5rcvK2oPr0HBtBVlVM9rXDL/4GGlQHKhi3uXcC
         y7uw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1768959152; x=1769563952; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=phhznUg1me3aMCDh6RtpPgdrBfYLQTkKfqDDafoKBZI=;
        b=A5BCDI+7uaow+L1pkR0/vhbZZn6AJyq7brkzi3g5PXQfBD4lA4/eE0X3H0eaNyQ9uI
         BhpW1W5q/SgcOo9bLiXBhGEOuJjNOLdsgI1yomjhhtiMc4yYgjkRRCEZEjOgjfqf0UZm
         alaado9gHlyuyjKWjd2TKsKjKgLfd7fX9KqgYnaBHFx227Fx+cmQlNknKxxjjBc6MhHc
         tG3tvKjpIj28uMUF7HVJL7ZayB6r9Ecpz7T11yD3GxnJ2kYCvSe5zS/YTgO0OkPIEynl
         85aax+WRhLPNanwVxq+Dtb0SSQHEK2jnBzPJpDYm/K1qIbTkzVoB1lPQoyDUEHDmqQ9K
         uN2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768959152; x=1769563952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=phhznUg1me3aMCDh6RtpPgdrBfYLQTkKfqDDafoKBZI=;
        b=IQ/JGo7UqEXXGl0Vv/nbEEyF/xBFSmsn2hRpv+RgIu+VHF6e/JYBRx6dTbFJ2pLyOB
         HKuNbWUrs6p+DN81CGKui9YgESGfcmB7oBhtcW3If5yiWaYw2Z6hvpA5zUF+AFbcrTo7
         /cqlNrHEYmR5Mg+OqSgtMLNx/BLfi+/E+b1pU/yDhkZDGloa2lJ9deiLKDmsg4Z8oVYT
         IZnflvR092bPgynd1GeMiU2nsyX85YbO25sYMTuP4FO59sHHaWfW3iClAG/aUmjzqCh6
         df4QPYE374hQo9lamSKSOvrMaPaXJFdXUGUhI70E37zT4BXCz5DxLfuU3/S1BsHXT9Oy
         Gniw==
X-Forwarded-Encrypted: i=1; AJvYcCVlJ+IOHt52kwZIS0AGxdSkU8URIsmaO4E7YPgkcbR1UHZVeVHxxex0FhaW4fY6JoS3cbMc88Li5Kzl3SjICDY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw24ufTf9jU+/4IsW9YCBzIGFBI3KTUeWXoABI+WEIMa7o2Tqwf
	mYMZuVLlke0QysGvDsVW8RA/gwteHoe0rjj2CfiJbe8bDGVlrEcA6EAteElZI/+T/qPcRd1VNoO
	alml31mwkGwYp3BAmv3mfwhoJBprQiZcmAbxMZLnoAQ==
X-Gm-Gg: AZuq6aIBaQvHtHUTVO/0CGEMRfgSynHrMIagcKppNMDsXSuz+Rdq/v5ZJk/lVY+nxg3
	qzj9GOXZW6FYKJgbpNtsQq8ixVyNQjfg0ZENgdYK1QyoMFnIRJkTyK2Y8rOOUiFVnG5bHMpzH7j
	N4IHbg2y0cFa0r0gVD9LLs05Jd5CImO+0OoUaf8kgaIvR7gi6xiDi1q1UfqQmCGn7nMPCzb6GXN
	gIP53iPwp0HgKGuo941ZNCpOFg9xQxWe04x2DrCwaxMOxI/585VGJlqq5rnzxKUlyIZXXOlPA==
X-Received: by 2002:a17:907:9488:b0:b87:7634:b20c with SMTP id
 a640c23a62f3a-b8796b215a4mr1301363166b.38.1768959152268; Tue, 20 Jan 2026
 17:32:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251211-v5_user_cfi_series-v26-0-f0f419e81ac0@rivosinc.com>
 <e052745b-6bf0-c2a3-21b2-5ecd8b04ec70@kernel.org> <aTxf7IGlkGLgHgI2@debug.ba.rivosinc.com>
 <CAKC1njQ-hS+kUJ0C_v0oqZW1EZw2zAXMp-SnnA-ZXh_H-SoVdQ@mail.gmail.com>
In-Reply-To: <CAKC1njQ-hS+kUJ0C_v0oqZW1EZw2zAXMp-SnnA-ZXh_H-SoVdQ@mail.gmail.com>
From: Zong Li <zong.li@sifive.com>
Date: Wed, 21 Jan 2026 09:32:20 +0800
X-Gm-Features: AZwV_QgpJ38WsQTA-JLh1W5jk7su1plcAErfmIKl7ceT3yMsB0wZBJHvBBZ5Ujw
Message-ID: <CANXhq0rpjSvOThACrB6_MMc8S34--xJsUYZ+HtMu1GUNyk8zOg@mail.gmail.com>
Subject: Re: [PATCH v26 00/28] riscv control-flow integrity for usermode
To: Deepak Gupta <debug@rivosinc.com>
Cc: Paul Walmsley <pjw@kernel.org>, x86@kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, Jann Horn <jannh@google.com>, 
	Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, alistair.francis@wdc.com, 
	richard.henderson@linaro.org, jim.shu@sifive.com, 
	Andy Chiu <andybnac@gmail.com>, kito.cheng@sifive.com, charlie@rivosinc.com, 
	atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
	alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
	rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org, 
	Andreas Korb <andreas.korb@aisec.fraunhofer.de>, 
	Valentin Haudiquet <valentin.haudiquet@canonical.com>, Charles Mirabile <cmirabil@redhat.com>, 
	Jesse Huang <jesse.huang@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 8, 2026 at 11:10=E2=80=AFPM Deepak Gupta <debug@rivosinc.com> w=
rote:
>
> Hi Paul,
>
> I have a bugfix for a bug reported by Jesse Huang (thanks Jesse) in riscv
> implementation of `map_shadow_stack`.
>
> Should I send a new series or only the bugfix-patch for implementation
> of `map_shadow_stack`
>

Hi Deepak,
Not sure if I missed the bugfix patch, I couldn't find it on the
mailing list. Could I know have you submitted it? If so, could you
please point me where the patch is?
Thanks

> Let me know. Thanks.
>
> -Deepak
>
> -Deepak
>
>
>
> On Fri, Dec 12, 2025 at 10:33=E2=80=AFAM Deepak Gupta <debug@rivosinc.com=
> wrote:
> >
> > On Fri, Dec 12, 2025 at 01:30:29AM -0700, Paul Walmsley wrote:
> > >On Thu, 11 Dec 2025, Deepak Gupta via B4 Relay wrote:
> > >
> > >> v26: CONFIG_RISCV_USER_CFI depends on CONFIG_MMU (dependency of shad=
ow stack
> > >> on MMU). Used b4 to pick tags, apparantly it messed up some tag pick=
s. Fixing it
> > >
> > >Deepak: I'm now (at least) the third person to tell you to stop resend=
ing
> > >this entire series over and over again.
> >
> > To be very honest I also feel very bad doing and DOSing the lists. Sorr=
y to you
> > and everyone else.
> >
> > But I have been sitting on this patch series for last 3-4 merge windows=
 with
> > patches being exactly same/similar. So I have been a little more than d=
esperate
> > to get it in.
> >
> > I really haven't had any meaningful feedback on patch series except sta=
lling
> > just before each merge window for reasons which really shouldn't stall =
its
> > merge. Sure that's the nature of open source development and it's maint=
ainer's
> > call at the end of the day. And I am new to this. I'll improve.
> >
> > >
> > >First, a modified version of the CFI v23 series was ALREADY SITTING IN
> > >LINUX-NEXT.  So there's no reason you should be resending the entire
> > >series, UNLESS your intention for me is to drop the entire existing se=
ries
> > >and wait for another merge window.
> > >
> > >Second: when someone asks you questions about an individual patch, and=
 you
> > >want to answer those questions, it's NOT GOOD for you to resend the en=
tire
> > >28 series as the response!  You are DDOSing a bunch of lists and E-mai=
l
> > >inboxes.  Just answer the question in a single E-mail.  If you want to
> > >update a single patch, just send that one patch.
> >
> > Noted. I wasn't sure about it. I'll explicitly ask next time if you wan=
t me to
> > send another one.
> >
> > >
> > >If you don't start paying attention to these rules then people are goi=
ng
> > >to start ignoring you -- at best! -- and it's going to give the entire
> > >community a bad reputation.
> >
> > Even before this, this patch series has been ignored largely. I don't k=
now
> > how to get attention. All I wanted was either feedback or get it in. An=
d as I
> > said I've been desparate to get it in. Also as I said, I'll improve.
> >
> > >
> > >Please acknowledge that you understand this,
> >
> > ACKed.
> >
> > >
> > >
> > >- Paul
