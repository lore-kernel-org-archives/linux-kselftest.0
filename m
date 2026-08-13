Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B553F12E1
	for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 09:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786613784; cv=pass; b=jjoe5jy5jLcWHInT0Ltr47SzqJbUOBoZCh08DkrCyiY1KFC3DksKET0tOgwIjNNBM81O9ojk24ab2Yr0mMWNXth/AovwdnqHZzRgp2kiy1i83cwA04F5FlC1mOJJOBvhudVZUlDKzo1knfFkampGPMHx5lwYcUTaYJZBj5Q19cw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786613784; c=relaxed/simple;
	bh=I9h0QULojzau7syX2ptB1YiILa8mj5wKL7cDn/JLX6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OgtKF0ZKCSe1O6cn1QW29arzqDxTB9UK9/LmVTbzsZiBHM+D4qYAB/HAfwUwasbg+6U9iGoRJn5nDP10Z8Utn5z7YyXuRpYtPDCNCv+e3+6BmK3JBzeaw0kP3XFccKvwS3irdNM6OrK1mKHI6Go0+paVmcJzJXdH2hNlwbVFp6Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hLY20tq3; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hLY20tq3"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d01548ac96so3669675ad.3
        for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 02:36:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786613775; cv=none;
        d=google.com; s=arc-20260327;
        b=PD3b2hMAUdb7kXo27aXU4TcKQ1ofvldcLv1VQ9pcVEmQAF1OQB4Rt02GP54rIgtFDt
         2QLI/bN5q/ztPy3N1QtLxEAspneyapwICoqilagIrbxTz79XzIvLKo7aJVBbS3zET8ot
         sJJWvtEEWJ63638Jjcx/AkwL5LY2Kp/rRpuOnDemEiXqVqksKr9oT0/ceujbwHGxnZOE
         CFr44GDpQB+T2ouKyHIblKz+zc8Qtw/pi9yhedBP6r7smxkjreBhimLDFykphwCBXO2R
         xPbyS2r57ogMwkrVQXbmMGdw/O8+I/VQZvdsYzhCDKxa7SSxmRbksw6A1OOVkQ6zAT3O
         hb8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I9h0QULojzau7syX2ptB1YiILa8mj5wKL7cDn/JLX6g=;
        fh=y2r/vsiWLcqlRb/tvr9DfmEohddbIt2uytuIx7gUDeA=;
        b=YfaryJ7bMO8SLqGwbHa4dpb6PGVTOj+zeAWGpdrOXc74CJ1ShNV95MAWw3Z+NJAM+7
         lMJLpIjpQZq8srl7BsIBuoWDKgEI6Xdnmp8xEySkhRNLxLMKfbyq/bxBoMMMmLBEp+Nj
         w7xqCUC33W35KQp8wezF2yXbzuIbGt0ka6XtnP1OK09uPLcjXJtZTXVFoVGfAVsdvBbE
         ogikYeYoxGqSHwPZ+sbOcS/U73MgyDv2FSzB8tl1Nz0gndni6MHO22r7bSgK5tMXCfiD
         5/gsMUZZx7FYyteK0pSJi7dMWxiinRCcg415gdwC+JTsExh345b6oqo3hmwn2/yrfmRZ
         h+Lw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786613775; x=1787218575; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I9h0QULojzau7syX2ptB1YiILa8mj5wKL7cDn/JLX6g=;
        b=hLY20tq3DTzgOPpU2TWFvqupEvw6BZf9j3keoSE+Gba2EpwLBOoPs3SQcPLdhbHOQd
         av4LzjQ9lYk8iOzG7fbP90+/67JTKwJKjagYjTnyBsp7LINLmDMXAMkvWpmAAwVUvpVB
         WOEJ5hPHiPAW5JflzYC087QtbgUj9OaqQKBUyQviZTqRro+AWpjLp6W2TORQUC3zlftH
         x00J3FqT8MvEhq5XipmwYmYthJ2Z4yrlDkTn3YRtrL9UiuQjU016jZXv5tQqSGMfeB1W
         CUN6JmXZU6P23klRsBB+8cEq/q+V2fmSeWpK4LPNLpfnOwggw5yl0cHmhsqlOKZT9DAk
         1v2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786613775; x=1787218575;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I9h0QULojzau7syX2ptB1YiILa8mj5wKL7cDn/JLX6g=;
        b=nJne2D8ckTTwRRelhoQgN5gJeMo2jiBcnGrv0jh+hBoshDMZchtZBl7kdv0vCBDW2J
         eyl/3+ccWjAKfuRxzmOfnTBLYne0YaY9G27vd0qQGTfwdzWePfhalocHy6BlOXsMIPgM
         ui6trKJ+GWYq7nRp+ZtaO3fxYELngow+hvfc9Rc3bbuYSBND/FbIyt2TXcj8jQsW/8H3
         S3VvI2YPpYojO5MmZxBEHThcETY3mROT1yCwyiXgzr4+DnxSA6KjAbl5sv0JhXK7r+Lc
         QeARyv5vMLelhKkXpqBVB4eUo14vScKYYBXGbffMG3vVhv5WH0sLEvnnxqfMdDOzswb6
         waRQ==
X-Forwarded-Encrypted: i=1; AHgh+RpgqeAjj8QBk/ZTqiH/qszP5WY5k1dwvBC3ekAmahDLRK/l0A5+f9FWunfyrZxyC/NEIrgepxqCItuXTvBX00M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx52FcQZwwO3TAR0CQ1X0Pitn+4OGHistP6f2rAH36+MbQYe/sN
	fcj2PK8wtiWIa2ST8ln63BNViTXTRBrmwiqP1LPTGtFW2aefEH/QQgp3xRRq2XMRvdi2wDowk6u
	jko7xije/g0JDpYaNsy4fJf3voYimcuo=
X-Gm-Gg: AR+sD12+NDjsgnWCsfk6xfnI/ZQgKzpMqRX4JCfKZoE9R+oZN4WQfhaQx+Uw4vHZtr5
	dVcfW3l4C+AjW0Se6plVxitbeBCoOAFzgJWmhJHqo9DjJ/Rl6WyUk6G67HQCgIZ3djxhtigt9LW
	a/2RvIMr3hWxKioFqmoYcDQ7Sepw4w7DJbus7qmobHv9cPV7j84BiC+gCht64eAbfpZiy3Q4Gxn
	iHeU2cSSboVHyTFLnLf/VxUpOAfpdXAgYTGQs2/Tzeied513RhClfgI4tr20cusolPcLLVPI8HF
	+jOO4gkTKayWPjFa4nHlTSAgwGxubGoFmatfF1GQ6al1fIUe+vHbLILlMOJzVThoBXwWD72O9n2
	OSRrBQNAS2IfM72dTYrZ1EHWIDfLPESmU6dRfx7ipaA5WRRfKZhJyjzs4Jx38Xpu+wXw6q/w=
X-Received: by 2002:a17:902:ea0b:b0:2c9:fbde:ab68 with SMTP id
 d9443c01a7336-2d389b9107fmr28401875ad.3.1786613775343; Thu, 13 Aug 2026
 02:36:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811-fix-fops-owner-v10-0-7e71776f9dbe@linux.dev>
 <CANiq72=bhfofrbdf1qeA380-eWeKj5yXhC0NzaU_nbB9SpxYHA@mail.gmail.com> <DKNAS52KYWLD.M15VEC6U0F6R@kernel.org>
In-Reply-To: <DKNAS52KYWLD.M15VEC6U0F6R@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 13 Aug 2026 11:36:01 +0200
X-Gm-Features: AUfX_mydrO4nx0TADc_1KF-ELy8K1d4zi4yvOYINpS4bHvyjdnsvoZ1CepMueE4
Message-ID: <CANiq72nR3K9d0Y--FyUm1yAkww2LaAuYQZ3yHXjYxxfztgMMYw@mail.gmail.com>
Subject: Re: [PATCH v10 00/10] Fix missing fops.owner in Rust DRM/misc abstractions
To: Danilo Krummrich <dakr@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Alvin Sun <alvin.sun@linux.dev>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
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

On Wed, Aug 12, 2026 at 11:53=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> This series has a semantic conflict with both the driver-core and the drm=
-rust
> tree:
>
> @Mark: When you merge driver-core-next after rust-next (which I think is =
the
> case) then you need to include the diff in [1] into the merge.

Mark: in case it helps to make it clearer and so you don't have to
read much, that [1] diff still needs to be included (i.e. the rest of
the discussion and the commit I added is independent).

Thanks!

Cheers,
Miguel
