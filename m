Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F938261B71;
	Fri, 11 Sep 2026 10:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789123013; cv=none; b=UneYoSxRv9pWkv29anYX9RUcuSYNWtBnqPSBINJ6b2rSg9bu+LRXur61W7mt2uqXC+M8NTXtasZGkujp2bgQZrMgAfsG14aFpa0Lw6HaX6si959A4UkgypaUuc9MXl4/W9f05vXESMYiCAkOoAeLJ/Wyg4yIO5D+81/sSWrlcDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789123013; c=relaxed/simple;
	bh=4Z0wBwgDK9LJpl+aoC6t5DrR4Cnkpggpd1pLyt0mNxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PR6DbuM2c0chZaS44UWx64jEoh1UyFJSAhmRItETVORC3vCaI7R9jdpCDq5bz5AsXqwcNCcONKfCRYjGGb2e/90A4Cj1Yd5tq3VldhXnKhvcZrdbXSThb1FDaXHvUp96HXQsDBaaIUe1ueLboApS3PX8BosumanQNq7FdWJr2aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XCTFwLye; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XCTFwLye"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7A301F000FF;
	Fri, 11 Sep 2026 10:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789123006;
	bh=u5aNvPNusM3lltrFeHu+T3Gy46Tk3FMqRHWpoFiEgHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XCTFwLyeNcGWza0A58ztj0+blr86fxoT0uLerrweLvAud52RAU4HEVRqyIDhPRYHl
	 aqqrxAVE5wyo1jbDIhs6oNDEkHWiqVW2fGnQCzr23+Yi938zllVi6ziOkDtpOUmdw+
	 gklPi7YNzFHbSLfuOg1apLpJ8xZsZzoaheht1l/XXMGAF5IZPO+yQHr40+r/77QjZz
	 8MemdgxGBrPDR+q9UwtNqnd5gDLzZfXEXg0QOOyJAMFAh3gFDKHJXqFk0LUOfk9qGQ
	 ElvihhXGQBZk5UEy2yum15sx7gTjFx49upfF0S/NZQwlV3mfcLbxoM87DCaRkIfyt5
	 EwEprbKtph2IQ==
Date: Fri, 11 Sep 2026 11:36:42 +0100
From: Simon Horman <horms@kernel.org>
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	Hangbin Liu <liuhangbin@kylinos.cn>
Subject: Re: [PATCH net-next] selftests: netdevsim: add TEST_INCLUDES to
 Makefile
Message-ID: <20260911103642.GB48209@horms.kernel.org>
References: <20260910-nsim_lib-v1-1-0be0d49eaa42@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910-nsim_lib-v1-1-0be0d49eaa42@kylinos.cn>

On Thu, Sep 10, 2026 at 04:06:58PM +0800, Hangbin Liu wrote:
> From: Hangbin Liu <liuhangbin@kylinos.cn>
> 
> Some netdevsim selftests source forwarding/lib.sh and other files, but
> the Makefile doesn't have TEST_INCLUDES targets, which makes
> 
>   make INSTALL_PATH=/tmp/kself TARGETS=drivers/net/netdevsim \
>      -C tools/testing/selftests install
> 
> failed to install related lib files. Add TEST_INCLUDES to the Makefile
> to install the dependencies.
> 
> Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
> ---
> As there are multi nsim selftests include the lib.sh but no error report
> for the installation issue. So I won't bother fixes tags and just post
> this patch to net-next.

Reviewed-by: Simon Horman <horms@kernel.org>

