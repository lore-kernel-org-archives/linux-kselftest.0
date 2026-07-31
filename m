Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E164F31F986
	for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 06:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785479405; cv=pass; b=XDhtlu9xe6EzMvbo8IF9/E23EI7nmMIJ0PpKrfV41TI9Xz8shnanrWoxw/dAgoYxFvzPH+5Fc+atK/3MgEpRhB20XyABgThdKYOvBxj3F01KDO6mZ5vlM3SuLPWvkS46ahXCbyt+FwbWmTeDiFNNPfnkYCoQZw/zN3G2wnCdQic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785479405; c=relaxed/simple;
	bh=plYqvJikpm2phA6sJTWH2hDra12ZFHqZ7KqSsbbbx3E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uL8kNlFe/7kANx7N4BNJfUU+si4YsR6d+spJGz+nTaAW6NL6Dl7GJDZi8+vtPjm+OXN5ZM3Z0oDNU9U3u/dBtiOQVzfogSmEAm5K9HYfTsrLy4J3ncyAlnmR1oM0Bt3hRSz3HESk1y1RUTUJhJoMHcAOZ0JRkWMbQsfH2q5WF6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NWCaNt6d; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NWCaNt6d"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ceeee8c46bso1190445ad.2
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 23:30:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785479403; cv=none;
        d=google.com; s=arc-20260327;
        b=r5o7I4cpUdgMfWshUaEoKIke0d6H18X+zV3MgUf1CIvXmTgDkh4XE2xGFJzqrO+NZl
         N2S/+0tmbmFxANdTQeJOBV5ockjsnGLtzqtmfMHaNIeOjwxFBchp1sOdnjgEIqgNhtEE
         NRZOaT7Volznpc2dvwMsHQnJkbNfCnIqVUJqdX36jPsbQrUF9dpD5O6lwpSHZTorbFC1
         PnzQ+DSnLgYt2n7ofV610h0ZPGyNORWym1zvL1tL9dDDfFfg0klF1N7czl5CMHxgAyaB
         P70O3U06MENw8oJw9wGVsREIhtXyt1jwn2+jBZU/ntqjFPJrIQPVPOMp0esaW1MVyX11
         L5PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=plYqvJikpm2phA6sJTWH2hDra12ZFHqZ7KqSsbbbx3E=;
        fh=ZpFTau+IVWOHgM3w9eerIQeV9nN/Cy6RBQWG7rJ+rW4=;
        b=BSH3ggxujwDiBeDJWrYaBQnSxstjRsZoGv2S4BoQPfXZJxjQON9jvSXHesAQiAdZMz
         YMBw1kdBYFsrRrmpZAxbJ9/SBGrgmqOmBmdOMpeJRV+FZOyL65Z3vZvDgIWOv0EBWvNO
         cec1f/DM09VElgpa73Ksn36SxEQIuRFoe0soYmgSOLeOd6J2jbxUyqM3NHd9PquKWmtT
         pzgFOzPdTwfDFzrRhpiwN6TuKfRTNcb7JZdmBCJAHNErhCbnJIEu5JfwTsPFULkbif7P
         In/55VshD3E0FTH4+8WdGmLRJ2d8HIqm6YuD5zs88o5DoVCNckqfhvXrL4pesNwmCNDX
         NSCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785479403; x=1786084203; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=plYqvJikpm2phA6sJTWH2hDra12ZFHqZ7KqSsbbbx3E=;
        b=NWCaNt6dNgAGARtRG0i87Zg/4MX5m8mmYfHmRZodmPVVojtjaNus2ym6gJYtL1Pd/L
         AOv8wQRegNwG+GTWDMU06KuMRMWo9BXgtNKT0WdD02cXI6YUfx3v6sR0VOs9hagIJ4w4
         vnKyIIdeB+5YOvum8D393ArHcLC4LBT79fBcIgbLi5vihAt4TNMsu4hXeFugfhN4ySHC
         W5nQEtPsoLJ884H3F4mK4Qtrrd1jUgKr9KCr4ehF1xIV8/txfgWipTUtPYDapxLJ/34I
         F6/4LcrSYzE7iSczVrekyvtA/Ww6xZ6wYo3NFEDB9G7amXtbcR2IB4gYc02nSfWbY2eZ
         DKpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785479403; x=1786084203;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=plYqvJikpm2phA6sJTWH2hDra12ZFHqZ7KqSsbbbx3E=;
        b=FLfKSNfWzTVE+auI+z3x8ZvGjxhNwGD0zc3JVe5nN6K3t/dNAgba5zAUj/Gydvghg+
         mHwM23Vjxa8DPfa2atKFhJJq40NPJkFCVEdUqTKcav07QMBYTxTtSXkLL8twvhD9BOJY
         zSVlf4yJ7113PgGN2e6x3uDv2qan4oOM4HV/e7XZRSlzddNbCdS0fxwuuiL36sZ2VZ6J
         DpivLjNvjf3cpXsVeBR73wBojZ9o+gidwik9zWMuJItmc0tXVawkw1CsnqMZnS7r/g9T
         Qy0V13gJumuSXvbKu1US9sbL4DzBHqwqeb2oy0X+9zJNjz3j5dm4UAwPABRm5mNQoAEC
         AJdA==
X-Forwarded-Encrypted: i=1; AHgh+RpT6ujW+IZSx1p/wfUMzdgMoeX1JL16ML120G4RpNUenhr/+tdosEocfn9u/ANxzo0Z9Dkh3o2Lf2XK8Y+op+k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9zMf9doTP/VVhH/0GIiIPQPXpGVlpuibPK1UDKBewN1tQPgxw
	Z/rJdaQ+Esm82vAZ8pVVt+BbaWz6FGpF3zNk5e54EBmneQWpbevo8ZMc0m1TuB0nc/KlgZ/9vHj
	Jx9vadaMplOXKgWcnUvitXGQSsBl4+Qs=
X-Gm-Gg: AR+sD10qU+mzncVjLDWLsK9QKqpsR7C16PD3jbfuH+Nc1w9U3PkWpr/xPRHh4R5sovC
	/NqusM+nl03bHsGVHa369uF5jzfjkyEVNbjcYOpfvYk/jGZp9xs9edCRWSk8FixgVib2G1Y/KKa
	gbUZJTQuJUX8p+AgKXIQqLOJUsaLQcok2qfx+VXofmhKx2VVREtjncVBphDo2oFIP9R+/6Bmnrd
	yBB8kLAj00Wzo/QKFwVB5wSonlxgGm1qcoiYbH839NxZcMha2pDKvkutp5Xx6xTKwbEFrTgdv7i
	/yTMUuPKIUk8DmDa+JiozomUwVAuOTqZiaMFn+TW2O8PaUoJQyTGd+d9znlzhpSqU34QuGgD7bm
	SC+6A2fk6+hiDAUiQMbhHd7dyG0IUrWheKfvNp6p1EL952TWhlpY9PrISHEMo
X-Received: by 2002:a17:902:ceca:b0:2c4:397:dd7a with SMTP id
 d9443c01a7336-2d046ef0048mr13066585ad.4.1785479403240; Thu, 30 Jul 2026
 23:30:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260723-fix-fops-owner-v9-0-c1c3af7f7bcb@linux.dev> <a9dde63a-5f2d-494b-95dd-7567879de38d@linux.dev>
In-Reply-To: <a9dde63a-5f2d-494b-95dd-7567879de38d@linux.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 31 Jul 2026 08:29:50 +0200
X-Gm-Features: AUfX_mxTwoRg7YuTGPUdUHKCs3gSMN4l-jXSn1vTLDoexparxESqmVPaSYuvKs8
Message-ID: <CANiq72kkuKsRAF-r+2OyZbjjgvC+jvqMSXR=LgmqTNRaWQZ-nw@mail.gmail.com>
Subject: Re: [PATCH v9 00/10] Fix missing fops.owner in Rust DRM/misc abstractions
To: Alvin Sun <alvin.sun@linux.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-modules@vger.kernel.org, driver-core@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, nova-gpu@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-pci@vger.kernel.org, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
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
	Carlos Llamas <cmllamas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2026 at 10:39=E2=80=AFAM Alvin Sun <alvin.sun@linux.dev> wr=
ote:
>
> Back in v3, Gary suggested this series go via the rust tree.
> Would you be happy with that, or would you prefer a different
> path? If so, is there anything else needed from my side?

That is fine with me, but let's see what the modules maintainers think...

Luis, Petr, Daniel, Sami: what would you like to do? This touches your
entry, so it would be nice to know what your thoughts are /
Acked-by's.

Thanks!

Cheers,
Miguel
