Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE4B9C4361B
	for <linux-kselftest@archiver.kernel.org>; Tue, 15 Dec 2020 01:52:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A2F8224D2
	for <linux-kselftest@archiver.kernel.org>; Tue, 15 Dec 2020 01:52:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725836AbgLOBvy (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 14 Dec 2020 20:51:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:55454 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725440AbgLOBvp (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 14 Dec 2020 20:51:45 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607997065;
        bh=lZS21qcirNYQ972+Lnv3Q0WTHOc91vwghIwgZ77ykzE=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=B3L2I2xxD7oAIHxQL9skOb8IipCL0Bj8qOaFUBXuRJziqrHPay/8blfD74ThGed7r
         HSyPOlX6PQBmcsL+fOM05cfUYC29m3TL8L9dkzAbqO7Zl48j1mr2rQ7rffRMViIUJ6
         WelS2PLzFKsZmVtthBxoqmSKvIYIgvgSn7pF/akj/Wj88WJz5adi5Taoy6KMK4+Awt
         Vb/bKuvbrgKHmEGPoI7h8Kt2t1JjTciwr/rXdSV4v3xBmeqWLwee58i6fk4tbna/jT
         eLiCBRXDTGc/LFkG5VRiDBpJOIWZM+gTo/nF1prYULA/v65k4NFFjO9gPY5rcE24db
         jVxAFFdmMgtRw==
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCHv2] selftests: test_vxlan_under_vrf: mute unnecessary error
 message
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <160799706502.8846.11590672248653028347.git-patchwork-notify@kernel.org>
Date:   Tue, 15 Dec 2020 01:51:05 +0000
References: <20201211042420.16411-1-po-hsu.lin@canonical.com>
In-Reply-To: <20201211042420.16411-1-po-hsu.lin@canonical.com>
To:     Po-Hsu Lin <po-hsu.lin@canonical.com>
Cc:     netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org, davem@davemloft.net, kuba@kernel.org,
        shuah@kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Hello:

This patch was applied to bpf/bpf-next.git (refs/heads/master):

On Fri, 11 Dec 2020 12:24:20 +0800 you wrote:
> The cleanup function in this script that tries to delete hv-1 / hv-2
> vm-1 / vm-2 netns will generate some uncessary error messages:
> 
> Cannot remove namespace file "/run/netns/hv-2": No such file or directory
> Cannot remove namespace file "/run/netns/vm-1": No such file or directory
> Cannot remove namespace file "/run/netns/vm-2": No such file or directory
> 
> [...]

Here is the summary with links:
  - [PATCHv2] selftests: test_vxlan_under_vrf: mute unnecessary error message
    https://git.kernel.org/bpf/bpf-next/c/0e12c0271887

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


