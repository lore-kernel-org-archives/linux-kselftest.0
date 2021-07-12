Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A360AC07E9A
	for <linux-kselftest@archiver.kernel.org>; Mon, 12 Jul 2021 18:31:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 85C3A61186
	for <linux-kselftest@archiver.kernel.org>; Mon, 12 Jul 2021 18:31:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235954AbhGLSeZ (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 12 Jul 2021 14:34:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235967AbhGLSeY (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 12 Jul 2021 14:34:24 -0400
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B399AC0613E5
        for <linux-kselftest@vger.kernel.org>; Mon, 12 Jul 2021 11:31:35 -0700 (PDT)
Received: by mail-io1-xd33.google.com with SMTP id z11so2145735iow.0
        for <linux-kselftest@vger.kernel.org>; Mon, 12 Jul 2021 11:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=LgizhMtK9J0wIVIMFU3xipTGuHnEvtr8IUFF/Ttb7XQ=;
        b=fiWYk3Qgti2nJDBisADC1y5QatwEJAPoalQmvvprxStFE6LcBHAB9TfS1PEQcVjraL
         NHM8IKT8DyZxm8wQDGGmvbDP1ChwouB+WCPz0oxoPNsY5TKr9Ll5fUL570zFJqK5ILWA
         Z1wK+pWsYrF/4CsF/JB8IlTEBK6oq19g/q75M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=LgizhMtK9J0wIVIMFU3xipTGuHnEvtr8IUFF/Ttb7XQ=;
        b=sYnq7tNGO5CHQh8779aX79MshRSGL4mKEl/N4gxXPlnYNmu8iTZLq3544UD9Zy9/Kb
         1XUMKu9dCBoq6zHjdutD9lNsgQmjcuQJiO1esoPa3AmUik7FgB1FnbhKCvvSqYEk3h/S
         dDZPdpnPLUMHREm6t78TsVjcmtInSPe6207P3SZXEY1fyKflFkvlhHcG6YZFDL/ivfBs
         VYIsANQZfxuW6tHyLTkfbs3j9GAwOY/ey74XGXFPVNkmUTBN3LhlOHEdUod3uG6XyixP
         hmtGBp53Hx0ExbUqpngdtZsnUjTpJsH8UC76RQ/NBIa31KJX2rPGQ7PsZZuGIh4FcqGf
         xXxQ==
X-Gm-Message-State: AOAM5307HZiXLu/bM+lAP5nZQrRWoFCTdAuttZVyXAv++AmUjqnx/Dcm
        kV2L7wbyyskPxoWPD/hGCI/QwQ==
X-Google-Smtp-Source: ABdhPJxULu9RcAOrhMI5KxkMU4BX+rJYn1a9lYVMLnheRhZkJQANESlazqXStOjdtDPZJVwrmUeDJA==
X-Received: by 2002:a5d:8198:: with SMTP id u24mr212178ion.81.1626114695237;
        Mon, 12 Jul 2021 11:31:35 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id c19sm8163490iod.46.2021.07.12.11.31.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jul 2021 11:31:34 -0700 (PDT)
To:     Kees Cook <keescook@chromium.org>
Cc:     linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
From:   Shuah Khan <skhan@linuxfoundation.org>
Subject: BUG: lkdtm stack-entropy.sh test hangs
Message-ID: <2836f48a-d4e2-7f00-f06c-9f556fbd6332@linuxfoundation.org>
Date:   Mon, 12 Jul 2021 12:31:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Hi Kees,

lkdtm stack-entropy.sh test hangs on Linux 5,14-rc1 - I tried
root and non-root cases. Both hang.
  
# selftests: lkdtm: stack-entropy.sh
# ./stack-entropy.sh: 13: cannot create /sys/kernel/debug/provoke-crash/DIRECT: Permission denied

If you have a fix for this, I would like to get this in soon.

thanks,
-- Shuah
