Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F83D30AAD8;
	Mon,  3 Aug 2026 22:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785797977; cv=none; b=P1+gUwHjSll9cDAn51DOezWbpBlNqTJFd+0TbzQP3vE5GWygip10VC5UwOlck9vxzPSqnQHpeYagZjInsfk1RAByLlNrp+DTuP/jRnbhmHU7UnyVJOnl3d1a7RNqj13bg2VVj6LgiLhR6brsw5+ptaaVxu97RmhnVteUP5QJhEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785797977; c=relaxed/simple;
	bh=BT6L0YM+7XRWWJH4N63NgGpTtrUVEd3FatngU+jwBrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A9s6ryxyLSYSAHN0shZZcGB8LoG2DwpLncsNa1rgkC/kS6EKAKf2KRdQ6G3LZ8b4inwH1y30khcc5tMuketNVYgiyTNQf+YV3oinkRy2W4M4A/qIxOYEs9Ct7xKYH7c01d3kjOtZfQm1oouhGOdbDM1kBxSdrFzyWEoVKrMA5Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Duw8EgtQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Duw8EgtQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E9AD1F000E9;
	Mon,  3 Aug 2026 22:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785797976;
	bh=8CkxO/DTgGFaa2J/7qzYtaC2jJ/ZmsNmDU8sPOU7JCw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Duw8EgtQblVNXNeSfqUAmph7eg47+UAAEoMgZNZkQsGLHhKwGY321V246j0+rgSg2
	 BRgN9/fUOqJsw33lQzaD4gXpTt22tLNagfS/xVvxoNzKBjiHxbRJFg7oO4qCX9jtmt
	 HqaFajLN14Pke0PG18QcWninRuLfGLoY+Q7Iu8/jR+bc4XLB+lAu5ImrBgHXpUsa0N
	 rg1LBaTe5l3yXlqy4TTs/nseDybPwsZqIQ+x9XLuQ5T4hlxP9YNJ6pnWC2SrW1E4hm
	 HKuc3rShGGY1MHeqMzMpOsIR+fd+nqdBG0oL8PpKM0VMHDAk/LLH1OvQ8rqrLeLQ/p
	 S+McJ9MjjhNyw==
Date: Mon, 3 Aug 2026 15:59:35 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Chuck Lever <cel@kernel.org>
Cc: John Fastabend <john.fastabend@gmail.com>, Sabrina Dubroca
 <sd@queasysnail.net>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Dave Watson <davejwatson@fb.com>, Shuah Khan
 <shuah@kernel.org>, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net 3/9] net/tls: Fail tls_sw_splice_read() after a
 failed async decrypt
Message-ID: <20260803155935.0f023e4f@kernel.org>
In-Reply-To: <20260726-tls-follow-on-v1-3-99bf4cc1c729@kernel.org>
References: <20260726-tls-follow-on-v1-0-99bf4cc1c729@kernel.org>
	<20260726-tls-follow-on-v1-3-99bf4cc1c729@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 26 Jul 2026 20:33:31 -0400 Chuck Lever wrote:
> When an async decrypt fails, tls_decrypt_done() records the error in
> ctx->async_wait.err and calls tls_err_abort(), which stores it in
> sk_err. tls_sw_recvmsg() and tls_sw_read_sock() each read
> async_wait.err once they hold the reader lock and fail the call: a
> record that did not authenticate breaks the connection.
> 
> tls_sw_splice_read() has no such check, and sk_err does not stand in
> for one. tls_rx_rec_wait() tests sk_err only inside the loop it
> skips whenever a record is already parsed, and the first reader to
> reach sock_error() clears it, while async_wait.err persists. A
> splice therefore keeps delivering records on a connection that
> recvmsg() and read_sock() refuse to read.
> 
> Read async_wait.err in tls_sw_splice_read() as the other two readers
> do.

Reviewed-by: Jakub Kicinski <kuba@kernel.org>
