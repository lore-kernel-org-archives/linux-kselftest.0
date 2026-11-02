Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633715;
	b=cgMMilptDd993yt7v3fc/ubZHcqzsuOdr2EQEecatfSMHBIBMgZzsvwsvOTUsRQoeSN2
	 li0rncwK24YDUg6NfqRwrrxn66yn/MU6bRRb97N39qohGmBmT91KGR7gqUIxeOmZe85Nq
	 ClFmurwmjMFBQgEChHkFvnIRHlj0rkMpljINRQjuTpsP81i1gTyXhCemRLmp6BkO2KsOt
	 1FhvFV1NmixGpxQRBhZ8Z8HUcOKY0e+iKkV/3Q8iXPgVWRR/ldKYRSTZA4jhu4cmFyRgU
	 6qV24H/VVN7PqwUtv8bWtgw48+Qqohq15I2lnzCui8mMsjCikiCA+paVC00COAIL+XQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633715;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=CSiCxUqhbAqe66y/0HULgn+K+b0JD3EtNzUt5xk4rYo=;
	b=WVEYdb7bV+7cc+zoHGkyPrjITsksoK5vBuKkrF769G2MsXPBSwUSPQhZZiyKNe5clUS8
	 hDaQPkEFK2rT7ge9OYeV4m3CB2efwIUL+JPBZ4FQ7AKWUnKmeDmjrIXpFTlrj+7ULayPr
	 MopCKjSe7tKFmBAw6i2hxIdHLPy49Kp+6z2QoWD8aPqw3Zc8nxd/CuNpayLw3SO+3S6y0
	 X/kn35CaYN/W50luF/9FUVO5WUPzgAyAvSx2yqMIYBgOmwEwR0A+9u5TU1Tv4+ABspvNm
	 O49Jg17YKu8UwIpywEF+TSmT7wur/t0wgVmeAALkLzP428C97fMvNmzfUzeme8tE9/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=B9TgqN2d;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="OFDQ7/MK";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B3F60DE9B3
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 15:35:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71B3F60DE9B3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=B9TgqN2d;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=OFDQ7/MK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793633713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CSiCxUqhbAqe66y/0HULgn+K+b0JD3EtNzUt5xk4rYo=;
	b=B9TgqN2dcCe4omKVVINnJTZ226m6ahHzYwURpqyodb5XkcmptSVGjtfEUUEP2zkrty6nrf
	mTrMX2lKwhSUtg+NRweDjRsP4fOnQARau1EmoJOuauuQGOVCuyEJMCgIDb8YQ6aS+PfF79
	XhbJxaB1SZvkyJcXezqAsMSiw4W6DTg=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-33-cC7VxIKaMfyfvKedccyRKQ-1; Mon, 02 Nov 2026 10:35:12 -0500
X-MC-Unique: cC7VxIKaMfyfvKedccyRKQ-1
X-Mimecast-MFC-AGG-ID: cC7VxIKaMfyfvKedccyRKQ_1793633711
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e869e00005so49810055ad.2
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 07:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793633711; x=1794238511; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CSiCxUqhbAqe66y/0HULgn+K+b0JD3EtNzUt5xk4rYo=;
        b=OFDQ7/MKyG/zh3PU913rwPGjZ43SujDmHTUJfuj6ILBub4bPeLb5W+ZlSILpfz3dhu
         Jp4IPLRBgURoUdzbSSs2jHECbXQ13TxYS7hRfXvdknAOUa5/jhsIcWaXFUsbfWRiWmkR
         18ngU3cF5p28y27Cf211gJJ3zCpScmtU5dhn5O4mKprOPXwCZ5H647QPfq7dKKGEJO05
         /gmp9zv+WAKr0v6KqdDqWC5UObACLTxNK6F0mUeHUUzPD6ED+HjfTgxQLqJPxT9C29d4
         BqLPDKYkFw8VkCi2UP12xwPOezQXxkEv7BybmYTwpIsZeNUqb8ibaR51CCzmaiwc1sPE
         G9lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793633711; x=1794238511;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CSiCxUqhbAqe66y/0HULgn+K+b0JD3EtNzUt5xk4rYo=;
        b=BDJgiooYSiVdlm0o8e57g0AAKxKL+/hAf+olzcSqO14FaPAHxg7CKbhz3NwNGA0X6b
         yExuv+eFSi6YYDMAelf5IuhBW+FA22BT+ifmeeqHHweQXiEGSSQ/P4q0IUHLAfjmYOrs
         3KywPA4GNRH+Pl83cyKAT2mUHkxjV8bJNKVwWCT4hCuZu8AcJgz0MrnL5tDCynOt1FbL
         MeQTCe+HrFW9VKv8rSxNJk9mcHwAHD4vMaUd3pFKJAo6aKZhlqW0wB49TlLDyMLVpe75
         /yA0wjdz6Wx/SyWKt1xFgbPKD7dsXjzUwn4dfqS/uqbWGV+QAmmX8fd4XWzE0OEOIGvd
         cBRQ==
X-Forwarded-Encrypted: i=1; AKwUvByvqI0vVJICl+EEOk1X3ccaptkGx7h2hXIPN2E88WLy+PlND52SdvBaucb1BxJ9qQBjOy+5/OrLib180wIeXXE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZKEnGMsSDHfhXx5zjP5v5OmX5CIHiukAY/nMEF4DauV5hvxCZ
	Wj/3gvxXz3r8qNyoSKgYfjmGs4XaXdOMmc58peZb3N/YSHTnRMYx4DHiFwkXsXaCHHkd8KEvHwj
	TODGgmDKjELfrQdn7iCQZuqZRyul7KjnsrXm4Pw1OXCsAECSZgFwvhXJQeCO/zNbf3jXpOaMBtq
	A5uQ==
X-Gm-Gg: AYBFou2aRIRinupsHe+DykbyIYu1lSVkPjjiEUdC/fBLBjyet2NcqBG3p/2PSIzHzoB
	n75dP1vkepxTje7HB5sgW0gpDiyeNuV8A8Vwh/MZWXBdZlDNh4oAgr3n5aBwKbmt05xLqtmSPnA
	ZDU2NXKWlhQEhD8e0LtFQTG1V4CkgWkW2wpFgzsJrq3QONdmoySX9s0s1X+A7SvxuOagn8NZV5u
	8SvHPAJnepi9/ictHEbZRr5EfyvhFxFfFQk1UjQ5ust/4nM7k3KR4ZGLbzywfhvB5jWeprB1VbH
	mu2H2b/x1jEBD/EI0ABMNQiy8JMZHTip8wsD5wbqubYWVRRau/4AwEPDRKdQbeQFxTk4mVKZ8A0
	a4xIQV+UhFx1zUr/TMgDNppltX4XpD3YBFtVramUYG7/PbcZn5mdiA7DmYLtVzm2czXx4JKTrDa
	ZOB2Y8bqW939Dx1vtc/6vrWGtZ9C5c08NZ82CnvUf64s0=
X-Received: by 2002:a17:90b:2691:b0:3ac:aa8d:19f2 with SMTP id 98e67ed59e1d1-3ae8985390bmr7983253a91.62.1793633710864;
        Mon, 02 Nov 2026 07:35:10 -0800 (PST)
X-Received: by 2002:a17:90b:2691:b0:3ac:aa8d:19f2 with SMTP id 98e67ed59e1d1-3ae8985390bmr7983225a91.62.1793633710362;
        Mon, 02 Nov 2026 07:35:10 -0800 (PST)
Received: from ?IPV6:2401:4900:1cc4:ec63:d913:9793:cfad:cfb8? ([2401:4900:1cc4:ec63:d913:9793:cfad:cfb8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e949077sm19269008a91.9.2026.11.02.07.35.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 07:35:09 -0800 (PST)
Message-ID: <4c36ffdc-ec1e-4247-9b34-bf7caafd46c7@redhat.com>
Date: Mon, 2 Nov 2026 21:05:03 +0530
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/liveupdate: Preserve VM workspaces with
 run-vmtests.sh -k
To: George Guo <dongtai.guo@linux.dev>, pasha.tatashin@soleen.com,
 rppt@kernel.org, pratyush@kernel.org, shuah@kernel.org
Cc: guodongtai@kylinos.cn, kexec@lists.infradead.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261029090542.13283-1-dongtai.guo@linux.dev>
Content-Language: en-US
From: Mukesh Pilaniya <mpilaniy@redhat.com>
In-Reply-To: <20261029090542.13283-1-dongtai.guo@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi George,

On 29/10/26 2:35 pm, George Guo wrote:
> From: George Guo <guodongtai@kylinos.cn>
> 
> run-vmtests.sh -k keeps the test output logs, but vmtest.sh still
> removes its workspace and qemu.serial, losing the guest output needed
> to debug failures.
> 
> Forward -k to vmtest.sh when keeping logs and update the help texts to
> match.
> 
> Signed-off-by: George Guo <guodongtai@kylinos.cn>
Please feel free to use Reviewed-by: Mukesh Pilaniya
<mpilaniy@redhat.com> for this patch.

> ---
>  tools/testing/selftests/liveupdate/run-vmtests.sh | 7 +++++--
>  tools/testing/selftests/liveupdate/vmtest.sh      | 2 +-
>  2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/testing/selftests/liveupdate/run-vmtests.sh b/tools/testing/selftests/liveupdate/run-vmtests.sh
> index d656ce58c5a7..6f592aec0f85 100755
> --- a/tools/testing/selftests/liveupdate/run-vmtests.sh
> +++ b/tools/testing/selftests/liveupdate/run-vmtests.sh
> @@ -26,7 +26,7 @@ function usage() {
>  	cat <<EOF
>  $0 [-k] [-o output_dir] [-h]
>  Options:
> -	-k)	keep logs
> +	-k)	keep logs and VM workspaces, including guest serial logs
>  	-o)	specify output directory
>  	-h)	display this help
>  EOF
> @@ -48,6 +48,8 @@ function fail() {
>  }
>  
>  function main() {
> +	local -a vmtest_args=()
> +
>  	while getopts 'hko:' opt; do
>  		case $opt in
>  		k) keep_logs=1 ;;
> @@ -59,6 +61,7 @@ function main() {
>  	done
>  
>  	if [ -n "$keep_logs" ]; then
> +		vmtest_args+=(-k)
>  		if [ -z "$output_dir" ]; then
>  			output_dir="$SCRIPT_DIR/results_$(date +%Y%m%d_%H%M%S)"
>  		fi;
> @@ -74,7 +77,7 @@ function main() {
>  
>  			printf "  -> %-8s %-24s ... " "$arch" "$test_name"
>  
> -			"$TEST_RUNNER" -t "$arch" -T "$test_name" &> "$log"
> +			"$TEST_RUNNER" "${vmtest_args[@]}" -t "$arch" -T "$test_name" &> "$log"
>  			exit_code=$?
>  
>  			case $exit_code in
> diff --git a/tools/testing/selftests/liveupdate/vmtest.sh b/tools/testing/selftests/liveupdate/vmtest.sh
> index 69beda6c961d..bd7032c4b122 100755
> --- a/tools/testing/selftests/liveupdate/vmtest.sh
> +++ b/tools/testing/selftests/liveupdate/vmtest.sh
> @@ -40,7 +40,7 @@ Options:
>  	-t)	run test for target_arch (aarch64, x86_64)
>  	-T)	test name to run (default: luo_kexec_simple)
>  	-w)	custom workspace directory (default: creates temp dir)
> -	-k)	keep workspace directory after successful test
> +	-k)	keep workspace directory
>  	-h)	display this help
>  EOF
>  }
> 
> base-commit: 9a6a70aefe77f6fb9ff2b3037dcf87f6dff65c8c

-- 
Regards,
Mukesh Pilaniya

