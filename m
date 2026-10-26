Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793054270;
	b=CXalmrtnkPw0RPv0Pu8/uehUSAF0WVJ5xWdPl8MwxHXMjYcSd9W6exjfI/JKESA2dPq8
	 YGSgp+1csVlvzFf4Prby84FJne34pZm2MkLi7fHbKjgQQhBA7X0Tl6laVZQJquL5Z1VdC
	 c767tpToRjVbzb4pf9BMWrsG3hc7AabWmekncZQmcZEaa3qlxx73xllefhvxVoDcq8iI8
	 5mWSMTY4u2u9rnh3QScMepZgRXDejo4iQqpWyeZ0WI6ChXcOmpwjH2Zgv1TvjDlJOhVMt
	 NNAU95SKFjAhsVLjGWwbFPwpjEVK1qDCvd+XYjyPHTBTiNRWMiXtdH4eavKeBzNTgWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793054270;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=q6n1jS09El/KtRNUVXo3j4tGJkMn0htA1/n19nhnyLM=;
	b=LO4vFkvXQbKHE+FwkRFuZp5SunIeEsjFDeWxCa3XsbGQM6J0LA+GdLdqp4GZotYqAl0F
	 UGBbtqv5m++GOsSnOjlwf8xl+CPet19U54gxnIaBvVZ93Q+peJY0mjHSWxCYXEwtgu8vX
	 KN4CSs9/5eCmwcksSlNBHUtYf5buiKL8Xsg0Ad0AP1ZmFQno33XLZGtVo72hQfL0Ghh7x
	 RwU89IkIhrYlOEUodTFa4QQXq5+12sKL6X5NHlw26JnaBo+6fJyLY5JkQ9EGKeh2dj2Hi
	 E8DyrA7f6z6EuYkTL/eRfNSB3+mZ8SLlOyYXKYzZZmqf5Vp+mxUAKSgG6kGjwz42P5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FurgXxVX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F22606A31A;
	Mon, 26 Oct 2026 22:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FurgXxVX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 406971F01825;
	Mon, 26 Oct 2026 22:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793054269;
	bh=q6n1jS09El/KtRNUVXo3j4tGJkMn0htA1/n19nhnyLM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=FurgXxVXw7p39PHKqZ+GmdwKKm+/8/psY9+4S/SVIu23za8pQFsmtlN6XhSCQ6wl1
	 OToZvgKxiVkM0kKvMPU5bLlYT18UrKAG4fBpd+cJFqDhLgDAD27IiKTzEa9E/xXFc0
	 6slRe0bS2qihAJePpPgwOG/VDZWkDnBcu7+XrabtxejxwlsztbKqQLJPvQ2OaVz1Rz
	 UX7Rm/njVsdqq6j/po+lIc6wTPk+eZKiGZAZGQaEV2hsXollncl4seEibBnD7RzkaZ
	 l9D8ijwUju0AqSeSnkTJnqZb2tCNTasmcePDihDUDC1FO2u9/qwKMGvwW4SZ3sAfzA
	 hedjGW389ehnQ==
Date: Mon, 26 Oct 2026 15:37:48 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Chuck Lever <cel@kernel.org>
Cc: John Fastabend <john.fastabend@gmail.com>, Sabrina Dubroca
 <sd@queasysnail.net>, "David S. Miller" <davem@davemloft.net>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Dave Watson
 <davejwatson@fb.com>, Shuah Khan <shuah@kernel.org>, Qingfang Deng
 <qingfang.deng@linux.dev>, Eric Dumazet <edumazet@kernel.org>,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, sashiko-bot
 <sashiko-bot@kernel.org>, sashiko-bot <netdev-bot+sashiko@kernel.org>
Subject: Re: [PATCH net-next v6 0/9] net/tls: Receive-path fixes for
 zero-length data records
Message-ID: <20261026153748.29911bae@kernel.org>
In-Reply-To: <20261019-tls-follow-on-v6-0-ab01c4ecca0c@kernel.org>
References: <20261019-tls-follow-on-v6-0-ab01c4ecca0c@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 19 Oct 2026 12:55:16 -0400 Chuck Lever wrote:
> Commit 3be28e2c9cd0 ("net/tls: Consume empty data records in
> tls_sw_read_sock()") fixed one reader. TLS 1.2 and TLS 1.3 both
> permit a zero-length application_data record as a traffic-analysis
> countermeasure (RFC 5246, Section 6.2.1; RFC 8446, Section 5.1), so
> a peer that pads its stream emits them by design. The other two
> software readers still mishandle them. splice(2) reports an empty
> record as EOF, and the caller tears down a connection that is still
> live. recvmsg(2) makes no progress on one, so a peer that streams
> them holds the caller in the kernel past SIGKILL. With MSG_PEEK or
> async decryption, each record is also queued on rx_list, which
> grows without bound.

The shape of this series is still quite confusing to me.
Let me take over a little bit so that we make some progress
(while retaining your authorship where possible).
