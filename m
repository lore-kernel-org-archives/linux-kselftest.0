Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A8E254AFF;
	Fri, 14 Aug 2026 01:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786670636; cv=none; b=gLRsoUvia99eDfXZZN4m3ae8SRL/XCCdTuUHtiP+RZj9R4NiJCjdVqi3KU1ci8TyMi54KbVrAC1yRmi2o2+i9eohRid8R0kMhhovOWMZs2nqH3WvPHHVH8JNStyx1TQ6yt4IzuEg4ZHulw8gFIByJk2UJmJqkGKNo968YlIl0mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786670636; c=relaxed/simple;
	bh=+zmeW9MT0lrfSPGlWuxHOU1VmCjQetEN/rUoTJiMmK4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sZqk1csQm/shyooYoICgjiS56k/rMWhUfVSCA/qpv/RgO5OgAZUadQ8sVMQ7+XNq2pp+y2Af0FydTBBLOQgSlac114Lb+7mH0dx29ran4HhKYytN9Go5lThBSsB4HhM0do3To6QifDwZbpOgNtVH0f/x74yOB5375VIR4BfR/2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com; spf=pass smtp.mailfrom=fastmail.com; dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b=h3DKAm9D; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=BhtN5Td6; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b="h3DKAm9D";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="BhtN5Td6"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id AB0857A03FD;
	Thu, 13 Aug 2026 21:23:53 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Thu, 13 Aug 2026 21:23:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1786670633; x=1786757033; bh=KrhbtMYFaxGVwuXnzMlWh
	0sdoirPJyp1eBdn9qbz2HI=; b=h3DKAm9DGkMiwCUcTeLxXRJVMVa3WBB6IUNSz
	v0XFPoBORwnJLNulQJ0cHc2jbkvGBMBeA2pg4qqwHy4fPctYnbkTfVS9wB7Rre+m
	3JROaruJshp/spA23BEKIkpjU4sR2kJV5YhCyiMoLXoA9CxkJe/Y3yuC70BHsfcd
	t2yhI3iMrWPhsXpIjn4OyIqmgsq7o67KmvHXXFQoUe+1LA8BAjwanW1K9BiDoHCV
	x56hyL1pyQ1dI7sKKeK373598hFmZfLn+RXKaUAYoaUMJl3PPOFidgqyGuqDn6Qe
	dnh1K+kUsE8z2Mb5EsTWOwBkLxtsbs/jHU3ahzy6LA3XCjvSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1786670633; x=1786757033; bh=KrhbtMYFaxGVwuXnzMlWh0sdoirPJyp1eBd
	n9qbz2HI=; b=BhtN5Td6OKTJ/YXqub1pYaMEbLOH6tI743ffObhe6+USFKtuec5
	g8GPKJlquyNt6uBSWm3ejDooar8nrG/Q1p0IJ3PQYr/hztOkamyCuBTpwFpiImwC
	0AEqdffIr8Ap4hYbTyb+YOSHGdVokVLsD95TI+TzLgCpmzbB6wTtzus74nKW3tka
	hkMYLV20J4Jc0HxYz08f+x645yBB9wOSrGKf5PVUTkYIxSRJJcVQ2thZlU0rh81J
	52qMIE0KiUtdhKp1amB4g8eBxbs1k4aIhZd0gTdz/rOy8o4Bm+0PXBZU33LhtjXf
	WJ9qA68EXvbszhTonE+O1f2A1ksKNhYr8rQ==
X-ME-Sender: <xms:KW5-ajGLWKHW44ZJCiue-KnllJKDzB0P3XyoDSI34MJRzPdtL2njZw>
    <xme:KW5-aohaX9F8fs_qj12q0axooYJMC5lE42XwIABYG1bc1G0bYLgHagUHuTHt_R528
    KfTeBgK2jj0O0fm1wArOTD74LvHmtXLoO3oDd9mWr8uDI0Wh6DPyPHL>
X-ME-Received: <xmr:KW5-agt-yr8ZUe3JFvQGdxHvEdK9fUILvUABX_5XTfUB-6WlPaJ21Vckf5DYajDBaJh6w9PbwqaKG_rYFrK7xsfhMm-BW0U>
X-ME-Proxy-Cause: dmFkZTF9Oum5zaWpSobsGjnHrZzXYENcktdJq7zh1+dARcDl8OcqaR+P1iz0bf7lSClaN+
    b2DcXIKpxnAoRTM2CBHRM2hjzg57ch/9U/cItae80BmIVS+mDzfF1EQRzgxvJ8rMxucCbs
    2s5GLGRRGaBA/mBCPnq9kZ/LGSdyb/1kvzmLC7jcVLJ1/j9bBbArhWRc2WAmMuhLDZadQq
    JvoIzQuolGp36SGXYFjfsqaBZ0Hzc6q8vcGFsw5RB+7kiEtT2zjG6NBMBVuaHJ4iP8Lgqf
    RCg6OeUwxsRy11g4tjvc6xrNmfT5b1E1S2BTz2+79brtIXZboPYnvBnoOwbkDjQyGLtunU
    ScLNcZaBsn1n6WO3aNLHPPiI6k27VQu87tXbg5XOS7q3blej5tv9Z3muk2SRNzVBiUQXub
    YDSneotab1DzZDQo0ZEW9N9i9l/bwqfs8lflpL29FwIu9uThDVGQd5nvkaJ6edqhdZdluz
    NxBWDBnoIs7QFixFFcSnr/8xT2//QvqsQ1WuHyc3xe63M0eU5mEUD3bq8sV6NScHfqXDMs
    5ePO7qkVXyYM6Y7Rk1tVNgGW1v89pCQjOU2VtI7uxqjNxkbSBhyyV+5mATdoqIaImw0v+b
    lYGr3RfImWTSiXoQicEuqIJem0TNg2VTEvJTgYWdgae4waOSfwE/6nxI6Kxw
X-ME-Proxy: <xmx:KW5-arsSErWAKtWNZowKl0oOEaPPLQMACWWcewdIbA4gMhycdempwg>
    <xmx:KW5-alE_OLuscZzoFsn0htx-BCZJlxj06K99D_D8aScG1rPhejX5Jg>
    <xmx:KW5-amOOZtMX4czn29_U32gfZ15PFLAepF8adCEi9QNwIe2XwaNVcw>
    <xmx:KW5-akKtphM2Tj0s5CmHwVasuU2sEu5zHnJ4tYYk-qj-USgj48JjeQ>
    <xmx:KW5-ajtBlE_XYcJ_O0ndnf0fjGzQUHijW6qpyZ1i5XvAa5puRWHWk0Ad>
Feedback-ID: i80b64ba7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Aug 2026 21:23:52 -0400 (EDT)
From: Juanlu Herrero <juanlu@fastmail.com>
To: netdev@vger.kernel.org,
	dw@davidwei.uk
Cc: io-uring@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kuba@kernel.org,
	asml.silence@gmail.com,
	pabeni@redhat.com,
	shuah@kernel.org,
	Juanlu Herrero <juanlu@fastmail.com>
Subject: [PATCH net-next v5 0/6] selftests: net: multithreaded multiqueue iou-zcrx
Date: Thu, 13 Aug 2026 20:23:42 -0500
Message-ID: <20260814012348.46958-1-juanlu@fastmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series extends the iou-zcrx selftests to be multithreaded while
preserving existing single-threaded tests.

Patches 1 and 2 are prep fixes/cleanups. Patch 3 refactors the server's
global state. Patches 4 and 5 add the multithreaded client and server.
Finally, patch 6 adds the python side multithreaded test case.

Changes since v4:
- In patch 4, make cfg_num_threads the default value and remove
  CONNS_PER_THREAD and associated ternary (David)
- Use reverse christmas tree for variables (Paolo, David)
- Address race condition identified by Sashiko (Paolo)
- use thread barriers to get rid of epoll in the main thread (David)
- Make napi id matcher helper take a connfd as a param and return the
  index directly (David)


v4: https://lore.kernel.org/netdev/20260729221825.42773-1-juanlu@fastmail.com/
v3: https://lore.kernel.org/netdev/20260722203950.58550-1-juanlu@fastmail.com/
v2: https://lore.kernel.org/netdev/20260418094907.3cde57ca@kernel.org/
v1: https://lore.kernel.org/netdev/20260408163816.2760-1-juanlu@fastmail.com/

Juanlu Herrero (6):
  selftests: net: fix get_refill_ring_size() to use its local variable
  selftests: net: remove unused variable in process_recvzc()
  selftests: net: refactor server state into struct thread_ctx
  selftests: net: add multithread client support to iou-zcrx
  selftests: net: add multithread server support to iou-zcrx
  selftests: net: add rss_multiqueue test variant to iou-zcrx

 .../testing/selftests/drivers/net/hw/Makefile |   7 +-
 .../selftests/drivers/net/hw/iou-zcrx.c       | 406 ++++++++++++------
 .../selftests/drivers/net/hw/iou-zcrx.py      |  50 ++-
 3 files changed, 332 insertions(+), 131 deletions(-)


base-commit: 3da8c3c8b8fa99505624b65ef590482f48e766b6
-- 
2.53.0-Meta

