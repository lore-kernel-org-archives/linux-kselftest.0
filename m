Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79AA4DC540;
	Tue, 19 May 2026 14:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779201757; cv=none; b=lIUMcIu6X+O2zxHDHZJASun4WToYsjmI43iqaZSGottBszqrWYcLoiC7YnuTwv8eeUPLJ3v2fSLx3eToYfy0PHZW6s9hxmbq6pgaJZvTSzNk0cybKrNTsqKowv8IElwED9mG1ZY7LQvezerF/jJWsB1fS1C1qZ2vUes4XkFY4yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779201757; c=relaxed/simple;
	bh=gZUPn0thWWcRLq+hL7RRcuZ8J7xKYMtWj50oTxxnZMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qDWDZeLiJ+XJSWuqmr0VzsWAaEZMS8bY68lDjC+UUwd9CfGbGF5ELZkVbEuiwbXAx5T2xdL7X9BaTRE9+61U85Rt8HlvQRS3nOxXNqrUSsZlz63bcTgMLx1Ejlcnc1YQteBQ8S7MI4kWnjoJ1XmztFMagJ0riY77m27jMKnDnp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=YHIwKCT6; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="YHIwKCT6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xggIsu9IlsJApfE/AIZbC1aUcvuXbiwqdJlVuWjlH4k=; b=YHIwKCT6mhmrkQKAVlR1c2lLw+
	8NY3VqUQJx78CwxYpWmyHHQYwdlj5tbvTk5DDDuXG/HO8dGOZ0WsnEAVlBpsR1amkWBU6TmFC3vun
	mpqr+WPHceVH6GQW22C9dARBlI2OCdquB+Nv71SjVKmF3i+OvgkSJgUX1C0bLG0qiZn18SuopdAEB
	iDC0ScgJiUvSyz+mP3JWYoCrun1I8Fsmoj+YAmO3zUj3qVK5xfsijH8F79l4QOwxJE70H4a+/uoMY
	pUiVwzC5AKKnniidDgshuDBOurv/DwFrIzOKxpGO/6XLb5krwHQOfRZdVWEm0jaVe+obiD+OnRoOI
	wDA3p+QQ==;
Received: from 2001-1c00-8d85-4b00-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:4b00:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLeL-0000000EXa9-2iii;
	Tue, 19 May 2026 14:42:26 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id ECF50300B8A; Tue, 19 May 2026 16:42:24 +0200 (CEST)
Date: Tue, 19 May 2026 16:42:24 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Richard Patel <ripatel@wii.dev>
Cc: David Laight <david.laight.linux@gmail.com>, x86@kernel.org,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Yu-cheng Yu <yu-cheng.yu@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>, Kees Cook <kees@kernel.org>,
	Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] Usermode Indirect Branch Tracking
Message-ID: <20260519144224.GB3067227@noisy.programming.kicks-ass.net>
References: <20260517183024.16292-1-ripatel@wii.dev>
 <20260519103345.49e52ceb@pumpkin>
 <agxiORpLBErOxLin@wii.dev>
 <20260519142808.0d3605ab@pumpkin>
 <agxxHHKCOh3TpWHv@wii.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agxxHHKCOh3TpWHv@wii.dev>

On Tue, May 19, 2026 at 02:18:04PM +0000, Richard Patel wrote:

> > I don't know if userspace ever cares about speculative array access.
> > If it does you need one of the mitigration - eg using cmp+cmov
> > to generate a jump table index that references the 'default'.
> 
> Intel docs say that "CET-IBT limits speculative execution at indirect
> branch targets that do not start with ENDBRANCH", with heavy emphasis
> on "limits" not "prevents" ... Is it too unreliable in practice?
> 
> https://www.intel.com/content/www/us/en/developer/articles/technical/software-security-guidance/technical-documentation/branch-history-injection.html#inpage-nav-4-3

You might find the commit log of: d8122c428076 ("x86/ibt: Implement
FineIBT-BHI mitigation") instructive.
