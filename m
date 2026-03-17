Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B6F1D9A66;
	Tue, 17 Mar 2026 01:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773709437; cv=none; b=cpuG24+3XVBLmA1nonttjlyHZb8bVbcXlNBaYgsB+C58N5Je3EalRwVto8rEnaUFLzlJwt/eIi6XPO9wpp59l6xgskPpsrHXYgogJeDFn5o8T9FqPcn7CWmP7fWrsUhtJqUx1BZGYhWciY6ZwWLgxCw8NGY5VOB88/4OLY+GYqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773709437; c=relaxed/simple;
	bh=GmfJjzGrEOGL1bTD1Jb99iyhPbhSiGVs6GwA3XHnmjc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=st4YP7YlNd25FWtm3lsegacdFrae9wHNHPqH/tBOYaYecIXwJRgkpr27AUHexaHGYZq0XyLncE9fpZoMezGLWmNlrExUThOmrTWyWukhs9scrU+n6GOJfE5AEGpbaKfnSfghh8402OpIs7GWkeyTU4TlAlZQWTDnZfpH7zD1IWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=omvxpP0K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="omvxpP0K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57E32C19421;
	Tue, 17 Mar 2026 01:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773709437;
	bh=GmfJjzGrEOGL1bTD1Jb99iyhPbhSiGVs6GwA3XHnmjc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=omvxpP0K4ianStaMUEBrn6iBemUmszT+Dev/O7n1PwRZpNJD2QJ8ho0dYOr2/rTT+
	 lkUvq/WC5o+vBtfAlBCLMM4ghyhazxSR1buxBVNeI5C2CALH0c8gyUSC2ey3fwTqkr
	 tJaNFNRIbD9FJHhL3iqgaDRBd3RFsYYn2zDQbRosWeXW1TW0SgBOA/dufHRaxdmrbQ
	 A55yOCRYLMKjxTjbRAzgWsjWnMEIs0a5aueJrvkLEPwvH46r8avBD21PM2T0qNxKh6
	 9IWoiqQs0+9d2JAzQoO5V7AWhzoTSE4/jnq1teKevSbkCOatrpyRm8JHRJ6vDzWqfc
	 PN/kQTuKFHVyw==
Date: Mon, 16 Mar 2026 18:03:55 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Cc: "corbet@lwn.net" <corbet@lwn.net>, "dlemoal@kernel.org"
 <dlemoal@kernel.org>, "davem@davemloft.net" <davem@davemloft.net>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 "john.fastabend@gmail.com" <john.fastabend@gmail.com>, "sd@queasysnail.net"
 <sd@queasysnail.net>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Alistair Francis
 <Alistair.Francis@wdc.com>, "pabeni@redhat.com" <pabeni@redhat.com>,
 "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>, "horms@kernel.org"
 <horms@kernel.org>, "edumazet@google.com" <edumazet@google.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Subject: Re: [RFC net-next 1/3] net/tls_sw: support randomized zero padding
Message-ID: <20260316180355.37d45785@kernel.org>
In-Reply-To: <9e9f6eb89ba95e9fbb764e2807420e98b566bf37.camel@wdc.com>
References: <20260309054837.2299732-2-wilfred.opensource@gmail.com>
	<20260309054837.2299732-3-wilfred.opensource@gmail.com>
	<abQOGm6BqAE5eEln@krikkit>
	<20260314073919.2f92b966@kernel.org>
	<9e9f6eb89ba95e9fbb764e2807420e98b566bf37.camel@wdc.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 17 Mar 2026 00:53:07 +0000 Wilfred Mallawa wrote:
> > Or maybe you could refer to existing implementations of this feature
> > in user space libs? The padding feature seems slightly nebulous, 
> > I wasn't aware of anyone actually using it. Maybe I should ask...
> > are you actually planning to use it, or are you checking a box?  
> 
> For upcoming WD hardware, we were planning on informing users to use
> this feature if an extra layer of security can benefit their particular
> configuration. But to answer your question, I think this falls more
> into the "checking a box"...
> 
> I'm happy to drop this series if there's not much added value from
> having this as an available option for users.

I'm not much of a security person, and maybe Sabrina will disagree
but I feel like it's going to be hard for us to design this feature
in a sensible way if we don't know at least one potential attack :S
