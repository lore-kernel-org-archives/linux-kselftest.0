Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2F9EC4332F
	for <linux-kselftest@archiver.kernel.org>; Tue, 18 Oct 2022 22:25:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229777AbiJRWZN (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 18 Oct 2022 18:25:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229785AbiJRWZK (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 18 Oct 2022 18:25:10 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 119334153C
        for <linux-kselftest@vger.kernel.org>; Tue, 18 Oct 2022 15:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666131905;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=a5wbRvkgVk+UwUXSQmQAJ6lHDYoVbJsomLH7rHukjlk=;
        b=KEaKTOrG2Gin4Y70XkbU7p3dpYMHEJ7rMTIdrgK9ZNG/7/dCgnE50DQ4nJZW3Mw541i4BD
        3tnUh+TKDZBGtZWlD0CvamLeFiSp+mE32gQxCmayMtxQfdA4Ygy3b6BHx6jMWpbceT9P1A
        d0gWv50ex/NqiVaWPtflqpCic6GL3lI=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-267-zq2TCM7YO_ygBVtWygIW_g-1; Tue, 18 Oct 2022 18:25:04 -0400
X-MC-Unique: zq2TCM7YO_ygBVtWygIW_g-1
Received: by mail-yb1-f200.google.com with SMTP id u16-20020a250950000000b006be72659056so14561117ybm.3
        for <linux-kselftest@vger.kernel.org>; Tue, 18 Oct 2022 15:25:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a5wbRvkgVk+UwUXSQmQAJ6lHDYoVbJsomLH7rHukjlk=;
        b=AeL6P4xCu2kwmyb5xrIPvqftIQ1CZgBzgcEEmVOsVHwBtsfIBkVDyp+QaEd9tzcWKH
         jX+iQ88iMzVyV/ayZ2C34ALs+UL9eOfikZ35jf23BAv5ahb133p522l12yBqIfdBYEiy
         WHIqX2hjROod81mq3OICA8QnxRkTckwTF3x4Ydq2O798ivi0zzSY3q8nkaCjIb/VkN0g
         6Y+ueU2QLlhi2zjLOjBf1CIrsV5LMcvuNkXOeD9cq/Mjv/8PS/L8tkI7qm3aG0//jp82
         NV/AIRxacnup8r8m83IdGAlLIPniUaek/gW35WBocC7PVrjC6gOhW7ofundekriDRZSt
         C8yA==
X-Gm-Message-State: ACrzQf1xEoMH40B1whWbpse2mgK3VtyUfV6nOLmANZCvOjg/qvFz/ltc
        +yM8DYqhmsS+UXZBlUIzw6CKU3b04krX0iXstFK/Ph8Llr54iC+Iu6vBB0SIrj76TYq1MV699ZD
        iH4qBoQHXixHuaV17Fnct0/mfMk3/6scq4iFt0HBcsoNo
X-Received: by 2002:a25:ca15:0:b0:6be:b45f:770a with SMTP id a21-20020a25ca15000000b006beb45f770amr1956964ybg.130.1666131903279;
        Tue, 18 Oct 2022 15:25:03 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7luNnDmhEyzoV5WogOXajm+rjxHlqOQjgMLzp1YbzvuCmZY+/kxXzVdhAAOVGZR7JUJb5w4YdL3GzEImx/O3A=
X-Received: by 2002:a25:ca15:0:b0:6be:b45f:770a with SMTP id
 a21-20020a25ca15000000b006beb45f770amr1956954ybg.130.1666131903077; Tue, 18
 Oct 2022 15:25:03 -0700 (PDT)
MIME-Version: 1.0
References: <20221018183021.1832032-1-jsavitz@redhat.com> <20221018151145.2997697f0251e3cb419e09ac@linux-foundation.org>
In-Reply-To: <20221018151145.2997697f0251e3cb419e09ac@linux-foundation.org>
From:   Joel Savitz <jsavitz@redhat.com>
Date:   Tue, 18 Oct 2022 18:24:47 -0400
Message-ID: <CAL1p7m5YRdOasXJG4Q-qOK=O8EQQAmNVvveGy+9DzVzN_jMVCA@mail.gmail.com>
Subject: Re: [PATCH v6] selftests/vm: enable running select groups of tests
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
        linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
        linux-next@vger.kernel.org, Nico Pache <npache@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Ok sure, I'll give it a go.

Thanks for the feedback.

Best,
Joel Savitz

On Tue, Oct 18, 2022 at 6:12 PM Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Tue, 18 Oct 2022 14:30:21 -0400 Joel Savitz <jsavitz@redhat.com> wrote:
>
> >  tools/testing/selftests/vm/run_vmtests.sh | 212 +++++++++++++++-------
>
> Lots of patches change this file so I can see I won't be liking this
> patch :(
>
> Can you please redo it against the mm-unstable branch at
> git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm and we'll see how
> it goes?  Thanks.
>

