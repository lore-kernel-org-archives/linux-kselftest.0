Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E703D75CE;
	Tue,  1 Sep 2026 14:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788273902; cv=none; b=YQwo/Ke0RrXAf3TlSae7mdOh4sJ98OQG9JUkEd44X9QUjJbbA2Ly6bXWm6lW6NMILFJA3IJzWyKYCnE2EKgOgwk+CFlxEzFm32/5VuGQU9YELxrfv2ThJoocSprRk9sj/EUTQLUTPa6NDz1CdSkyNb2El583E983HIAKAvXlrT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788273902; c=relaxed/simple;
	bh=fWr0IXllVvonydRiWo7uvjcWM9SUwhDXWkBfbH0U7AU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZxNa9Uid7R7hBgkLptVh1ZICHXOXcgPyQseCnCZ+1lprOWOKzGpeUwwwYI0qX5DvZ96H/QtfR3+lq3IUnoLCp5XXLD6Fd87T4LoNIy6NdpBlwu0ljc0yfQ10fg59mWsRWIyYgDg+c59Ov1XBqKLtzH4Tmkyk2tGxeAAO4YLZhuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JbQsYQQT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JbQsYQQT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8D871F000E9;
	Tue,  1 Sep 2026 14:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788273899;
	bh=fAIsm/HteRf3YKYFv2nKHjUIchlu3eaENoAxwWG8aEY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JbQsYQQTryTJccngjQ6sMGW5kFfCavhUFjLzV4MjqkHi+BCzDmSYL5sVMBrrEt8h6
	 ktgB1GV43LZv/WsX/Cvn1eGJsTE9h2i0ss//1pzBa8nQq1CuANiviKerSRkcVhQ368
	 rVsBLyMjr6sQfWasTsIczZFZPpDR0E3U3SjQOi98KqMhYvzEWFqzVAw9aN7vDSnLRS
	 pgLTqQXL/riVvYdkKcamGBovzkNxn9/95svzBrkDubdasz4HNTM3W9B/ZIb/xeIBIb
	 jut2js8skF45pnqjTJ/o6Vr4ukAjg6/C6XVq9xmOMilcFlaTnMQn19gUcg6KHB5gPx
	 PbkOK5Iq8sWoA==
Date: Tue, 1 Sep 2026 15:44:52 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Hajime Tazaki <thehajime@gmail.com>, david@kernel.org, 
	linux-mm@kvack.org, liam@infradead.org, rbm@suse.com, akpm@linux-foundation.org, 
	luto@amacapital.net, brendan.jackman@linux.dev, liuhangbin@gmail.com, corbet@lwn.net, 
	kees@kernel.org, broonie@kernel.org, mhocko@suse.com, rppt@kernel.org, 
	shuah@kernel.org, surenb@google.com, vbabka@kernel.org, wad@chromium.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-um@lists.infradead.org, 
	geert@linux-m68k.org, daniel@thingy.jp
Subject: Re: [PATCH v2 0/2] support kselftest on nommu platform
Message-ID: <apbknMd-vv6jliZu@gremlin>
References: <20260825015945.141739-1-thehajime@gmail.com>
 <f2ac9432-4fea-4007-aab0-ad80597b284c@kernel.org>
 <ao2Tl9CLL7WjHYun@gremlin>
 <bb9a3add-4849-4928-8b6a-0afc0c73b112@kernel.org>
 <ao2l9Ao7BQI6uRKC@gremlin>
 <m2y0dsuf1d.wl-thehajime@gmail.com>
 <ao_541nBaa3SJS9F@gremlin>
 <m2v78wueir.wl-thehajime@gmail.com>
 <apAgQJ5p8LEDj1c5@gremlin>
 <40e95edb8dafd88fd13c3003c0e76df6a2f124d9.camel@sipsolutions.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40e95edb8dafd88fd13c3003c0e76df6a2f124d9.camel@sipsolutions.net>

On Tue, Sep 01, 2026 at 04:28:49PM +0200, Johannes Berg wrote:
> On Thu, 2026-08-27 at 12:32 +0100, Lorenzo Stoakes (ARM) wrote:
> >
> > Ah ok cool, thanks! Is that headed to 7.3 or more like 7.4?
>
> Seems everyone was on vacation (I just got back) so I believe it missed
> 7.3 since -rc1 is just out.

Ah damn! But understood.

>
> I hope to have enough time in this development period to the merge
> window to figure out all of these things and get stuff merged - UM

Ah that'd  be great!

> wasn't on my priority list with all the (LLM) security(-ish) stuff going
> on in wireless.

Yeah entirely understandable, I think we're all being pummelled by AI
lately :)

>
> johannes

--
Cheers, Lorenzo
