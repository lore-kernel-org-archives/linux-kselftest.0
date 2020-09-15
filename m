Return-Path: <SRS0=KzEz=CY=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE331C433E2
	for <linux-kselftest@archiver.kernel.org>; Tue, 15 Sep 2020 22:43:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9253B20872
	for <linux-kselftest@archiver.kernel.org>; Tue, 15 Sep 2020 22:43:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727208AbgIOWni (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 15 Sep 2020 18:43:38 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:47906 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727374AbgIOPzt (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 15 Sep 2020 11:55:49 -0400
Received: from ip5f5af089.dynamic.kabel-deutschland.de ([95.90.240.137] helo=wittgenstein)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <christian.brauner@ubuntu.com>)
        id 1kIDJ4-0005bW-Pu; Tue, 15 Sep 2020 15:55:46 +0000
Date:   Tue, 15 Sep 2020 17:55:46 +0200
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
Subject: Re: [PATCH 03/15] selftests/seccomp: mips: Define SYSCALL_NUM_SET
 macro
Message-ID: <20200915155546.ht4vo7nqswxrgymb@wittgenstein>
References: <20200912110820.597135-1-keescook@chromium.org>
 <20200912110820.597135-4-keescook@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200912110820.597135-4-keescook@chromium.org>
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Sat, Sep 12, 2020 at 04:08:08AM -0700, Kees Cook wrote:
> Remove the mips special-case in change_syscall().
> 
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  tools/testing/selftests/seccomp/seccomp_bpf.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
> index 1c83e743bfb1..02a9a6599746 100644
> --- a/tools/testing/selftests/seccomp/seccomp_bpf.c
> +++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
> @@ -1742,6 +1742,13 @@ TEST_F(TRACE_poke, getpid_runs_normally)
>  # define ARCH_REGS		struct pt_regs
>  # define SYSCALL_NUM(_regs)	(_regs).regs[2]
>  # define SYSCALL_SYSCALL_NUM	regs[4]
> +# define SYSCALL_NUM_SET(_regs, _nr)			\
> +	do {						\
> +		if ((_regs).regs[2] == __NR_O32_Linux)	\
> +			(_regs).regs[4] = _nr;		\
> +		else					\
> +			(_regs).regs[2] = _nr;		\
> +	} while (0)

I think that

# define SYSCALL_NUM_SET(_regs, _nr)				\
	do {							\
		if (SYSCALL_NUM(_regs) == __NR_O32_Linux)	\
			(_regs).regs[4] = _nr;			\
		else						\
			(_regs).regs[2] = _nr;			\
	} while (0)

would read better but that's just a matter of taste. :)

Looks good!
Acked-by: Christian Brauner <christian.brauner@ubuntu.com>
