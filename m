Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D51D3CAA54;
	Wed,  9 Sep 2026 19:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788983499; cv=none; b=E2nJ6Rxb420Vcec+JORdGxrujQYB/sf/CkYbF1BEkXe5e8TcNqfOTRrFhh3ewZIcZsU2e/hoJQtBhY7tTf5FHbs+A6iQAFiXCQW/luolCjCuX8c85bDj0RZQLX/9Kal8OU04oIk+N/oTxEac118JMDEqBfjltUZmvvG2d2afXEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788983499; c=relaxed/simple;
	bh=DEZX7yB5hvGm3kzuhsLGPVm3T+hGf3MNeV/sibLg9bo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G3+CDydSC48m4/Mh63tLV9UA5W1so9MYqzFWkIDy+zdjHLGq+J5MiBl80pqu2vqHlTceW+N2RuVxjTXbOAcWzeQF4EJPSL2h5MWJQu9t3wRzWxydoZv2vjAsEp6T9AYsUS2Epd54fA9v++Je0VSextIVrZaz16O3i/m/9d8OCsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com; spf=pass smtp.mailfrom=fastmail.com; dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b=Mu3yInhg; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=R75cZC3y; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b="Mu3yInhg";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="R75cZC3y"
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfout.stl.internal (Postfix) with ESMTP id 424821D0006B;
	Wed,  9 Sep 2026 15:51:37 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Wed, 09 Sep 2026 15:51:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1788983497;
	 x=1789069897; bh=yqUaOTYpRUdIsvweYNWO62QWWSoFqMe5Y9Qks7f38qE=; b=
	Mu3yInhgGL1ZzvtTXp/8Ygiz+HkAs5O26j5Qty7QNlPTsQZtyGjgsayaYXwundVd
	5C9V7Uuy/syV+NqT83JeQVbkFiCjVGB6O/Oxq6CNTTzk1OcPv2HsCx0q8EiXT8mp
	IJNBqS7rHItvUizdU1ulYh+8w5huRm43jU9HrnG8ozLV1qMT/BKqDWHg8txI1ByN
	16KjuqyIVU7SygL38wCtYmLrI6ezzg/gB+5kycKOE3qQGCAE7mG3ZmNkK2bLpDWi
	lZvGNcjxyM8vzIQG1dYS5dfzrFulqcYhlMPAS3UHrjU9xFH/upc+5/0TEei1YTcO
	naw67yW5Q0i6aY4KrzCjKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788983497; x=
	1789069897; bh=yqUaOTYpRUdIsvweYNWO62QWWSoFqMe5Y9Qks7f38qE=; b=R
	75cZC3yAvX5sgg9+QgMEf/sxEY1PcBDGqG5StcEBWJJW3WXNpPcrpldlV2JshU9K
	e1ctlYhXqfloW0jZg+qG2f9sSqURnoPp/xagr4qtmBEKiRnguwajOU+pL3FgfHzk
	8ZbST+oS4Q7Elk97QdacSkCe7PTXFlSOy5/3ytueHYT02QE154h5pH3Zq5kP8KWT
	av3CYRWtFkiSyqP2whpba2nHZ979Uh8cIATX2WtgDWM19/aONpx63BqUc8iBhEq6
	KR06bZRohDG00TY9igcO2VlbewCFwcqPCpDSy5nIkk5EgUy3BIVT8IocB/9OThtG
	6/BUcKRXoDIVFTPjAlBzg==
X-ME-Sender: <xms:yLihapMxdqJkLXyawGycFWzLFYxya5xSA29_wDgJ9AsLcKxeiiaiPQ>
    <xme:yLihakI-00xQNDxB3WdTif1rkWoqF788p_Prlh2wP0TEunmJ8MwLAv4Ksaj6NfoAP
    6FAPRBAqjPvz0EQEMoaWcNkAEH7lU8EzIVXTD9dKXowJG6BNBJOg05u>
X-ME-Received: <xmr:yLihaj2QM6q3-iQTPmfaq1Wd7gc2BxFYN3Gh-P5PV6bRR-DsqpPeyATyjgRCi1vz>
X-ME-Proxy-Cause: dmFkZTEFYHVvCfwx4U8YgfEMH7BMorVr8L3QnVJJv9/D+0cn8YaEFJEd9DvtB2eKhSnml2
    r1D4RAmLjpVhD2pdi5C/LqxCwGeSFV/6uvRt+FDpgJInpteK7lX7NH3zL9mFMl9RWk29g9
    z0BgnWdxt5b9tLr864MkzteR+YtZ17YAh/GPMuSAZJGVOzLKb1GhmO4hFwcYwbqAVUxUfT
    KixY5MutYW7h2xjR37QK+GPpi+YUwaS1njB+2XEffZuAgWY2q0jKqBXmXe5zJO8n+eCOe3
    7qQqNNGfoDtPGVKwCBfkUdDMMx59hcSY5ovdOo4PjUcIBCt1hPaxUWwhL/GeYi3dXaY5CR
    qgivfGxRrCzZjZcQ7SGqsVk6oSHaMqsRy4BAZEK/EdguEw4bgeho4Wr56xqNpGHYvouN8Y
    wUDW1zdLOB1E4/BpxwvUBb4PE0ziYo2N5RuqfEzFd2/0JKGFASv9EF6HleMcZLOgGDq6ea
    T79RIuWKTzjGTuQCNPt7FMx7c9KVyKtyCtYkmgRap9ZDK1cFyO8Rfb+zAxqensxAZzc9D5
    C9viY9ZaFCVWLX7wnB6cIa7eWxD9xh/ZcN7UhBYhv2VhsB8FHNb9oHKPJPeTQsI5M/c2Zi
    yKIprEDeS6s1c5eLbFSwbFwbsIF3DDlnBUP3cUjFWj/AUWF+5kOqGykE4JCA
X-ME-Proxy: <xmx:yLihagW-PwxamDSUX3Yy4A1q_1msALksLN3vQSLQJT7yqVjlQsQj3g>
    <xmx:yLihatOpxvU_kcAbW8PeMDl69ReLAjU6qKqkPoQ6WgmLYRrA30zBCA>
    <xmx:yLihar2zkqHDU1bQqyLYgbeAeSnyubpP2xRMBz_skx5Q39u7AWkWIA>
    <xmx:yLihapRw-QBlJOSVQKNoyo802ATstZXBNdu7FfyUTE33C2raXcuwog>
    <xmx:ybihao1Zylo-i8iWmdL4VAKxNw6ZrLV7Ufm7m9bwurqzt2qLFr-o-sTy>
Feedback-ID: i80b64ba7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Sep 2026 15:51:36 -0400 (EDT)
From: Juanlu Herrero <juanlu@fastmail.com>
Date: Wed, 09 Sep 2026 14:51:24 -0500
Subject: [PATCH net-next v7 2/6] selftests: net: remove unused variable in
 process_recvzc()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-iou-zcrx-v7-2-6b5d48a2a922@fastmail.com>
References: <20260909-iou-zcrx-v7-0-6b5d48a2a922@fastmail.com>
In-Reply-To: <20260909-iou-zcrx-v7-0-6b5d48a2a922@fastmail.com>
To: dw@davidwei.uk, netdev@vger.kernel.org
Cc: io-uring@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kuba@kernel.org, asml.silence@gmail.com, 
 pabeni@redhat.com, shuah@kernel.org, juanlu@fastmail.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=901; i=juanlu@fastmail.com;
 h=from:subject:message-id; bh=DEZX7yB5hvGm3kzuhsLGPVm3T+hGf3MNeV/sibLg9bo=;
 b=owGbwMvMwCWW/91SPSt7w03G02pJDFkLdxzZNimMf9OaSdbpn35WyS64aqbNk2Jz57xDhdW37
 X+Z6u/t65jIwiDGxWAppsji8VKkRWNqReNd1QhBmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHQMeYgYtTAKb60CeG/zGTlwpN+LI/3DfU61mzHOMaZa6w8phtql71XHGr1hoFrWT4X9Olu7e
 t0l1OfkKEruAi4T261jdP74/ebuO6orU5Pz+EAQA=
X-Developer-Key: i=juanlu@fastmail.com; a=openpgp;
 fpr=48E9148428957881DD2558116FF739276A6BB0D9

Remove the unused `sqe` variable in preparation for the multiqueue rss
selftest changes to process_recvzc() in the following commits.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Juanlu Herrero <juanlu@fastmail.com>
---
 tools/testing/selftests/drivers/net/hw/iou-zcrx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/drivers/net/hw/iou-zcrx.c b/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
index df6b62204343..c6dbd0ad5368 100644
--- a/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
+++ b/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
@@ -269,7 +269,6 @@ static void process_recvzc(struct io_uring *ring, struct io_uring_cqe *cqe)
 	unsigned rq_mask = rq_ring.ring_entries - 1;
 	struct io_uring_zcrx_cqe *rcqe;
 	struct io_uring_zcrx_rqe *rqe;
-	struct io_uring_sqe *sqe;
 	uint64_t mask;
 	char *data;
 	ssize_t n;

-- 
2.50.1

