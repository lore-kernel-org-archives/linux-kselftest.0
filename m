Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CA9AECAAD2
	for <linux-kselftest@archiver.kernel.org>; Mon, 29 Aug 2022 22:47:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbiH2WrN (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 29 Aug 2022 18:47:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbiH2WrM (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 29 Aug 2022 18:47:12 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AA2D9DB61
        for <linux-kselftest@vger.kernel.org>; Mon, 29 Aug 2022 15:47:11 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id z41so4544601ede.0
        for <linux-kselftest@vger.kernel.org>; Mon, 29 Aug 2022 15:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=V/M5FUjrEob5ej+OqEpDo02TSYHpwIt8jpmg0gkXTx4=;
        b=sOJVkokQcLOD4abmd4qLfRaR+Rw0pUE71XY+IGJrQ8RaLOwdY8uwPIn/rgoD1Si5Yk
         yTxOrRom1nx8nlddGSxcZwArVGMZFQg+o5CaQmOz9veDtIqh8gnhPM/1oSmvY9M3FB1k
         1OTlux+Wu5ShAeRhrcQSS4JefrRp973WuBJ2p5XGY7SuTHXpQt/aSYcJsyJZ5P13nJZw
         BLSiX9gjp4xxywAjFX3RUUtVZLhFTF7AYCGOWsP+hRum7mznn7QbPsbTIX3Q/KvwXpjJ
         UKCiOGFoS8QEdhi03AHtu95bHgOoU4wD1aZmJphVz3IiOY7Ouyvbc3aDuPwD/uPh8dgn
         /DRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=V/M5FUjrEob5ej+OqEpDo02TSYHpwIt8jpmg0gkXTx4=;
        b=zMv/eRBG4GZWUdeP9w18LOMu+cEGSj07IRHCQMHKElqz/w+JeN9MtnYqa63/AoaH1R
         irLahCVCCWsQAYO7vwoN0sju4SZNLRZVzI0mUXDfa205ZmpkjXgODvzifNG60TFSMXQG
         F83EUEQ8OCfh7wNhKTR9CUKmWP/1Ldtk+YSyU6/2kE2vr6/72XtIzr8CCQqsXGcunB1p
         amw3ZHz8kHwBTA2k+qII9cAmAJwMLTQ+RslJPdtAh/uqX7kWuMUgHIw2hvsP7UQqAuZ1
         2oEWJrvmjPK19D55WOweRCoWw47TZAEQClaUvrWvlHwaYaCfNg+6RfKqCF8P3JgNhN+O
         GJHw==
X-Gm-Message-State: ACgBeo141Ox76jb/1yRwxGc5b08mldubaXt1U7SsthRtXq2L1r4wfGT8
        EDFrXYDQSXGZ6hOYWMUt8pqDVbVbRDYcJoyq7Gx0+Q==
X-Google-Smtp-Source: AA6agR5zO3QJuGJn4NhtFW434xMjmiJtCirmEp6Sf+yaYoV7Pvgi/pDUKk/yFmud7OVmauvf6ncG+jbC3n/VIFfG/Ws=
X-Received: by 2002:a05:6402:3507:b0:448:b672:55ee with SMTP id
 b7-20020a056402350700b00448b67255eemr1148399edd.107.1661813229655; Mon, 29
 Aug 2022 15:47:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220824041933.822838-1-joefradley@google.com>
In-Reply-To: <20220824041933.822838-1-joefradley@google.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Mon, 29 Aug 2022 15:46:58 -0700
Message-ID: <CAFd5g46z9C3eq1L4etKvCaO3RK-hS4_N7enofNyW=jt8XHVBsQ@mail.gmail.com>
Subject: Re: [PATCH v2] tools: Add new "test" taint to kernel-chktaint
To:     Joe Fradley <joefradley@google.com>
Cc:     davidgow@google.com, skhan@linuxfoundation.org,
        linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        corbet@lwn.net, kernel-team@android.com,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Tue, Aug 23, 2022 at 9:19 PM Joe Fradley <joefradley@google.com> wrote:
>
> Commit c272612cb4a2 ("kunit: Taint the kernel when KUnit tests are run")
> added a new taint flag for when in-kernel tests run. This commit adds
> recognition of this new flag in kernel-chktaint.
>
> Reviewed-by: David Gow <davidgow@google.com>
> Signed-off-by: Joe Fradley <joefradley@google.com>

Thanks!

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
