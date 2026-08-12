Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A473A7F4B;
	Wed, 12 Aug 2026 20:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786567869; cv=none; b=dSN/DA+9NQfsZPPCitamvqe/PkNpqjTXcTo/inTRGUfBtrcCzYy+gHecJkE/FZxuYOupyLRMkmuAcb/YbVNgdBqGYIFgv55N2Al9MkqjIAIO4pEcN2ruRPPCT2R+XUFAWygH5TFDvP62AWItOSghPUH1f9caAIc53v3oyhOkSo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786567869; c=relaxed/simple;
	bh=H9mi1ON4/eKuUNpn68ibjBF2Yp1aZvUneE4emTx7/UY=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=BXk5TtZx8OZvchqsHGprDf6S1+jrkog5NLXuIr6Af0xlbVV6XNmN1IrwgXTU0/C2BDGc5Ckc0Apcw11KBiwTWBQg00trA2iqMj3CA0Hd23vs2wHCQgJ0VT011r354U5ulAgT6ne2oNLMcG1SLqdk8WPUvBubuOWGiDhH/xj9XDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=C/SPeLcb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="C/SPeLcb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4363C1F000E9;
	Wed, 12 Aug 2026 20:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1786567867;
	bh=67F9PoDSJyF5NhuVxr1eoGrgb3Su1mBz2fUlFv/Yg6E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=C/SPeLcbVdAGyhpeOF9YIAKyitqm+ISjHcu8A6lDmGY3kDhvRbUOvS7dMvAhy6ADC
	 w2TQ98DCE2fHLETpDp5JhhAanCXA0CKhT+S/YpH48L87+IunQkRj7N14RUHiGAenBz
	 c8EI2P06sPS+6XUmX+JLNJF+WAcg2Yc+fDwq/vDA=
Date: Wed, 12 Aug 2026 13:51:06 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Song Hu <husong@kylinos.cn>
Cc: linux-mm@kvack.org, shuah@kernel.org, david@kernel.org, ljs@kernel.org,
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, peterx@redhat.com, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] selftests/mm: TAP output and global-state fixes
Message-Id: <20260812135106.7709da03e92e0e7f5d8d9a5e@linux-foundation.org>
In-Reply-To: <20260812120821.523860-1-husong@kylinos.cn>
References: <20260812120821.523860-1-husong@kylinos.cn>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 12 Aug 2026 20:08:18 +0800 Song Hu <husong@kylinos.cn> wrote:

> uffd-wp-mremap and mremap_test never print the TAP header (and mremap_test
> skips with a bare exit(KSFT_SKIP) rather than a KTAP skip), so their output
> is not valid KTAP; hugetlb-soft-offline toggles enable_soft_offline during
> the run and leaves it disabled afterwards.

Thanks.  AI review found a couple of minor error-path issues, both of
which look legitimate to me.
	https://sashiko.dev/#/patchset/20260812120821.523860-1-husong@kylinos.cn
