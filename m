Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536001F8723;
	Fri, 21 Aug 2026 18:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787337242; cv=none; b=oMRCVijxNkqBDU1+iWiJnyEO1xHlTtd1jPM7BfVN0hPfNjaafARa1x0bp9pOLZyHAvt/7LgWI0jChFAz1pW4GjYtsHYJcrf8Ep6oP/G7vbI7cobUhjkhLLK6//V9i++oOeYEIj84kGRuMLKAQOE/CbeYtCVlI40rwopV9z/sJ7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787337242; c=relaxed/simple;
	bh=Wd+zRFaxn1CF5Yobx1UxNiHHlRt3TYZ409ILYkzBlsY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AV1tQiZxPktqvLlcUDgBsRK74jMUM/9y3KWtlpqwnggnYdxAIsdVHhnh57C6AlsZ40pd4GO8ldkD53mRDE/KfshDeiw/ULGEJs7s/fj3W8SbPgWMHwll5zhrrIfMU8XjBz14dT/bEwWdHJGwdDLUie3YyXpSHKdDtkWe+t4iJZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D+L0h7cp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D+L0h7cp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F59E1F000E9;
	Fri, 21 Aug 2026 18:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787337240;
	bh=JH/l/dqk47kLB+6w7fKfNYs9GQwUENoR/HjGKr0KNu4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=D+L0h7cpSvuqp9GNL+HE/gzq6QcUAIJzyafgeut0MgO0GEv2pNdgPbwgZasKbuB2w
	 4id51Bk07+ux1L+VTHcEIQD1dJhJfWIEMRlW7XceUPdL9rhIPE9N0W3jkhlSM8Jcue
	 33P2LaJmAQjZyQJAlaovn33zUxGMZfTK27+nqIiK9IF6FPRp33Az29bEu5NSu2OzN3
	 ZZK1ZhfDBEEXFfu82z/nzIG6jsPboSZJddmdk4ecw2nC43t4M4+ibPNrra4PAddZQz
	 4J421mfH8p7Q3urITzkSKAYRsYX3gilDvq6rgT2n5LLejvCyS20ij3tBxv6E6JKw6u
	 udltm+RP46j+g==
Message-ID: <17fac875-ce43-43ec-9e9d-329a09d4f3eb@kernel.org>
Date: Fri, 21 Aug 2026 12:33:59 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 1/2] net/tcp: fix TCP-AO key deletion in VRFs
Content-Language: en-US
To: Rastislav Szabo <rastislav.szabo@isovalent.com>, netdev@vger.kernel.org
Cc: edumazet@google.com, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, shuah@kernel.org, dima@arista.com,
 linux-kselftest@vger.kernel.org, Dmitry Safonov <0x7f454c46@gmail.com>
References: <20260821153823.266343-1-rastislav.szabo@isovalent.com>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <20260821153823.266343-1-rastislav.szabo@isovalent.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/21/26 9:38 AM, Rastislav Szabo wrote:
> TCP-AO keys with TCP_AO_KEYF_IFINDEX store the VRF L3 interface index in
> l3index. tcp_ao_del_cmd() validates the supplied ifindex, but does not
> assign it to its local l3index before matching keys.
> 
> As a result, deleting a key scoped to a non-default VRF always fails with
> ENOENT because it is matched against l3index 0.
> 
> Fixes: 248411b8cb89 ("net/tcp: Wire up l3index to TCP-AO")
> Cc: stable@vger.kernel.org
> Signed-off-by: Rastislav Szabo <rastislav.szabo@isovalent.com>
> ---
>  net/ipv4/tcp_ao.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/net/ipv4/tcp_ao.c b/net/ipv4/tcp_ao.c
> index 5094267447ae..26864621e6de 100644
> --- a/net/ipv4/tcp_ao.c
> +++ b/net/ipv4/tcp_ao.c
> @@ -1834,6 +1834,9 @@ static int tcp_ao_del_cmd(struct sock *sk, unsigned short int family,
>  	if (cmd.ifindex && !(cmd.keyflags & TCP_AO_KEYF_IFINDEX))
>  		return -EINVAL;
>  
> +	if (cmd.keyflags & TCP_AO_KEYF_IFINDEX)
> +		l3index = cmd.ifindex;
> +
>  	ao_info = setsockopt_ao_info(sk);
>  	if (IS_ERR(ao_info))
>  		return PTR_ERR(ao_info);
> 
> base-commit: 746fc0787f616da418ffc04a110296fe95d53491

Looks correct to me. Dmitry?

Reviewed-by: David Ahern <dsahern@kernel.org>

