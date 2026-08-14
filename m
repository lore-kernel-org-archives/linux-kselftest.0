Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B552F3C10;
	Fri, 14 Aug 2026 01:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786670638; cv=none; b=cIfxrwHjJJL+xhZii02kcEiyKxCjpH4cONEqehK/ZLzjyQ9kaDDfjbAaXTqbV5DjvLVHvKFFnlTOsiE5FkzSMpup3ReqbG8PoMlvRP8W25mxBHaIY+OeB56QtYL94/91oxcPosh5WAi4ivMM5ZJ1by755lsQhAzDOBDH7peCsMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786670638; c=relaxed/simple;
	bh=eWDj3kkPBFHQfyTEjMW902qILN3TU2T9Zq2jz1SA9nE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=heN1URvJAhIrKqBNsrHxoOsFOq59wc1pBZGQh/MPFVqRvtIJpuL1aaSIIGBOQLMYErrg+mm7w2EQibnz4SwI6d7BTDzDiY/vQGCh4Ehkn7KF0G9Ne45js4pvw18yPfwzDMOHOjSD0Dz/u0OSohrvFeuQ78vlk4+AvzQA79eskCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com; spf=pass smtp.mailfrom=fastmail.com; dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b=SmQL7wxZ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jAgHIWsW; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b="SmQL7wxZ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jAgHIWsW"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 2F8737A0119;
	Thu, 13 Aug 2026 21:23:55 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 13 Aug 2026 21:23:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1786670635; x=
	1786757035; bh=q7pte3tk23ZD+tvkYa9GrmKRYW53b1N7+AJyYvzvjS4=; b=S
	mQL7wxZSGDr4btt0W7XzJ6rUeImdb0t8r05ZUBCrFHgP+FbrKKEABjrSDsxVyp0y
	atAv26dV/H0pYXsgKk9ZC5Tosg2y3VcnJA0cOAtRfd33lFV/zgsmG39SncoPUINw
	Y8s54j8+McuRiJ/oOZ2/0WJFsjtE1ndL6y00xkXHXU3rFiNB99fSnIW0OsGltXkx
	tJmCJFENY+Xxhq5KaC4kVnq42EyIZeNvmLnAqbONxPdEir5ozW/u4gXZMji4x7Jj
	JKrzJUJRibeiJ/DUakqQK10ZYXtsE3i2eh4VIjCd34dnXxqAzfcMAxPgbNbRNvJq
	QiMp2XYCEOtosUic3Rk2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786670635; x=1786757035; bh=q
	7pte3tk23ZD+tvkYa9GrmKRYW53b1N7+AJyYvzvjS4=; b=jAgHIWsW6xmWLjjw4
	G3NjqQKvwCYDCFHvDJgC6Ruok+u1kNYrSAw+QAAWcfVCPPGrjTCl9pnQz6paxZPz
	mkI16mhAKPGJfKYFGI7oI//GlF9qW7aQcljwMZTqAdeGz6XT+ylJOvWIikRSxsyY
	bl2y/EKU2wN+QGbUFAODINzDZZQSU9ZqDXzVA+wbVhj3UzkireiiLhUUlkspIllH
	3w314lW8169rY/fZez2ljKNLKvScrnY+ipCxLQmwJnp3hO7tegrd9+HaP86B51w3
	i8rEuZk3AUWz/BqZghICs/ca5focp1+Q1gedDWZ6C+rZVfj2+A0c8fWnW3h3gT5/
	lSYsQ==
X-ME-Sender: <xms:Km5-an0aDBe_Deucq7mKL5yInTaJPBfvwdLbKY16AJ2plRvVfsUb9g>
    <xme:Km5-auSloUOHeaGGa5BRMbVyo39qLlg9vj7C_VDPVUjxAvR4t-5Yg_bRvqF4MtntJ
    H01ccL4pmb4N7G3rc3Z-ebv81-FhaJtij2DAlkV7bCuYsZvGbfwkmIi>
X-ME-Received: <xmr:Km5-ajc8iTbjKd6_k65TDNqSRx_UTbfvC-x8-C2oy4oXjG3LHYvWW2u65DWYFgB4xpbCK4MdWPHz2ysMOZfauIKPFS7BdAA>
X-ME-Proxy-Cause: dmFkZTGlnKkc0TwPTb5JNCkAi+5Y8WSjcjjDWnkOIL2wNpUcV13CZto/qOXRm0nqGz7tPy
    KJEebetoFzGPCWAi43zBJPWh3lU6UkLAyBFZ6j4oxxM9R/f/XZ4XCVK2pzL/y7LQGFZvpR
    D/CrmLT9KZ1KsmxXyRJ2t1g6Nt6RO09HBhWhLe5eSw/EkIsnwI9+bk4+c3v7X8vnF67GAZ
    x5aPFmOtLpYkgdaSPCL5jXIqRgeyslKNbDZfP9OeqYyBjk5QInrgyNovvVM3MvStCRC0Vf
    KMYutq9dcLsVOl/YKHQj65USZyVlLayx+Z5CvgQ+ECO90Jd7U6/TgSqqZrFbLu3cB39nWP
    gYleAIr8Fsng95jrIU6TUaHFCATJJLvhBzmxAQ/qL8zZtwKE+6K86PK568VH0lYFgbO0C6
    X0Lp1mFT4nHGOQpCrqD4GfFtuVWcdWUyi/pJ5IRpjm4fTd9qvGDXBo0URff+DHfVZaoSu8
    eV8ty4xIizH+kOaAY1xUinretF69uHjgXBaseGAFlONt1Lh9TEuCLhlTt0gPqOrHRwptUw
    OzUdMJN9td/PikvDRe98MvMk0JN1C7Ta35E9x2/g7sCdhfy83V5AgusOqjItDqLQKtVQIp
    8+MWpwc9SfUFsxdiwSs2wqE285H0Ud5IZriW4qFxtW5VDkQrJywcir4NsJ0w
X-ME-Proxy: <xmx:Km5-aneTtBtgCLDDPS5lA0yQEQy03-KgQJR5XPPPa8iSs3Qq0ThdmA>
    <xmx:Km5-al33YSOhtsB2-8g2ggERlMC2vWup9pPbnbm2uQxhQzeTYb-CmQ>
    <xmx:Km5-an-zlLs4FRhRMYkrjuZ51_DvS2gg-9Xn999XvGKJTxzFb3np4A>
    <xmx:Km5-ai6ic-LL-MARGFw67KDZrU734KF-yq2EB8OrpQlp7Ox9Rv8wgA>
    <xmx:K25-aie0C6paCg6qsdKummp7Z0C1TyuThWyBjrP-vhClZnvXoAJYN9GC>
Feedback-ID: i80b64ba7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Aug 2026 21:23:54 -0400 (EDT)
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
Subject: [PATCH net-next v5 1/6] selftests: net: fix get_refill_ring_size() to use its local variable
Date: Thu, 13 Aug 2026 20:23:43 -0500
Message-ID: <20260814012348.46958-2-juanlu@fastmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260814012348.46958-1-juanlu@fastmail.com>
References: <20260814012348.46958-1-juanlu@fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for multi-threaded rss selftests, fix
get_refill_ring_size() to use its local `size` variable instead of
assigning to the file-global `ring_size`.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Juanlu Herrero <juanlu@fastmail.com>
---
 tools/testing/selftests/drivers/net/hw/iou-zcrx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/hw/iou-zcrx.c b/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
index f6a8fc5fac241..df6b622043438 100644
--- a/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
+++ b/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
@@ -132,10 +132,10 @@ static inline size_t get_refill_ring_size(unsigned int rq_entries)
 {
 	size_t size;
 
-	ring_size = rq_entries * sizeof(struct io_uring_zcrx_rqe);
+	size = rq_entries * sizeof(struct io_uring_zcrx_rqe);
 	/* add space for the header (head/tail/etc.) */
-	ring_size += page_size;
-	return ALIGN_UP(ring_size, page_size);
+	size += page_size;
+	return ALIGN_UP(size, page_size);
 }
 
 static void setup_zcrx(struct io_uring *ring)
-- 
2.53.0-Meta

