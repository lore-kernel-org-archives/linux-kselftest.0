Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793624203;
	b=AI/LiGGqkn4BIXtnGsBsiS5SkeaEKSkw3B/y8mR00Y5ugFzjEOpNBMnZ1t1sfedNYOw4
	 ORPnDHkqn1mOQbG2eCifIuDaNzpvULwOOmit3y/1gVBc51IlAniF4F7fYe/uLYBHdFXF1
	 1BPMXTuv2m6s9y5jKRBJcZF21npLcx2CdjtTGPhvFGetNzzYZS9Kr7MLDxTreeNiKjlXY
	 X3WeUB7JjOGebXUvg8Nlo86d8i9oHb7qnXiyVbMmtd4pcM2W8X/j4C9yrC3jvWIL8XcS/
	 OZewSKm+0woRxLI3Q2VyRWuqJoCB9aujt9QFp1OEmExFj4RBZDIwhV3Jr1J3Ht67blg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793624203;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Feedback-ID:
	 X-Pm-Original-To:Received:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-MIME-Autoconverted;
	bh=Wo8CPafjrKqXgC1BzSup6dMofFV7FA937tiriyNYXc8=;
	b=pKeKj505ht3IyNB3yG8tJlXci7DhR8v9qv0Lpx/UgcgeqKU90V8aM4Uu7n9p2lcHO2YS
	 6wYku148lIpsoMwvdiNlT7w8wQhORuonLFHOkSeOG45iwbnj5Pz2UX/P9YO+IOeVPDUC/
	 hXTUM0vE4cV2nfS4Fbj7zMb8+eqSKWtTJWd/+U8F8LXmghtpeEl8JNpX7ucq11DyokeuW
	 Z5kJt/GthwQs9e/hAljov87T+cpvfY6+QWMS+lgosV5cEmCgEaOzJIzkrVxZyuuHcHDC4
	 lzrmuZPu+xJ3JN2GMPCcLl9jgq1nKnifk9jIm1f3SKoJ3K47oCJLqHYc1kKp3Mt7eaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=younes.io;
	spf=pass smtp.mailfrom=younes.io;
	dkim=pass header.d=younes.io header.i=@younes.io header.a=rsa-sha256 header.s=purelymail2 header.b=kBrMYCW2;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=DfPkpSTd;
	arc=none smtp.remote-ip=34.202.193.197
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB9C606A333
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 12:56:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFB9C606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=younes.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=younes.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=younes.io header.i=@younes.io header.a=rsa-sha256 header.s=purelymail2 header.b=kBrMYCW2;
	dkim=pass (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=DfPkpSTd
DKIM-Signature: a=rsa-sha256; b=kBrMYCW2sp/2rrd2MEh7Uie0Qmqd6gv7mcZPqhee4ObdrccdKak7eou4KyAw5q/OEv2yCGfKhciBqH84pSq+K/IILT+IW2+Hxfzjs6dQQPDHe23Yc9spUJWfZQdjdPcGNjoCKxYkhNICjQl8P2fa1zXOKAJJODGsgSSjQGEpxig78rS0i5pIm+KF+45QZs6i3W0YZUe4KRHpd6RminNG8wPcbN817SkHkHfIX9c1DwV0vrDYF7sR31230PT42e/vSvUf0oOCCsN6Z4P/psKsD2FHrwx+zZC+rGwK1/4ERfAtb/d7tTWJmX9xg02Nm9IPQ8SbOP0fvFv9VKQbTP/ulA==; s=purelymail2; d=younes.io; v=1; bh=Wo8CPafjrKqXgC1BzSup6dMofFV7FA937tiriyNYXc8=; h=Received:From:To:Subject:Date;
DKIM-Signature: a=rsa-sha256; b=DfPkpSTdsFCoZtBnUaBI/xaMSwVYdlCTeXkHvqeFfNScspn77YVZE5mVth8wBxATfwBnPWAsVLZHYfC+CwocG3GNG8/t1dMDydD2CG3Fl+j6+PNEtilQFSYVCtU3HPIOQMCRjtXM2YmLRHma3UkkdBtMwA1T5z3OPw0GM8Otp3HRy0q1IzQoi9RUp0+zRwx+UJmp8gSYAtXsnTJ6MZZIGF5D28MH2JIc9rFY56e0p1acYmB+4ZqTUMk4tZ3vnMIWvWhHWu1+9D9kBKLXzAF1it8IALTeBMk+SIPMC0dkJuy+qvCf5H49+gso42cwtJouvbCgd3dJ4sS0mZqRYseDIQ==; s=purelymail2; d=purelymail.com; v=1; bh=Wo8CPafjrKqXgC1BzSup6dMofFV7FA937tiriyNYXc8=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 1578161:62319:null:purelymail
X-Pm-Original-To: linux-kselftest@vger.kernel.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 171846229;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Mon, 02 Nov 2026 12:55:59 +0000 (UTC)
From: Younes <git@younes.io>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Shuah Khan <skhan@linuxfoundation.org>, rust-for-linux@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: doctest: fix line numbers after crate-level attributes
Date: Mon, 2 Nov 2026 12:55:59 +0000
Message-ID: <kw-1793624159.027890950-307523-1@younes.io>
In-Reply-To: <CANiq72ntn6ThPz9Q6+BxU6w-x2jUQ50xpiy1_gCRi6o0peHi8w@mail.gmail.com>
References: <20261027-rust-doctest-line-fix-v1-1-0c13185a58b6@younes.io>
 <CANiq72ntn6ThPz9Q6+BxU6w-x2jUQ50xpiy1_gCRi6o0peHi8w@mail.gmail.com>
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
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail

On Wed, 28 Oct 2026 08:30:43 +0100, Miguel Ojeda wrote:
> On Tue, Oct 27, 2026 at 7:32=E2=80=AFAM Younes Akhouayri via B4 Relay
> <devnull+git.younes.io@kernel.org> wrote:

> This looks OK, and I think it fixes all the cases we have currently,
> but it doesn't cover every case one may write (like a multi-line
> attribute), i.e. I was wondering whether the complexity of this is
> worth it or not (especially if later on we try to support every case).
> But it may be that never happens, or happens way less often than even
> this case that we may not even care.

Right. I checked with rustdoc 1.98.1: a multi-line `#![...]` is still
off, and so is a blank line right after the attribute or an
`extern crate` line, since rustdoc moves those above `main` too. None
of these appear in the kernel crate's doctests today; all 12 current
cases are single-line attributes.

Covering them would mean relying on more of rustdoc's output layout,
e.g. the blank line it inserts after the moved attributes but not after
`extern crate`. That feels like more than this is worth, so I'd keep
the simple version and say in the comment that only single-line
attributes are handled, unless you'd rather drop it.

>
> By the way, why `saturating_sub` in particular? I guess because of
> underflow, but can that happen? And if it can (perhaps in a future
> compiler version), wouldn't we want to notice?

It can only underflow if rustdoc stops emitting its own
`#![allow(unused)]`, e.g. in a future version. A related case is a
crate setting `#![doc(test(attr(...)))]`: rustdoc then emits those
attributes instead, so the `- 1` can silently become wrong and
doctests without any attributes get shifted. Either way we'd want to
notice, so in v2 I'll check that the first line is `#![allow(unused)]`
and panic otherwise, instead of clamping. What do you think?

Thanks!

Younes

