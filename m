Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FFEACA0FFC
	for <linux-kselftest@archiver.kernel.org>; Sat,  2 Sep 2023 05:24:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232339AbjIBFYt (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Sat, 2 Sep 2023 01:24:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbjIBFYt (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Sat, 2 Sep 2023 01:24:49 -0400
Received: from out203-205-221-155.mail.qq.com (out203-205-221-155.mail.qq.com [203.205.221.155])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6D291704;
        Fri,  1 Sep 2023 22:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
        s=s201512; t=1693632283;
        bh=f3BahJ0f5WwmfyARP2+MMnay33J1y6FDk8/4avkW738=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=wpF6JS6KXAIr8io0RvELG1G1Oys49Tc+uSHboZ5n8XMkp/wVMIGbetuMxq2LdXj0G
         iaS0aAH7GXlKTa1Um8UByGQUUF53ler/u2lPAX0iQ5etjPKHqdxVwYN1aj+LZAzMJZ
         MF2ExR5BD0MwLxXSmjCLMymfnscNceLUTxZ8MS5w=
Received: from rtoax.lan ([120.245.114.63])
        by newxmesmtplogicsvrsza12-0.qq.com (NewEsmtp) with SMTP
        id 62613CE1; Sat, 02 Sep 2023 13:24:38 +0800
X-QQ-mid: xmsmtpt1693632278tgbiug7q4
Message-ID: <tencent_2B465711F30DC88514B2842F1D54005E8109@qq.com>
X-QQ-XMAILINFO: NEq0i4SycP3b8o/n7e9Utp3j5PTmzMk0VaaageYuv1vGOoNomrBZd0QBV4XFjx
         hZmvIstl+9IdjzOFT4q5vHpMJrX9JS537Q04Ru2XnY1ZESIh4KDAdN5ipHlYk6zUf4DTN4jd/5aE
         SxZM2g651a3hquWEm0yolNVZazQ7iqYeHJ37R3RYnf+bH7UC85rfiwL8PeE5JHLG4vWBxWEn9pod
         k/uFDmwX76qXG2ou4em1v3DimLFLEiMOA7Zlnr5XNowth1K1qhMF7gKiEP/XiObuQKL+MVTlDbTr
         ovqa2+2epOh/DIK+2104M6LVjLe3Sur1OdCAuiv72JhfdfHqf4vKNdnxpJb6Ne++Z4Chv0gvZPBf
         YKNwm1+xh8I9mO9VckOUYwrYBw9dol/c6AIMsP7gRAoJAsTEiUxPttpFv1QEGZahgSIheROKCHEV
         dbl7kbYidkA8gg0lvKF7WmvTsnsJX7APcpJUTPP88TlItVyclRdoOnuy8nNqzQBDL50dD+Lv2hzj
         rjcA/g/ZikILwca0zTXsrZoCsLDiNAtKmPCNllcc7plFyIJneeczG/aG5ql7MEqM+RCWTl66xqQ/
         dvEluiKsFwhI9pS+LGURWJhRVCIJA3FAgiTiALJMm7ciDp2NUbIegWJo2OvuzClB5XdhjTbsFBAy
         ThrPQGa1RMVFDg5KjNvuIn84rzeDYAz3gZB56bG+lMZdxkuZ2hZ/8YyaFkiHWSJKmH1q3/dlFJIy
         AgpSvabryQ12+Bf9QF+COYu+d0uoGc/NNrQnyYOa441j3cOqW5zbLcxBgko64lgu3q8w7X6osuIv
         /r45qkG8d7RAvaIr1JSsdxEnVZecMmb4URSZM4A8nHqYWdz7BdRPaKL6ILs9YuBwzsZ+thFB4uiZ
         a2jQ/G+uH73hvo++OR4Eh86GfleNbiYBDTPYd+O17azxkFkLIEHxj4oF9+XESU5NLGh14r/7xVZy
         8Ps1mJ0tn32SINEdEhVlyMtl6btS7casr1CoYrXwX2BHgovHfourZqD9zD7wibWg0yjQ1jsvOvnH
         SAMByaP4ZDlyXzXqy8
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
From:   Rong Tao <rtoax@foxmail.com>
To:     rtoax@foxmail.com
Cc:     alexandre.torgue@foss.st.com, andrii@kernel.org, ast@kernel.org,
        bpf@vger.kernel.org, daniel@iogearbox.net, haoluo@google.com,
        john.fastabend@gmail.com, jolsa@kernel.org, kpsingh@kernel.org,
        laoar.shao@gmail.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, martin.lau@linux.dev,
        mcoquelin.stm32@gmail.com, mykolal@fb.com, olsajiri@gmail.com,
        rongtao@cestc.cn, sdf@google.com, shuah@kernel.org,
        song@kernel.org, yonghong.song@linux.dev
Subject: Re: [PATCH bpf-next v10 0/2] selftests/bpf: Optimize kallsyms cache
Date:   Sat,  2 Sep 2023 13:24:38 +0800
X-OQ-MSGID: <20230902052438.139708-1-rtoax@foxmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <tencent_4F0CF08592B31A2E69546C5E174785109F09@qq.com>
References: <tencent_4F0CF08592B31A2E69546C5E174785109F09@qq.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Hi, every one.

I'm so sorry, that i'm not familier with 'how to submit patch series',
I just sent some emails repeatedly using the git send-email command,
please ignore the error messages.

PS: How to send patch collections using git send-email?

Rong Tao

