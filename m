Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21F336682A
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 18:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776795694; cv=none; b=bVmlJWyctOXLn3DI0rSu5jtKwTtyonrgMjK8NYAcg0HJB9BT3r5Y7+esItFSxhYGbjVOt7KoLWXe0xatWyxpYKwigz4Er0vaJFY+UJLXUvq3cchr6iWhmYns8NK5B8iDI6uGh6rEHdkIVNJaAxEviDfEPPASZLsJB2N8/9h1efQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776795694; c=relaxed/simple;
	bh=aQmfxg7NQpvGz9XaY5eGgk1AWvqY2YAH6p7UeRcAVIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KdtP/Q6rmtD0vhHuzmndlgfcz49QYmP30JwsZgJpWNzSBtUV/++/iKyZXYZyDZTnQW/sZlwMWmeLIlDDXuuOTcqmxDuoGf9BgSEYpHSg3zdPaOEq99uV6ndYz0VJ4hLoS+ZpwuhuztPdP+PCI34gVykgfduhmCXLnVSWqCvUFZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oJoelv2H; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oJoelv2H"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43fe8bda8e9so2378015f8f.1
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 11:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776795680; x=1777400480; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ey1/flgNoHl/BMtWwmVozPsjz6fm2TXt8LsvNUUYd8c=;
        b=oJoelv2HHEVJnzn6fnmH8P6XhUL/qLzKdzJeg6fPIWUdz6xtf0A5UPHXH7BgykZZFK
         HggTElADNEdJUN4i26O5eM8XYGcDjFL/h9O1xMVnY9LxgCEaE+DfFJpAupdt+1Ikhpi8
         hq9TwZXNbtTPmy43l90iDTsnIHhPd8oNVCJlZ9HiX8G/fdVzdDei+99m+CPs3osyozgm
         2Wkxe973kQKDxlImQoVSyH5PWiWMBz3C5UPAXytBSqwQG48DBy6biM4+lJmcW6xg8T2w
         UKf6VX7CoXsVf77AdZWJGSfDQczxxPaEug4OdKrNboaRt3SGnXfF1mAts6d2MOC6rDn3
         4W+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776795680; x=1777400480;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ey1/flgNoHl/BMtWwmVozPsjz6fm2TXt8LsvNUUYd8c=;
        b=j6qem7bCax8d3329ZSPGZG0lrl8/ocNtbemdGSxRlSnj92R7XoO1Nf3fhhH/XxKLt5
         +de/tBKj2pRhjFnz7kELsvbIqOjM59PddVK9pJOePz9sORv1Qmpf7HfRdk6hror4zHaK
         xrzx40UbaZgHxjfxKKpwTvG6/PsZH20l3/bZL6V7TLx/H0D7q3Cb3Lg8PIkkNxwhLrAq
         ItV6p1dz9duinrcq9GpzEAFyBlOFwv9j5cVyCxUMpgT40YCLzzgHMZa8jhw1g2FGrovD
         e85mtHBILWbcG7IylspkoCAJ5eg743Bo/0iAxx59WWbqIsz+pUGRxslsiVQVqS1BTool
         KrdQ==
X-Forwarded-Encrypted: i=1; AFNElJ8VgvQNb4KA91hzVU/z8EoTOJsemZ47kM3VHatQXbFea1KfTJRxsQI4LD6wZEv01sGeiMtY05ywbk9PUG6s3es=@vger.kernel.org
X-Gm-Message-State: AOJu0YylGnma4szuzQKAHqGN1XjDdmxjpMaL0fWLpAsairZRsWSneafs
	sR5lg3W/1pUYTbvyoi3aw7RgPdABLtcphw4XLG48tRyXkc51PdfZs3Ni
X-Gm-Gg: AeBDiesHZOLdK0VCalratFpODeTOgGCCLcUs2Zqrn2g7vudfDoZQyxDweUuJVWpiysM
	nEM9lQ13G4RjRNuUhNcSAxgEauxDZmxCTL0U3TtLEiQbyclEkQOcIgI/4aQmYncWQSxXfIQ/1Xh
	NaQh+9KEeLzvz3OX8KuznJSxOMTY34bzoSa1uwhVXhI8o0O4rK7v/VR2cXzynqhf+8n+kg6ooT4
	QJoLHBZ7hGJZy3prqlGHRtnpvuDslYP8gVavVa4vYq72zJNhBXdfvZfAzKT9IQ77xhwf/ly1SfJ
	FM0nyuSzAN5YRJzSDITM61CU13noomner8X7dXuMgNW2YuWoKjx6wfknPp84wmRKz6bE/64t3uf
	AqXqqEqt1qkDc98SDhFfT+gefxA6XJ8I4bX91as4fsmjh4iKJ50bpwAx6vd7HhKl5JTieaZemLO
	tC3YoIY4HwIONxvqFlM42wE4VlA9AI/UGymTuoH3i0qLzbJW2g53OlKNL+eMIJJ9WOX3N4IBCrH
	HmZ3etjntASvySXOtE1+mmqzrb00oc/k81LoMSVFspfMWJ89Ib5f4M5DZkeN/YQJ34GyUCwLPes
	Tw0xBPv0TuwiBMRheoDBsXSAl9YiBb0lPozhY9j1CHSPXPy2HNHbzA==
X-Received: by 2002:a05:6000:2082:b0:441:1c18:f779 with SMTP id ffacd0b85a97d-4411c18f7c5mr10736741f8f.37.1776795680060;
        Tue, 21 Apr 2026 11:21:20 -0700 (PDT)
Received: from mail.gmail.com (2a01cb0889497e0026dd69ace0c02e6e.ipv6.abo.wanadoo.fr. [2a01:cb08:8949:7e00:26dd:69ac:e0c0:2e6e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb1365sm41235025f8f.7.2026.04.21.11.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 11:21:19 -0700 (PDT)
Date: Tue, 21 Apr 2026 20:21:16 +0200
From: Paul Chaignon <paul.chaignon@gmail.com>
To: Alexis =?iso-8859-1?Q?Lothor=E9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
Cc: Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@linux.dev>,
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
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org,
	Alan Maguire <alan.maguire@oracle.com>
Subject: Re: [PATCH bpf-next] selftests/bpf: drop xdping tool
Message-ID: <aefAHLdVZaOmf1Os@mail.gmail.com>
References: <20260417-xdping-v1-1-9b0ce0e7adf8@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260417-xdping-v1-1-9b0ce0e7adf8@bootlin.com>

On Fri, Apr 17, 2026 at 05:33:02PM +0200, Alexis Lothoré (eBPF Foundation) wrote:
> As part of a larger cleanup effort in the bpf selftests directory,
> tests and scripts are either being converted to the test_progs framework
> (so they are executed automatically in bpf CI), or removed if not
> relevant for such integration.
> 
> The test_xdping.sh script (with the associated xdping.c) acts as a RTT
> measurement tool, by attaching two small xdp programs to two interfaces.
> Converting this test to test_progs may not make much sense:
> - RTT measurement does not really fit in the scope of a functional test,
>   this is rather about measuring some performance level.
> - there are other existing tests in test_progs that actively validate
>   XDP features like program attachment, return value processing, packet
>   modification, etc
> 
> Drop test_xdping.sh and the corresponding xdping.c userspace part. Keep
> the ebpf part (xdping_kern.c), as it is used by another test integrated
> in test_progs (btf_dump)

The xdping_kern object file is just used in bpf_dump to check we can
parse the license as expected. You can replace that by any other test
with a GPL license (ex., btf_type_tag_percpu.bpf.o) and remove
xdping_kern.c.

[...]

