Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1207C433F5
	for <linux-kselftest@archiver.kernel.org>; Thu, 10 Mar 2022 17:24:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244970AbiCJRZN (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 10 Mar 2022 12:25:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245033AbiCJRYo (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 10 Mar 2022 12:24:44 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 558DEA1BD9;
        Thu, 10 Mar 2022 09:22:57 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: usama.anjum)
        with ESMTPSA id E857B1F45971
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1646932976;
        bh=gPXPrWidsGQRlCs43HiJv+Myai4ltXWpHwdDjvCSozc=;
        h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
        b=D7KCtz+d1XXtvDJdwx+LFJMyD4WugzaH3HDWVgQ5/nziZJN3vshphGhKShizooNq8
         ZZqSlJDbZTViL6fzWiS+818qlsKwYUA027FjZe/FPKnLWk9Drdf5zOYKGalVQwrTru
         UBC3Ed5ITYvDTmQVs5Dezo7YkBJMmZSlFLDw40mfOlVFGWh/y3+9OK9/oarUdO/xEa
         10aFlyepIEFKfq9cE9+LmgZwIvbzEtUNSRI+DOfWE0KrFIBQvB5PWxmln3ZxPvZEw0
         novVsGgc7qzNFJ+u1hlJdi9SM4vj1MpsFvfsGg5yJJld6nGbtCUtvR3dweRdu7yXvf
         Y7NFdhYELRAhQ==
Message-ID: <76529762-1a36-142d-0aa9-beb5fa2bb27b@collabora.com>
Date:   Thu, 10 Mar 2022 22:22:51 +0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Cc:     usama.anjum@collabora.com, Shuah Khan <shuah@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel@collabora.com, kernelci@groups.io,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] selftests/lkdtm: add config
Content-Language: en-US
To:     Kees Cook <keescook@chromium.org>
References: <20220217205620.2512094-1-usama.anjum@collabora.com>
 <20220217205620.2512094-2-usama.anjum@collabora.com>
 <202203091123.33E89F5@keescook>
From:   Muhammad Usama Anjum <usama.anjum@collabora.com>
In-Reply-To: <202203091123.33E89F5@keescook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On 3/10/22 12:23 AM, Kees Cook wrote:
> On Fri, Feb 18, 2022 at 01:56:20AM +0500, Muhammad Usama Anjum wrote:
>> Add config option which is needed for SLAB_LINEAR_OVERFLOW test. It
>> needs KASAN enabled.
> 
> I'd prefer this use the SLAB_DEBUG options -- KASAN is very heavy.
I'll test it out and update in the next patch version.

-- 
Muhammad Usama Anjum
