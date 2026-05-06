Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE9D25A2B5;
	Wed,  6 May 2026 08:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778055408; cv=none; b=tToeNCLKGziQ6Tv3bBI9W4myZcS90hpg26S8NPRy6v6E27diughT6oZlJfjmRp5tPhVbNxU/LA7TTQi3HaD+IrPJdzA2oKKCHBNvJheTpZwL2OSKAiRxDKIsC+4SvJdWnbTFfNPp8Gfig/O+jsSTWlPWHah/YgoOJ/6A2QNnjPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778055408; c=relaxed/simple;
	bh=NCNNyNpPk0K3+XgcIaeUBdZWrabivq0krWZutyXJVp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q8vGJknjBQTlKk1wCcOV9Jj+qQI/X31eEwoHk+OfQ9IkIf+owaJ+OV0fnlbth2opQbdwRL3Uhr9r2fyEkKkGxO/YAZ8QkK00iSQLVV8pWNIJVaHBaaKxSEQ54m50YENg3qexQIjT2L0WT8MVkomNjaWESHVF/NgYkrDgzM85Es4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AadYe4PJ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AadYe4PJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778055406; x=1809591406;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NCNNyNpPk0K3+XgcIaeUBdZWrabivq0krWZutyXJVp0=;
  b=AadYe4PJBnhUydVZHECav4WHmAFc0LyxAtJoA8A+3yMEqL/OUuSfID8j
   LWvn5DlrizQbgnyjWSgbVGqb3mTblLy61XiwZiqwpan2lVFXoRXGiEGjM
   3eyjYwbh6S3IrRSQfDxF/qwHrjXNfSLd5X4la5cme2SaXMOXz1GjLr15g
   RrrDIbyNgZFMCuFaUDAaFMEbZWlMQOsa8Ogv21HcANy0or+k/SIxzU6lX
   v7pkuwhs2r8pTdGqydBcTz1pNQRbbiPEczYHXN+30wY70jnthIPYzWAT/
   Fx0a0a9blE6XPdXbPI60R3IW7RJ66ApXng5bnOlRRbHJLEF3idI1x0Skc
   g==;
X-CSE-ConnectionGUID: AA9CXVO2QFmlX0TBqc1+7Q==
X-CSE-MsgGUID: aGx5o453TA+pIiCyAosYKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78984965"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="78984965"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 01:16:45 -0700
X-CSE-ConnectionGUID: NxtYpZ15TXqKC9AZyIcvUw==
X-CSE-MsgGUID: uSOnlEW2TMu8GydP9Yz6iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="266428886"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 01:16:44 -0700
Date: Wed, 6 May 2026 16:16:40 +0800
From: "Lai, Yi" <yi1.lai@intel.com>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: brauner@kernel.org, shuah@kernel.org, areber@redhat.com,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	yi1.lai@linux.intel.com
Subject: Re: [PATCH] selftests/clone3: Fix capability dropping by using
 standard libcap API
Message-ID: <afr46ClR+mm7cAGV@ly-workstation>
References: <20260310031415.151531-1-yi1.lai@intel.com>
 <b098d65a-bb67-4399-87e6-3fc5a2f086a1@linuxfoundation.org>
 <acxw3gZcmX8Hmiuh@ly-workstation>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acxw3gZcmX8Hmiuh@ly-workstation>

On Wed, Apr 01, 2026 at 09:11:59AM +0800, Lai, Yi wrote:
> On Tue, Mar 31, 2026 at 02:10:09PM -0600, Shuah Khan wrote:
> > On 3/9/26 21:14, Yi Lai wrote:
> > > The clone3_cap_checkpoint_restore.c selftest defined its own 'struct
> > > libcap' to manually cast and manipulate the internal memory layout of
> > > the opaque 'cap_t' type.
> > > 
> > > Starting with libcap v2.60 (commit aca076443591 "Make cap_t operations
> > > thread safe"), a '__u8 mutex' was added to the beginning of the internal
> > > 'struct _cap_struct'. This structural shift breaks the selftest's custom
> > > struct layout assumptions, causing capability corruption and leading to
> > > failures during test execution.
> > > 
> > > Fix this by removing the custom struct definition and use the standard
> > > cap_set_flag() API.
> > 
> > What king of failures are you seeing? Can you send the failures from
> > the run?
> > 
> 
> I can reproduce the failure on CentOS Stream 10 with libcap 2.69:
> 
> TAP version 13
> 1..1
> # Starting 1 tests from 1 test cases.
> #  RUN           global.clone3_cap_checkpoint_restore ...
> # clone3() syscall supported
> # clone3_cap_checkpoint_restore.c:151:clone3_cap_checkpoint_restore:Child has PID 10647
> cap_set_proc: Operation not permitted
> # clone3_cap_checkpoint_restore.c:160:clone3_cap_checkpoint_restore:Expected set_capability() (-1) == 0 (0)
> # clone3_cap_checkpoint_restore.c:161:clone3_cap_checkpoint_restore:Could not set CAP_CHECKPOINT_RESTORE
> # clone3_cap_checkpoint_restore: Test terminated by assertion
> #          FAIL  global.clone3_cap_checkpoint_restore
> not ok 1 global.clone3_cap_checkpoint_restore
> # FAILED: 0 / 1 tests passed.
> # Totals: pass:0 fail:1 xfail:0 xpass:0 skip:0 error:0
> 
> After applying the proposed fix patch that uses standard libcap APIs,
> the test passes in my test environment. It also passes on CentOS Stream
> 9 with libcap 2.48 (<2.60).
>

Hi Shuah,

Do you have concerns in terms of this fix? Please let me know if any
suggestions.

Thank you,
Yi Lai
 
> Regards,
> Yi Lai
> 
> > > 
> > > Fixes: 1d27a0be16d6 ("selftests: add clone3() CAP_CHECKPOINT_RESTORE test")
> > > Signed-off-by: Yi Lai <yi1.lai@intel.com>
> > > ---
> > 
> > thanks,
> > -- Shuah
