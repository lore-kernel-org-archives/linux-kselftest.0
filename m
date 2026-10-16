Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CBE4611E5
	for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 08:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141184; cv=pass; b=pvf4gk6OsfypvLHApZ3ka1+K7T2p+7onWQ74+rwxWDbJIcJXuuG+j80w1/O9/UiPG3RynM6TVoDth6ABgMexnzqHyIGhmSDLB4T2oI+hKa/T58yy5P1YT0ygLVFnV89X6IErfafoNeRFygnWHgSIz2ONiTyWB7CjqvLcWbJkQVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141184; c=relaxed/simple;
	bh=tX8oW19EzNSpx55rVPyv0ZfQzctQtnlywYu1+2gW2R8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nN7n5rBqP1p46eYt5QaPopHMClt2V2WDJlz5aQm7a+adAUoYo96hvbXjT3UE3VN4wo5I66O0z6RwL2PTe+CDyAjT8EJOV0rPuoN8SaaQZpTyUYuuaGVaT0iYcHII1yQLowF8BDneS9W+d8ro0YyKNcf7VLahkQ5d/9SMAJFLD64=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AqD6hVh5; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AqD6hVh5"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b1aa36fc0eso8568a12.0
        for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 01:59:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792141181; cv=none;
        d=google.com; s=arc-20260327;
        b=opp0ugKbzFTR51xLBZ3YXljCYs5qWM7xfiI/AhVxk/hHWwIl2Ur6bW6mV7w7DdTvQz
         JRtnybcC811TPo7bqc3LYPP/fGRocI0vkHthpCI6QbwZ5mitANmCBHrALWB0xzQ2If/2
         11adB032m/MIDNPdj510coicQ3wD9UnRvYk+xq4NJUL/Wmiws2EEr1NmkhQ/sHh4Je+C
         Lpn1zRkWzESB172zktT3OxUvHU7pveQdS7/PAZi9DvXTKZK/xPuxNPkU77+sOWBAlTyc
         NowZ0n+5spQcMgwjPpZLh6FMx44yC1ccODZTRtwvPZ986O+49WrnQMbjdINNNTgHBzi5
         4RcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EZlGH4yy9O7O0nf1ZYvJL4ZoQnTfHAsB9O8BKxrx/Xs=;
        fh=4trZVbiSH9IEW26LiIW8ABmqf1fu5s4hKKRkNlRmo4E=;
        b=XWhWQ4tx19UHWzHfEdhr0QL/YIkaL6afwWsDB1lAIFoKCVbPAEaW6Bsk6bvmYCPpo2
         vUwBvxvxaT7KQSxw3jbIAOAn3wyjEJAYB0AUgVkxacafeXto1Bce6f6oS7M+kgUgqeIB
         LOHKArr1DubT6UDCcYSnwln1KRuTBUwvQdCoVpaWNDpiU/tzaetTRhQhZ0/WrBGV6NdX
         INdfT9BPFrI9tYjLs3rl+pgIq9j38wrISDOHgK/BRcYFO33vX+/8Pf2SyVSzo690NJ7C
         zf2lHXpeuAv44Bmz714083uA78B5PTA251+GvcuXnbGlFwdRoSXe51rAZn0rWEjdfyNJ
         9bMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792141181; x=1792745981; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EZlGH4yy9O7O0nf1ZYvJL4ZoQnTfHAsB9O8BKxrx/Xs=;
        b=AqD6hVh5Z8fsmeU9NWVsCuw0LvJ4423W89OeuInlBsI6XDsT6K//yzPoLT5m8HbJfh
         offi0z3iCY9M7g/YE/QZ9uSCmbzN/yB+j6kHHYXPfPp+gJEco49tuFOYQRD4fdtKnpia
         OJ29jEM9LUnCBAIFRwV7Qo61yGxZ2XbCNVCXvePMbQJ7OokiX56LnTyj8TfZodb9e+6J
         2yNoBfR8ijIVY3SfKdln8IF4BCMScMOLgLasTQA/ZEXk5YH0Whv2WLcn8YNZmtAyfn9Y
         9l4vI4wlmM7f4Mn+lyI8VxxB6fqJfSro1+mLMppkUBm1AXdtxhZk3QCRy0luHD36UGzj
         h3NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141181; x=1792745981;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EZlGH4yy9O7O0nf1ZYvJL4ZoQnTfHAsB9O8BKxrx/Xs=;
        b=RIYdOGlOp0RHQxnJDHesyFvNgQ2xHgcNSZlTpFH/WmpJCSGShGF/yETB7EvLf8jqmM
         kZRO4+Z3PAI2ezAA7UD5LUjOCP6wVZZuYYrbXmcRiGb8RwNIUiqYW+vfJ/cl6iWr99HE
         soGkTjahponSA5lo7OTth7S3m8NQOlWVtgI/vMUHw+iiqZniaqIWWUy7ofc+0DIQcduc
         ScbSikAY8r0vIA5yYDJFjFpcxaOtlt2L4xoXWPMebkCTCMfQWcyZNI3R7bG72Rct7Fi/
         FqRwBf6mCyGWWdc5ADpOTuwRMUN7Q+hKlkOCYOJxRjQ2VAY2CsOPasswoGho6UWYVdPI
         dHsQ==
X-Forwarded-Encrypted: i=1; AKwUvBzQ8pV1G3SiYubgGo2h9AzSmyBH9WN8NiOFSN1DeONeo3hgXq7zMQ82bhuX5WHoGmphsKitBJdwi578lq7RMQA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKoqoKxAw55MHoOHCTVw66Xw34TyV2UVTGs5gJyg+aMfYPun7qR
	/btlTaSFhqQ5FwSTbuxPILwL4STyD4bomq4fMNeilqJ2DjH8o0phQD/6KZuR0IV5olpAWvE5gWa
	Y/qR7OvRcnoqK85I5IXxkiXCjva5EGKp9kdml7sOc
X-Gm-Gg: AYBFou2EStngDo0S2xnXooJYrbBiOmoWyT9mHzA4bWge6ZOLe0cMvRUueLPwz7mh46N
	ukcgxVdtUM+MPXJ3ZM0HDCE0IvVX7WPvihDIlV12ubx8/kI+WIe0fQkH6fG5p4TzUbolFLOwLHf
	a2eUkmITZQyGs29GM2ubdRi5uWXff6pcXcDStvT95CgfFKeyT54xc0kj6GcobHEQh142OhmtkVQ
	sKWBQuoKj3yNdR0DDOPDqxyu1wWo+RSSRbU+YTbmCkoNASRU196aZ6O6o7miiCwpA0vr+kqFD1T
	vRL7SxEp5TcDL0FlM2Yt/sUBO1HcFOrGN++HguKETK9AKoRT+5fR2tK4EFX4NCi2h9wTa8WtKX4
	0XKiJe2aydlUSB1vXvEQuCgSn
X-Received: by 2002:aa7:d7c8:0:b0:6a9:d188:2374 with SMTP id
 4fb4d7f45d1cf-6b38c3c7baamr30067a12.1.1792141180097; Fri, 16 Oct 2026
 01:59:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015073736.2944215-1-tavip@google.com> <20261015073736.2944215-3-tavip@google.com>
 <CAAVpQUCpFC-7J=uEgBfh37hFb5BCJvhJQZx7_YKEDCtvbGrGWw@mail.gmail.com>
 <CAL4WiiozXgApewA6WWQA--YxaweezQASpiOiiLz7=ijrqbkqgQ@mail.gmail.com> <CAL4WiioJjvno8r7YeLCTf00q9L5w+OOGLbGz-t330R=NZ8ATkQ@mail.gmail.com>
In-Reply-To: <CAL4WiioJjvno8r7YeLCTf00q9L5w+OOGLbGz-t330R=NZ8ATkQ@mail.gmail.com>
From: Octavian Purdila <tavip@google.com>
Date: Fri, 16 Oct 2026 01:59:27 -0700
X-Gm-Features: AclHuK8hZWfSCQBFUZf2062w8cM86knegB4R5UxwwsJOxtJtgSEQ4r1q2T_WaWU
Message-ID: <CAGWr4cTPTqYvfKg_e7kTgg_ioav+v2AWTre5aQqzkm7tvfS1sA@mail.gmail.com>
Subject: Re: [PATCH net 2/2] selftests: net: packetdrill: add test for
 negative sk_forward_alloc in tcp_wmem_schedule()
To: Eric Dumazet <edumazet@kernel.org>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, Neal Cardwell <ncardwell@google.com>, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, Wei Wang <weiwan@google.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 1:23=E2=80=AFAM Eric Dumazet <edumazet@kernel.org> =
wrote:
>
> Le ven. 16 oct. 2026 =C3=A0 10:22, Eric Dumazet <edumazet@kernel.org> a =
=C3=A9crit :
> >
> > Le ven. 16 oct. 2026 =C3=A0 09:54, Kuniyuki Iwashima <kuniyu@google.com=
> a =C3=A9crit :
> > >
> > > On Thu, Oct 15, 2026 at 12:37=E2=80=AFAM Octavian Purdila <tavip@goog=
le.com> wrote:
> > > >
> > > > Add a packetdrill test that drives sk->sk_forward_alloc negative vi=
a
> > > > tcp_collapse() on the receive queue while sk->sk_wmem_queued exceed=
s
> > > > sysctl_tcp_wmem[0], and verifies that a subsequent non-blocking wri=
te()
> > > > under TCP memory pressure fails with EAGAIN rather than returning a
> > > > negative copy length from tcp_wmem_schedule() and failing with EFAU=
LT.
> > > >
> > > > Assisted-by: LLM
> > > > Signed-off-by: Octavian Purdila <tavip@google.com>
> > >
> > > Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
> > >
> > > Thanks !
> >
> > Are you sure this test is passing on arches with 6K pages (as some
> > arm64 and ppc64 platforms) ?
>
> This was meant to read : 64K pages.
>
> > We might need to add a check to only run it on 4K platforms.

Ah, yes it would not pass. Thanks! I plan to add a check like the one
below in v2:

diff --git a/tools/testing/selftests/net/packetdrill/ksft_runner.sh
b/tools/testing/selftests/net/packetdrill/ksft_runner.sh
index 0a97d5ae34699..e2a418357bf1c 100755
--- a/tools/testing/selftests/net/packetdrill/ksft_runner.sh
+++ b/tools/testing/selftests/net/packetdrill/ksft_runner.sh
@@ -52,6 +52,12 @@ if [[ -n "${KSFT_MACHINE_SLOW}" ]]; then
  failfunc=3Dktap_test_xfail
 fi

+pagesize=3D$(grep -E '^--define=3DREQUIRES_PAGESIZE=3D' $script | cut -d
'=3D' -f 3 | tr -d '"')
+if [[ -n "$pagesize" && "$(getconf PAGESIZE)" !=3D "$pagesize" ]]; then
+ ktap_skip_all "requires ${pagesize}B PAGE_SIZE"
+ exit "$KSFT_SKIP"
+fi
+
 ip_versions=3D$(grep -E '^--ip_version=3D' $script | cut -d '=3D' -f 2)
 if [[ -z $ip_versions ]]; then
  ip_versions=3D"ipv4 ipv6 ipv4-mapped-ipv6"
diff --git a/tools/testing/selftests/net/packetdrill/tcp_wmem_schedule_nega=
tive_fwd_alloc.pkt
b/tools/testing/selftests/net/packetdrill/tcp_wmem_schedule_negative_fwd_al=
loc.pkt
index 8e31db546f432..5e6a40e740b42 100644
--- a/tools/testing/selftests/net/packetdrill/tcp_wmem_schedule_negative_fw=
d_alloc.pkt
+++ b/tools/testing/selftests/net/packetdrill/tcp_wmem_schedule_negative_fw=
d_alloc.pkt
@@ -3,6 +3,7 @@
 // when sk_wmem_schedule() fails under memory pressure and
 // sk->sk_wmem_queued >=3D sysctl_tcp_wmem[0], returning EAGAIN rather
than EFAULT.

+--define=3DREQUIRES_PAGESIZE=3D"4096"
 --mtu=3D65535
 --tolerance_usecs=3D100000
