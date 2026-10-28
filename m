Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.162
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793165478;
	b=rHwZFOrjsRERaodBPJwDrDwNmUJyunvTyLzHB5KRFX2PPRqhDwKohsxcEuOOKWDOd95i
	 G58ehsXxhgwKdeJz7+NTIRDJfBm3Ev0bznP9MPlK+cOvM6lkpEwBh9s6kk6B4vvacvqBr
	 eIMHSRNiBGEjRW4ApSw26ZgkJL6DiRhoizFWxzjkq78bJAZW1tlxllBr5X1OIKa3nYzfC
	 09dlPEQ40CKHO//xzs2ymgIBAPbTx04oQHdot8WwTcAjDJrURFrlJsNFzJQT63w3gmOJO
	 KScwTN21pul/IBvUciU0kqo53kcD8qnN5zoYvprt/Y6Ahw3AjbvFj6DVlYhOUgGIgtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793165478;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=QV6pMFl0zTgQMpH2r3tNqJTPiinMZ5x7f45iM8R0mz0=;
	b=ex5JdbfiLJ1iy4iDk9+GVfYr21VNj0WWSIyGnqRFy4AbawOhrSzjgU2jveBHtq5ZAOhn
	 leMq2/L8EqCcCvOUkahGoABGw7I1ftJt/zA+GZG+lAsH8nSf6GGSf10ZNR1JltKGMcbqE
	 qRFwNCuKR+AO664MOMXgAiH448IAuFInpEut0RniQtY/Mfw6OxQMW24mF+mbOZ7rFDU+j
	 h397HbvMU8qeH1MTxIqIy+gxrqNkUtNBI4gmfg5hBLyDxbIIxTU/aDsQZ1xRc3szC6DyL
	 3k+Bq49AztPBKmhbLg0ou/vDAiKeYmA3W3vylk1a1Pp7ErU+4swHXKQvyfGYiUW/Uqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=u4quU7V+;
	arc=none smtp.remote-ip=95.215.58.162
Received: from mta1.migadu.com (out-162.mta1.migadu.com [95.215.58.162])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D8C606A31A
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 05:31:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8D8C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=u4quU7V+
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=2mQVqzf4Zlx0HzGDppIEZ0GDsAqfCA7ew5bAmcp8+5Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793165473; v=1; x=1793770273;
 b=u4quU7V+e0lAk42zYCjWzgo/K7g+u/uA0C/z9CydaChW0Io3Q6xo2gUFqf6V86L6lI42NqtB
 xPwD3z2Jm34x9ysPdlWlM7/384DRdckZfjPAfhjXUrPiFcgNK3TklgK3PEap9DH4wGVnbwAOM3s
 NKfD5LVQnSibQaD6fYelmldY=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id b55fb0c8a3f5edd5;
	Wed, 28 Oct 2026 05:31:13 +0000
X-Mizu-Trace-ID: b55fb0c8a3f5edd5
X-Migadu-Flow: FLOW_OUT
Date: Wed, 28 Oct 2026 13:30:55 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Jamie Nguyen <jamien@nvidia.com>
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	netdev@vger.kernel.org, kerneljasonxing@gmail.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] selftests: net: txtimestamp: fix out-of-bounds read
 in raw UDP checksum
Message-ID: <auGIVnxH_9ggCDFi@fedora>
References: <20261027162945.2122306-1-jamien@nvidia.com>
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
In-Reply-To: <20261027162945.2122306-1-jamien@nvidia.com>

On Tue, Oct 27, 2026 at 09:29:45AM -0700, Jamie Nguyen wrote:
> With -r (SOCK_RAW, IPPROTO_UDP) the test writes only the UDP header and
> payload, and the kernel adds the IP header. get_udp_csum() still expects
> the IP source and destination addresses to directly precede the UDP
> header, and reads 2 * alen bytes before the start of the buffer: 8 bytes
> for IPv4, 32 bytes for IPv6.
> 
> ASan reports a heap-buffer-overflow for both -4 -r and -6 -r. Without
> ASan the read usually goes unnoticed, but it faults when the buffer is
> the first chunk in the heap. That happens on Ubuntu 26.04, where the
> kselftest runner wraps the test in uutils stdbuf, and txtimestamp.sh
> fails with SIGSEGV on every run.
> 
> Even without a crash, -r packets were sent with a checksum computed
> over unrelated heap memory, so their UDP checksum was invalid.
> 
> Build the pseudo-header from the destination address and checksum only
> the UDP header and payload. -R and -P already write daddr as both the
> source and destination address, so their checksums are unchanged. With
> -r the kernel selects the source address, which equals daddr for the
> loopback addresses used by txtimestamp.sh.
> 
> Fixes: b52354aa068e ("selftests: expand txtimestamp with ipv6 dgram + raw and pf_packet")
> Signed-off-by: Jamie Nguyen <jamien@nvidia.com>
> ---
>  tools/testing/selftests/net/txtimestamp.c | 23 ++++++++++++++---------
>  1 file changed, 14 insertions(+), 9 deletions(-)
> 
> diff --git a/tools/testing/selftests/net/txtimestamp.c b/tools/testing/selftests/net/txtimestamp.c
> index 170be19..f7bdf30 100644
> --- a/tools/testing/selftests/net/txtimestamp.c
> +++ b/tools/testing/selftests/net/txtimestamp.c
> @@ -418,19 +418,25 @@ static uint16_t get_ip_csum(const uint16_t *start, int num_words,
>  	return ~sum;
>  }
>  
> -static uint16_t get_udp_csum(const struct udphdr *udph, int alen)
> +static uint16_t get_udp_csum(const struct udphdr *udph, bool is_ipv4)
>  {
> -	unsigned long pseudo_sum, csum_len;
> -	const void *csum_start = udph;
> +	const void *addr = is_ipv4 ? (void *)&daddr.sin_addr : &daddr6.sin6_addr;
> +	int alen = is_ipv4 ? sizeof(struct in_addr) : sizeof(struct in6_addr);
> +	uint16_t addr16[sizeof(struct in6_addr) / sizeof(uint16_t)];
> +	unsigned long pseudo_sum;
> +	int i;
>  
>  	pseudo_sum = htons(IPPROTO_UDP);
>  	pseudo_sum += udph->len;
>  
> -	/* checksum ip(v6) addresses + udp header + payload */
> -	csum_start -= alen * 2;
> -	csum_len = ntohs(udph->len) + alen * 2;
> +	/* pseudo-header source and destination: both are daddr */
> +	memcpy(addr16, addr, alen);
> +	for (i = 0; i < alen / 2; i++)
> +		pseudo_sum += 2 * addr16[i];
>  
> -	return get_ip_csum(csum_start, csum_len >> 1, pseudo_sum);
> +	/* checksum udp header + payload */
> +	return get_ip_csum((const uint16_t *)udph, ntohs(udph->len) >> 1,
> +			   pseudo_sum);
>  }
>  
>  static int fill_header_ipv4(void *p)
> @@ -479,8 +485,7 @@ static void fill_header_udp(void *p, bool is_ipv4)
>  	udph->len    = ntohs(sizeof(*udph) + cfg_payload_len);
>  	udph->check  = 0;
>  
> -	udph->check  = get_udp_csum(udph, is_ipv4 ? sizeof(struct in_addr) :
> -						    sizeof(struct in6_addr));
> +	udph->check  = get_udp_csum(udph, is_ipv4);
>  }
>  
>  static void do_test(int family, unsigned int report_opt)
> -- 
> 2.43.0
> 

Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
