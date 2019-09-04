Return-Path: <SRS0=jgWI=W7=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19F07C3A5A7
	for <linux-kselftest@archiver.kernel.org>; Wed,  4 Sep 2019 11:48:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EC0E922DBF
	for <linux-kselftest@archiver.kernel.org>; Wed,  4 Sep 2019 11:48:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727156AbfIDLsG (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Wed, 4 Sep 2019 07:48:06 -0400
Received: from foss.arm.com ([217.140.110.172]:52630 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726943AbfIDLsG (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Wed, 4 Sep 2019 07:48:06 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B231337;
        Wed,  4 Sep 2019 04:48:06 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 43A983F246;
        Wed,  4 Sep 2019 04:48:05 -0700 (PDT)
Date:   Wed, 4 Sep 2019 12:48:03 +0100
From:   Dave Martin <Dave.Martin@arm.com>
To:     Cristian Marussi <cristian.marussi@arm.com>
Cc:     linux-kselftest@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, shuah@kernel.org,
        amit.kachhap@arm.com, andreyknvl@google.com
Subject: Re: [PATCH v5 03/11] kselftest: arm64:
 mangle_pstate_invalid_daif_bits
Message-ID: <20190904114803.GT27757@arm.com>
References: <20190902112932.36129-1-cristian.marussi@arm.com>
 <20190902112932.36129-4-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190902112932.36129-4-cristian.marussi@arm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Mon, Sep 02, 2019 at 12:29:24pm +0100, Cristian Marussi wrote:
> Add a simple mangle testcase which messes with the ucontext_t from within
> the signal handler, trying to set PSTATE DAIF bits to an invalid value
> (masking everything). Expects SIGSEGV on test PASS.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Reviewed-by: Dave Martin <Dave.Martin@arm.com>

> ---
> v3 --> v4
> - fixed commit message
> - added testcase comment description
> ---
>  .../mangle_pstate_invalid_daif_bits.c         | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 tools/testing/selftests/arm64/signal/testcases/mangle_pstate_invalid_daif_bits.c
> 
> diff --git a/tools/testing/selftests/arm64/signal/testcases/mangle_pstate_invalid_daif_bits.c b/tools/testing/selftests/arm64/signal/testcases/mangle_pstate_invalid_daif_bits.c
> new file mode 100644
> index 000000000000..434b82597007
> --- /dev/null
> +++ b/tools/testing/selftests/arm64/signal/testcases/mangle_pstate_invalid_daif_bits.c
> @@ -0,0 +1,35 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2019 ARM Limited
> + *
> + * Try to mangle the ucontext from inside a signal handler, mangling the
> + * DAIF bits in an illegal manner: this attempt must be spotted by Kernel
> + * and the test case is expected to be terminated via SEGV.
> + *
> + */
> +
> +#include "test_signals_utils.h"
> +#include "testcases.h"
> +
> +static int mangle_invalid_pstate_run(struct tdescr *td, siginfo_t *si,
> +				     ucontext_t *uc)
> +{
> +	ASSERT_GOOD_CONTEXT(uc);
> +
> +	/*
> +	 * This config should trigger a SIGSEGV by Kernel when it checks
> +	 * the sigframe consistency in valid_user_regs() routine.
> +	 */
> +	uc->uc_mcontext.pstate |= PSR_D_BIT | PSR_A_BIT | PSR_I_BIT | PSR_F_BIT;
> +
> +	return 1;
> +}
> +
> +struct tdescr tde = {
> +		.sanity_disabled = true,
> +		.name = "MANGLE_PSTATE_INVALID_DAIF_BITS",
> +		.descr = "Mangling uc_mcontext with INVALID DAIF_BITS",
> +		.sig_trig = SIGUSR1,
> +		.sig_ok = SIGSEGV,
> +		.run = mangle_invalid_pstate_run,
> +};
> -- 
> 2.17.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
