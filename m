Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FC835DA4A;
	Wed,  9 Sep 2026 19:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788983498; cv=none; b=MoVMQnIoLLZvLY9BQ66/CCFG+q85i0rnG3BhIMCzH/c9oaD6lFotUygBs0ATtGhKWyDKubN0+SHSqWqIX/shj1En9dAo6TzC5/gJ/Kj+Q6VMXu4T6yjCL8iD092GEWAIkRKgbVAxzmpqkJuKSWXdnYvHRdJ4RBT2JGzs+HqKZlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788983498; c=relaxed/simple;
	bh=1LhBJ66w1k8GNfrsaXMA5+HvLgA6hwVpIRDgp3cGSDc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=V4/rZNPg/nhQPzgYzBvK9baw/1Yc8Nua+bviRAIZDL/INzpc0NaDMBm6AeoJVmmDv899iydKb/T/8999LAeJmE4tRTc7atojrUxY/TPQlC4MhyCKoKKQH5FAGuvLOc8YpW6F8GuNziCc7cESDnklysJSd7DII4egM/AztOfZaPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com; spf=pass smtp.mailfrom=fastmail.com; dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b=RqRB/h0H; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gxs1QaTJ; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b="RqRB/h0H";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gxs1QaTJ"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 9E1897A0075;
	Wed,  9 Sep 2026 15:51:34 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 09 Sep 2026 15:51:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1788983494; x=1789069894; bh=Te
	9pUtz8HHvJio0zOcSIK+7k4siPDoYwlTXA189ndtk=; b=RqRB/h0HHpLuGhYbEE
	BV9fWqwdZccr2N3Lq6+PEGzLvMbWMoQhLwfRi0XT7GhbQKRgeF/XXOo3teHEsJqi
	kFNZdJi6bWKoaG5YciykRyMkzdfteLXWAcWX33OxDzzNSomE6+v4iB5e2Iy1QtIY
	BfWPnxVHqV/PRj4X3y5hB04ssAWHuzoF8mA95d9NCUG5NJ4Vb5915lRfVuAv2zW5
	C7UbsiK3mOizcXlfoSOQPzNKzJWLNtI7v8/wiVcDUBWo2ID4BnI3x8mPhzWJy5df
	XDm4SNPDIs2o3gqmM3I5fFQCy9wsUjQvdkDEpAJQgvCm+IjE8o7DJ0HRPU40yM8T
	l76A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1788983494; x=1789069894; bh=Te9pUtz8HHvJio0zOcSIK+7k4siP
	DoYwlTXA189ndtk=; b=gxs1QaTJbQyumEVnzjXq4xNMhHWWFduEoW5EY+T9nccV
	BgXO4fapUMrWiPrhSNqAOhFDzXpw94r6u9eEBe/DenM1r4Ky0F443dgRL5FUYkvH
	Wbqh+pPi4mgRNMkZ5f8mzpvfzPNe2onBcfhcyuD4Oiy3hWTUB5XVi9Td9qHHGFRO
	5Xh7Tf74NaLmdmpLq4r+QZKnobju+IzQbVuAMIV4ZP732gHL7c5WYiK3Acnv2hWK
	xC1qsjMyQDKqG0+XjSyO8qcXX5jMOwrTDx+C4vHPPBFezlPBjZxuW718AtNfj5v7
	I5PBHjK5nsABXex/6iEKGOyC7ULOw4H9sjQDkPIIpA==
X-ME-Sender: <xms:xrihaiyR1RdqoNHwivDhb0tD-31Ap9w1NFYGYX3qNdAUR7lEThULgg>
    <xme:xrihamdoXsVVXvOBNHN9TKwoZ23xMoAlxK8q5RqBAOglnDt6rjdOn0P5thoYxU2Nh
    cTETtoVUgEuXObfQlGHznth23cFi38L7IiCmUT3U3IG87iBed3F25F3>
X-ME-Received: <xmr:xrihav6_bfVWpqIHmTz-3d33kJ1cpeEFymUSeaAXWsvSDf9oBjQWP_lbDgV7cGHq>
X-ME-Proxy-Cause: dmFkZTFstriRpVOIzBLSQs0vKiuKLiGzVnASIcLfUyR+LMtT9K4QQkPigvZSe4eIWtHcOK
    oTsUtKEkjjP0goX8ueiEWaxuzoai23k1jE5gQHkJfnlzZsCtducPKXV0N+lbRH+igkQXCd
    VT/R6dIF+ub6C6WXaN2AtCctEyOj7isnkxxACqHgMwlCCbv1cHyTjKGg01+iHN9Umw4yK7
    bDtqnNbYNnhh1NEiPub2l9mBZhWNvVCw/8DekLNHevxgWAOLh/asU+H6gtU7E4DUCHmBZ0
    8LoBnnEodgh7rIzGS8lEklyIf4mW2/mXR6tx8uerqxY3JZjZY+tkzQfpFAFnWY+F+CyDsW
    QwYw9mJxY9uHHlsovKKubHSS70FixIlEw6WA67mvKlRfIomh2iv261UbCLavupBNTrKUp5
    D7T3i4vrmdMCao/mm6YUFj1wJZwyMKg2kqO370rLYACHevNRXLGxrX4FQfrea4EbKnkM5M
    6GsGz0Kd7CERlilNd5CDwhTcARk3CNPcACuIyRZF/qR6+mmUUMy1a/5kss08sES1yblSjz
    R471JvPHnrHhupMSvmnKJBX3K6WyqyXXr3UCiuiF+7CLszW4tcyRQaNW6RL258GYBxyXL/
    2mEqoyuOD6p6OT/lJIIW1mOVA6/AaP5dSGAIyxpOcXe/HYHGA8vTRAU89Opg
X-ME-Proxy: <xmx:xrihajJ52b507iSQc915NzWreSSjyP8ni69pGEk3Yt7BGdeBzoQz7g>
    <xmx:xrihavzJ4bJsP4A7fe4q4ujvF1ldas-Xkp5-XjE8nvEJ_G-ZXRaNuQ>
    <xmx:xrihajI70LhWT6q30WnrE0iRBQEv50G4TO1r1yEtWqwZWMOcez14bA>
    <xmx:xrihamU7u4PlXXuaytMLNKBZELcqJGv3Z1i_m0qSzshXOCft0t1NaA>
    <xmx:xrihalL1QxnBC6syIFUyGCuOzQXgevjzVgNpcNq6Zz7kBlyBpfNMmwW_>
Feedback-ID: i80b64ba7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Sep 2026 15:51:33 -0400 (EDT)
From: Juanlu Herrero <juanlu@fastmail.com>
Subject: [PATCH net-next v7 0/6] selftests: net: make iou-zcrx tests
 multithreaded
Date: Wed, 09 Sep 2026 14:51:22 -0500
Message-Id: <20260909-iou-zcrx-v7-0-6b5d48a2a922@fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQqDMBQFryJv3Q9RigavUrrQ9LX9XURJooSKd
 2+sy2GG2RAZlBF9tSFw1aiTL9BdKrj34F8UfRRGY5rW2LoTnRb5upCFlte2NnYwo0PJ58Cn5v/
 qBs8knjnhfpq4jB+6dJyw7z8hCSMBdgAAAA==
X-Change-ID: 20260817-iou-zcrx-e8e46108a0bc
To: dw@davidwei.uk, netdev@vger.kernel.org
Cc: io-uring@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kuba@kernel.org, asml.silence@gmail.com, 
 pabeni@redhat.com, shuah@kernel.org, juanlu@fastmail.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1990; i=juanlu@fastmail.com;
 h=from:subject:message-id; bh=1LhBJ66w1k8GNfrsaXMA5+HvLgA6hwVpIRDgp3cGSDc=;
 b=owGbwMvMwCWW/91SPSt7w03G02pJDFkLdxzunee1K+AdX8eTWa+Eq+yUXApDUwXfhZllKK3Z/
 O1YoF9Wx0QWBjEuBksxRRaPlyItGlMrGu+qRgjCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjoGOsYMXJwCMNX35jMy7LNQmaobb7/ZUsl3VeWy5Wmh6WbalyXFZ29VMNmwqnCiMcP/8nNMRVv
 6fe33Jx/fONk6X756UnJM5YmvVw/d3S7AElXFCgA=
X-Developer-Key: i=juanlu@fastmail.com; a=openpgp;
 fpr=48E9148428957881DD2558116FF739276A6BB0D9

This series extends the iou-zcrx selftests to be multithreaded while
preserving existing single-threaded tests.

Patches 1 and 2 are prep fixes/cleanups. Patch 3 refactors the server's
global state. Patches 4 and 5 add the multithreaded client and server.
Finally, patch 6 adds the python side multithreaded test case.

Changes since v6:
- moving listen() after workers have registered their zcrx ifqs
  (Sashiko, Paolo, Bobby)
- worker verifies its own connections received the fully payload (to
  deal with the 0 connection per worker case passing (Sashiko, Paolo)

v6: https://lore.kernel.org/all/20260831-iou-zcrx-v6-0-02d1d012f0fd@fastmail.com/
v5: https://lore.kernel.org/all/20260814012348.46958-1-juanlu@fastmail.com/
v4: https://lore.kernel.org/netdev/20260729221825.42773-1-juanlu@fastmail.com/
v3: https://lore.kernel.org/netdev/20260722203950.58550-1-juanlu@fastmail.com/
v2: https://lore.kernel.org/netdev/cover.1776444379.git.juanlu@fastmail.com/
v1: https://lore.kernel.org/netdev/20260408163816.2760-1-juanlu@fastmail.com/

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Juanlu Herrero <juanlu@fastmail.com>
---
Juanlu Herrero (6):
      selftests: net: fix get_refill_ring_size() to use its local variable
      selftests: net: remove unused variable in process_recvzc()
      selftests: net: refactor server state into struct thread_ctx
      selftests: net: add multithread client support to iou-zcrx
      selftests: net: add multithread server support to iou-zcrx
      selftests: net: add rss_multiqueue test variant to iou-zcrx

 tools/testing/selftests/drivers/net/hw/Makefile    |   7 +-
 tools/testing/selftests/drivers/net/hw/iou-zcrx.c  | 422 +++++++++++++++------
 tools/testing/selftests/drivers/net/hw/iou-zcrx.py |  50 ++-
 3 files changed, 347 insertions(+), 132 deletions(-)
---
base-commit: 548b86839f7fb819a4d6c83b71c73ec378d24275
change-id: 20260817-iou-zcrx-e8e46108a0bc

Best regards,
--  
Juanlu Herrero

