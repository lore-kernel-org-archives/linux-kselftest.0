Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C17CEC07545
	for <linux-kselftest@archiver.kernel.org>; Tue, 24 Oct 2023 23:23:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344515AbjJXXYA (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 24 Oct 2023 19:24:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344484AbjJXXX7 (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 24 Oct 2023 19:23:59 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 322A8D7A;
        Tue, 24 Oct 2023 16:23:58 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EC18C433C7;
        Tue, 24 Oct 2023 23:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698189837;
        bh=4LWi/VJEYYDswMPq2df7WDZz/rTvtg1tTAZKDHyw/MQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=XnWeDlztLIsos1c47TVUYD8Lr+1keyPM5ndQS3u3tmAhE2ewlfEkWy94vr07Q6d3W
         TiQQLR0nSV6k+V6BudorGi2BVMTPxiR9HEmTvtGRbI5WbroJRxHIaLGcHR7EWLW9mz
         bqajcXZAuQn2OTbPT2VMChPNFMH15vAS0/lolqFECV/8flpZ7UCyWp60Epq+Zn57nm
         ObHVdFTUfMOO58CQ19K/SgTFLbI/xbR6XbSvPqXDIFpWOP7TLtodVk3Jcip25yy7kD
         XLNI861DBHahkhBqkSQcCesFh9cC0YMg6zye1o87c73kI4IqcC+KbIGZ959QnIWnXd
         Kq8ILyqxN5d4A==
Date:   Tue, 24 Oct 2023 16:23:56 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Lucas Karpinski <lkarpins@redhat.com>
Cc:     davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
        shuah@kernel.org, netdev@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/net: give more time to udpgro nat tests
Message-ID: <20231024162356.6caf5cdf@kernel.org>
In-Reply-To: <t7v6mmuobrbucyfpwqbcujtvpa3wxnsrc36cz5rr6kzzrzkwtj@toz6mr4ggnyp>
References: <t7v6mmuobrbucyfpwqbcujtvpa3wxnsrc36cz5rr6kzzrzkwtj@toz6mr4ggnyp>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Mon, 23 Oct 2023 15:50:33 -0400 Lucas Karpinski wrote:
> This is the same issue and the same fix as posted by Adrien Therry.
> Link: https://lore.kernel.org/all/20221101184809.50013-1-athierry@redhat.com/

Let's not let the hacks spread.
We suggested two options in the linked thread.

Another one is to explicitly rendezvous the processes - have both sides
exchange a UDP packet or establish a TCP connection after setting up.
