Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72B4CC433F5
	for <linux-kselftest@archiver.kernel.org>; Wed, 22 Sep 2021 00:29:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 49AB261186
	for <linux-kselftest@archiver.kernel.org>; Wed, 22 Sep 2021 00:29:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230184AbhIVAax (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 21 Sep 2021 20:30:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55653 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229524AbhIVAax (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 21 Sep 2021 20:30:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632270563;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=NmEXaXF/Zeuy5snsjO8cTG6bYqexhCWu35mF9eZUaWg=;
        b=AzFDPB0imFshaOw23EtGuiiOI8QdBcIKMSjqeeDEgxu3+VoXn9adsJPfTcoeTeL9PwnMQ1
        e76OaxROXPhb06YOl0nUrtw7s1DwtcGA4r3YEXwUvoErXYFfEiDLRMglsj2ZQlAPolaPWN
        T5IsW+kH2ZiMmyHfrgWMuOu0TVZPchw=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-jfwADpBqMvKp6j-Wcn8Rhg-1; Tue, 21 Sep 2021 20:29:22 -0400
X-MC-Unique: jfwADpBqMvKp6j-Wcn8Rhg-1
Received: by mail-qt1-f200.google.com with SMTP id o7-20020ac86d07000000b002a69537d614so4699790qtt.21
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Sep 2021 17:29:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NmEXaXF/Zeuy5snsjO8cTG6bYqexhCWu35mF9eZUaWg=;
        b=XJuHiAKAcrlrCo8vNwLDWJ4ZClZU0RwPYV7HWxInBNbvtID0qgTb96PDbH/E3hnP2U
         W65b0A+jIuha68A6DxrkT0XRFsKet8vIyeSt4taWohUrRc1K5/gIbbZXMuPwuNu2bPfa
         F1FEbW4X0axdcGdR8MWSY3KnwJiWvdF68bh0QjymyS4cLCwpRszd5mdJ3DoL+y8OczBr
         CoCltMheGnfwBb3SgNpoBIucXol9vP55U5Fx2psqdPy+czAcohawfyxEHUm2JV6uZeAu
         XWIKEuOd1XV/N5NJpBKDlrV21+dpXYUNQvdQ4f0mdLlXHb6vIf1rJ1gnEoc/FcbFp2Zj
         tw0g==
X-Gm-Message-State: AOAM530xMtLzCiCiVfqP6ki3ujzsNJbNuo9KnP3QyNsgue41YcsjMPgR
        t5lut1sLpIOZ6W4oklzLs+dhKbRc3OnEct5AXoTkx8CcsNAmENO56hTVoAkKEWx9ci1GRF6dpvz
        gf9IT9PMDOygJRzzxvkBNyeBisYP7
X-Received: by 2002:a05:620a:524:: with SMTP id h4mr3517160qkh.320.1632270561731;
        Tue, 21 Sep 2021 17:29:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzp8OHGlxNnMNUsKkbTB5lbA+kEvBE9p0uF3GnGKhmEwdsDq6bdIOgUAQGlx7CMSNBruskFFA==
X-Received: by 2002:a05:620a:524:: with SMTP id h4mr3517145qkh.320.1632270561484;
        Tue, 21 Sep 2021 17:29:21 -0700 (PDT)
Received: from t490s ([2607:fea8:56a2:9100::d3ec])
        by smtp.gmail.com with ESMTPSA id i6sm416278qtx.40.2021.09.21.17.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 17:29:20 -0700 (PDT)
Date:   Tue, 21 Sep 2021 20:29:19 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Axel Rasmussen <axelrasmussen@google.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Shuah Khan <shuah@kernel.org>, Linux MM <linux-mm@kvack.org>,
        Linuxkselftest <linux-kselftest@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] userfaultfd/selftests: fix feature support detection
Message-ID: <YUp438W5p5VHL1Ch@t490s>
References: <20210921163323.944352-1-axelrasmussen@google.com>
 <YUoaDr2wsW8wtk5Z@t490s>
 <CAJHvVcj68inRrpmw0pJq9qFc20JzG8+s7b31HkXQcsLcAJN_0Q@mail.gmail.com>
 <YUowr6phZU4v7dds@t490s>
 <CAJHvVcgz18qU9vjPimOhJ5YswfJnLN0tQGfsgjCh6M7ckvhfgA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJHvVcgz18qU9vjPimOhJ5YswfJnLN0tQGfsgjCh6M7ckvhfgA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Tue, Sep 21, 2021 at 01:31:12PM -0700, Axel Rasmussen wrote:
> Ah, it has to do with us asserting the list of expected ioctls. The
> kernel changes the list of ioctls it reports in response to a
> UFFDIO_REGISTER, depending on the particular kind of vma being
> registered, **as well as what mode(s) it is being registered with**.
> 
> So for example, consider the hugetlb_shared test. When registering,
> the kernel might set the UFFDIO_CONTINUE bit or not, depending on
> whether we registered with the MINOR mode bit set in particular.

I can understand your point, but the "capability set" of the kernel is still
the same.  In this case we should have UFFDIO_CONTINUE capability for
hugetlb_shared test globally, as long as the kernel supports it, irrelevant of
what test case we're going to have.

Then in the test, if we don't register with MINOR mode, IMHO we should just
mask out the expected_ioctls with UFFDIO_CONTINUE because it does not make
sense to request UFFDIO_CONTINUE if we will never use it in the test.

In other words, having a "uffd_features" global variable and having it changing
all the time during tests is odd to me, but I agree it's not a big deal. :)

-- 
Peter Xu

