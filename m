Received: from mta1.migadu.com (out-197.mta1.migadu.com [95.215.58.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E413221546
	for <linux-kselftest@vger.kernel.org>; Sun,  4 Oct 2026 06:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791095791; cv=none; b=eVZdLTzNy0FGUEgt92ojupfol4uTCzqD3bEbtSGjld8Cob7YUPYAJNgnGqtQM9GSwqjvKz6PMxy8coXom8a9WZ/phAoo95WIHrorYnk3PLAbSaLGXam0C14Q1aRw6xWKkmj018KTMCLBHm4RXBgTvc9tS85g95Ij+MoeGQHuCtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791095791; c=relaxed/simple;
	bh=qaZQL6JA/gtIy5gzqumLFduOjb9PnmSFcMuUA4B3Mxc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZBSn+RXIt7jXbQRxq0e0C38zK0m1aV6mmjywAz6ryBam8k6NLmiPkXIpbTkIEQpu7+HxxK3mSCz/GjxsA7GZNwFMfi38tvf3Te2BAQNIpAhbzCRvHWSzVq/J+mVsMOrJftR/fE3tZFpUkg6c61U9dsFWVe2uOpvJF1ybDHs36hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=RlwBvv+j; arc=none smtp.client-ip=95.215.58.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="RlwBvv+j"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=qaZQL6JA/gtIy5gzqumLFduOjb9PnmSFcMuUA4B3Mxc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791095787; v=1; x=1791700587;
 b=RlwBvv+jbu6R6VAbhbNNrSmV8S42s59DkKyl+ZgqiftOuThZzNQIWAxgRhaB1sA10SEJSNVr
 Td98C7p6lAnK7FZW56+CF9dqgnCuvte9uSd2Bg0JYvfFQZRE4/PbaTJGrT3x8PCj0Q+zETZVXkW
 ERokJWrXmc6S82l50OYmf8ig=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 84b858e26606b6e4;
	Sun, 04 Oct 2026 06:36:27 +0000
X-Mizu-Trace-ID: 84b858e26606b6e4
X-Migadu-Flow: FLOW_OUT
Message-ID: <3f985dfb-bbb7-4307-8ce4-5b3c086ee179@linux.dev>
Date: Sun, 4 Oct 2026 14:36:19 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 0/8] net/tls: Receive-path fixes for
 zero-length data records
To: Chuck Lever <cel@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 John Fastabend <john.fastabend@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Sabrina Dubroca <sd@queasysnail.net>, "David S. Miller"
 <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Dave Watson <davejwatson@fb.com>,
 Shuah Khan <shuah@kernel.org>, Eric Dumazet <edumazet@kernel.org>
References: <20261001-tls-follow-on-v2-0-2dd1947bb642@kernel.org>
Content-Language: en-US
From: Qingfang Deng <qingfang.deng@linux.dev>
In-Reply-To: <20261001-tls-follow-on-v2-0-2dd1947bb642@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/2/2026 6:41 AM, Chuck Lever wrote:
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
> 
> This series supersedes "[PATCH net] tls: skip empty data records in
> tls_sw_splice_read()", which fixes the splice case alone:
> https://lore.kernel.org/netdev/20260930052636.166007-1-qingfang.deng@linux.dev/
tls_sw_splice_read() currently returns at most 16KiB (one record) per 
call. You may add a loop like the one in tls_sw_recvmsg().

Best regards,
Qingfang
