Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793155608;
	b=GrUJztQ/Ot8LCOs/NK6jsqMkvwhAhE5ULhq0oPU+3/kpYfLHJ5IvONO/PU+J0RcmYQDi
	 WAFe7ifQwn8LiWTQM4o1A8DkvdBqfwGqg1okcP/lH42t82r3eqOdT8SIKXcEHY1fUDp/T
	 SE/Z2lrPo0k+b4BSxpd2fBl0f3RHm2o2e99SOKDNwXLqCym+8g9xlRWzXwh/WAUrlFFa2
	 B0VZqGiQ4zevZZ1MN184sl+fo7UT1VwR+a4bT2k+8oEV2sKpf3gLaL0wy/oO/UM38wScH
	 OAom3DHluMeBIfWSUxxoRS+VgcSkrMqPkNvFjfmzIkVKayznleu7R1q9DssFU6bWtpQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793155608;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=I52LHaB5PwXqz1HrgzYi1fpZSy27WurVCS9Q1Wgtl+M=;
	b=iwYMGfHAQGB5fYp9Mb2z9dJ2kuQ/7Gh4JqqL/ErddObzDQS0qy6Tmwo1IsIDv80+FZlV
	 PcjN1zm22gk8sMHZIEaVt7Utdc54qZC2GqTocj7MbkS/NcZQuz1mnkvGqqi3A9ml0PhhJ
	 tFQdzaH5a9ZmT/3C7OXW/GoWHSSSjbP9IPZyyQKLeAX7xfU8AhL2vtkOLy5vOVe2JWd1s
	 p0fscJzTcWvIlwpPAmr/dHDrn3AhiUFbZLNIl2AX4VVoggHY95+sBWgcgRyDd2INkcfTt
	 PPtNdXQt7s7v1RQhInNaaSUvtJgdLJxpIyjFnxkOKOTdthUOcgGvt+2bNJIg31VjHEQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vmcgappq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F90606A31F
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 02:46:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30F90606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vmcgappq
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8ac9d666d4eso3955697b3.3
        for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 19:46:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793155606; cv=none;
        d=google.com; s=arc-20260327;
        b=QKru21sU0sJPf+ANnAtArEOovJIuOJ3LZ/FHxFW9kTpHjsfHcxSYMSplNbceywEx2h
         PCdXd5Mn4FSVAPx5mQLZ7KNbGhqhXhFdSpFahpTtjXhBoGiPtOnBQdC6SwczLuViKN+g
         SgR+NShZDaq0oJUA+wq9eH5pJlV7S0/AVkqPXg7+AWnSN6NVRzFvhC8Dj4yZ809n4lif
         n/ciFybxMadfF0cYJdnPmDmlfz6aO1PtZcJ+/p5L7hggs93l1Xx7pxFAahq7ZnczKv+I
         IbAARW1J8AQK1+irJ9Ko0HFnMuW/KLxAUuaNymIWxPI6uTWxqeciQVDg6U9/4fbk4Zwt
         t9+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=I52LHaB5PwXqz1HrgzYi1fpZSy27WurVCS9Q1Wgtl+M=;
        fh=N4qa/gfzm/2MPcKzWTk7ViIvDVdTHJlaDJaF5KqG2Rs=;
        b=ntOuyAW529Nq5BYFHS7DY2kQiIqzPJTpCAeAjjbngnvMTwdo7VhEEskc3oBmz8Aa/6
         0yB8ut61emwTaf0SzqN9y+5TZqDPfuSlEubJMZzNd4SqHZyvjTaloRrfV5NuNlBOJZxn
         EXIW83hbmxaGQ9wOel49rlU8n/V/Nl3ffqPtSjW9mp4si76N3RVdA6yMqI3n2zUNFR/s
         BlCIZ5eNiO6GdoRBK2VMTQ2H8TxpJ7sTY58XLMmcY1R02tKghH7mqoKi4ZSkitMFMKIh
         Uan9xyiQqXRRWK542t1LtRmpofJyLeAeIsL8CZ7eD/MNP5FcAaKRbVnpGVCWmoC0vqOv
         6DSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793155606; x=1793760406; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=I52LHaB5PwXqz1HrgzYi1fpZSy27WurVCS9Q1Wgtl+M=;
        b=vmcgappq3ChTfrWn5Zc2JhU/m6pFYqFbDTFxjscxo3exp5Ji/wRESxqXM7sjMzu2B6
         9MSpUQeO2UXvbOwPMw2aaP3qBBRaBUsFm8qlldwyZOhKtFXTvUd5VSRm9WtLkGQbRcqK
         FK23NyihgapiqlvYoVleGUJGiGDvGCTNNqZSAgIrv1XOMuEVS4xBfWLKUV8G7QJrpSCu
         XlCMO+RKIoZJimqv5+YzBoKccFFZxN1fr1jrNIapz5bVCmj91Ny/FFiMF/H19hLLkF21
         gUrVv3hlekzrsBuDvtLcLiCYZ/MnHpFED61djDie8gNsyXAwppXYPYDzAlYDqXpy5JAJ
         8R9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793155606; x=1793760406;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=I52LHaB5PwXqz1HrgzYi1fpZSy27WurVCS9Q1Wgtl+M=;
        b=RN2uU/p7v89ok7uHqDXl51lgIoNPDIxUOYJgCJ3yDQaIwrTt2MecFR4CJVKG9KiiP+
         1GoaUKRzshX3wJ2BNwduCuSBnsU+hIBocxxtZKewwFhXmiCNMhz9lDV0m/nOpsP75l5T
         ZPiqeXZtgd4VLj/vWjC/+W0PQtPcdUexqZXT1NMqQwhBDaCmDE8/kMx5xsLZSSZ4CplU
         WUSZ94tE2qM9y4T+TrPs5ccZqaEdia4FGUIdl1ForqimWGrMRHgKG6FP47GN2fZ+PdjX
         wD4PFK/hcZn278KLhpFdudyl/kYJ227DdHpA5yrjEyZ3BnbhWB9bd0IxKT1HpZguUpyD
         hhnQ==
X-Forwarded-Encrypted: i=1; AKwUvBxNJ8ZlOMo89YSLfirNvXoJpo7RrdhdXyFVH0DRPpLWC1j2C/cDNMhQCFWkYbTe6kl0nQad49QKfzIAU3EbDKM=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+74oDTtao9crfez/EPP/No8a+ldrlaqDHMy/ZcBC7FS8MlfVE
	hvwmLD5zY5f4IsNIvnK7hsWssyOFOEzaO2SKEnVTrR0MYRGB1bpm64WRPBYLBDtoNtZlWSdaH25
	uF5b1rs5eFRQolxnLVUX55/6cuVpaTJs=
X-Gm-Gg: AYBFou2nWzcwBABmtZguHQqXqQi7NabGGhYHvYe4SB4m7+wvF9wro0L12hS1XvW/tDo
	bTNJCKtgQQ6SA0QJDYiA/a+aJW4TBD4cSTg+rcfgJ8D8qat4ZjD9dRC7B1GzlG+naYPqXaBVT3U
	q5TXig7xeVNQcsWaBc0M2q/Q3kmYJ1FnyUEVZpPgDD04u4Het2Q/gltPm+PhfPbBHjnZIU8N/uM
	ycr9+rSYjae78aI+BnKEqnnHC3uST5S6xbOI2blOt2OGqlegtb18kLrWPVysd4Q74tW7H758+Cy
	eMqgB7njN9l9PORgGk/8g5HiLgzmkpPKf0iL+8/29dpXOfYkVbRW36D/+LHxV3RfoJzfkkH41jP
	nJOUT7Z9VWd/+crMgWU2unLDNDtK2fgAtu7HZwA==
X-Received: by 2002:a05:690c:4dc4:10b0:8ac:dbb9:21fd with SMTP id
 00721157ae682-8b1b5d16d9fmr4883047b3.104.1793155606062; Tue, 27 Oct 2026
 19:46:46 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 27 Oct 2026 19:46:45 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 27 Oct 2026 19:46:45 -0700
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <atkhvvxcDrzXwgb1@boxer>
References: <20261018-xdp-v5-send-20261008-v6-0-7336e1282ca3@gmail.com>
 <20261018-xdp-v5-send-20261008-v6-5-7336e1282ca3@gmail.com> <atkhvvxcDrzXwgb1@boxer>
From: Bochao Cao <bochaolucky@gmail.com>
Date: Tue, 27 Oct 2026 19:46:45 -0700
X-Gm-Features: AclHuK-g3_ihsyv8_HZ6qgGi_NjQi7GYZhXUkN52iOVNDvgLEC5AJGo_pbo7zm8
Message-ID: <CAHKNYVXu496o4Fa5Gi9AisPpf+O_3mi3V_VpaLN71G2i0rd7hQ@mail.gmail.com>
Subject: Re: [PATCH net-next v6 5/5] selftests/net: Move the XDP feature test
 to drivers/net/hw
To: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Shuah Khan <shuah@kernel.org>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org, 
	=?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Tiezhu Yang <tiozhang@didiglobal.com>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Petr Machata <petrm@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

Hi Maciej,

Thanks for the review and the pointer to your series.

> why is veth so special cased here?

Yes, the goal is to enable testing against real hardware. I kept the
veth-specific handling to preserve the existing coverage, including
the GRO-only XDP_TX regression case.

For the next revision, I propose following your runner separation:
keep the hardware runner under selftests/drivers/net/hw, and move the
existing veth coverage into a Python runner under selftests/net.
The veth setup and XDP_TX prerequisites would live in that runner,
with both runners using the same xdp_features C helper. I would also
share the Python execution logic where practical.

I saw that your series adds the generic skeleton rule to net/bpf.mk.
Would you prefer that I base my next revision on that patch and keep
any remaining build fixes separate? We should coordinate this so
that both tests use the same rule.

> Maybe we could commonize this?

That sounds worth exploring. Your channel handles endpoint
synchronization and progress, while xdp_features uses it for test
start/stop and capability/statistics queries. I suggest handling
commonization as a follow-up. Do you see it as a prerequisite for
this migration?

The alternating IPv4/IPv6 choices and IPv4-mapped IPv6 arguments
were inherited from the original shell test. The mapped form is
used by the helper's address parsing; IPv4 probes are still sent
as IPv4 packets. I plan to make address-family selection consistent
across the feature cases, based on the configured endpoints.

I will also move the address conversion and timeout dependency
check into initialization, use the bin_local/bin_remote naming,
and simplify the path conversion. I will check how to use
EthtoolFamily for the feature queries.

Agreed on Remote.deploy(): I will split the scp fix into a separate
patch with the appropriate Fixes tag. I will also correct the stale
comment about remote BPF loading.

Thanks,
Bochao


On Wed, 21 Oct 2026 22:34:06 +0200, Maciej Fijalkowski
<maciej.fijalkowski@intel.com> wrote:
> On Sun, Oct 18, 2026 at 10:05:54PM +0800, Bochao Cao via B4 Relay wrote:
> > From: Bochao Cao <bochaolucky@gmail.com>
> >
> > Replace the private-veth script with a NetDrvEpEnv test for a local DUT
> > and remote tester. Build the helper with the shared BPF rules and
> > installed kernel headers.
> >
> > Compare detected and advertised features, wait for DUT readiness and
> > bound the remote helper lifetime. Pass local commands and scp arguments
> > as lists so paths containing spaces work.
> >
> > Run veth XDP_TX when peer GRO or native XDP provides NAPI. Skip only
> > when neither is present. Read GRO with ethtool without changing the
> > peer configuration.
>
> why is veth so special cased here? On my side [0] I added separate test
> runners: selftests/net python runner runs test tool on veth pair and
> selftests/drivers/net/hw is dedicated for HW-backed netdevs.
>
> Because I assume the move of this tool is to open this up for running
> against actual HW?
>
> Also, seems two tools would be introducing similar functionality which is
> a TCP control channel. Maybe we could commonize this? I'll ask LLM later
> about it :P I have not looked into xdp_features C side.
>
> Furthermore, we are gonna have a conflict with skeleton building
> enablement within Makefile, but that's heads-up to maintainers.
>
> [0]: https://lore.kernel.org/netdev/20261016174338.787135-1-maciej.fijalkowski@intel.com/
> >
> > Tested the runner's skip, failure and pass paths on Ubuntu 6.8 with
> > ethtool 5.16. With isolated veth modules, IPv4 and IPv6 probes receive
> > 0/10 replies before the GRO-only XDP_TX flush fix and 10/10 after it.
> > Existing peer XDP programs and offload settings are preserved. SSH
> > deployment and execution from a path with spaces and a quote also pass.
> >
> > Signed-off-by: Bochao Cao <bochaolucky@gmail.com>
> > ---
> >  tools/testing/selftests/bpf/.gitignore             |   1 -
> >  tools/testing/selftests/bpf/Makefile               |   9 +-
> >  tools/testing/selftests/bpf/test_xdp_features.sh   | 175 ---------------------
> >  tools/testing/selftests/drivers/net/README.rst     |  19 +++
> >  tools/testing/selftests/drivers/net/hw/.gitignore  |   3 +
> >  tools/testing/selftests/drivers/net/hw/Makefile    |  15 +-
> >  tools/testing/selftests/drivers/net/hw/config      |   3 +
> >  .../net/hw/xdp_features.bpf.c}                     |   0
> >  .../{bpf => drivers/net/hw}/xdp_features.c         |   2 +
> >  .../{bpf => drivers/net/hw}/xdp_features.h         |   0
> >  .../selftests/drivers/net/hw/xdp_features.py       | 146 +++++++++++++++++
> >  .../selftests/drivers/net/lib/py/remote_ssh.py     |   2 +-
> >  12 files changed, 189 insertions(+), 186 deletions(-)
> >
>
> [...]
>
> > diff --git a/tools/testing/selftests/drivers/net/hw/xdp_features.py b/tools/testing/selftests/drivers/net/hw/xdp_features.py
> > new file mode 100755
> > index 0000000000000..dda114033b8ab
> > --- /dev/null
> > +++ b/tools/testing/selftests/drivers/net/hw/xdp_features.py
> > @@ -0,0 +1,146 @@
> > +#!/usr/bin/env python3
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +"""Check that a device's advertised XDP features match its behavior."""
> > +
> > +import ipaddress
> > +from pathlib import Path
> > +import re
> > +import shlex
> > +
> > +from lib.py import bkg, cmd, ethtool, ip, ksft_eq, ksft_exit, ksft_run
> > +from lib.py import KsftFailEx, KsftSkipEx, NetDrvEpEnv
> > +
> > +
> > +ANSI_ESCAPE = re.compile(r"\x1b\[[0-9;]*m")
> > +RESULT = re.compile(
> > +    r"Feature .*: \[(NOT )?DETECTED\]\[(NOT )?ADVERTISED\]"
> > +)
> > +
> > +
> > +def mapped_address(address):
> > +    """Return an IPv6 or IPv4-mapped IPv6 address for xdp_features."""
> > +    address = ipaddress.ip_address(address)
> > +    if address.version == 4:
> > +        return f"::ffff:{address}"
> > +    return str(address)
>
> does it have to computed every time or could we store this once at main
> within cfg's built-in dict like we do for binary paths?
>
> > +
> > +
> > +def feature_command(binary, feature, dut_addr, tester_addr, ifname,
> > +                    tester=False):
> > +    """Build the helper command with the configured endpoint addresses."""
> > +    args = [str(binary)]
> > +    if tester:
> > +        args.append("-t")
> > +    args += ["-f", feature, "-D", dut_addr]
> > +    if tester:
> > +        args += ["-C", dut_addr]
> > +    args += ["-T", tester_addr, ifname]
> > +    return args
> > +
> > +
> > +def run_feature(cfg, feature, ipver):
> > +    """Run one feature with bounded helper lifetimes and verify its result."""
> > +    cfg.require_cmd("timeout", local=False, remote=True)
>
> are there any cases where timeout would not be available on the system?
> even if it needs to be kept it feels to me like a pull out candidate onto
> main() and skip the whole test suite once, not per each test case.
>
> > +    probe = cmd([str(cfg.xdp_features), "-q", cfg.ifname],
> > +                fail=False)
> > +    if probe.ret == 4:
> > +        raise KsftSkipEx(f"{cfg.ifname} does not advertise native XDP")
> > +    if probe.ret:
> > +        raise KsftFailEx(f"Unable to query XDP support: {probe}")
> > +    if feature == "XDP_TX":
> > +        link = ip(f"-d link show dev {cfg.ifname}", json=True)[0]
> > +        if link.get("linkinfo", {}).get("info_kind") == "veth":
> > +            peer = ip(f"-d link show dev {cfg.remote_ifname}", json=True,
> > +                      host=cfg.remote)[0]
> > +            if peer.get("xdp", {}).get("mode") != 1:
> > +                cfg.require_cmd("ethtool", local=False, remote=True)
> > +                features = ethtool(f"-k {cfg.remote_ifname}", host=cfg.remote)
>
> isn't the proper way to utilize ethtool commands is to do:
> cfg.ethnl = EthtoolFamily()
>
> Also this feels like it should be within veth runner and scoped at
> test_xdp_tx()
>
> > +                gro = re.search(r"^generic-receive-offload: (on|off)"
> > +                                r"(?: \[fixed\])?$", features.stdout, re.M)
> > +                if not gro:
> > +                    raise KsftFailEx("Unable to query peer GRO state")
> > +                # The peer needs NAPI to receive XDP frames.
> > +                if gro.group(1) == "off":
> > +                    raise KsftSkipEx("veth XDP_TX needs peer GRO or an "
> > +                                     "existing peer native XDP program")
> > +    if not cfg.addr_v[ipver]:
> > +        ipver = "4" if ipver == "6" else "6"
> > +    cfg.require_ipver(ipver)
> > +    dut_addr = mapped_address(cfg.addr_v[ipver])
> > +    tester_addr = mapped_address(cfg.remote_addr_v[ipver])
> > +
> > +    dut_cmd = feature_command(cfg.xdp_features, feature, dut_addr,
> > +                              tester_addr, cfg.ifname)
> > +    tester_cmd = feature_command(cfg.remote_xdp_features, feature, dut_addr,
> > +                                 tester_addr, cfg.remote_ifname, tester=True)
> > +
> > +    with bkg(dut_cmd, exit_wait=True, ksft_ready=True):
> > +        # Bound the remote process itself, not just the local SSH wait.
> > +        remote_cmd = shlex.join(["timeout", "--signal=TERM", "--kill-after=5",
> > +                                 "90"] + tester_cmd)
> > +        result = cmd(remote_cmd,
> > +                     host=cfg.remote, timeout=100)
> > +
> > +    output = ANSI_ESCAPE.sub("", result.stdout)
> > +    match = RESULT.search(output)
> > +    if not match:
> > +        raise KsftFailEx(f"Unable to parse xdp_features output: {output}")
> > +
> > +    detected = match.group(1) is None
> > +    advertised = match.group(2) is None
> > +    ksft_eq(detected, advertised,
> > +            comment=f"{feature}: detected and advertised support")
> > +
> > +
> > +def test_xdp_pass(cfg):
> > +    """Check XDP_PASS detection against the advertised capability."""
> > +    run_feature(cfg, "XDP_PASS", "6")
> > +
> > +
> > +def test_xdp_drop(cfg):
> > +    """Check XDP_DROP detection against the advertised capability."""
> > +    run_feature(cfg, "XDP_DROP", "4")
> > +
> > +
> > +def test_xdp_aborted(cfg):
> > +    """Check XDP_ABORTED detection against the advertised capability."""
> > +    run_feature(cfg, "XDP_ABORTED", "6")
> > +
> > +
> > +def test_xdp_tx(cfg):
> > +    """Check XDP_TX detection against the advertised capability."""
> > +    run_feature(cfg, "XDP_TX", "4")
> > +
> > +
> > +def test_xdp_redirect(cfg):
> > +    """Check XDP_REDIRECT detection against the advertised capability."""
> > +    run_feature(cfg, "XDP_REDIRECT", "6")
> > +
> > +
> > +def test_xdp_ndo_xmit(cfg):
> > +    """Check XDP_NDO_XMIT detection against the advertised capability."""
> > +    run_feature(cfg, "XDP_NDO_XMIT", "4")
>
> Why some are v4 and v6? I was told to be flexible and support both.
> Why we map v4 to v6?
>
> > +
> > +
> > +def main():
> > +    """Deploy the helper and run the six feature checks."""
> > +    with NetDrvEpEnv(__file__, nsim_test=False) as cfg:
> > +        cfg.xdp_features = (Path(__file__).parent / "xdp_features").resolve()
> > +        cfg.remote_xdp_features = cfg.remote.deploy(
>
> maybe we could refer to these via bin_{local,remote} as other hw tests do?
> but that's just a nit.
>
> > +            cfg.xdp_features.as_posix()
>
> what does as_posix() do and why is it needed here?
>
> > +        )
> > +
> > +        ksft_run([
> > +            test_xdp_pass,
> > +            test_xdp_drop,
> > +            test_xdp_aborted,
> > +            test_xdp_tx,
> > +            test_xdp_redirect,
> > +            test_xdp_ndo_xmit,
> > +        ], args=(cfg,))
> > +    ksft_exit()
> > +
> > +
> > +if __name__ == "__main__":
> > +    main()
> > diff --git a/tools/testing/selftests/drivers/net/lib/py/remote_ssh.py b/tools/testing/selftests/drivers/net/lib/py/remote_ssh.py
> > index 924addde19a3e..5e2950a7c95fa 100644
> > --- a/tools/testing/selftests/drivers/net/lib/py/remote_ssh.py
> > +++ b/tools/testing/selftests/drivers/net/lib/py/remote_ssh.py
> > @@ -33,7 +33,7 @@ class Remote:
> >          file_name = self._tmpdir + "/" + self._mktmp() + os.path.basename(what)
> >
> >          if not os.path.isabs(what):
> >              what = os.path.abspath(self.dir_path + "/" + what)
> >
> > -        cmd(f"scp {what} {self.name}:{file_name}")
> > +        cmd(["scp", what, f"{self.name}:{file_name}"])
>
> agree with sashiko report this deserves to be a change on its own
>
> >          return file_name
> >
> > --
> > Git-155)
> >
> >
> >
