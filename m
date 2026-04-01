Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9531991CB;
	Wed,  1 Apr 2026 01:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775005928; cv=none; b=Vm/fuyWmLqB6bhu9gmuhPZAaWrOohKd0qQDrJznkPS6ILr2nt+JWLsoWBl7lvu5g1Em/O7E3WZk3FsY5j4GLa/LCNBNPiSHGabxkhvUwJpqAQ+6Z2E1J8o64lum109Eu+I19zYfHTleiKqy2It1msq1+zsyS0FwAAILF5yXTTF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775005928; c=relaxed/simple;
	bh=TcBCyXx/bxrQNvQ7d2lJlDlmlHvgc6pYGr37ptCyNlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nGtq5SWvYNn+UKLjkfkzxOpvDa6g8rgYapAV5yBoaJziQIS8NQcgHLbt+S9e3ANAzykImX8vQICemKbbyHpgVLs5+7X+HUeEPC/2FrxXQaNP4eD0Z7eUn600ajj6hoJoIUwlJ7oBX6GtjaVVOTtu9tbY6GSX0t1PdZfE5MyqfCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=erTkxrwx; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="erTkxrwx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775005926; x=1806541926;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TcBCyXx/bxrQNvQ7d2lJlDlmlHvgc6pYGr37ptCyNlY=;
  b=erTkxrwxOjS26qdfaR6T4wCiHSa3QCUBJ2oHlQmV5rj0jPVYzAhDHBBS
   lwTUUki1boVkovKwnB4py8ppWzgUt9K8Ph4VRkqZWh3aTlQHfDgC69gnM
   AF+no4qP3YUA/XKy4bxghekCof1G/72MsHil25ouHDisoCYh0RPNwgcmO
   lF282gn0dWHXivNSxGCjnAg2TOWCRok6ONPI/3zqgugEiA8gFK7LwAwsK
   9ODu6iSvGg+hkk27VNNM0xoDtKoMpq7jMK2y1r73ESJbh9qRkNGIOt3sh
   PfQKlMf/kJCHygTBa7bdXHRxXwnOy4uDXSNP7hktgC6SNPJnjKh+yrSCF
   A==;
X-CSE-ConnectionGUID: YUEtK6GLQCCCaqGhSo2cYA==
X-CSE-MsgGUID: E73Rl+Y2QvqIYij0ahdsIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="78628718"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="78628718"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 18:12:05 -0700
X-CSE-ConnectionGUID: 6mj7mPNuQgyn6+enEWc3XQ==
X-CSE-MsgGUID: gn6QdPMhSsK9Kn2CAXDtQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="230951841"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 18:12:02 -0700
Date: Wed, 1 Apr 2026 09:11:59 +0800
From: "Lai, Yi" <yi1.lai@intel.com>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: brauner@kernel.org, shuah@kernel.org, areber@redhat.com,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	yi1.lai@linux.intel.com
Subject: Re: [PATCH] selftests/clone3: Fix capability dropping by using
 standard libcap API
Message-ID: <acxw3gZcmX8Hmiuh@ly-workstation>
References: <20260310031415.151531-1-yi1.lai@intel.com>
 <b098d65a-bb67-4399-87e6-3fc5a2f086a1@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b098d65a-bb67-4399-87e6-3fc5a2f086a1@linuxfoundation.org>

On Tue, Mar 31, 2026 at 02:10:09PM -0600, Shuah Khan wrote:
> On 3/9/26 21:14, Yi Lai wrote:
> > The clone3_cap_checkpoint_restore.c selftest defined its own 'struct
> > libcap' to manually cast and manipulate the internal memory layout of
> > the opaque 'cap_t' type.
> > 
> > Starting with libcap v2.60 (commit aca076443591 "Make cap_t operations
> > thread safe"), a '__u8 mutex' was added to the beginning of the internal
> > 'struct _cap_struct'. This structural shift breaks the selftest's custom
> > struct layout assumptions, causing capability corruption and leading to
> > failures during test execution.
> > 
> > Fix this by removing the custom struct definition and use the standard
> > cap_set_flag() API.
> 
> What king of failures are you seeing? Can you send the failures from
> the run?
> 

I can reproduce the failure on CentOS Stream 10 with libcap 2.69:

TAP version 13
1..1
# Starting 1 tests from 1 test cases.
#  RUN           global.clone3_cap_checkpoint_restore ...
# clone3() syscall supported
# clone3_cap_checkpoint_restore.c:151:clone3_cap_checkpoint_restore:Child has PID 10647
cap_set_proc: Operation not permitted
# clone3_cap_checkpoint_restore.c:160:clone3_cap_checkpoint_restore:Expected set_capability() (-1) == 0 (0)
# clone3_cap_checkpoint_restore.c:161:clone3_cap_checkpoint_restore:Could not set CAP_CHECKPOINT_RESTORE
# clone3_cap_checkpoint_restore: Test terminated by assertion
#          FAIL  global.clone3_cap_checkpoint_restore
not ok 1 global.clone3_cap_checkpoint_restore
# FAILED: 0 / 1 tests passed.
# Totals: pass:0 fail:1 xfail:0 xpass:0 skip:0 error:0

After applying the proposed fix patch that uses standard libcap APIs,
the test passes in my test environment. It also passes on CentOS Stream
9 with libcap 2.48 (<2.60).

Regards,
Yi Lai

> > 
> > Fixes: 1d27a0be16d6 ("selftests: add clone3() CAP_CHECKPOINT_RESTORE test")
> > Signed-off-by: Yi Lai <yi1.lai@intel.com>
> > ---
> 
> thanks,
> -- Shuah
