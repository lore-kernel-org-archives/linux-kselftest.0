Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DB13B3C11
	for <linux-kselftest@vger.kernel.org>; Fri, 17 Apr 2026 09:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776417671; cv=none; b=Kn5z8/fPUEEn9ajkFyiW+GPeV1klTsWo0CNBhxVHYdoUMmPxV2BEZjYqkwAz5/mXTd9M3iEe0h8NjqLqsnBRmXJH60E1bfm6t0wthlOIqjiUph/NzdKlcF/8wGgKwWTYoG/ZHZ3F5XZmP1Gue7k6J+eo+w/U4011S9Tx6FxJcNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776417671; c=relaxed/simple;
	bh=gGL8y9AF4lTaxH7I3Hf+h4oTv5K4c3+5pygQgEdtzCg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=AsX+i9ey1kco60oc9aXATPKopNaeMciqhuT+NSfIeHGFleI9j2hYP6pcO518rcYRTwxktVy93RwOtf1znOjE+y7CN9eHIjjjvIXh6W1tuGchgUtjNx6ISrpHJaGIR1HLvRgNanwvULLN/CqK0YM0cFe0KOykvVrLYOxAwI59WdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=JI3f5Isa; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="JI3f5Isa"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776417656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=i4FscWzLPOcyfss0x+6DvY38XSJbaQ6nBMjNqlK6dJE=;
	b=JI3f5IsaTr2y2qTAMDDHo9qIju1CQPcgv02W0eUzGNGjFz9lg9CCqYN11r1MJlW/ZbSGtC
	T0BgxX7YAqKB3krNQxFjUQNe71h12nZdjfAZqmIulwlQHN5v6DFVzf8mbc5KCN6hNHQqNA
	3jdEVIU4NbeKSkltpuxFxksABA33Euc=
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
Subject: [PATCH bpf v3 0/2] bpf: Reject TCP_NODELAY in TCP header option callbacks
Date: Fri, 17 Apr 2026 17:20:33 +0800
Message-ID: <20260417092035.2299913-1-kafai.wan@linux.dev>
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

v3:
 - Remove CONFIG_INET check and add comment (Martin and Jiayuan)
 - Fix the test case (Martin)

v2:
 - Reject TCP_NODELAY in bpf_sock_ops_setsockopt() (AI and Martin)
 https://lore.kernel.org/bpf/20260416112308.1820332-1-kafai.wan@linux.dev/

v1:
 https://lore.kernel.org/bpf/20260414112310.1285783-1-kafai.wan@linux.dev/

---
KaFai Wan (2):
  bpf: Reject TCP_NODELAY in TCP header option callbacks
  selftests/bpf: Test TCP_NODELAY in TCP hdr opt callbacks

 net/core/filter.c                                 |  6 ++++++
 .../selftests/bpf/prog_tests/tcp_hdr_options.c    | 12 +++++++++++-
 .../bpf/progs/test_misc_tcp_hdr_options.c         | 15 ++++++++++++++-
 3 files changed, 31 insertions(+), 2 deletions(-)

-- 
2.43.0

