Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.244
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794363773;
	b=D6iSixLbuajmUbnulgXwRsCNNTzp2MUr90uO6i8NHHuDjIXMqoEZflrGQJW1SqwEcD9L
	 NP9UY8B4z/n9eK9GqDIbMc1++kccY1h09eJptx9wA2UCq3aqgUMoZMVaOfS1Ckhlwlll2
	 DLGtv2Wj77MYMiaI8FyQiHg9H7kcKmSXKXmeVuUgPXQMScis1KjbI6abKMEwsik6aoz4P
	 fl8/bL/YVILegA6wF0/fTrjYlJzDtXm0U0xH/0I/F+hBWoPju/9qJxl6nhmPPY2kFKN1R
	 GmJLGkYBSWWeG7p9uoMmQ22RAHAIcOcjrCQ2z9fqpaRz13nl1TnA+AfqKRlC+oF4ZcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794363773;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=UWESZWo6gRDJLbe6b+kb8OCoSR2NRoF3AodRyX5rbn4=;
	b=QZc5g7L4wnMgf10RDdmCx3DSDfBC+qNgLkM095j6HAtIW2lUD0kRMcUfcx1ncR9kje0C
	 QUDYHu5ryx9N1lX9klSU2HBllUE6tyy88JihTGQCD+XHpUdZ9NvqDKkWGotqXTJ36EG6S
	 57JwDZ4MZ4sgTqrFu3sJR5GUhFZBUh5095glITai7dzVioZmsk6l7c2s7BulYqvDdAWtS
	 tZvzEKEbWNY5rSTjBtJu+i2PBQMw55kBOgU9Bk/sn1c7YieHDktWS8IQd6noozIb51YV6
	 MT38Rzwe/c2d4mlnCxBLaII4baLgR8DQ6L+S2Mn/FXk1gMCmtupD277lx2mQfNcXNnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=b9zIfTjL;
	arc=none smtp.remote-ip=91.218.175.244
Received: from mta0.migadu.com (out-244.mta0.migadu.com [91.218.175.244])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05852606A321
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 02:22:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05852606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=b9zIfTjL
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=37SDGn2nMjZ1Z7oz6sEfcaIMb9d+InDjeAh5oHf8swE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794363770; v=1; x=1794968570;
 b=b9zIfTjLmRwOvux3PXLjVurEN5l2T0Y9JK89N1JAoMnOI5cNwwjdKp30TlUYqQ/AogqAFJxk
 vUcFSf6CQ+MAde9KlACWnVB5XkX2kwjNCJa26X2e67n6pbbPVhJcjpbQaQhP/DsJLgAEs04PZIh
 PQPX/BoUm9zSrLOiTUlbVXzE=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 618b1c1bb1ebb779;
	Wed, 11 Nov 2026 02:22:50 +0000
X-Mizu-Trace-ID: 618b1c1bb1ebb779
X-Migadu-Flow: FLOW_OUT
Date: Wed, 11 Nov 2026 10:22:40 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Hannes Laimer <h.laimer@proxmox.com>
Cc: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, Petr Machata <petrm@nvidia.com>
Subject: Re: [PATCH net-next] selftests: forwarding: vxlan_reserved: drop
 redundant in_defer_scope
Message-ID: <avPRN_C333cX7HlI@fedora>
References: <20261110-vxlan-reserved-tests-v1-1-a252d69c841e@proxmox.com>
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
In-Reply-To: <20261110-vxlan-reserved-tests-v1-1-a252d69c841e@proxmox.com>

On Tue, Nov 10, 2026 at 03:03:55PM +0100, Hannes Laimer wrote:
> With commit a6e263f125cd ("selftests: net: lib: Introduce deferred
> commands") tests_run() already runs every test in its own defer scope.
> So the per-test in_defer_scope here does not do anything. Drop the
> in_defer_scope calls and the wrappers that only exist for that.
> 
> Suggested-by: Petr Machata <petrm@nvidia.com>
> Link: https://lore.kernel.org/all/875wyo6b7d.fsf@pmachata.org/

Nit:

Closes: https://lore.kernel.org/all/875wyo6b7d.fsf@pmachata.org/

> Signed-off-by: Hannes Laimer <h.laimer@proxmox.com>
> ---
>  .../selftests/net/forwarding/vxlan_reserved.sh     | 39 +++++-----------------
>  1 file changed, 8 insertions(+), 31 deletions(-)
> 
> diff --git a/tools/testing/selftests/net/forwarding/vxlan_reserved.sh b/tools/testing/selftests/net/forwarding/vxlan_reserved.sh
> index 0ce264cc57f8..a273e1fcd26c 100755
> --- a/tools/testing/selftests/net/forwarding/vxlan_reserved.sh
> +++ b/tools/testing/selftests/net/forwarding/vxlan_reserved.sh
> @@ -273,30 +273,18 @@ __default_test_do()
>  	log_test "$what: drops reported"
>  }
>  
> -default_test_do()
> +default_test()
>  {
>  	vxlan_device_add
>  	__default_test_do 0 "Default"
>  }
>  
> -default_test()
> -{
> -	in_defer_scope \
> -	    default_test_do
> -}
> -
> -plain_test_do()
> +plain_test()
>  {
>  	vxlan_device_add reserved_bits 0xf7ffffff000000ff
>  	__default_test_do 0 "reserved_bits 0xf7ffffff000000ff"
>  }
>  
> -plain_test()
> -{
> -	in_defer_scope \
> -	    plain_test_do
> -}
> -
>  reserved_test()
>  {
>  	local bit=$1; shift
> @@ -311,35 +299,30 @@ reserved_test()
>  
>  reserved_0_test()
>  {
> -	in_defer_scope \
> -	    reserved_test 0
> +	reserved_test 0
>  }
>  
>  reserved_10_test()
>  {
> -	in_defer_scope \
> -	    reserved_test 10
> +	reserved_test 10
>  }
>  
>  reserved_31_test()
>  {
> -	in_defer_scope \
> -	    reserved_test 31
> +	reserved_test 31
>  }
>  
>  reserved_56_test()
>  {
> -	in_defer_scope \
> -	    reserved_test 56
> +	reserved_test 56
>  }
>  
>  reserved_63_test()
>  {
> -	in_defer_scope \
> -	    reserved_test 63
> +	reserved_test 63
>  }
>  
> -gbp_changelink_test_do()
> +gbp_changelink_test()
>  {
>  	vxlan_device_add gbp
>  	__default_test_do 25 "gbp"
> @@ -347,12 +330,6 @@ gbp_changelink_test_do()
>  	__default_test_do 25 "gbp after changelink"
>  }
>  
> -gbp_changelink_test()
> -{
> -	in_defer_scope \
> -	    gbp_changelink_test_do
> -}
> -
>  trap cleanup EXIT
>  
>  setup_prepare
> 
> ---
> base-commit: 6db9448a443afde26231aaed7b112ed17b33f468
> change-id: 20261026-vxlan-reserved-tests-f2ceea83bb0c
> 
> Best regards,
> --  
> Hannes Laimer <h.laimer@proxmox.com>
> 
> 

Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
