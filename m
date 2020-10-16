Return-Path: <SRS0=amRC=DX=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 946D3C43457
	for <linux-kselftest@archiver.kernel.org>; Fri, 16 Oct 2020 11:02:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 463CF2084C
	for <linux-kselftest@archiver.kernel.org>; Fri, 16 Oct 2020 11:02:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406663AbgJPLCu (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 16 Oct 2020 07:02:50 -0400
Received: from mga01.intel.com ([192.55.52.88]:62194 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404974AbgJPLCs (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 16 Oct 2020 07:02:48 -0400
IronPort-SDR: e/xQHlQ8ja4o8VLHLDkxxPDG75Fhl26jK+k1RcxpI4SZBzJ/ExQf2QNDA7LcIX4kYW10/XQZbA
 HASz5qBPEo3w==
X-IronPort-AV: E=McAfee;i="6000,8403,9775"; a="184141570"
X-IronPort-AV: E=Sophos;i="5.77,382,1596524400"; 
   d="scan'208";a="184141570"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2020 04:02:44 -0700
IronPort-SDR: bWYn6iBl3xrzvMrKlpBR4JCXTpuJmM2+z0c/5xaD5PTiNc/qbb3wBcb0sYkrInKGO0O8sEIH+I
 Lzpkmld5qOKQ==
X-IronPort-AV: E=Sophos;i="5.77,382,1596524400"; 
   d="scan'208";a="314861494"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2020 04:02:42 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kTNWS-008BXo-Mg; Fri, 16 Oct 2020 14:03:44 +0300
Date:   Fri, 16 Oct 2020 14:03:44 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     linux-kselftest@vger.kernel.org,
        Brendan Higgins <brendanhiggins@google.com>,
        kunit-dev@googlegroups.com, Shuah Khan <skhan@linuxfoundation.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: Re: [PATCH v2 2/3] lib/linear_ranges_kunit: Follow new file name
 convention for KUnit tests
Message-ID: <20201016110344.GJ4077@smile.fi.intel.com>
References: <20201015184416.38999-1-andriy.shevchenko@linux.intel.com>
 <20201015184416.38999-2-andriy.shevchenko@linux.intel.com>
 <20201016103841.GA5274@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201016103841.GA5274@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Fri, Oct 16, 2020 at 11:38:41AM +0100, Mark Brown wrote:
> On Thu, Oct 15, 2020 at 09:44:15PM +0300, Andy Shevchenko wrote:
> > Follow new file name convention for the KUnit tests.
> > Since we have lib/*test*.c in a few variations,
> > use 'kunit' suffix to distinguish usual test cases
> > with KUnit-based ones.
> 
> I'm missing the rest of this series - what's the story with dependencies
> here?

There is a dependency in Makefile. Do you want me to send a new version with
Cc'ing you all?

-- 
With Best Regards,
Andy Shevchenko


