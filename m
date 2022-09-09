Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 577DAECAAD5
	for <linux-kselftest@archiver.kernel.org>; Fri,  9 Sep 2022 05:25:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230215AbiIIFZd (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 9 Sep 2022 01:25:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229765AbiIIFZb (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 9 Sep 2022 01:25:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2486C11B768;
        Thu,  8 Sep 2022 22:25:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B6D7060E73;
        Fri,  9 Sep 2022 05:25:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96C6EC433D6;
        Fri,  9 Sep 2022 05:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1662701127;
        bh=5ucUGip+DuD7iH3WnYKRFd1earxVUc3d4+Vs7Qq1gho=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=T8+KLjZ4ExVBBh2HkIR5lmVDmr+zJwSD3kOC1eOcKi684sRhK/GHAnCBjpnQ0lcZ3
         qvsu4+sRjQZW7DFZAGWE/t3MQOE73jX3htBrZqP0DFs+N63OjMkOEWN/Tp2e15OnYU
         BOHr+DD1q9WRaHIK9K9d8VpskSEJ/W0BTYuistkI=
Date:   Fri, 9 Sep 2022 07:25:24 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Sathyanarayanan Kuppuswamy 
        <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Shuah Khan <shuah@kernel.org>,
        "H . Peter Anvin" <hpa@zytor.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Tony Luck <tony.luck@intel.com>,
        Andi Kleen <ak@linux.intel.com>,
        Kai Huang <kai.huang@intel.com>,
        Wander Lairson Costa <wander@redhat.com>,
        Isaku Yamahata <isaku.yamahata@gmail.com>,
        marcelo.cerri@canonical.com, tim.gardner@canonical.com,
        khalid.elmously@canonical.com, philip.cox@canonical.com,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v12 1/3] x86/tdx: Add TDX Guest attestation interface
 driver
Message-ID: <YxrORIJIyTvFH+0m@kroah.com>
References: <20220908002723.923241-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20220908002723.923241-2-sathyanarayanan.kuppuswamy@linux.intel.com>
 <Yxl+PE4A+WUfQ7bl@kroah.com>
 <49f7bb67-2f4f-8e06-5420-5b279fdf3199@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <49f7bb67-2f4f-8e06-5420-5b279fdf3199@linux.intel.com>
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Thu, Sep 08, 2022 at 04:53:18PM -0700, Sathyanarayanan Kuppuswamy wrote:
> Hi Dave/Greg,
> 
> On 9/7/22 10:31 PM, Greg Kroah-Hartman wrote:
> > On Wed, Sep 07, 2022 at 05:27:20PM -0700, Kuppuswamy Sathyanarayanan wrote:
> >> +	/*
> >> +	 * Per TDX Module 1.0 specification, section titled
> >> +	 * "TDG.MR.REPORT", REPORTDATA length is fixed as
> >> +	 * TDX_REPORTDATA_LEN, TDREPORT length is fixed as
> >> +	 * TDX_REPORT_LEN, and TDREPORT subtype is fixed as
> >> +	 * 0. Also check for valid user pointers.
> >> +	 */
> >> +	if (!req.reportdata || !req.tdreport || req.subtype ||
> >> +		req.rpd_len != TDX_REPORTDATA_LEN ||
> >> +		req.tdr_len != TDX_REPORT_LEN)
> >> +		return -EINVAL;
> > 
> > You never verify that your reserved[7] fields are actually set to 0,
> > which means you can never use them in the future :(
> > 
> > Please fix that up, thanks.
> 
> Would you prefer a new posting (v12.1 or v13) with this change, or do you
> want to continue the review in the same version?

What would you want to see happen if you were a reviewer?

(hint, new version...)
