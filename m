Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643EB39C638
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 13:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771938932; cv=pass; b=H0Ei+Pu5cauyB9N28715wztigKG0JtVhONYu2/SBkpFb4E8kuadhTej3J2Q7mhrku3+JQkRdmfmSxdBIAe7e8zPkocBkA9mZWvhGG/f3P8g9dnJ8TjCUWqia5PNRIz1tUPGvXEuiF4ELJ5JKW2T6qcQTHg4zqudHZ97zK3acP24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771938932; c=relaxed/simple;
	bh=sPMsIShW6+JzdEs6DF3qKrshI97G8GP0myyovWnwiSs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sGWOMXkUdgc9XRn7gnW9s6yVGxsljceoXlScgr2EJGmfnR7J9j56GS3mVsCd9vu6v/YFCuoNDVwQZtSO+SgLJWlDaBPV4MiVFJH/g0Gotoj2wZmi2mxAts2JMfdX8msAmTGhihEHkpy60DCDS50s3HfksaBEEodjspA0WgaWVKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E2Yo4hFB; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E2Yo4hFB"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4398913af88so421130f8f.2
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 05:15:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771938930; cv=none;
        d=google.com; s=arc-20240605;
        b=h8o7bCw5Zod0+wnxichhSKSBmdCTxnfNnBZ3ya2FltpCgAxUArVdiOXaGZsr9BY6Tu
         1kfy+p+MO3n0388F1qINmS5s60uafUsOX6KTGfmxTL7KeQuZdv1hN0+mlbpzAeuKKY1s
         C7qD1MRVRMOQsL4WyV9Xa9b9kHaTIWdnSPiaxKMd/hh4VyGOEzEM2muvLOllvhQyyZpk
         e7rRQQJHhY9vIXxY4eUH4wr73ZnasoHRY7areOvm3U05s2ZAouITbV/uq7No3OGulDzv
         zuRsjt1DnzKizUnuYGDzpXlU/lz9m/MME8t8F29D3nqn8zHGA56ef6mH9s3A9TNwqv2T
         LLhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gWMlp1ruVrvPjA0cNiKtCr+diAV+Slyjy18uMqXnndQ=;
        fh=UZbqQu/rGLnWIH6Hi/+Lg7FDcbrGGC0+jcnV+65ycpY=;
        b=LNZ42vxvzo1mrfxvOS0Q0rCcCoIhZfQ1ruYnSKy5UJaqEQIuuCTcPRL9AqSEXMcTfb
         ydhcAKn6IZnovHJYrVzf8Y/LyRCa3hBIqeXq08JZuTm6Hk/85gEEQy4NpaWck7iLSIHv
         ssscr+WRac9fOlOfepwg30xve37nSRb18RJyLqDVlHspbzsoG1w/xH3hY2Ga9ZSoXzN8
         QA6wNQ3yvPYrqk8Ky5oA3ev+ERMaHn7H8lVOZIkyZmr3i5kuI1hC6wWsMhpi75y1SsLr
         h7+KfdIvCAZfdln/rrUb0XTBg59oH188bIC0XG2tmLH1uiWfZXkn7h/bZjiLwIY1dOEf
         PIdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771938930; x=1772543730; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gWMlp1ruVrvPjA0cNiKtCr+diAV+Slyjy18uMqXnndQ=;
        b=E2Yo4hFBetSWe5UGiLMiA8/3CaSH3nfxGdUXh46YhTg12+mbeQHdCFB6EMhU5mgXgN
         G2BgeC/bc7quuodKWaorjMh6p79znwrktOFyBqtNfKConY7k3qEofOd+RHc0qevaC3Lk
         gShCfR8m7tDs03Xjnpv8BQ+9aJok/n03pV1j/yJLVfTUYVedoXv3NJHO4Y5wJ77BFxNZ
         1IU1iJoo9Wntji4bwRtWKRgjzSXBHbRIfscQ7KB5eEvxA1wBla61Xp3LCCR02C7maoqd
         Z72o/vY5HkVjsRZuFY27rY+RO1CcinQ4biSzuZPj65gdX8h/9/+sp3RaDrM0yvxenRej
         Q5Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771938930; x=1772543730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gWMlp1ruVrvPjA0cNiKtCr+diAV+Slyjy18uMqXnndQ=;
        b=Qczxby8Yw09FxIM7D467e2GyC0bkYlWpywsEtveMX4tfLmhsLyh+C+caL9qZnbMDgs
         ltE2ChCUvoqDZuBZ9fgqIXwViUYxcysvC9Dl1sgY6iHA3ByQdLSQEKzhWYCGG4JOI5kE
         FihN1lEcKI7nNJhOBPGOWaiC6rbb7t8FUrkJwY6gkqmqRxF6PvCYC5rqp0jcSf/dsow3
         8xBP6Jx9J/kodsVi9I3cT83jVxzgnMKHl1j8Fs5Ie6c/i9jFeUmhUGjCJRzV5rUdKi3/
         PMO17Ni2ESjgX8nVC+W2tjx9rbv2TXxZJQSu/p5mZ87uvtFI0elwxanyOR0T8XFIjeLH
         FFeA==
X-Forwarded-Encrypted: i=1; AJvYcCX4CBlqU7fagkpu6DdPUqrhEAhSSrca1nIs+6o5PdOPNggKc08aqRYYBpbWXA6B8PJtKiQiOn9moJwLnB7BJYM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCK4LYhQ+Gk5LY+6HFr3ryHGNHE3WUllRXsM/Usja36iej6Rq8
	/AWVvwPH4XTC78L+MBhCk0lq5ZZJimDEjpaIXxIaTwEj1TVrSro3QjwKKVa+9cQykib8sSPj8FE
	OXhiS+tNtXbfnRejaOs0KLuVblS/HxDX/KOT1ZQkx
X-Gm-Gg: ATEYQzyvF7IqMkjfbfu6CynLOYsZKaBSUK0/dR55XiH3955b8qAoXEGZaaFmSnHAGF2
	jKbsTECkMDZ3S4rV/2UfvaB6a468OBcVcIpBN/82+YN1gDqyukBlXr26epEMS5RanfOjR+HsqIO
	BzXrhqio0EAav/HsESSVleOf3Iq9jGpzLpM2gerMM0ELzjnBKf4SijLZK9O/rECf8K+OYBN2btX
	cROYk0Q1NAU4epmd5nQYiFzH20wzYygHIhRwt4CXWYcjU+Ie7IvrzjE5p0vAJjJWh6ccNgVPJZJ
	u56NHyEDgGMNv9XW0iCYzzqD8o0TR1jqXDuaTNKuqDcpFC1y
X-Received: by 2002:a05:6000:1448:b0:430:f7c9:94c3 with SMTP id
 ffacd0b85a97d-4396f16fa74mr22881313f8f.25.1771938929192; Tue, 24 Feb 2026
 05:15:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Qrs5fItWst004EC_jGHvnTB2s8QuVM9cnRKIhUuImhaSV8qhL9DmqifhAqLFPSEf1JYNS9J-1hWqvptIARahvQ==@protonmail.internalid>
 <20260224-unused_var_err-v2-1-337f9359d98e@nvidia.com> <871pia2wcp.fsf@t14s.mail-host-address-is-not-set>
 <DGN7R1LIMMXA.PAEGCW35B6EY@nvidia.com>
In-Reply-To: <DGN7R1LIMMXA.PAEGCW35B6EY@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 24 Feb 2026 14:15:18 +0100
X-Gm-Features: AaiRm53j0jWe76VxFKuxCY6gDGFxEl8Y-H3mzmvgtlc7JiyapeCcfXycaAcT4_o
Message-ID: <CAH5fLgj_=N1S9_YNmmpKYsC13j_E9JPRLCUha=eUEbzmvkDQCg@mail.gmail.com>
Subject: Re: [PATCH v2] rust: kunit: fix warning when !CONFIG_PRINTK
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <davidgow@google.com>, Rae Moar <raemoar63@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 2:07=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> On Tue Feb 24, 2026 at 8:51 PM JST, Andreas Hindborg wrote:
> > "Alexandre Courbot" <acourbot@nvidia.com> writes:
> >
> >> If `CONFIG_PRINTK` is not set, then the following warnings are issued
> >> during build:
> >>
> >>   warning: unused variable: `args`
> >>     --> ../rust/kernel/kunit.rs:16:12
> >>     |
> >>   16 | pub fn err(args: fmt::Arguments<'_>) {
> >>     |            ^^^^ help: if this is intentional, prefix it with an =
underscore: `_args`
> >>     |
> >>     =3D note: `#[warn(unused_variables)]` (part of `#[warn(unused)]`) =
on by default
> >>
> >>   warning: unused variable: `args`
> >>     --> ../rust/kernel/kunit.rs:32:13
> >>     |
> >>   32 | pub fn info(args: fmt::Arguments<'_>) {
> >>     |             ^^^^ help: if this is intentional, prefix it with an=
 underscore: `_args`
> >>
> >> Fix this by adding a no-op assignment using `args` when `CONFIG_PRINTK=
`
> >> is not set.
> >>
> >> Fixes: a66d733da801 ("rust: support running Rust documentation tests a=
s KUnit ones")
> >> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> >> ---
> >> Changes in v2:
> >> - Use a no-op assignment instead of the wider `#[allow(unused_variable=
s)]`.
> >> - Link to v1: https://patch.msgid.link/20260224-unused_var_err-v1-1-c5=
1d805eceb5@nvidia.com
> >> ---
> >>  rust/kernel/kunit.rs | 8 ++++++++
> >>  1 file changed, 8 insertions(+)
> >>
> >> diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
> >> index f93f24a60bdd..a1edf7491579 100644
> >> --- a/rust/kernel/kunit.rs
> >> +++ b/rust/kernel/kunit.rs
> >> @@ -14,6 +14,10 @@
> >>  /// Public but hidden since it should only be used from KUnit generat=
ed code.
> >>  #[doc(hidden)]
> >>  pub fn err(args: fmt::Arguments<'_>) {
> >> +    // `args` is unused if `CONFIG_PRINTK` is not set - this avoids a=
 build-time warning.
> >> +    #[cfg(not(CONFIG_PRINTK))]
> >> +    let _ =3D args;
> >
> > I think (didn't test) that you can use a conditional attribute [1] inst=
ead:
> >
> >  pub fn err(
> >      #[cfg_attr(not(CONFIG_PRINTK), expect(unused))]
> >      args: fmt::Arguments<'_>
> >  ) {
>
> Yup, that works as well, and I think I like it better as it is more
> localized. Alice, WDYT?

 I think the other options is also quite localised. It's per function
argument too. shrug

Alice
