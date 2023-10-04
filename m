Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED0FEE7C4E2
	for <linux-kselftest@archiver.kernel.org>; Wed,  4 Oct 2023 16:49:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233386AbjJDQtN (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Wed, 4 Oct 2023 12:49:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233112AbjJDQtN (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Wed, 4 Oct 2023 12:49:13 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A4AE95;
        Wed,  4 Oct 2023 09:49:10 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70C4DC433C7;
        Wed,  4 Oct 2023 16:49:07 +0000 (UTC)
Date:   Wed, 4 Oct 2023 17:49:04 +0100
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Joey Gouly <joey.gouly@arm.com>
Cc:     linux-arm-kernel@lists.infradead.org, nd@arm.com,
        akpm@linux-foundation.org, aneesh.kumar@linux.ibm.com,
        dave.hansen@linux.intel.com, maz@kernel.org,
        oliver.upton@linux.dev, shuah@kernel.org, will@kernel.org,
        kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
        linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v1 05/20] arm64: context switch POR_EL0 register
Message-ID: <ZR2XgLsihUJHRePO@arm.com>
References: <20230927140123.5283-1-joey.gouly@arm.com>
 <20230927140123.5283-6-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230927140123.5283-6-joey.gouly@arm.com>
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Wed, Sep 27, 2023 at 03:01:08PM +0100, Joey Gouly wrote:
> +static void permission_overlay_switch(struct task_struct *next)
> +{
> +	if (alternative_has_cap_unlikely(ARM64_HAS_S1POE)) {
> +		current->thread.por_el0 = read_sysreg_s(SYS_POR_EL0);
> +		write_sysreg_s(next->thread.por_el0, SYS_POR_EL0);
> +	}
> +}

Does this need an ISB or is the POR_EL0 register write
self-synchronising?

-- 
Catalin
