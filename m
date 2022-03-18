Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AC89C433EF
	for <linux-kselftest@archiver.kernel.org>; Fri, 18 Mar 2022 22:58:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240267AbiCRXAH (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 18 Mar 2022 19:00:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234425AbiCRXAH (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 18 Mar 2022 19:00:07 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C05CE2F24E8;
        Fri, 18 Mar 2022 15:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647644327; x=1679180327;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LbbaspYPErJT3mSySVxKSPe3RfeQio7DfCX3I7KOkTk=;
  b=JsY32BVneJDxUPOa5PfvRpGZLjJlrEjO8ScYYNNMwhwIaGC355MUhTEg
   ZZtPybnCG6g4Sox3XktnaEuCrRucv38IbQELk233S1137WYqyRharvHrs
   NoC9CdBp7ek8tsYxJMhR6he1uldPIImwP72tGLEljFUOaxycS0JZlr+pW
   12tHwtC+9qSh8sHtr6wy+gCyk7nbRNnqTWxNoHRk6gaUbQa5dKvsNmXau
   gkw9UwYwKUt+ZcIaBOz9M352CvaHkkISATKjaDw2jrnvdkPK1VokydTEu
   wydb+DuzVkpg9Dlq1X21K0vfg0h4zkSQuLhLoyoKPmQ/Kr/n7D/FY/LnX
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10290"; a="320451455"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; 
   d="scan'208";a="320451455"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2022 15:58:37 -0700
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; 
   d="scan'208";a="691483000"
Received: from otcwcpicx3.sc.intel.com ([172.25.55.73])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2022 15:58:37 -0700
Date:   Fri, 18 Mar 2022 15:58:32 -0700
From:   Fenghua Yu <fenghua.yu@intel.com>
To:     Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Cc:     Reinette Chatre <reinette.chatre@intel.com>,
        Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v6 6/6] selftests/resctrl: Add missing SPDX license to
 Makefile
Message-ID: <YjUOmNEPuEKHEFE1@otcwcpicx3.sc.intel.com>
References: <20220318075807.2921063-1-tan.shaopeng@jp.fujitsu.com>
 <20220318075807.2921063-7-tan.shaopeng@jp.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220318075807.2921063-7-tan.shaopeng@jp.fujitsu.com>
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Fri, Mar 18, 2022 at 04:58:07PM +0900, Shaopeng Tan wrote:
> Add the missing SPDX(SPDX-License-Identifier) license header to
> tools/testing/selftests/resctrl/Makefile.
> 
> Signed-off-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> ---
>  tools/testing/selftests/resctrl/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tools/testing/selftests/resctrl/Makefile b/tools/testing/selftests/resctrl/Makefile
> index bee5fa8f1ac9..73d53257df42 100644
> --- a/tools/testing/selftests/resctrl/Makefile
> +++ b/tools/testing/selftests/resctrl/Makefile
> @@ -1,3 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
>  CFLAGS = -g -Wall -O2 -D_FORTIFY_SOURCE=2
>  CFLAGS += $(KHDR_INCLUDES)
>  
> -- 
> 2.27.0
> 
Reviewed-by: Fenghua Yu <fenghua.yu@intel.com>

Thanks.

-Fenghua
