Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C117360EF0
	for <linux-kselftest@vger.kernel.org>; Fri, 19 Jun 2026 09:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781860129; cv=pass; b=CmDJ54Q25/xAsgkQgvD06ByX+GoUKkfaIEoUeCU0iyh2nVaM/m5tpNiAFlT1HVtAA8JMdbx5Z71NsmqyfRKuGFGoMbM+4KcFXHCJgp3Ywo/X/66KKEwbTHWXLBbq0KCYRhrUdyeKaFjStuuMqfi59nq8UP3sY7k0okjH4cYey9w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781860129; c=relaxed/simple;
	bh=T/K5UlzDllbLEYYLehMYSn+//Xryze9YYv1LULQa/mM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lRGXO51BERFoWb+7ZOf1yHUy8kCq6UFhS/EDpnQzN/TB4Uyp5wBvhO+EA0O8DZPlKnup/M7lrVuOq2HBBPQ5fNNBkZ1X0nMbKOT97mC3Fyi6XK0ZEfesR5Bw59wNbFEWpG4Pr96HEPEkPCo5WXsDlTdGdiGD7VixJo76zVd5aI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PFwqJugu; arc=pass smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PFwqJugu"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7dd5a8dc8a2so14825837b3.0
        for <linux-kselftest@vger.kernel.org>; Fri, 19 Jun 2026 02:08:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781860126; cv=none;
        d=google.com; s=arc-20240605;
        b=hi0jdcZ4GdPmdsflKbg9XV+meoT8D2xjdiPa17COYGuQAz9YvA6ZCXamx19hDNloYY
         iXXbAyfkOCHvcFogpgIjuU4VvmkaOeH4ta/9/zHIcYkuWl0t0bZK+Iu7MvtO9FR4U+nX
         6VKLzXoBIh9DjiP23UpRKL0HTr8HWGLJ2T6eUnwvGVnScA54wP/t+XbEUgVeOiN+kCwp
         XyOgTbTkutfHL14odBXcW8NyLAkbvYvQF0wJlnq5k/P20RXXzBU8TByq69PZQ68nV+I6
         OtvUS8vLmnkB8FQqNJ44h9Ks7rjpIYqtpjP+5PMAS1wdwKl4yQoZ8pde8xWMB+NoFrJp
         bdyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T/K5UlzDllbLEYYLehMYSn+//Xryze9YYv1LULQa/mM=;
        fh=B7ntrGAHDkh9qs0TeZQ34TM3j+qcS3QDTxdkoOiou7M=;
        b=b0UVmxP9o+MwiHCf8vA/Dp6LZD+46U7VrEY/m4V+f0D4QuRqxuZnao5cHykFuuLq2N
         if8WtPzdM730ryTaF9oENdIQv7J/C02eBTF+8C9kMggkcduwgdxDXrY6PVNInI8N13mP
         nNEHdWXVP4XxeF7vUOf9Xr3LPo6+EfAN2tRiaoudwU+vMUlRvUwJWYpB6LUF8MCH0p4Q
         zpuOR6ven/0UclJ+lB/zONNT9/tXINX2hLzs0fhRJFcG3vc24jnHCPW3Wd+RDZSBRX3b
         G3JXSwNbWVPR5VFeJB4xJGlGjva+RdrBP94+7a94g3WK6KDLWQ8jJopw9WkIAr5JVrDX
         BcYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781860126; x=1782464926; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T/K5UlzDllbLEYYLehMYSn+//Xryze9YYv1LULQa/mM=;
        b=PFwqJuguw/X0MUQPzdQpu5Du8dVYZP2egHhfyM2XKAgtuc0MJzeJiwUKuXM3+wzlYR
         3J7u8mlJBTUJ3gjoMCJwiMfoFBuVJyJVne7+yteAB/vBGxhPYroC2GigPQKHMtRhbO32
         PMR2qW2I3UaD3n0/PNiWivNArf6goAbIF5t2w1i4Lxw3VPqJMB9CT7qSOzPdNfOKUVuS
         28UUmHOI12RmR1XgOopLs/Aupz+GAEspuWALWsVQcmL2OEYpGjrd4pKjGFdFumU5g02L
         GthAIqLH5KQ4ILMJ/gOsiu1Lap5eqBY2HVEbGTCmfZTddKw/KsJsNPJTL0wY4TG1Z8Bk
         Rhog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781860126; x=1782464926;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T/K5UlzDllbLEYYLehMYSn+//Xryze9YYv1LULQa/mM=;
        b=CE+GH22MheGiniiGJxmNQ6vMz3ir2ZIYcFWWBtLJmug0T1VTshNvC/LNGHHNch6udQ
         1C7uxGh0f+B6Tqh5tAhCq09HtPHqSeErTX8ILv3ucuPSWl1wzVnuVDW39PL8T0IgYuyp
         DFYNStaWTi+PK66JyXUP48f25ArXar/Sn7D/gEDGIdiQ1CWX7pd2Mx0w++L7pCEaTyKx
         cQJspIzrddhHNg3u3MZk4D9xO0H3p5POujHtaWnnwYi4BIi0lny2kTCA74WTTr83WHFP
         65p+dPhocgoXBGhigBXZxx7PAbSBt8Gb37z021trJTG1iNlEB/pTH9BtDSLYTq3MDxKf
         kHKQ==
X-Forwarded-Encrypted: i=1; AFNElJ/aRjq3MW8+w4yJd3Vhk/qYv9ZgIm7CuuPvMfUs9Yq/DNPaDfbOFnGuBZ08hvRqK6j+B9+M0cNP3nvsGA+PHcI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBa/5i34Ii/Y0pNXZiGUmUSU3ITnxy7eH4vcWAczKhk8fEYiF+
	dSBAuHkraenqK4BUOntXjrqAdP8R7eE6E862B+KrizNzSWHdHdEB3e6+PHtargHA2a0x6kYtz2O
	nBwE61Mp1jI6gPt5FocJ6Omkh6PsW+Ls=
X-Gm-Gg: AfdE7cnnqx5tZzRxAXk717ah7xGbJSwYtRMsqzoL6QtbV4CsgEYq+++felN+7SI64a3
	oMVOrHBkEwRQjv/IeR3HpTe2b++xT3QGrndxF92bwsecYuhhWI74rI/sZmsMnliv4AYqQRfW/z2
	kS/clU6lSV2aODTXvy4yd6KZ5/nC497CX00kaFl1e6wWngrk9yYZ+Re/3uaQR7oCJ/75JZVMpwu
	fHeQlYMthJI1iuk3q2lP4IOU7mjHxdTfozGhxo01mvHngb5ZpClT4/+UgjRDjuTYKgtiMvwqMsJ
	bSXrD7mhOGV7A3+JB3flEIXfom5jBMS+i4uuBGpf
X-Received: by 2002:a05:690c:3705:b0:7dc:ca63:b0 with SMTP id
 00721157ae682-80132d3838dmr20841087b3.40.1781860126104; Fri, 19 Jun 2026
 02:08:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617093557.63880-3-sun.jian.kdev@gmail.com>
 <2dad9b5c184fa101d7cffa1d8f5eea5b5df60f53533d98c68175c9e3ec5ee6ac@mail.kernel.org>
 <CABFUUZFeh18OjQ6EhjD17ZwQKb1aiVNkYKv-hAkVGrHhPpjE4Q@mail.gmail.com>
 <ajOv_oOd1zInaW1b@mail.gmail.com> <CABFUUZHCr=4kb7kSaaPGpc4nkyn32i-svD9v7ONF+TYrrQ-xaQ@mail.gmail.com>
 <ajT3x2H0swzg4yhm@mail.gmail.com>
In-Reply-To: <ajT3x2H0swzg4yhm@mail.gmail.com>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Fri, 19 Jun 2026 17:08:35 +0800
X-Gm-Features: AVVi8CcmPEP5XdoxB6X1yoIuhlHbMlAQ1h-E7WonW2hkMbAK-HKHfU53WVaNd10
Message-ID: <CABFUUZE6uZDjaxa-ss9CYhjNTCt2Z_ND1S6-nGvCLg7hDLTEQg@mail.gmail.com>
Subject: Re: [PATCH bpf v3 2/2] selftests/bpf: Cover partial copy of
 non-linear test_run output
To: Paul Chaignon <paul.chaignon@gmail.com>
Cc: bot+bpf-ci@kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	eddyz87@gmail.com, memxor@gmail.com, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, hawk@kernel.org, 
	john.fastabend@gmail.com, sdf@fomichev.me, toke@redhat.com, 
	lorenzo@kernel.org, martin.lau@kernel.org, clm@meta.com, 
	ihor.solodrai@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 19, 2026 at 4:03=E2=80=AFPM Paul Chaignon <paul.chaignon@gmail.=
com> wrote:
>
> On Thu, Jun 18, 2026 at 06:45:18PM +0800, sun jian wrote:
> > On Thu, Jun 18, 2026 at 4:44=E2=80=AFPM Paul Chaignon <paul.chaignon@gm=
ail.com> wrote:
> > >
> > > On Wed, Jun 17, 2026 at 10:19:52PM +0800, sun jian wrote:
> > > > On Wed, Jun 17, 2026 at 6:31=E2=80=AFPM <bot+bpf-ci@kernel.org> wro=
te:
>
> [...]
>
> > > > I tried reusing pkt_v4 and the existing TC program, but they do not=
 fit
> > > > the skb case this test is trying to cover.
> > > >
> > > > For skb test_run, IPv4/IPv6 inputs with a too-short L3 header in th=
e
> > > > linear area are rejected before bpf_test_finish(). With pkt_v4 and =
a
> > > > linear area of ETH_HLEN, the test fails with -EINVAL before reachin=
g the
> > > > partial copy-out path. If the linear area is increased enough to pa=
ss the
> > > > IPv4 check, pkt_v4 is too small to both trigger the old
> > > > copy_size - frag_size path and verify that the copied prefix spans =
the
> > > > linear data and the first fragment. pkt_v6 has the same issue: afte=
r
> > > > making the IPv6 header linear, only 20 bytes remain in frags.
> > > >
> > > > The existing test_pkt_access program has its own packet-access cove=
rage
> > > > goals and is not just a pass-through carrier. With such a short lin=
ear
> > > > area or small packet fixture, it can fail before the test hits the
> > > > bpf_test_finish()'s partial copy-out path. A pass-through TC progra=
m is
> > > > therefore a better fit, because it keeps the test focused on the
> > > > bpf_test_finish() copy-out semantics.
> > >
> > > If we're keeping tc_pass_prog() then can't we use pkt_v4 and get rid =
of
> > > init_pkt?
> > >
> >
> > pkt_v4 is too small to construct a meaningful nonlinear skb with a stab=
le
> > linear/frag split while still exercising the partial copy-out boundary =
in
> > bpf_test_finish().
> >
> > With pkt_v4, we either do not reach a fragmented layout, or lose contro=
l over
> > the linear/frag boundary needed to exercise the regression path.
>
> I think I'm missing something. Why can't we use pkt_v4 with
> tc_pass_prog() and a linear area of ETH_HLEN? That would leave 42 bytes
> of non-linear area, so a SHORT_OUT_LEN of 30 should work to trigger the
> bug, no?
>

I should have made that part clearer. With a linear area of ETH_HLEN, the
skb test_run path fails before reaching bpf_test_finish(). After
eth_type_trans(), skb->data is advanced past the Ethernet header, so the
remaining linear L3 area is 0. The short IPv4 input check then rejects the
packet with -EINVAL.

To pass that check with pkt_v4, the linear area has to include the IPv4
header as well, i.e. ETH_HLEN + sizeof(struct iphdr). That leaves only abou=
t
20 bytes in frags, so a SHORT_OUT_LEN of 30 no longer triggers the old
copy_size - frag_size < 0 path.

> >
> > This test uses a 9000B packet so it does not depend on small-packet
> > allocation details. Smaller packets might work depending on allocation
> > state, but 9000B reliably gives us a non-linear skb with page frags and=
 a
> > stable linear/frag boundary for the copy-out regression.
> >
> > init_pkt() is needed to ensure deterministic byte content across both l=
inear
> > and fragmented regions so that the memcmp-based validation is stable.
> >
> > Thanks,
> > Sun Jian
> >
> >
> > > >
> > > > For XDP, this object does not have an existing xdp.frags pass-throu=
gh
> > > > program, so the small XDP frags program is needed to cover the othe=
r
> > > > caller of the shared bpf_test_finish() path.
> > > >
> > > > Thanks,
> > > > Sun Jian
