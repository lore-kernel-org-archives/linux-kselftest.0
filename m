Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6563D4109
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Feb 2026 10:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770201365; cv=none; b=lwDeMObSXNshQfTAiL9RJBBhstQqqlIm9gI5mOG7Brm7WPztzB/qcL+etZxMEmTmN9TxMJPGBtRIj2tT8NNGSMXug07PrXRWytNaJ1vMN9TfTdcsu6I1WiPQBf1RhG4sTndX7aRiwNNzpTnN7ZSwjUYhLGEuBOoT8im6GPH/Je0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770201365; c=relaxed/simple;
	bh=ptoiRVAlZGzIJyLYt+jTEV9MYD0gUd7D7nxLeNRCiIg=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GA7xdkexb4zz2v5Uit0at3ozonArhETfQPWiRGApISVytI3sB14/vk0pqbdYpJsdA+xyTkAnkazQUUMqwQOH+lw2sq4OYi76PXHsTebmYWFihyiZv6GJjUlKMhaULSEChJVWGwOBHtzcUSARY8QvFaa67V+LgwKPWkFqcNAnkCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oqWKQBFc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oqWKQBFc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E478EC4AF09
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Feb 2026 10:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770201364;
	bh=ptoiRVAlZGzIJyLYt+jTEV9MYD0gUd7D7nxLeNRCiIg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=oqWKQBFcDJcd9f1QJy9XjVcA2AhXIvgR3hr3U79caPl44alCys5qm2+XEX3tgyW4l
	 V+/BErkKPFstKGNeY39aDWJyx7dJi/qgGt+mXizf87eKJmtjjJfT4YnIvmlX/8j3Rn
	 SdMaQYw/TrdP30BEfT3TjivfQXCLQQmxwQdFFgku8cjEzjqAJzwJFUEAqQ7kKIVdKX
	 /N0MkioTnzlqoDvPMK2w+bsxSgdDdfM1RzIPxdvKG+kH1MQ7w1RkDHZb0eeRvUuS7G
	 uqGOckrxqoHj2ACuXx6czvL6LAatrcNr0qsDVrNkNsnr+We6kmxk6lyyJ9cbHs7mmB
	 ELFLsYKx7VqyQ==
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-126ea4e9694so5760422c88.1
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Feb 2026 02:36:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWUKq3LcbVUY9uKzWsvXpscmVeoyAP5cPzBUzZuZGxrQYLv3uEp9kdsqAKqmQsSFxkAo0zFrBhAlIh2iHSxqEQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx1+E5GnI7WIbOLwdkoqxPup/lIyW5y1HYROKY6+NuVNyaBL2Q
	rjP5cWibxxw8egIwoFatK64o0GbKmPgYGmO7tbiRdTh6cA9r44VU6bNOSMQw2x8ufggoNOb6km5
	5wUVMvCxDguP8ffzLo1ZkzoP3UZjyUY8jGV3kbxMH0Q==
X-Received: by 2002:a05:7022:1a85:b0:123:2c98:f6ac with SMTP id
 a92af1059eb24-126f477cf3fmr1038188c88.12.1770201364221; Wed, 04 Feb 2026
 02:36:04 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Feb 2026 04:36:00 -0600
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Feb 2026 04:36:00 -0600
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260203061059.975605-5-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203061059.975605-1-tzungbi@kernel.org> <20260203061059.975605-5-tzungbi@kernel.org>
Date: Wed, 4 Feb 2026 04:36:00 -0600
X-Gmail-Original-Message-ID: <CAMRc=McJjJNsrG7ZfWYQTBb2-8CgV4OVqZKhSFJDw=cTB0r=dA@mail.gmail.com>
X-Gm-Features: AZwV_QjU2SVHMmU9hsEFQVuFDP83BW1jovz7xlKNYthT1RHWjVgH8VnPNfzupmc
Message-ID: <CAMRc=McJjJNsrG7ZfWYQTBb2-8CgV4OVqZKhSFJDw=cTB0r=dA@mail.gmail.com>
Subject: Re: [PATCH v2 04/11] gpio: Ensure struct gpio_chip for gpiochip_setup_dev()
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, chrome-platform@lists.linux.dev, 
	Dan Williams <dan.j.williams@intel.com>, linux-gpio@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linusw@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Feb 2026 07:10:51 +0100, Tzung-Bi Shih <tzungbi@kernel.org> said:
> Ensure struct gpio_chip for gpiochip_setup_dev().  This eliminates a few
> checks for struct gpio_chip.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Same comment as patch 3. I don't like seeing both gpio_chip and gpio_device
being passed to the same function. If you already dereferenced gpio_chip, pass
it on its own and get the address of the associated devices from its member
pointer.

Bartosz
