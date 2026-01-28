Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19B818FC86;
	Wed, 28 Jan 2026 14:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769610199; cv=none; b=gUw02zGTCCYKDnnZUfMR1rMutPemi0Bodx8C8DWrEUZAaco2/WLuy3Zrjqo9mpeBykgz55pFP+xT4CYGZfVyb9JGahT/7/YJUgekPvJkP8cOwkrQZ2U6HcqtkKd4UcLkjlcRj9E27oqalAXhsnkIZJOijDwq/lg7T3GaRAOA0V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769610199; c=relaxed/simple;
	bh=GaqmXVC43+nsMMOnXtKrUQcuZ8BiG1QNfcEodbtQSW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XNfQyLdRGMnu8JG55PhkZVatPhGxUoaRJ/ZaZVskuf6/PjjGpGUpjGe47E5UkDdQCFsuL1rzFwp0zAiRXMCxW7VPwhDNqA2vqQPYo1xT2w+cVF1ZfmAbmKLQ8MTcZli/ykSA7/IJ3wc+9/r+dV1vSKNhSSf8Z3QCj1OTnoc/Zw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k/OnoK4k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k/OnoK4k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46F12C4CEF1;
	Wed, 28 Jan 2026 14:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769610199;
	bh=GaqmXVC43+nsMMOnXtKrUQcuZ8BiG1QNfcEodbtQSW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k/OnoK4kbx+TzB+RxBXXEoNYVe1eLdzXQxjt9Bz4sY/DY06uC1CZ9Qjechb7LDrIa
	 fBJsl0gGw4ducuQgsQt7XdpzIL211PxnMLXqXgC0M9LF0WiPDEROVXdvc+7pa74zhQ
	 4DRN7zBKcOGo3ewT/wkecY6RJI3FDfyiFRRuCvhJW4tGZkHqEx40bheiVD643UpIGr
	 s+XvS8TOZ/GsJeHuxvshSnK0hqrtjP83brppNsELJxN0vdtf52IMv+pDBrjbd8VnOH
	 l6r9hVULPTkp7J/z17Z4v4gClWW4tDcXd90RFDDVmU3o8Yu/aquYwLm1VPy2iuypDO
	 NDdudkPpLXzAQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vl6Rq-0000000038v-3r43;
	Wed, 28 Jan 2026 15:23:10 +0100
Date: Wed, 28 Jan 2026 15:23:10 +0100
From: Johan Hovold <johan@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Dan Williams <dan.j.williams@intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Revert "revocable: Revocable resource management"
Message-ID: <aXobzoeooJqxMkEj@hovoldconsulting.com>
References: <20260124170535.11756-1-johan@kernel.org>
 <aXjgeNY-jf9rIw09@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXjgeNY-jf9rIw09@google.com>

On Tue, Jan 27, 2026 at 03:57:44PM +0000, Tzung-Bi Shih wrote:
> On Sat, Jan 24, 2026 at 06:05:32PM +0100, Johan Hovold wrote:
> > I was surprised to learn that the revocable functionality was merged last week
> > given the community feedback on list and at LPC, but not least since there are
> > no users of it, which we are supposed to require to be able to evaluate it
> > properly.
> > 
> > The chromeos ec driver issue which motivated this work turned out not to need
> > it as was found during review. And the example gpiolib conversion was posted

> Regarding cros_ec_chardev, my last attempt [2] to solve its hot-plug issue by
> synchronizing misc_{de,}register() with file operations using a global lock
> highlighted the difficulty of alternatives: that approach serialized all file
> operations and could easily lead to hung tasks if any file operation slept.

Yeah, fixing it at the chardev (or miscdevice) level would still require
some changes at the driver level (e.g. to wakeup sleeping tasks).

> Given the drawbacks of [2], I believe cros_ec_chardev remains a valid use
> case for revocable.

Yes, possibly. 

Miscdevice is a bit of a special case however since you cannot tie the
lifetime of your driver data to that of the miscdev, but there are ways
to address that. And some drivers already handle this (i.e. without any
changes to miscdevice).

But notably the revocable design seems to derive from this quirk of
miscdevice.

[ Side note for completeness: Looking at the cros_ec driver it doesn't
  seem to involve any hotpluggable buses so this looks like a mostly
  theoretical issue of a developer with root access actively unbinding
  an ec-driver while in use. ]

> > the very same morning that this was merged which hardly provides enough time
> > for evaluation (even if Bartosz quickly reported a performance regression).
> 
> The gpiolib conversion was provided as the first concrete user to enable
> this evaluation process.  The performance regression Bartosz identified is
> valuable feedback, and I believe it is addressed by [3].  I plan to send the
> next version of the series after v7.0-rc1 and revisit the issue.
> 
> [3] https://lore.kernel.org/all/20260121040204.2699886-1-tzungbi@kernel.org/
>
> > Turns out there are correctness issues with both the gpiolib conversion and
> > the revocable design itself that can lead to use-after-free and hung tasks (see
> > [1] and patch 3/3).
> 
> I appreciate you identifying the issues where multiple threads share a file
> descriptor; this is a case I overlooked.  I see these kinds of findings as a
> positive outcome of having wider review and a concrete user, allowing us to
> identify and fix issues in the design.

Yes, that's exactly why we always require a user *before* merging
something like this. To be able to determine that the interface is sane.

Now the user showed up on the same day as the merge, which is obviously
not enough time for proper review and discussion.

[ And by short-circuiting the normal process you probably reduce the
motivation for people to spend time on the example conversion too. ]

> > And as was pointed out repeatedly during review, and again at the day of the
> > merge, this does not look like the right interface for the chardev unplug
> > issue.
> 
> My focus has been on miscdevice [2], but I suspect cdev solutions for device
> hot-plug would face similar synchronization challenges between device removal
> and in-flight file operations.

But we need to look at that before throwing up our hands and saying that
it's not possible and that each driver should take care of this itself.

> > Revert the revocable implementation until a redesign has been proposed and
> > evaluated properly.
> 
> I'll work on addressing the discovered issues and send follow-up fixes.  I
> believe keeping the current series in linux-next would be beneficial, as it
> allows for easier testing and wider evaluation by others, rather than
> reverting at this stage.

To the contrary, now is right time to do the revert as there are
fundamental problems with the current interface that will require a
redesign. That's not the kind of work that should be done during an rc
stabilisation cycle.

Give people a chance to see for themselves what the gpiolib conversion
looks like, determine whether this abstraction makes the code more or
less readable, and think about possible further uses of a mechanism like
this.

Johan

> > [1] https://lore.kernel.org/all/aXT45B6vLf9R3Pbf@hovoldconsulting.com/
