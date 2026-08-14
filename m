Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806331DDC1B;
	Fri, 14 Aug 2026 01:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786670640; cv=none; b=JfdyssIoWn8JMIjUw3KBqytvw0M3DnQAy3yrAcp0q/eJS8pI0+MhrkaLIDwYfmBzWSC22y7E140ro2t49QA7oHKR20HMeBnHycxWHuweHpkDmvGLxdjoryt6NZCIf8k2uGQ0Au78m8f4jsfPfhjq4iPPFeBP8oFx/EPkMk9QR6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786670640; c=relaxed/simple;
	bh=UmyFBuNz5X5Hyy0U3LR+Mq37vswOtP3oWtdCOBjjgA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g9AjLzWtfizF3tZllHhzJYic6fw/bYVV3YILCvX3tjywCEiE+EbC1rKt0R8KCuiebMV7PP1sYqBldNjAeM0QxG3CFkH6R5IQF2A7/E8xxMBd8WVOdckUsD5/nlt1E+YtI8kdFAO6QC4jXaYXeSllufgC7TBD366V9t+7pjSmOeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com; spf=pass smtp.mailfrom=fastmail.com; dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b=XjG1jDQA; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=iwFtbyGO; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b="XjG1jDQA";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="iwFtbyGO"
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 806AB7A03A8;
	Thu, 13 Aug 2026 21:23:56 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Thu, 13 Aug 2026 21:23:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1786670636; x=
	1786757036; bh=ufTrcvY/DK0DEwSsselNdijiTnLcHUJsYKTgG4UIkBE=; b=X
	jG1jDQAapb8lRL98xXgzehk/KaX149O89btrYUzuZIxgoltPZcsG+OBg3+QvOxNy
	lkY8sSv5iOZ/sghKSgXLP3K1SR3NpzOAEVZQFfRkIAvab50bJqci2l415jXuIpLa
	WCjkJuGxWdRjZW9+VggLyDnUmjWY69M2F9in6TZERRGabpyxpCi/PBV2Ud/Se5Vl
	zXOK/lV7MfvtwjRJ9EdRJ/KJDVn09cigsynnriN1Ydk6/fNzvL+/JEDw689xZvxP
	4L7K4Fj3WCtfCxhNYuRWBzoP1lmkKgX/q6m+efqagtf6rPr4OSJZ3xPFOPrpc4OB
	YRgEmYeVVaN9blqYJCReg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786670636; x=1786757036; bh=u
	fTrcvY/DK0DEwSsselNdijiTnLcHUJsYKTgG4UIkBE=; b=iwFtbyGOYPjotaIh0
	ZXNkpuGilBrmL/6KquiESMky1NYBa284IC+f4iCGkuCM6lljRxdJgGGij28WWUI7
	4uJPs/+9hZQYyQSpljwEVlakEjONYglBanwfaglfkNSjupiHuBPcE3QEjlhrDmOv
	qLqlSJ9b1FNn9+awxf0YyQkcNRq5xxJtKWTNoC46uwGxpmNYVelvAvhVTmo3ZIhM
	XP7IeN/QmkrfBlvSUSt9TfL1c66nJId6Bw/TOHV774JH2D5G8rBvTbJDe2Ep7L8B
	EnYloKlWHcg+JAcBaWmBD+UU9h0QRleeweYNA6uJ9poW/bBbS3fTQyaj0MCG30yA
	XVidw==
X-ME-Sender: <xms:LG5-aoCyZf3C8CE-ZiH3YQ-ieeFCwiVdY227mzrN6vv0DShfaz2twQ>
    <xme:LG5-aisRHpO8m-3P668A48pqjRiECcZxa2AOq6S1grO9EWRpv12PogeL38OVxgZXk
    h3VzFogEsBa3d3GX9FOJvls7WI7Dp71_hvP8Zu0CuQ5Y-IYnqNuF0I>
X-ME-Received: <xmr:LG5-anKzWE6rq1eXHnQSHpsTR19tWAUUoaP5ZC5WxzW_LOABehRmTjd2jJal00-Mveb6oVWGEn9Sinrfi2NdoWD0GHXYkZI>
X-ME-Proxy-Cause: dmFkZTGo0I8vV6iwJjg6+n5OzY/NHD8n+wMxypil3f3+Fyb5+CaBlVpsyMYRFyR6Cj6Peb
    3MudDlo3h3kwtiPZdPtAF2Nmtt5ogGSeh7VxMmddczBOsDqJrVnbTg0lx0d69qc28z6c0W
    w/6SX5Qx9K+rMdBL+YDnsSPFR3HaoWxkwpevo+tqEiVnZloNDsM5SPUtv78Y52JK6yTnuW
    4lWon23r25Gl9NuJVyMvrtP6HzMnLd56THO4PC7uAIyd4skiuTlFBhdzYMaCcFId/QoZCQ
    TgT6xHUpaZW7TeTykfRc/hBvm2JXGIofdMoKI8YJLA1XzV3vHWrZUayF8q4k/3GYrWRmXh
    CN5Hc+04HbJhAp0wD5LoOfA+ooIERXK6dhj4ulqm1A6jfjq5E1xusnGWQtFL0Kqj2qqXYl
    DfZLnXzISWAkOFhJdRV2gx7X6UgDgvUcLL/BPvK25GXDH1Ju23ATeJAqpFh1IhDa+m+9r9
    yAodt6XpbMbuEcFk8zWU/hgPSWjaHdV6PI6n5Q0eg0k+4lmpk+X6qu/RyfDk+BaRCLb4cT
    rtMc2Qq9CTzRB5P+xN4Mu9u32wLGzm0dKBYNkCvCUc5pau0XNo04AU2RP3tyW1qzRUhcW8
    V3p8z2STM84GQLSeAnbkUeo0hi8T9qmtzLqXupQx5t/8E/wcc09CaI3cfYTw
X-ME-Proxy: <xmx:LG5-apZZjbh4mUGcVR1YeBa_vyfn9JTtlA7oyoNGqHvFQeu-1nd_1w>
    <xmx:LG5-apAsQjSjllk7lpGSx7a9hdyZZHalECdeCUYazA_j-M_K69-OfA>
    <xmx:LG5-ajYs259lXzbin6-x0IdfHZuzoBPrTaDTLBFh6ILzftSSNyDcaw>
    <xmx:LG5-ahlynV8RDKhPCE7GoLsY75xmKKNiL_Sor2sgKlPBW9B3mhldfA>
    <xmx:LG5-apKbw4b8tmw_aNKgOPpmaKeX5M8MFjCZE2IbwIDAwgiUcETAKXih>
Feedback-ID: i80b64ba7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Aug 2026 21:23:55 -0400 (EDT)
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
Subject: [PATCH net-next v5 2/6] selftests: net: remove unused variable in process_recvzc()
Date: Thu, 13 Aug 2026 20:23:44 -0500
Message-ID: <20260814012348.46958-3-juanlu@fastmail.com>
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

Remove the unused `sqe` variable in preparation for the multiqueue rss
selftest changes to process_recvzc() in the following commits.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Juanlu Herrero <juanlu@fastmail.com>
---
 tools/testing/selftests/drivers/net/hw/iou-zcrx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/drivers/net/hw/iou-zcrx.c b/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
index df6b622043438..c6dbd0ad53681 100644
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
2.53.0-Meta

