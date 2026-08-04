Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29C236DA04;
	Tue,  4 Aug 2026 12:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785846101; cv=none; b=L86s2iDk8BCPTHdFj/zVNUijxGCogJJ/wiTfvbyC2lYTbUGw+QwzXUW/bIK/RBc2VmT7zNpbFZzm3P9Wh0Gb80NYY1Wb4ZZGeGwLXTtt9dB7Lr4UGbrLUlzcPwSNTh0vOCzDg8drIb4NYmorLgm1bf0TEsG2vrbfaLTmFiU3Zls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785846101; c=relaxed/simple;
	bh=dav1cKJYmgkcBUXqxYxLz3xdf9mFY+ehkQ0W3FkJBdw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CE8P+bBYW+Y4dXkZVruncQPpK3PkD/5eG7r6vpyucNCt8/LdjnMIVoN1g0+TH0J2vDsgDBLLeopN/ih7lCstnpY+bnULA3WfHEDHdIygAM7rGBgoPbbQdaFGuMfi5nQiZxpzFHVMm59jlA2cxgZZTw2DQekfQ5T6IQyhxe5R/2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NktLoOFf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NktLoOFf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E02071F00A3A;
	Tue,  4 Aug 2026 12:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785846100;
	bh=efM8AzxF8bqG1DJUbVqdvBnISyKCHBsMBtlf3nlIbeI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=NktLoOFfZHRqade73gsXm7Fzc5b4FzLM4PGUbDUVlnpQDQaw8N/f5k913OBECAMbI
	 +HrQpHcH7kDUKErVLUGaVf8BOsenwxAhTCnJ80Zi5Y7vJ6KHLTaXYeUYtg7wj5C5QO
	 GCXA1aFt9zsiU7VML2j8AYS+RfVV1MGt1/1WdSDJlK4LpEcPWMi/wERqDgID67QlVy
	 L8Hfby7sAl47LHuEj/hmDV/a7JU6j+aAxepgJJyJy5TTrSIGSke3tTYNcRIXOLYAnJ
	 gL/KHnJ1olazm74vu3gaqMYB77bCAyXV3Ykv8NmW1cOye60bJmQTydS7rzQmMC6BYV
	 s/W9MW/K/Rx1A==
Message-ID: <6193876b-adcf-4cc5-9101-67454a359053@kernel.org>
Date: Tue, 4 Aug 2026 14:21:36 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] selftests/mm: read memory information without popen
To: Warren Xiong <warren.xiong@ugreen.com>, akpm@linux-foundation.org,
 shuah@kernel.org
Cc: ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1785720615-5826-1-git-send-email-warren.xiong@ugreen.com>
 <1785845818-3131-1-git-send-email-warren.xiong@ugreen.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <1785845818-3131-1-git-send-email-warren.xiong@ugreen.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/4/26 14:16, Warren Xiong wrote:
> read_memory_info() invokes two shell pipelines to obtain MemFree and
> Hugepagesize from /proc/meminfo. It does not check whether popen()
> returns NULL before passing the result to fgets(), and it does not call
> pclose() when fgets() fails.
> 
> Open /proc/meminfo directly and obtain both values in a single pass.
> This removes the unchecked NULL path, closes the file on all paths, and
> avoids dependencies on external commands.
> 
> The compaction test continues to pass after this change.
> 
> Signed-off-by: Warren Xiong <warren.xiong@ugreen.com>
> ---
> Changes in v2:
> - Replace the two boolean flags with a hit counter, as suggested by
>   David Hildenbrand.
> 
> v1: https://lore.kernel.org/1785720615-5826-1-git-send-email-warren.xiong@ugreen.com/
> 
>  tools/testing/selftests/mm/compaction_test.c | 38 +++++++++++++++-------------
>  1 file changed, 21 insertions(+), 17 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/compaction_test.c b/tools/testing/selftests/mm/compaction_test.c
> index 5b58258..30d4ace 100644
> --- a/tools/testing/selftests/mm/compaction_test.c
> +++ b/tools/testing/selftests/mm/compaction_test.c
> @@ -29,30 +29,34 @@ struct map_list {
>  
>  int read_memory_info(unsigned long *memfree, unsigned long *hugepagesize)
>  {
> -	char  buffer[256] = {0};
> -	char *cmd = "cat /proc/meminfo | grep -i memfree | grep -o '[0-9]*'";
> -	FILE *cmdfile = popen(cmd, "r");
> +	char buffer[256];
> +	int found = 0;
> +	FILE *file;
> +	int ret = -1;
>  
> -	if (!(fgets(buffer, sizeof(buffer), cmdfile))) {
> -		ksft_print_msg("Failed to read meminfo: %s\n", strerror(errno));
> +	file = fopen("/proc/meminfo", "r");
> +	if (!file) {
> +		ksft_print_msg("Failed to open /proc/meminfo: %s\n",
> +			       strerror(errno));
>  		return -1;
>  	}
>  
> -	pclose(cmdfile);
> -
> -	*memfree = atoll(buffer);
> -	cmd = "cat /proc/meminfo | grep -i hugepagesize | grep -o '[0-9]*'";
> -	cmdfile = popen(cmd, "r");
> -
> -	if (!(fgets(buffer, sizeof(buffer), cmdfile))) {
> -		ksft_print_msg("Failed to read meminfo: %s\n", strerror(errno));
> -		return -1;
> +	while (fgets(buffer, sizeof(buffer), file) && found != 2) {
> +		if (sscanf(buffer, "MemFree: %lu kB", memfree) == 1 ||
> +		    sscanf(buffer, "Hugepagesize: %lu kB", hugepagesize) == 1)
> +			found++;

Just as information: when proposing that I was assuming that we would never ever
have two times the same entry in /proc/meminfo, which i think we can reasonably
assume.

Thanks!

Acked-by: David Hildenbrand (Arm) <david@kernel.org>

-- 
Cheers,

David
