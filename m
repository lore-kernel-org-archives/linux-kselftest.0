Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE24440A26;
	Wed, 14 Oct 2026 09:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791969478; cv=none; b=JVHSAebLHdkWF8Fafa/nsUOgnUnW+dfaEDhFc2qwDfwMZgBomaxVRafdyxGFfTcCsdRNKjhJ2HO7mm3L4fcN4SBHn5Q0Aolk1NSUdxvsB2ULuGO8gx2t9jcwl5twzjJsMno1eVaoM3JAq13YxkPLtiHgkqQ4eAgopHxBKwTN9/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791969478; c=relaxed/simple;
	bh=4nog34Y76Lw4hkokh15p+3vFOIQZmt607Twy4BywhjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ACELUbKcync5rt6oS3WtZFPQQjJGNuZjSdBp0UgukvNLzNH95ez/0rSDXBKlcqhgfCK8uKSgeUijtmjLXsXMWtfafHqrkBZY3mICG9WNZIPWaWXLxIvKaf60deLsbx4/l4r0gDVEGHburoAJ3wlppdIcmAYg/tsmy9C5eHP5/oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=wNSYi3lt; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="wNSYi3lt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4nog34Y76Lw4hkokh15p+3vFOIQZmt607Twy4BywhjY=; b=wNSYi3lt0J/hkZV/xLwxq1nwND
	mcofcmDjUS9lOB/NrSXuHuoId+oqZgxTUqegmUbXNDBAjX80T6Lxd/K+WfzvQ7AX4GDdepgP4ngoT
	jgw41g1jNmKYdBJHRADZLnTz/y+bTog+Pmqh3OtwYIJ7tO76iDAlZDGTyhgcyStWvMEsWv01OWvhh
	J6MNcbBfzRWv8Kh+Lx5AL8UUvFHkfbbtCN+xh7jc83d0XatwSRUsxyfKNTiaiPx/rIo4CGQ+Rfnio
	we1habKvanNR8urr+i2nJXXw+G6tUeiCLJBTVQpwCPNHEqkLHAfBbvaKI3bZ2ltXObqEJeGswVdXS
	nzsZKL8A==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xGv7C-004If8-10;
	Wed, 14 Oct 2026 09:17:38 +0000
Date: Wed, 14 Oct 2026 02:17:33 -0700
From: Breno Leitao <leitao@debian.org>
To: Koba Ko <kobak@nvidia.com>
Cc: Will Deacon <will@kernel.org>, catalin.marinas@arm.com, 
	robh@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, fenghuay@nvidia.com, tdave@nvidia.com, kaihengf@nvidia.com, 
	rupakr@nvidia.com, mohammedk@nvidia.com
Subject: Re: [RFC PATCH v2 1/3] arm64: add CPU prefetch and cache modulation
 sysfs interface
Message-ID: <as9HWuAhOGMfH1Ty@gmail.com>
References: <20260825181701.3-1-kobak@nvidia.com>
 <20260825181701.3-2-kobak@nvidia.com>
 <aru9Rf7BzW3-vcm0@willie-the-truck>
 <20261014061745.40032-1-kobak@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014061745.40032-1-kobak@nvidia.com>
X-Debian-User: leitao

On Wed, Oct 14, 2026 at 02:17:45PM +0800, Koba Ko wrote:
> For controlled performance characterization, is there an existing kernel
> mechanism or a different design you would recommend? Or do you think these
> experimental controls are better kept out of tree?

As a user of this patchset, I am trying hard to avoid carrying it out
of tree, either as patches or as a driver. Out-of-tree code makes
kernel rebases and rollouts slower, and debugging more complex.

Is there a way to keep a generic interface available under
CONFIG_EXPERT, or something similar, so that users who want to
experiment can use it?

We could even taint the kernel when the interface is used, to make it
clear that the user is messing with things they should not (!?).

Thanks,
--breno

