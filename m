Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19BF56472;
	Sat,  9 May 2026 00:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778285703; cv=none; b=H/3Isz+KcmUSUsJqsvsLuEZ0XvgIGDptSs798sBC8Wq5x2IFVg+ZI1qjEfrVzhbgbIyBuGFD2VQfPnrSpXWnGuP1WWD7kIMWdpK/vsKxBpC3o3zgWa+2eYoAuc9YFGFqWGl08Qi1c2wAv8rowhyr1e6jlYKJDIcsn6LrFnoisXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778285703; c=relaxed/simple;
	bh=XhWSoAMtKtTDk59A9/s2NXTizBixeFigOhjcCgD6wUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uu4KWbpsAmUvxaLs5OWEcoP0H1jfPc66TYCRC0oGfzAgupLZ/qqkyKYDsamZ5hKHxuPghkOy8zFW/+XCVB0Rs9b0zPkAtuTx3sx2Dr0MfI2ITAwW5s9K5zAan6lt5hKXHh0negl/oT1o60A+Kcp8QLCQ9hFaDXwYt+gwe9GVvSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ae+lJqaL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ae+lJqaL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 651B7C2BCB0;
	Sat,  9 May 2026 00:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778285702;
	bh=XhWSoAMtKtTDk59A9/s2NXTizBixeFigOhjcCgD6wUU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ae+lJqaLkGfnle+5Ncds9k+4zySkO7FMtPIs6bVYPEkgq22NDiHioa62loP0xPXoa
	 /TxtvYKdH6bx5tfIKiiaKtnPrjM3NVWDFE5bBtugal43K9vUBgf7rINh/awbfxvInE
	 cc3NMwlckCm2mOa22/HyvcqH9yiWn26x18/B4RzsI/UDJWDZpnEXK9BKyTSoil9crs
	 3Sk8dcJZz16saK+82XzBREMZUL4yUwElnhiv5ENPYSJ7Xmm2D2d9hSwipKMMITYEyz
	 Yt/Uu/gliWflqdaI3gbGvvZmdBkraCtl6jX2XQXVYB8e0km9jBcLW/PgqPM6bsvADc
	 ctNPgWy7RmYCA==
Date: Fri, 8 May 2026 20:15:00 -0400
From: Sasha Levin <sashal@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	gregkh@linuxfoundation.org
Subject: Re: [PATCH] killswitch: add per-function short-circuit mitigation
 primitive
Message-ID: <af58hCeOU15570Yq@laps>
References: <20260507070547.2268452-1-sashal@kernel.org>
 <20260508135630.a380e3c187b59e4c04e6f358@linux-foundation.org>
 <af5Z2IvtS5pVorSl@laps>
 <20260508164925.20e09fba0277f0bc8ffc9a3d@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260508164925.20e09fba0277f0bc8ffc9a3d@linux-foundation.org>

On Fri, May 08, 2026 at 04:49:25PM -0700, Andrew Morton wrote:
>On Fri, 8 May 2026 17:47:04 -0400 Sasha Levin <sashal@kernel.org> wrote:
>
>> >> 19 files changed, 1451 insertions(+), 1 deletion(-)
>> >
>> >wowzers.  I'm looking at samples/livepatch/livepatch-sample.c wondering
>> >"why"?
>>
>> Yup, a bit chunky, but over half of it is documentation and testing, and the
>> actual functional code is largely the securityfs interface.
>
>So we can't use livepatch here?

I might have misunderstood your original question.

Livepatch is great when you have one. The problem is getting one...

To get a livepatch, somebody has to write the fix, build it against the exact
kernel you're running (for distros, thats hundreds of different
kernel/arch/flavor combinations), sign it, and get it onto every machine.

Most regular users won't be able to do it on their own because of secure boot
limitations, so they depend on their vendor to provide them with one.

Yes, you could write a livepatch that just stubs the function out, same end
state as killswitch, but you still have to build, sign, and ship a module per
kernel to do it

Killswitch would be just a single write to /sys which an ordinary user can do
to mitigate a critical issue immediately.

-- 
Thanks,
Sasha
