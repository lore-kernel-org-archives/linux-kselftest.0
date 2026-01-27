Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFFA126C02
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Jan 2026 21:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769548722; cv=pass; b=CtiHESBGj5Z35dBE+25E5AaztLxTs55LrdLO7NDLgC1k3nn3QEc2v/5DdIwlhQfvIbMyCXmowrqrCkdzB26TD2Ibs9NJpKCP0uZA1r0qypzRcM3Xa3a0uh56uiih7kz2GCh61uSqn0oplM2jbYEXPucGvMb+igjiUYaGOWRvDWI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769548722; c=relaxed/simple;
	bh=X6XOwrub9nUu0HRNFFH0qG8lyMXXb4+SdCKDFq9wevo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ceScFn2OhOwtNrPzDo3x5d8Htd0JUpxkxRMux3HOaqWjGA0JlEL2+tkzR0ld4vD2NGrZxJSl797zwZIo9yYEyWouIMNVzmSBiOWPqez7jBGI/ASR1c0REsnYWpaUHR400/nbWBjuuw9GdDSjHnYut4Z50/5IpKnG5XW+X4WMnEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j9WLKFWv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mfp1T3Yz; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j9WLKFWv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mfp1T3Yz"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RHhgsK1953284
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Jan 2026 21:18:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X6XOwrub9nUu0HRNFFH0qG8lyMXXb4+SdCKDFq9wevo=; b=j9WLKFWvozf+8CGo
	9+U20akPC6tPn2FKyBB4pUXi8XGRGIfXA0xT1tdVbbHFxhi9SQeAimmrngPl0W9K
	cMs17T8IrYMsJ8Op+E8KSPEJ09PpL+NViYNVOxEPrwoX4JIx9kHIeBv0VctFTLNF
	ws9pggWNOB7xPAeF800NQWlIRbHAvHsU3SsBHFkln1zb/LqUJNEiymqCeTn+Xnm/
	0TGd2sk5IysmfT+HHecAOFPLkzY6k5aU01c/UN+vniidd52wq1iMq90hirCR7MXS
	fFAkodhOIrCDFqO+keMW3JJzAbbV6EoZ7nov62h7STehPPkuVXij5gt+hOAeW/yY
	cIBH2Q==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by2118nvv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Jan 2026 21:18:40 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-6455532d07bso8484362d50.3
        for <linux-kselftest@vger.kernel.org>; Tue, 27 Jan 2026 13:18:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769548719; cv=none;
        d=google.com; s=arc-20240605;
        b=V/Hu+7TBQC1wPQlFWoW8ipESSQHBfZKwIUOHdKaATnCht/WcRG/wr3coZfpZfg+5m1
         dpyc9wlZ5Rkr3llR2XDAsJLObtvQVHQBVkaSO/UP2sgQMAPSrtAvU8vZC/gxIy452FnS
         BpO54roGu7Puilwcz1/0eHH22HmgJFC9F9sipPyugHzcxxyl2Js3uBIrzWBI00qPNVvp
         9Tl+cDdhi6oFoB3pxx1u81JllsLk1IwMyHosUALIzjcC76t6DTj4m0j1dBFhFVmkCcWS
         beEB7D6WDwoFOjcg+Z/Bn0uMIVO4Znhd9jghKIFOp16Et6Ury+e21lscYWw0Kf/8EyiD
         eykA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X6XOwrub9nUu0HRNFFH0qG8lyMXXb4+SdCKDFq9wevo=;
        fh=+nmBoihVFGidLef59CFBk3IxP30bzf/KYlZlsNUrc5M=;
        b=jOBNZ2BC+fkZMIx/6Us8DlPbRJ7kMmObXrFxI9GRNjHK3K7UYvIGcLTOUxGLHGIlAZ
         M4H5E04kj6U/EicSmELFc7MSPPKBYbXPdgnn55l3he9JjfIEubyihpte/z/gPTeHxGr6
         XEbCVV8S63CVEJ6CpC5eGpoLvNq7GvDpVbg37fZi88otJt2nBqTruwg0allwdvFcZYp0
         PbOj32UrYMrG87ZlnBDfJU5uPw3r1oBN+eLJgAJ9r1Pm2NiS53OJQ9bhAHoQ7tesLRYO
         j1CHC5PyzeZu3dH4n78ozICP7Y6pW/ozBqN9TsKJC39ilTuOKaX1aRhC7D0YAdbbwLAT
         G9lg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769548719; x=1770153519; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X6XOwrub9nUu0HRNFFH0qG8lyMXXb4+SdCKDFq9wevo=;
        b=Mfp1T3YzTOQJogvremUaBNPzl15fAFxjeMRjEkYD7euB9hKPDcBBShFgw7S/EYqzyY
         Vey/shT9BitUTW1ntYUcPBaieNnTifeBbeoh4c5jHEoNkD8OlBwqfJdKOPSLo/zgBfaI
         d7G5Dml273u45klOvl8KbH68IwvM653U3innINCdTCARWC6HUCotAD3DyLlV9O4zEfd9
         jT5bSlitSQYkH8czPzVO2V2j6juOXwoCwQdnK981wzT5dA3Y9Y6+5Kz+TC8ed1mF7wFw
         /+34fzVODyV/AW142P2jMVNSl5bkdN8JZS7lrDEt/AqMJTni+1C1h8ACh+iGQa/japsN
         zI3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769548719; x=1770153519;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X6XOwrub9nUu0HRNFFH0qG8lyMXXb4+SdCKDFq9wevo=;
        b=o5UdyajYPHnIwbCmM1BVOTS2FDWfem2bO8JQ8dPJmPrJbWdoJAKHaA/e0wSoOnRI0o
         TfG09hA+N1kTq2z5gV4fRUnCWaTJJDj4nZHCCyJdE5wJqWQr2RYHJL/dAhjqNPaat5ed
         3zts59yvZFIwrtX8jrB8SVAXPsH7zPwJ8CAUjVvmcBdSVI8TOOUFg/LT505UgryyoQJj
         mHEpNAy1M8CnnKLUmnboK5NkrCPwip4JnEIAl9jEgKzwrWST0ugqcgXWLrKq4ZQWmi6g
         HkhH1pVHNVRWXNfLOkoTbgIWaq6X+LN1JV/s64bN7Dyt5LFJJlELogPOY1XBdH33/yg/
         7dSw==
X-Forwarded-Encrypted: i=1; AJvYcCW9fnWCkfRU2yZbf3ElVNOngsrSs85G2WTx3D9YXKs+FutvVX/krF0jYKpBqwQRl80tIE0f5SftQkj1N0LoEaE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwR2OU1S1x8QcBh5MlwjiurOQwVfcqLzcWmpsjjczLm9uU3eBmD
	wSw8D9vNvKDa0su8+JBsLTO5xU/gBxRxbTmYAYFFHYn8VKf/bwLIkPpJYhocij3QAGe8RATJvAI
	719lR/Q8JXiZv5fTr0tqAYkBYPSz0GdffQs//humOqyTZ8urj9noRPknsyhBP95TSmCJDkrQiS5
	+lTj6O5VnrO6H7gUSdgTlFFheENwHETJ6p//SJsNrBWUfX+Q==
X-Gm-Gg: AZuq6aJsX+qV4TaJaZpJM46OpuMRoxY2p6noiOK1QZG5AtsmK4dLsC7RykDmd5MoYK7
	nusZ0tSkYpvZN01k2LRw+QstnufsQ7gUIyR1wfz0Zl7+qAJJqaTIeH9svQPAu90pXsiSusnLOIc
	aTazrCTy1K78DSQxc8vD1xNNx6oeuFPLQXICchXfZ/47nkaQKgUq89Z84LPfL32Vr42TqRaCgch
	3+6tlZALwimYcRFhVQ+CVVbtQ==
X-Received: by 2002:a05:690e:d07:b0:649:3d9:d0f5 with SMTP id 956f58d0204a3-6498fc79d90mr2026153d50.92.1769548719545;
        Tue, 27 Jan 2026 13:18:39 -0800 (PST)
X-Received: by 2002:a05:690e:d07:b0:649:3d9:d0f5 with SMTP id
 956f58d0204a3-6498fc79d90mr2026125d50.92.1769548719060; Tue, 27 Jan 2026
 13:18:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260124170535.11756-1-johan@kernel.org> <DFX20SA67PF2.VONCFNDOZOZT@kernel.org>
 <2026012554-chatty-policy-42a1@gregkh> <aXdxDBXdyqLFfKKI@hovoldconsulting.com>
In-Reply-To: <aXdxDBXdyqLFfKKI@hovoldconsulting.com>
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 22:18:27 +0100
X-Gm-Features: AZwV_QgipHYTXMdZDzf8zcCrM_91sUwMX26tgMa5qYmuNwifu3ZD2q-T70g1AeE
Message-ID: <CAESzEGiA2DSp79pkjxBA5X-DWmSAAgyAF7usKn253jkGpYJMew@mail.gmail.com>
Subject: Re: [PATCH 0/3] Revert "revocable: Revocable resource management"
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Tzung-Bi Shih <tzungbi@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simona Vetter <simona.vetter@ffwll.ch>,
        Dan Williams <dan.j.williams@intel.com>,
        Jason Gunthorpe <jgg@nvidia.com>, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDE3NCBTYWx0ZWRfXzEetdIBJ26V/
 XnOxPf5NX/T2IYS5tOgnN91xJ6sFtuxr56LzW6Cdhtpsxh32a7edBD+IQtJhnHSJUTAZCzxT0jX
 Luq+Uw0eUQHtc1KZv0IgTT8+893LSRYkwLQbS7b7sWUKSHa3ASlZBCPe4Gu7e//3jAMlZM9Xvx3
 TyD/4cScBMx+c1WtOydV3nsSZjoLy5KE/7kdC06j5hQU2NCe+607f3kyuVEYKNecK2W7SdptL7n
 d5C4yHnLziAzByiEIiCQkJ0cFoVzMRVSV7/KWX/0Jv3jannJt2eFiYYCC66p363WbTEu5eHn/8C
 ENVKO8YHirUNM07me8MiNqTviSioK8GBZMolaskJSqMAqv4irusCHNoTSU0d81/52WW40N6Zz6H
 WtB2iK06ZNu5NyYvlUKFovJO6tHekPjozQbIsAblhk4eGD2ne+uZxedtN/VBSLKQVH5kU9ZOp1I
 VfI3/iJBFgvD/LJyInw==
X-Authority-Analysis: v=2.4 cv=GuxPO01C c=1 sm=1 tr=0 ts=69792bb0 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8
 a=SbBu0mo9G-6qvOvpHooA:9 a=QEXdDO2ut3YA:10 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-GUID: hIaDJhKTMXIGnODSCtnTCFpgwRJVLu5P
X-Proofpoint-ORIG-GUID: hIaDJhKTMXIGnODSCtnTCFpgwRJVLu5P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_04,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270174

On Mon, Jan 26, 2026 at 2:50=E2=80=AFPM Johan Hovold <johan@kernel.org> wro=
te:
>
> On Sun, Jan 25, 2026 at 01:47:14PM +0100, Greg Kroah-Hartman wrote:
> > On Sat, Jan 24, 2026 at 08:08:28PM +0100, Danilo Krummrich wrote:
> > > On Sat Jan 24, 2026 at 6:05 PM CET, Johan Hovold wrote:
> > > > this does not look like the right interface for the chardev unplug =
issue.
> > >
> > > I think it depends, we should do everything to prevent having the iss=
ue in the
> > > first place, e.g. ensure that we synchronize the unplug properly on d=
evice
> > > driver unbind.
> > >
> > > Sometimes, however, this isn't possible; this is where a revocable me=
chanism can
> > > come in handy to prevent UAF of device resources -- DRM is a good exa=
mple for
> > > this.
> >
> > This is not "possible" for almost all real devices so we need something
> > like this for almost all classes of devices, DRM just shows the extreme=
s
> > involved, v4l2 is also another good example.
>
> It's certainly possible to handle the chardev unplug issue without
> revocable as several subsystems already do. All you need is a refcount,
> a lock and a flag.
>
> It may be possible to provide a generic solutions at the chardev level
> or some kind of helper implementation (similar to revocable) for
> subsystems to use directly.
>

This echoes the heated exchange I recently had with Johan elsewhere so
I would like to chime in and use the wider forum of driver core
maintainers to settle an important question. It seems there are two
camps in this discussion: one whose perception of the problem is
limited to character devices being referenced from user-space at the
time of the driver unbind (favoring fixing the issues at the vfs
level) and another extending the problem to any driver unbinding where
we cannot ensure a proper ordering of the teardown (for whatever
reason: fw_devlink=3Doff, helper auxiliary devices acting as
intermediates, or even user-space unbinding a driver manually with
bus-level sysfs attributes) leaving consumers of resources exposed by
providers that are gone with dangling references (focusing the
solutions on the subsystem level).

The question is: should we work towards making the kernel gracefully
handle any such situation or is it acceptable that if we do
"non-standard" things, we can trigger invalid memory accesses from
user-space. I'm asking this because I've been sending patches to
several subsystems addressing life-time issues at the subsystem level
with SRCU and I've faced resistance from Johan at least twice - not
based on the implementation details but on the philosophy itself of
synchronizing all accesses from consumers to providers (SRCU,
revocable or otherwise).

I myself am in the latter camp. My thinking is: if we expose an
interface, it should work correctly. In particular: it should not
allow the user (even root!) to crash the kernel. In addition: there
seems to be an agreement that rust in linux is good because of its
memory safety features. The issues we're discussing would have never
happened, had the code been written in rust so we should not just
accept them as normal in C or tell the user to "just not do it".

Bartosz
