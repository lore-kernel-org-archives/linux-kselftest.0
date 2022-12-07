Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 941BEC63705
	for <linux-kselftest@archiver.kernel.org>; Thu,  8 Dec 2022 00:06:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230228AbiLHAGK (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Wed, 7 Dec 2022 19:06:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230237AbiLHAGJ (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Wed, 7 Dec 2022 19:06:09 -0500
X-Greylist: delayed 544 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 07 Dec 2022 16:06:08 PST
Received: from out-247.mta0.migadu.com (out-247.mta0.migadu.com [91.218.175.247])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8D1F813A7
        for <linux-kselftest@vger.kernel.org>; Wed,  7 Dec 2022 16:06:08 -0800 (PST)
Date:   Wed, 7 Dec 2022 23:56:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1670457420;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=qhIDkNMWFrw/BML2Cf6mgZzatycSfUupNCdq7V2NZos=;
        b=HY/h51zVycRcdzDUCbof89MlN7kXyAU/yP5TMyU/lDpo22Zsbhk4m07HUlJcGgLvkJZRuT
        dnCIhswOvG+6aBUJZjZpBj6GW3k6gPWAgy3Sx6sgU0O1Mx2JzoAXpnrU+WgXwKtoYSpZFJ
        6PAe0dxx/BTffdNTRlRNW3m43RV1JmU=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Oliver Upton <oliver.upton@linux.dev>
To:     Sean Christopherson <seanjc@google.com>
Cc:     Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Shuah Khan <shuah@kernel.org>,
        Andrew Jones <andrew.jones@linux.dev>,
        Peter Gonda <pgonda@google.com>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
        kvm@vger.kernel.org, kvmarm@lists.linux.dev,
        Ricardo Koller <ricarkol@google.com>,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] KVM: selftests: Allocate ucall pool from
 MEM_REGION_DATA
Message-ID: <Y5EoR9U/TjdtksHK@google.com>
References: <20221207214809.489070-1-oliver.upton@linux.dev>
 <20221207214809.489070-5-oliver.upton@linux.dev>
 <Y5ElcibE2CubONgm@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y5ElcibE2CubONgm@google.com>
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Wed, Dec 07, 2022 at 11:44:50PM +0000, Sean Christopherson wrote:
> On Wed, Dec 07, 2022, Oliver Upton wrote:
> > MEM_REGION_TEST_DATA is meant to hold data explicitly used by a
> > selftest, not implicit allocations due to the selftests infrastructure.
> > Allocate the ucall pool from MEM_REGION_DATA much like the rest of the
> > selftests library allocations.
> > 
> > Fixes: 426729b2cf2e ("KVM: selftests: Add ucall pool based implementation")
> 
> Not that it really matters because no one will backport this verbatim, but this
> is the wrong commit to blame.  As of commit 426729b2cf2e, MEM_REGION_DATA does not
> exist.  And similarly, the common ucall code didn't exist when Ricardo's series
> introduced MEM_REGION_DATA.
> 
>   $ git show 426729b2cf2e:tools/testing/selftests/kvm/include/kvm_util_base.h | grep MEM_REGION_DATA
>   $ git show 290c5b54012b7:tools/testing/selftests/kvm/lib/ucall_common.c
>   fatal: path 'tools/testing/selftests/kvm/lib/ucall_common.c' exists on disk, but not in '290c5b54012b7'
> 
> The commit where the two collided is:
> 
> Fixes: cc7544101eec ("Merge tag 'kvmarm-6.2' of https://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into HEAD")

Yeah, this Fixes is garbage, apologies.

I imagine Paolo is going to squash some things into the kvmarm merge, so
the Fixes tag ought to be dropped altogether.

> > Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
> > ---
> 
> Fixes nit aside,
> 
> Reviewed-by: Sean Christopherson <seanjc@google.com>

Thanks!

--
Best,
Oliver
