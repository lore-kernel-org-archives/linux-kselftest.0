Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259E02D94BA
	for <linux-kselftest@vger.kernel.org>; Fri,  3 Apr 2026 07:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775202665; cv=pass; b=h3CCrNBSxZbLXkejvyKrw3Vu3pbi3O2A6y/SLciqj6laD2gOTZ1JqcFJ9G555q96ha1GHGgnxEND7OJ+56biSY+Ki24Qsnhn0zMB5EydqOg85vQ8dnBx8+XAEwyrAQEiIh46KjqKTwsZC0w+fuCo1YiLyagaP3VQgcaCjsLZ9Kk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775202665; c=relaxed/simple;
	bh=dd0wcVBzvcg1oc0Uq/WGTRb+kCuStk1ncnJUMitvdEY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uEpWTnjRDlwp6DxWw8WRS0Tr0FX9bZ/YfVCXFjslkjoehjZhNnSgaKRCuCQnA5DfhdBdO3U+W4O6JGhmv4jl4qEUMdhJpHyyqaZv51R8x9B6Nguh2dX9P9B00qsK/XnaVeuOSdmSgcgSZtN1n0ddpwbMugljwRUMquH/HFKPbug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DFHRNrl4; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DFHRNrl4"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b932fe2e1a7so212220666b.1
        for <linux-kselftest@vger.kernel.org>; Fri, 03 Apr 2026 00:51:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775202662; cv=none;
        d=google.com; s=arc-20240605;
        b=L57ZPubB24ySMF0hQjMUb8thAK5m7KyD+Rgpxn3v93DmOICMVtVLUV76Q98G7PHc9G
         hLG7rZrtLrNk9SirD8sB62pqeTCvmMQIhW57N1D7t7IItm1CL/FBPXE5og8bh33UvhPx
         kv6Sd0pB4AjKxsKyKNImLtB6EMxBcCRqCn+wJmdIoKovQ6IT0B/SbAshbO0qHea3BSV8
         5w9r09Qy7tGvW7yQIIpKsOo5L2/B0WhueOi36XM7UTg9fwki3vYEoI1Wgw8hH5DQ0CUU
         xWmgSEoQsJMWdlxiCm2VudFqYaKmnWuc61hroVwap8VwUwMBRTR9dKSSFlgQ6kda4sIz
         Goiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NzoumJBKpZU/3O7s9r+rhYMdWgYGL90pbXwFIlwFZtw=;
        fh=6fRpir+s7PzNQVQCxzIdDSTox7vu7hmTmxO0TVZCjx4=;
        b=CKCxky7jsKk0bpMG+W/mdZy+J415XUpMRal/gGxu1cDqQAlPd4T7nXkDcckPiRK6Db
         1aCT0PL2ZqpsCw845FhOjG3v3XrgKzQSSRUaGxYGkO+KytK82QQpPdTRaMDQgXl/bmOv
         awfVgx+UpHuQGZbJvS46L6ed26IDskhi4GmaXDl+UQToqla4CjnL+GHjq/rr+CFQV91I
         w/orYwbJ9wW1QKGzrOUNhIx+STLj981ugbPWQnf0ygyfxPVxUXUW00gWE26hq/sGu9Or
         0QwJx3gkI+rX1cApMWDPW+v5rwsc5YGDAj0xY6VfYiwEWSRDr6IsFVcAwyR4QfA8d6bX
         GMhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775202662; x=1775807462; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NzoumJBKpZU/3O7s9r+rhYMdWgYGL90pbXwFIlwFZtw=;
        b=DFHRNrl4BPePVNp7vvg1hi9LbLQkMK/qSzBQK1/uSirS3eE+J5/F5UOS0tZj3dF7kn
         VCUYwJf2SHlZWwnXCTIsnTwyGMuqMxzgeM33VbKkzAFtgYaIdse26gnA+oFqhLdP/gRk
         0wsAv8itGxS3r6bTAi9/YxfFzrsW2IIf8bdSKv4dN9Qwk0FJE6Te7NK6GI4Tns36izpV
         MPWnxMj4XIT0MKN75o6X82TegMPtJND0TZBLQkH2d5y3ncQ2YqLMGR8qODueJCLrXU48
         9WejEc1lgVEcLiZCFGmENE1QrE0ufW8U3cmt6Ul086FpUOLifZ0qpR3r3qbTJOCm/7b0
         1qPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775202662; x=1775807462;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NzoumJBKpZU/3O7s9r+rhYMdWgYGL90pbXwFIlwFZtw=;
        b=U4+dhtUhOZ2mh2nSuwW3ryW2L/H45Tz2p3V+U02apV9OvZ2KHoF8XKFmqCqye6gt85
         5Z1cfQiDH5kyQARODNUuYVaQts7BgZCdyFQ46MYECD+gT6Km9zwd6J6UziWs/aYwlDDE
         QyBAAq3b4Mp0XLrIR6h3gg+2bjtDffg3zYthawqLGWz2GPUIGIlQzC5/eaoAJLNoaL62
         ScW+c7onn2GHyT/TARCkbDOAtiHemhOKusx1ar+qnAig5DvlGQ1HvdL2IqrjduR2LYTB
         TMNAGRPUv1iSF7zomxuhmuBykteMsSRBEaLxUtAAixyL6oflXQmMTiodoBmAbosB/kHy
         0YWg==
X-Forwarded-Encrypted: i=1; AJvYcCWFxgiNfJNttb8d5XzLh2IBUJaRqThH/RvX94xD0SURMU2h34U0SyJLpsdT4SmeHRPXIyXfOWCzLN5B2fh1je8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwE2S/zQ1vgG0ZlBZ0dQDI4jjkXQbes5srw5sm2DALqbOwzCOF9
	Hdv5/XDYyE05ajqLi54bJzJLSLP7S3CU4uaKu1y3Nz8iQS1k6RwM02kF6pe6tqJFEOTcsRc3vkz
	6IPU4iMZjFUCF5iRg/U94NmlZCI7CmyQ=
X-Gm-Gg: ATEYQzwllGvx8o32DmS/B+/VUQsrCZ5cG9l63OjpnG2P8bK+HDw93hHI2h/qgAHFtBm
	taWY/A43fGFnHFTFhxY/WmYJap2y2JNQRfTi+kRVcAMfX2hYY9Y97nO2t0X+7I90zmrk0PE9taY
	IEVbE56/aORbhDs1PrPVS58Kp3KBKpOUA+A6C2hsmy1d4d0gkdhki5oTUqf4rVJEGopyaIsxMjq
	z+Ec9qyCobXmyyQeVcq84p5He0UFCwSFdVKs4JZqNADOr2RFFOiiO4Gocin0jkSWEpolSR0ZuR0
	MsYb0jCLsKg/xSn/ew==
X-Received: by 2002:a17:906:478e:b0:b98:1129:51 with SMTP id
 a640c23a62f3a-b9c675492c5mr95779166b.17.1775202662236; Fri, 03 Apr 2026
 00:51:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <f23ed1b3-6321-4e6d-9cda-ec5d34304f3b@blackwall.org>
 <20260330191611.16929-1-royujjal@gmail.com> <20260330191611.16929-6-royujjal@gmail.com>
 <20260331141347.GA1637150@shredder>
In-Reply-To: <20260331141347.GA1637150@shredder>
From: Ujjal Roy <royujjal@gmail.com>
Date: Fri, 3 Apr 2026 13:20:49 +0530
X-Gm-Features: AQROBzCimHZIQikwfz6IXnJcfEgHNzZT7diUDVok-XKy8P3nRmO5_SZI4DRIkdI
Message-ID: <CAE2MWkn3gPc1kBwy2p7r5bx6QozMStM0N6oEutT7g7GnJrKteA@mail.gmail.com>
Subject: Re: [PATCH net-next v2 5/5] selftests: net: bridge: add tests for
 igmpv3 MRC and QQIC validation
To: Ido Schimmel <idosch@nvidia.com>
Cc: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Nikolay Aleksandrov <razor@blackwall.org>, David Ahern <dsahern@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Andy Roulin <aroulin@nvidia.com>, Yong Wang <yongwang@nvidia.com>, 
	Petr Machata <petrm@nvidia.com>, Ujjal Roy <ujjal@alumnux.com>, bridge@lists.linux.dev, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 7:44=E2=80=AFPM Ido Schimmel <idosch@nvidia.com> wr=
ote:
>
> On Mon, Mar 30, 2026 at 07:16:11PM +0000, Ujjal Roy wrote:
> > Add bridge selftests that configure IGMPv3 parameters and validate the
> > resulting Query packet fields for Max Resp Code (MRC) and Querier Query
> > Interval Code (QQIC).
> >
> > This also adds helper binary to encode floating-point exponential field=
s.
> >
> > Future extensions may cover corresponding IPv6 cases.
>
> Please cover both IGMPv3 and MLDv2 since the patchset touches both. You
> can add the MLDv2 tests in bridge_mld.sh.
>
> Also, I think you can simplify the test by simply matching on the
> expected values of MRC and QQIC using tc-u32.
>
> For both IGMPv3 and MLDv2 please test both:
>
> * MRC and QQIC in linear range.
> * MRC and QQIC in non-linear range.
>
> And please make sure the new test cases don't add new shellcheck
> warnings / errors or it will fail in the CI. You can ignore existing
> ones.

I will upgrade the existing test cases in file bridge_vlan_mcast.sh
instead of the previous file (bridge_igmp/mld.sh).

I have some doubts on test case logs reporting. Below are the logs
without my patchset. API used vlmc_query_intvl_test() and
vlmc_query_response_intvl_test().
TEST: Vlan mcast_query_interval global option default value         [ OK ]
TEST: Vlan 10 mcast_query_interval option changed to 200            [ OK ]
TEST: Vlan mcast_query_response_interval global option default value   [ OK=
 ]
TEST: Vlan 10 mcast_query_response_interval option changed to 200   [ OK ]

I am expecting some suggestions from the logs below. And are these
covers both IGMPv3 and MLDv2 for QQIC and MRC?
Actually mcast_query_interval=3DQQIC and
mcast_query_response_interval=3DMRC we already know.

TEST: Vlan mcast_query_interval global option default value         [ OK ]
TEST: Vlan 10 mcast_query_interval option changed to 200            [ OK ]
TEST: Vlan 10 mcast_query_interval number of IGMPv2 general query   [
OK ] -> old case added log
TEST: Vlan 10 mcast_query_interval option changed to 6000           [ OK ]
TEST: Vlan 10 mcast_query_interval in IGMPv3 is 60                  [ OK ]
TEST: Vlan 10 mcast_query_interval in MLDv2 is 60                   [ OK ]
TEST: Vlan 10 mcast_query_interval option changed to 16000          [ OK ]
TEST: Vlan 10 mcast_query_interval in IGMPv3 is 160                 [ OK ]
TEST: Vlan 10 mcast_query_interval in MLDv2 is 160                  [ OK ]
TEST: Vlan mcast_query_response_interval global option default value   [ OK=
 ]
TEST: Vlan 10 mcast_query_response_interval option changed to 600   [ OK ]
TEST: Vlan 10 mcast_query_response_interval in IGMPv3 is 60         [ OK ]
TEST: Vlan 10 mcast_query_response_interval option changed to 1600   [ OK ]
TEST: Vlan 10 mcast_query_response_interval in IGMPv3 is 160        [ OK ]
TEST: Vlan 10 mcast_query_response_interval option changed to 3000   [ OK ]
TEST: Vlan 10 mcast_query_response_interval in MLDv2 is 30000       [ OK ]
TEST: Vlan 10 mcast_query_response_interval option changed to 6000   [ OK ]
TEST: Vlan 10 mcast_query_response_interval in MLDv2 is 60000       [ OK ]

Or is it better to name them properly instead of mcast option names, like b=
elow?

Vlan 10 mcast_query_interval:
TEST: Number of tagged IGMPv2 general query                         [ OK ]
TEST: IGMPv3 QQIC linear value 60                                   [ OK ]
TEST: IGMPv3 QQIC non linear value 160                              [ OK ]
TEST: MLDv2 QQIC linear value 60                                    [ OK ]
TEST: MLDv2 QQIC non linear value 160                               [ OK ]
