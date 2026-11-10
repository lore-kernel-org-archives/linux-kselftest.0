Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.241
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794312792;
	b=0fzamPfCnTtGrLz8JJErAGBQVNGAP8ihwqmGNM7r+GKWkYTEoMxK1v6hKAgK0tiX3w8d
	 qoNebhscfJK1id1xyd9VkYyRDLiVZN9z8nAMs3ejAQxSk8N8k3uUUm0v0dx5+7fNLyekA
	 Uspbj8Rp8KhGPrOFWoC2/0FXGQkfySFXPfj0MndmJmAvIffrUNTS3Db0YLO0452k5oEhO
	 OI3+lGpwr0nqm0x91HqhZGmYkJFbGTA8sKA6z0jvK2KjPM+YAag5aD59zXpMr6ZL7myJc
	 ViPirOs1DY9+8h2PlClkbuEoTr4L7yz2oIYCRy1Z6dETHlnaLRxoeP93gjAssr91hTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794312792;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=xPX6hjL/tuWyjzxA9vDr0JWxUdbpBrR5M1slKp3h4n4=;
	b=gFDz3dKIYkYuj7iKr0PVEqm4/Tk98+L60Wrs2zCcy0H7chOsVZTTsDD1G4zc9m63dvF0
	 duYvfurElRC9iN36+sZfICDA+OPaimG2LCOCp6GY4lv2dWeHGx74i9M3XySNQA1cqLis5
	 IsamFpfVEIkJV5t7dpQWozuLwh+ITPWlHLqMXaun897TVJRlD6bEUV9jC5sA73yoXaEq2
	 qKua1mj5U57PfhsBt+Ta9UpD+GgzueaORODw+zc2Rk6D7LujlIXpF/vbfeSQu+ugo3m1h
	 LPHm7ahaYWxIB0ifp8HIAspisOjNmWBdJtgnilwdPonwMQ5Ia1G4BIQ7UcubTs8k/Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=vTf1Iu9k;
	arc=none smtp.remote-ip=95.215.58.241
Received: from mta1.migadu.com (out-241.mta1.migadu.com [95.215.58.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0926606A331
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 12:13:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0926606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=vTf1Iu9k
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=G3nVUeH7hHipeIyGXvKuinPceTq9Y7FI9VYOHlt8gGM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794312790; v=1; x=1794917590;
 b=vTf1Iu9kTKIAJAcKbYl4y3J6wx57TpQxO4gCGgO8QSPYOVXDSHesXc6dbVMQ9rSCdMxs7UfU
 yiqOzKTWD/LocnNMZms9zAzROyzXHKsJXE+Ojvl8D8Ak7Z3mBa8okA7pcUQJJbIWro+Ti345kNb
 HBjGXwFYu50a8CON1McVyhPk=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2915aee026b5dd3d;
	Tue, 10 Nov 2026 12:13:09 +0000
X-Mizu-Trace-ID: 2915aee026b5dd3d
X-Migadu-Flow: FLOW_OUT
Message-ID: <0c302879-0d06-4c90-970d-6c9b40946f0f@linux.dev>
Date: Tue, 10 Nov 2026 20:13:03 +0800
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
Subject: Re: [PATCH v3 1/3] cgroup/cpuset: Reject updates that empty the top
 sched domain
To: Guopeng Zhang <guopeng.zhang@linux.dev>, Waiman Long
 <longman@redhat.com>, Tejun Heo <tj@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Shuah Khan <shuah@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, cgroups@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Guopeng Zhang <zhangguopeng@kylinos.cn>
References: <20261110050324.173461-1-guopeng.zhang@linux.dev>
 <20261110050324.173461-2-guopeng.zhang@linux.dev>
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <20261110050324.173461-2-guopeng.zhang@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/10/2026 1:03 PM, Guopeng Zhang wrote:
> From: Guopeng Zhang <zhangguopeng@kylinos.cn>
> 
> Boot-isolated CPUs remain in top_cpuset.effective_cpus, but are excluded
> from its scheduling domain by generate_sched_domains(). Checking only
> effective_cpus when distributing CPUs to partitions can therefore allow
> all boot domain housekeeping CPUs to be taken from the top cpuset.
> 
> The resulting empty domain triggers a warning in build_sched_domains()
> and can cause an out-of-bounds CPU access in build_perf_domains(). Both
> root and isolated partitions can trigger this, whether local or remote.
> For example, on a 32-CPU system booted with isolcpus=domain,10-31:
> 
>    echo 0-9 > A/cpuset.cpus
>    echo root > A/cpuset.cpus.partition
>    Oops: general protection fault
>    RIP: 0010:build_perf_domains+...
> 
> Require local and remote partition creation and CPU mask updates to
> leave an active boot domain housekeeping CPU in the top cpuset,
> accounting for CPUs returned by the same update.
> 
> Add test cases to test_cpuset_prs.sh to verify that every partition
> update leaves an active boot domain housekeeping CPU in the top cpuset.
> 
> Fixes: 9b496a8bbed9 ("cgroup/cpuset: Prevent leakage of isolated CPUs into sched domains")
> Co-developed-by: Ridong Chen <ridong.chen@linux.dev>
> Signed-off-by: Ridong Chen <ridong.chen@linux.dev>

It would be better with: Ridong Chen <chenridong@xiaomi.com>

-- 
Best regards
Ridong

