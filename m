Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DB24279EE;
	Wed, 22 Jul 2026 20:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784751995; cv=none; b=MVoH2GWmj1hZMA+pYXzWtzXXQ2CJ75/MU21SSkZhxEKXcktqSFmjHWbl7HZsTfNaDqFacYHpy5bMKuNdbG0LbxL5rAeqlWqHcIZERS8G/QfSjXtsQ+3R+mX5U0BtoBixypCbr16L3zgYaGvv8cCYSErVD93uMI8UqVIs7RvY1LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784751995; c=relaxed/simple;
	bh=dfTYvIUfK05+Gg7T9NOiNtMBEUo09wYQTJRKVZsqSNU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J6nS/w/nuEnTVQJc9wp5dNZ3GIDkU7Gl8RGpGN7LCmK7dJIwYUjErcx+TPmtCKlKKfPUAGzh+TjDdJv8cd0RSH4eB9MHIeP4zVRLBmTOp7CuVURfkTP4rCe/dBTtQOekj6hB0uQPJleQmLPeJaYRTaXRXsVAF/K6n802LA5dMPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lLs75CUZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lLs75CUZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBC841F000E9;
	Wed, 22 Jul 2026 20:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784751993;
	bh=iZXsi4XJt7ICHjlPgAiTjxdB8J9Kx+xyP5aq7YL1LTA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=lLs75CUZSRNR4t5ie6iQlShS2KKNS5dXSgByEMbwQPetLqlSOYLSLWHWDuJT9Aenk
	 UQMWGBNsBGsxaPwgn+6S9zoSi55HlWIhnZEkPoMKgeVLkycv2GB4egHC/McrjL3jm/
	 rJ8Pc6wbxDj3H5qXEAqXFFTG/yfWRSn+qttfETwSF50ide5h3Qrwh4b9kVTn5WXDb5
	 BKb42EyzbvVyyAJXXGOhluejaA4y4jrETlEQb1f2Anxy7QrtS1jEY8HMLnSMwPq/r1
	 vNGD2/SFP6O85xPzTJPYKbrv+aKkjW8Xe7W8r7tgW29T7TPrEceUcAprlaXZzR1GJ/
	 0Y62lhrfHqcaw==
Date: Wed, 22 Jul 2026 13:26:31 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Gal Pressman <gal@nvidia.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, <netdev@vger.kernel.org>, Shuah Khan
 <shuah@kernel.org>, Andy Gospodarek <andrew.gospodarek@broadcom.com>, Pavan
 Chebbi <pavan.chebbi@broadcom.com>, Michael Chan
 <michael.chan@broadcom.com>, <linux-kselftest@vger.kernel.org>, Nimrod Oren
 <noren@nvidia.com>
Subject: Re: [PATCH net] selftests: drv-net: rss_ctx: fix persist tests skip
 on IPv6 setups
Message-ID: <20260722132631.500d6979@kernel.org>
In-Reply-To: <20260722123844.1673299-1-gal@nvidia.com>
References: <20260722123844.1673299-1-gal@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 22 Jul 2026 15:38:44 +0300 Gal Pressman wrote:
> test_rss_context_persist_ifupdown() cycles the interface down/up and
> pings the remote host before verifying the contexts survived.

This is expected to be configured on the system where tests run, without
sprinkling it in every tests. See the env setup scripts in NIPA repo for
example.
-- 
pw-bot: reject
