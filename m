Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A82138F64E
	for <linux-kselftest@vger.kernel.org>; Mon,  7 Sep 2026 23:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788823402; cv=pass; b=jAZCXARbfVRNGyaOcyvT9miZIPdBuaAjw0gBx/n/O5/Ji0VVfEXNPRl388mcI2us2R0vtOsE1L/mu1pSFRLyqaD8NsUg5dcJsaeS4d6gQoBJUEza81e8ApHcmZvDiUVCA9VMp/5lRr5cmBmD1jAMw8tq5Zty+HA0p8kF/bayb6w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788823402; c=relaxed/simple;
	bh=jfAp60OBp4doOiN+x+Yf0On7RHIw5hZfHkDWrPwTz6U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bUBNOa/uxtbAOu6zU4ZGTuQbF7+QyO/DKVr4XGBLlramPXTDpM2fnO1OQQLvDDKUu6FT9zz1+NvSzcU2luFgUeeiwwL1SM9nLNtbqXomKAYRXHbZ/L8R8RPDJ7s6OsndHYxMmi8yFlx/VkrPtnQyG8nm1BLjaCUQgKRPV0495vI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HpzOhlsq; arc=pass smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HpzOhlsq"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so3199377a91.2
        for <linux-kselftest@vger.kernel.org>; Mon, 07 Sep 2026 16:23:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788823400; cv=none;
        d=google.com; s=arc-20260327;
        b=DntO1oCF7//6NH+ikaomhNIxx+lgMvB3wmc1rn1jagMSLjBnyxq36IgPdcHp0zqzP4
         IxrhK4Odvh2l0FiDlnzgdpjxNJljebonvYkhAiu4PJmUCWuEf+LVfqyyjLxghzEfqE64
         vdOi/zTxksKegbya0W1CZ5kQPH0C/ZL8Tt3DjPda0IJ/bj22Bv3PWGrNasabZGM/YAw1
         iqWBozzOd2YYjJrvTl7apHhl6PDPBV6d5xz70ai97no1QEfbhl22wDsNhHfQj3cV6Usl
         OPpW7pWWQ2r9xQb3G+aViFI38iQ58w0PSzKZGro78PilpL2FI9SZ0E8ysNnOJ0ccTAZV
         MkNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0IgSRwxcuB6vnZUxcMMegnldun7vRf9Aq4Po2V8pKwA=;
        fh=d3G0Wie8IAVU9O6O80q2Lhl+R2U0sglwbQ+bDejqVmI=;
        b=iNdBGhlDNjE2XOPrxUCFfMmlJGT0M80AxRfIHYGt5GX+AO1WpJSO9KubC/PVo2qDJ/
         1KVAnaM2lfKT/Ykmuv6q4wtQv1Q2Th6XjscLPIjyYzFJlzEtLrKxfUpEYpVjT4CORMv0
         +botUo8IUVZFrbDMiharf+LaqVdfcYh7KlEEVzTG5VoF/KLniU5mtCXD4aWSVaUIvWtp
         AaRSOjE1Byanra8kV7exU8VBglDcUqqh1iMAtcetak7LEWthTH88n4wkiFjix2TLagVI
         c3h6Q6XThs9hV+n74ImTyRQMOPFC64EDKK8PaCRRd63tZlTzCH7E04aV1vRyYQQTdBFi
         U/oA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788823400; x=1789428200; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0IgSRwxcuB6vnZUxcMMegnldun7vRf9Aq4Po2V8pKwA=;
        b=HpzOhlsqs1wTA1S2qEtpNxFT1eY274fqC9BMPpUDx7bLrVEmt9ohAcHvk8GzPshCwF
         0FZ4a2Fu5wZ9jdxdoX6XCAMO/ZGDKwHAWmd9hQCF6knaaR5gPMgHzZzD5jeMFGWHsDeZ
         wxZo1TolvpdeZZXz+SSaHfWdqhzrXkW8JxDgeF6oy45jtfELHkLKYenRq46VlNd5sw4l
         Tk7P9wFAQYfexwEhMQXAhFSAuWpMDlrcEid9kRzOkYHbD5ALyZj0d6ICGSHLXdM401qL
         /i9diuZHsYJu8lnsAbDbDgcA3xUc4k6Vxv5o90HrsCwQlBhQ0761KsOO+fYpPPUuAJnd
         GS7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788823400; x=1789428200;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0IgSRwxcuB6vnZUxcMMegnldun7vRf9Aq4Po2V8pKwA=;
        b=UFIPF4KH7K6pmvDjdFQCj/3btWwaS2ZMGbbKor77hG3i7RhCebQgdQMT3ETqcl0nrL
         fTQfp0z50tjbHhCThaKut6ukwjtsNzTcSWzjc8N/6PvOS10RJshU0Cby9M/c8xap6972
         CsfRdj1UPmNK9V68a993zeNmkeo3X7tFRcA1U6H4RwGBmFIRT5tuTMLOI0888ayYCja9
         IL0MDR22+o/Pv0Di0N9s76bI6V7J8/NBVM0ts4HTeufVEEKhEQhT+6NXDVLpVxStdPcH
         nRn7I2lg3Ui7b2dOIUOaPIzJDwhrJqyHjg+gcn7oGCgSPZltfMWpOhoSFh7O4xSIvhZ/
         0Hrg==
X-Forwarded-Encrypted: i=1; AKwUvByYZEhQ3Fux5hCEso2+n7K0tgoCkYzg4rM5gkUaqJmgrA8A4M/4H6RRbV6cAF6RQJsa/abrdDZ11Tor/8kOJ68=@vger.kernel.org
X-Gm-Message-State: AFuF++lhV9yeQHrXfpbIfkf1dPZa6PEUPhCefqWOI9ja/XjS8yKHMxhq
	jsrMDmFEMi1qM1qRqHP/dWzglfbQ5LC3NXQzB085Jntu5iDGNyAZerxWiI5CXuMkwd7NSjudbxD
	QOnqo5xWlAPkOWSvHmFr5BsvppXUS0zjgB9ct6suU
X-Gm-Gg: AYBFou0n4CTH46PfhiHu1WIHXfuMvQajyKA7sB8yUbRjzwA+J9+72JaUHA4RxVkQ/5D
	oe/TBYXq+ox2Cbyp1Lq8p/QIDV5i+iDZtd2H4/rPKOk36nkAYwPfBxgQMTOSyWJtrlv5KzmnRGe
	x9NGSHYyMsYkCQrmc+R15uuLF78RyzmjJ73oRrMckZh3CDA0Uyx+QzVfI58fLUxDSLLavGwdgW9
	HVMWwBi1MY0q/g08hM0XhvC4S6GO7F0b8ibAaLUx6tXvdv1bYovWURtZHD460k/hjT0GgjJks59
	AafR3TNWOMXz2mRkOhpvCV157AFGb1f+SutPIthE10Vvj4+rCKC1BvgZH6SkxbjegDLrOROOwD6
	RsZt2XaSSLge715JaxNLLZTY3B2qEegJUXQHkUqvrBOHRYIAtnA9CuAC5
X-Received: by 2002:a17:90a:d2c7:b0:398:9bd1:3216 with SMTP id
 98e67ed59e1d1-39b262e4e02mr36924728a91.23.1788823399150; Mon, 07 Sep 2026
 16:23:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906074135.185212-1-jiayuan.chen@linux.dev> <20260906074135.185212-2-jiayuan.chen@linux.dev>
In-Reply-To: <20260906074135.185212-2-jiayuan.chen@linux.dev>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Mon, 7 Sep 2026 16:23:06 -0700
X-Gm-Features: AcwNN1Xz9UhdXiFIx-Dg3fA6cQJzjy8WgHXHsftsUBO_tigszkI2pXJJ9JByUSk
Message-ID: <CAAVpQUCzacvL7n0DejvtYQB2ZnHiUM_sg4-d==iviyvVKv=_xg@mail.gmail.com>
Subject: Re: [PATCH bpf v2 1/3] bpf: Fix out-of-bounds read of sk_protocol in bpf_sock_destroy()
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: bpf@vger.kernel.org, Xiang Mei <xmei5@asu.edu>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Neal Cardwell <ncardwell@google.com>, Shuah Khan <shuah@kernel.org>, 
	Aditi Ghag <aditi.ghag@isovalent.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 12:42=E2=80=AFAM Jiayuan Chen <jiayuan.chen@linux.de=
v> wrote:
>
> sk_protocol lives in struct sock, not in struct sock_common. A timewait
> or request sock handed to bpf_sock_destroy() by the tcp iterator is
> neither, so reading sk->sk_protocol runs past the object:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> BUG: KASAN: slab-out-of-bounds in bpf_sock_destroy+0xc7/0xe0
> Read of size 2 at addr ffff8881047d11b4 by task test_progs/428
>
> Tainted: [W]=3DWARN
> Call Trace:
>  <TASK>
>  dump_stack_lvl+0x91/0xf0
>  print_report+0xd1/0x630
>  kasan_report+0xf3/0x130
>  __asan_report_load2_noabort+0x14/0x30
>  bpf_sock_destroy+0xc7/0xe0
>  bpf_prog_c3dd61f9d9cd9f37_iter_tcp6_timewait+0x9f/0xb7
>  bpf_iter_run_prog+0x538/0xde0
>  bpf_iter_tcp_seq_show+0x26b/0x4b0
>  bpf_seq_read+0x424/0x1210
>  vfs_read+0x197/0xe40
>  ksys_read+0x119/0x240
>  __x64_sys_read+0x72/0xc0
>  x64_sys_call+0x647/0x27e0
>  do_syscall_64+0xe5/0x610
>  entry_SYSCALL_64_after_hwframe+0x76/0x7e
>
> Only check sk_protocol on full socks. tcp_abort() already knows how to
> deal with TIME_WAIT and NEW_SYN_RECV socks. Also fix the comment, it
> never matched the code.
>
> Fixes: 4ddbcb886268 ("bpf: Add bpf_sock_destroy kfunc")
> Reported-by: Xiang Mei (Microsoft) <xmei5@asu.edu>
> Closes: https://lore.kernel.org/bpf/20260702224519.800135-1-xmei5@asu.edu=
/
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
