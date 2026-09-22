Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662203E3C49;
	Tue, 22 Sep 2026 08:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790064390; cv=none; b=VWP9UGi2DYdZJVW1cvmQeJdw6rnf+Ej3QX0bhBnJ0bYOlGVV/H0UbNpVYCcwbisTc30XgIZXs+G9reDFEijCBbEUIHrUhbvwfPAM8FQ4QsX8Gwlr5Wm4wbijdvxKyCjFfiT7LJOlfjH1mo8W5ywTOPAGk0tlQ0WAdjKY/i/IPy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790064390; c=relaxed/simple;
	bh=Iia1Zz0VnUherJv89bRH8kHkL5qpddV6g3hrBDu1s90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YMtC5EP2JHcGtLTfjoN2WXJNoLM/e/O0RvKKEG3RS1LF8u1lBsQXg6VqWRyj9l1AVfX1JGvkPBlSX9PLv248p0A1osfN3CFvII6HAn927Yc6C25W4Y4JnseYoFr8l7DJmZNblKeAjgUKILuNF1hrNJN6qDxt59Ma8BNpSL1CWC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=boAuJJId; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="boAuJJId"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 268441F000FF;
	Tue, 22 Sep 2026 08:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790064379;
	bh=6Zqym6D41lbWl1qqdDfB+XAdzgeIh7z3k+GpUxiR+8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=boAuJJIdMAD71oRg7WZDTWVjhYholDntby3vKk/sx5VujBDV5U33SMA+V+QJ+C/bd
	 O04r5iqqH5hp4mir/9Jza6f/yC03jXf90hmAWRlW5Cs1Jv9qQXO2o7k95+J2KrQ7Ok
	 vhvPF+6d+UvKA8eBcUWUa8hrAO+xkf1ZhAJfWVEXaTSpKqR7Vn3tqKLz4bnp11TlMo
	 dV4aNrLLLbZcoTrqXkOpTGezNtyqtErFD/hBNoxFJ2z7huNSbBivcKv1PD3fI70fX/
	 Fb+B1OlWB9bUz/xPLgbMTG1s1X3YNZgACspNdfNMDsZQXM7FaY+1IWSuHEvBZRbBPG
	 A4M2rJqKOew4Q==
Date: Tue, 22 Sep 2026 09:06:14 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Park Tae-sun <ts930@dgu.ac.kr>
Cc: Sarthak Sharma <sarthak.sharma@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: mremap_test: handle ENOSYS for userfaultfd
 and add missing newlines
Message-ID: <arI2yv7TgtJLjMMr@gremlin>
References: <20260922065143.118702-1-ts930@dgu.ac.kr>
 <2e0a8157-a529-4355-bd7e-11ef0234b825@arm.com>
 <179006158019.123863.10328178989374348836@dgu.ac.kr>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179006158019.123863.10328178989374348836@dgu.ac.kr>

On Tue, Sep 22, 2026 at 04:19:40PM +0900, Park Tae-sun wrote:
> Hi Sarthak,
>
> Thanks for letting me know!
>
> That sounds completely fine with me. I independently ran into the same
> issue while testing mremap_test in QEMU on a minimal kernel without
> CONFIG_USERFAULTFD, so I'm glad to see it addressed as part of your
> larger series.
>
> Feel free to add my:
> Tested-by: Park Tae-sun <ts930@dgu.ac.kr>

Additionally, for future reference - you were missing cc's.

Fixing this is easy with b4 [0] (the recommended way of sending patches to
mm):

$ b4 prep --auto-to-cc

Alternatively, you can use scripts/get_maintainer.pl:

$ scripts/get_maintainer.pl --nogit-fallback <files-or-patches>

[0]: https://b4.docs.kernel.org/en/latest/contributor/send.html

Specifically, the following appear to be missing:

  david@kernel.org
  liam@infradead.org
  mhocko@suse.com
  rppt@kernel.org
  surenb@google.com
  vbabka@kernel.org

>
> Thanks,
> Park Tae-sun

--
Cheers, Lorenzo
