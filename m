Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F01265606;
	Thu, 26 Mar 2026 04:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774499868; cv=none; b=o7O/Pw0MtD0J1G9xl2k4TWETBRXPbl3cHYFRydKH3LKdDvyTS/zgHOitDVuh1KIaGzO2Bys/swQ6Q7KWo4NguiE/fVhCdDLglKW/w3vy2zRDUpKZaQiFUma1Pomi4ON/OHbm5cLArKUNk8Q+Qi+IWjTn3WIjC7qHgRE8Nzv6CkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774499868; c=relaxed/simple;
	bh=EKBVa6H9Yoa0ztHMiaiViKLgxZ5Bp37At5/ilDcf5pw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cIUBMQMo76iGK/PTuuWQ2s+fHb6ZKKW8MNtm6YEvvB1sKdj9ryN7RYyynFX8qlV09sdw72B2fQ7ZeYS78LBuhYo5KJpyPG+wiBgSB8cihAXP9jSxm/y/eY83peh7fdmvAhPwTd30ZCoV+MX/F0gWOHne0kbmhUP53MgFGrjDOQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EAdAQDMR; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EAdAQDMR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774499867; x=1806035867;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=EKBVa6H9Yoa0ztHMiaiViKLgxZ5Bp37At5/ilDcf5pw=;
  b=EAdAQDMR3NjwTe37CexmFYjNqGRICAlWkJRe6XCe3NzbKySn90mE6RRw
   PxoKpAe4A1KCvfo1/Qln4gl3SJbufd2QPb9OoaeOM9z0Y56Rx2RiFiyxq
   7lNtE3B4tv1Ncf+CASUdSoVphh8JUKJPPZuCYwuE/bnxQ1AszDUkycg8p
   gq/B7HMiTbZgr6xSmnZX0OMCNS6e4Aoed6wXcfgQu11Hr/tLnd5D6rf4y
   TPTiZLHq5BRAF5Gn/PsiwVpei348nMzq5I7deH/GdVZR2dmipe3D7Zd0K
   zfWto411k8u/7UUVX4JtNj8koVsMZ96UcyeBg3cm5iKtsEc9vLkpgAno4
   w==;
X-CSE-ConnectionGUID: 46xPg+RLToecbSYgvdFT8A==
X-CSE-MsgGUID: 3c4YoCQgT72HL/hwNwWh4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="63101383"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="63101383"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 21:37:45 -0700
X-CSE-ConnectionGUID: DueW0qEeSLGmqh12suCVBw==
X-CSE-MsgGUID: FSvZLreCSXCAfKDN0xSvGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="224074764"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 21:37:42 -0700
Date: Thu, 26 Mar 2026 12:37:38 +0800
From: "Lai, Yi" <yi1.lai@intel.com>
To: Xin Li <xin@zytor.com>
Cc: Gleixner Thomas <tglx@kernel.org>, Molnar Ingo <mingo@redhat.com>,
	Petkov Borislav <bp@alien8.de>,
	Hansen Dave <dave.hansen@linux.intel.com>,
	Cooper Andrew <andrew.cooper3@citrix.com>, x86@kernel.org,
	hpa@zytor.com, Khan Shuah <shuah@kernel.org>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	yi1.lai@linux.intel.com
Subject: Re: [PATCH v2] selftests/x86: Fix sysret_rip assertion failure on
 FRED systems
Message-ID: <acS4Eo4OyCMGb1Fw@ly-workstation>
References: <20260324085102.688490-1-yi1.lai@intel.com>
 <911DB9B1-921E-4871-A9DD-BEC85F4B8320@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <911DB9B1-921E-4871-A9DD-BEC85F4B8320@zytor.com>

On Tue, Mar 24, 2026 at 09:14:19AM -0700, Xin Li wrote:
> 
> 
> > On Mar 24, 2026, at 2:04 AM, Yi Lai <yi1.lai@intel.com> wrote:
> > 
> > +static bool is_fred_enabled(void)
> 
> Move it to a public header? we may use it in other tests.

Will do. Thank you for the comment.

