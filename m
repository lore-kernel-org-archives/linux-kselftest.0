Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A9A3A1697
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Apr 2026 21:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776894688; cv=none; b=hI2glEDSa61w2Ys650VVfR0YP5GeskHyD4rodBvDXv5PCR+VDi8lUI2ArUckX1Am7WR0A5FKQVMSelsbyDUAZNo+IjLUyxLUnOgbOsAdmIt3Kg8OrAJQxLQB8o5P04hGIovcS5Wqupr2JcTRwWBMCIw+di/Idxq6/MDdbgiES+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776894688; c=relaxed/simple;
	bh=xLR7/Wot+FXZ1Ew/rIkiouhKCMOIbSMG6rMeuY6RhSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AxJTXnkdgIM7zGj+6Oes8iyBsSke1TofiSiJWlYGEu+axipGBe3y68ufuxYtElDctA/fmt+Fz91ox6xXikoFDtFO/F67zJVn4W/I+wZIaG5HZH38apzN17bZPAUS/29nzTGNYhOPZ3nFKZyKTDr/4UkfEE+rTrXhrkRWX3Ea89c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DPL2z4cY; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DPL2z4cY"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43cf7683a28so4056858f8f.2
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Apr 2026 14:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776894685; x=1777499485; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9npoNohnanVNqr3tknK64s3YC/XC8dcwMAoGONJ+baE=;
        b=DPL2z4cYor+QQH4TF5gXU+aI2Ks4XHr/orJCwc+n8nPdV30R+ltbdooJ2LjiEoqYv4
         oeJlbq6cWS4xcN9URHpLucD5D/FfEijeWmp3+zi4FbbdqkU6dJif1AuDpf6YmU+R56eY
         JscA24tMqMhqWNdK2bgPrxmQYNWlXNGck2BgiruVea/BDmpv+TyB6E5qlGA9bOOy1IgN
         YE1cVsZrCmbCkxTA1JVoHs+H80j8lDEqKvfrwiC3/FQSG/XizywH1Ssf5WYjHBcn2lUa
         13lLs7BAdGNlNKQO1NuUcBUwlqOq4r7J0Eiu4JND+6NHrQ820mz2cPanHDaT38FdI56m
         l1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776894685; x=1777499485;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9npoNohnanVNqr3tknK64s3YC/XC8dcwMAoGONJ+baE=;
        b=OOMlUDeKBJQNa8r65h2odB5Oa1Xxqwuab/V1t4f9s4lYPe2nZpYbMHRO3nS3JlMuGq
         KtgrZ9L6UYvyNY00GjQxWawD1ZIypeg7+hHlNvfWntQVOp1a7mmqJUao1H73Nicblihw
         3CkSem80aHyCf5VSMrPk/2e/p2d9y09yPQhCscKdahk+jmWHAgG8ZnBVhfK0DMR7wWZB
         RqG4bAY36h2TktQczgtFk+q29LQGUQvyuH8rpAAkWwmpztsu8RWVo6CgiJNq0we6Ucqz
         fwfNlAH3aj/HP7keklXzo6hLJ7SW1HPRkYG4P+GF1SYLUuz8sVeeckHq6+CvAqHVQUB9
         YePQ==
X-Forwarded-Encrypted: i=1; AFNElJ++M+3oefUuO0Po3+obpsfXaAbOC5rYMAZ3RYc8+7BZNoW7hxQVkplSa0fJHcZQwyLTjlyssfXd5QpNsI3cydQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbBxrjZBo5aYCJDUvzohv3t4c2TPYMhVEAY72Y9WCjtmmief1N
	N/pynNEzwJSYv/UXPN97FLJ3z0vS+hYee26cxhl8aOjPcchLzwf9TJmP
X-Gm-Gg: AeBDievJUyIswLeA576ZR+SeI6awKYDiby7JJcxOAp70zZmtPpnqZpkIueR066JpcoP
	i3kwwNlggfet9k/ZxX3N8i+aaaNs3NIbOSbYJ5BGewhkWjlbD7ZFFtQ8j2WDuhvJHXswBUR9s6m
	8zJTHF4tZr2E8B1q6ypeJlyiNvVLLMKatF51++IA4G0rrQ/majI+Nazu83bOIgPUpIXvyEhzcdI
	fJTRpPRo4fLPai6YmsrZx1Y5HOfVSu3ExStb1+MEf6dW4x66WjGGcRS4vslHOlr/ftS9otDcRDq
	2HTY/tKPTHcSOhdkYJAWZWRqeEYJ58Za8iaHXyElcsv2a9YKd6e/cAU1hKBtutQMLuCZEM1KAxH
	HRTgOefxjx2sdmnoDOZRTNQC0ENgLE9S4tJetqvTfbPY2nsmvuGtf1MigqzEFo2LdHzS2SlcTw+
	YtmHtBeWtPxTTDSm8Ang8OpwPsSuy8OHRcXVnpfCXDfySWyMY1CaEgklarCR1qL7DfhJLklP0O4
	3aLVUoqef12Rk5GMgKO6n5dx3iOaQafk0wUvPTTNBXLlNWFTLHq3nUSZYPGSCsNw/q4OuN3U8R5
	vpmk+k6sv7lzTFG5y9AV8HVmhT6jN1yHmIdhkpq1BKvX6CuPQf6lEYZhAjSeccc=
X-Received: by 2002:adf:e789:0:b0:43f:e94a:e773 with SMTP id ffacd0b85a97d-43fe94ae82dmr22387800f8f.27.1776894684917;
        Wed, 22 Apr 2026 14:51:24 -0700 (PDT)
Received: from mail.gmail.com (2a01cb0889497e00069634438ccb7ad1.ipv6.abo.wanadoo.fr. [2a01:cb08:8949:7e00:696:3443:8ccb:7ad1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44123d23e0bsm9675361f8f.15.2026.04.22.14.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 14:51:23 -0700 (PDT)
Date: Wed, 22 Apr 2026 23:51:22 +0200
From: Paul Chaignon <paul.chaignon@gmail.com>
To: Alexis =?iso-8859-1?Q?Lothor=E9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>, ebpf@linuxfoundation.org,
	Bastien Curutchet <bastien.curutchet@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH bpf-next v2 1/2] selftests/bpf: make btf_dump use
 xdp_dummy rather than xdping_kern
Message-ID: <aelC2iC_KbIq5jwx@mail.gmail.com>
References: <20260422-xdping-v2-0-c0f8ccedcf91@bootlin.com>
 <20260422-xdping-v2-1-c0f8ccedcf91@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260422-xdping-v2-1-c0f8ccedcf91@bootlin.com>

On Wed, Apr 22, 2026 at 06:20:24PM +0200, Alexis Lothoré (eBPF Foundation) wrote:
> In order to prepare xdping tool removal from the BPF selftests
> directory, make the btf_dump test use another BPF program for the btf
> datasec dump test. Use xdp_dummy.bpf.o, as it is already used by various
> other tests.
> 
> Signed-off-by: Alexis Lothoré (eBPF Foundation) <alexis.lothore@bootlin.com>

Acked-by: Paul Chaignon <paul.chaignon@gmail.com>

> ---
>  tools/testing/selftests/bpf/prog_tests/btf_dump.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/bpf/prog_tests/btf_dump.c b/tools/testing/selftests/bpf/prog_tests/btf_dump.c
> index f1642794f70e..9f1b50e07a29 100644
> --- a/tools/testing/selftests/bpf/prog_tests/btf_dump.c
> +++ b/tools/testing/selftests/bpf/prog_tests/btf_dump.c
> @@ -1027,8 +1027,8 @@ static void test_btf_dump_datasec_data(char *str)
>  	char license[4] = "GPL";
>  	struct btf_dump *d;
>  
> -	btf = btf__parse("xdping_kern.bpf.o", NULL);
> -	if (!ASSERT_OK_PTR(btf, "xdping_kern.bpf.o BTF not found"))
> +	btf = btf__parse("xdp_dummy.bpf.o", NULL);
> +	if (!ASSERT_OK_PTR(btf, "xdp_dummy.bpf.o BTF not found"))
>  		return;
>  
>  	d = btf_dump__new(btf, btf_dump_snprintf, str, NULL);
> 
> -- 
> 2.53.0
> 
> 
