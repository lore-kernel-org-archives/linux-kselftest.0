Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2C1396579;
	Wed, 27 May 2026 09:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875409; cv=none; b=gMf6AYxx5zqM+t+jkKuPMrQAX9neI6zFRqJ1LYnO/GUduA0tH24iZWSR1fJ7u2R8q7woNze7Mo7bOAHHRn8MFoFIcFCtU5KGdk2NqrXvB4ltPEK75hBKfOdU5M4CY9iNmazgDIK2kjZjhpRIqZxycAN1+O+woip8xX3t276fv84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875409; c=relaxed/simple;
	bh=3BJceVb1ACQ2xVwyIbgI+DY/F47c8S0oOvHxsICNQlw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Wg0fRM2Ugyni7RYP2Oj6PE0nz+rLfF8k2bdlmbiJkkCVFokS3peFGtsc25T8Chv9KF9u1uwHCBafQsWpdbkDL6bIMwveEA/n72/S+1Rl5LKQw3EwvkdPe90z3lapzwdIShVU1txNRkhig26XhfOIkgOvWP8bcd2Ujknes5hj/3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iBj69lLR; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iBj69lLR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779875408; x=1811411408;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=3BJceVb1ACQ2xVwyIbgI+DY/F47c8S0oOvHxsICNQlw=;
  b=iBj69lLRcUfUuIlyWTQpkN7TuVvoiQkCJbM7iU5MTv9FixAetmf0GT5Y
   K8AwT78zjtxg4PHOO0ZXbt+9E7OmOyYnkcsJq6bYZ6nQK0gi28syGJFxQ
   mwQZsP47e5S2ECXZyYRi0ZyCF9GwK5ZscNO6qHiPgi9sevLjpURYfci5D
   AeMd8Cu2TbL629DdOl0fwXuRue38qTvZ0KFhmymy9EvPliUF8LeEIoNJf
   +0Y+1zsfINTjk3iv5dLsXNK7MWsia36PwywKUMOGxTTUTekPME4zdD+ml
   XBaNyYVYmyAWwc8Mize+ouw5nxWOXZEdGloA0N8je1XvlBuLziQeselHX
   g==;
X-CSE-ConnectionGUID: DLP5JQtCTLOarfoatiOUdQ==
X-CSE-MsgGUID: LmYB/Di+R/SIhZqroPPlJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="92087924"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="92087924"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 02:49:49 -0700
X-CSE-ConnectionGUID: li0ZNRJQSJm8rl/t8OXyTw==
X-CSE-MsgGUID: lb+y84kPRSqMeWicWy10/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="246452510"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.51])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 02:49:45 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 27 May 2026 12:49:41 +0300 (EEST)
To: Reinette Chatre <reinette.chatre@intel.com>
cc: "Chen, Yu C" <yu.c.chen@intel.com>, Tony Luck <tony.luck@intel.com>, 
    x86@kernel.org, Dave Martin <Dave.Martin@arm.com>, 
    James Morse <james.morse@arm.com>, Babu Moger <babu.moger@amd.com>, 
    LKML <linux-kernel@vger.kernel.org>, linux-kselftest@vger.kernel.org, 
    Hongyu Ning <hongyu.ning@linux.intel.com>
Subject: Re: [PATCH] selftests/resctrl: Allow CAT testing when no exclusive
 cache exists
In-Reply-To: <c1c9c019-81b2-4d6f-a2b6-30e63c99efb1@intel.com>
Message-ID: <e3d02cda-4779-89b5-f55b-9411b85a6a6f@linux.intel.com>
References: <20260523101715.3964456-1-yu.c.chen@intel.com> <db89b830-997f-8f74-012c-9aece7fa5c34@linux.intel.com> <09c77f99-0c8f-44c3-8971-aaec094053ca@intel.com> <3fbb001e-bc78-45d6-92fc-4a8dcf708c58@intel.com> <a5473762-fbd8-4aa9-85ae-8bc8108e1d3c@intel.com>
 <c1c9c019-81b2-4d6f-a2b6-30e63c99efb1@intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 26 May 2026, Reinette Chatre wrote:
> On 5/26/26 6:57 PM, Chen, Yu C wrote:
> > My thinking was that shareable_bits only describes portions that may
> > be shared with non-CPU agents, and on an otherwise idle test system
> > the CAT miss-rate trend can still be observed even if all ways are
> > marked shareable. But I agree that this is not a good assumption for
> > kselftest pass/fail.
> > 
> > So I agree that falling back to the full CBM is not the right fix for
> > this test. I will change the patch to skip L3_CAT when no exclusive
> > cache portion is available, with a message explaining that the performance
> > test cannot run reliably because all cache portions are shareable.
> 
> Sounds like https://lore.kernel.org/lkml/20260526024251.7895-1-icheng@nvidia.com/
> does what you need.
> 
> > 
> > For platforms where all cache ways are marked shareable, do you think
> > providing a extra parameter to ask cat_test to "ignore" the share
> > restriction is acceptable?
> 
> While resctrl tests support command line arguments I do not know if they
> are actually being used. During a previous rework we found that they were
> not behaving as intended and we did not receive any complaints. Even if
> somebody uses the hypothetical "ignore" parameter I do not see how the test
> result can be trusted unless this is done as part of some hardware validation
> that resctrl selftests do not aim to support. resctrl selftests are intended to
> test the resctrl kernel subsystem.
> 
> I think effort is better spent on creating an actual CAT functional test.
>
> For reference: https://lore.kernel.org/lkml/20250616082453.3725-1-ilpo.jarvinen@linux.intel.com/

Unfortunately I got stuck with that series as I couldn't figure out how 
to bend the build system to get the msr code out of resctrl selftest 
(I've tried it multiple times). Other than that challenge, I'd have the 
other comments addressed in my local version.

-- 
 i.

