Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA79410D20
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 16:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774543193; cv=none; b=lYxJORdIfOduqH1Don7t3Uw91ofa6n6yxSgDxLNfe3yqkRqCjqZLLXfcVlNTUgoKRpHJPC3t9er4KIAH4Q35wVslqJJonLFrPBG/Fb2Vaopa/hT0fLKRgeHjJO81WTjgmfxsHXAlApiSa85JE6IFY1SzQUdxn2QX7SKEArRJHdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774543193; c=relaxed/simple;
	bh=sqnbr9cNssI9b+W5NEejwmZoDUUzKMDtWMQnZN/3ZrY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HasFLfqpAZYM+l5d6vsXX42slvR8XU4LP+5zqjSktbw4Prck2UUoj/zQQKgDWMEbVYB2+wUs9vEzQbnuOT9BhuWpUJZvSL/TMOIryaSWOAPyCg6ArKcGNOuWGJ9NlzeJGGf38dwvo8aO06aw4xlRS2WokdUhAZqtiMLs7KHYQyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=iFZ9f4ux; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="iFZ9f4ux"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-50b3488fb31so28805611cf.1
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 09:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1774543190; x=1775147990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8NveMeYJyXR51CooSgOWz6j3nuc+FLl/9rhH+hQCzaw=;
        b=iFZ9f4ux2D2zKYNvFia/3a17ufD2ELnPo+nsR95pySHOaRiEjF3W7b5B4YDJ0XMJTn
         wKWD1mnMxQjXbdR7C6kxo+C+pSJE4GMmJY4OEs+YVgXn5GpEIaAe3HgoAZAj9iPUijec
         yH+I23ZWEhdFYUJAnz4GD7TrpZXFFVwCkfD8GuDMTcrHrMVtEDO75i50bNCt0srwUHb5
         ok2Z8CA6ZkIVbDplOuThedgugLhtt8LC8L8ogTVyGaapHpD+ZrFOogGNx0V6nLaucqcV
         e+w561/KgCtrEf9GkPHiHYv0Syo4l0ijs7WiUcJ4ohlau5ZPv2MDcAPpS3d+pPIh647r
         QADw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774543190; x=1775147990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8NveMeYJyXR51CooSgOWz6j3nuc+FLl/9rhH+hQCzaw=;
        b=MQrKNETVMlSwOEtyRxsDGUfdivjQiTJz6s++fR41YqnyadE+0Ly12D6rFXyaY1ReMU
         u4yOm7sGiC7aGHwc9fKsgV7LSVVW4+6KaudwXKf1rAcd+pjYJaal2ZNaD9+l2gMoBc6Q
         WZeiwI5YzQXg6o/fUCXh4IInozpOgH24W+XtU1+wnsUvDKTcn1G1RBpXU0Zn7hZo3u1h
         92PAmjxAxFGeW2D+Z8VUW2xzqOJh11fXjm/YisuqxTW/0o5fzCnog3/v1Yuuw6Bni9fZ
         2Yej0X4BVE7fSVFpFVMhr4VYnoihuGmBaupLtxCfji75AFWvXH9/466RpyltO6QquNor
         wzzA==
X-Gm-Message-State: AOJu0YwUzjND62YTxI+ffQrjglpKBGPv8a0IlC1QIaOtHt2d809JKSxQ
	eDtrl+RA/Obha7lpB1cp9wYSegi04ITlI+XcJ259Uj1SvMtClLbwK+jdcN052l1kRkf0b8AlH4S
	xE4sI
X-Gm-Gg: ATEYQzzsO28HVRV9dHW3+aR6GOD+dtdrByB/Cwv5I3FBxHBAoag4nUE0F++0rMAD6BJ
	QoVnyPbVo6VXWmWJZ2BF829czS9ZhiYJwS6OmcmPi11QmPzRq3wafpSuRdu97SelSHtCwyDwrmB
	gU23mPCDgP11L//u24Tl3KsMpVmMD+wXSqLBOS8w4lkBxGAlRiRcLxQ0AoRbkgnKt2ehSzSwRiC
	bTMWxAeX+OQsBbGK3EKQXXZTqlfV2A3Zz005sVM84rJJuA14CYm4kAfpIxtiBn57DDXa0ZvQBQI
	eRY2uDF9/BDATbkiOhQjaYGUaQTLMJ9u7h1CtOpnLWaAGOvhxsvKNZjKvmELRlSeqTU/LuEy4zp
	a52pyjEZ2byWQ7UZeKjoVvwSR2aV0nMxWbwfPbdFr6r4ds0GmJ7qiZb3KFuCBx4gcg4Eukn98kC
	dOI3P2eXfH7sQP9SCuvblrFLBecF9DewvcBNGBXS83YYsj6XFxO1Hz9T7D2lf/vJO3tg==
X-Received: by 2002:ac8:58d4:0:b0:509:1ad4:6309 with SMTP id d75a77b69052e-50b9951400emr25921331cf.32.1774543187273;
        Thu, 26 Mar 2026 09:39:47 -0700 (PDT)
Received: from plex.localdomain ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b920f77cfsm28238251cf.6.2026.03.26.09.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 09:39:46 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	pratyush@kernel.org,
	skhawaja@google.com
Subject: [PATCH v4 2/3] memfd: implement get_id for memfd_luo
Date: Thu, 26 Mar 2026 16:39:42 +0000
Message-ID: <20260326163943.574070-3-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326163943.574070-1-pasha.tatashin@soleen.com>
References: <20260326163943.574070-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Memfds are identified by their underlying inode. Implement get_id
for memfd_luo to return the inode pointer. This prevents the same
memfd from being managed twice by LUO if the same inode is pointed
by multiple file objects.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 mm/memfd_luo.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/mm/memfd_luo.c b/mm/memfd_luo.c
index b8edb9f981d7..6629ab4d8e30 100644
--- a/mm/memfd_luo.c
+++ b/mm/memfd_luo.c
@@ -529,6 +529,11 @@ static bool memfd_luo_can_preserve(struct liveupdate_file_handler *handler,
 	return shmem_file(file) && !inode->i_nlink;
 }
 
+static unsigned long memfd_luo_get_id(struct file *file)
+{
+	return (unsigned long)file_inode(file);
+}
+
 static const struct liveupdate_file_ops memfd_luo_file_ops = {
 	.freeze = memfd_luo_freeze,
 	.finish = memfd_luo_finish,
@@ -536,6 +541,7 @@ static const struct liveupdate_file_ops memfd_luo_file_ops = {
 	.preserve = memfd_luo_preserve,
 	.unpreserve = memfd_luo_unpreserve,
 	.can_preserve = memfd_luo_can_preserve,
+	.get_id = memfd_luo_get_id,
 	.owner = THIS_MODULE,
 };
 
-- 
2.43.0

