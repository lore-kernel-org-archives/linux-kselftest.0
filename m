Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067F4320A02;
	Tue,  3 Feb 2026 13:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770124859; cv=none; b=CULy5hYJeT5m/5xpG9/SJbt+0fVSC+CDb/MB0DH4TMeN/s9c3/Hh7n7f7PmNgwTfK+iwsmeRO2cGPVjDMUCIF8q/hvzA2d859hVzXThzbEq6W/Ax1c/RXbjBauTWG3lxP6gwPrCTWgLCXPlQ7pskg3k9A0E7ThS7GWAo+zCqEYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770124859; c=relaxed/simple;
	bh=Lo1HPCcB7x2IGXhvUvkOz5dhRlucgse7Ilkq6sQY1dI=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=UFYLij8YDzcaf6mF4rLXORLc2SH2Z/Q9Ic9YEIeq0AlBzoAJib6hh/o6URBMNJU6q8oXOhjkkXkHylEaaMG89HAqHqLzyVhIs4nbS35ApPWwGqV44HAq8zvZqM23+1Q3CkE/JMlzwYCHcYO6u1U4PS0be6e5rsDQqf20N6dv8nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j+1Ftoh1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j+1Ftoh1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0293C116D0;
	Tue,  3 Feb 2026 13:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770124858;
	bh=Lo1HPCcB7x2IGXhvUvkOz5dhRlucgse7Ilkq6sQY1dI=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=j+1Ftoh17GFWEtAVgCSWY6MnXVn494HUtllP2DX7nZoaYKIeduAdZzhkS0vQtNwr/
	 0WAym0XCRLD7ea9cbw+p4Lr+O3wVIFju7jte1Xc6WEXiQ7bc0w3mIekLhI4mMF8bWj
	 dbOS1XeAFciYQn60D9Xvtkm2IzYSLVxZvZ/Dli6764f4Ath4pKIBgmMRxVOkHdoAQ4
	 1QCwmSNd4ClHhJ2ufg7UfYKHkECOnJbd8XZgN1fOs22rUzVNKcKRWiSBTS+Il9p5qL
	 HMa2wjrUXfFAnWMh4ywr8hYDoaa3FVjQFC9XzMiN6GWC5uVAI/O52l8YFlCNPIiTbn
	 sATp6mHhe0fRw==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Feb 2026 14:20:53 +0100
Message-Id: <DG5CW3NQOIA0.197CJ4HHWR8EU@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] driver core: disable revocable code from build
Cc: "Johan Hovold" <johan@kernel.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, "Tzung-Bi Shih" <tzungbi@kernel.org>, "Bartosz
 Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>, "Linus Walleij"
 <linusw@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan"
 <shuah@kernel.org>, "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
 "Wolfram Sang" <wsa+renesas@sang-engineering.com>, "Simona Vetter"
 <simona.vetter@ffwll.ch>, "Dan Williams" <dan.j.williams@intel.com>, "Jason
 Gunthorpe" <jgg@nvidia.com>, <linux-doc@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
References: <20260124170535.11756-1-johan@kernel.org>
 <DFX20SA67PF2.VONCFNDOZOZT@kernel.org>
 <2026012554-chatty-policy-42a1@gregkh>
 <aXdxDBXdyqLFfKKI@hovoldconsulting.com>
 <aYHm9pr0e7myeqS3@hovoldconsulting.com>
 <2026020315-twins-probe-d988@gregkh> <2026020307-rimmed-dreamy-5a67@gregkh>
In-Reply-To: <2026020307-rimmed-dreamy-5a67@gregkh>

On Tue Feb 3, 2026 at 1:30 PM CET, Greg Kroah-Hartman wrote:
> The revocable code is still under active discussion, and there is no
> in-kernel users of it.  So disable it from the build for now so that no
> one suffers from it being present in the tree, yet leave it in the
> source tree so that others can easily test it by reverting this commit
> and building off of it for future releases.
>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Acked-by: Danilo Krummrich <dakr@kernel.org>
