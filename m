Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEA09C001E0
	for <linux-kselftest@archiver.kernel.org>; Mon, 23 Oct 2023 14:19:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229578AbjJWOTK (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 23 Oct 2023 10:19:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230266AbjJWOTK (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 23 Oct 2023 10:19:10 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6DE1D68;
        Mon, 23 Oct 2023 07:19:07 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEEF6C433C9;
        Mon, 23 Oct 2023 14:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698070747;
        bh=wLIy1aefQ4yhPBXOUHP6N6N5h16eUxi70U54zf14d2A=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=jSECD4wASSCL7oY68tn8qcx6oln6oYy1ZxEnvAJI1xnZESdsiwCidSTRatyXtnMZT
         npKxW0s+xXT1+Tqb4bTUgby0ZxrDZ5AVzLm+09XTOC1iXc0Q80hzQ0ve3IWS3/2X98
         v98oSgjiUN1nsLi73bn/6M97Ynw25ryU3HVhv1jNx8GA4l4e4aWXbfaCrRImVk+BG/
         U5p7YhpQ8SXIB1z8ti+C/9jE5WWSW6frwXxZGWL/ymHqNPh0OHjYr7du/IruudxXjs
         Ye6HCZefSYBT+6uW3ZVXWHTXhCmdBDJsm8q5FSVDDZUp5FShLMrt5sGrBhNa35MOi5
         lNZ+xLIamUQSA==
Message-ID: <f22a0a5b-2813-4c59-9d30-af9f87a2f5aa@kernel.org>
Date:   Mon, 23 Oct 2023 08:19:06 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests:net change ifconfig with ip command
Content-Language: en-US
To:     Jiri Pirko <jiri@resnulli.us>, David Ahern <dsahern@kernel.org>
Cc:     Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, shuah@kernel.org, netdev@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20231022113148.2682-1-swarupkotikalapudi@gmail.com>
 <fde654ce-e4b6-449c-94a9-eeaad1eed6b7@kernel.org>
 <ZTYc04N9VK7EarHY@nanopsycho>
From:   David Ahern <dsahern@kernel.org>
In-Reply-To: <ZTYc04N9VK7EarHY@nanopsycho>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On 10/23/23 1:12 AM, Jiri Pirko wrote:
>> ip addr add ...
> 
> Why not "address" then? :)

no objection from me.

> What's wrong with "a"?

1-letter commands can be ambiguous. Test scripts should be clear and
obvious.


