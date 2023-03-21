Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99791C6FD1C
	for <linux-kselftest@archiver.kernel.org>; Tue, 21 Mar 2023 02:59:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229940AbjCUC7K (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 20 Mar 2023 22:59:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbjCUC7J (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 20 Mar 2023 22:59:09 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B7A72CFDF;
        Mon, 20 Mar 2023 19:59:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D48A5B8122D;
        Tue, 21 Mar 2023 02:59:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B1CCC433EF;
        Tue, 21 Mar 2023 02:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679367545;
        bh=eGZ12823VjR8FESNPxbdNPJs2pRSqBnSdBM4rZllz9k=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=eTfOIVrTzMIupl5JsKTcTbXxjSvOFYihLyKQRgbNQJmkBISNBYW/4zTmrUopoFotq
         GxWq+mtKXg9VjRbzCyWQNvcMrMs8KNXWaomOnT/8f2tUeM+YBZbXJEDKsMUUy7xbNC
         HIBV0EYl1BgQV5X6AJfNdxf0xsOqZ0qHqjvqRWRC3kdtmWwByAPYtSKd32nPB/oykv
         UAELWWBWgyCSaCtfFkT8lhuA/HN2kr93OcGFLEZutekhFUBsQhcfuvF/kMqznwyvun
         edrn5UmPqphWkzX74xUdVHVwWJP7QJjbuFPvBxCWBuI9p6iSorEYDkFsfByly9B7iS
         VIaWykDUFqKCg==
Date:   Mon, 20 Mar 2023 19:59:03 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>
Cc:     linux-kselftest@vger.kernel.org, netdev@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>
Subject: Re: BUG: selftests/net/tls: FAIL in sm4_ccm tests
Message-ID: <20230320195903.314dcb21@kernel.org>
In-Reply-To: <ad89d824-6fa4-990d-42ed-f768db92cfb1@alu.unizg.hr>
References: <ad89d824-6fa4-990d-42ed-f768db92cfb1@alu.unizg.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Mon, 20 Mar 2023 17:07:36 +0100 Mirsad Todorovac wrote:
> The environment is AlmaLinux 8.7 running 6.3-rc3 vanilla kernel with
> MGLRU, KMEMLEAK and CONFIG_DEBUG_KOBJECT=y enabled.

Do you have SM4 and CCM enabled in you kernel .config ?
It's not a popular cipher. 
Make sure your config has all the options listed in
tools/testing/selftests/net/config
