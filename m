Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C75BCCDB474
	for <linux-kselftest@archiver.kernel.org>; Tue, 17 Oct 2023 17:36:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230343AbjJQRgO (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 17 Oct 2023 13:36:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234486AbjJQRgM (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 17 Oct 2023 13:36:12 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B96EC98
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Oct 2023 10:36:10 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88C29C433C8;
        Tue, 17 Oct 2023 17:36:09 +0000 (UTC)
Date:   Tue, 17 Oct 2023 13:37:45 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Yu Liao <liaoyu15@huawei.com>
Cc:     <linux-trace-kernel@vger.kernel.org>, <mhiramat@kernel.org>,
        <shuah@kernel.org>, <liwei391@huawei.com>,
        linux-kselftest@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH -next 0/2] add loongarch and riscv support for kprobe
 args test
Message-ID: <20231017133745.098244d1@gandalf.local.home>
In-Reply-To: <20230815085912.701356-1-liaoyu15@huawei.com>
References: <20230815085912.701356-1-liaoyu15@huawei.com>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Tue, 15 Aug 2023 16:59:10 +0800
Yu Liao <liaoyu15@huawei.com> wrote:

> Yu Liao (2):
>   selftests/ftrace: add loongarch support for kprobe args char tests
>   selftests/ftrace: Add riscv support for kprobe arg tests
> 
>  .../selftests/ftrace/test.d/kprobe/kprobe_args_char.tc      | 6 ++++++
>  .../selftests/ftrace/test.d/kprobe/kprobe_args_string.tc    | 3 +++
>  .../selftests/ftrace/test.d/kprobe/kprobe_args_syntax.tc    | 4 ++++
>  3 files changed, 13 insertions(+)
> 

I noticed that this never got picked up, but that's probably because it
didn't also Cc linux-kselftest@vger.kernel.org (which I did here).

Shuah,

Can you add this? You can also add:

Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org>

-- Steve
