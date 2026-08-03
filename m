Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0082BF3D7;
	Mon,  3 Aug 2026 19:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785786187; cv=none; b=Cw25JjOU/s2ye5+D71Iu/76KdB0/MMLbky7QjTh6LHC5RgU9GrAPeNA++7IBkpavPJVWDWZRrRoW/W2jnMiALorKvmHgBUFfVH4TmjU7qnbnf+7bdV3PUCwk7Adfmr8VneWHTcMrL78gjDO86ae6dyvmbkOGYnvPZ04QIeTGyNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785786187; c=relaxed/simple;
	bh=Co84259osE+g3vyYlZ1Fr16rUpMEnGqLbq1MAyKgLIk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N0uKRjtHb33bu3EgA17q1uIbQBPXI2uIDizR3DdvaS6VcrhpyK/Y/hGSg369irOzsOi2sz4OnqN/2QuKdDr6ofMChfW6xa4mnsQtM7MDiCceXN2inaS33Jx0VFqQIzfPhADzTeE3iVRPDcfNnZGIRB9AHARNq9L7oJ/YpuObQLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZSy3vDYn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZSy3vDYn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B23C21F00A3D;
	Mon,  3 Aug 2026 19:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785786186;
	bh=yzktPLuKDBeuJw2/TdCs1Fbyjt9YnoZyiQjP6iritOU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ZSy3vDYngm2xpUXNhcSA4XWc0+MN1ZKLMFvekQpdb+ayvikNbswzeq9lJid7bPKDB
	 9JiSaRu3fgWOrhh5+cgn+S7RKfHaEGUU01snNmAh5mIsrjMW/YxOe8hr/sf2Rcvi2+
	 t4D13q4HwGvA8oLiQPPI0sgDU3fEss3LF98Iac8UGCIOCOpOgFRvdE5oUEupy3dRt6
	 5okHuOl7dR+oLEtVflsPupE90WSJlqGdK6+43ekqtkj8Go9GPj5UhBB2ZZMclbSx1w
	 FnLGfNVs1317Q0h6lCwNMjQEJnWhuoGxlTynf+Uqrgy0bEl8QV747S5Oa1QUwQOnxc
	 ThQEg2d+kfyOA==
Date: Mon, 3 Aug 2026 12:43:05 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Ali Ahmet Memis <ali@iusegentoo.com>
Cc: xiexinet@gmail.com, netdev@vger.kernel.org, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
 lukma@denx.de, m-karicheri2@ti.com, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net 1/3] net: hsr: privatize interlink-bound skbs before
 address mutation
Message-ID: <20260803124305.09e0da44@kernel.org>
In-Reply-To: <20260801002931.241238-1-ali@iusegentoo.com>
References: <20260728143604.26-2-xiexinet@gmail.com>
	<20260801002931.241238-1-ali@iusegentoo.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat,  1 Aug 2026 03:29:31 +0300 Ali Ahmet Memis wrote:
> The skb_cow() is placed before the address mutation and, thanks to the
> short-circuit, only runs when the interlink skb can alias a live
> consumer: master-originated frames, or ring frames the master also
> consumes (is_local_dest and not is_local_exclusive). The zero-copy ring
> paths keep their behavior. On allocation failure the frame is dropped
> with rx_dropped accounting, matching the tagged-frame creation failure
> path. Reads correctly to me.
> 
> Reviewed-by: Ali Ahmet Memis <ali@iusegentoo.com>

How are you producing this review?
I've never seen this sort of blurb human-written.
