Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0031A682C;
	Wed,  8 Jul 2026 06:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783493182; cv=none; b=mIRZ4ND0OZTFW/36wlp3dZoie9Kwf5YC/XwOC28UwMkiGLjulWiGzRTT9k44H1tLNlOyra8EpubSN6VrmnRosaCLvgY/V9x2DYcgCUSer5Xo/wtK1u4hwv21AK1QlfmXE7Ri4K7p4nKoW3mzmAIKS5952h+cAv3uMvnEundwJoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783493182; c=relaxed/simple;
	bh=Wa9pJHyFSKEiQPK7RjrNLgLHKymat3XP10nmcd+OX74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LJjGp2dU50EF+/6zt118NGV0R+fphOPX4hqbma8Opf6vXQ7LwbJ59ZLnQG+Vybz2bXdYhEwtIxEHxsNYUO2x9YdjXsVRTwF93BA/jkijMa5+Omq/TRgCeQTXQ6hCP76+QbHnsMJQvWGjrYBZR7H8mLSuXee/XjmSZezWKwElInA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WJ7LAiHi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WJ7LAiHi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 905DC1F000E9;
	Wed,  8 Jul 2026 06:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783493179;
	bh=Axd3unf6rcXz3NA4/jVvD6Yn6C9iE6woVYFmfNrMFJY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WJ7LAiHitOkxcg+GcaVy5rJ8r+mZ3QG9zX+D/v3fWzfrUzhK7E9NM6bKhjkRz4ijj
	 xFr6p3/RM8+SkQXCcjcVRV/hhyG0rYMDZdE1bDowzbUg+IQ7DCXzThOGyEdiuupxHO
	 0GMLOAxboe8+3ZbZ4RfjsClLS5ko6Nm093GoxEdXJqPcZEOg6IpZbS5j8MdORZOWCk
	 HD7d+VUPkDkeDmT2JuZt+fbvvyjbcX50anxE1CMeGnTakApe91OwFxHZSJ7JPmkYaM
	 JxfdpNmX1TRVJEKo1Nq2n1M+PyUK38gCm0cr9oTvgmenp11E7QsxzCLgjnQteTxjdT
	 HnQKfhkiBzViQ==
Date: Wed, 8 Jul 2026 06:46:15 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Cihan Karadag <cihan.cihan@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Bamvor Jian Zhang <bamv2005@gmail.com>, linux-gpio@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: gpio: add gpio-cdev-uaf to .gitignore
Message-ID: <ak3yN-kH0XsEi16r@google.com>
References: <20260707235707.1349969-1-cihan.cihan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707235707.1349969-1-cihan.cihan@gmail.com>

On Tue, Jul 07, 2026 at 05:57:05PM -0600, Cihan Karadag wrote:
> Commit c7f92042d3f3 ("selftests: gpio: Add gpio-cdev-uaf tests") added
> the gpio-cdev-uaf binary to TEST_GEN_PROGS_EXTENDED but never added it
> to .gitignore. Building it with:
> 
>     make -C tools/testing/selftests/gpio TARGETS=gpio
> 
> leaves gpio-cdev-uaf as an untracked file.
> 
> Fixes: c7f92042d3f3 ("selftests: gpio: Add gpio-cdev-uaf tests")
> Signed-off-by: Cihan Karadag <cihan.cihan@gmail.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
