Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CEC5C433F5
	for <linux-kselftest@archiver.kernel.org>; Tue, 12 Apr 2022 20:56:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229862AbiDLU57 (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 12 Apr 2022 16:57:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232234AbiDLU5x (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 12 Apr 2022 16:57:53 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D5851563DA;
        Tue, 12 Apr 2022 13:54:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0719EB82027;
        Tue, 12 Apr 2022 20:42:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46C9AC385A5;
        Tue, 12 Apr 2022 20:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
        s=korg; t=1649796121;
        bh=lMFB0InmoR4pDJv6lAsrdPu5Trt63wkiB+MRAm1baLo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=1dZDrF9L+F538gzNAjJz9VyO3gg4x+HiTdod5RYW0DmIWGmmunI4/OgjJyFcm9C3I
         eJeWQ+/r6DqlPyOi1XCg/kgPfZKRZAjNk41oTc+2jGsl4+x6/TMWkU59/I8DEOa5Nn
         v5RyIjcRhuMBFVO+EDJbPo65siomjZMUDj/79JTc=
Date:   Tue, 12 Apr 2022 13:41:59 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Axel Rasmussen <axelrasmussen@google.com>
Cc:     Alexander Viro <viro@zeniv.linux.org.uk>,
        "Dmitry V . Levin" <ldv@altlinux.org>,
        Gleb Fotengauer-Malinovskiy <glebfm@altlinux.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <namit@vmware.com>, Peter Xu <peterx@redhat.com>,
        Shuah Khan <shuah@kernel.org>, linux-fsdevel@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 2/2] userfaultfd: selftests: modify selftest to use
 /dev/userfaultfd
Message-Id: <20220412134159.f0a1d0d77f5b01638007bf4b@linux-foundation.org>
In-Reply-To: <20220412202942.386981-2-axelrasmussen@google.com>
References: <20220412202942.386981-1-axelrasmussen@google.com>
        <20220412202942.386981-2-axelrasmussen@google.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Tue, 12 Apr 2022 13:29:42 -0700 Axel Rasmussen <axelrasmussen@google.com> wrote:

> Prefer this new interface, but if using it fails for any reason just
> fall back to using userfaultfd(2) as before.

This seems a poor idea - the old interface will henceforth be untested.

Why not tweak the code to test both interfaces?
