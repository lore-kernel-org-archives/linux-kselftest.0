Return-Path: <SRS0=yo5U=5R=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F08BEC43331
	for <linux-kselftest@archiver.kernel.org>; Wed,  1 Apr 2020 03:37:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9FF7720776
	for <linux-kselftest@archiver.kernel.org>; Wed,  1 Apr 2020 03:37:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="bwEQGMbb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731589AbgDADhg (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 31 Mar 2020 23:37:36 -0400
Received: from ozlabs.org ([203.11.71.1]:36033 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731554AbgDADhg (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 31 Mar 2020 23:37:36 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48sX2P44kRz9sPF;
        Wed,  1 Apr 2020 14:37:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1585712253;
        bh=67EUNvcwDnTByTJa6D9p17NeqFs9S6BMU3vJ1BaQew0=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=bwEQGMbbZOsaGu3z2Z0eGw2pC+YxaflIMg0kulI501D4cqM97HYqG+yJfEvPaEJb2
         bw7Sg8SQz0jDzfmwftlqj76yTh3u22F1HPdsuqZtgmuRbiyVVx9OSOM6jAN9P8Z+VE
         QKRUvcwpFEoaQFoE2Vih6hAfrdzbR9+7+hykkN4WXUAxsvPVE6aLDrlGAhhcE8B40x
         F/+4z8nCR6tW+OPk4ofXIAdva9sYBk7uA3VAhKnFh4FWgK96ytiMEW7gtKiMgwBHPT
         PkxB+t9lfVL/L4suUAAk2s2va9RNzyuuVuf3GbVsCBV2RxEx90jkiyA2njOBmR7Z91
         9JdvA2prTEZaQ==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Shuah Khan <skhan@linuxfoundation.org>,
        Sandipan Das <sandipan@linux.ibm.com>, shuah@kernel.org,
        linux-kselftest@vger.kernel.org
Cc:     linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
        mhiramat@kernel.org, aneesh.kumar@linux.ibm.com,
        kamalesh@linux.vnet.ibm.com, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 0/2] selftests: vm: Build fixes for powerpc64
In-Reply-To: <4837525c-c078-0e33-614e-103514946ff9@linuxfoundation.org>
References: <cover.1580367152.git.sandipan@linux.ibm.com> <4837525c-c078-0e33-614e-103514946ff9@linuxfoundation.org>
Date:   Wed, 01 Apr 2020 14:37:40 +1100
Message-ID: <87a73vvptn.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Shuah Khan <skhan@linuxfoundation.org> writes:
> On 1/30/20 12:01 AM, Sandipan Das wrote:
>> The second patch was already posted independently but because
>> of the changes in the first patch, the second one now depends
>> on it. Hence posting it now as a part of this series.
>> 
>> The last version (v2) of the second patch can be found at:
>> https://patchwork.ozlabs.org/patch/1225969/
>> 
>> Sandipan Das (2):
>>    selftests: vm: Do not override definition of ARCH
>>    selftests: vm: Fix 64-bit test builds for powerpc64le
>> 
>>   tools/testing/selftests/vm/Makefile    | 4 ++--
>>   tools/testing/selftests/vm/run_vmtests | 2 +-
>>   2 files changed, 3 insertions(+), 3 deletions(-)
>> 
>
> Michael,
>
> I see your tested-by on these two patches. I will take these
> through kselftest fixes.

Thanks.

cheers
