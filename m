Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5737BC47083
	for <linux-kselftest@archiver.kernel.org>; Wed,  2 Jun 2021 08:57:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3B5FB613D7
	for <linux-kselftest@archiver.kernel.org>; Wed,  2 Jun 2021 08:57:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232934AbhFBI66 (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Wed, 2 Jun 2021 04:58:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:44212 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231462AbhFBI65 (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Wed, 2 Jun 2021 04:58:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EB82B613D5;
        Wed,  2 Jun 2021 08:57:12 +0000 (UTC)
Date:   Wed, 2 Jun 2021 10:57:10 +0200
From:   Christian Brauner <christian.brauner@ubuntu.com>
To:     David Matlack <dmatlack@google.com>
Cc:     linux-kselftest@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        akpm@linux-foundation.org,
        Alexey Gladkov <gladkov.alexey@gmail.com>
Subject: Re: [PATCH] proc: Add .gitignore for proc-subset-pid selftest
Message-ID: <20210602085710.kp26wquy6anwy5kd@wittgenstein>
References: <20210601164305.11776-1-dmatlack@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210601164305.11776-1-dmatlack@google.com>
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Tue, Jun 01, 2021 at 04:43:05PM +0000, David Matlack wrote:
> This new selftest needs an entry in the .gitignore file otherwise git
> will try to track the binary.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---

Could use a
Cc: stable@kernel.org
link but Shuah might be able to fix this when applying.

Otherwise looks good,
Acked-by: Christian Brauner <christian.brauner@ubuntu.com>
