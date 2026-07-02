Received: from mailtransmit04.runbox.com (mailtransmit04.runbox.com [185.226.149.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80743911C9;
	Thu,  2 Jul 2026 07:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.226.149.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782977451; cv=none; b=HfF1kNBU3fs/XsiUBPhKq34N5sjxd1uyKxVhFZyrvnQEZw6t4zzF1CwFxePSeGoLlvU62rp5pkBpdIMFJtQyQy7HuHFGiVReQncZPeRzyW0faSDCAvY0Pg5eEcWV16ox5zYMSQaTH7jvhNBNv5BCYSKM1Cx5kuia23jNECrBKEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782977451; c=relaxed/simple;
	bh=b5Yh/1B5RAfqkXa6kZW8y8XuCwb9JRcdG9Cc6vPOrcM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=IjIte09v4Rw+xtUdZ9rHnht7JCVRIjsMiYbLgBA0nHWfcGDAZBM4dmrc1a2R9Bx7guW9+NDHyGPZmIgWFKvxQ0ymiZhfaug836T4Xkd+rBzEfWiMMjHqjMQ+seGIXKzhdFfm2XvyZy0fDR79nmQwymv4MLqt5qKmJ15aHFkGXlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rbox.co; spf=pass smtp.mailfrom=rbox.co; dkim=pass (2048-bit key) header.d=rbox.co header.i=@rbox.co header.b=ZMG3bZi/; arc=none smtp.client-ip=185.226.149.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rbox.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rbox.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rbox.co header.i=@rbox.co header.b="ZMG3bZi/"
Received: from mailtransmit03.runbox ([10.9.9.163] helo=aibo.runbox.com)
	by mailtransmit04.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <mhal@rbox.co>)
	id 1wfBsc-008gfD-UQ; Thu, 02 Jul 2026 09:30:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rbox.co;
	s=selector2; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:
	Cc:To:Subject:From:MIME-Version:Date:Message-ID;
	bh=T0KU9Qlc02n2j5IdAO8aCi86nlSvwxBOmtJy+AvJI5s=; b=ZMG3bZi/7Dml2jz332+5aTfLBY
	U93C5alk3kpGZpnQ7/RMi63KycR4qg86NIQHlX2u+Gev2XzSSjw2IMS8XksWh7ytUpzPFKfeBgMKF
	J+Q9lPmBfakqsDbh527/hbJnUKa2epzoUCkiccyf7keUMXGuOCBc+5UWLaWaqIHE08XCTWHeSWYB7
	EdrhJgL4cGMkOOjDFjRjhP7wdgDQvCMnAE+EPTF3TCvhSlQJzh38cEd+6Cn1NLX65VdX6D/aqWrB3
	TCeo6PWIMwjUaHgmDYW8Kp8xGISIkthV21sGzw3HUASAikRIeGcjMI96E7UITaXvVHNbjFjUMbWuG
	pTFTaXZw==;
Received: from [10.9.9.72] (helo=submission01.runbox)
	by mailtransmit03.runbox with esmtp (Exim 4.86_2)
	(envelope-from <mhal@rbox.co>)
	id 1wfBsb-0006gp-S3; Thu, 02 Jul 2026 09:30:38 +0200
Received: by submission01.runbox with esmtpsa  [Authenticated ID (604044)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.95)
	id 1wfBsK-003HJw-OZ;
	Thu, 02 Jul 2026 09:30:20 +0200
Message-ID: <352c268e-508a-4155-b597-b0f172c0a1cf@rbox.co>
Date: Thu, 2 Jul 2026 09:30:19 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Michal Luczaj <mhal@rbox.co>
Subject: Re: [PATCH bpf v3 3/4] selftests/bpf: Adapt sockmap update error
 handling
To: bot+bpf-ci@kernel.org, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com,
 martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
 jolsa@kernel.org, emil@etsalapatis.com, shuah@kernel.org,
 john.fastabend@gmail.com, jakub@cloudflare.com, jiayuan.chen@linux.dev,
 edumazet@google.com, kuniyu@google.com, pabeni@redhat.com,
 willemb@google.com, davem@davemloft.net, kuba@kernel.org, horms@kernel.org,
 cong.wang@bytedance.com
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, martin.lau@kernel.org,
 clm@meta.com, ihor.solodrai@linux.dev
References: <20260702-sockmap-lookup-udp-leak-v3-3-ff8de8782468@rbox.co>
 <03d8ce102b71c68c30e98be36feaebe539055195c2323ec3b3fd84f157487afd@mail.kernel.org>
Content-Language: pl-PL, en-GB
In-Reply-To: <03d8ce102b71c68c30e98be36feaebe539055195c2323ec3b3fd84f157487afd@mail.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/2/26 02:00, bot+bpf-ci@kernel.org wrote:
>> @@ -93,8 +90,12 @@ static void test_insert_bound(struct test_sockmap_listen *skel __always_unused,
>>  	errno = 0;
>>  	value = s;
>>  	err = bpf_map_update_elem(mapfd, &key, &value, BPF_NOEXIST);
>> -	if (!err || errno != EOPNOTSUPP)
>> -		FAIL_ERRNO("map_update: expected EOPNOTSUPP");
>> +	if (sotype == SOCK_STREAM) {
>> +		ASSERT_ERR(err, "map_update");
>> +		ASSERT_EQ(errno, EOPNOTSUPP, "errno");
>> +	} else if (err) {
>> +		ASSERT_OK(err, "map_update");
>> +	}
> 
> This isn't a bug, but could the UDP branch just be `else ASSERT_OK(err,
> "map_update");` — the `if (err)` guard looks redundant since ASSERT_OK is
> a no-op on success?

Ugh, sorry. If there are no other comments for this series, I'd happy to
fix it later in bpf-next.
