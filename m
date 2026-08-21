Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DCB337BAB;
	Fri, 21 Aug 2026 18:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787337336; cv=none; b=U4NhY3LXw+QZJMdpmwCC8t0Fnj68qBXq+6+GTmRq1tqufrszgRYAjPHtQk3MSWcLQznVrNUBtmfbHGk3gKUSyBdRv6b5HKM+le6RFhRp+zAguGklllpd9uzzZ2vv+K9/eqKZSRDjO1v3zrtdjin093XU83/qemwS2/rT7rEFp/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787337336; c=relaxed/simple;
	bh=JBZEX54NE1K5KtvIWupK1eIxShX4N3Yn64o1ChRUTCE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DsBr6KNMykZJRO93fEwT9I9mULUJoGL8GKvHH/C5pVdB6mdH/uVzXjp0oBoYT/W8iTRytyNFa3HdOxFwWys3llirlkANVNJ8mpWX8MO58m91MwN+CQXWrh9lWozdJDNGbWTF4cjy7hXqrJWO2U5tR6yeYGGaymg6dfHII1BG+8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aUjDV3bJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aUjDV3bJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F4A61F000E9;
	Fri, 21 Aug 2026 18:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787337334;
	bh=zxF5BlY4JwG1cKyab03eHAksiccf4yN/+kw5igcu+2I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=aUjDV3bJdGEN4GCg3VA2bWhauaYGHSjKpcSg/fqmGlVDUqvEExqe/TuJECWzneCuS
	 K5iEwWuvI+lbJcvttKxz/IRfJ4EbTX4EYJ1K++/Jg7WsU2ADYg7C2SThah+Bu1HfzH
	 /cB6EF0Acn0uz1RBiXBxvSAUjBrrT4wohfXbymetsDZyqzHVwt/8dlfMVOLxF47l19
	 yOW8I/b3hypNDZUiBXrhwyTh0MnGEImR9BxPJCRKxZgJ/At9OfgPTZ/4QX65cLY81d
	 6oOdYpDdaTwS4Y+X6+qtjPMovfVDdC0QTYRMYzJZcP8NjF+EFw2hcdvbCBYw/Sy9K+
	 YZ46RDlD9lEJA==
Message-ID: <bacc585b-8b2d-47fc-b26a-83854a931bc0@kernel.org>
Date: Fri, 21 Aug 2026 12:35:34 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 2/2] selftests: net: tcp_ao: test VRF-scoped key
 deletion
Content-Language: en-US
To: Rastislav Szabo <rastislav.szabo@isovalent.com>, netdev@vger.kernel.org
Cc: edumazet@google.com, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, shuah@kernel.org, dima@arista.com,
 linux-kselftest@vger.kernel.org
References: <20260821153823.266343-1-rastislav.szabo@isovalent.com>
 <20260821153823.266343-2-rastislav.szabo@isovalent.com>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <20260821153823.266343-2-rastislav.szabo@isovalent.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/21/26 9:38 AM, Rastislav Szabo wrote:
> Verify that TCP_AO_DEL_KEY can remove a TCP-AO key scoped to a VRF.
> 
> Assisted-by: Codex:GPT-5
> Signed-off-by: Rastislav Szabo <rastislav.szabo@isovalent.com>
> ---
>  .../selftests/net/tcp_ao/key-management.c     | 66 ++++++++++++-------
>  .../testing/selftests/net/tcp_ao/lib/aolib.h  |  6 +-
>  tools/testing/selftests/net/tcp_ao/lib/sock.c |  4 +-
>  3 files changed, 51 insertions(+), 25 deletions(-)
> 
> diff --git a/tools/testing/selftests/net/tcp_ao/key-management.c b/tools/testing/selftests/net/tcp_ao/key-management.c
> index d86bb380b79f..1e01e805dba7 100644
> --- a/tools/testing/selftests/net/tcp_ao/key-management.c
> +++ b/tools/testing/selftests/net/tcp_ao/key-management.c
> @@ -63,7 +63,8 @@ static int prepare_lsk(union tcp_addr *addr, uint8_t sndid, uint8_t rcvid)
>  	return sk;
>  }
>  
> -static int test_del_key(int sk, uint8_t sndid, uint8_t rcvid, bool async,
> +static int test_del_key(int sk, uint8_t sndid, uint8_t rcvid, int ifindex,
> +			bool async,
>  			int current_key, int rnext_key)

The new async can be put on the line with current_key.


Other than that nit:
Reviewed-by: David Ahern <dsahern@kernel.org>


