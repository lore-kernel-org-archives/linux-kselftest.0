Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E98C36CDF4
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 11:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771933458; cv=none; b=uyU45IE/iYFGi+4nebbDDZOVsitaHWEOfANb/lw7hw/E2yFkuKAGvzc57mPYW9MRrC2z6qgGQer565Y8N+ynhmuxAvZ85MlANWFArhHz1mIYLmOA1FV2ejS+DyBCmGnvezB6/HQJoZMxH/kME3Hmm/WRXXnYklIU+6nkl9Icbdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771933458; c=relaxed/simple;
	bh=/yhCfYp3uMxvk+kNCDwHyWBEWKd/5Wzgl2bOPy7rkU8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fgRsyDaIGNHWNB92M6oxb/QZnQKZ46cGj5FjR1TmUhKbixx7LZ8ZwPwwZRKfTM4dTazfM03BgRg7F4tJbnyp+ePpKPYTSRHoMNto5ak+DyD0OBMHsIxAJIr8+aZTgyiukcHPgzhUt5cZmbWeUzIHGhObofGcJ1dyT+1eLBF+4A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LV486YmL; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LV486YmL"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b8ff07df5e4so513928266b.3
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 03:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771933455; x=1772538255; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3ZBFlb6hySeXrec0X1VAfrRDStvY9nOhd/jaZZEDq/o=;
        b=LV486YmLf+kUPo9DSeYH2qyATsZyUO9LCA15JTwwjlauJNORoOnP0GSnEa8u2NwVSl
         lNcD76znaW1zlhGj0KWvqEv/xOG3jduPYm2cGouc5va0f/8LbsX8gjoLDYy8uwxdnO0l
         EizQ/Z1vVdYpZIJZnf75H8aMr35F5jdOMb631OnlQOC/PFtO7sobfTUS4HvvZClu2z2u
         sQVqZzmOpkNTymaiMQHpzI3Bt+U5+iqQqzIyQ2tuTh+a1hhQjAJV+WBnGc8wLiZ/cJak
         ZkKZo1B1vOQL2kIJ1t9JjYTuIvytkSASNPGz6WWv8B7rPMRqhyjmNuY0TOq62pB3gXUR
         3JIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771933456; x=1772538256;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3ZBFlb6hySeXrec0X1VAfrRDStvY9nOhd/jaZZEDq/o=;
        b=pO9hO73l63v23uE8V8jd530R/+ExQX34i21q2uPgkIm0NkczGy+ZU/kLqeF1m64tD7
         57ajD12CiBnPXO3BEPWUcX0sbCz7bJabTDbG5aBFfxpKEcdgJCkB3qVsRX2lqriE0E2A
         QA76jws11XDXXiGjRGgsb+NGQ9hT1gBEicLsfubZBqrCd6buPZ7HGRqLxzp+Hbkhzswx
         j6FwlFmiz6IDmLTIqvLhiU6liyUwxiSHaGlVB8lKQzA9dM4cjiLOGaNApCAMm056fn8x
         CTo+Rb3JqYLiq0b5NHWGKlFr1RwBoXcFJZnjKD+sMPT1H86OzEyWoMS4hziwrrf8S6kv
         rncQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwY/MiUspVaEAtch9svgnkkapX9mYdDht6ayIxhCfVEKCT4bt7nxhh+td2ZNGATh5lJUEzemYJ51imcchv9LI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPkxNqLRV9cDgattPn2ExC6opz+VD3ETXJgpmKYPK+ZNTQ2ypA
	6ibk1+ygfFF6XTBQddwNWRj/iQmJotb+DtEnx3aQ+2XBsxZ1zKAJWsO5UYWwlr8J2i4LvwMAPmS
	DWBgcSsNKqKwq5f2c5Q==
X-Received: from edxk21.prod.google.com ([2002:a05:6402:12d5:b0:65f:35ce:f5f7])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:fdcb:b0:b72:58b6:b263 with SMTP id a640c23a62f3a-b9081bfe5b1mr618915466b.60.1771933455483;
 Tue, 24 Feb 2026 03:44:15 -0800 (PST)
Date: Tue, 24 Feb 2026 11:44:14 +0000
In-Reply-To: <20260224-unused_var_err-v2-1-337f9359d98e@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260224-unused_var_err-v2-1-337f9359d98e@nvidia.com>
Message-ID: <aZ2PDg7YcIZNMvKU@google.com>
Subject: Re: [PATCH v2] rust: kunit: fix warning when !CONFIG_PRINTK
From: Alice Ryhl <aliceryhl@google.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
	Rae Moar <raemoar63@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Feb 24, 2026 at 07:37:56PM +0900, Alexandre Courbot wrote:
> If `CONFIG_PRINTK` is not set, then the following warnings are issued
> during build:
> 
>   warning: unused variable: `args`
>     --> ../rust/kernel/kunit.rs:16:12
>     |
>   16 | pub fn err(args: fmt::Arguments<'_>) {
>     |            ^^^^ help: if this is intentional, prefix it with an underscore: `_args`
>     |
>     = note: `#[warn(unused_variables)]` (part of `#[warn(unused)]`) on by default
> 
>   warning: unused variable: `args`
>     --> ../rust/kernel/kunit.rs:32:13
>     |
>   32 | pub fn info(args: fmt::Arguments<'_>) {
>     |             ^^^^ help: if this is intentional, prefix it with an underscore: `_args`
> 
> Fix this by adding a no-op assignment using `args` when `CONFIG_PRINTK`
> is not set.
> 
> Fixes: a66d733da801 ("rust: support running Rust documentation tests as KUnit ones")
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
