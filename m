Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34663C25B50
	for <linux-kselftest@archiver.kernel.org>; Mon, 23 Jan 2023 19:53:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231712AbjAWTxU (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 23 Jan 2023 14:53:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230185AbjAWTxU (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 23 Jan 2023 14:53:20 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2153D26591
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Jan 2023 11:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674503561;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=aze1G6mgWzCcRJXgFNa8HjfCbOTiXXX/A6U9nxgbJkM=;
        b=OKPxQZbkhphoWnJ+dY37YsPUoGzy1IoQ2cqKEiz72E94QUmuH/09LMOp6CjHIxMExtpoZB
        M6vWmqjX58qp/hT0wWxCiWvaHCHQUKmJo1eDAxVgz8fCBXlTu9aMB/zKdJZLb2BGyXx9N4
        PLasIAoTsnzY/6qZ86k2pYdXBIo07pY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-JZDVN0L7MfuQFgCDu-fvCA-1; Mon, 23 Jan 2023 14:52:36 -0500
X-MC-Unique: JZDVN0L7MfuQFgCDu-fvCA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB437380406A;
        Mon, 23 Jan 2023 19:52:35 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (ovpn-192-224.brq.redhat.com [10.40.192.224])
        by smtp.corp.redhat.com (Postfix) with SMTP id 6618D175A2;
        Mon, 23 Jan 2023 19:52:32 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
        oleg@redhat.com; Mon, 23 Jan 2023 20:52:33 +0100 (CET)
Date:   Mon, 23 Jan 2023 20:52:29 +0100
From:   Oleg Nesterov <oleg@redhat.com>
To:     Gregory Price <gregory.price@memverge.com>
Cc:     Gregory Price <gourry.memverge@gmail.com>,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
        krisman@collabora.com, tglx@linutronix.de, luto@kernel.org,
        peterz@infradead.org, ebiederm@xmission.com,
        akpm@linux-foundation.org, adobriyan@gmail.com, corbet@lwn.net,
        shuah@kernel.org
Subject: Re: [PATCH 3/3] ptrace,syscall_user_dispatch: add a getter/setter
 for sud configuration
Message-ID: <20230123195228.GD6268@redhat.com>
References: <20230123032942.18263-1-gregory.price@memverge.com>
 <20230123032942.18263-4-gregory.price@memverge.com>
 <20230123154101.GA6268@redhat.com>
 <Y87OEdDXwZG8pmmE@memverge.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y87OEdDXwZG8pmmE@memverge.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On 01/23, Gregory Price wrote:
>
> So i think dropping 2/3 in the list is good.  If you concur i'll do
> that.

Well I obviously think that 2/3 should be dropped ;)

As for 1/3 and 3/3, feel free to add my reviewed-by.

Oleg.

