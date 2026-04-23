Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2330229BDB4;
	Thu, 23 Apr 2026 13:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776951529; cv=none; b=DxITEU0gIPLFlsreG597iuD2GzSQ3vaHk1jOp60Sn86PJfuYiZPz8vBSNhFsnRWhfeHD3EDVb0eyCfMeMSgY8oOaxTvXPXxqKn1S/luHhLfTsyrqwiFqOjgKbeWKredCpB2XCMi3adtIb2Evjm8H+jPDam6+OtoGupaC5+fH23g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776951529; c=relaxed/simple;
	bh=ICwDzIGe32smAh50GrVCkO16wFKiYn6OJO/XJNoFuLU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B+ToIUU8zFDH8PeH0cz/P3PX5XBczWTEKc5dt7oFbiWFdC32+hJjmhqBiwy0L+rzzLeSjkVsJ4Fx6tdetlxJTR3m3CajqG7wtERRvGOxnWezf2yUHw+qqRSPKaJO4DC+Pa7y1BkBr8f3pNgicoVyg7vmSCUSDQ0JvP19IAL2Tq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U9a5z/Cr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U9a5z/Cr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03606C2BCAF;
	Thu, 23 Apr 2026 13:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776951528;
	bh=ICwDzIGe32smAh50GrVCkO16wFKiYn6OJO/XJNoFuLU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=U9a5z/CraOHCdM4FWmGM8ORuy+wLAleTeIvQhY7DUJT4OKeogxfHQhJO/l0ObJhhh
	 sqfOqvM1ovEJ5hwPyGtzd9/1vlfiu0XZYYlV8VDZjC8ZxJ+dcoHEO66GS6o4qhGXjJ
	 gUfiYn38bQyRHBSQ4RdDuiCwl56U3UzzmsBK/LEmExExgq5qt4P2iXI0h9aCU33ys8
	 nSmoiK9I03l9Cl8G51/yHgWxltwfjGGC4X2Hx1AJsisg2eHKPV+OSUfzO9hCiOSFl+
	 3K9BnJ9Im1HXNbEh9jvsLZ8CEq8AAEk4gp8o7K0rgKWWYqcz1e00unSdU4t3T2PaSJ
	 iE1/Bzi236D6w==
Message-ID: <963b4f8e-b1cb-4e80-b14f-04a43fa15e9b@kernel.org>
Date: Thu, 23 Apr 2026 15:38:42 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] selftests/mm: respect build verbosity settings for
 32/64-bit targets
To: Li Wang <wangli.ahau@gmail.com>, akpm@linux-foundation.org,
 ljs@kernel.org, Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, shuah@kernel.org
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260422080446.26020-1-wangli.ahau@gmail.com>
 <20260422080446.26020-2-wangli.ahau@gmail.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260422080446.26020-2-wangli.ahau@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/22/26 10:04, Li Wang wrote:
> The 32-bit and 64-bit compilation rules invoke $(CC) directly, bypassing
> the $(Q) quiet prefix and $(call msg,...) helper used by the rest of the
> selftests build system. This causes these rules to always print the full
> compiler command line, even when V=0 (the default).
> 
> Wrap the commands with $(Q) and $(call msg,CC,,$@) to match the
> convention used by lib.mk, so that quiet and verbose builds behave
> consistently across all targets.
> 
> ==== Build logs ====
>   ...
>   CC       merge
>   CC       rmap
>   CC       soft-dirty
>   gcc -Wall -O2 -I /usr/src/25/tools/testing/selftests/../../..
>                 -isystem /usr/src/25/tools/testing/selftests/../../../usr/include
>                 -isystem /usr/src/25/tools/testing/selftests/../../../tools/include/uapi
>                 -Wunreachable-code -U_FORTIFY_SOURCE -no-pie -D_GNU_SOURCE=
>                 -I/usr/src/25/tools/testing/selftests/../../../tools/testing/selftests
>                 -m32 -mxsave  protection_keys.c vm_util.c thp_settings.c pkey_util.c
>                 -lrt -lpthread -lm -lrt -ldl -lm
>                 -o /usr/src/25/tools/testing/selftests/mm/protection_keys_32
>   gcc -Wall -O2 -I /usr/src/25/tools/testing/selftests/../../..
>                 -isystem /usr/src/25/tools/testing/selftests/../../../usr/include
>                 -isystem /usr/src/25/tools/testing/selftests/../../../tools/include/uapi
>                 -Wunreachable-code -U_FORTIFY_SOURCE -no-pie -D_GNU_SOURCE=
>                 -I/usr/src/25/tools/testing/selftests/../../../tools/testing/selftests
>                 -m32 -mxsave  pkey_sighandler_tests.c vm_util.c thp_settings.c pkey_util.c
>                 -lrt -lpthread -lm -lrt -ldl -lm
>                 -o /usr/src/25/tools/testing/selftests/mm/pkey_sighandler_tests_32
>   ...
> 
> Reported-by: Andrew Morton <akpm@linux-foundation.org>
> Signed-off-by: Li Wang <wangli.ahau@gmail.com>
> Tested-by: Andrew Morton <akpm@linux-foundation.org>
> ---

Great

Tested-by: David Hildenbrand (Arm) <david@kernel.org>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>

-- 
Cheers,

David
