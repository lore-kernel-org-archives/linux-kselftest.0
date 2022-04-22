Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EDC2C433EF
	for <linux-kselftest@archiver.kernel.org>; Fri, 22 Apr 2022 13:52:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236287AbiDVNzc (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 22 Apr 2022 09:55:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345770AbiDVNzc (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 22 Apr 2022 09:55:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 479185A0A9;
        Fri, 22 Apr 2022 06:52:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D210961403;
        Fri, 22 Apr 2022 13:52:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 965B1C385A0;
        Fri, 22 Apr 2022 13:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1650635558;
        bh=UCWzHwrW+W9y4nAdaUaRPycYkyitIOw4SK2KetcgvkY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AlsImn/d4Qqp0D8DkLsJYCMkuCgOnU2sjeedsgoUSY83PCwNTBxlnrDjWnePw6hMl
         aWLht9LadefLyOVO+Wo2hTagFhLKzfJfLB99AbEdcGW3cq+yPTYzy3QXrKPI22wY6s
         RySJvR28O9mDTHtYqd0hr7eYvvxcxlulVl+4tXLU=
Date:   Fri, 22 Apr 2022 15:52:13 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Kees Cook <keescook@chromium.org>
Cc:     linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Dan Li <ashimida@linux.alibaba.com>,
        Jiasheng Jiang <jiasheng@iscas.ac.cn>,
        linux-kselftest@vger.kernel.org,
        Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Shuah Khan <shuah@kernel.org>
Subject: Re: [GIT PULL drivers/misc] lkdtm updates for next
Message-ID: <YmKzDWD9rTtir2g/@kroah.com>
References: <202204161420.168B8DDBE@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202204161420.168B8DDBE@keescook>
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Sat, Apr 16, 2022 at 02:20:54PM -0700, Kees Cook wrote:
> Hi Greg,
> 
> Please pull these lkdtm updates for -next.
> 
> Thanks!
> 
> -Kees
> 
> The following changes since commit ce522ba9ef7e2d9fb22a39eb3371c0c64e2a433e:
> 
>   Linux 5.18-rc2 (2022-04-10 14:21:36 -1000)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/lkdtm-next

Pulled and pushed out, thanks.

greg k-h
