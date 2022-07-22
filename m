Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BA03C43334
	for <linux-kselftest@archiver.kernel.org>; Fri, 22 Jul 2022 18:52:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236437AbiGVSwc (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 22 Jul 2022 14:52:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232098AbiGVSwa (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 22 Jul 2022 14:52:30 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A8DA15717;
        Fri, 22 Jul 2022 11:52:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CF6C6615B1;
        Fri, 22 Jul 2022 18:52:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99D11C341C6;
        Fri, 22 Jul 2022 18:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658515949;
        bh=uiTw0wKPq/jzdb0N0fMrtXtSdd1S16S94ztt5XtscTM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=RVjGBAVZSy6D45dSNeY2SF7+UhlZ1neRaym4VSM2BD19uIHHRsb1f/dbUT2XAAzBD
         uGDl0UqymLzIsQTLHQ0pMPZR0C3XfVAcRwdoI3a7rdS0MZUvtPIJ19ufxp3nUvNnC4
         gMom2IfjvAKnMCEGD+fUHkjLBbVQfAv832D8KHHvZV9nzdLD1+3E2t3nRsJo89sS6I
         FFPPVPb9hRvriulWruhYGp1xlSyIn8i7BsJH2M7AoAh/VZ4w3+fvpBHD3/y4/VtUdp
         T2hoVJOonQkXfO6vveYeVmnarrySMBRqy413ajdRm3f68kQHtzdY4HvU8JiAId6fl2
         PW/qBkCLrvKew==
Date:   Fri, 22 Jul 2022 11:52:27 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Slark Xiao <slark_xiao@163.com>
Cc:     tglx@linutronix.de, mingo@redhat.com, shuah@kernel.org,
        davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
        peterz@infradead.org, dvhart@infradead.org, dave@stgolabs.net,
        andrealmeid@igalia.com, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH] selftests: Fix typo 'the the' in comment
Message-ID: <20220722115227.624aa650@kernel.org>
In-Reply-To: <20220722104259.83599-1-slark_xiao@163.com>
References: <20220722104259.83599-1-slark_xiao@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Fri, 22 Jul 2022 18:42:59 +0800 Slark Xiao wrote:
> Replace 'the the' with 'the' in the comment.
> 
> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> ---
>  .../futex/functional/futex_requeue_pi_signal_restart.c          | 2 +-
>  tools/testing/selftests/net/forwarding/vxlan_asymmetric.sh      | 2 +-

You need to split this by the subsystem.
