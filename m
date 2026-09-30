Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAE04E4C54;
	Wed, 30 Sep 2026 13:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790774228; cv=none; b=pGkj4xcPS1dOjPNExyaK6TH46BzSbN4oksBwrVZA7O7GFIU00/WNkg6yhUraCEHCMtmHWX8Cp+SWjQyWzH08hUJ738mNFcUArkggNhMZXxA/arGHTvK3PaU3A/AaRqYNpGau5qO7UU/1/e/8lXajwm0OsQAH+gvPqLznmgEcNys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790774228; c=relaxed/simple;
	bh=A8T4a/mfhiFsucHpODbOYsLbG9eosKfMo045cl5ebMM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tksixm5ArJEhKfiQlvbuNYMkyAhuw8MEiyvs+fBx2i8mQs+F5RuUxP8iI7jNyOFNmDD0fJhXhrupyhMo3Duo2x+PUzcqKs5VOnaeVMnIMQCSeQwb59hN7VEjjYqt52plQDG09cdFuqVBMKQOFmkYlFNu3DiUoPEkE12L+WY1V7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=osW01QS+; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="osW01QS+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=A8
	T4a/mfhiFsucHpODbOYsLbG9eosKfMo045cl5ebMM=; b=osW01QS+cfy8/YuBKL
	kmXeI1ayfv9PPhuH1123l+i3gJ77FhhIrZS4W2+QsCb9M4n4UmZw2TI9vaufiGGh
	kLHKgWihxHg0AqO+8PNJ4X/hMGhTHZMnt3OkYpsPk3ZqMC9pBvh5saZagf9JrrC/
	cS+ZJ75126DKRDSF9N2pomVkw=
Received: from deepin (unknown [])
	by gzsmtp2 (Coremail) with UTF8SMTPA id Ms8vCgD3d9OoCL1q8Mb4AA--.37954S2;
	Wed, 30 Sep 2026 21:03:38 +0800 (CST)
From: Ziran Zhang <zhangcoder@yeah.net>
To: David Gow <david@davidgow.net>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	Ziran Zhang <zhangcoder@yeah.net>
Subject: Re: [PATCH v3 2/2] list: add KUnit test for list_cut_before() empty list case
Date: Wed, 30 Sep 2026 21:03:15 +0800
Message-ID: <20260930130315.10195-1-zhangcoder@yeah.net>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260918081026.8050-3-zhangcoder@yeah.net>
References: <20260918081026.8050-3-zhangcoder@yeah.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:Ms8vCgD3d9OoCL1q8Mb4AA--.37954S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUUUUUUU
X-CM-SenderInfo: x2kd0wpfrgv2o61htxgoqh3/1tbiOAo29mq9CKrGbQAA3s

Hi David,

Patch 2 touches lib/tests/list-test.c, which you maintain. It adds a
KUnit test case for the empty-list path in list_cut_before().

Andy has given Reviewed-by for patch 1. Could you review/ack the KUnit
test part? I'll hold off sending the series to Andrew until I hear back
from you.

Patch 2: https://lore.kernel.org/all/20260918081026.8050-3-zhangcoder@yeah.net/

Thanks,
Ziran Zhang

