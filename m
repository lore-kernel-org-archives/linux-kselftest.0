Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795610197;
	b=EINln7UXTHBD5s43hOD+iNQkxMNx2WeZuZN0Z/TCjiIXMICLgNPIx4eZY50jpI5vr1/H
	 o/GMak5i1dle3n+uqDaVRFqcxCknjGqIYMO2PqOGyXh4BOAGVGMwnKoJ6nxQoOgWBVPy7
	 TQybaskLuw5mlX0PHJMZEN0YWSSttKdC1TKUvv3ouWOixBqNVrhg7px2H6PeXDKU123yn
	 SazxG63wbuyXUdayvcGpieagMzk868kOyvWQ4oWxk0GHYzY4pQDUqm0MEDo356/0YQpvr
	 wcWqnifnYIzQoeLUIMiOw4hWuizbrx1Vjr4n4isG6W+imJ/51juJDWJ92hbpjZfimlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795610197;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=LQhKS/4BijX82m4yhwQ/2gAbbajO9/DdsdLr6IGtdH8=;
	b=Ny6MjgcNjfd3f870ZvFMF++lrKh6zXR9oHGqWBmjFQFZ0uAXUo5EnUbSIqdSlNPK4lse
	 Pn6AMmoqpwBIXRmcM1FLtTfRr2oslwUAF0DrPTKjiwNJa9nssXNiS809MurMh0w1+D9V7
	 c/mXERFB74pqcO9xlFMZgCzdjVxrG5eenZKnQPitdExywSHaXkBmO1Z2PRrZKmJZUH7rJ
	 mDSauNth5fWdfzMI+9fUhEqoiikvFUJW/qS6CcWiU+qwLc3bbDhGsmg0Kgc7KUGaWhNBU
	 OLmGRLl3jUemwPqpgiExIIoT3IYcLjVInltqfF7L7sOgDmc85GgUVkM1Dp8YeQgra4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UwSvVDc1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F89606A31E;
	Wed, 25 Nov 2026 12:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UwSvVDc1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8F1F1F000C0;
	Wed, 25 Nov 2026 12:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795610197;
	bh=LQhKS/4BijX82m4yhwQ/2gAbbajO9/DdsdLr6IGtdH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UwSvVDc1KlVX9DCQ2QsnXyL9xPuBtsrHUgw17GdO975KQqtADloS8MX/0PjM3X2Nt
	 AAdubcobONjzXepewzxw7JGQT3dnAjbiQkv77Z+9fPROI+O+4UMlM8EyHj+JSxQzqv
	 wkEHvfT9RsV1H8XeNLDAl/uZ5YfAkvkQ1jeX0dRAU3ClWkeahyFQEiRpjnGB0lt7eP
	 ZPDPQmJa3mbjCiF/J+jT5EqD/gH+ok8+yH1EPUee/zTlXu7UlgLWb9xhv0ALYddNfe
	 pNfqLwSpWMmdf2n59Ca4djwyl5ILYlELbl1Lk3qagMnCKfsi472YI6bXNGnc7Y9cIR
	 TluWcHQYn4smQ==
Date: Wed, 25 Nov 2026 12:36:32 +0000
From: Simon Horman <horms@kernel.org>
To: Felipe Stival <v0idpwn@gmail.com>
Cc: netdev-bot+sashiko@kernel.org, john.fastabend@gmail.com,
	kuba@kernel.org, sd@queasysnail.net, davem@davemloft.net,
	edumazet@kernel.org, pabeni@redhat.com, corbet@lwn.net,
	skhan@linuxfoundation.org, rdunlap@infradead.org, shuah@kernel.org,
	netdev@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net 1/2] tls: don't hide a queued KeyUpdate from poll()
Message-ID: <20261125123632.GV31322@horms.kernel.org>
References: <20261118-v0idpwn-tls-poll-parked-keyupdate-v1-1-8e25101e7be6@gmail.com>
 <179538279534.3135.17423952957860887247@kernel.org>
 <B373FE61-88E2-4F2B-9796-01B39ACF7635@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <B373FE61-88E2-4F2B-9796-01B39ACF7635@gmail.com>

On Mon, Nov 23, 2026 at 08:46:43AM -0300, Felipe Stival wrote:
> > Can a poller that is already waiting still miss the KeyUpdate here?
> 
> Yes, any record tls_sw_recvmsg() puts on rx_list has no wakeup for
> concurrent polls. This predates this patch, and I'd say it belongs in a
> separate discussion.

Yes, that seems reasonable to me.

Reviewed-by: Simon Horman <horms@kernel.org>

