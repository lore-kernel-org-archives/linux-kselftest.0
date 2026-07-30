Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D16222597;
	Thu, 30 Jul 2026 02:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785377417; cv=none; b=LHOHykAPZLBef6kD5xlFSlRoiXTZ/eO48ufb93PLQUokxo92BMqtDG7WZdlZNx4VMdbs6fjpPJ550IEwnJonfWKYyVnM9pOEK6UdmBxkziTSiKBz8uq5wCfeXs0bwKRQLVW5y4IMdiGpdZmSQNGQd47HPW77Mim/K66EBDvvcZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785377417; c=relaxed/simple;
	bh=QYxyiRnERIawLcgPoLXDVSW3XcjGzhrvE9X2A46B8x4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XI2ZwrOk3L4CSCMBb+nJKiOffiw/FjcgLGLaxsyLhzaxsFVjGyNsgisKR0C6JzXwCb3bAOSsQmwqmiWVDDAorNSCpWlJTrasYQ8WzGLikjqjiidx1Q7slvUlAXUmo7J4ucLlw5sPqNOaEs2hf7LYjeLzW4jbPBhFw33rhec9TsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DD7Hual4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DD7Hual4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C51F71F000E9;
	Thu, 30 Jul 2026 02:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785377416;
	bh=7/QQZwzq2gPebtcoHAh0yhJMWRSTs0Ufs8cYUX/U39I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=DD7Hual4nAfz9o9oIPdBLFZFQR6bR8Nz5h7Z8rzlrnlI+PRMHDGOcf1Z+FRBT9FJa
	 qSmQDlTFM6JfHOdcHAJmNz0RbEDCuS9gzNrKg878yOd/aQmKDNGluAAqb2vCUOsZNd
	 D8UYNOdbSKd3TnfYL1b9Dl/7yERU20CNTc6V3Ajitl5uuMxQ8lGp274R9blc/6olzU
	 iSfZ71mJFwy4/PJKhvrHmX6ACH+eDqGHHliw+zh7ekqTbW++dnzsPwmVGzDk+0Ha2C
	 yIXTStRXDLHN+dUHDNHyq3kVV9y9uIh0JXkWVy9WMgXYhpk5v6XTJ48vQCglrttuUv
	 7r+wSI6AQXZug==
Date: Wed, 29 Jul 2026 19:10:14 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Mohsin Bashir <mohsin.bashr@gmail.com>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, dw@davidwei.uk
Subject: Re: [PATCH net-next V4] selftests: drv-net: Test queue stall upon
 reconfig
Message-ID: <20260729191014.2634ab1e@kernel.org>
In-Reply-To: <20260725002156.3027762-1-mohsin.bashr@gmail.com>
References: <20260725002156.3027762-1-mohsin.bashr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 24 Jul 2026 17:21:55 -0700 Mohsin Bashir wrote:
> +# TX ring size the test shrinks to so the ring fills quickly.
> +MIN_TX_RING = 64

Testing against bnxt is failing in NIPA, could you check why?
I suspect the rings size may be too small (hence the quote).
There was a recent patch to Intel drivers to require min ring of 128 
so we may need to try a few values ([32, 64, 128, 256]?) before
giving up?
-- 
pw-bot: cr
