Return-Path: <SRS0=KzEz=CY=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3793CC31E40
	for <linux-kselftest@archiver.kernel.org>; Tue, 15 Sep 2020 22:39:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0FEA420770
	for <linux-kselftest@archiver.kernel.org>; Tue, 15 Sep 2020 22:39:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727585AbgIOWfI (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 15 Sep 2020 18:35:08 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:48711 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727254AbgIOQKn (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 15 Sep 2020 12:10:43 -0400
Received: from ip5f5af089.dynamic.kabel-deutschland.de ([95.90.240.137] helo=wittgenstein)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <christian.brauner@ubuntu.com>)
        id 1kIDVY-0006rA-V3; Tue, 15 Sep 2020 16:08:41 +0000
Date:   Tue, 15 Sep 2020 18:08:40 +0200
From:   Christian Brauner <christian.brauner@ubuntu.com>
To:     Kees Cook <keescook@chromium.org>
Cc:     linux-kernel@vger.kernel.org,
        Thadeu Lima de Souza Cascardo <cascardo@canonical.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Christian Brauner <christian@brauner.io>,
        Andy Lutomirski <luto@amacapital.net>,
        Will Drewry <wad@chromium.org>,
        linux-kselftest@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-xtensa@linux-xtensa.org,
        linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 10/15] selftests/seccomp: Avoid redundant register flushes
Message-ID: <20200915160840.6ybm67gowqeqyms2@wittgenstein>
References: <20200912110820.597135-1-keescook@chromium.org>
 <20200912110820.597135-11-keescook@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200912110820.597135-11-keescook@chromium.org>
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Sat, Sep 12, 2020 at 04:08:15AM -0700, Kees Cook wrote:
> When none of the registers have changed, don't flush them back. This can
> happen if the architecture uses a non-register way to change the syscall
> (e.g. arm64) , and a return value hasn't been written.
> 
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---

Looks good!
Acked-by: Christian Brauner <christian.brauner@ubuntu.com>
