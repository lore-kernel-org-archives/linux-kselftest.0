Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9045153BE9;
	Mon, 26 Jan 2026 06:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769409169; cv=none; b=NViMne1C/UyUZpnEqjRBLl1Ouiu3Q3bFpXBL7aCB8TAzxYt4w6JH2a+0OI6L5vDZQ0oqnWlHBhcDXg4oC+lxcAdatmqQIdsUAw7b0OdRJvqybsUO0H3Uf77HLi8VqUR3WHgJtQbIklJmwC3YZ0zyboA852nCaJx0Mbu/I2XW0j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769409169; c=relaxed/simple;
	bh=ca3CvIEq2pCmha0u3/zyo2pS3/FM1U0+Ak6O9gy0/+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TASZsxFv2488Hk1+cdYVoqXhz3eowZapqQ6TXNlzYJDD4ajbn1uIsSgbgCj1JXBgqbx5R8+PNnhjnzHnv2QYLHZPmg72xm4yptFWOfBSYWdKUC40J9YwmD1SeXz8UDmobE+VFcnfUdU/hTsue1HAsrhcEt2LOB/qCwGkj6JTTB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g469qg2C; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g469qg2C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769409167; x=1800945167;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ca3CvIEq2pCmha0u3/zyo2pS3/FM1U0+Ak6O9gy0/+8=;
  b=g469qg2CfIN6R3YJDOJf5qrcCHGL7xIJbVb0hBXG6LuyFyOmL8IKWWNa
   fVCAFTHYws9NYpXEaWyBR5cM01ryz3h8xJYf7in5wuZndzlDnD7IYe1pN
   E8Etf519yYrH0p/tG5y8ZtyQZORZLN7zJY3cNGDvXCDRMquJOW86sw+cD
   MD7j9YZHdensapfbLIwn7v64FNCPKmztYuG5IMcZuOQPEH4xuXC8CC9vN
   JopvXrIsMlMnQ8FyVyJBgNEfc9pBU2w3KDsBRNInrLhZ1VDRHrzoYa22g
   AsDK6nf++3cyh5NCw+JKngVpKhO91t0gi7bekoRkc/VThr5125ui94JcD
   g==;
X-CSE-ConnectionGUID: TDbJTqjHSgOazqIaaQDD8Q==
X-CSE-MsgGUID: ozbbFh1vT+KcAtB7+INiHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="70641981"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="70641981"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 22:32:45 -0800
X-CSE-ConnectionGUID: vQ1jSQGOQF609MuJhIP1sA==
X-CSE-MsgGUID: uIdHXltVSl+z8gqGt1JoEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="245214201"
Received: from junjie-nuc14rvs.bj.intel.com ([10.238.152.25])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 22:32:44 -0800
From: Junjie Cao <junjie.cao@intel.com>
To: Shuah Khan <shuah@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] selftests: ptp: use KSFT_SKIP exit code for skip scenarios
Date: Mon, 26 Jan 2026 14:32:36 +0800
Message-ID: <20260126063236.16267-1-junjie.cao@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126061532.12532-1-junjie.cao@intel.com>
References: <20260126061532.12532-1-junjie.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Apologies - this is actually v1, not v2. The version was set incorrectly during local work. Let me know if you'd prefer a resend.
