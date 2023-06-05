Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A222C77B73
	for <linux-kselftest@archiver.kernel.org>; Mon,  5 Jun 2023 07:13:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229449AbjFEHNp (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 5 Jun 2023 03:13:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbjFEHNi (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 5 Jun 2023 03:13:38 -0400
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.155.65.254])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1468E62;
        Mon,  5 Jun 2023 00:13:13 -0700 (PDT)
X-QQ-mid: bizesmtp68t1685948709t0hdsv4v
Received: from linux-lab-host.localdomain ( [61.141.77.49])
        by bizesmtp.qq.com (ESMTP) with 
        id ; Mon, 05 Jun 2023 15:05:08 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: OFQdrTmJ2CQhbplmT8464RTU9RxGWO3Kw3No1opfWzZH7Zxfd+SQf/zCI/8jA
        0OD5hugEKHGAd2AcaRlNrPRLaqnz7hsclaHKVSrHCvZ+igZofhh/0KFX5FKNuTIubQhLUfg
        qjyHhhjzPKSrKefFylb5NVNvQrHj5q/jW0D6nGDeB3EXdS7ylej2rj3remKaojhuxZoIju+
        i6eHd7dRdEE2IFPrnyIjqt5ft9tPppa6qFv3gb9t2C0NXlA90wJ26hrgpXwWVP7l3ypaL8S
        vrHcEKu9MrupV5qwrGRgITGP488xmeehnZ8BkW76B6ilaErZE2wUPMCj6u5MZnGypA7YCnO
        MbK0H1tEaqXX9bX2kIvPVzDVi595oRaynbtLLHC8vBwkt300dycQEXnDZCq4plr5a4Cvub4
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10052685616247688945
From:   Zhangjin Wu <falcon@tinylab.org>
To:     w@1wt.eu
Cc:     arnd@arndb.de, falcon@tinylab.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
        thomas@t-8ch.de
Subject: Re: [PATCH 3/4] selftests/nolibc: always print the log file
Date:   Mon,  5 Jun 2023 15:05:08 +0800
Message-Id: <20230605070508.153407-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ZH1ioKUVOYGgDUj7@1wt.eu>
References: <ZH1ioKUVOYGgDUj7@1wt.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

> On Mon, Jun 05, 2023 at 11:57:44AM +0800, Zhangjin Wu wrote:
> > This allows to check the other issues of the output file manually even
> > when all of them passed.
> 
> Till now I preferred not to see it when everything was OK since it was
> useless and permitted a quick visual check in the reports. Do you
> really think it's useful ? If others prefer it that way we can change
> it but I purposely added this test to "improve" the output (for me at
> least). I'm interested in opinions here.
>

I planed to add detailed potential issues to check in the commit
message, but didn't do that eventually.

The potential 'issues' may be:

1. string alignment, I found one character offset in the user-space
   'efault' handler patchset
2. duplicated print, the one like '30 fork' we have fixed up
3. kernel messages (may provide some important info)

I did add this manually several times in the past weeks, so, if the path
is there, I can simply copy it and cat it, hope we can print the path by
default ;-) 

The commit message may be changed to something like this:

    This allows us to check the details in the log file even when all of
    them passed, from the log details, we can check the string
    alignment, duplicated print and kernel messages.

Best regards,
Zhangjin

> Willy
