Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795412350;
	b=1UevrdqLc4EztlolBKq5IShTYl9tTAQbnKzfd4FSsIGciLRPT06TumzAqTWMkfY7s3XZ
	 /qztpGIYROcE304A8ScSywKnbMTJV1562UhsUOxftEg+rVYpGmfsTGomtNWZrvaeHqYT5
	 ocEQ0RSGEaJr9U6gkRO1D6f/ZD4WRRjUj54rTOY0NIBYzKLI+yAM4Qz8MxMdLyTECSjF2
	 9cxMpGAPx9sCsOrZgy4oE6OvV6lw+vae+Z5QZWCkyT37A2dwbgLkoI3vCDcz6HY8v9gJ1
	 2i1P43xVT8yOWgBH4bH3b7C39RqvZh3J+Q+qH6k7mlvJ55iPLpKNhUSlAfoEYdQRp1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795412350;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=9fZC67cJJ/GjqV+nhFxv50Ir/g4Ncc4bsSbtF+FPqMU=;
	b=hIaTe/29ptmf+n/0hUzWb2xCYqFLSmpths14BCgX54S9uEbsYkJtdvMHj/w9HyO43uCC
	 4tHJGXR9DfWAnG1zARWmHeDvzyf8cz65NNHU3s3sxVdUOl6WNEnTVBpnqElkf49dNdIvR
	 lummeQTkkEiiBmyURwWeDk/GcJniCnswftpbhUqrLVdMsLlp3V6O/hK6uGCFtARRjdj1B
	 qcray4nURBOXjG6BekaBTn00SOv7KBALnV01Lbo3abAcSeeIJrPcplyHzr3wdux60jvbg
	 HG9wC9VTosPJ/FzusnNEAQ8Zl4TUf+/MiH5cN6k18ooBU9xmm2CTkXzlwyIQlPTWsEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OJheM6XN;
	arc=none smtp.remote-ip=95.215.58.146
Received: from mta1.migadu.com (out-146.mta1.migadu.com [95.215.58.146])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75E6606A32A
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 05:39:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A75E6606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OJheM6XN
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=GGgKl6H2K6gHd6hfWzXd1Bt9/gcGE2YwIrAA2CbG6HE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795412347; v=1; x=1796017147;
 b=OJheM6XNmkjKLELNqpyXr1iE+WMP8bwEStj1ztPkWTyBCt43i7svWeJ5eQF7MvEVAGKFPuDl
 0NcZYGSB55t39ls9W4uFbaHdWJBxoohMz6bWoxQ74kf+rlSv1gI8maU/M3n6hq8p5+IL0BU3j3h
 vTbtM7KzjNxxcqb0jyn1C6tE=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 80c29ab3a696dce2;
	Mon, 23 Nov 2026 05:39:07 +0000
X-Mizu-Trace-ID: 80c29ab3a696dce2
X-Migadu-Flow: FLOW_OUT
Date: Mon, 23 Nov 2026 13:38:56 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
Subject: Re: [PATCH net-next] selftests: net: reuseport_addr_any: report
 epoll_wait timeouts honestly
Message-ID: <20261123053856.GH10218@Liu-laptop>
References: <20261120065855.22628-1-emmaonana18@gmail.com>
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
In-Reply-To: <20261120065855.22628-1-emmaonana18@gmail.com>

On Fri, Nov 20, 2026 at 07:58:55AM +0100, Omokefe Emmanuel Onanaroghene wrote:
> receive_once() waits 3ms for a packet but only checks for errors
> (i < 0). On timeout (i == 0) it falls through and uses ev.data.fd
> uninitialized. recv() on a garbage fd fails with a misleading
> "failed to recv" (or worse, blocks or returns a bogus fd). Report
> the timeout for what it is; errnum 0, since epoll_wait sets no
> errno on timeout.
> 
> Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
> ---
>  tools/testing/selftests/net/reuseport_addr_any.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tools/testing/selftests/net/reuseport_addr_any.c b/tools/testing/selftests/net/reuseport_addr_any.c
> index 1c43401a1c807..2e8aa83f68dd0 100644
> --- a/tools/testing/selftests/net/reuseport_addr_any.c
> +++ b/tools/testing/selftests/net/reuseport_addr_any.c
> @@ -155,6 +155,8 @@ static int receive_once(int epfd, int proto)
>  	i = epoll_wait(epfd, &ev, 1, 3);
>  	if (i < 0)
>  		error(1, errno, "epoll_wait failed");
> +	if (i == 0)
> +		error(1, 0, "epoll_wait timed out waiting for packet");
>  
>  	if (proto == SOCK_STREAM) {
>  		fd = accept(ev.data.fd, NULL, NULL);
> -- 
> 2.43.0
> 

Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
