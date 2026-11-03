Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712399;
	b=AY4NUGgNAKqfgewXt4IDJ5e4iPBYDm9O2AupX7q8VFQwP6Lsn0BW8pb8HAatwABHOUk+
	 gQCSv+iPXaPGA4EHyivIoDbaSk/ti8tGTW4alKSZwcl2oNKfHm9HXETFar8hPmJ1S8FnW
	 s3+/9+T6UHf7cFAl94haHpVpExCjKARMavbt/xuQ+1NpakMRa5WF44IfVq9cNXkS4mMz/
	 TFA9CuTwPLL77/tvXZGIuC8KoYOkhKFvTjYo9Mg6Itb6H63Trnq9TvoweIHLQgvTMKlzc
	 56GnCBCf4VxufbQduPRugaO9isZlQcK2fXIxiB4gprMaq+pRjsDWoyFuUwlBdJT2HJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712399;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=8lMZMIQfgxM1Y1sLfd9pmLbFTG91TDyafPfpoX4xnzA=;
	b=MOvYxup9QwA0a8GPO/r1sSAw+lbCLJhuWpdfbizi+2UqS0H1EU3MjT8ilyqsKIWLcbFt
	 FFPapO8HC7WcVBqsLsxXmNvLTya2TEBWagVf/5QNfrc9vLaOp5GA+MolyRPhMo1B97gyW
	 AbWnw3lmiK6R6uiOIGMSud09C5BpFx5lGnTrDDA59OPCFo7lyA9QNCxbwpgJbNFqEtyh1
	 4WFvppDofwKX1X8M20FrO+03kAcXFZd3OQM84SisCJ9EbXisGwYX3nGL2zdyoxQ/isUAI
	 vMOG/iCjHopdqtNprFmMyZWMF+VOTNLP2iVw64Wc6bNMJn8GyMZ4IhDcbrtwIGyGi+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RKUEs0xX;
	arc=none smtp.remote-ip=91.218.175.15
Received: from mta0.migadu.com (out-15.mta0.migadu.com [91.218.175.15])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78497606D827
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 13:26:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78497606D827
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RKUEs0xX
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=VwdILgRNSWIPkWDn3eJqPy63I1Bwv0LiB91pK15cOp4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793712391; v=1; x=1794317191;
 b=RKUEs0xXGMHXqpldvK6xKP9OgY/JkqJguHg9nwDITmPZYbZSfAdhCDOfLqEXbyxGkw5DOJg+
 sUpJMrY5rz4yDlReExV7mql76Heuw9veg2/T3jq7KFYQjb+PtZryeX40GnyotIZJX2ts1N6upNJ
 9H01i8xwDXIYfrtWX8KekVE4=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 223b7a157b0f36b3;
	Tue, 03 Nov 2026 13:26:31 +0000
X-Mizu-Trace-ID: 223b7a157b0f36b3
X-Migadu-Flow: FLOW_OUT
From: Tao Cui <cui.tao@linux.dev>
To: tj@kernel.org,
	josef@toxicopanda.com,
	axboe@kernel.dk,
	alexei.starovoitov@gmail.com
Cc: cgroups@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	andrii@kernel.org,
	eddyz87@gmail.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	linux-kselftest@vger.kernel.org,
	cui.tao@linux.dev,
	cuitao@kylinos.cn,
	ameryhung@gmail.com
Subject: [RFC PATCH v12 0/4] blk-iocost: BPF struct_ops cost model
Date: Tue,  3 Nov 2026 21:26:09 +0800
Message-ID: <20261103132613.1952975-1-cui.tao@linux.dev>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tao Cui <cuitao@kylinos.cn>

This series lets a BPF program take over the cost model of one device.
The BPF model provides calc_cost() for charged IOs plus two transfer
coefficients for the completion-time sizing, io.cost.model selects
between the attached model and the builtin one, and enabling and
disabling the controller stays with io.cost.qos.

The builtin model is a linear formula derived from a handful of device
parameters, and the right formula is device specific.  A BPF model can
be adapted to the device and updated without rebuilding the kernel.

The series is based on next-20261030.

Patches:

  1/4 blk-iocost: add BPF struct_ops cost model support
  2/4 blk-iocost: add iocost_ioc_tick tracepoint for per-period
      device summary
  3/4 selftests/bpf: add iocost cost model test
  4/4 docs: cgroup-v2: document the iocost BPF cost model attachment

Changes since v11:

- dropped the cgroup callbacks (the models build their state in
  calc_cost() anyway)
- dropped the queue freeze from detach
- folded everything into blk-iocost.c
- the selftest now uses cgroup_helpers: the tests create their own
  cgroups and remove them on exit; io.cost.qos/io.cost.model are
  root-only cgroupfs files and the test reverts them on its exit
  paths

Tested on next-20261030 (qemu x86_64): the selftests pass, and the
2x example model doubles the charged cost over the builtin on a
rotational device (2.01x measured), returning to 1.00x after
"model=linear".

Link: https://lore.kernel.org/r/20261028143534.135968-1-cui.tao@linux.dev # v11
