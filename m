Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DF9470E93;
	Fri, 14 Aug 2026 13:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786714184; cv=none; b=iSrNN0z6a/hyr2MdYv2mB6r+frcR4PY6DaOqTsOyXj89/xDdGAPSOBzU5xXHLOiCWcQdR64/4Mk49dfc5icQPSH0cjvPTtSowDuLtDg3V2MTRalqwY1eTFPAL58qg2xj21olYU8y/5sFp+9PDkJa1uncu4MKVZ9oO9s1Lc0wY84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786714184; c=relaxed/simple;
	bh=qYL6yUVB+aO0Sz6ln65gI2kow+0MnKe6pDoX9RulCUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PCB888WGZwCVO1aAXq8HxoMJjMYxWxJiSp3CMdWaTkyKd0s9rvV57QVi/0XmkQlj+1+F1OB+wk60nenwX8W/WUIVDHSNzFLs7cm9fdUwJZB4C4gvJRe8egwkief+8nC2eM3XmMaPJrlz5DbAOsovLPp9Bv8/xtpo0UL3uu3htAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SWdbd3WP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SWdbd3WP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4973B1F000E9;
	Fri, 14 Aug 2026 13:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786714182;
	bh=NbLcMLw6Z0eZ8ZkrWdwyZfJ0ZOpmixljxjK4YU8/804=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SWdbd3WPTxPQe6MTSuiWsvo4dSbC4rHIH4u/TYOAXe98O+XeMpCT5RW0t4j1L7jAT
	 Q3IrtJoLssfC0Ip1xysQ8Gowchf2Du9S5cOrIwLMkyJ3WN02BCpj52ntDI1ox+hgEL
	 Rv5SW+Q6w3jjjglicBCq5Z1JHy/t29Um/DTTarqvkz5flHuePj1XXVJz6TBcIvoiKD
	 C2noGIybgKe+38x6G1kisvFg9rX8rWf7OCTvhiPjA0MfzspErcedVu/2HNK2yOAVO9
	 uku4SfIuvojFrqPfx/qoZxknd/CyBqjKSL0IAeFstk6Fb2GLco5tsuGWRslo1v6j3G
	 Bj2EzIW1PInBg==
Date: Fri, 14 Aug 2026 16:29:31 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
	nico.pache@linux.dev, baolin.wang@linux.alibaba.com,
	baohua@kernel.org, dev.jain@arm.com, hughd@google.com,
	lance.yang@linux.dev, liam@infradead.org, mhocko@suse.com,
	ryan.roberts@arm.com, shuah@kernel.org, surenb@google.com,
	usama.arif@linux.dev, vbabka@kernel.org, ziy@nvidia.com,
	usama.anjum@arm.com, agordeev@linux.ibm.com, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 05/18] selftests/mm: keep khugepaged out of the
 swapout the swap cases set up
Message-ID: <an8YOxZiXhjwEBYb@kernel.org>
References: <20260812132304.199287-1-kirill@shutemov.name>
 <20260812132304.199287-6-kirill@shutemov.name>
 <178663341429.2230969.913958776768961527.b4-review@b4>
 <an77GjsF5Qip60ql@thinkstation>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <an77GjsF5Qip60ql@thinkstation>

On Fri, Aug 14, 2026 at 12:26:34PM +0100, Kiryl Shutsemau wrote:
> On Thu, Aug 13, 2026 at 06:03:34PM +0300, Mike Rapoport wrote:
> > This commit message broke me, I'm going to skip the remaining patches
> > for now.
> 
> Something never changes. I cannot write coherent commit messages with or
> without LLMs.

TBH, I don't remember problems reading your commit messages before LLM era.
Maybe over perfectionist x86 folks did :)
 
> -- 
>   Kiryl Shutsemau / Kirill A. Shutemov

-- 
Sincerely yours,
Mike.
