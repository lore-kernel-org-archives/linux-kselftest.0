Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865C0346FA0;
	Mon, 31 Aug 2026 07:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788161463; cv=none; b=i2nN2ENOAV4Rm+yNlNHWi0l6jr7EqYxLxaTkvxvPxVLdnXRSio0poyOdO9dTsuNsBNlAhHwOw0iNhp3iBGkIg3fW8Ew2RP9LZFKVVV9VSydmAizgTSqLMJ/escPpKreZnNCSh1v3U6Z9aJlYn+Y/cY20THkaAWKp+Pv5yJlR0Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788161463; c=relaxed/simple;
	bh=LxROX8yRUEcQCmDq6l/uEnJPDL4kyl3S5E0pF1vzYC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=idBxtgn5eX4uJuCq1nkT9fREToiD5M5THuGUWZPsviNI6pvVS9UmE7BLgPZ1eeai4hHeS/onIeuc1/SjNbf3dR+636ncDKTGOK1dlyQ9JhYkvSfQTN3uYqCLGwXG6lU6JlCUE7ZQB8dB0vkNTOQGltMNXF47az/zOUVy0gOy7Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G+NT7Y/p; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G+NT7Y/p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788161461; x=1819697461;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LxROX8yRUEcQCmDq6l/uEnJPDL4kyl3S5E0pF1vzYC0=;
  b=G+NT7Y/p+pq83hYPEvEYq+QKUb6s3sBdYMnooL53lIXJ1szRMhPmx9sa
   c+52i1nzkOxbV0t8+YwRw62+wqypNUtGEczYc4rD84/YcRNPIWXzH2v8X
   gufJSQodL6mO31Wb4hgUL2bbEou8e1g1Jnnzcn9I48FilV9ebP9rDzx5s
   BsZcdcFV2X5gs97jIDmme/Xj4Giyo5/V5K7pAnXuPzHNE66+0dBwQ3ODH
   tZJjy5vLfZT0UBal+uBsaYDnJf7Hz7QPe+JqoCo2t8bNZ4bGYSYBrd800
   sSYCSydCKZxw12NmGHfhuHowyRYq8bCYVNCD4l3eirD0sA4QDuERhHN9u
   A==;
X-CSE-ConnectionGUID: /SsjS32fSg+34d3GNIvj2g==
X-CSE-MsgGUID: 0wFOEM5NSWOqAaJRWU4+jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="99160639"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="99160639"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 00:30:56 -0700
X-CSE-ConnectionGUID: cBeaKBDpSqCXX1VlrAfAMg==
X-CSE-MsgGUID: QwMNJT9QSzitQvKpw1lk5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="272514950"
Received: from junjie-desk-dev.bj.intel.com (HELO junjie-desk-dev.tail2c02c1.ts.net) ([10.238.152.71])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 00:30:52 -0700
From: Junjie Cao <junjie.cao@intel.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	horms@kernel.org,
	jhs@mojatatu.com,
	jiri@resnulli.us,
	vinicius.gomes@intel.com,
	shuah@kernel.org,
	bestswngs@gmail.com,
	uladzislau.zhauniarovich@gmail.com,
	hdanton@sina.com,
	syzbot+19d01f6082ec61dd45b2@syzkaller.appspotmail.com,
	syzbot+8785aaf121cfb2141e0d@syzkaller.appspotmail.com,
	syzbot+2642f347f7309b4880dc@syzkaller.appspotmail.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net v2 2/3] net/sched: taprio: enforce a minimum interval for software schedules
Date: Mon, 31 Aug 2026 15:30:46 +0800
Message-ID: <20260831073046.409848-1-junjie.cao@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824185337.2704003-1-kuba@kernel.org>
References: <20260824185337.2704003-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 24 Aug 2026 11:53:37 -0700, Jakub Kicinski <kuba@kernel.org> wrote:
> Since the change carries a Fixes: tag it will be picked up for stable, so
> working 802.1Qbv configurations would stop loading after a stable update.

Dropped in v3. With 1/3 fixed, an interval below the expiry cost only
burns CPU on bounded back-to-back expiries, and syzbot already confirmed
1/3 alone on a fourth bucket (link in my 1/3 reply). I'll re-test the
other three the same way before v3.

> Was flooring the rearm interval at runtime in advance_sched() considered as
[...]

Yes, [1] in the cover letter. On top of 1/3 it would only cap the expiry
rate for schedules already below the service cost, with one more
constant to pick. Can do as a follow-up if you want that.
