Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018417;
	b=pew8VonjhF9aqBnkNtSnsl+SxtaP3yfDMLhIWO0Cowqzm0Uh/QmhUCo4SB0tII2azhIi
	 PJBduGSqtZjZidh2UF6+9DL6andObFl/EUlf3DMp5aQfESWzvDT+ej9x++1HlyPl+y67n
	 +ZBQlNnAGKmRh32qexpWfOCds9BLfyw8Gn8i2rQjmPFw8HVMfYL13fb2lz8Vq3qzuEfGF
	 NmQWJqbWFdsRZXSdBSEO5nY15LeNf/kyXPEIT3NQAy6SRYDLQzktGUvI6rvNYQZJtKg7T
	 59LhWFnRL4oYg5Mkl9L+TfpaHJ0nYVAPdaLTiD7n1Dxz4GOgV1GdY0/qy0ZCjcWu7rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018417;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=0FM4FQIqQtreZz9AMQxrrTMs14QrvVaeC8B90V412GA=;
	b=YmVqyBcppXPgAuqkqIp/j6PTUHo3xvfjRVZOKtUpPnzI0gwZnOVTJVHvKDWmL+czlG1Q
	 ZUjVGBQ0n5gAh3f7jzbt46iD/HJqdP4nujeVfMQvMazYw596gqoKoy+BiaJWELFSa/K5z
	 VpsKqWTj2uUJdQmk1U90cq2ldZEGBbmSYqzFHoGfKB2Vv1w5a7EE30jSH2+kDQQLWfZEq
	 OKxJYTi1FElhQkDrkT2vKa271dNM0MHcUV7yPbR3U13YQEK7qof3OJeU5We6WAYa9nBOi
	 xAso0+zr1LnLITRGpjxRmsQ4E40+svDXr/d3loxnTQ/lBWenuxRVbqy8i868mMeWkgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=aJFjctBm;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328FA606A331
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 16:13:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 328FA606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=aJFjctBm
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-862b3938d98so583407a34.3
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 08:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1795018415; x=1795623215; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0FM4FQIqQtreZz9AMQxrrTMs14QrvVaeC8B90V412GA=;
        b=aJFjctBmNOdAbnnUsAixe5ZWeGLsRzqrg5gmvs857dlS7eolt5uI2uCMueOecgSXFc
         UYcuK5utz3v+GnQKgRjfats8gyuVklykTU1i7OkVQ9Z6y2/uh9X2ZqrbsTmNTyWl9Boh
         i8xqr/C3fJfjRjtOdfzp1XloKPoRcSiKV7fLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795018415; x=1795623215;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0FM4FQIqQtreZz9AMQxrrTMs14QrvVaeC8B90V412GA=;
        b=Pn7ylMxuka5AXCQzIKQp+BDCeJEmteEZirFyUW3NHCEKWH9w5AiAwv9YjNlnURW2Ok
         mp5mcGVd1A22/ib9Y0o0/096VLtZf1x2IBCuIp/7rSmRzu4JYA30q0ukRDlQY53mtyHW
         oXigrVdGJx1LlGJ415SKgx4gq24naWDLoNsLM26aKYRgUTtsNtWZ1wkyMfpBTM9ylUop
         BVV0Om/63fIWclu9GpHryXuVkKahi+nKjIAkHxBd1xS+3w0+mpLeLjlPlMIyUZtHDJak
         EH1vHN9Zj2OwMkh72t0yaexDXDt4u8x+qyAfT4FeZsWOU8yRn62ojYY/8y1wb0VyQN7F
         kvRw==
X-Gm-Message-State: APuU4Z+ZZ+kvmtFXfEFeCFZfrBr7gviT4cKwBqguxZfPsmz10AV0zN8F
	nEJ6FFFgiujJncemXZ6LkMZ0Un9qjR8JiVjQ5TlsyOk+A+bWukWi1FodOTCZwvMFABQ=
X-Gm-Gg: AYBFou2j/ZSq6jN/roI54RxC7Z5NXyRBOeXzJ2XP4sQJ3kP6FPpRzWSidBGr7M5RtH5
	NlpKRWCbGKLvH30Yxy95dVflSM+TTYAAeQckrFfjFvfqHHEtzJ6UVqS8GLOTHXRbUvcOfi+OqWz
	mn9+xhtQj9CVYNkTa/hbbjQj9N4ykBnq7v2ByZs2JGyO3i9oUEHNejoxEZe8zAZvyJ6Ei1ghO1o
	6Kwv4GE/Wr3UvqJRZssrhps/2bjbzQYBsIjd5wIUvW8BusVjaiXXPwFJ+TNo93lnepjkijZspD1
	85BwNr4nAvbO5RAPsh2LeJS+M5P54ATD5iQXFDutrfddJSHWlVcboaeK5sVKMQP+OP/1g+XjQfz
	gOKySdk1+VwN8JA1my8m2nDmylVByvqqaBINZgOGyZoB8CDMmZCu2USfRtVGO+1TZdgoXHwabeu
	JpslzZ6/6gUETDLxPAFHHlbHbylaIH6j5OEAIq+6gRmRU2j1z3elJeVHjDEHsMG+XskRKJbloTe
	HROqp2X+C4CgHpIchbG2kRte7MuKQYW0pbtAOqeBqlrC3WjayrP75M3v1NgQ3PZNG7lOey05HQc
	SFl4im5l9qI2BVzMcelb/7GjUqMjRIImGGLCIZfN
X-Received: by 2002:a05:6830:4420:b0:862:a48e:24e2 with SMTP id 46e09a7af769-862f0954f8bmr3199401a34.16.1795018415078;
        Wed, 18 Nov 2026 08:13:35 -0800 (PST)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862f00891e6sm2271527a34.0.2026.11.18.08.13.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 08:13:34 -0800 (PST)
Message-ID: <8a436334-d306-4a34-bb7b-efc713aed0f8@linuxfoundation.org>
Date: Wed, 18 Nov 2026 09:13:30 -0700
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
Subject: Re: [PATCH 1/3] selftests: use local variables consistently in
 runner.sh
To: "Jori Koolstra (CIQ)" <jkoolstra@xs4all.nl>, Shuah Khan
 <shuah@kernel.org>, David Ahern <dsahern@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Hangbin Liu
 <hangbin.liu@linux.dev>, =?UTF-8?Q?Ricardo_B=2E_Marli=C3=A8re?=
 <ricardo@marliere.net>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261118-kselftest-run-timer-v1-0-53a838b2d62b@xs4all.nl>
 <20261118-kselftest-run-timer-v1-1-53a838b2d62b@xs4all.nl>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261118-kselftest-run-timer-v1-1-53a838b2d62b@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/26 06:40, Jori Koolstra (CIQ) wrote:
> run_one() and run_many() assign their working variables without
> declaring them local, so they leak into the global namespace of
> whichever shell sources runner.sh, i.e. run_kselftest.sh or the
> RUN_TESTS recipe in lib.mk.
> 

Hmm. so if a timeout value of say 60 seconds comes from a test
settings file, does it persist? Can you see that if you run a
few tests using TARGETS variable?

> Declare these variables local so that local is used consistently
> throughout the file and the sourcing shell's namespace is not polluted.
> This does not add a new requirement on the shell: local is already used
> in run_many(), in_netns() and run_in_netns().

Makes sense.

> 
> Also, obey the convention to use upper case names for variables that are
> constant once assigned.

Can you elaborate on this convention?

I don't want to see these changes combined. We don't combine
cleanup and convention changes with real changes.

> 
> Signed-off-by: Jori Koolstra (CIQ) <jkoolstra@xs4all.nl>
> ---
>   tools/testing/selftests/kselftest/runner.sh | 29 ++++++++++++++++++-----------
>   1 file changed, 18 insertions(+), 11 deletions(-)
> 
> diff --git a/tools/testing/selftests/kselftest/runner.sh b/tools/testing/selftests/kselftest/runner.sh
> index 45fb8ec38493..9b1dad5441ea 100644
> --- a/tools/testing/selftests/kselftest/runner.sh
> +++ b/tools/testing/selftests/kselftest/runner.sh
> @@ -58,13 +58,18 @@ tap_timeout()
>   
>   run_one()
>   {
> +	local DIR TEST BASENAME_TEST BASENAME_SANITIZED SETTINGS TEST_HDR_MSG
> +	local line field value interpreter stdbuf cmd rc
> +
>   	DIR="$1"
>   	TEST="$2"
>   
>   	BASENAME_TEST=$(basename $TEST)
>   
>   	# Reset any "settings"-file variables.
> -	export kselftest_timeout="$kselftest_default_timeout"
> +	local kselftest_timeout="$kselftest_default_timeout"
> +	# Make kselftest_timeout variables available to tests
> +	export kselftest_timeout
>   
>   	# Safe default if tr not available
>   	kselftest_cmd_args_ref="KSELFTEST_ARGS"
> @@ -91,8 +96,8 @@ run_one()
>   	fi
>   
>   	# Load per-test-directory kselftest "settings" file.
> -	settings="$BASE_DIR/$DIR/settings"
> -	if [ -r "$settings" ] ; then
> +	SETTINGS="$BASE_DIR/$DIR/settings"
> +	if [ -r "$SETTINGS" ] ; then
>   		while read line ; do
>   			# Skip comments.
>   			if echo "$line" | grep -q '^#'; then
> @@ -100,8 +105,8 @@ run_one()
>   			fi
>   			field=$(echo "$line" | cut -d= -f1)
>   			value=$(echo "$line" | cut -d= -f2-)
> -			eval "kselftest_$field"="$value"
> -		done < "$settings"
> +			eval "local kselftest_$field"="$value"
> +		done < "$SETTINGS"
>   	fi
>   
>   	# Command line timeout overrides the settings file
> @@ -164,8 +169,8 @@ run_one()
>   
>   in_netns()
>   {
> -	local name=$1
> -	ip netns exec $name bash <<-EOF
> +	local NAME=$1
> +	ip netns exec $NAME bash <<-EOF
>   		BASE_DIR=$BASE_DIR
>   		source $BASE_DIR/kselftest/runner.sh
>   		logfile=$logfile
> @@ -175,9 +180,9 @@ in_netns()
>   
>   run_in_netns()
>   {
> -	local tmplog="/tmp/$(mktemp -u ${BASENAME_TEST}-XXXXXX)"
> -	local netns=$(mktemp -u ${BASENAME_TEST}-XXXXXX)
> -	local rc
> +	local tmplog netns rc
> +	tmplog="/tmp/$(mktemp -u ${BASENAME_TEST}-XXXXXX)"
> +	netns=$(mktemp -u ${BASENAME_TEST}-XXXXXX)
>   
>   	ip netns add $netns
>   	if [ $? -ne 0 ]; then
> @@ -198,8 +203,10 @@ run_in_netns()
>   
>   run_many()
>   {
> +	local DIR TEST BASENAME_TEST
> +	local pids pid rc
> +
>   	DIR="${PWD#${BASE_DIR}/}"
> -	local rc
>   	pids=
>   
>   	for TEST in "$@"; do
> 

thanks,
-- Shuah
