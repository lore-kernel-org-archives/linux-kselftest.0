Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3BE3905E6;
	Sat, 12 Sep 2026 16:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789230750; cv=none; b=GndhkFC34nM7cpxxIr5jD4soTlIjNkFnXHXbKKZRAz/VYY/PP/UjHVe6MJgrlaeO6Jlm2gEL5HNTEnrLgqzonmLE4I+1HgmELa/lZZSih+qpquW6PGTT3Ofy0cBwZQfI+7HQVWlHhCc4yZu/akufoC3PXgE53dP7U1b9OJNBaiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789230750; c=relaxed/simple;
	bh=MwqnkcrroB1Z/gKOCvZPf8Po2tfaNM3vNbYxYVyAF1M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dVeFDCTIDTsFsceOvOfTZ7l/1Fl33rFKqTMw42kI/lR3mfM5Z0eN9sOWsEaDY8D4FLyGRkLpQ3q2MU/95BR2EwkYuERwvj8pDL8noppgDGUlhyDFDNguKnUAS54MgKXRlAVjfKJ9jpMh77CKFKPGpshrA7mA0ROse/7DQLZEL60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ISNonprm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ISNonprm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F13DB1F00893;
	Sat, 12 Sep 2026 16:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789230749;
	bh=LHEWLDzI+B3/97tgLaQiQi7rrWzRXqtmbhj7QQQB41k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ISNonprmfxAOsJA5OY7LeJTVCye+0tJCeCeQY+8mK+0AXPBnTLCM5EjKouET3qKlL
	 Wf/j3uL70/o21kM4l3nuOswHxSkn1/S7+ktNPWjFMYpdXav5qq/NektNGX5f/rvOiC
	 Q84dORAbDGYk6KeabzM1JJXVP9FF+x0YHPrgp0ciBmEtqULbnAM0Hdu9zpkSJAAUEO
	 cP3gpox8018Ayic91pKRoUEleWoMskpQUGTbh1xmM85dwvuwXvXAsspFAT5ZnfLoBI
	 bVHoolpWdCQl8g3LXmTkYqN4WUggDMGL7N0XBMZ5pRCR4oR4ugczJtrcJkxG9gIVHb
	 ZHjer+L01/YrQ==
Date: Sat, 12 Sep 2026 09:32:26 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Narcisa Vasile <narcisav.kernel@gmail.com>
Cc: netdev@vger.kernel.org, daniel.zahka@gmail.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 shuah@kernel.org, horms@kernel.org, willemb@google.com, petrm@nvidia.com,
 anubhavsinggh@google.com, richardbgobert@gmail.com,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2] selftests: drv-net: add BIG TCP test cases
Message-ID: <20260912093226.529ff414@kernel.org>
In-Reply-To: <20260912050327.20616-1-narcisav.kernel@gmail.com>
References: <20260912050327.20616-1-narcisav.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 11 Sep 2026 22:03:27 -0700 Narcisa Vasile wrote:
> Add four new test cases that validate coalescing
> under increased size limits (BIG TCP):
> 
> big_tcp_data_same
>   - validates that equal-sized segments coalesce past
>    the legacy IP_MAXPACKET limit.
> big_tcp_data_lrg_sml
>   - validates that a smaller final segment coalesces into the
>     previous chain of large-sized segments while crossing the
>     IP_MAXPACKET limit.
> big_tcp_tcp_seq
>   - validates that a packet with a wrong sequence number doesn't
>     coalesce. The test uses a sequence number for which the low 16 bits
>     correspond to the correct sequence number to validate against
>     truncation bugs, since total aggregate length crosses over the
>     legacy size limit for BIG TCP.
> big_tcp_large_max
>   - validates that coalescing stops at the configured BIG TCP limit.
 
Still failing:

https://netdev-ctrl.bots.linux.dev/logs/vmksft/net-drv-dbg/results/819882/3-gro-sw-py/stdout

https://netdev-ctrl.bots.linux.dev/logs/vmksft/net-drv-dbg/results/819882/3-gro-sw-py-retry/stdout

Grep gro_lib.py for KSFT_MACHINE_SLOW
Then the 15x increase is probably unnecessary/too high as well, since
we GRO 64k 128k shouldn't need more than 2x ?
