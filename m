Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB18214A9B;
	Thu, 17 Sep 2026 00:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789605632; cv=none; b=j4jChHP75YQ8JNbG1y/a0BZmQwyIwlNWmTLQMuhtqdQjJLykCuGa4kNSh4DX5KVs1SryBOBrqE2dW2Q+tvK36TemSm1/cIlOA/L33xYOc/MVakwwway70RH65MjpIAUKZsGSOM6d5wuHF4LuerNP18zZIF2D/MiXHDMglo/Ow+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789605632; c=relaxed/simple;
	bh=Aayokhv9XINqpz9W3aYBaHx+9q0KQLiRqlTP3OiBn6M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SBsrdhvPJ/G6SX6VmOUve9WxlvjTgQRu+HhPS4Jpugsd+ziazXVQM00HRMcDWRswzNoTkRztXGnYLHcMVybO5mrju0s+rYJB1/6U4vSm1OWQ1OamqjmwL1LQJsI6sL029hsCOPIXjpW9eC0hkxXX9aMo6o9pJgrZFP9fLItLKD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fs8NFO0r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fs8NFO0r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A99791F00893;
	Thu, 17 Sep 2026 00:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789605631;
	bh=DqUJTAEx6W7xs/2kQ2owmDa2Y73pdtkDzqIy+nPJS6U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Fs8NFO0rCFBFzFPxQUu8UJzobooawYqXltlnciKSXUb0T/ZigSSN/3U+KPgv7mzqj
	 J+BbNcfoh4ShIcIzel0DNKrGSrlQrAdmMJ6opdByOS6Iwpu2QAoHpzcdvIt9s4ezbr
	 FerNjXN8LBXt8kfzbApbivGKi0Bn2ZRIVHGtuuL2G83SD41AkaWzewuccfUbrmxQT3
	 Qjq/fffjjfGhMStn57NEJco0ACqVYv7ifaXsDns0whlxQh+ZTbhf9mIcL6m4GTWz9W
	 TvY3sV78M30PLQ/07Xs+LkOccBLh4BEol0EaaYOaDj8K2Yl0Ag3KxTDrjMiSpZqviB
	 64ffUs7b5nkGg==
Date: Wed, 16 Sep 2026 17:40:29 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Qingshuang Fu <fuqingshuang@kylinos.cn>
Cc: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, Willem de Bruijn
 <willemb@google.com>, Anton Danilov <littlesmilingcloud@gmail.com>,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: net: fou_mcast_encap: conditionally load fou
 module and skip IPv4 case
Message-ID: <20260916174029.78939f6b@kernel.org>
In-Reply-To: <20260911100158.854183-1-fuqingshuang@kylinos.cn>
References: <20260911100158.854183-1-fuqingshuang@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 11 Sep 2026 18:01:58 +0800 Qingshuang Fu wrote:
> Fixes: e5382133c51c ("selftests: net: add FOU multicast encapsulation resubmit test")

No fixes tag, please, this is barely worth applying at all, let along
as a fix.

> diff --git a/tools/testing/selftests/net/fou_mcast_encap.sh b/tools/testing/selftests/net/fou_mcast_encap.sh
> index 70210d39fba3..d94c19237daf 100755
> --- a/tools/testing/selftests/net/fou_mcast_encap.sh
> +++ b/tools/testing/selftests/net/fou_mcast_encap.sh
> @@ -51,8 +51,6 @@ setup_common() {
>  }
>  
>  setup_ipv4() {
> -	# IPv4 FOU (CONFIG_NET_FOU) is built in on kernels configured for
> -	# these tests, so no module load is needed here.
>  	ip -n "$NSENDER" addr add 10.0.0.1/24 dev veth_s
>  	ip -n "$NRECV" addr add 10.0.0.2/24 dev veth_r
>  
> @@ -160,8 +158,17 @@ run_ping_test() {
>  }
>  
>  setup_common
> -setup_ipv4
> -run_ping_test -4 eoudp4 "$TUN4_R" "FOU/GRETAP IPv4 multicast encap resubmit"
> +
> +# The fou module registers both the tunnel encap ops used by "encap fou"
> +# and the FOU genetlink family used by "ip fou add", and neither of them
> +# is auto-loaded. modprobe succeeds as a no-op when CONFIG_NET_FOU=y.
> +# Keep any other setup error as a test failure rather than a skip.

Drop this comment please, its obvious. Well, to people with basic
kernel familiarity it is.

> +if modprobe -q fou; then
> +	setup_ipv4
> +	run_ping_test -4 eoudp4 "$TUN4_R" "FOU/GRETAP IPv4 multicast encap resubmit"
> +else
> +	log_test_skip "FOU/GRETAP IPv4 multicast encap resubmit"
> +fi

Two very important questions you must answer before posting v2 or any
other similar fix:

Have you actually run into this or it's a result of an LLM scan?

How many of such fixes would we need to make all the net/ tests 
clean from similar issues?
