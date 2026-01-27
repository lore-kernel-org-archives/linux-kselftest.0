Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3806E283FE3;
	Tue, 27 Jan 2026 11:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769512738; cv=none; b=jdGH3f+JRxjlJmilCMlpT8nv3+iRHM3CzQSIzg3Z8GcSzvzhCdO/ggizifoXiMk1A/a2lOt+irnLpAey0TK6wV2EEPXOrNPpol8PK5TqChm1T1QJ/OOAmF+Z+BPyMT+FP84culI/yPgIMfO+fLMfUXlrCBZHelGIQfBSCmOWvUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769512738; c=relaxed/simple;
	bh=BRMCY17Cmx0BIgw/hgRo/jcrgxUiA79pa8Y+YZIEd7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H+82ckFYspRlJdnsMOeqsSfJPCuz0AUGYekqWEqja/7VHM+NRbzrxNu60H60IVbuH7uEwNfwRsweqRROn8z6bQjExATTm3OJkMfADpa/Ai+4+2ffNuzG4AxECJHduj9p+gZh9X6AqAGCwsbGiHkGCwTNXrn+XNFwRgy+c5qkDJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=o67MBUJB; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="o67MBUJB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=M0picHO+jVQEvPekxj7CtYWV/FYB9vMNScOlom4GBkA=; b=o67MBUJBHMlAybry1OC1SJV+2d
	hcbB1GqzXrEonTOEh5Gdj059SbIhqHD6ULO6KFFVBQ+XitiaY3/D9kXrY1ysSEFESysvb9g/ZMWSD
	NwU12iTV6Kb8WXtW5tT2zntoJPy7V7aQk+sA6msa09w5oH2cDI0g7F3hTJyOc5yM+/G7uqJya7fv1
	/hmvVR9JTvHqiB5GWgkn7D5JRNisQkiEhTTCcy7wxHofaXx666/rlQabhqEljOqelNnH+DLhp4opL
	UWTQsSZB8tRg0uSmBXmsXk6Cwfh8lvggkLlPMVkPuf67nCAfTYAXYIm1N7Qa1kK4PZR25fcoI5L7m
	Km3xdnTQ==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <leitao@debian.org>)
	id 1vkh5v-00Gwv2-G9; Tue, 27 Jan 2026 11:18:51 +0000
Date: Tue, 27 Jan 2026 03:18:47 -0800
From: Breno Leitao <leitao@debian.org>
To: Andre Carvalho <asantostc@gmail.com>
Cc: Shuah Khan <shuah@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] netconsole: selftests: Move netconsole
 selftests to separate target
Message-ID: <aXie9VdU4BeF7Z6y@gmail.com>
References: <20260124-netcons-selftest-target-v1-1-d3937f44c4c2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260124-netcons-selftest-target-v1-1-d3937f44c4c2@gmail.com>
X-Debian-User: leitao

On Sat, Jan 24, 2026 at 06:51:42PM +0000, Andre Carvalho wrote:
> This patch moves netconsole selftests from drivers/net to its own target
> in drivers/net/netconsole.
> 
> This change helps saving some resources from CI since tests in
> drivers/net automatically run against real hardware which are not used
> by netconsole tests as they rely solely on netdevsim.
> 
> lib_netcons.sh is kept under drivers/net/lib since it is also used by
> bonding selftests. Finally, drivers/net config remains unchanged as
> netpoll_basic.py requires netconsole (and does leverage real HW testing).
> 
> Signed-off-by: Andre Carvalho <asantostc@gmail.com>

Reviewed-by: Breno Leitao <leitao@debian.org>

Thanks for the patch!
--breno
