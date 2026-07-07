Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6703B5E07
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Jul 2026 09:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783417116; cv=none; b=Anow0m+yduDRNkZvHezw9LVQKvg7H5n+pURBGNKd1lCaRHiKaV696w90Yd8Lko4bEWGkA8ClcAh4JDXANQLG87OvIOtYRHAsUGrvSvglzRLpnzMl2C6qMpIfvav18e5lqMwNkkPCjnZ9B/WqV8TpNjWxaCXOngCYX3mFT0lEjxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783417116; c=relaxed/simple;
	bh=H/XYDskgizUKUqTNKg3AUKDlLp6hMCBUIi21GzcLaB8=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Cc:Content-Type; b=PiVvTpkF9yCkBKJPMn+SQm6h4UVgj59hhl1Pt0nNk2H6uB/79Iuc+6CXp8SwwFPxhNBUpOgke59LHh+AUJBCuPM5UJXvI++Rt1yqVkyZeX7JBzSq3IfRJ8IfWub/I8OWu8oJ/PwrvRvfMX23cMB5iL4GrwdTOOf5+oyTb/L/stM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=oTcK4EVx; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="oTcK4EVx"
Message-ID: <c0970cee-42c2-4844-b88e-229853f08e90@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783417110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=81JSG6w2tPh5xLW4dgWvCCuTi+vlHxWAgKmbEEuJMmI=;
	b=oTcK4EVx2B8Ljv/pIfP+FxJpn76Oi0kUf3J23SeIOMhzRT3149x1fiJ51nZ/X39c5ViT/j
	eAAZqMFSbGlvr82wJ/GBtyVd86/HH99DRyhRcFwWvgEDx4d2RjIOEF3A4eJA8zA3c3uQsL
	gICmKcQwZKkcUPNad2N2MuofNU4E3Wk=
Date: Tue, 7 Jul 2026 17:38:13 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Zenghui Yu <zenghui.yu@linux.dev>
To: linux-mm@kvack.org, cgroups@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: cgroup/test_zswap failed with "zswpout does not increase after test
 program"
Cc: hannes@cmpxchg.org, yosry@kernel.org, nphamcs@gmail.com,
 chengming.zhou@linux.dev, tj@kernel.org, mkoutny@suse.com,
 Shuah Khan <shuah@kernel.org>, mhocko@kernel.org,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hi,

Running cgroup/test_zswap on my arm64 box failed immediately with:

  [root@localhost cgroup]# ./test_zswap 
  TAP version 13
  1..8
  # zswpout does not increase after test program
  not ok 1 test_zswap_usage
  [...]

I'm sure that pages are successfully written into zswap by checking the
count_memcg_events(.., idx=ZSWPOUT, ..) trace events. But "zswpout_after"
in test_zswap_usage() is 0 and results in this failure.

I guess the problem is that (in this particular case) the memcg stats has
not been flushed when userspace reads it.

 memcg_stat_format()
   mem_cgroup_flush_stats()
     __mem_cgroup_flush_stats(.., force=false)
       needs_flush = memcg_vmstats_needs_flush();

 static bool memcg_vmstats_needs_flush(struct memcg_vmstats *vmstats)
 {
 	return atomic_long_read(&vmstats->stats_updates) >
 		MEMCG_CHARGE_BATCH * num_online_cpus();
 }

I can image that memcg_vmstats_needs_flush() will return false because I'm
testing a 16k-page-size kernel on a box with 96 cpus..

As we have a periodic flusher flushed all the stats every 2 seconds, I use
the following diff to wait the flusher to expose the accurate stats to
userspace.

diff --git a/tools/testing/selftests/cgroup/lib/cgroup_util.c b/tools/testing/selftests/cgroup/lib/cgroup_util.c
index 3ce134509041..9596f294da0b 100644
--- a/tools/testing/selftests/cgroup/lib/cgroup_util.c
+++ b/tools/testing/selftests/cgroup/lib/cgroup_util.c
@@ -95,6 +95,8 @@ int cg_read(const char *cgroup, const char *control, char *buf, size_t len)
 
 	snprintf(path, sizeof(path), "%s/%s", cgroup, control);
 
+	sleep(2);
+
 	ret = read_text(path, buf, len);
 	return ret >= 0 ? 0 : ret;
 }

I have no idea how to "fix" it properly. Please have a look!

Thanks,
Zenghui
