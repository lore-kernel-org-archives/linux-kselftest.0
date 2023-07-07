Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B7DEEB64DA
	for <linux-kselftest@archiver.kernel.org>; Fri,  7 Jul 2023 09:17:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231756AbjGGJRk (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 7 Jul 2023 05:17:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229910AbjGGJRk (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 7 Jul 2023 05:17:40 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E7E61991;
        Fri,  7 Jul 2023 02:17:38 -0700 (PDT)
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.56])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Qy7831GrKzqVbv;
        Fri,  7 Jul 2023 17:17:07 +0800 (CST)
Received: from [10.174.176.117] (10.174.176.117) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 7 Jul 2023 17:17:35 +0800
Subject: Re: [PATCH v2 bpf-next] selftests/bpf: Corrected two typos
To:     Lu Hongfei <luhongfei@vivo.com>
CC:     <opensource.kernel@vivo.com>, Andrii Nakryiko <andrii@kernel.org>,
        Mykola Lysenko <mykolal@fb.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Martin KaFai Lau <martin.lau@linux.dev>,
        Song Liu <song@kernel.org>, Yonghong Song <yhs@fb.com>,
        John Fastabend <john.fastabend@gmail.com>,
        KP Singh <kpsingh@kernel.org>,
        Stanislav Fomichev <sdf@google.com>,
        Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
        Shuah Khan <shuah@kernel.org>,
        Anton Protopopov <aspsk@isovalent.com>,
        Wang Yufen <wangyufen@huawei.com>,
        YiFei Zhu <zhuyifei@google.com>, <bpf@vger.kernel.org>,
        <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20230707081253.34638-1-luhongfei@vivo.com>
From:   Hou Tao <houtao1@huawei.com>
Message-ID: <b438d804-f73e-a5e4-0473-f21fa22a4486@huawei.com>
Date:   Fri, 7 Jul 2023 17:17:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20230707081253.34638-1-luhongfei@vivo.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.176.117]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500025.china.huawei.com (7.185.36.35)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org



On 7/7/2023 4:12 PM, Lu Hongfei wrote:
> When wrapping code, use ';' better than using ',' which is more
> in line with the coding habits of most engineers.
>
> Signed-off-by: Lu Hongfei <luhongfei@vivo.com>
> ---
> Compared to the previous version, the modifications made are:
> 1. Modified the subject to make it clearer and more accurate
> 2. Newly optimized typo in tcp_hdr_options.c
>
>  tools/testing/selftests/bpf/benchs/bench_ringbufs.c      | 2 +-
>  tools/testing/selftests/bpf/prog_tests/tcp_hdr_options.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Acked-by: Hou Tao <houtao1@huawei.com>
