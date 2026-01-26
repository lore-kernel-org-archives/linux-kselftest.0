Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6A928850C;
	Mon, 26 Jan 2026 22:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769466977; cv=none; b=MXelpuvvA47A6O160l+9v8BZZY7urMCusnAWLVLHkawFJsEM+lkf7cc4j1kvg+bicG0IAIQ7Oplm6fgVbUahKU4p7bHVjmNH0HUB5IVguKcZIMTmvfIccSdadsEyFDSOlmOZ496DgZNKnIVz7VkbQ6BcAjSxvRbtVfSzjtGtuFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769466977; c=relaxed/simple;
	bh=rmFs+IvmZfb5x+KMgHoW7cDZbA7+tSSyJuFCmPF4B6s=;
	h=Content-Type:Date:Message-Id:Cc:To:From:Subject:Mime-Version:
	 References:In-Reply-To; b=diWwydeTvYQMoyTOuay7TAus1E62tha0cNyBSclgMTYorSPg0asmJ9JoJtg+GiTXYiQE7aprRvm+97Ynfl/jhjGM9vuY6FgOf30cGYb/ogvALdx/LmuIlY1OT4x4C4M3Ipvs8dXvrEZ8UYpGW1mGBi9hIOtw+ElXF3rhjPq4WZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DMyQAmbn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DMyQAmbn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6C87C116C6;
	Mon, 26 Jan 2026 22:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769466976;
	bh=rmFs+IvmZfb5x+KMgHoW7cDZbA7+tSSyJuFCmPF4B6s=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=DMyQAmbnpb055ycrT4TAAB6V2jcxTIhTwMxVG4YyjoKfmAlyOscHiUdIbatS/X0Dk
	 8Oq7ii8TWo9BBtLVtU2aeVXGwksjuPl18NHamcLo0Yo1ejpVdBTxvIsyjnTMxK4EAC
	 iQ8CopCFj0YCpiIQiMNq6+ueiEusR3tZNobQLgYfzhR7LzNvw6F6zyFZ229DMKDSpQ
	 PsJrM0hELS1fuMnbZXLkVdUriaVSDW+Zm2hO+nd5wsoAMfo+TJ32+kxKdMifCOSBWc
	 oVAmI0Yd1dIhm71rRkmmyyQGqdvKcWaMSQWWcjKR2YJ01DWuC4Kug+3RFT8cPQ4K5G
	 cv7251JGTqHBQ==
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 23:36:12 +0100
Message-Id: <DFYVOX2J1WKG.2GJKZ0T6O21NP@kernel.org>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Johan Hovold"
 <johan@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, "Tzung-Bi
 Shih" <tzungbi@kernel.org>, "Bartosz Golaszewski"
 <bartosz.golaszewski@oss.qualcomm.com>, "Linus Walleij"
 <linusw@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan"
 <shuah@kernel.org>, "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
 "Wolfram Sang" <wsa+renesas@sang-engineering.com>, "Simona Vetter"
 <simona.vetter@ffwll.ch>, "Dan Williams" <dan.j.williams@intel.com>,
 <linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Jason Gunthorpe" <jgg@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 0/3] Revert "revocable: Revocable resource management"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
References: <20260124170535.11756-1-johan@kernel.org>
 <DFX20SA67PF2.VONCFNDOZOZT@kernel.org>
 <2026012554-chatty-policy-42a1@gregkh>
 <DFXV1QMQMTRK.2W8SWGVHS2K69@kernel.org>
 <20260126000730.GI1134360@nvidia.com>
 <DFYNFXYTXBIW.314K249BPTA1Z@kernel.org>
 <20260126170720.GN1134360@nvidia.com>
In-Reply-To: <20260126170720.GN1134360@nvidia.com>

On Mon Jan 26, 2026 at 6:07 PM CET, Jason Gunthorpe wrote:
> On Mon, Jan 26, 2026 at 05:08:20PM +0100, Danilo Krummrich wrote:
>> Yes, the majority of uses is access(), not try_access(); not sure if rws=
em is
>> the better solution though.
>
> rwsem is much faster on destroy and somewhat slower on read. Which
> sounds to match the use case here. Ie you wouldn't need to do special
> effort to bundle the synchronize_srcu()

While not that many, the try_access() cases may still be in hot paths, wher=
eas
the destroy case is always in a cold path, i.e. device driver unbind. Also =
note
that if the resource is released "manually" before driver unbind, we use
revoke_nosync() as the destructor already guarantees that there are no more
users.
