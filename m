Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5047EC25B47
	for <linux-kselftest@archiver.kernel.org>; Fri, 27 Oct 2023 04:38:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230079AbjJ0EiM (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 27 Oct 2023 00:38:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229668AbjJ0EiL (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 27 Oct 2023 00:38:11 -0400
Received: from out-175.mta1.migadu.com (out-175.mta1.migadu.com [IPv6:2001:41d0:203:375::af])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF743186
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Oct 2023 21:38:08 -0700 (PDT)
Message-ID: <fbaf1218-e8a4-4e50-bf38-b5615111c8de@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1698381485;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NxoshSOnuzVnnJNzG4zAtKHpo3o6ur1S9Zdl6sB7kjw=;
        b=Rp+pPP+BXNFt15VLlVd+eY3XJgtVBar5v0z+cH9JMGpTfbz9k30XpNsfnwbRjd2Coaj1m4
        krLocHMWBbFgGqsrtk8tzkCtMEoo2GnyBDwBSDkBH2BCJarAlg8gO+jMOIzSiX2mheWn1e
        Na9mTnIeWKkzDVF7NrJZmifu1oSXUqo=
Date:   Thu, 26 Oct 2023 21:37:55 -0700
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v2 2/2] selftests/bpf: Add malloc failure checks
 in bpf_iter
Content-Language: en-GB
To:     Yuran Pereira <yuran.pereira@hotmail.com>, bpf@vger.kernel.org
Cc:     sinquersw@gmail.com, shuah@kernel.org, ast@kernel.org,
        daniel@iogearbox.net, song@kernel.org, john.fastabend@gmail.com,
        kpsingh@kernel.org, sdf@google.com, haoluo@google.com,
        jolsa@kernel.org, mykolal@fb.com, brauner@kernel.org,
        iii@linux.ibm.com, kuifeng@meta.com,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231026020319.1203600-1-yuran.pereira@hotmail.com>
 <DB3PR10MB6835A2CBEE0EBE31D07FABFAE8DDA@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <DB3PR10MB6835A2CBEE0EBE31D07FABFAE8DDA@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org


On 10/25/23 7:03 PM, Yuran Pereira wrote:
> Since some malloc calls in bpf_iter may at times fail,
> this patch adds the appropriate fail checks, and ensures that
> any previously allocated resource is appropriately destroyed
> before returning the function.
>
> Signed-off-by: Yuran Pereira <yuran.pereira@hotmail.com>

Acked-by: Yonghong Song <yonghong.song@linux.dev>

