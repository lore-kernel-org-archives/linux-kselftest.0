Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62EC0C4332F
	for <linux-kselftest@archiver.kernel.org>; Mon, 25 Apr 2022 09:50:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232941AbiDYJxQ (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 25 Apr 2022 05:53:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240932AbiDYJxH (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 25 Apr 2022 05:53:07 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C2313E0E6;
        Mon, 25 Apr 2022 02:50:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1766CB811AC;
        Mon, 25 Apr 2022 09:50:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47DA8C385A4;
        Mon, 25 Apr 2022 09:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650880199;
        bh=JVAQ5gkZLZo+XCl0pVA/MBO5F3Pm37Lwl9hXUsz8POE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VAhDmXHjAjyEI/jK26+pTYrdu8hM2U+KkH3A/lbw+Ujyr8l/p79A90CbRlWGDZM6K
         w5t75jowt+GT28CqVur/4tXWIcP74tbZRx79bXdkE6RW/l8/0cpWmGJsNYs6MSi1B5
         nJcUjpt6DtngZ/oeJ2k/7cEqngkmrN+68P5Nggef/Ec4+8yp/886JhffwTesnOfYy9
         +qlYRBviuwEWgCO49DPGYfN9zf7hleRKoeiZ0Aiwr9XehXIQ60ENRcpgAmHmh8gywL
         2qtnJLx49RESBFqwaZbWOpsgR89nDDHMk3kbxy34onHot0dzJ3rTGrkMsWpXrs1shv
         PV4ADAqkrbt7g==
Date:   Mon, 25 Apr 2022 11:49:55 +0200
From:   Christian Brauner <brauner@kernel.org>
To:     Karthik Alapati <mail@karthek.com>
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Carlos Llamas <cmllamas@google.com>,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/binderfs: Improve message to provide more info
Message-ID: <20220425094955.ti3hw7asp6h5funn@wittgenstein>
References: <YmOSQv2U8+Hs5WjP@karthik-strix-linux.karthek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YmOSQv2U8+Hs5WjP@karthik-strix-linux.karthek.com>
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Sat, Apr 23, 2022 at 11:14:34AM +0530, Karthik Alapati wrote:
> Currently the binderfs test says what failure it encountered
> without saying why it may occurred when it fails to mount
> binderfs. So, Warn about enabling CONFIG_ANDROID_BINDERFS in the
> running kernel.
> 
> Signed-off-by: Karthik Alapati <mail@karthek.com>
> ---

Reviewed-by: Christian Brauner (Microsoft) <brauner@kernel.org>
