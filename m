Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1556C6FD20
	for <linux-kselftest@archiver.kernel.org>; Fri, 24 Mar 2023 20:37:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231737AbjCXUhA (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 24 Mar 2023 16:37:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230357AbjCXUg7 (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 24 Mar 2023 16:36:59 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF5031E2AC
        for <linux-kselftest@vger.kernel.org>; Fri, 24 Mar 2023 13:36:57 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 204-20020a250fd5000000b00b6d6655dc35so2864096ybp.6
        for <linux-kselftest@vger.kernel.org>; Fri, 24 Mar 2023 13:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1679690217;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qzKYx9+8XUagIX7RdKAagq2FCOW5fF+xAmlNYR7ouU4=;
        b=WMrEWpz4Ed42D//eOGu7mGUIaIpRFSmKiDePya/QhjcJpHFkNYQiKjpkE/VcDX4Zej
         cZS0KKxqCQW/2F6OX1cMrMrwm5duf9BdMZwgSZjRHEW5YDKYvbW4cIuraB5caLCoVVcv
         Cel3FYIbiZEbO4C+FVKdsZfJL0f3QCvhNDeyH+oth5zMiOlEe4dGn8Eidg4Yy5OUM/kq
         t1nBqQbNKqaNtp8sid8XTZq0iTzhoJNFj5rR8Pd1e+7vKizLtrCcfFvqKhjiVs+WvsR5
         FuocCmgAnGmAnneKsbK2edjVbJNzTeBtWPDeN487He24pDhCnJxADZMo8IibhMGcmyHo
         FjVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679690217;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qzKYx9+8XUagIX7RdKAagq2FCOW5fF+xAmlNYR7ouU4=;
        b=WUx5eoEQK1n4ixFxAmXRThHK0YHbaW7dbfQo71am6twBKCsMUW+LFIXGxq5oeL8AO5
         zvlXtyplbayZj9IssdeGMO3r5IuRiCWdehOv5Uog6wSeIfWAZFm20JR6xWY+52YxBs5K
         Yn4F2FUb/HNCn8X9CB+uwiJUq//6tc5EFgFvSlqZxtb4dzkpgwg9Mp5Qtd/MYz0Oz0t1
         kjqS+odRxVu5PlHsjETPJ1coJSdef8JK/+2T4G1TfYmVDpL5fZhfAqokKHal15ywiFR+
         ElCN38ZfaHJo4qIB7ST5laqH6doJRt5RcsbhO6kuEUClBApuea5sWXUnv5x69AObc2Qa
         juEQ==
X-Gm-Message-State: AAQBX9fMq8HxkvId/qv54DkDhpsBkbpNK55iWq7y9vbtA09tMnWnT/hc
        bjy4tvsGlTNBMHbdHmo6gZLhkWR/qxU=
X-Google-Smtp-Source: AKy350YgWsdlh5FPhrckUQqr+3LeU27bBrvg8jPen196T35No2Cibzes+gLiRNS0Qvs5eEMdKmCwAD1HkCY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1006:b0:b78:4b00:775f with SMTP id
 w6-20020a056902100600b00b784b00775fmr330567ybt.4.1679690217136; Fri, 24 Mar
 2023 13:36:57 -0700 (PDT)
Date:   Fri, 24 Mar 2023 13:36:55 -0700
In-Reply-To: <20230221163655.920289-3-mizhang@google.com>
Mime-Version: 1.0
References: <20230221163655.920289-1-mizhang@google.com> <20230221163655.920289-3-mizhang@google.com>
Message-ID: <ZB4J54V16GQdcTrz@google.com>
Subject: Re: [PATCH v3 02/13] KVM: selftests: x86: Add a working xstate data structure
From:   Sean Christopherson <seanjc@google.com>
To:     Mingwei Zhang <mizhang@google.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
        kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
        Jim Mattson <jmattson@google.com>,
        Venkatesh Srinivas <venkateshs@google.com>,
        Aaron Lewis <aaronlewis@google.com>,
        "Chang S. Bae" <chang.seok.bae@intel.com>,
        Chao Gao <chao.gao@intel.com>
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Please omit the "x86:" from the shortlog.  I'm not necessarily against capturing
the arch somewhere in the shortlog for KVM selftests changes, but I want the
community as a whole to make a concious decision on if and how to do it.  I.e. I
don't want a bunch of ad hoc versions popping up because we'll end up with a mess.
E.g. I personally think three levels of scope is too much, and would rather do
something like "KVM: x86/selftests:" or "KVM: selftests/x86:".
