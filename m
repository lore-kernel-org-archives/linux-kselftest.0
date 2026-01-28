Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E3E625;
	Wed, 28 Jan 2026 23:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769642940; cv=none; b=FwW0KQXSEVgjd6d1Lqy7UcuuSmigcAW9X6BcjB4WyQYQ0N3jL1P0zfzpHWhGyW1ZBiIxPhac4VDNSSFOFCOoRFgzIdwFhQ5IyH5Hj8wyM+En1AJ9PXJtYadGoqLIznJnwEuRyzqVc4M/3N9Op6xhKlKMRWbxZM/ynlRttfqdOec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769642940; c=relaxed/simple;
	bh=Re30vfT7J/lhmfCWiC6tfWOspLn8FWQy0Ol+r3MBeHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=shkrHqU9iQtG0MIvJfl7AcYP4yBekFhC34uyCQJ325ZzwbUVO8M61BnEUu7kn/bKP017fXx3u/9WzTwtaJdoRFqy9gHVK2y2D5FWNz9HF7E/yT+65SaJfbdo2ABBoJfO75HQx8Oi+5WPf6G8Z3H9iOmYrziadhSwl1NR9hALXhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CstViLfg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CstViLfg"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 01BC0581;
	Thu, 29 Jan 2026 00:28:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769642899;
	bh=Re30vfT7J/lhmfCWiC6tfWOspLn8FWQy0Ol+r3MBeHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CstViLfgetq2FaIg/mUC97M5Iyxav/KrqLbxl3ZuiZG0lDMFmSFX2V4J2LYa+MIi/
	 /gW4Hs6M+qoCxqxTxCDaqAnXY5m4za8zTB9DXKLM+gdiwqO64yyCKdF3SVoAMuVIoy
	 zo7ffLSFX56h534/gbMCZIce5Nx/oQHSzN4lD/9M=
Date: Thu, 29 Jan 2026 01:28:54 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Johan Hovold <johan@kernel.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Dan Williams <dan.j.williams@intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Revert "revocable: Revocable resource management"
Message-ID: <20260128232854.GB3275574@killaraus>
References: <20260124170535.11756-1-johan@kernel.org>
 <aXjgeNY-jf9rIw09@google.com>
 <aXobzoeooJqxMkEj@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aXobzoeooJqxMkEj@hovoldconsulting.com>

On Wed, Jan 28, 2026 at 03:23:10PM +0100, Johan Hovold wrote:
> On Tue, Jan 27, 2026 at 03:57:44PM +0000, Tzung-Bi Shih wrote:
> > On Sat, Jan 24, 2026 at 06:05:32PM +0100, Johan Hovold wrote:
> > > I was surprised to learn that the revocable functionality was merged last week
> > > given the community feedback on list and at LPC, but not least since there are
> > > no users of it, which we are supposed to require to be able to evaluate it
> > > properly.
> > > 
> > > The chromeos ec driver issue which motivated this work turned out not to need
> > > it as was found during review. And the example gpiolib conversion was posted
> 
> > Regarding cros_ec_chardev, my last attempt [2] to solve its hot-plug issue by
> > synchronizing misc_{de,}register() with file operations using a global lock
> > highlighted the difficulty of alternatives: that approach serialized all file
> > operations and could easily lead to hung tasks if any file operation slept.
> 
> Yeah, fixing it at the chardev (or miscdevice) level would still require
> some changes at the driver level (e.g. to wakeup sleeping tasks).

Waking up sleeping tasks is a core part of the fix. Drivers will need to
do so explicitly in their .remove() operation, through a
subsystem-specific wrapper around a cdev helper function.

> > Given the drawbacks of [2], I believe cros_ec_chardev remains a valid use
> > case for revocable.
> 
> Yes, possibly. 
> 
> Miscdevice is a bit of a special case however since you cannot tie the
> lifetime of your driver data to that of the miscdev, but there are ways
> to address that. And some drivers already handle this (i.e. without any
> changes to miscdevice).
> 
> But notably the revocable design seems to derive from this quirk of
> miscdevice.
> 
> [ Side note for completeness: Looking at the cros_ec driver it doesn't
>   seem to involve any hotpluggable buses so this looks like a mostly
>   theoretical issue of a developer with root access actively unbinding
>   an ec-driver while in use. ]
> 
> > > the very same morning that this was merged which hardly provides enough time
> > > for evaluation (even if Bartosz quickly reported a performance regression).
> > 
> > The gpiolib conversion was provided as the first concrete user to enable
> > this evaluation process.  The performance regression Bartosz identified is
> > valuable feedback, and I believe it is addressed by [3].  I plan to send the
> > next version of the series after v7.0-rc1 and revisit the issue.
> > 
> > [3] https://lore.kernel.org/all/20260121040204.2699886-1-tzungbi@kernel.org/
> >
> > > Turns out there are correctness issues with both the gpiolib conversion and
> > > the revocable design itself that can lead to use-after-free and hung tasks (see
> > > [1] and patch 3/3).
> > 
> > I appreciate you identifying the issues where multiple threads share a file
> > descriptor; this is a case I overlooked.  I see these kinds of findings as a
> > positive outcome of having wider review and a concrete user, allowing us to
> > identify and fix issues in the design.
> 
> Yes, that's exactly why we always require a user *before* merging
> something like this. To be able to determine that the interface is sane.
> 
> Now the user showed up on the same day as the merge, which is obviously
> not enough time for proper review and discussion.
> 
> [ And by short-circuiting the normal process you probably reduce the
> motivation for people to spend time on the example conversion too. ]
> 
> > > And as was pointed out repeatedly during review, and again at the day of the
> > > merge, this does not look like the right interface for the chardev unplug
> > > issue.
> > 
> > My focus has been on miscdevice [2], but I suspect cdev solutions for device
> > hot-plug would face similar synchronization challenges between device removal
> > and in-flight file operations.
> 
> But we need to look at that before throwing up our hands and saying that
> it's not possible and that each driver should take care of this itself.

There has been previous attempts, including a functional patch series,
that didn't get merge due to the sole reason that it duplicated a small
amount of logic also present in debugfs. I'll reply to Danilo somewhere
else in this mail thread with more information.

> > > Revert the revocable implementation until a redesign has been proposed and
> > > evaluated properly.
> > 
> > I'll work on addressing the discovered issues and send follow-up fixes.  I
> > believe keeping the current series in linux-next would be beneficial, as it
> > allows for easier testing and wider evaluation by others, rather than
> > reverting at this stage.
> 
> To the contrary, now is right time to do the revert as there are
> fundamental problems with the current interface that will require a
> redesign. That's not the kind of work that should be done during an rc
> stabilisation cycle.
> 
> Give people a chance to see for themselves what the gpiolib conversion
> looks like, determine whether this abstraction makes the code more or
> less readable, and think about possible further uses of a mechanism like
> this.

fully agreed. Follow-up fixes is not the right way forward. As Johan
said, the quick merge despite the open issues, circumventing the normal
review process, damages trust, and reduces my motivation to review your
work and help shaping a good API to solve this problem.

> > > [1] https://lore.kernel.org/all/aXT45B6vLf9R3Pbf@hovoldconsulting.com/

-- 
Regards,

Laurent Pinchart
