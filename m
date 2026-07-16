Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E0E33688C;
	Thu, 16 Jul 2026 15:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784215411; cv=none; b=QomFUbfmoYH7ZqviwKmXVGDQ75z8uN2eKn5ZUzWvfL4A08MsEkkGWrHRF1sjXOF3apUhkiG36MrrwaQP1od6MF91u6tFcAlRI5Av2xkq8FHgBDjBc4omrxROzhk1EQxP7I4v5r6KP1RWlLag9kfz48TqC90qLaF9Pfm4q8rWPOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784215411; c=relaxed/simple;
	bh=9Lj8QWeAW/f6BYocnF2H5xXmLW87xIGlGBWuLDNxgso=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kIEPv68BXPSBIE8E0u/JTGhRpX56VbTX/p82tQrNFvuGuhhCR2xglFO6kNA+wct93cxRHRO7sDiq11LyHCFUWf9/oAstKLpmvNk98Yr/pwqcUrtvInM4fTk5T1PCE6wOuif8IjVaIOE57Np/4obrtjbKdY9fo8NJDqy092Wq5so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lRwM5aEl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lRwM5aEl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79DBB1F000E9;
	Thu, 16 Jul 2026 15:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784215410;
	bh=8yxtYzVJC/YQcgDQF17z4a4o6jbAXtuLmTRsrhHqBRs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=lRwM5aElMnpptEKmPpsPm1KyQJGAq302EL1cLrYDGvERvDwNmNdD4AOS9blZMuHoJ
	 XKOKwaSv6K17LiZNgA6Mnnn8pgW8WBW1BusLynbaFhZzXO8ws1nnyhsW79Yc+b4h5Y
	 EkQOGPkf+OMichonv2QhGwUXKBlrW19C4bSyf5ex+YqAKv/KB8yaJvS9u5dOw6IIZn
	 cdPI/zytfWIsbiPwjJtH3hIhcjoWjtoUVMRID5JlpOiYV7O76H8CZCce0VrMMwvYUv
	 45StT8TROgpnXAVCVOQDmNI8+Bn5TYDR1CSz++77v9W7opfAYbjD5yR0f/WMOWB2tj
	 rY/6dUR7wUWDg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,
	David Matlack <dmatlack@google.com>,  kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org,  linux-kselftest@vger.kernel.org,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <shuah@kernel.org>, Luca Boccassi <luca.boccassi@gmail.com>
Subject: Re: [RFC PATCH] liveupdate: Allow multiple openers for /dev/liveupdate
In-Reply-To: <20260715172336.GC3775915@nvidia.com> (Jason Gunthorpe's message
	of "Wed, 15 Jul 2026 14:23:36 -0300")
References: <20260714190356.190328-1-dmatlack@google.com>
	<2vxzy0fcicpi.fsf@kernel.org> <20260715172336.GC3775915@nvidia.com>
Date: Thu, 16 Jul 2026 17:23:27 +0200
Message-ID: <2vxzldbbhsb4.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Jul 15 2026, Jason Gunthorpe wrote:

> On Wed, Jul 15, 2026 at 03:50:33PM +0200, Pratyush Yadav wrote:
>> Hi David,
>> 
>> On Tue, Jul 14 2026, David Matlack wrote:
>> 
>> > Remove the single-opener restriction for /dev/liveupdate by removing the
>> > atomic in_use tracking and the exclusive open check in luo_open() that
>> > returned -EBUSY. Protect luo_session_deserialize() with a mutex guard so
>> > that concurrent open attempts by multiple processes safely executes
>> > deserialization only once. Update liveupdate selftest to verify that
>> > multiple concurrent openers succeed.
>> >
>> > LUO does not inherently require a single opener. There is some
>> > documentation about it simplifying state management, but the only thing
>> > it actually protects is the session deserialization during first open,
>> > which can be easily handled with a mutex.
>> >
>> > Relaxing the single-opener requirement avoids the kernel forcing a
>> > design pattern on userspace that it itself does not require, e.g.
>> > allowing multiple userspace processes to create and manage sessions.
>> 
>> Agreed. When the kernel had a global state machine in the early versions
>> of LUO, this might have been more relevant. With sessions, even if we
>> later add a state machine, it likely will be per-session instead of
>> being global. So I think letting userspace open /dev/liveupdate multiple
>> times makes a lot of sense.
>> 
>> Also, today's systemd only supports preserving individual files, and
>> does not hand out sessions. To get sessions, userspace must open
>> /dev/liveupdate and create a session. This opens up room for one bad
>> process to block every other process from creating sessions. It also
>> imposes a need for userspace to add a polling/retry logic for getting
>> sessions and serializes their execution around this point.
>
> Shouldn't systemd open and own /dev/liveupdate? That was at least what
> I originally expected here, you'd talk to it and get a session FD
> through dbus.

AFAIK I doesn't do so today. You can either create FDs and save them via
FDStore, and systemd will put them in its global session, or you grab a
session directly from /dev/liveupdate and save the session via FDStore.
Maybe in the future it will add the capability to vend out sessions
through dbus as well, but at least today it doesn't do so.

>
> Moving to multi-opening /dev/liveupdate and removing visibility of
> what sessions are open from systemd is a different model
>
> Not saying this patch is wrong or anything, but that I don't really
> understand what kind of model you are going for now.

My main idea is that I don't think it is the kernel's business to
enforce either of those models. There are no technical or architectural
reasons for doing so. If systemd wants to be the sole owner of
/dev/liveupdate and vend out sessions, it is free to not expose it to
its daemons by setting the right permissions on the file.

-- 
Regards,
Pratyush Yadav
