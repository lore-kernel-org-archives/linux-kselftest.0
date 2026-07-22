Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF8635FF5B;
	Wed, 22 Jul 2026 00:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784681946; cv=none; b=G/z32k12hMV5LrlYviSMIrmoVOyvXOdg5VxRw3NgpfMIJVzjQznQ8TJ1urwAuWyaSbLlqNSPFT5RdNrMZXzZDeYE+waTLFZHi6g/hourc5JYacorlA3PnfzLyaIxrnXe/g2FW+0kXYNMPZ2kOvIPLe5VC5XmTq08c+xDfXGkesk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784681946; c=relaxed/simple;
	bh=ZigNtDrXzye4JpU5Iq4j9ZWamjIz3WD4vsvEDFP3Tnw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Al/KiOC48s5RmP5Ecp8BhXfno4fTSu7np4qVwhKm/gVr4Gv8F0KT37zavwRP9EJyXBqGTutzv6CMylxvk9KdiK9uT0hHXo+SaUPBEUREdPnYpN5DhssN86oneOGJikT0hvv17ziMNYPWMFXXmQdlly4YTEvSLDF9OiPY4yREAx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EG3V8+81; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EG3V8+81"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D1D91F000E9;
	Wed, 22 Jul 2026 00:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784681945;
	bh=iBUnoAw5bJihaUFvRmHcSSiIlWI6OnF9sp3DV2X6rnY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=EG3V8+81yxV38Yo9pMDh2kT8xazYaWD3JZOTNdYd8feMTh2O09v6EQIcSI/7rJevd
	 jtd8+6dnkku7THfiiOGmZIRSH/3C0Y3OzTykX5ToWneSKXcmfWRtI2HH3QzLkVIYrG
	 Mtok7CGzUaYcAr21ZUHwAoRoBAynMDuzXoFp22IdPI8LSMGR86o+2hmR2tshwllT/N
	 ngUCY4UUv1kmxBADpN7N1F3f6xZ7LCMPPTxBnvEYrPqArk/N30buO/HkzYdyUt09gI
	 16cr3/VgnuHmhminp2TvvHeAXTLyVhmBRwMGx0Wbi8k9PqEs9XZuA9izAc/OWIIzLO
	 SyPN7eJES4SdA==
Date: Tue, 21 Jul 2026 17:59:04 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: deepakraog <gaikwad.dcg@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: selftests: fix typo in ip_defrag comment
Message-ID: <20260721175904.1e1a4967@kernel.org>
In-Reply-To: <20260715143549.14094-1-gaikwad.dcg@gmail.com>
References: <20260715143549.14094-1-gaikwad.dcg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 15 Jul 2026 20:05:48 +0530 deepakraog wrote:
> Signed-off-by: deepakraog <gaikwad.dcg@gmail.com>

Spell our name in a more official way if you want to be taken seriously
-- 
pw-bot: cr
