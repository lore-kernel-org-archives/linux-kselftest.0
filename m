Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24E43ABD9F
	for <linux-kselftest@vger.kernel.org>; Fri, 28 Aug 2026 09:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787909601; cv=pass; b=tSrUUZamc8p/7ufjfE2f7EX3OcVc1z/jUjmHxsOLoBehNA6Yjs16VeO0zaA7rqhvU60uIDvllquc4aBidsskeRsVUZHZORRdAdnT/WT5oB9KMb0x0G4Zpp0ICXbsldmQX0oCKz0SOfsVLJfbElNoOgmBgTewjvjTDIgFkD5O+uA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787909601; c=relaxed/simple;
	bh=U80lg0O+GKLW7T+8XqZuXYkvnHWV1/kc8n8D7UOROWc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K0HUJKkVFneGX1AVtOJq1F1d6ok8sh+lauK2msFej0kXGmJp/NzEanusKolo9wbZlhMpDbfch2UsArDbr84KhQuf4A41xeCiDikjvUvH2Yf+dAp0e3lij9LsCDYUxm/0F1nQufU0lQkEYBsWKp6pYJ5I4yH6dr7w8fsFwRSKVok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QNe8JZl4; arc=pass smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QNe8JZl4"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-836c8bde2dcso8696577b3.0
        for <linux-kselftest@vger.kernel.org>; Fri, 28 Aug 2026 02:33:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787909596; cv=none;
        d=google.com; s=arc-20260327;
        b=stp0NZhkZkmsmHIh0wJPvZ4qDIkGq33VO7lcEIekPeZG0ieUrLN++XOPeFbD7+LsBi
         1DcXceC296/PyJYIaJqnvYsQ9yUabMr2bpkUyWXGVm8DYJKO6vR3fA4VonWLbwQ/MQ/n
         lULp9ZUlAJM5qxAEkVQHN+vCI51bJk4JZixavW3VbmbgHHlIEGUf6j9po5yGJdu//c7c
         /KtnCwX0pXEzwkv+2+phf94OVcskm8OTpi+VHHe1SmL0omUlKko+gme+lsrht+07o43h
         guksZINbLEJjVp4TvcpCvJJvZqFQ8MlNnyT+lI+mmiJI0sAs3AIfP/W/cf06BAkEr4zT
         247Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VyKgfgA2jHgvHBfi6CU+LzxVcYLnQWijvxyS1/jFemY=;
        fh=G5hwqPM/DwXCZtp87+RYRaoYgdCjrGz8sHWgs9KY2/A=;
        b=f/DHm7ZsmB1rVJzi/cEBFett8pSgDVbldSj9OEhJUB81hu4LHrbpAAilfiACQrnUVz
         088wSC28zX7MkZl3O5NVkqV0499Gkzak7Ig9Flkshe54JTLpsjUXdaTeJ812SM8QOjZW
         FxAWHjWSL0VlK8liy6VDZumFZNbG8RHbAlS0UrxM+0QLz1xZRqJAmVXJ4o4mOTT+U/Z+
         2RQwwVidQZorYhNzJatnVjbGlpVDaOoMr9/ZJgDGRV9rM4MMMG2wGN/hbV5RRDbOiOdC
         VoeSeANfS8LcpE1TgelFO3IpzN5isJllVOlp6ZCE2NaSTBcuLve/pD0j24USrDjU93IY
         Zc9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787909596; x=1788514396; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VyKgfgA2jHgvHBfi6CU+LzxVcYLnQWijvxyS1/jFemY=;
        b=QNe8JZl4vgKDTuJWNKn22/Hpirurd+JootYRCU+9j9DI5OC8qC/pYftEKbaluadheI
         V57PHkNO68QJbarV+vmeriaZfi5PZb2JJmbjcLQA557h7mcMvXVL1grWKSADSI9NTmnm
         jP+FvwKUfLXq/eHHXa818ot6yGxsjVfcvhlQGCshLZHBZxybmcIGA+3BPLwpcMUA1Rr1
         WiL6V9QZC0640kWXHbs8Iv/2luIAnZvAhy+vyPsn3dTtdVn7sc8+orEWWyHj88WiRWtk
         doazttorfMJ2v/fjNZrklOtdupzNd5E2CtUZPmtZ0hUg8A7aGanvzBBGsqur8RWfuWrV
         i+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787909596; x=1788514396;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VyKgfgA2jHgvHBfi6CU+LzxVcYLnQWijvxyS1/jFemY=;
        b=RfqMLVR/PKVOIXWboYMBPIAwxCXPUXicPpb1XEIaDh5kfttglozxfOPxx71soXzJAo
         v7GM0JyruvX0jk7j13Yz1+lxIkQi6uMsFOJVAoNVinhXaMErP0zzLrM8vmZS+A3a4gFK
         NaAsMYYRXsSvMYHMUUbjxGulBqQGzLUvpACeFwAvVvlLJDQFV4/L3IUJjkNsDBPEoU8l
         H/VQ2ko/QrduZeLPg8zlY3a26IBZso1/faSPMrVM2kzKL9L/Ox2ffBWlrOse0Q76kFJR
         STvMcl8Etusqdfz3nzQ9blSfnDsnofPwVxmdI81gN+NZ8U5tl1hkzHXCjV4ZTPlSDILe
         i8Iw==
X-Forwarded-Encrypted: i=1; AHgh+RoHPzALZagHbZqSBpdgaAmfyn/I3oDwByUPAempcyIcN9lQXKc9CeeZezj4bpmlBbpFrusJ/ySTifmbf5Ielrc=@vger.kernel.org
X-Gm-Message-State: AFuF++nuGzABxvOMc6WWD8nm78hwFs+YlSl5ULyW+UnGp3rZEMsv1wj/
	L/A9KGYeac0G2F0uMTr2TfLoriQanYPeCbvTmSDs1nlH2BwvJqQR4USYNNfSDu+RQ/HSpIfvW4/
	EDMJ9PrNgzx1MlJHMdjhS5OGGJYUsL10=
X-Gm-Gg: AR+sD10zuWFqk/C9ZLEiAUwS/KYNiBserKyKsNkTJjEbi975RHgTQKr+K386RUwkCMe
	kosNbGadCDTyr0SrxPsf0EWZD6f0UP+DbmI/8KVQ2KIUKAZSKHepUeOex2SllZl3s6JW20HFMn3
	iSVPxgUghPuXbK9s6PqBLXZHzaO8QeIkH345LBvfssRz8jEiq6MZyITfTe+tR8eVimVkJlSOO9t
	W3zTSP82A0OsKihFBW00D85HXRIenPIdbdiBgrImZzKMNtWNR+duNSXtf8lQdoX7D9XENZI+hLj
	AQLsH7XauVEHhMNf56RARuqMAX8FghNVvrvfY0D0zRyY
X-Received: by 2002:a05:690c:e3cd:b0:80b:9f4e:a73 with SMTP id
 00721157ae682-85d684bf30amr28089127b3.13.1787909595588; Fri, 28 Aug 2026
 02:33:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260812-xdp-dut-process-lifecycle-gmail-v2-1-b03ef2aa1b97@gmail.com>
 <d4be160e-703e-46bb-9509-d3d90f6bc34b@iogearbox.net> <DKX99ZAP7GZ8.23U5EOSFB4VPU@bootlin.com>
 <CAHKNYVXN0DAUzv2Lwm=oQ_K=zhi2iNyTO2e99s5F4M+Kr7u5tQ@mail.gmail.com> <CAHKNYVV8gn-L_unjsxUZV=E+Rx4ouDBJX613_n4hevXP1rivyg@mail.gmail.com>
In-Reply-To: <CAHKNYVV8gn-L_unjsxUZV=E+Rx4ouDBJX613_n4hevXP1rivyg@mail.gmail.com>
From: Bochao Cao <bochaolucky@gmail.com>
Date: Fri, 28 Aug 2026 17:32:38 +0800
X-Gm-Features: AcwNN1VW9XpqQ20Ki6rCBhf_uOiVcBbpYWAjy12V6TApwKjNoVUxIva86Xc9n18
Message-ID: <CAHKNYVX_r_yS+NjkTx=gn7zGfcHF11azQbFWHJ+naqXO3aTpJw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2] selftests/bpf: Track test_xdp_features DUT processes
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>, 
	Daniel Borkmann <daniel@iogearbox.net>, bpf@vger.kernel.org
Cc: Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Jiayuan Chen <jiayuan.chen@linux.dev>, 
	Alexei Starovoitov <ast@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

 Resending as plain text because my previous reply was rejected by the
vger mailing lists. Sorry for the duplicate.
 Thanks Daniel and Alexis.

  Dropping the procps dependency is not the primary motivation for
  this change. I agree that Debian can remove the dependency independently.
  The issue addressed by this patch is process isolation in the standalone
  test. The current readiness check may observe an unrelated
  concurrent xdp_features process, while cleanup may terminate every
xdp_features
  process on the host. In addition, a DUT which exits before listening
can leave the test waiting indefinitely.

  Although this script is not currently run by the BPF CI, it remains
useful  for testing real hardware,
  so these process lifecycle issues can still  affect users running
the test manually.

  Would it be acceptable to fix these issues in the script's current locati=
on?
  If the preferred direction is to move it under
tools/testing/selftests/drivers/net/hw/,
  should the move be submitted first, with this fix rebased on top?

  I can send a v3 that drops the Debian Closes tag and focuses
  the commit message solely on the process isolation, timeout,
  and cleanup fixes once the preferred location is clear.

  Thanks,
  Bochao


Bochao Cao <bochaolucky@gmail.com> =E4=BA=8E2026=E5=B9=B48=E6=9C=8828=E6=97=
=A5=E5=91=A8=E4=BA=94 14:10=E5=86=99=E9=81=93=EF=BC=9A
>
>  Thanks Daniel and Alexis.
>
>   Dropping the procps dependency is not the primary motivation for
>   this change. I agree that Debian can remove the dependency independentl=
y.
>   The issue addressed by this patch is process isolation in the standalon=
e
>   test. The current readiness check may observe an unrelated
>   concurrent xdp_features process, while cleanup may terminate every xdp_=
features
>   process on the host. In addition, a DUT which exits before listening ca=
n leave the test waiting indefinitely.
>
>   Although this script is not currently run by the BPF CI, it remains use=
ful  for testing real hardware,
>   so these process lifecycle issues can still  affect users running the t=
est manually.
>
>   Would it be acceptable to fix these issues in the script's current loca=
tion?
>   If the preferred direction is to move it under tools/testing/selftests/=
drivers/net/hw/,
>   should the move be submitted first, with this fix rebased on top?
>
>   I can send a v3 that drops the Debian Closes tag and focuses
>   the commit message solely on the process isolation, timeout,
>   and cleanup fixes once the preferred location is clear.
>
>   Thanks,
>   Bochao
>
> Bochao Cao <bochaolucky@gmail.com> =E4=BA=8E2026=E5=B9=B48=E6=9C=8825=E6=
=97=A5=E5=91=A8=E4=BA=8C 21:01=E5=86=99=E9=81=93=EF=BC=9A
> >
> >   Thanks Daniel and Alexis.
> >
> >   Dropping the procps dependency is not the primary motivation for
> >   this change. I agree that Debian can remove the dependency independen=
tly.
> >   The issue addressed by this patch is process isolation in the standal=
one
> >   test. The current readiness check may observe an unrelated
> >   concurrent xdp_features process, while cleanup may terminate every xd=
p_features
> >   process on the host. In addition, a DUT which exits before listening =
can leave the test waiting indefinitely.
> >
> >   Although this script is not currently run by the BPF CI, it remains u=
seful  for testing real hardware,
> >   so these process lifecycle issues can still  affect users running the=
 test manually.
> >
> >   Would it be acceptable to fix these issues in the script's current lo=
cation?
> >   If the preferred direction is to move it under tools/testing/selftest=
s/drivers/net/hw/,
> >   should the move be submitted first, with this fix rebased on top?
> >
> >   I can send a v3 that drops the Debian Closes tag and focuses
> >   the commit message solely on the process isolation, timeout,
> >   and cleanup fixes once the preferred location is clear.
> >
> >   Thanks,
> >   Bochao
> >
> > Alexis Lothor=C3=A9 <alexis.lothore@bootlin.com> =E4=BA=8E2026=E5=B9=B4=
8=E6=9C=8824=E6=97=A5=E5=91=A8=E4=B8=80 22:49=E5=86=99=E9=81=93=EF=BC=9A
> >>
> >> Hi Daniel, thanks for the notification
> >>
> >> On Mon Aug 24, 2026 at 1:31 PM CEST, Daniel Borkmann wrote:
> >> > [ Trimming the excessive Cc list, and adding Alexis ]
> >> >
> >> > On 8/12/26 10:28 AM, Bochao Cao via B4 Relay wrote:
> >> >> From: Bochao Cao <bochaolucky@gmail.com>
> >> >>
> >> >> test_xdp_features.sh waits for any xdp_features listener to appear =
and
> >> >> uses pidof during cleanup. A concurrent test can therefore make ano=
ther
> >> >> test proceed before its own DUT is ready, and cleanup kills every
> >> >> xdp_features process on the host. The readiness loop also has no ti=
meout,
> >> >> so a DUT that exits before listening leaves the test hung indefinit=
ely.
> >> >>
> >> >> Track one active DUT at a time, wait for ss to report that exact PI=
D with
> >> >> a bounded retry loop, and reap it after each test. Consult the shel=
l job
> >> >> table before signaling the DUT so a stale PID cannot target an unre=
lated
> >> >> process. On failure, terminate the shell job with SIGKILL and reap =
it so
> >> >> blocked I/O cannot hang cleanup. Install an EXIT trap and signal ha=
ndlers
> >> >> so failure paths also remove network setup.
> >> >>
> >> >> Fixes: 4dba3e7852b7 ("selftests/bpf: introduce XDP compliance test =
tool")
> >> >> Closes: https://bugs.debian.org/1136522
> >> >> Signed-off-by: Bochao Cao <bochaolucky@gmail.com>
> >> >> ---
> >> >> Tests:
> >> >> - bash -n tools/testing/selftests/bpf/test_xdp_features.sh
> >> >> - make -C tools/testing/selftests/bpf xdp_features
> >> >> - sudo tools/testing/selftests/bpf/test_xdp_features.sh
> >> >> - verified cleanup terminates a blocked DUT without affecting an un=
related process
> >> >> ---
> >> >> Changes in v2:
> >> >> - Clarify that avoiding name-wide process matching, rather than dro=
pping a dependency, is the motivation.
> >> >> - Track and reap one active DUT at a time instead of retaining hist=
orical PIDs.
> >> >> - Address PID reuse by signaling only the current Bash job during c=
leanup.
> >> >> - Use SIGKILL on failure cleanup so blocked DUT I/O cannot hang wai=
t indefinitely.
> >> >> - Link to v1: https://patch.msgid.link/20260805-xdp-dut-process-lif=
ecycle-gmail-v1-1-45984df8d295@gmail.com
> >> >> ---
> >> >>   tools/testing/selftests/bpf/test_xdp_features.sh | 82 +++++++++++=
+++++++------
> >> >>   1 file changed, 62 insertions(+), 20 deletions(-)
> >> >
> >> > Sorry for the late reply. With regards to https://bugs.debian.org/11=
36522, src:linux deb
> >> > does not have to depend on this at all, so the src:linux can just ge=
t rid of procps in
> >> > any case if this is indeed the last dependency. I'm not seeing the t=
est being run in our
> >> > BPF CI. I've Cc'ed Alexis as he's in the process of migrating and/or=
 removing tests from
> >> > tools/testing/selftests/bpf/ depending on how they fit into test_pro=
gs framework. I'll
> >> > let him comment if there is already work in progress. It feels like =
this script could be
> >> > reworked into tools/testing/selftests/drivers/net/hw/ tests and remo=
ved altogether from
> >> > the tools/testing/selftests/bpf/ dir.
> >>
> >> There has been an attempt to fully convert and get rid of
> >> test_xdp_features.sh, but discussions around the corresponding series
> >> highlighted the need for the script to remain available for testing on
> >> real hardware.  Features covered by the test_xdp_features.sh that were
> >> not covered yet by test_progs have been added to test_progs (in
> >> xdp_cpumap_attach), see [1]. So there's currently no active effort on
> >> this one on my side.
> >>
> >> Alexis
> >>
> >> [1] https://lore.kernel.org/bpf/20241009-convert_xdp_tests-v3-0-51cea9=
13710c@bootlin.com/
> >>
> >> --
> >> Alexis Lothor=C3=A9, Bootlin
> >> Embedded Linux and Kernel engineering
> >> https://bootlin.com
> >>
