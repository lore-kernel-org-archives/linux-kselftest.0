Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655793932FE
	for <linux-kselftest@vger.kernel.org>; Thu, 16 Apr 2026 11:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776338665; cv=none; b=nKalqjN/qrdjiTA/m0OfQ3+UGbRcnvAwRnk67BMUCIPcdO1y/Ryq6oQK/Zg3qVd6wcVhGkIeSd5fP2G9c/Kit1QD8Kweb7my5ErjvARePi5FLCtzBQY8kK6uKhXs6TrnI9NCyJOgHvrIdwv19sfHwFQBJrZK0JsL/e+47Lxu5JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776338665; c=relaxed/simple;
	bh=wkO+W3b4OI89v/KKCXuU7JOPO3UqcCSDyYqANd9YPOg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=nxVgM/djg1AMrzZnyvhEcYxL80Q0b512qk3X+O2zCUovLKNvaRkZdxU+LSHGtQl9luxf34vMOXIKbUDeP7mg4t2OpDFwCbFPDhufLnnFMuWuCek8bFR/WbxOf2gzm0sXgBQdfYMju4JQ8p/dQsCbVYLqkdCszt9U3i7y0MRW9Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cRkm60GB; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cRkm60GB"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776338652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GQzGijXLGNbuq7icCuIcljXiHVxyhjq8+F6R9MdoBzA=;
	b=cRkm60GBXbJRlkyJZBd6kPmGCrRZ8WN5lQUoYW0p0B7QNOanhZO04xlt8a8IgEJjCfX47F
	M8B4+i4bXpHMGwWJz4zGht1bjucGypK2DdnPNVMQEyA5euAdPbUhBIsIStGFJm4YyZjmEE
	hvyLVSU2P1IAYNoWXmJbTePnK1+l2W8=
From: KaFai Wan <kafai.wan@linux.dev>
To: martin.lau@linux.dev,
	daniel@iogearbox.net,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	ast@kernel.org,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	jiayuan.chen@linux.dev,
	kafai.wan@linux.dev,
	bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf v2 0/2] bpf: Reject TCP_NODELAY in TCP header option callbacks
Date: Thu, 16 Apr 2026 19:23:06 +0800
Message-ID: <20260416112308.1820332-1-kafai.wan@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

This small patchset is about avoid infinite recursion in TCP header option
callbacks via TCP_NODELAY setsockopt.

v2:
 - Reject TCP_NODELAY in bpf_sock_ops_setsockopt() (AI and Martin)

v1:
 https://lore.kernel.org/bpf/20260414112310.1285783-1-kafai.wan@linux.dev/

---
KaFai Wan (2):
  bpf: Reject TCP_NODELAY in TCP header option callbacks
  selftests/bpf: Test TCP_NODELAY in TCP hdr opt callbacks

 net/core/filter.c                             |  5 ++
 .../bpf/prog_tests/tcp_hdr_options.c          | 54 +++++++++++++++++++
 .../bpf/progs/test_misc_tcp_hdr_options.c     | 40 ++++++++++++++
 3 files changed, 99 insertions(+)

-- 
2.43.0

