Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7D436403A;
	Wed,  6 May 2026 22:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778106829; cv=none; b=jIDwRkkHBHhSNcxAq+8aQYPLjtmEz3fbRiTeGEarpDJV8rkx1u3KhvAgnJ6lGlQ1kMT1rcLUuhIm5t1+BvyHz4BmsYzWEFEWKUJRyQ5k3ShqwlAlgOsXj1iVTcRzQJBDx2hlJXVwtYTC1Lh7jHTZfet7dX+pankCjD6cPuDHrUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778106829; c=relaxed/simple;
	bh=Dzv3fZunGZUcXMXj2piG4acQPSIZ0NFpihqV3EmSw4E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SJuK7ubrI7csSLu/d7jbakZEh4xRMPdRdMmSl91a83PQA3XNXpaoMZV3Ia505PUkk0f6ioI4bFo+LUzlh1G02j3wvAyEQ4tQdK7Vw7gM4+if7aeC4ZoTX8soKm6CRdQcS4m4NI8fSyWYoPyBjPRjXw++SDt5uXPy9DqTXP5QoaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nh7DwdBc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nh7DwdBc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15042C2BCB0;
	Wed,  6 May 2026 22:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778106829;
	bh=Dzv3fZunGZUcXMXj2piG4acQPSIZ0NFpihqV3EmSw4E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nh7DwdBc4iZBwZ3k0bibCoGrAmgKP0bPN/t6qDH4EmG+rUTJmxBtVQiakRHkj1nfw
	 9ZKReZ15dkoEZjPnH1pI9I/YS5ygE/Gk+SoWMSPfjGXaXC+L6yV6P/SfNBcqBiN0tT
	 ns+Fzs44WNFm/MLtQK87Sgr7ESYNQNXKAgcRRVOKV2905zTutuyYHBkRYPcCmJSQCd
	 7f+u5n4A4CQdxeA0OGebGnIZPcdYnS4ju0Dj3pVK4M2zdhr7Q+b6BO7tAuOEvPqVMz
	 9TCvn5dQIulIwwmL1bxTvWmEvGwQmeyim4QVc2aKqnNgzks6JgOzEDTE9JG9gwCnOH
	 SF3BY0HogWc0A==
Date: Wed, 6 May 2026 15:33:48 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 andrew+netdev@lunn.ch, horms@kernel.org, shuah@kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net 01/12] net: shaper: drop redundant xa_lock()
 bracketing
Message-ID: <20260506153348.1c278f4f@kernel.org>
In-Reply-To: <ae14591f-f93e-4947-b3d4-af4c441d8229@redhat.com>
References: <20260506000628.1501691-1-kuba@kernel.org>
	<20260506000628.1501691-2-kuba@kernel.org>
	<ae14591f-f93e-4947-b3d4-af4c441d8229@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 6 May 2026 17:30:32 +0200 Paolo Abeni wrote:
> On 5/6/26 2:06 AM, Jakub Kicinski wrote:
> > The shaper insertion code is written in a way that suggests that
> > perhaps it was expecting readers to be fenced off by xa_lock.  
> 
> FTR, the code was shaped (pun intended :) that way to avoid acquiring
> multiple times the xa_lock when not needed. Sort of evil early optimization.

Ah, that makes more sense, I guess. Do you prefer me to drop this patch?
The XA lock is guaranteed not to be contended since we're under the
netdev mutex..
