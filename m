Return-Path: <SRS0=qtj9=YZ=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F4FACA9ECB
	for <linux-kselftest@archiver.kernel.org>; Fri,  1 Nov 2019 02:25:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EF4812067D
	for <linux-kselftest@archiver.kernel.org>; Fri,  1 Nov 2019 02:25:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="QdOmbLQS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729202AbfKACZv (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 31 Oct 2019 22:25:51 -0400
Received: from m12-18.163.com ([220.181.12.18]:46738 "EHLO m12-18.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728193AbfKACZv (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 31 Oct 2019 22:25:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=7PRvK
        fU+Bpjcb6TGltEpFeqoUiGauuOGXyo7sH9ZAmE=; b=QdOmbLQSqrHEhDVCF3uC5
        ihga9qZdmrvTIYxo8q4mNb+8VTDTPJFkHTISKvGo8SfEpX5CxStx3qYCeojgqSJW
        UwMEb4Wy/urSu3hnJRy5LvUKB6YfS9gROMdnb0AXBKvWP0eIWlTQI8gPxOjhXS3V
        /QCLUfsspdXMRBnCuQr7hc=
Received: from [192.168.1.133] (unknown [112.25.212.39])
        by smtp14 (Coremail) with SMTP id EsCowADn7KyAl7tdR0+JFg--.12253S2;
        Fri, 01 Nov 2019 10:25:05 +0800 (CST)
Subject: Re: [PATCH] kselftests/dmabuf-heaps: Fix compiler error in one
 condition
To:     john.stultz@linaro.org, shuah@kernel.org
Cc:     linux-kselftest@vger.kernel.org, philip.li@intel.com
References: <20191101020450.12948-1-ice_yangxiao@163.com>
From:   Xiao Yang <ice_yangxiao@163.com>
Message-ID: <e343dbf7-323f-c513-50ca-feda4f0ab6ec@163.com>
Date:   Fri, 1 Nov 2019 10:25:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191101020450.12948-1-ice_yangxiao@163.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-CM-TRANSID: EsCowADn7KyAl7tdR0+JFg--.12253S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xw48ZF43ur1fAFyDJrykAFb_yoWkKrgE9F
        WqkF1kJrZ5Aryq9r4UJF98Wr4kK345Xr48Gr1kJr43JrnxArWrCF4DWr48X3ZYgr98Xry7
        AFWkAF9xGw1jyjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU51bytUUUUU==
X-Originating-IP: [112.25.212.39]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/xtbBEh9gXlZYFmhAHAABse
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Hi,

If you fix the issue, kindly add following tag
Reported-by: kernel test robot <lkp@intel.com>

On 11/1/19 10:04 AM, Xiao Yang wrote:
> Compiling dmabuf-heaps cannot locate headers and then gets the following
> error when kernel source code instead of system provides headers:
> -------------------------------------------
> dmabuf-heap.c:16:10: fatal error: drm/drm.h: No such file or directory
> -------------------------------------------
>
> Signed-off-by: Xiao Yang <ice_yangxiao@163.com>
> ---
>   tools/testing/selftests/dmabuf-heaps/Makefile | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/dmabuf-heaps/Makefile b/tools/testing/selftests/dmabuf-heaps/Makefile
> index 8c4c36e2972d..9043e0b5a432 100644
> --- a/tools/testing/selftests/dmabuf-heaps/Makefile
> +++ b/tools/testing/selftests/dmabuf-heaps/Makefile
> @@ -1,5 +1,5 @@
>   # SPDX-License-Identifier: GPL-2.0
> -CFLAGS += -static -O3 -Wl,-no-as-needed -Wall
> +CFLAGS += -static -O3 -Wl,-no-as-needed -Wall -I../../../../usr/include
>   #LDLIBS += -lrt -lpthread -lm
>   
>   # these are all "safe" tests that don't modify

