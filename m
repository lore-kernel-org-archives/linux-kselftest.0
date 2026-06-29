Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320DB2773D3
	for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 18:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782757494; cv=none; b=IS3RHZUkytJs00WIg6gieK+ANt8JaRpg2IlGWCBeWDfRvytBz16hGMu5x1MhJEnxqIkwpdSloJqEaetGocSr6PgdpQcxgcyLtxCuYqS/DC+pFCfs1RNmfv6St0Ru+GMcEbfdCZBks2/tGaWT7QIpHp3yAZDbxtNxu/hL0o26zoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782757494; c=relaxed/simple;
	bh=wD3MZbsN9jzINnVXN3GY8//2NKqq+BM9+4wJqBbMpj8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=mryoYLRu06oIaTdgJaYTRnKVpDFK9SBEs42Ev4g+fXdYyee0PcoPZT+vAOqVd7TeklGooEZ1Zjq0Cgijp+AcOou7mOuZqo/QzlF/qHUW5fdg8woUyQz4oWVBebq/GQBxLiJFsCQYq2o1u7tfi+E8XyLfagA83zShhJzkhdwToRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fBso08I/; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fBso08I/"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6a116bd18ebso2120848eaf.1
        for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 11:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782757491; x=1783362291; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VgWBPgkIFq0GJmdrKvHCFz2V403YOlZzIZlCfT1y164=;
        b=fBso08I/obKfJVGigsaL/vbX5hEhW8hanNE2ztUwdOCwzJwbxm8RCiFve4x5RG5aX+
         W1zP8ZjhaZQ1nuPmkSM5EL8GOI/ONNbOF16mSdKxkUmHvdpA3cYXpeaSU12eqGmREzGE
         a8nNYNwWGXA/vY1hMfFSbLgMb5yDRp0S+cXnEZhLKZY1so4vjagix6hb57+jqAh96lPn
         iY1FQIIbHsvgRwXWk321L2+bUdgzBS8KoQWCSsg9Tex2/58dEv9Kt2cx4PmABREnXugf
         eg7yadeV0sM2mL80e9Hio8tMusU6vunmUaEtT3NqgsnxciixeZ14DMBkAzI7I+GnA6c8
         2nlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782757491; x=1783362291;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VgWBPgkIFq0GJmdrKvHCFz2V403YOlZzIZlCfT1y164=;
        b=dcPPkzo0XcufPf0A47y6b5h8Mut1HSHGRhTe8Gv7aiCeH6NrSeQRKF2PSdXeoWVlsA
         DJ8zkPvAMaJFbqVPIinpI+zgpSpzoGUn3dyO58gC9DmsaJzKbBcvUtAtBZNlU3k+Zswk
         SXM1aNyFQYtXQQcS9un8dR2y0Jr5rzMHssf5pl+FoeAiQhCRuxzEnpjGUaCVw1g1Mq5b
         oPyF3CFO885K21hsQyoGWS4hpu67TP8tmZZiRytrkSZxIR2P0i6U2o0hPLBAe+pckAzy
         AfuSAlGWCklS2xKgshK4nuMMG8OEpLpEiq4DcPLyGKag2TMMLzO/4qOt+LW2POCtAOXu
         Nfow==
X-Forwarded-Encrypted: i=1; AFNElJ+C9wt2hfpIPVLj1Zu6WUVZ936RoysYKmrZLpHEOYijV16oY5/47HSPGkT6Ttk6AlVExJk6Ii2tEtgS8kxh4M4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQxlMDhLNe9ehDXPjExWpCJrTJCtExJTQHTnC76ECaqENkcz1B
	wBSW7O1ZuS49KKWQELFBBDZw+RRg6fMu1P0n/gdCyRRuNpmf1PiQbnqR
X-Gm-Gg: AfdE7cmb2b7JHT9z93dGcwwexOFua5GJWMGfQd2H98um1y0FzldOID/uqObeTGMlGvq
	q33O7uCu15L5RTfLSIRz3M3Xgam12y+2omx/wvfD4d/KJJ7s71OJo6lRJVRw5ngP/jssIlrEI55
	Zso3+45sLcTLAJ3gZp+FEhOXLPSABDfGO8niYNH8RnAkhxFRpSdhDPYFKcA3ewOxWKlHvuqixAE
	LNb9a7/5lp5s2/qHFWXd2gtJBgnaFXX00vBxbWIsyiidVqlyftLEQMnvZfv19FxELktpUEDh1lU
	WwgtVxhJ2qE2Jeeu8tezg7izRgOgQrSrLsQowyqtb5PqkbHF2pQeiUIfq0Nb/Nqeedbj1PjnYOf
	XVpOrE/aBT+vN7ItEsccKs34flUz2InCdIuwEJu/dTDXvGGfzQ54kMfANeHOHS79bHxKims0rLz
	EcySOGCxKfUWUpXj/Z6O1zM6M+L2MogrRt1qrrgcAf+tHtEQvMpCzaJrmBMEP9r9TGrS20S5wT+
	b1E7LI=
X-Received: by 2002:a05:6820:620:b0:6a1:5cd7:226f with SMTP id 006d021491bc7-6a1893f6428mr479536eaf.66.1782757491124;
        Mon, 29 Jun 2026 11:24:51 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:4f::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a18917194csm371263eaf.2.2026.06.29.11.24.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 11:24:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Jun 2026 11:24:49 -0700
Message-Id: <DJLQSC87KCSV.314DTZAWRNA8C@gmail.com>
Cc: "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "Stanislav Fomichev" <sdf@fomichev.me>, "Emil Tsalapatis"
 <emil@etsalapatis.com>, "Lorenz Bauer" <lmb@isovalent.com>, "Jakub
 Sitnicki" <jakub@cloudflare.com>, "Jiayuan Chen" <jiayuan.chen@linux.dev>,
 "Shuah Khan" <shuah@kernel.org>, <bpf@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next v3 1/2] bpf, sockmap: disallow update and
 delete from tc, xdp and flow_dissector
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Sechang Lim" <rhkrqnwk98@gmail.com>, "Alexei Starovoitov"
 <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii
 Nakryiko" <andrii@kernel.org>, "John Fastabend" <john.fastabend@gmail.com>,
 "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "David S . Miller" <davem@davemloft.net>, "Jakub
 Kicinski" <kuba@kernel.org>, "Jesper Dangaard Brouer" <hawk@kernel.org>
X-Mailer: aerc
References: <20260629172704.1302218-1-rhkrqnwk98@gmail.com>
 <20260629172704.1302218-2-rhkrqnwk98@gmail.com>
In-Reply-To: <20260629172704.1302218-2-rhkrqnwk98@gmail.com>

On Mon Jun 29, 2026 at 10:27 AM PDT, Sechang Lim wrote:
> sock_map_update_common() and __sock_map_delete() hold stab->lock and call
> sock_map_unref() -> sock_map_del_link(), which takes sk_callback_lock for
> write. That gives the order stab->lock -> sk_callback_lock.
>
> The reverse order comes from the SK_SKB stream parser.
> sk_psock_strp_data_ready() holds sk_callback_lock for read, and after the
> verdict tcp_bpf_strp_read_sock() acks the consumed data inline via
> __tcp_cleanup_rbuf(). The ACK goes out egress, where a sched_cls program
> deletes from the sockmap and takes stab->lock:
>
>   WARNING: possible circular locking dependency detected
>   ------------------------------------------------------
>   syz.9.8824 is trying to acquire lock:
>   (&stab->lock){+.-.}-{3:3}, at: __sock_map_delete net/core/sock_map.c:42=
1
>   but task is already holding lock:
>   (clock-AF_INET){++.-}-{3:3}, at: sk_psock_strp_data_ready net/core/skms=
g.c:1173
>
>   -> #1 (clock-AF_INET){++.-}-{3:3}:
>          _raw_write_lock_bh
>          sock_map_del_link net/core/sock_map.c:167
>          sock_map_unref net/core/sock_map.c:184
>          sock_map_update_common net/core/sock_map.c:509
>          sock_map_update_elem_sys net/core/sock_map.c:588
>          map_update_elem kernel/bpf/syscall.c:1805
>
>   -> #0 (&stab->lock){+.-.}-{3:3}:
>          _raw_spin_lock_bh
>          __sock_map_delete net/core/sock_map.c:421
>          sock_map_delete_elem net/core/sock_map.c:452
>          bpf_prog_06044d24140080b6
>          tcx_run net/core/dev.c:4451
>          sch_handle_egress net/core/dev.c:4541
>          __dev_queue_xmit net/core/dev.c:4808
>          ...
>          tcp_bpf_strp_read_sock net/ipv4/tcp_bpf.c:701
>          strp_data_ready net/strparser/strparser.c:402
>          sk_psock_strp_data_ready net/core/skmsg.c:1174
>          tcp_data_queue net/ipv4/tcp_input.c:5661
>
>   Possible unsafe locking scenario:
>
>          CPU0                    CPU1
>          ----                    ----
>     rlock(clock-AF_INET);
>                                  lock(&stab->lock);
>                                  lock(clock-AF_INET);
>     lock(&stab->lock);
>
>    *** DEADLOCK ***
>
> A tc, xdp or flow_dissector program has no reason to update or delete a
> sockmap, and redirect does not go through here. Drop them from
> may_update_sockmap() so the verifier rejects it. It also closes the
> matching sockhash inversion.
>
> Suggested-by: John Fastabend <john.fastabend@gmail.com>
> Signed-off-by: Sechang Lim <rhkrqnwk98@gmail.com>

John,

please ack.

