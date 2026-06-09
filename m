Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D13A14F112;
	Tue,  9 Jun 2026 02:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780973602; cv=none; b=EiileKXHynZxC+rxVJV3HtK07HdeGkbPyxQg78w2Cv4s6ghT+t4TNsoxf06prgTRCLOn6iLp+aUFn9/fJFh70srGzQ1VHCxZx0aNO25xq5AIgl4bP9Y6XN3u/WU6iWCKcXtc0wnJOjiYPS7Dkk64sEEQHpqJa2e69v0nWzt5noM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780973602; c=relaxed/simple;
	bh=Ivro6vSMIYRry7vN1zqSFklZGe4QJ6SjpJl1xTHkpNo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D/BbHkwLisSiP+AJZvEM2gzVSyRGmV0J1MFfD46IKBaciwKIFFvyGNYjJ2mo8QjC6oUT5vzCn+eh0so3o/B+I9XqYeSpcFnD3pGVxY6S9YohXoLeai/nGZwgtFlXlemdmmSduGbHiba/HfAAHGmh5GBLnhqR1xzC5+beGQqmmAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DFuxT2xP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DFuxT2xP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB32A1F00893;
	Tue,  9 Jun 2026 02:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780973601;
	bh=d0Dg2ymvpIPp2nbqsrVn1ZAEjUP4Iy9O/+GN4wMx1z0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=DFuxT2xP6g3k2yQ3cQJEY5WQhyk8vyIiOkPP7ChAf+4EIHzaibyNpGobyZ0ifDgFw
	 JC8T47VoQZiIbZzSB5244yYi/2QVTrOlczqgqMUBIA/+WzrNFg+qD2MaqFeqBSDbMo
	 B0PqtNitDPdE5f1F3GJRRvHx6f+Y+82R45K7r0F4vrVQc0YGXz5lJdHYGNEzY8fvms
	 /aFRPEEIglA+lupG+Y3z9mvQNtyC3LSRyC6IGNm1XfoUeSlUlytjpzrjy2fUte9EDT
	 EKHzorYq/jjdrrcnFsXlowzLATkaTg076JvgeQodoWR0TJp2Ttq2xqHoE2HZGum7CC
	 dvDrXLYyh0guA==
Date: Mon, 8 Jun 2026 19:53:20 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
 andrew+netdev@lunn.ch, horms@kernel.org, shuah@kernel.org,
 willemb@google.com, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next] selftests: drv-net: gro: signal
 over-coalescing more reliably
Message-ID: <20260608195320.007b34ad@kernel.org>
In-Reply-To: <20260607002401.212976-1-kuba@kernel.org>
References: <20260607002401.212976-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat,  6 Jun 2026 17:24:01 -0700 Jakub Kicinski wrote:
> +	/* Signal over-coalescing explicitly, it's a hard failure, unlike
> +	 * under-coalescing which could be timing- or loss-related.
> +	 */
> +	if (num_pkt < correct_num_pkts && bytes_received == bytes_expected)
> +		error(EXIT_OVER_COALESCE, 0,
> +		      "over-coalesced: got %d pkts vs expected %d (%d B)",
> +		      num_pkt, correct_num_pkts, bytes_received);

Sashiko complains that this condition may mis-fire if we lose a zero-len
RST or ACK. This is true, tho, if the device drops pure acks ignoring
failures where ack disappeared puts us back at risk of false negatives.
Happy to respin but feels like we only have bad choices here..
