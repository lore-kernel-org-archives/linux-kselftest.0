Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0278B346E74;
	Mon,  3 Aug 2026 22:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785797888; cv=none; b=iAmknt2DNKctos36cyzZQSJlpmUXOq3AD2BEp+owYY2ZK25GnOlMq0QcdIUac8U2bj89kOF1jv2XuYKUIczLXIBGZ5CKmA78LkjTRN6BiX0LYyx975Buqw/pT/+uKd12ri0m0rKW/3xDM/o1yQaVtq7EE7RvyKLWMLAmG5+3S2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785797888; c=relaxed/simple;
	bh=RP5WQHhYDCyWUa9VYOEa8iHCOuAhPZJOG8nmx1/4z2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nCm5eEoskbXHhf2xaw3VQtieh22lqoFYzlQXITG5Izo7HJEDrXTpLvGhSzFpC4ExCvyBh+3zz4fHbSQWDwrCgC9aqhUVi4xRY5gsgzPYP+BKE9oU+9CKjckJOe3AHIooe1RcF3SPVf5BnYu4H+lPRrRe3ztt7a7hGhJ2b7bgmp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ai5Kn19W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ai5Kn19W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 169451F000E9;
	Mon,  3 Aug 2026 22:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785797886;
	bh=Vj2Hn3T+uJ4uveUVWkfGc+T7+e+aekwW/0wRv+NzPT4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Ai5Kn19W5C6iEJK7eV6IaYaMGRWMMUrkDphANE5ibnVoxcXjQNCYN7403Z7fXCfOR
	 Ouh3SRsuwZxPhiBnd4qcyr51YKPETimPV+j+gim6AJBi7+KcwsFGgbq8UT7xZt5Jh/
	 9WkcPuuPzMNBOz6TLTIaH6bVIl04IZDe2HCza3QpQg010swBHwBu+DUzXV42UCfacW
	 NVSQzwGuWR4rH+RH4JkM2Cr20le8KUPf0V819mUUrKQ9dvl3Qme3nhlEMBnr03qkID
	 jO6M5GYjNbJKMYnNUZFdWfLB1ajD6mjGXggS42i9K8GPOis/Jjer4+tCjnFdTzkhup
	 w8KoGz0xqanrw==
Date: Mon, 3 Aug 2026 15:58:05 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Chuck Lever <cel@kernel.org>
Cc: John Fastabend <john.fastabend@gmail.com>, Sabrina Dubroca
 <sd@queasysnail.net>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Dave Watson <davejwatson@fb.com>, Shuah Khan
 <shuah@kernel.org>, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net 0/9] net/tls: Receive-path fixes for zero-length
 data records
Message-ID: <20260803155805.2441c4d5@kernel.org>
In-Reply-To: <20260726-tls-follow-on-v1-0-99bf4cc1c729@kernel.org>
References: <20260726-tls-follow-on-v1-0-99bf4cc1c729@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 26 Jul 2026 20:33:28 -0400 Chuck Lever wrote:
>       net/tls: Bound time spent on no-data records in tls_sw_read_sock()
>       net/tls: Consume empty data records in tls_sw_splice_read()
>       net/tls: Fail tls_sw_splice_read() after a failed async decrypt
>       net/tls: Honor O_NONBLOCK in tls_sw_splice_read()
>       net/tls: Consume empty data records in tls_sw_recvmsg()
>       selftests: tls: add peek and splice coverage for zero-length records
>       selftests: tls: skip the zero_len tests when TLS is unavailable
>       selftests: tls: cover splice on a nonblocking socket
>       selftests: tls: cover splice after a failed decrypt

Could we get patches 3 and 9 out as a separate series? 
These look uncontroversial. The zero-length record handling looks
awkward TBH.
