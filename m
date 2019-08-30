Return-Path: <SRS0=ZP9S=W2=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D99D5C3A59B
	for <linux-kselftest@archiver.kernel.org>; Fri, 30 Aug 2019 15:22:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B3F2F23428
	for <linux-kselftest@archiver.kernel.org>; Fri, 30 Aug 2019 15:22:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727434AbfH3PWW (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 30 Aug 2019 11:22:22 -0400
Received: from foss.arm.com ([217.140.110.172]:33898 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727135AbfH3PWW (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 30 Aug 2019 11:22:22 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B1E6344;
        Fri, 30 Aug 2019 08:22:21 -0700 (PDT)
Received: from [10.1.197.50] (e120937-lin.cambridge.arm.com [10.1.197.50])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 090633F703;
        Fri, 30 Aug 2019 08:22:20 -0700 (PDT)
Subject: Re: [PATCH v3 11/11] kselftest: arm64: fake_sigreturn_misaligned_sp
To:     Dave Martin <Dave.Martin@arm.com>
Cc:     linux-kselftest@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20190802170300.20662-1-cristian.marussi@arm.com>
 <20190802170300.20662-12-cristian.marussi@arm.com>
 <8811be0d-efb3-b6da-9f6b-acaeb3edce7d@arm.com>
 <20190813162806.GJ10425@arm.com>
From:   Cristian Marussi <cristian.marussi@arm.com>
Message-ID: <02ffb560-5100-6fc0-2633-ac76e3c404e6@arm.com>
Date:   Fri, 30 Aug 2019 16:22:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190813162806.GJ10425@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On 13/08/2019 17:28, Dave Martin wrote:
> On Wed, Aug 07, 2019 at 05:04:13PM +0100, Cristian Marussi wrote:
>> On 02/08/2019 18:03, Cristian Marussi wrote:
>>> Added a simple fake_sigreturn testcase which places a valid
>>> sigframe on a non-16 bytes aligned SP.
>>> fake_sigretrun() helper function has been patched accordingly
>>> to support placing a sigframe on a non-16 bytes aligned address.
>>> Expects a SIGSEGV on test PASS.
>>>
>>> Adds also a test TODO lists holding some further test ideas.
>>>
>>> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
>>> ---
>>> Re-added this text after fixing the forced misaglinment procedure in
>>> fake_sigreturn() itself: require a ZERO alignment and you'll get
>>> your sigframe placed on a misaligned SP (2-bytes off the 16-align)
>>> ---
>>>  .../testing/selftests/arm64/signal/signals.S  | 21 +++++++++----
>>>  .../arm64/signal/testcases/TODO.readme        |  8 +++++
>>>  .../testcases/fake_sigreturn_misaligned_sp.c  | 30 +++++++++++++++++++
>>>  3 files changed, 53 insertions(+), 6 deletions(-)
>>>  create mode 100644 tools/testing/selftests/arm64/signal/testcases/TODO.readme
>>>  create mode 100644 tools/testing/selftests/arm64/signal/testcases/fake_sigreturn_misaligned_sp.c
>>>
>>
>> When this test was re-added in V3, the related .gitignore was missed.
>> It will go in V4
> 
> Ack, or otherwise try switching to using wildcards in .gitignore as
> suggested in my reply to patch 4.

Used wildcard in .gitignore as advised.
> 

> [...]
> 
> Cheers
> ---Dave
> 
Cheers

Cristian
