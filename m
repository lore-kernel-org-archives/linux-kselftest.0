Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53824AA02C;
	Fri, 11 Sep 2026 17:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789146064; cv=none; b=r/ngaS/39Cs+84VVVaI6TVV2T5kBBP8BUIRUC40rTZid7iUwymRHY434IfIe0sDdr3k6BpbPL7WpUZ/Ok6Hs+cgx9KA/BJsFxRXiLruzbAboCoxGfhBzbET/zmAu9WCN8SzPx1fwEkQKRYZtdZoMvP4iGXJ4Q8DjsHcqFnsB9jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789146064; c=relaxed/simple;
	bh=41XYLy/Uw7qtZb8T14KmRylV0FfFdr+MpWrB1dhen8g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XRwh5Cu9x1yyU5KZRlwTyZQfkT1HOsunqbacnD2Hi0sMbqr4WQbs6N8ITJVycSUCf54hVB6s6NcY6NO8SwjdTAJ9NK43oLYsVblhvqMUo47uxLnYBYE71n0tiWK7Cmy6wPlcqF/x9OzpXBfmcZk35xsTxk4U44kQ6LlBfpOzSSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GSmIEdc1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GSmIEdc1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 069271F000FF;
	Fri, 11 Sep 2026 17:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789146062;
	bh=oDQZag0IjV9fYXD0o3OpJmps7IVf8wxhWyOn8F3mH7I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=GSmIEdc1JrYwocqTdJA8fOiJHUh/lok2GuPgJwWgFjnSiA01XXsJeNO93Lhv5QB8u
	 jtTgmvrtmFtYwSrI7C1q0s7FKm/48mS7JD+fKyVE6Ob7XmXg32VyIOip34ND67TjoM
	 MqVqfYWZKcjJAVsn0e8IUfPjrxf9IWdyD6MOYQ+mzU6n7bl7IqdvTYjVw8qMERdDdC
	 QlZQPirvYolm2or/e3/U3pTduT7gBuVJQeAiM6KCHTZvftsbe6ApGG2iPiCJdKqZol
	 0Z4NzxrSs+bG218tH+2nAa525CvFiB4T4GWB+aIQZjjpJYx5pl5Hk/TDyyhOroN/sM
	 S41UMkKRHhAqA==
Date: Fri, 11 Sep 2026 10:01:01 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Narcisa Vasile <narcisav.kernel@gmail.com>
Cc: netdev@vger.kernel.org, daniel.zahka@gmail.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 shuah@kernel.org, horms@kernel.org, willemb@google.com, petrm@nvidia.com,
 anubhavsinggh@google.com, richardbgobert@gmail.com,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] selftests: drv-net: add BIG TCP test cases
Message-ID: <20260911100101.2c34bdc5@kernel.org>
In-Reply-To: <20260911050659.13367-1-narcisav.kernel@gmail.com>
References: <20260911050659.13367-1-narcisav.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 10 Sep 2026 22:06:59 -0700 Narcisa Vasile wrote:
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

Looks like SW is struggling to aggregate enough. Do we need longer
timeouts perhaps? Note that the debug kernel build includes 
kernel/configs/debug.config

AI says:

Thanks for adding the BIG TCP coalescing coverage to gro_sw.py. CI is
flagging the new subtests as failing on our debug-kernel executor
(vmksft-net-drv-dbg, gro-sw-py):

  not ok gro_sw.test.ipv4_big_tcp_data_same
  not ok gro_sw.test.ipv4_big_tcp_data_lrg_sml
  not ok gro_sw.test.ipv4_big_tcp_tcp_seq
  not ok gro_sw.test.ipv4_big_tcp_large_max
  (and the ipv6 equivalents)

The rx side never fully coalesces the injected segments before the
background receiver gives up and the test's retry loop (6 attempts) is
exhausted, e.g.:

  Expected {68952 }, Total 1 packets
  Received {20280 [!=68952]40560 [!=0]8112 [!=0]}, Total 3 packets.

