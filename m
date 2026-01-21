Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9003E47DD6F
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 09:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768988726; cv=none; b=tuCXrNF2V9j5egA/SgLvTG/pJJFdVwepSiHeR6DaCqhpkA39RqL1JckRFdLyi+q6Mw1lHi4PoPEVpwq1V1YtIRIJU8HTLDkAaw3Y2N3WGEp3gv2mQYBml2npu4nZ7fU3vPr6NED0NXenZEarpKIv90cEnwk5EDFdEcIx/OMICtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768988726; c=relaxed/simple;
	bh=LQCZKDYAPVWTL1hfa0m9GqkDC4+oPqHsCFMnnvfMmS8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=s8wRedn43SzirabIdb2DXLJLMTxY2QBUSxBphMeZ4MD0wXE++Yml1+ihkFOIiIoT0KE301Jv24sYGYShphdPYAH8Yi/bseY6lHocpmK3/hshf66DDbLIIi/Q4MG2ndsoAWqW5ZQmwpSzMjB1BYOBb/NAAvUePXrcgkK/1E6UY+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=Zww76dWI; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="Zww76dWI"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b86f81d8051so110083366b.1
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 01:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1768988723; x=1769593523; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=qJ5Xi6Zzr4VTOfswDmjNXoozec/PpuCDq08QJw3b/Ms=;
        b=Zww76dWIJuUUBg27f1wT2NfDrOQVADca67E2F7S3mw9ipRbEBsckDcHsfeCMNjBez9
         YdcFQfVo0rWkYInTS8xClC2HMZ9vtQEjgIktw659+fQogGJ4ZrYy86fyny55ZKmH1zL6
         +JAgi/MbJRRhzIwyoimoKB8cbeLTsnFWvKchpXaTW7imHFdVpUNPIuOpbq/V971GDqbO
         QLM/Z4OCvMUYaXm5zFk4EvaGzNijgXt1sY5N2re25EkmaOoGI6Ln2wy2ynn2edpdXoP9
         C2/p7cUiLmT184PDKbM7cqk3iQPMFJGb9OHmhrwR/yFuVz4g/reqaaHpQ6QfgzmvuKZp
         KRkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768988723; x=1769593523;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qJ5Xi6Zzr4VTOfswDmjNXoozec/PpuCDq08QJw3b/Ms=;
        b=X4/9zZegpq9nNlDNqVRHdNgi3AGi7IYjNubSbbkhHpLEVFWkYlyw/6GYWb7QoYOGFC
         Bvv2hDPb10skF7/crFFwEMKlzR9WjQxXFYdLPJvb+Q6HyZxkVuT1+nByzj0tahj49Va6
         Wrobcrd+Ajlz6mPhWyDu7TrQtdtGZZi8xPnrvD4aQHbbnZanGoseQ+TIzKXFu912FZE+
         o2F9OYq9z/8UbUK4dJZ5a/nEOBB2H4YzwHYBLua07HoCJmobSwmJhuIFhNiwU6mt8fkg
         0JhKi5idxlbojpl3jUzMQvg1wkTpYJ+XVdgRz2ELvHbrCkQVRIP2SAjtmLJ9DxZ56lKr
         eC3w==
X-Forwarded-Encrypted: i=1; AJvYcCXXwMWhs3wwdAGDRQrRFKtII0ZdqGHywq9wSJfGkmMGlG4yg0XZkPhtNmBCxCqlkAMxUEyUEI2j04Y/cAmzu3I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1bvA0rD9UhMaxm9iAVqCH97Bks+8JSnRV3nNFV4JocntgjfYE
	qjC7qakpaUcHTwMrQyNjRShRtNipNEvtKXcqAmzbKjUwHTsNRv2o7FKoqgm5fEODct8=
X-Gm-Gg: AZuq6aICtd1s9+YIgamSGPgb24tFfvWNCAbwo/lxdk+oU9YRKZbrV4WOM7rBnijpjxr
	TrmId5Xaj4ouHSAua6sMBtErCMwRAqETT66L6Z0oWJdu00gGpHpXTClTnIwM9u4zm26FgDU4Iso
	X86J10a82ky+x+ZiaqF9H3oK+1avZgLFQAsqEhiwWbkthWHGKzeJI1ozxsQxrK1fFI1/JHEFw1t
	lbxwT/Niph3BlWla2lvk7BNnYQW5aaYN+XgEgkqxQ6yYm1nwXnqfIJHV0joVELBAkARb9t6zusj
	X3hB5nHAppLBNUwWGECyjmG7xivujE6Nid8c13fEp+/ThEo4ebGdZNEea8DnmOVyah4ApclX1mR
	VQ2muyNxOl2vtp2zeMgIhvIWlbhBo6Hkz89UwwNYla0iosVMVbxMCvGTrhYPcZw/p1cx42YbYm8
	MH/A==
X-Received: by 2002:a17:907:9496:b0:b76:3472:52df with SMTP id a640c23a62f3a-b879388d7c0mr1760882666b.10.1768988722803;
        Wed, 21 Jan 2026 01:45:22 -0800 (PST)
Received: from cloudflare.com ([2a09:bac5:5063:2dc::49:217])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959fc273sm1526702066b.54.2026.01.21.01.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 01:45:22 -0800 (PST)
From: Jakub Sitnicki <jakub@cloudflare.com>
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: bpf@vger.kernel.org,  John Fastabend <john.fastabend@gmail.com>,  "David
 S. Miller" <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,
  Jakub Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,
  Simon Horman <horms@kernel.org>,  Neal Cardwell <ncardwell@google.com>,
  Kuniyuki Iwashima <kuniyu@google.com>,  David Ahern <dsahern@kernel.org>,
  Alexei Starovoitov <ast@kernel.org>,  Daniel Borkmann
 <daniel@iogearbox.net>,  Andrii Nakryiko <andrii@kernel.org>,  Martin
 KaFai Lau <martin.lau@linux.dev>,  Eduard Zingerman <eddyz87@gmail.com>,
  Song Liu <song@kernel.org>,  Yonghong Song <yonghong.song@linux.dev>,  KP
 Singh <kpsingh@kernel.org>,  Stanislav Fomichev <sdf@fomichev.me>,  Hao
 Luo <haoluo@google.com>,  Jiri Olsa <jolsa@kernel.org>,  Shuah Khan
 <shuah@kernel.org>,  Stefano Garzarella <sgarzare@redhat.com>,  Michal
 Luczaj <mhal@rbox.co>,  Cong Wang <cong.wang@bytedance.com>,
  netdev@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf-next v7 3/3] bpf, selftest: Add tests for FIONREAD
 and copied_seq
In-Reply-To: <20260113025121.197535-4-jiayuan.chen@linux.dev> (Jiayuan Chen's
	message of "Tue, 13 Jan 2026 10:50:51 +0800")
References: <20260113025121.197535-1-jiayuan.chen@linux.dev>
	<20260113025121.197535-4-jiayuan.chen@linux.dev>
Date: Wed, 21 Jan 2026 10:45:20 +0100
Message-ID: <87sebzti33.fsf@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Jan 13, 2026 at 10:50 AM +08, Jiayuan Chen wrote:
> +/* it is used to send data to via native stack and BPF redirecting */
> +static void test_sockmap_multi_channels(int sotype)
> +{
> +	int map, err, sent, recvd, zero = 0, one = 1, avail = 0;
> +	struct test_sockmap_pass_prog *skel = NULL;
> +	int c0 = -1, p0 = -1, c1 = -1, p1 = -1;
> +	char buf[10] = "0123456789", rcv[11];
> +	struct bpf_program *prog;
> +
> +	skel = test_sockmap_pass_prog__open_and_load();
> +	if (!ASSERT_OK_PTR(skel, "open_and_load"))
> +		return;
> +
> +	err = create_socket_pairs(AF_INET, sotype, &c0, &c1, &p0, &p1);
> +	if (err)
> +		goto end;
> +
> +	prog = skel->progs.prog_skb_verdict_ingress;
> +	map = bpf_map__fd(skel->maps.sock_map_rx);
> +
> +	err = bpf_prog_attach(bpf_program__fd(prog), map, BPF_SK_SKB_STREAM_VERDICT, 0);
> +	if (!ASSERT_OK(err, "bpf_prog_attach verdict"))
> +		goto end;
> +
> +	err = bpf_map_update_elem(map, &zero, &p0, BPF_ANY);
> +	if (!ASSERT_OK(err, "bpf_map_update_elem(p0)"))
> +		goto end;
> +
> +	err = bpf_map_update_elem(map, &one, &p1, BPF_ANY);
> +	if (!ASSERT_OK(err, "bpf_map_update_elem"))
> +		goto end;
> +
> +	/* send data to p1 via native stack */
> +	sent = xsend(c1, buf, 2, 0);
> +	if (!ASSERT_EQ(sent, 2, "xsend(2)"))
> +		goto end;
> +
> +	sleep(1);
> +	err = ioctl(p1, FIONREAD, &avail);
> +	ASSERT_OK(err, "ioctl(FIONREAD) partial call");
> +	ASSERT_EQ(avail, 2, "ioctl(FIONREAD) partial return");
> +
> +	/* send data to p1 via bpf redirecting */
> +	sent = xsend(c0, buf + 2, sizeof(buf) - 2, 0);
> +	if (!ASSERT_EQ(sent, sizeof(buf) - 2, "xsend(remain-data)"))
> +		goto end;
> +
> +	sleep(1);
> +	err = ioctl(p1, FIONREAD, &avail);
> +	ASSERT_OK(err, "ioctl(FIONREAD) full call");
> +	ASSERT_EQ(avail, sotype == SOCK_DGRAM ? 2 : sizeof(buf), "ioctl(FIONREAD) full return");
> +
> +	recvd = recv_timeout(p1, rcv, sizeof(rcv), MSG_DONTWAIT, 1);
> +	if (!ASSERT_EQ(recvd, sizeof(buf), "recv_timeout(p1)") ||
> +	    !ASSERT_OK(memcmp(buf, rcv, recvd), "data mismatch"))
> +		goto end;
> +end:
> +	if (c0 >= 0)
> +		close(c0);
> +	if (p0 >= 0)
> +		close(p0);
> +	if (c1 >= 0)
> +		close(c1);
> +	if (p1 >= 0)
> +		close(p1);
> +	test_sockmap_pass_prog__destroy(skel);
> +}
> +
>  void test_sockmap_basic(void)
>  {
>  	if (test__start_subtest("sockmap create_update_free"))

Can you replace sleep(1) with poll_read(fd, IO_TIMEOUT_SEC)?
