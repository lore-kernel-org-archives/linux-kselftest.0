Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343FE3559F8;
	Thu,  6 Aug 2026 01:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785979001; cv=none; b=JTnx8ayo3Jc2btl0JrzZtuvlQhvkcIB0kGVCAIn66isOs4tVdfCzrPlYPhR3Qcaz3A9wtmjdWdmKxQ2pFvwfdIMD/i90QMmfp5dTrLFGJZoPe9OiKoYEANFfRDRyJMYYhzvJ+IUMs4mNKU94DofbO4F5ox+Y/IA5q1hnn7H4/po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785979001; c=relaxed/simple;
	bh=7R45TOVMF4VT85wYdfPMtMECsAqu8ER+rmycQPBAPeE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t6ijkXREMPY1dum3LuriU0j/1p+L09NamH/CF+6+iGWMJDROo06aMTge78YB+G38Pdi94vi72/EOkd6amlWYP/PxcKrCewQJdMHFGBSdEHUQ4H5gOjY6vB8ZWmHr2YzNJNpv+8x2O3MvgicZQoILRTDASRYR4riQMohjh2X8+WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mDmo9Ixj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mDmo9Ixj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BAB01F000E9;
	Thu,  6 Aug 2026 01:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785978999;
	bh=kB3cLbriapxEx/HHmhUXGDQH1LH2QvinJddBqJODM9M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=mDmo9Ixj02PmQS3bnYFlPsKEs6Uuz8PE6Tl03j0XrP90hzU7zPeakPVQu4FZaD+sm
	 Yno/692DGRcZ93fvODThWimDRHTIdWwUFDgp2wEo23Ipq47w6AmBnASiJwzFLSREQn
	 2FbOVv7H6b0x2+LGcKa6gBHhAVPd4BzvFtWZzdx2WKpl/DAn1SQseLwLmhMNU9V4lX
	 BZgR3s03lekOHjV68e8E1q9MD0hGIVdv8d4tW7h4YxRjBQ1vXEhHxYEmn7moO0TzqN
	 UNXms3Udtm08cs2w4LLy4yvKLKMmMYKoQ68UQlU70m0tEwtUoUBYEeN0vd5uSJGFVG
	 WqPpks/fcLP+Q==
Date: Wed, 5 Aug 2026 18:16:38 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Deep Shah <deepshah146@gmail.com>
Cc: netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>,
 Eric Dumazet <edumazet@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, Shuah Khan
 <shuah@kernel.org>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, Simon
 Horman <horms@kernel.org>
Subject: Re: [PATCH net-next v3 0/2] ptp: reject frequency adjustments that
 overflow scaled_ppm_to_ppb()
Message-ID: <20260805181638.50b6cfcf@kernel.org>
In-Reply-To: <20260801222923.39017-1-deepshah146@gmail.com>
References: <20260801222923.39017-1-deepshah146@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat,  1 Aug 2026 22:29:21 +0000 Deep Shah wrote:
> - patch 2:
>   - cast the test value to the type of tx.freq rather than guarding on
>     __SIZEOF_LONG__, which skipped the assignment on x32 and other
>     y2038 configurations and failed the test there (Simon Horman)
>   - add the built binary to .gitignore

the test doesn't seem worth carrying in the tree TBH
If we really want this sort of unit test we should probably
integrate it with more with the net side (the PTP target doesn't get
run by netdev CI) and automatically create a netdevsim device which
has a SW PTP etc. Again, not sure it's worth for a trival overflow test
tho.
