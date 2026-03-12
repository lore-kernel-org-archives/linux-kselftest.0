Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B092033A9CF;
	Thu, 12 Mar 2026 07:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773300552; cv=none; b=KH7Jj3rTADnTfxlCOQV6QkjhEzZ5/gt1MMk0mjsIR/mtsEA/E/KsybPjEk1DPWyQZ53H2Wmpa6H0yKiZV0OUTvDQ5gUw2Fw55Lm15MYbo9EFO7ipJm1hDtCQu35sGjxNRypenx3IirmgemTEWssi5GhKcBa1/E/MPNeK8mY8V/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773300552; c=relaxed/simple;
	bh=4a0pdum7sasJCaJZ6hqj9jfKJML1zEHVTAoqYbFaN8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZtFmkJT0SfmM4YUO0NpVoMX3o7nBNb0/eGMm1JpYcg6BD3KvenUMBvfRzGVzgZrR9EFabdV9PKprr/5eISST9G+Ax0K8KmlVIImmIty2i7dlkZtWgk6dv3hhHKWm+9KsK0ng3RqZxdBaRg5v3EDMAVsjxYUAQl2qOfDdOmICsR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cUqhqtOq; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=eTWsZlrB; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cUqhqtOq";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="eTWsZlrB"
Date: Thu, 12 Mar 2026 08:29:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1773300550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BVo8kbjQxHUNCgmwlRjOaVnI0pcrBIrkFOYP96jYa2A=;
	b=cUqhqtOqXlQbQEkQF4JwyxuPpGFsxHsR37kFmci48L1PlX0XMms3yJB+uxiBEkoUR5gcRW
	zNCB+/NW8L6qG4zIDwJQvCo2oMNFYlJSo9EDYLEFIQ8QEtWgemVXxewAMo7YGfO2Uw7sbe
	fGVPGVtQNZn6aDxWvqQ9BfRip8jwoWoUWP1ZqLpL/pCC0Xin7cm7z2hMDX87+tj47w1j0Q
	X03sAvnlQldkoiVzg6G/dTntJMtt+xXKd9IOIrUDz6huh0ph65WCmNE9+tgsSeP35MR6Cj
	8jVMssM87fI+nUVOqcmSv+BUyJKvcHlEGLDj2QqKMlUFn4nl4NKJxdeoSe60xQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1773300550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BVo8kbjQxHUNCgmwlRjOaVnI0pcrBIrkFOYP96jYa2A=;
	b=eTWsZlrBxVSDmg476RtGNsKAGbbqNSkGcsxQ3U99vItFKQb0x1cUj6g8/5VZbCh25xnxl+
	TCiwqWbvh0ctlUCA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Davidlohr Bueso <dave@stgolabs.net>
Cc: tglx@kernel.org, peterz@infradead.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] selftests/futex: Bump up libnuma version check
Message-ID: <20260312072908.kYFklx_F@linutronix.de>
References: <20260306182215.2088991-1-dave@stgolabs.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260306182215.2088991-1-dave@stgolabs.net>

On 2026-03-06 10:22:15 [-0800], Davidlohr Bueso wrote:
> numa_set_mempolicy_home_node() was introduced in libnuma 2.0.18, not
> 2.0.16, via:
> 	https://github.com/numactl/numactl/commit/8f2ffc89654c
> 
> Signed-off-by: Davidlohr Bueso <dave@stgolabs.net>

Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Sebastian
