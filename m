Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A3E31F997
	for <linux-kselftest@vger.kernel.org>; Sat, 23 May 2026 16:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779554642; cv=none; b=G57Luk2KkSfaE9v9vCgTUtGq/OkmwTW9DJrRs2XdFhMPo7BjbUXnzqjqiRyKErTGguIkPFS8QR3KbOgfLT6kXaYaRkkRlcfgQjGWasdmqB6wWDpDnu+kKhg5AmSJelXESbrsMoW02NvQmqfxm3nO/caAK/61cWuh/82R1lC6BTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779554642; c=relaxed/simple;
	bh=WG6J3KB/s5fUB/GFJNP9FvP34PzLqHVJwxQ9tLV2M4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o58LYA8FKQ/tkz/D42KGMZDXXdSPMv4E4rdjB8ctQB4/tRBUlwpSbi0VjppY/ttWos3zrfuTY91ijNcMJA3TkCJMonJyBm1MO/yE70EKvbOLPEZNSXWXdyh9pawJoiSqVsGf5tT5tvqyPOK0jXw0z8dugur7HBeLKKP/RnEduI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X2yCfhJu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X2yCfhJu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779554640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kzA6U+/n/3sa6TSczUbshLKd1jSASL89q89wIEK8VH8=;
	b=X2yCfhJuWynGOQbTsfdcC8Sfq33+8pjuKgPVgwMvP5K/wi7xZHjoKxanFA5pGZoUe7mQGC
	4F5rBllbzzAdWMqN4RJ/JPzfI+ueg6FtwneLEdgrxyURVGSG9h1q6MQsbf6Ie2j5ftdTl8
	nIn9Yp5o02+1XWhoe9PBzthjVmwF6Uc=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-367-5FmP3_EKPYGTZSC6lMmHxw-1; Sat,
 23 May 2026 12:43:52 -0400
X-MC-Unique: 5FmP3_EKPYGTZSC6lMmHxw-1
X-Mimecast-MFC-AGG-ID: 5FmP3_EKPYGTZSC6lMmHxw_1779554627
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3B4FB180047F;
	Sat, 23 May 2026 16:43:47 +0000 (UTC)
Received: from fedora (unknown [10.44.48.14])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id DA4B619560A3;
	Sat, 23 May 2026 16:43:41 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Sat, 23 May 2026 18:43:46 +0200 (CEST)
Date: Sat, 23 May 2026 18:43:40 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Breno Leitao <leitao@debian.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Shuah Khan <shuah@kernel.org>, Mateusz Guzik <mjguzik@gmail.com>,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, shakeel.butt@linux.dev,
	jlayton@kernel.org, axboe@kernel.dk, kernel-team@meta.com
Subject: Re: [PATCH v2 2/2] selftests/pipe: add pipe_bench microbenchmark
Message-ID: <ahHZPLqAPXhobCQn@redhat.com>
References: <20260522-fix_pipe-v2-0-a8b35a78244e@debian.org>
 <20260522-fix_pipe-v2-2-a8b35a78244e@debian.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522-fix_pipe-v2-2-a8b35a78244e@debian.org>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On 05/22, Breno Leitao wrote:
>
> Add a small selftest that stresses pipe->mutex contention by spawning N
> writer threads that hammer a single pipe with multi-page writes, plus M
> reader threads that drain. Each writer records its own write() latency
> samples into a log2-bucketed histogram; main aggregates and prints
> total writes, throughput, average and percentile (p50/p99) latencies,
> and the maximum observed latency.
> 
> Pass --memory-pressure to fork stress-ng (--vm 4 --vm-bytes 80%
> --vm-method all) for the duration of the run, so alloc_page() in
> anon_pipe_write() routinely hits direct reclaim. The flag fails
> fast if stress-ng is not on $PATH.
> 
> Program print something like the following, for different writes,
> readers, msgsizes and memory pressure:
> 
> 	config: writers=X readers=Y msgsize=Z duration=3 pipe_size=1048576
> 	memory_pressure=[no|yes]
> 	writes: total=54451 rate=18150/s
> 	throughput_MBps: 1134.40
> 	lat_avg_ns: 275355
> 	lat_p50_ns_upper: 262143
> 	lat_p99_ns_upper: 1048575
> 	lat_max_ns: 2145633


The more tests the better... but since it comes as 2/2, perhaps the changelog
could mention the difference before/after 1/2 according to this test?

Oleg.

