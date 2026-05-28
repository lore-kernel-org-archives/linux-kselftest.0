Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB7933A702;
	Thu, 28 May 2026 20:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779999077; cv=none; b=gAo3XlF+Eox1PghvZEqDE4h6wwqIX2hw5zSz7xu2bP1/ZU43RZWNqjwSbQSI7Mygvr+cf3tdio5WvzxQNDtknNE8Xicqs0HxLcgrtOy+7jSVETUswYrQxyrvncQ5HeAFRXybNwLLkJ2D9FJRUaKlQMIrqr+DMECF8FCQaNiw774=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779999077; c=relaxed/simple;
	bh=h7vMU9iiuA671z5I/L7lm643Un9uDzaFmhvDfqVYsEc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=TAj4l8LTb17OvbMSPXO4XTgTnJUHWg5/ePbYU/SVeJk/GtAQZLPLS7KZ1hsvmN3B4RzlrirEHl9oirj7tQniekPaxx6sVR2H3k9xpaAG88CtVoWMIiAQFitPT0tI9FO27Ifzb2Hpj0XgNadRBA5Xohx+IsA1cOoOcMwEk5meePU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ekq60DDN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ekq60DDN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C5A01F000E9;
	Thu, 28 May 2026 20:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1779999076;
	bh=RUpZENdsRQQGhSTXMjyju/sJ1S/GlspTzkqqk0lo4CY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ekq60DDN0/EfqbYTRZfD1WiirUXWxQTPTxY16rdb4/7wMAOQIUWk323IYixJjRiPk
	 jkmhpvi9QLv+pmc6Yu7hQnEn5mwLQcrYWkOPOryXldXhd3rlh3reJtix4vap6bVGE2
	 Jewn63vowTVwVLGqclVBqi7ztiwbv7FXpQC6FQNo=
Date: Thu, 28 May 2026 13:11:15 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Stanislav Kinsburskii <skinsburskii@gmail.com>
Cc: Liam.Howlett@oracle.com, david@kernel.org, jgg@ziepe.ca, corbet@lwn.net,
 leon@kernel.org, ljs@kernel.org, mhocko@suse.com, rppt@kernel.org,
 shuah@kernel.org, skhan@linuxfoundation.org, surenb@google.com,
 vbabka@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v3 0/3] mm/hmm: Add mmap lock-drop support for
 userfaultfd-backed mappings
Message-Id: <20260528131115.184c178d03d516e11248a1ae@linux-foundation.org>
In-Reply-To: <ahidV_iSq3E-FtMI@skinsburskii>
References: <177928604779.589431.14703161356676674288.stgit@skinsburskii>
	<20260521163309.c5cc5d3f6cf16bac212cf90b@linux-foundation.org>
	<ahidV_iSq3E-FtMI@skinsburskii>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 28 May 2026 12:53:59 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:

> A gentle reminder as requested: do you think this change could be taken into
> the mm tree?
> It's beneficial not only for the MSHV driver, but can be used for
> post-copy live migration of GPU states in future.

Still no review, alas.  It's not a trivial thing, affecting both hmm
and userfaultfd.  And we're closing in on -rc6.

I'd prefer that we revisit in the next cycle, please.  Refresh retest
and resend after -rc1?

