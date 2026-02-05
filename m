Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1618B356A2C;
	Thu,  5 Feb 2026 08:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770281512; cv=none; b=bUCHIL3wCNmvbDZMHRmNQNzbgrPcmGtYjneqxChZzZTJc7o+3zz3XuHvIH1xvdXooyep1jOaw/K1HJfzZNPTfFqSYL+nqKyKfy/b7YIWnI7cKwK9qUNcD1VrwtCmlFYub194XmrTU0DzOokYvExzQt6TUr/XpJh7c7HTi0MNeUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770281512; c=relaxed/simple;
	bh=t8GQ7vpi0gR0Qvertw+d+LGyMlBx2qZYihB3/VMvqF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ej22D9rm/m10lMq3tYyFxDdJKHXKJzW2RPR7ebhyS04r6+LpshtD6QzgN35okjATuQefiupL/5pPyTC8PWsoOlKDs6Wsc2xCzhlbXoNhOa8xaJy9kUZFwfXwclSMJiSrKXPmHYqRtN3h9FDhVZvHd7P3zJf8SP5HMt+2WH9SzCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TFkK6Wv/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TFkK6Wv/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40BFCC4CEF7;
	Thu,  5 Feb 2026 08:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770281511;
	bh=t8GQ7vpi0gR0Qvertw+d+LGyMlBx2qZYihB3/VMvqF8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TFkK6Wv/EDmyeGXuWa6Fuwz7kmvv2Y6aMz8rcoBeIGSgmp2nfIL9/k7Dtlr6wGfdT
	 eKJzlvAzy/iEFTEBGP7yTwfS+/RXoF6N7cdzKY18+UmYCs3iOD1592e8u4Qkn5IBR7
	 U6R+aI3TCM2TQ9ehm19xC0G5d3vtw+ENU6Tzq6Suv3CwhIT1ArYWs3Glq2Y6BMwVdk
	 47w/1rToQ4yoYNspZhW9SyPk2y43sowO7HLXlv1psG4Gq/HmCCVKGqLbGYMva4R4uj
	 AEJiRjJzHrW6VmbfsT/vT+tt+g41Pi9czrf7mPlW369rmtRrcjRE21Fb5nG/m1CkmW
	 hUSh1ZwB+STcg==
Date: Thu, 5 Feb 2026 08:51:47 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Johan Hovold <johan@kernel.org>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Dan Williams <dan.j.williams@intel.com>, linux-gpio@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v2 04/11] gpio: Ensure struct gpio_chip for
 gpiochip_setup_dev()
Message-ID: <aYRaI0NDq2dIO4QQ@google.com>
References: <20260203061059.975605-1-tzungbi@kernel.org>
 <20260203061059.975605-5-tzungbi@kernel.org>
 <CAMRc=McJjJNsrG7ZfWYQTBb2-8CgV4OVqZKhSFJDw=cTB0r=dA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=McJjJNsrG7ZfWYQTBb2-8CgV4OVqZKhSFJDw=cTB0r=dA@mail.gmail.com>

On Wed, Feb 04, 2026 at 04:36:00AM -0600, Bartosz Golaszewski wrote:
> On Tue, 3 Feb 2026 07:10:51 +0100, Tzung-Bi Shih <tzungbi@kernel.org> said:
> > Ensure struct gpio_chip for gpiochip_setup_dev().  This eliminates a few
> > checks for struct gpio_chip.
> >
> > Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> 
> Same comment as patch 3. I don't like seeing both gpio_chip and gpio_device
> being passed to the same function. If you already dereferenced gpio_chip, pass
> it on its own and get the address of the associated devices from its member
> pointer.

Ack, will fix in the next version.
