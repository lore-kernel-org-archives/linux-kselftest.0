Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852FB4BC01D
	for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 16:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781195338; cv=none; b=T5+HCxx2bTTpF6o5kKsfpp2OI3EqXg36gS9ew3pIehoxjgHUFzTheeBdnfqZj4Gf/aCDKut3ZqDdPDn1db7cv5IFyUCWaauETrpKPiJkKo4ULph8L/NS5YQaIa6Kjt6U5mPB/3cXrPpqAwOzaBNUse7A8tWgCBoL6Kb799bKJlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781195338; c=relaxed/simple;
	bh=Dq8U4JeMLdDJZCai9rkKpCchuv1uUA+lqZN3PGfqBIk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ml3lzOkX6LA0EwrcQjvyEIfjFyRE8zGgFm0Wh4P+QfZmFQVxyOLS23fLduiPdrQqO0SNasTekPqUJdNKAI6+J2GMo/mdFmNwOQTVQc9rNwqFSSc/+pr97HIp8ugAclcVOhcluIFijOAf7axg9p4H2BytK8ceww9zDZAIh53P/v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=gO86XJ5l; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="gO86XJ5l"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-30759632453so110672eec.1
        for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 09:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1781195336; x=1781800136; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hmILQTIhg4C2xaf23uaTPKYf63Qsqb45amOoW42QXJM=;
        b=gO86XJ5lX2WhRMfkazLeKXLf7wv1CkXPx9mPNdIgUvnRG0+aMS1WTVPTkSFyz2/uju
         f+dl+CDOeVOGYozPh+AO0+g+AgA2I7Wj8aG25z9PsB5fyPphzH2PzL8g7p25qK12h4XW
         RE1fBgpAck3lEoD+tHqqnHXIFLFe91oecgiTgsV3/5L8YMOhIhmK+3xqnQ5wyeTr6DNp
         NveThIDMWV2oQieMoMTS/P4+oOR4X/CFU0JecME9HoQLWnVGGNzexXvEn+NmYX+57mMD
         8/SRfSGfQ2vSlSUKCnOoHLyi5Jb8wCP3EWlntz/vDnyKTNzvb+FWamw5uieCRTuHLSlo
         G9Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781195336; x=1781800136;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hmILQTIhg4C2xaf23uaTPKYf63Qsqb45amOoW42QXJM=;
        b=WDcEenThARjjtAzReuMjDeXW+7v+jJ1PARTvM08cVPJktMNBKDSi9OempT0+RJn+3O
         Wq75lUg1NFHtHIy8b+ax8SFxTfP6fxMAb5ZofC+7vcKI9hskHraDvMxjcsRpUvBNXy8h
         4YM3FFioXE5n2PXwjzstlkRD/4f/TSLynE+aJZu6riYPh5qWWhUqMNMGUu7BHe1vVAuQ
         2p0r4kSMItcHCrlFVEHy8lethEN2aoi90fovPyE/BjVay6YmJteLMJFGwroFj8nb4UD8
         hGBFhme1culQ4qa3zuQCof3JijbQSrgbukfGWbqWqOOttEY6l3s9vozTwr5DDPuUUu7L
         mtGg==
X-Forwarded-Encrypted: i=1; AFNElJ+70HZ/20SkJO2SiFIU4rUqGFIHwkXXFa+f/dBm4px8+0jTp6NK0M0Y1hlRZsZj+5f7NJyvxzVt7fcgw8eHGDM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtq6vO2twwGYwstzDzL0zjLMnNbOOs2LNQxllAplYxmGcN2GK9
	ux5UG3+WnaEIbrtHQEHCTHuIJZBSkvc2sPAeNs6f9YvUvA8NQ9ge27j1cOnPT0UyG+0=
X-Gm-Gg: Acq92OF5TB/hso8dYwLuUZEdBOKbpi9PAk9kDsqxuAaPJTpGr16YPXKt8OlBs4a+xnD
	bEY7/06N5BNvcJR+16UcKUfvGYFtHgJCsGeH6WbGOjtJPuiWhbGqTFPmmnO0gdf3VPBBQiEWGU5
	MBFWROmGCrrwm8utyes8VXF5zHUTn5NGQolkjedzSEAk3Ykn/GXy+BrgbJbQDLlnf/TCsHZFjbG
	xGyCmnWvMIRgSIztPGjgAqzvHH32wJo1lk7Lh2xF5FCpQgmuNzCWhaQwzcNpHy/ZkPpIIopZGGF
	mmJU5qZtcPuCwUsfAoyscTDqTdcmCBCoCrIrSylWCekLByI5Eb2JzJrPck7XRW6JWfiZyw0cjC2
	gLISKALBt08WlYb8q48crGKqGSN16cVgDdu6afCx+XBTEomMskBTbuaqrhqbvMG3tlXRK7G9ED/
	oMlyhboTruVHQa68s=
X-Received: by 2002:a05:7301:1292:b0:2fc:9ae6:e5a8 with SMTP id 5a478bee46e88-308049eb931mr2752590eec.20.1781195335328;
        Thu, 11 Jun 2026 09:28:55 -0700 (PDT)
Received: from localhost ([2620:10d:c090:600::9f35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30806c47afbsm3701418eec.10.2026.06.11.09.28.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 09:28:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Jun 2026 12:28:51 -0400
Message-Id: <DJ6D1R10KDES.B0BC2FOSLNCH@etsalapatis.com>
Cc: "Weiming Shi" <bestswngs@gmail.com>, "Xiang Mei" <xmei5@asu.edu>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "John Fastabend"
 <john.fastabend@gmail.com>, "Stanislav Fomichev" <sdf@fomichev.me>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Alexei Starovoitov" <ast@kernel.org>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Song
 Liu" <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri
 Olsa" <jolsa@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>, "David
 S. Miller" <davem@davemloft.net>, "Eric Dumazet" <edumazet@google.com>,
 "Jakub Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>,
 "Simon Horman" <horms@kernel.org>, "Jakub Sitnicki" <jakub@cloudflare.com>,
 "Shuah Khan" <shuah@kernel.org>, "Jesper Dangaard Brouer"
 <hawk@kernel.org>, "Sechang Lim" <rhkrqnwk98@gmail.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Cong Wang" <cong.wang@bytedance.com>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH bpf v2 2/7] bpf, sockmap: Fix wrong rsge offset in
 bpf_msg_push_data()
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Jiayuan Chen" <jiayuan.chen@linux.dev>, <bpf@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260611123538.156005-1-jiayuan.chen@linux.dev>
 <20260611123538.156005-3-jiayuan.chen@linux.dev>
In-Reply-To: <20260611123538.156005-3-jiayuan.chen@linux.dev>

On Thu Jun 11, 2026 at 8:34 AM EDT, Jiayuan Chen wrote:
> From: Weiming Shi <bestswngs@gmail.com>
>
> When bpf_msg_push_data() splits a scatterlist element into head and
> tail, the tail's page offset is advanced by `start` (absolute message
> byte offset) instead of `start - offset` (byte position within the
> element). This makes rsge.offset overshoot by `offset` bytes, pointing
> to the wrong location within the page or beyond its boundary. Consumers
> of the corrupted entry either silently read wrong data or trigger an
> out-of-bounds access.
>
>  BUG: KASAN: slab-use-after-free in bpf_msg_pull_data (net/core/filter.c:=
2728)
>  Read of size 32752 at addr ffff8881042f0010 by task poc/130
>  Call Trace:
>   __asan_memcpy (mm/kasan/shadow.c:105)
>   bpf_msg_pull_data (net/core/filter.c:2728)
>   bpf_prog_run_pin_on_cpu (include/linux/bpf.h:1402)
>   sk_psock_msg_verdict (net/core/skmsg.c:934)
>   tcp_bpf_send_verdict (net/ipv4/tcp_bpf.c:421)
>   sock_sendmsg_nosec (net/socket.c:727)

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>

>
> Fixes: 6fff607e2f14 ("bpf: sk_msg program helper bpf_msg_push_data")
> Reported-by: Xiang Mei <xmei5@asu.edu>
> Reviewed-by: Jiayuan Chen <jiayuan.chen@linux.dev>
> Cc: Jiayuan Chen <jiayuan.chen@linux.dev>
> Signed-off-by: Weiming Shi <bestswngs@gmail.com>
> ---
> To sashiko:
>
> Regarding bpf_msg_push_data() reading "copy =3D msg->sg.data[i].length" w=
ith
> i =3D=3D msg->sg.end (appending at the very end of a full/near-full ring)=
:
>
> This is pre-existing code, not touched by this series, and reproducing it=
 needs
> a narrow combination -- a pure append at the end so the loop exits with
> i =3D=3D msg->sg.end, a full/near-full ring, plus a prior push/pop histor=
y that
> leaves a stale length in the otherwise-unused end slot. A freshly built r=
ing
> zeroes that slot, so copy stays 0. We don't consider it practically repro=
ducible.
>
> Even then it's already covered: the overflow check in patch 1 ("copy + le=
n <
> copy") rejects the dangerous case, and __GFP_ZERO in patch 3 prevents any=
 data
> exposure. Not worth fixing here.
> ---
>  net/core/filter.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/net/core/filter.c b/net/core/filter.c
> index 3c8f1cedb217f..3e555f276ba80 100644
> --- a/net/core/filter.c
> +++ b/net/core/filter.c
> @@ -2872,7 +2872,7 @@ BPF_CALL_4(bpf_msg_push_data, struct sk_msg *, msg,=
 u32, start,
> =20
>  		psge->length =3D start - offset;
>  		rsge.length -=3D psge->length;
> -		rsge.offset +=3D start;
> +		rsge.offset +=3D start - offset;
> =20
>  		sk_msg_iter_var_next(i);
>  		sg_unmark_end(psge);

