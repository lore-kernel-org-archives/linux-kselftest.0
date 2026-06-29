Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B023403FA
	for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 09:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782726235; cv=pass; b=uzXx26IMWFnlWLJE2G06HrieiBsCczCTtEmp9Kbj999MrkVpmO09cbtwri2YgGJOwMlmN85BVuKTK1vSX71fStUq3WWF7nKIRw35wE2Dl88v0wfKXVH6Jskhh+fO9xarz5Iw52pK1orB332bb6ju20mBV+rkH01Oby36aLaDT4k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782726235; c=relaxed/simple;
	bh=JfkKFegQY1WhQWdK5D9ZTbBKn2OYqD8jwYnp6jmR+xk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T3yjimEpJiDQ/iUjlsqy7qHnr1K0pbmkALinyt7HZ6pH9aPg9CNGktf9wWoEu1x5zAAJJ/du1MjRhE4a95Vi1V7oWTOeGePhPXE3q8FcR+EwAAE+A1K/DqgYL0c3uIiz/ijHL54HQUbU7hh2ZNj6buKcv8IN66v2jYPR7B2dag0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MCj8O26y; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MCj8O26y"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-30bb87c90deso362083eec.3
        for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 02:43:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782726234; cv=none;
        d=google.com; s=arc-20260327;
        b=eT3VMBn4xrkxQgEJOv17gSkCtEgHWFMQsPgki247NphEy2Y6CqglHHx7+ybG/S+Wzw
         pt7rCgl+BCcp76PKjujj6idHeO4DceQ4hQTk7Xtm+wE0IfQJxl6iP/3MPE+e+IAhf+Oe
         1+WX+PMc+NtFzIXIIvwNyAH/nPFX8YbIXMoyY1fKuVaxrH9O35nZsPQ+8+LNMbePpeMN
         H2Sdm1t+KPcQt0mV+GUf4qEqsFaei/+Gyra1EjSPzVaN1wmWfjGZfVmU7ozLrtNdfYjw
         WWQPlOB0oUcdjI8Ck6vN4r48tJyoIEP7tc35QS14EaCWVlZ59ltg45Nu/+qCCmnn5lpS
         FbTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0VUrCflsEpPc8IznCfEN9hlFAeMr5Dc+AV1DM4Uw7YA=;
        fh=C/gBSitWnBE2SqtEkxBM3RijXiil9xqOEZmTF/gAwxY=;
        b=GcTLWBe7GDbzDMsfL60ol6Dl4p8+PrHtdd96v9ZZyGsNQb+mB+yrPwf4EXp0r9Difd
         WWFuNKGccvt3c2qde4Se5kzw85Ews1jZb4OMC3ikrPp7B/SuBgc0JCBXeVNKqmKtetij
         o+hD89qQwpgTQjONO3zt3FefARBv6PNDKboOAzgUg9ld+CIssHzJyFN8SGJMwu0GU635
         GnCofN9iJI5V7KvZL+6CNVY9FIaKMmcU+279ti9shNGpHk0pMDrvxfqool0gL0fJeoy2
         ewJUAmvIwb2dxbY6fIvn2RI27H63L4kKJjs0zkmAXN1wgm/jc6MaARPAX5XRNoSo+V3F
         N/HA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782726234; x=1783331034; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0VUrCflsEpPc8IznCfEN9hlFAeMr5Dc+AV1DM4Uw7YA=;
        b=MCj8O26yWjEu59btNiqnbSihshsamziT41w0Ia2THHgQHn/vJ5OGdLNmQxnD7osd/B
         LyoUfaUJiIyUiWqBg8iydygpO7CeWuWocj3RczbApBC45nE3x6oxucKu3tts/uacv+ef
         61ffeuy0Ww0qz2GLsL86ztPeiNUsp+ZU1i5RVSrN7CuOmtvE6WGoQly1xhrt+ynpHqGt
         J608LcAtVWbcZ9lbGdQonii2TAF4VRVL5rcc+y4rn50EoEy5bMg06g7/4gyioHJknHhh
         wutGzs+zvSR+NIEPLulqii4o9M1fz0HHtZBehlePICHb27rJI/qhJpFdVLEjaOEian4j
         /nbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782726234; x=1783331034;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0VUrCflsEpPc8IznCfEN9hlFAeMr5Dc+AV1DM4Uw7YA=;
        b=NQvdlmvxE84V00sTMbk0OKy7gqVmHjBbDKWZRK+ilIC63unctWr30+vBTpwd0hGX5k
         H+w27WjaF0x3KQWtqzn3YEN+HegfNFlva5GM6QwjPnbwwr/srll+KqrEQGDzTCQ56mIi
         BuVtb33LE2560WwoIS7+R3pM68osUnizrClORph1HqAcGlF7mzPCRhf9Qb9u5KzqMwAx
         PGYtCjedB41fpixX7gA1DIG0Kghg2FwwO79yE7obg1RVJtIhrRwlfpLXnAUUwV6shPjU
         2FrRv1uTNyqPhSx9sp4W+G+7lzEoHoubWAnmnX9JMFY49Yuh+5g8DN2zoSVeqit5Q4We
         nkSw==
X-Forwarded-Encrypted: i=1; AHgh+Rrr6bh5kSSW43JQIXj5Zwbjn6P7awC1jnK9EoaZ6FkxM6nkak3IHogJNjyS0e8XDq+9FTg3AnE8B4+qTFPVEWo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWq2qLruLjcw9KRR7/05OKPH/YaJjyAYf7bLD6nSivPPVd7tB0
	0PmUxcjwoQkxeGUcDJ+mK5EvLTX/1C7e41E7k5K/bVvsxBn3EWEciD1+tG4eqGteY6JG4if4x6i
	Z/5Lrb2c2g/WQRXP/y2kdJT/6m6Z3GC8=
X-Gm-Gg: AfdE7cl2P3Nzmkgx9+bVuoV9OqvhMgZkCP1jfZWHqw4VsSX93/yu5H7pHzU9MGKN6Ul
	UKOGvUYnBZzjv3+gmyZxDik2Jv89RwMzn0FxOUnIJq1DJs+assygvTGIz+MfmKhtvady1oKHbfG
	8Nx3ZcBju4ZDYmipUdsMhZZPNj0etn17ENJYWktbM/2HwMl/eGUKpjG5pXRKuD+5Tls+wE+C2C1
	EPK/WknBiILoMOjbOc8DcAMdzPwZSXD7S3RO8eWWvVpFtOHRnT84+TKqmJyM1Uzs88s8xBrHTNs
	mgcbIpqqwDOxWvfES1F4VSZbasbxd4SsOwCTJH/LiMDDo7b2FrHlUyBZ16fDDChkGbn6u4hKc42
	X8/Xm1bHweAoq
X-Received: by 2002:a05:7300:2327:b0:30e:cb91:657d with SMTP id
 5a478bee46e88-30ecb9169efmr1264901eec.5.1782726233809; Mon, 29 Jun 2026
 02:43:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629-backport-cfg_select-v1-0-388d5d31d9d4@nikableh.moe> <CANiq72kG8k3mk+Xjr6q7aKg212QUNtZk5w4rxV=UGR5UXKE_ng@mail.gmail.com>
In-Reply-To: <CANiq72kG8k3mk+Xjr6q7aKg212QUNtZk5w4rxV=UGR5UXKE_ng@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 29 Jun 2026 11:43:40 +0200
X-Gm-Features: AVVi8CfGwENSw9fJYhMjSNirdJAC6-UBxvIKkCSq6p_t1bQ99ZdvDWf23-Hp31g
Message-ID: <CANiq72mDsKVs7rE6XYJ6iQ=h7=HFfparWzn-xMcJD++p_HLq6g@mail.gmail.com>
Subject: Re: [PATCH 0/2] rust: kernel: add cfg_select! and use it for
 config-based selection
To: Nika Krasnova <nika@nikableh.moe>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Yury Norov <yury.norov@gmail.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2026 at 11:38=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> For instance, instead of waiting for the MSRV bump, could we already
> use the upstream one since Rust 1.91.0? That means that we are already
> sure we are using the upstream one as-is.

By the way, this also applies for the docs -- we will eventually use
upstream's, and thus it is best to try to match the docs too.

It also means we probably want to put this into `std_vendor.rs` if we
are going to copy-paste the docs verbatim, even if it is not code as
such (no implementation upstream since it is a built-in).

E.g. for a similar case, please see:

  https://lore.kernel.org/rust-for-linux/20260406095820.465994-2-ojeda@kern=
el.org/

Cheers,
Miguel
