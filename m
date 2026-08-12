Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC8944CADF
	for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 16:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786552425; cv=pass; b=lhdJ3D5eAc6GncO/ULXU2tfLMFrHqtWln9sDmbPnKF1Io+7WZQ75DzxM9QjurX8qssENNuzTV1ha79BmGGTyPJ9uJQiH8yzJKzr6pmk4wZfIXfki3p8syOnILzqiTozpa4+zBujWkY98+u0YQoiMOr8z4UPp2YmGB1kARuKkayM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786552425; c=relaxed/simple;
	bh=gOIsyGGYeGZsd7+1t35VENt6hUZ6tCz5k0UwrPgrJB8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NVvvWg/retkM3IxYkuAO9E2shsz8keQn9rD8V2x1H6Dm8ztmWcqqcSxT30JfLJ07K3h86abyTBmWogCdPFqkFU5qupqPH/Bo1fW6+qSVU6NTjytC9ah+6ukIMwQ4zXCxHGQK0XUjp0Rsu6INwZADMtbMUwJcRbpFKx2eMzKRamU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Al5TqyfU; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Al5TqyfU"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ccae46de39so2130145ad.3
        for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 09:33:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786552423; cv=none;
        d=google.com; s=arc-20260327;
        b=GV9kdUgLn60aAKujXjKQ9DmBPoX8Wkr81tc9ch/0TFm0zhv38/c1gn1uN+mNX2QlV5
         tzU97LxtGv0/czltyb+impGSCEINU8o/BlzMXKq2JoZvR7TdZ09AWTBgtfVv/2NXGhTG
         5F8JIQrdKd93Wz9FiPlbmF02dQudXj52R5nVE9ScThpsNUscgOex6A8bHelTtXKen1aG
         hlmsiPVXTnU6y9/rb3K/xEOQ2PlvtpC++Dis6OPQYCF/lLAqE0wvCYjI7Je0W2C2emdS
         xCA8DVTUZCS48r4kyOr1jxL5zsnxxC5Y1lHA2H87FWpHBpcTPI5mQCczQZUdgpqk0L0S
         t9ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D4SZ6u0V1SghQBdqtC98mKtc1SLMxMH5ah0RWt1B7vw=;
        fh=vUoslh1aEQOfHMeSHjloxNBexl4eu1XTZKqHOKnqaMk=;
        b=oHV3f8Ex4kBDs1GjTqwF0cz7cBjmWKGEfFopYheYHzh4T29E+f/+ogvLalnbWDUi8E
         025tSdZs79vs7bKtTcnMjV6bDcDZIMbxj6Emm1E6+nNGYNfoqjdx2KIAYNN8ckhKjVS7
         aHL5xpOBFOZ2vWYIJ8U+24+9P7OBWWhs7O5/Ou4x0eY7a/zuiL486isdUgUT8mcumfi4
         t+d5y4fswuRVJ1GWKR/ZojgmeqXiTgQYWjTVhTlZiSGbMGvErRvEjo9mPyxdV+wXg6OC
         3a33WJRQDS5OP4VfLF8/towuXJ6kVJSJ9aGTOyJuSfC0vLuuZiiCA/gd8uE93NUV2hNf
         r1Pw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786552423; x=1787157223; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D4SZ6u0V1SghQBdqtC98mKtc1SLMxMH5ah0RWt1B7vw=;
        b=Al5TqyfUu+23OQeZiYehEwCKw9h7n1GWuwvFfs5W/FN6ixV7O12veg3o/+6+ecIG5q
         gi77Jv50TJJVfBr5tK78wp8gBVgj+5Y7A46NSJQiMg9vf/b+171Ld/CV/ytLNCLuYUX5
         JGnwl6csWpus6UXO9bC2cOxNn79Q6o54bdsEtVRm7+6yYsLP6x21sneKJH7rILfD6V6Q
         tMWciyTleAT2pJLtlHf4Ke1yqhLx3FZDQ5GOYVRZdJPiPy5U/KlYo5NBcXMa/AeygtYc
         /sE48ZwkvJJt8DLXaboqm3a/tld2DEUcqAqzzQ8WWBf/PsfhZ7ZNON80nFOWRsL+Ksc3
         WL8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786552423; x=1787157223;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D4SZ6u0V1SghQBdqtC98mKtc1SLMxMH5ah0RWt1B7vw=;
        b=BhShLGHj/sUNvV0xnjBNkPi1GgJve/tm66AGNoDdYLR/WkWhqCD9QnGiBmTUxWCWW6
         l3ZdmpKWZ94BCQWRqxIb75Z/nNtXkJs9RScw9GB51TMnGimhmHr7J6RmubcFLoQAnSxi
         I6H9nT/32WtflhSbWk/8Gk0YUKrlU+8v6AsBPyDkTK3paeRh+uY564tmGHZBfLzElZwa
         dm/ny7e8JfOAfWXFnEsfT3Yp8SKhDN4Gisth15Ptiw3ffjnbJo5XBULFoYkzzdAJ0pqN
         cX/vWgYqfqHQdRw1u3P+vhQEqs0KI4bvWk3tQNeuPzFl+qMRrhjv7rbDfE8mQwDiejsE
         kj+g==
X-Forwarded-Encrypted: i=1; AHgh+Ro21QSsoipVcR2pT9Oh/htrUnfsXIxFyiR9qGpE98lvvSW9psM7riWDP+iasc1Y75CShRcxFrHOHy7Lct9xRsA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+FGxd2aIwO1+sEHRWBvFvPLnYCjNQEszXAXGfrGC7n7sMczPA
	KrBVuJVTYn45Jx9rV+k1vOMrqFHPQQWcGt4VF423ZG2GZc3k0ycaDByQ0M2g3X49mt0iA5Y3ezR
	RsMj42AoII1yeKXVkV1ZNSjC0YYUBYp4=
X-Gm-Gg: AR+sD10au4Umrzcygn1KFAJ4U0hQW50MvyXpiGgnSbrWDZ9yoiF2EN+7M2ZGEGDePHB
	B9/6e6miTpZdwWOQqi3lmLDLPPop21+9Bhl/dlCnSAgBEgu/nYJ8oz6is3dj3EeOWd9s7NZI9E8
	kgkApFfKXuZ7IkaYy3n9c8JE0d4+wVBqSWITPQKauM4UTyvoa8TmDS9kMiNR6qv0Mzxn79IOZqD
	hZPfuI+YxvArd+l0CbAX3SJmL+3/Wb2nHW7M7DtR6FoxsnBa/mT6cISC4eVrEwHya197dKDjyo1
	2oj2HbQAMwQT6MpWegNu7MgdsKB3PQPedAm7jUq5wALY1lTp5tjF85ljHqvuxC+T9XMHlJFvR1Q
	1oa6TsP1GyKt+DWGPAZ6GKEEVLektZsmzSl+qVQGx86vmPmlXVBug5RznlEv9
X-Received: by 2002:a17:902:d552:b0:2cf:9e90:8be with SMTP id
 d9443c01a7336-2d3456e7622mr58880125ad.4.1786552423044; Wed, 12 Aug 2026
 09:33:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811-fix-fops-owner-v10-0-7e71776f9dbe@linux.dev>
In-Reply-To: <20260811-fix-fops-owner-v10-0-7e71776f9dbe@linux.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 12 Aug 2026 18:33:27 +0200
X-Gm-Features: AUfX_mzHM3XF1m8TGRbbbrVs79_o_CCgi7jI9gpogE6umN7ICq8ixcdhm-skrqA
Message-ID: <CANiq72=bhfofrbdf1qeA380-eWeKj5yXhC0NzaU_nbB9SpxYHA@mail.gmail.com>
Subject: Re: [PATCH v10 00/10] Fix missing fops.owner in Rust DRM/misc abstractions
To: Alvin Sun <alvin.sun@linux.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Arnd Bergmann <arnd@arndb.de>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Breno Leitao <leitao@debian.org>, Jens Axboe <axboe@kernel.dk>, 
	Dave Ertman <david.m.ertman@intel.com>, Leon Romanovsky <leon@kernel.org>, 
	Igor Korotin <igor.korotin@linux.dev>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, rust-for-linux@vger.kernel.org, 
	linux-modules@vger.kernel.org, driver-core@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, nova-gpu@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 8:41=E2=80=AFAM Alvin Sun <alvin.sun@linux.dev> wro=
te:
>
> The series moves `THIS_MODULE` into the `ModuleMetadata` as a const, thre=
ads it
> through `#[vtable]` to set `fops.owner` in DRM/miscdevice, and updates co=
nfigfs
> and rnull to use `this_module::<LocalModule>()`.

Applied to `rust-next` -- thanks everyone!

    [ Fixed `clippy::undocumented_unsafe_blocks` lint by wrapping with
      a block. Added interim `#[allow(dead_code)]`. - Miguel ]

    [ Fixed `rusttest` by adding a dummy `LocalModule`. Removed interim
      `#[allow(dead_code)]`. - Miguel ]

    [ Rebased to avoid the imports cleanup patch. - Miguel ]

    [ Removed Acked-by and Cc. - Miguel ]

By the way, I removed the Acked-by in that last patch since I think it
came from an older version as a series-tag that didn't have the patch.
Please let me know if I should re-add it.

And since I was editing that commit for that reason, I took the chance
to remove the Cc because Petr already gave the Acked-by which you
collected, so normally you don't need to keep both in that case.

I hope that clarifies! :)

Cheers,
Miguel
