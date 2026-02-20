Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A432D6E62
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Feb 2026 07:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771573632; cv=none; b=iIwovx1Da7WyQUje+YHScOe67WW9GCVIQ8EVSwX9DI4jk1q+vfBgn7cjJjGThArZiZHJ6xuyVQz6UpUEQ0vaxZWB6Ov5K1nF7JcUQf7u4wfOzzgdMnN1zNwU7yzepd/Eaz7TJWhK1DdIAR9yBuwnKe60U8xtzOrRQ0rPE4e57Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771573632; c=relaxed/simple;
	bh=sdebDhDZnywd2uWMuS4f752/48HseCqlPT5fN8H53pk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=svXi2pPL4MAeaqKQ/H6wpGnjkAEEm7HknJ1rvoLek8GVmAWcIAyXBq8g2pM2uRweRyIsIe9qsUC6gepQ7MFMyhHnybqbG5DX68HzdYRILut3y+PKWvI0poxxJC8L0k8bOQvqRWGd99Qqb+zl9cPtyLfA+CzHbIUMq4/U05IA/0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KPFpq6l3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KPFpq6l3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10845C2BC86
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Feb 2026 07:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771573632;
	bh=sdebDhDZnywd2uWMuS4f752/48HseCqlPT5fN8H53pk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KPFpq6l3FvkmOHmkB7hPif3s6YIvlBzfnichVkKETS3LnjCjdIZpTE7o7rShD+0/6
	 8cblYMy52xFnJGxiM+RJcG+3iR+1v9moPNCSFIrW86YvMWp2ef7eD21mBrxlptl3GS
	 U3QqGplD2300kxOlrKTCH3oA5V4XRKInVfL2BRHmy+CclfJ2vjFGi3/AWf+wjyCiou
	 TvW5m3+gTyb8SomWyZcpmq+wRNP4GgJTMnLUWutdorpxQgkOXMkDecKM5YpgKA+/6K
	 NKpjxAFVzFM1iAyIPO2I8O7ktGSKS97s0kBeTVCk1lQ9OvFyR+ZFy78SwQ8sBzLcN4
	 bT7yvc7+Lc/xg==
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-794fe16d032so16018087b3.3
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Feb 2026 23:47:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX0XyfEuyV5aD3PZzijBwcUoGTpUni9+ogpYTcOyy9dR5p/5Fhy1PgDL8r3yqhWr1LPrp3oZ2G16J1XEPKaI1A=@vger.kernel.org
X-Gm-Message-State: AOJu0YymJDqNzGYNC8+/A765TUsB4v2hAOrEEG6g/0AU5yTDCQvimdNa
	MehJmYggoNHcNSvDuozMrxtRXEIBxu272+h4UMqy6pq0dp2NsR60orQDUKdWj1dgC3RXCP5ypiW
	VNUZkIl5UjhMjaVa0m36coohvTRgS//s=
X-Received: by 2002:a05:690c:e3cd:b0:794:cea5:2ce with SMTP id
 00721157ae682-797f716f8damr57561247b3.5.1771573631215; Thu, 19 Feb 2026
 23:47:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260213092958.864411-1-tzungbi@kernel.org> <20260213092958.864411-2-tzungbi@kernel.org>
In-Reply-To: <20260213092958.864411-2-tzungbi@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 20 Feb 2026 08:46:59 +0100
X-Gmail-Original-Message-ID: <CAD++jLkaBPxPoMewbSeh=+GzFg8JTaBXQ-KsAXUgxgQZLcgQiw@mail.gmail.com>
X-Gm-Features: AaiRm52CMlErlBEqpuELbwrw3FPYyKKjdMlNu0pHoeQnbWplSCYK8ppWOB41Q3c
Message-ID: <CAD++jLkaBPxPoMewbSeh=+GzFg8JTaBXQ-KsAXUgxgQZLcgQiw@mail.gmail.com>
Subject: Re: [PATCH v3 01/11] gpio: Access `gpio_bus_type` in gpiochip_setup_dev()
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Johan Hovold <johan@kernel.org>, "Paul E . McKenney" <paulmck@kernel.org>, 
	Dan Williams <dan.j.williams@intel.com>, chrome-platform@lists.linux.dev, 
	linux-gpio@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 13, 2026 at 10:31=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org>=
 wrote:

> To make the intent clear, access `gpio_bus_type` only when it's ready in
> gpiochip_setup_dev().
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
