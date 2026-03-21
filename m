Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9372EBBAF;
	Sat, 21 Mar 2026 00:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774054498; cv=none; b=tgNkqlMJ9uidRa3eu/8ZM/0o5c8tYm9E4UJcsFhEl2qJ9sbQ5MONhf4aor5JSaciyN3M8/9LADJENHAoVStFAy9/Dacz6fWzdCZq12VR5IwmR/DTYcn/1dBSE4//0kUSoZ0IfYZUlyph22sTDOgzjLHmS13d1ufVVLji+8j55XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774054498; c=relaxed/simple;
	bh=qa/nXm2lQDzYOfPzKSQx8dKHj+Y27voBIEJmPJeHo+o=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Kl1UwJhakks9Ncjo1p8hcFehdoH2FCG7jAJw4EwwfUiDa98YfIKhi/42rJbXQN4fN5ObYxB7QZPnHGrvwk0DzaNGoNny1b4V96jMDyCc3g2VtSMcrheTON7w+i6PtqPI+L1DXk6xOdYOlirwl8lpSiSLhEeDiQ+YBdL9S8HD3FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E7EVIvEz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E7EVIvEz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87968C2BC9E;
	Sat, 21 Mar 2026 00:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774054498;
	bh=qa/nXm2lQDzYOfPzKSQx8dKHj+Y27voBIEJmPJeHo+o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=E7EVIvEzmpaipMFDaprEtqYlF30YXLWD6o5CIoFOmxMwFrCg2noU6Q97V92pP1lQN
	 VESWsmgu/BzpdAdprDKJh4Rlfko4gvpHfhMWqOD6B5SHgL0pAdUAtIowD5q/6uY2qw
	 dorjjKloFWMCiPncT+fQnH4vHmxpUG7DQqySrH+GatGaDju+q3AIYA/fH3tIQV6YY9
	 wpiGHWaQTBCWmMUqI9DU8htbmu/tzja0W0xs9HHjNtp3q94crTbtGv4YaMGREW2esQ
	 Tu1TvK6DMY8m7nFg98rYjuwvjAMCsuGhIVmS7THPveeQEdX0RlgPo/h+b3e1Fi9m/q
	 45r5JjE6suqIA==
Date: Fri, 20 Mar 2026 18:54:56 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Charlie Jenkins <thecharlesjenkins@gmail.com>
cc: Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, 
    Sergey Matyukevich <geomatsi@gmail.com>, Andy Chiu <andybnac@gmail.com>, 
    Deepak Gupta <debug@rivosinc.com>, linux-kselftest@vger.kernel.org, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] selftests: riscv: Add license to cfi selftest
In-Reply-To: <20260309-fix_selftests-v2-4-9d5a553a531e@gmail.com>
Message-ID: <b6282cff-8b80-8d10-00e9-852bb4e01093@kernel.org>
References: <20260309-fix_selftests-v2-0-9d5a553a531e@gmail.com> <20260309-fix_selftests-v2-4-9d5a553a531e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 9 Mar 2026, Charlie Jenkins via B4 Relay wrote:

> From: Charlie Jenkins <thecharlesjenkins@gmail.com>
> 
> The cfi selftest was missing a license so add it.
> 
> Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

Thanks, queued for v7.0-rc.  This sort of thing probably is best coming 
from Deepak, since he is the author, but since he added his Reviewed-by:, 
we're good.


- Paul
