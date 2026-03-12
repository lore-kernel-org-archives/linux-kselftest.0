Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1B03B9D9A
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 13:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773321885; cv=none; b=LH6w/Rh0bdsq/wWBa3TMIaZ3/B//wEfb9xmNE7nrDwOYGCFuMxs/M3mtuaych3aFqPOcbwUPhk64jy2FSd1GLzOEnRHImenqxhLxvMvit0CqtP+g+AEEAdFJWLP2qkfZoalBHVT19F/kG2dn5bReNpCoBg5+BFTWagkWbxZS8gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773321885; c=relaxed/simple;
	bh=Q8doE83FSgGqJo9tqkDQkZXiCNnh0nOsXtwuJKWvUSA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WIfdB3f9JXOhr/0yyNoVm6r73TeirT1EElFeWbJylwQOjGTGkUImMABhDURcKsddzuOvb4F/ZcQLuqP0Z+TMdL+TOLxAC8JCfUwmGdJ4JSnm4n9GpHXW7kefrs/lsBlVEqOVQ8oN2pxeMb3sBcsTS8Dgva6xH8N+L+7sCSsXry4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hZj+Rq/4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hZj+Rq/4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24544C4CEF7
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 13:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773321885;
	bh=Q8doE83FSgGqJo9tqkDQkZXiCNnh0nOsXtwuJKWvUSA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hZj+Rq/4je0Ie44lrJJPtaY6A6n/3NzxyR8LqY6UfeNlBcI3qou5Q45tclnmTzRdi
	 rmqikziPTsxV7NCeZ5J9dHeZOAe8JHO4EAmWpae+rjY2lAHcgsGDp/cNeqABggj/pT
	 vTEqtbiy5/sUP4mFNGVtZiMbXe5rEgt2HHfQ5c1A9imFux7l+gHc5hWGyyQOmetX1x
	 arss5hwEqAdX1KUlZQYnTojvFXjvfnVLYPTLLLUaJg1N8HorjGrJ+i8FNujdCobS//
	 d44TinP3fV7A47zkWpxK1i5VwfEUW80fTZuyDPjCgMicdbTnC5EHCk8oAsLWqbHN79
	 XtuT+PORwA0nA==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-38a5584e31fso16803221fa.0
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 06:24:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWmpsB5VWlyEfWtx4qxyKCm62p+oh6D4fI2lv2PbHSI82kjXs+HgErWW/JZCpqbDd2GWA2iysInq+WyrGpng/4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDF3yU+ciZ9s+hTRpaRxL/bCb6+DTjoLtGQ3EdzRR2/0/qL+6n
	KeCJFniwowkLez2q/7hCFH/XqZD1ufd2MK22KHvJOJaZ0uwVCUdgYmQ6c4L4iIo/09D9FiAcenu
	+TDxiJqH9MpBiSKEKfzZlhUsZm7EAVxw=
X-Received: by 2002:a2e:9e05:0:b0:389:e501:41bd with SMTP id
 38308e7fff4ca-38a727cfa94mr9501211fa.6.1773321883333; Thu, 12 Mar 2026
 06:24:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309-cstr-rename-macro-v2-1-25f7de75944e@kernel.org> <DGZAOQT96RNJ.1QUVUW1UAMT3C@garyguo.net>
In-Reply-To: <DGZAOQT96RNJ.1QUVUW1UAMT3C@garyguo.net>
From: Tamir Duberstein <tamird@kernel.org>
Date: Thu, 12 Mar 2026 09:24:07 -0400
X-Gmail-Original-Message-ID: <CAJ-ks9kp1yDQi69DcXm4-xzpZ7GmAr4epOgDMNbeaE+5jUeRsA@mail.gmail.com>
X-Gm-Features: AaiRm528piwno2nUHFEC6iwNT4qIpgi4YbDyfttTJ3QGo584EMhx5tuJGMeVvkI
Message-ID: <CAJ-ks9kp1yDQi69DcXm4-xzpZ7GmAr4epOgDMNbeaE+5jUeRsA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: update `kernel::c_str!` documentation
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Breno Leitao <leitao@debian.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <davidgow@google.com>, Rae Moar <raemoar63@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2026 at 1:57=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Mon Mar 9, 2026 at 5:01 PM GMT, Tamir Duberstein wrote:
> > Now that all literals are C-Strings, update the documentation to explai=
n
> > that use of this macro should be limited to non-literal strings.
> >
> > Link: https://github.com/Rust-for-Linux/linux/issues/1075
> > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> > Signed-off-by: Tamir Duberstein <tamird@kernel.org>
> > ---
> > This patch completes the work of replacing our custom `CStr` with
> > upstream's.
> > ---
> > Changes in v2:
> > - Drop rename, keep only documentation update. (Gary Guo)
> > - Add example of misuse to documentation. (Gary Guo)
> > - Link to v1: https://patch.msgid.link/20260302-cstr-rename-macro-v1-1-=
a269fe4dc3f0@kernel.org
>
> The lint for `c_str!("literal")` now lands in klint:
>
> https://github.com/Rust-for-Linux/klint/commit/69fa3560e28031faa8c5a93e1a=
c95cc2b3689306
>
> Best,
> Gary

Very cool, thanks!
