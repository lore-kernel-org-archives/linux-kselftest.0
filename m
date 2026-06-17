Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C867533A9FF;
	Wed, 17 Jun 2026 18:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781722502; cv=none; b=diP4dg5+GFhBpBotvFf6zecr/A/qXLq6fuRBMMA4MfLqseePtfdYHnWK0mEBMSa00VA8VNUOPv1ERUb1HxacO4ntg18VbpsiIzeRNsS/w2e2Eeczlk/Zn6Ol96ZhmQUwGZwbAzCkkhEdCM5LkqyEhDaDU6c/0E8IIut/vbc6FGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781722502; c=relaxed/simple;
	bh=DpUqNquObmE03rS8RTcUpvAzBDb/Bd9a3jJ1IyjHQg4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V32+eZJjLZvd4sHcFsVx6WWr8/upuFijG8bB3Ov29YPDvRp1TtTmLA432D3nEobfY+iIWcFnvb5adlLr/ZnO6NDejsWopXfn/tdSffToFLNBcV7tEVlsn/RVIMrST+6fpbpeCEFYu2hqe7u0omlIXeqUnD4eWsmMdhC2J/jsY1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AyZwN4Pj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AyZwN4Pj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 320801F000E9;
	Wed, 17 Jun 2026 18:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781722501;
	bh=U1bbfpOi76uZLkjjM5hdUbezqwfs0rnC6JfmnVvraEM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AyZwN4PjHO+se1mFQ1BUiIgEFn4Fw3i71UjrEZmF5g+xuYvUV8KMJGNcIg4AIjfdF
	 gCiJum6xAHkK1lXj+PF56xwHtC5O01vr01A25mTC7ICMI9AHTWph6rtbF7cwNnJogv
	 yquIHwyfi+BrqRn2bLr/9n4I0Qz6hjaw/NVzPRlEYO47ehNZshag66NybsS1l8cf+Z
	 PxEF6sy7VnN8bg4G2L6M2ZZoewluoURU5q4aTKK9EeL7QhhCzj9aPcsCffJo8UmRWq
	 g1xUpOgmG6nFKeg25o+yUybrq4O30DLN/t7MOsOdDWCDq8jk+FrN4z99S+dXH9MG2W
	 47X+YX/wiYWsg==
Date: Wed, 17 Jun 2026 21:54:54 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Vipin Sharma <vipinsh@google.com>
Cc: pasha.tatashin@soleen.com, pratyush@kernel.org, tarunsahu@google.com,
	skhawaja@google.com, shuah@kernel.org, dmatlack@google.com,
	linux-kernel@vger.kernel.org, kexec@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Make liveupdate selftests library
Message-ID: <ajLtfkuMP4DEGlqe@kernel.org>
References: <20260612214512.464146-1-vipinsh@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612214512.464146-1-vipinsh@google.com>

Hi Vipin,

On Fri, Jun 12, 2026 at 02:45:10PM -0700, Vipin Sharma wrote:
> Hello,
> 
> This is v3 series of refactoring liveupdate selftests as a library. It
> exposes common liveupdate ioctls as a library which can be used by other
> selftests like VFIO and IOMMU.

Let's revisit this after -rc1 is out.
I don't think there would a need to change anything, it's just the matter
of applying the patches to the right base :)
 
> Currently, there are no users of this change but it is being used in
> VFIO and iommu liveupdate series.

-- 
Sincerely yours,
Mike.
