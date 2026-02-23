Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86450248F6F;
	Mon, 23 Feb 2026 06:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771827682; cv=none; b=da6K/4h1xcOCsqUzCsvg15ZA72XM1FeWM1OIQBCYgB3Zvy6b/8z1pYWmSAcRzf6A60sIf+nD/ZERAjT9NTESO93GTz3Q+3tNvcMStAZtk8T87gVYRva/WGi82RD7g20uVkgH2DAY4AgEhIClSjG43BiU0SrOTte7XG8Ar0RK0Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771827682; c=relaxed/simple;
	bh=OrNVuu96RmVQDMEp/SliaNIu93b625pIszPp6BQGKow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J1QufVBvbBiBup38jL+VEeo41iljMhD8bELn+YbQxdd/N7fgmsfJKSsJCU4Jovg5+I4//f1j5KD/miAuLaB2229Oz8pFJ5Z3HzXcUs+f7urYCtVS0Jc+nzu2Z+PsEryy6Zr9DaBcIyCq2WPPbcwB+O0SF9047wnYZ+Vr9El2r4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kE6V06Wn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kE6V06Wn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28EE4C116C6;
	Mon, 23 Feb 2026 06:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771827682;
	bh=OrNVuu96RmVQDMEp/SliaNIu93b625pIszPp6BQGKow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kE6V06Wnt34xg/OQhDrNjEHA05oz8v9a0TMe2hYWlhr8f3OaYTTqGzF/QPWMSdl9+
	 VZFPmYjfXm0OhA8KrkH9h/WRETAtlvXGK9GoWqPfgEa565RdkRy4sC9k/2H7ZSIbas
	 AW429byAN8yfZpAvXVL5gHLkvm6629ZdaQEzB0vuSEFMUzJOY2KShZfQxBMElOrBJo
	 t4awIqix+f2H4FWeM9AWA7E0OSjOAKAyKWUdYbROm97KjidR5Y8Rm94G/qmIrBCItQ
	 Rel5TpOM7qh6q9WsFmRaH3clRE/5Wu4JENn76p7Y3NJEuFRT3ktTbBXlXYVItPiQRC
	 JeNqNlY2iJQ/w==
Date: Mon, 23 Feb 2026 14:21:16 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Johan Hovold <johan@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	chrome-platform@lists.linux.dev, linux-gpio@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/11] gpio: Adopt revocable mechanism for UAF
 prevention
Message-ID: <aZvx3HlLReX-n5td@tzungbi-laptop>
References: <20260213092958.864411-1-tzungbi@kernel.org>
 <CAMRc=MfQumD1ULx7yU4W2sx=35wyQf7-v4tSf44OqEu3JDBUAg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfQumD1ULx7yU4W2sx=35wyQf7-v4tSf44OqEu3JDBUAg@mail.gmail.com>

On Wed, Feb 18, 2026 at 11:26:00AM +0100, Bartosz Golaszewski wrote:
> On Fri, Feb 13, 2026 at 10:31 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> >
> > This series transitions the UAF prevention logic within the GPIO core
> > (gpiolib) to use the 'revocable' mechanism.
> >
> > The existing code aims to prevent UAF issues when the underlying GPIO
> > chip is removed.  This series replaces that custom logic with the
> > generic 'revocable' API, which is designed to handle such lifecycle
> > dependencies.  There should be no changes in behavior.
> >
> 
> Patches 1-6 look good to me, I think they should go into linux-next
> after v7.0-rc1 is tagged to lessen the burden on the subsequent
> revocable work.

Separated, rebased to v7.0-rc1, and addressed comments for the first 6
patches:
https://lore.kernel.org/all/20260223061726.82161-1-tzungbi@kernel.org
