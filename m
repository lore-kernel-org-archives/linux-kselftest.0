Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350BC30C354
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Feb 2026 07:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771573925; cv=none; b=ad1I0Dh9dP1kNQkucVBM8+qn3Oa7G59ldwUQo1C0wfqcJLeU+QwMJH59yD5VNlNke/LYsclNvmnqjQ4fX9WsYJfhmj8K2oOJ37Zbl7d7uhfKwtCVevw2rpiWBGx2jq8ERBYwv0wmHp/hWpq93fEhDTLK3cFXwMCF4D7zaB4pGlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771573925; c=relaxed/simple;
	bh=QTanqqZ9R/o4VV9Z0PWcMC9w6NpgsBW34fGWnDXCvuU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V1WO2BZx6ZOjroPnPeSvLaaLwYbKg5tkuhHranx+68+mxDvDWvxMeRxFyDqq2O0qGyc4xohh3zUXtKfdOGtpMrIH7NFpwj6wfCBNElyJmUS8UxGbRHojFtzOMVPelgDxHcb+TY8SAl1yoNJAnRCzs5bOPsbTMFg1XSQE3FZC8ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WCmHBiWE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WCmHBiWE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A847EC4AF0E
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Feb 2026 07:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771573924;
	bh=QTanqqZ9R/o4VV9Z0PWcMC9w6NpgsBW34fGWnDXCvuU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WCmHBiWEFZfHkzDUtWIS1eIQ7ZEHXKHUOt7dvZn3SWVbz4EBtaFvTQFy1X9BMvZth
	 lXYDf4F5tYIrXC5HYqRI0jIAICl91aJ8gQrTIqB7RIO1YABA18hIZUKMKcHmLXHuYV
	 WUWFISwfrd9j8qoJUz5Hg+NTEboadrUpfCQZuog4FYzs1ZtpLyGh5K7vYk1E6E0nCP
	 oR6u5jTFLe2BzCo+NHF+5i/4xlEMyrJjUsrCEUKV1e2uiRjZcf2DuLu/8vY2d/G83X
	 LqeefsG+Wcw1XORcbvHh/LpJbBnJhVrw8v0EtQUO9mpIE1zP2ZyuJp7o/qoVDlS7XO
	 9Ic7/UzCM0c1A==
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-79801df3e21so17255337b3.2
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Feb 2026 23:52:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUkZ7e1dhon0YX5CgG6PRD8MPfLicfmvoGh4gpOy/KYt4TEVhUvyS1XXmbYuMUlzwvMsKFAflJvFbr2V639SIE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOfAvWBLJa+1fhoUqI/82YcvhC6QVhj5brpDEj7jiI1LdkAC4k
	ZHo3zau1wV4kPyFWQuVdAQWN0hB0gU4BJc9oz/buv5s9/co/dndEdQAi9qC0pbxgGr8gio/mTkO
	qVK1hb6nDoSNNiC6gG2PUrc9nX2DZuww=
X-Received: by 2002:a05:690c:dd4:b0:798:1ac:8a6e with SMTP id
 00721157ae682-79801ac8ef3mr46855417b3.5.1771573923814; Thu, 19 Feb 2026
 23:52:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260213092958.864411-1-tzungbi@kernel.org> <20260213092958.864411-6-tzungbi@kernel.org>
In-Reply-To: <20260213092958.864411-6-tzungbi@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 20 Feb 2026 08:51:53 +0100
X-Gmail-Original-Message-ID: <CAD++jL=vskCOH0nEr8zLV3Lsvs=D21w_dAH75MX73ne1uEHVXg@mail.gmail.com>
X-Gm-Features: AaiRm538oemFdXlRpuoNSZX2wWqwZzZmgmeNXenBk6UM2SaN1LwEPbpvlKpdqXc
Message-ID: <CAD++jL=vskCOH0nEr8zLV3Lsvs=D21w_dAH75MX73ne1uEHVXg@mail.gmail.com>
Subject: Re: [PATCH v3 05/11] gpio: cdev: Don't check struct gpio_chip in gpio_chrdev_open()
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

> It's harmless even if: chrdev_open() and cdev_device_del() run at the
> same time, and gpio_chrdev_open() gets called after the underlying GPIO
> chip has gone.  The subsequent file operations check the availability
> of struct gpio_chip anyway.
>
> Don't check struct gpio_chip in gpio_chrdev_open().
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
