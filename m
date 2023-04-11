Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A34AC77B6F
	for <linux-kselftest@archiver.kernel.org>; Tue, 11 Apr 2023 17:49:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229559AbjDKRtE (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 11 Apr 2023 13:49:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbjDKRtD (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 11 Apr 2023 13:49:03 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AAC15FE9;
        Tue, 11 Apr 2023 10:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681235326; x=1712771326;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iQhxwfRHGfIqnpTM08p5PQZGf+6VrwuYGXLl5AIo4mo=;
  b=CKIwzvTMa3R214spSU7k+D6T4aoLEA9cKlx8zb1VhuvbCu05rgjZxuep
   5chi7ORIwbj1C142M6vAbErKWQza7qI4ODsXhn01Tb9Xxdr+kOCKT6VKN
   sgQOoFROsrqzT7QIPLBArOpctNIlpGA0TBrrChf2riVquWq7ZGpuuOGFG
   HriPfR95dduBY6Azz3YX3wSWQga8XVL0NOIDGjD27jjdSnxv0mvFBkdlT
   +pocxB4NV1jxlyyAF9ufzxoVEPzzR7tW3qUWcg/aBTU0zhv42F1mMC5wc
   iJoNsL83wRyDNQPeVC2mkGdQ61pd0lZaGkr8bu3X+UwF4B2QqY1zu15Sb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="323319087"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="323319087"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 10:48:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="638914128"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="638914128"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 11 Apr 2023 10:48:43 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pmI6k-00FTV4-0g;
        Tue, 11 Apr 2023 20:48:42 +0300
Date:   Tue, 11 Apr 2023 20:48:41 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     linux-gpio@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Bamvor Jian Zhang <bamv2005@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v1 2/2] selftests: gpio: gpio-sim: Use same variable name
 for sysfs pathname
Message-ID: <ZDWdeeuz713ZXI79@smile.fi.intel.com>
References: <20230411171521.29678-1-andriy.shevchenko@linux.intel.com>
 <20230411171521.29678-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230411171521.29678-2-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Tue, Apr 11, 2023 at 08:15:21PM +0300, Andy Shevchenko wrote:
> SYSFS_PATH can be used locally and globally, especially that has
> the same content.

This may behave differently from shell to shell, the minimum of bash, zsh,
and ash would be good to test.

-- 
With Best Regards,
Andy Shevchenko


