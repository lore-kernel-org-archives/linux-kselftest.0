Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C84337A498;
	Fri,  2 Oct 2026 11:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790942020; cv=none; b=GZ7nLJXsdjN2mFnCtP1YyyZyxuMiX3zbjdVhzME50QiptGEjzvl2Sc6GrLLEFb84pVlKV8hvZAZGYdGqruoE376J3CTDieDVbm0Flw6ibGYvjdMsVvsQ/Z9KeEhZ+zsSMGmuXnGMsoD/eyY7/TXsLJe+R0X/w7NPyfsUbVIXxzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790942020; c=relaxed/simple;
	bh=JmxZmAkX7sFWhZEhSwoTFCk9Ly0sqzCLy0ifziPCklE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IRps4JLgymQAGiKKNQTSo3CuAJ4QeVhWZFkrrg67Bmrpz9CdMt8vpvYKauJIhm2YoVYXMWIg8zS6bH9biSiim58DvZJPiFiluIhLOkdOSAZ5B4/+zVNb1twK6prgKPu5nd92nB2TGjiG1OmquCTiRimWCUF4cYOdA8NwP8H8JRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LrjaOiT0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LrjaOiT0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C51911F000FF;
	Fri,  2 Oct 2026 11:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790942019;
	bh=JmxZmAkX7sFWhZEhSwoTFCk9Ly0sqzCLy0ifziPCklE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LrjaOiT0/kgKG5xJcHuIQQl96aDNH27jEWYo6/eukxIaqQwYL0Yi2fb+zu/vFRBId
	 DV/PZj2ePkgKFhE9/F4nvTYUADBF7H7T9RJOwDn3NIgMGlyMKcDuTAtoTIIkUsgDb6
	 x1URYwePs3Vebu4nOuyyzGzHW5Vn2MCe8aXxTi+YGMS6b0csgZWtq74p7c08jB9xPQ
	 ZpKgg9fwiync7utyBiMm2bPjVpvUOrU7S6mG7pstrUJvNj/jPcuRO+yDhhTGtADvXL
	 1IZ7ntsJFFvW9x/WXyQUNm7oAqTFgJ+zZzw2Hn0ou+zpclpaPwQJ68poxNuVNU2M6q
	 o+8PkQiPxtQUA==
Date: Fri, 2 Oct 2026 12:53:31 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, 
	Hajime Tazaki <thehajime@gmail.com>, johannes@sipsolutions.net, linux-mm@kvack.org, 
	liam@infradead.org, rbm@suse.com, akpm@linux-foundation.org, luto@amacapital.net, 
	brendan.jackman@linux.dev, liuhangbin@gmail.com, corbet@lwn.net, kees@kernel.org, 
	broonie@kernel.org, mhocko@suse.com, rppt@kernel.org, shuah@kernel.org, 
	surenb@google.com, vbabka@kernel.org, wad@chromium.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-um@lists.infradead.org, daniel@thingy.jp
Subject: Re: [PATCH v4 1/2] selftests: run tests on nommu architecture
Message-ID: <ar-bIzYDdlOKUqla@gremlin>
References: <20260929235711.2287931-1-thehajime@gmail.com>
 <20260929235711.2287931-2-thehajime@gmail.com>
 <bda5eeaa-7868-4d4a-9026-9e99347afd7c@kernel.org>
 <ar4br2vW7yZGd3gt@gremlin>
 <94759bed23f00d2044005e36be6f72f297e092f0.camel@sipsolutions.net>
 <m2se2o3jyc.wl-thehajime@gmail.com>
 <a65f4431-d225-4535-b921-00319ceeb2a2@kernel.org>
 <ar9ldn036SgT-bq1@gremlin>
 <CAMuHMdUKcUxHZKhTEF1gwWrU1o8O6jt6N3r90V5hynrLFdwY0A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUKcUxHZKhTEF1gwWrU1o8O6jt6N3r90V5hynrLFdwY0A@mail.gmail.com>

On Fri, Oct 02, 2026 at 01:38:31PM +0200, Geert Uytterhoeven wrote:

> On Fri, 2 Oct 2026 at 10:10, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:

> > But fork() -> -EINVAL or -ENOSYS = nommu, then just have the child quit and
> > etc. should do it.
>
> fork() is not strictly an MMU-feature (you can implement fork on nommu
> if all memory accesses are done relative to a base address register),
> while I think mprotect() is an MMU-feature. Unless it can also be used
> to change the protection using the one or two BARs most MCU haves?
> Anything else that is a real MMU-feature? Non-identity mmap()?

Does any nommu arch implement fork() in linux?

--
Cheers, Lorenzo
