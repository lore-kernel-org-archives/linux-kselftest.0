Return-Path: <SRS0=+w36=CF=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,FSL_HELO_FAKE,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17CC2C433DF
	for <linux-kselftest@archiver.kernel.org>; Thu, 27 Aug 2020 20:25:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E787B20786
	for <linux-kselftest@archiver.kernel.org>; Thu, 27 Aug 2020 20:25:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jjWnq371"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726120AbgH0UZW (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 27 Aug 2020 16:25:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726903AbgH0UZW (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 27 Aug 2020 16:25:22 -0400
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF08CC061232
        for <linux-kselftest@vger.kernel.org>; Thu, 27 Aug 2020 13:25:21 -0700 (PDT)
Received: by mail-il1-x144.google.com with SMTP id v2so6020549ilq.4
        for <linux-kselftest@vger.kernel.org>; Thu, 27 Aug 2020 13:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EcPugKinUDkl45gw2/TofizT3GOM5FJb2tHu0+XZtfc=;
        b=jjWnq371SBtqP44eYzksxx+Ez1Vqdmotak6/NGGCW240lnyg+AY6wdXUaHmqTCHcls
         7Ufv5ivFPyKcBG/qcjXE8J2XyPUv8+pUeFqujz3ZqhipT/ZFKK6N0FoWo5OELlZgnCMq
         ltWz5TcKuEyAZnQ+DalgXB5fJkK/tScz1iOpDNYkQlDwE6WELNDH1sJylvOeepxLI8d2
         czEGUJ9xpdplUyX+w4fJM0Qcw9EfPBwZ02Yi5cuTXjYrKonuUWTN+QPRDqlzkAv6sWcv
         ZiI9u/RibB7o6CqSHA4CmRCSZkWSJLra8LmWsHpJbrQkYEdUSvOIWQ9ObG0bVRRlR8mA
         Oz6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EcPugKinUDkl45gw2/TofizT3GOM5FJb2tHu0+XZtfc=;
        b=YIr9POfCx8E31UBygsgrx5/AHGSA0xDlX7QvBZwUTOKEQJ9G8vQ4EoDyCb1Nm+Bc/Y
         TY/ojt1DkOcMCo210g9744EoYdu+dxc+ESGl4k+O4JZMljUMtyYiXpKKFMpdN1ua7zsU
         PHUWQXTKxkLIApq471IHh0R2h7F2iTKuTCDxLsmueMaAb45Tx35qfYxXWbVb4pwMmVWi
         8LigFDnIVZC7/S3Pv+iphigjNeSHZmle7zGbtRUrIJI6apcUF+1dFehApvLywVRrmgOQ
         OWr2O2w1uhw+Gx61s1cVwwIEKnHV9uMQhwOGtciw9UrgHMPGG3kfu0Ynrj0/D63mj0GY
         ibFg==
X-Gm-Message-State: AOAM533QpYiHKphO4AKqksREMAkRHTFufHAqa0IyrS0gc7RaAi5+Q/1r
        ybe51XRvUwCbdM3F61S0MNUiNw==
X-Google-Smtp-Source: ABdhPJypVWkjZUjt8Sj+LCVvbBEGUX7d4meeBdN/kwOzHSsOqrAhQv8bjR5/peeV6piVllYGZxandQ==
X-Received: by 2002:a92:dc03:: with SMTP id t3mr17495932iln.59.1598559920719;
        Thu, 27 Aug 2020 13:25:20 -0700 (PDT)
Received: from google.com ([2601:285:8380:9270::f2a2])
        by smtp.gmail.com with ESMTPSA id c24sm1662935iom.46.2020.08.27.13.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 13:25:19 -0700 (PDT)
Date:   Thu, 27 Aug 2020 14:25:17 -0600
From:   Ross Zwisler <zwisler@google.com>
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     Ross Zwisler <zwisler@chromium.org>, linux-kernel@vger.kernel.org,
        Mattias Nissler <mnissler@chromium.org>,
        Aleksa Sarai <cyphar@cyphar.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Benjamin Gordon <bmgordon@google.com>,
        David Howells <dhowells@redhat.com>,
        Dmitry Torokhov <dtor@google.com>,
        Jesse Barnes <jsbarnes@google.com>,
        linux-fsdevel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        Matthew Wilcox <willy@infradead.org>,
        Micah Morton <mortonm@google.com>,
        Raul Rangel <rrangel@google.com>, Shuah Khan <shuah@kernel.org>
Subject: Re: [PATCH v9 1/2] Add a "nosymfollow" mount option.
Message-ID: <20200827202517.GA484488@google.com>
References: <20200827170947.429611-1-zwisler@google.com>
 <20200827200801.GB1236603@ZenIV.linux.org.uk>
 <20200827201015.GC1236603@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200827201015.GC1236603@ZenIV.linux.org.uk>
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Thu, Aug 27, 2020 at 09:10:15PM +0100, Al Viro wrote:
> On Thu, Aug 27, 2020 at 09:08:01PM +0100, Al Viro wrote:

> > AFAICS, it applies clean to -rc1; what was the rebase about?

Oh, sorry if that was confusing, I just wanted to make sure that it still
applied cleanly to the latest -rc so that you didn't hit a merge conflict.

Yes, these patches apply cleanly to both -rc1 and -rc2.

> Applied (to -rc1) and pushed

Many thanks!
