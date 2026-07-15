Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6481A9F87;
	Wed, 15 Jul 2026 06:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784096162; cv=none; b=gilDy0hrCJ3sodr/jSNm+UcwnNFGGeNRT+/BjFWdIWvWdoPyvHAYbDBu9EdgCXCjQiZZagLURfPaTQ5MAyQSwPrMz55jVYBGVnMKBPuBrG4LbCdB22fIFjO+O3fQHBRI45b769/aAJgor2Kns9aZ2g/DK8c7atmiXk5DK6XA/4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784096162; c=relaxed/simple;
	bh=6FWeW5F1hISirJAgOV+MHT5MJaCLdrWrxQpv2L0dPW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D1l5Tg150QPRPaKnXCAkCmKbuhJtqHCZ7iSw81oUlTrvAjKLl6RlwulEpMO5Sjh8KnRli0YeVzvi5tHlMRkNCyX7XLRDSqj6EzYGz+2D+aqkTRS46yEq77KoZI74MZb7qSw9EBr+UZH4+I9rmQrtiQyOyiWTTz74u3pynQNRkag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E/r6OHEb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E/r6OHEb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FE6C1F000E9;
	Wed, 15 Jul 2026 06:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784096160;
	bh=1GVatgkJkgt1f7n14CxE5fSjwzfbGzAqCHxfBSSq8xw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E/r6OHEbwq4pdqs8b1RF+NnQK3qU4esSIWQ6dr6wAgOVVon4f2sVQgIfZUvPYQm6g
	 8hHZSzTJrHAb3a4B8bZvYjyh7yIXXvf/Pk6hZmjTiUWj1OaRmd5uf1mF5uDtg0FDTU
	 dbjahm8oevNsb8i5z1FdGWStz54H+cZWCwbSPtpGIrGB+qpkwRnKFYXpGr/lD0iguD
	 zIRkHTRey0NWbmqwqQP2lIzjF3l8oVpW/HyfI5qP8ju/P/hw/AdX2I1XPC5mozS65F
	 8mY+o8a0MXFRKfaUXDiOWufLShLVCcwwV+bn7/bdnlTCwa28hb+XFQ1jSFQUioLQWX
	 1/NY4J/80Tf/A==
Date: Wed, 15 Jul 2026 09:15:53 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Vipin Sharma <vipinsh@google.com>
Cc: pasha.tatashin@soleen.com, pratyush@kernel.org, tarunsahu@google.com,
	skhawaja@google.com, shuah@kernel.org, dmatlack@google.com,
	linux-kernel@vger.kernel.org, kexec@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Make liveupdate selftests library
Message-ID: <alclmQIb8D1td-sw@kernel.org>
References: <20260612214512.464146-1-vipinsh@google.com>
 <ajLtfkuMP4DEGlqe@kernel.org>
 <20260617190754.GC2704872.vipinsh@google.com>
 <CAHVum0dL+p-j1EwQf69p87MU1s8Er9RsOaMMbprFnmNeEdS6-g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHVum0dL+p-j1EwQf69p87MU1s8Er9RsOaMMbprFnmNeEdS6-g@mail.gmail.com>

Hi Vipin,

On Mon, Jul 13, 2026 at 09:49:51AM -0700, Vipin Sharma wrote:
> On Wed, Jun 17, 2026 at 12:08 PM Vipin Sharma <vipinsh@google.com> wrote:
> > > On Fri, Jun 12, 2026 at 02:45:10PM -0700, Vipin Sharma wrote:
> > > > Hello,
> > > >
> > > > This is v3 series of refactoring liveupdate selftests as a library. It
> > > > exposes common liveupdate ioctls as a library which can be used by other
> > > > selftests like VFIO and IOMMU.
> > >
> > > Let's revisit this after -rc1 is out.
> > > I don't think there would a need to change anything, it's just the matter
> > > of applying the patches to the right base :)
> >
> > Sounds good, thank you!
> > >
> > > > Currently, there are no users of this change but it is being used in
> > > > VFIO and iommu liveupdate series.
> > >
> 
> Hi Mike,
> 
> Let me know if you are still planning to take it as is or if you would
> like me to rebase on the latest liveupdate repo.

Rebasing on the latest liveupdate repo would be great, thanks!
 
> Thanks
> Vipin

-- 
Sincerely yours,
Mike.
