Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9992C3757;
	Thu, 11 Jun 2026 12:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781180167; cv=none; b=AbQmkcR0lU42X6bTUBvCq6hhuzade3YICvHeq8+c3Y+euHdEh8SMh4Vf+XBKGr7+jQbpySC+3ZAfHpW8LxlBcdu7K076hp0WAfcvEonMxkrR2sd/4Apym6owsjQ8PoY79YpRZ2TU8dVfVfIKOvBEgmQtX5+7hnvrEKJchg0lA8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781180167; c=relaxed/simple;
	bh=zlj3YkxcT4JL+4VXrSfCWKR7kiY48sRG6NdujY/94Qk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p06ZLY/ZhX/x5DxZLjuSYA2AO+iZuPV0QglhSqU1uWU58xu6rYECFcWftvTstP+X9rZdUXsqCAkYl+1F5dQwP5hz62NG7+FVwskoWuwin+hHzJLQxAdycbf77ooubAP0dp9RXkZznv9/Wsm+5YgHpkK1uaQL+I4xoDskwwqduOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P+DY3/BC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P+DY3/BC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 313911F00893;
	Thu, 11 Jun 2026 12:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781180165;
	bh=zlj3YkxcT4JL+4VXrSfCWKR7kiY48sRG6NdujY/94Qk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P+DY3/BCEBZzRZtbE52GFIAtKo1zeDJvzp4GMY0SymOe6AJgpPQdfX5ktQepYtqgQ
	 07DhZVeFK3U0nNwY3kswiPXQ9KMRRiILoiweLuIltMRr3GgupHTG2MBlwHjuo4dyeA
	 uBI0De6byfQAVexGT4k206x4knGJ0YKPxRC5tFPO3TD3FZLwq/7hXRTQhfIF2PpwZX
	 RrxBv5x2xTEMP74xsFCjCeq2A67rGbhY6QGfjHT2iBGPres6PNrUbCme2WhDGqe1zZ
	 oVDvddpK+3yxpRcktB3tfmnPecjszPDWgBERs1WrIzmgMKruHciUeJm839zQ4kqouj
	 1jVs0Dh6475zg==
Date: Thu, 11 Jun 2026 13:15:58 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, david@kernel.org, hughd@google.com, 
	willy@infradead.org, ziy@nvidia.com, liam@infradead.org, npache@redhat.com, 
	ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 00/11] add shmem mTHP collapse support
Message-ID: <aiqm1hK353jXmQgJ@lucifer>
References: <cover.1781083630.git.baolin.wang@linux.alibaba.com>
 <aipSe9Snx5x0esQx@lucifer>
 <47f472ac-0b07-4ffa-a3d4-04fba621252f@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <47f472ac-0b07-4ffa-a3d4-04fba621252f@linux.alibaba.com>

On Thu, Jun 11, 2026 at 07:46:55PM +0800, Baolin Wang wrote:
> Hi Lorenzo,
>
> On 6/11/26 2:18 PM, Lorenzo Stoakes wrote:
> > On Wed, Jun 10, 2026 at 06:29:08PM +0800, Baolin Wang wrote:
> > > (Note: this patchset is not targeting v7.2, but posted for early feedback.)
> >
> > Hi Baolin,
> >
> > Speaking broadly, and to repeat what I said to Nico - I'd like to
> > re-emphasise my _strong_ desire for us to pay down technical debt in THP
> > code before adding any further major features.
> >
> > Really I'd have liked to see us do this _before_ khugepaged mTHP, but I
> > didn't want to put Nico through more than he already endured with that
> > series :)
> >
> > So I'd really like to see some action on that before we embark on any
> > further significant changes.
> >
> > This is no comment on your changes, just something that we really need to
> > address in THP generally.
> >
> > Will try to give some detailed commentary on the actual changes when I have
> > time also :)
>
> I fully understand the current state of THP maintenance, which is why this
> is an RFC. I’m not expecting it to be merged into mainline quickly (but
> thanks to Lance for the comments).

Ack, well maybe you'd be surprised if I didn't mention it ;)

And I will try to have a look through on basis of the technical changes!

>
> Also, as Nico noted, it might be worth reviewing the mTHP collapse selftests
> in this series firstly? as they can help validate the anonymous mTHP
> collapse path for future changes.

Yeah that sounds like a plan and thank you for writing them :) more testing is
welcome and very much appreciated.

Cheers, Lorenzo
