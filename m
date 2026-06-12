Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFBE3CFF4D;
	Fri, 12 Jun 2026 16:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781281743; cv=none; b=liY6TRsf3AIgfZ6J26Bf75iKm866rs4MPlQjxEN0g9muuizwFmAN6G1Le8QjUq1RcPUYzIBTpsgL3fuHnxiV513HRNDxU0vQ02mR8p0nIaUFVWRPLqYQw/zikCkyQvG2JNxWQwwIzi/5AlzK8M1vAoePkUMU94voWoeQ+Y9rBjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781281743; c=relaxed/simple;
	bh=9eG0SjFppRiHnEy0aXqt2CnVnNSCQ3XR7nSnUtTKfQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fgQLEotiKqNAdr/G9x8vd6F+OT9VODWkyY0mEc555iYlqVJHFqQLZodIcGJc3Xq37175sc+DPhaHcKW13ogmRQyX+pAh62u08mCj2HGF6oi8pUwELjoiYS8jgcZDH/qJnabB1pnsN6fA7cGIT33NxPpYzVSZMa7jJN9/T9RzEII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=IYF2qStP; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="IYF2qStP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9eG0SjFppRiHnEy0aXqt2CnVnNSCQ3XR7nSnUtTKfQ4=; b=IYF2qStPBeqFayHUIlfLp0tknT
	I+pb2ZuqkqThXJFrSvkqpHk9W51LUE/OykPJo7brnIINbJZf53Syf4DXTuKXMLuiWniSYqSfoyVhQ
	L7WVmlxpQ4wmE6GXcENf5CKBJxSOa74z8RH4Ta3+nXB5T3nyOLas16BHNNc3dNmTmoXOI+njd7vBC
	SYfhLq26sLh2hzoKPFgSYm0MaOcw4YR9P0O7CIZ1VP9gJgCmeLrwa6Wdova9V+wrfRnAWXi3oHvTN
	JsFkQa+SPcCDMCpfQaH0jdjB1WesoZbcYBHASv13WEG4PBSeSa7VYmQVf9UpLafgv5SDI5N2hV9MN
	u9qUMyfw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wY4kS-00Are3-0P;
	Fri, 12 Jun 2026 16:28:48 +0000
Date: Fri, 12 Jun 2026 09:28:42 -0700
From: Breno Leitao <leitao@debian.org>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	sdf.kernel@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH net-next 2/2] udp: convert udp_lib_getsockopt to sockopt_t
Message-ID: <aiwyvEbSHLHKNXBk@gmail.com>
References: <20260612-getsockopt_phase2-v1-0-7b01f1f5d106@debian.org>
 <20260612-getsockopt_phase2-v1-2-7b01f1f5d106@debian.org>
 <willemdebruijn.kernel.26a37316bb5e2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <willemdebruijn.kernel.26a37316bb5e2@gmail.com>
X-Debian-User: leitao

Hello Willem,

On Fri, Jun 12, 2026 at 10:58:19AM -0400, Willem de Bruijn wrote:
> Breno Leitao wrote:
> > In preparation for converting the proto-layer getsockopt callbacks to the
> > sockopt_t interface, switch udp_lib_getsockopt() to take a sockopt_t.
>
> What is the benefit of this conversion?

This enables kernel callers (io_uring, bpf, etc.) to invoke getsockopt
directly. The setsockopt() conversion previously used sockptr, but
Linus objected to that approach and suggested iov_iter instead.

For full context, see:
https://lore.kernel.org/all/20260408-getsockopt-v3-0-061bb9cb355d@debian.org/

> It does add a lot more complexity and makes the code less obvious.

I agree this adds complexity. Unfortunately, I don't see a simpler way
to enable getsockopt to work with non-__user addresses.
