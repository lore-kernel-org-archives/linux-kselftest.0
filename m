Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792655541;
	b=CtIUIWL6/AaDCkygseEPivdwH8ONZoEnGeXN9jBUUX2gyGJjRS963zpOfj8bM11Q2B5a
	 wJbnU9c+XEFLiGe74jSgb8hqi/si92LOowOKSsG+66SBUPUqDw2HzKggOOqU42dA3IGXz
	 y/U6Q5y+T+6zsru35eyW5ONj/u7iyhdebsULdNhLxX7JEW4OwUzSDKgrMtuIBnA7/ShhI
	 RW/TSc42JbkrscZNFC39jU/A/OUdJLXtmhYF/mnyjEvqjO6N6CXU1y9RgCaKFM4TkzCp/
	 iztg1NprXBmyNZfbleRLKHGsxoaN13WSCAYE62h+iDO+ikmsNf9YXgyhg9fsRzDgRQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792655541;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=72aFLp27/R8ZjB6rNWZA1eIaUhpL3oNIObCJ0g+GS6I=;
	b=h0mO8kOhti771nfKAjIil6rz417WBblOgNbI/ZOsMUmepnRMSCckyWIlbywhr68Fvcq+
	 3taM1WBtuEYzQ9AaJn09uIjxGUEDadzdQsfkNRiKaQ6epZl4eKQlfARC0PLvcGTPkoe6o
	 jAteVc+N3Rzb7VemQuB3MbFh06niL6VpEHXlkBcY/nfaknSNtaYZIjalwjwRf1ddeb7Ld
	 AwL4nTTBd1XBQWLNgHYT+nGJ5hRqkmu7+M0cuH2p3hIVvwnO+5H99PS2RMru6dWDIG1oj
	 l/dQbGW3pxxQsZpygGjeJkA/t5cfoERHOejTbqwPCqyCkljJMOokJ3+2sTdr00X5UAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZgE59edo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF12606A321;
	Thu, 22 Oct 2026 07:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZgE59edo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDE761F000C2;
	Thu, 22 Oct 2026 07:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792655541;
	bh=72aFLp27/R8ZjB6rNWZA1eIaUhpL3oNIObCJ0g+GS6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZgE59edo0VoZGNbFZua/HV3eM6MFXhh387eRzNtOtDKX4te01aAj3rqBVczj02RRR
	 fi4zR5Qnfk9vQwL1rnFj1tzg81oVVNCOQ4/PaO1Gj35+22kwqDophr7AToG89fjLl3
	 i+DcA3dI33SYUFaVipG37XRrwnI9NleSVs2UMSLRn161PXNDxQGMlUARvyzPH8U2Ax
	 b5YSjSsZRbIaa1wHpdyULtVPuzjXfzmYp3MoDuhK57SP4AzGRp5kRIe2BLNFIACqcK
	 dX9LYP9oyPWCs278TvLycjm3tjhz8i//XoHu/wNq8DSQiYKqtU/lop3hYFEQrxkUhl
	 vVwP435G4YJXw==
Date: Thu, 22 Oct 2026 09:52:18 +0200
From: Antoine Tenart <atenart@kernel.org>
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Hangbin Liu <liuhangbin@kylinos.cn>
Subject: Re: [PATCH net] selftests: gro: remove unused variable total_data
Message-ID: <atnAmOuzTuL-0f4u@kwain>
References: <20261022-self_unused_var-v1-1-8ab10a6b7f44@kylinos.cn>
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
In-Reply-To: <20261022-self_unused_var-v1-1-8ab10a6b7f44@kylinos.cn>

On Thu, Oct 22, 2026 at 11:09:35AM +0800, Hangbin Liu wrote:
> From: Hangbin Liu <liuhangbin@kylinos.cn>
> 
> I hit a build warning when building the net selftests.
> 
>   gro.c: In function 'check_capacity_pkts':                                                                                                                                                                                     gro.c:1249:13: warning: variable 'total_data' set but not used [-Wunused-but-set-variable=]
>    1249 |         int total_data = 0;
>         |             ^~~~~~~~~~
> 
> Remove the total_data variable, as it is no longer used.
> 
> Fixes: d97348474708 ("selftests: drv-net: gro: always wait for FIN in the capacity test")
> Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>

Reviewed-by: Antoine Tenart <atenart@kernel.org>

> ---
>  tools/testing/selftests/net/lib/gro.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/net/lib/gro.c b/tools/testing/selftests/net/lib/gro.c
> index 7a333155de1a..1bc92e7a625f 100644
> --- a/tools/testing/selftests/net/lib/gro.c
> +++ b/tools/testing/selftests/net/lib/gro.c
> @@ -1246,7 +1246,6 @@ static void check_capacity_pkts(int fd)
>  	int coalesced[num_flows];
>  	struct tcphdr *tcph;
>  	int ip_ext_len = 0;
> -	int total_data = 0;
>  	int pkt_size = -1;
>  	int data_len = 0;
>  	int flow_id;
> @@ -1309,7 +1308,6 @@ static void check_capacity_pkts(int fd)
>  		}
>  
>  		num_pkt++;
> -		total_data += data_len;
>  	}
>  
>  	/* Check flow ordering. We expect to see all non-coalesced first segs
> 
> ---
> base-commit: e0a958ddfc89f2e1c43448cdaeb5b30e54e19448
> change-id: 20261022-self_unused_var-d54af8d61a56
> 
> Best regards,
> --  
> Hangbin Liu <liuhangbin@kylinos.cn>
> 
