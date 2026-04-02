Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194A2E56A;
	Thu,  2 Apr 2026 02:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775095832; cv=none; b=HyGxn7VqDSCC9ZvSTB/fbYLT2ZP2jL8hnLSchEMkFwkENy4Z1dTkBGC3Ir1fClfdvN1xMfRM3yxhIh5mrJQBQJAW1t8eX2pB2DSUIZOnB9RnoK62Be3VHLA8h5VAHpAATSRWXFNF8bX806Bibvf75x+wIm+A6+Novqo9XX7f5mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775095832; c=relaxed/simple;
	bh=zB6kOG7fciPUNFoM1IZLtIh9x7gRrKuNJdvfy9y6XzE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AlW0EiKeTVMaNGuSgl7hRsjJs59828BZAj48x+W2NcMTDI+6w2oO7dsJUM6Vy0Pmcs+rShEZ45BlBIUWnAHKG5rMvtRl8McQTZXu9qRXlCRVHb7Sq9bKM3Yfaa0DjGYHK7thqi8B2wmsstpo1NQmXbcAK+6+AfnGl6Aglopexk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q6mYIiGv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q6mYIiGv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B260C4CEF7;
	Thu,  2 Apr 2026 02:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775095831;
	bh=zB6kOG7fciPUNFoM1IZLtIh9x7gRrKuNJdvfy9y6XzE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=q6mYIiGvU7L00TNjue12W+KSu04BYE6BrT9GvyxbzAPeqJtnDSxAZ4dWg3sc6H6PD
	 Ky+is/w+Tm1edFK2BHnf2ZjkjOoCnz+khFGZZ/9aPwM91PwU6F7AZEmfDK1EYdTyDT
	 BcnfA3wLmNx2H+zQcYNfHY1n/X4jVJfR3Qpr3noqbeKc/SD1i3K+TnkK1cIGzy6Qmx
	 dBqBTBpqq3q+uWlofpJNnrZEDDM9PAi06rp8Eis3cNZ2p+WW1F5BCYEtyaMrrbS5Dx
	 56xuz5vyZWhQiLUhWcQPn1uzsQ5x9m6+gDpcDrU+xnk1sYeZ0Tj866w692UVReq39Y
	 JdCLoC5QnblVQ==
Date: Wed, 1 Apr 2026 19:10:30 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 shuah@kernel.org, willemb@google.com, petrm@nvidia.com,
 anubhavsinggh@google.com, richardbgobert@gmail.com,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next 6/6] selftests: drv-net: gro: add a test for
 bad IPv4 csum
Message-ID: <20260401191030.23104696@kernel.org>
In-Reply-To: <willemdebruijn.kernel.14f444719030c@gmail.com>
References: <20260401182625.372605-1-kuba@kernel.org>
	<20260401182625.372605-7-kuba@kernel.org>
	<willemdebruijn.kernel.14f444719030c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 01 Apr 2026 20:28:46 -0400 Willem de Bruijn wrote:
> >  	/* ip sub-tests - IPv4 only */
> > +	} else if (strcmp(testname, "ip_csum") == 0) {
> > +		correct_payload[0] = PAYLOAD_LEN;
> > +		correct_payload[1] = PAYLOAD_LEN;
> > +		printf("bad ip checksum doesn't coalesce: ");
> > +		check_recv_pkts(rxfd, correct_payload, 2);  
> 
> This verifies that a packet with bad csum does not coalesce to a valid
> packet. Perhaps too paranoid but, do you also want to test the reverse
> case?

Will do, easy enough. Tho TBH I can't think of a case where this would
matter. Bad csum pkt must bypass all GRO processing completely right?
Because we don't want a corrupted packet to flush a valid session?
Or you think some implementation may actually feed these packets into
GRO to avoid waiting for a session timeout?
